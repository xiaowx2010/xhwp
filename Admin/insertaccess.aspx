<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>

<script runat="server" language="C#">
        private SqlDB db = new SqlDB();
        private SqlDB db_old = new SqlDB();
        private DataTable dt_old = new DataTable();
        private DataTable dt_new = new DataTable();
        private string connstring="";
		private void Page_Load(object sender, System.EventArgs e)
		{
            connstring = Server.MapPath("环境统计代码表模版.mdb");
            if (!IsPostBack)
            {
                //清空下拉菜单
                select_table.Items.Clear();
                //填充下拉菜单
                db.SqlString = "select moduleurl,modulename from gmis_module where  moduleuppercode=1124  and modulename<>'' and moduleurl<>''";
                DataTable dt_module = db.GetDataTable();
                if (dt_module != null && dt_module.Rows.Count > 0)
                {
                    foreach (DataRow row in dt_module.Rows)
                    {
                        select_table.Items.Add(new ListItem(row["modulename"].ToString(), row["moduleurl"].ToString()));
                    }
                }
            }
		}
        //数据导入
        private void insert_Click(object sender, EventArgs e)
        {
            getOld();//获取源数据
            if (dt_old != null && dt_old.Rows.Count > 0)
            {
                //需要导入数据的表名
                string h_tablename = "";
                //需要导入数据的字段名
                string h_fieldname = "";
                if (select_table.SelectedItem != null && select_table.SelectedItem.Value != "")
                {
                    h_tablename = select_table.SelectedItem.Value;
                }
                //获取目标表数据
                db.SqlString = "select modulecode from gmis_module where moduleuppercode=1124 and modulename<>'' and moduleurl='" + h_tablename + "'";
                DataTable dt = db.GetDataTable();
                if (dt != null && dt.Rows.Count > 0)
                {
                    //获取需要导入数据的字段
                    db.SqlString = "select fieldname from gmis_field where onedit=1 and modulecode=" + dt.Rows[0][0].ToString();
                    dt_new = db.GetDataTable();
                    if (dt_new != null && dt_new.Rows.Count > 0)
                    {
                        foreach (DataRow row in dt_new.Rows)
                        {
                            h_fieldname += row["fieldname"].ToString() + ",";
                        }
                    }
                    //开始导入
                    if (h_fieldname.Trim(',') != "")
                    {
                        string strsql = "";

                        foreach (DataRow dr in dt_old.Rows)
                        {
                            string str_temp = "";
                            for (int i = 0; i < dt_old.Columns.Count; i++)
                            {
                                str_temp += "'" + dr[i].ToString() + "',";
                            }
                            if (str_temp.Trim(',') != "")
                                strsql += "insert into gmis_mo_" + dt.Rows[0][0].ToString() + " (" + h_fieldname.Trim(',') + ") values (" + str_temp.Trim(',') + ");";
                        }
                        //Response.Write(strsql);
                        db.SqlString = "begin " + strsql + " end";
                        alert.InnerHtml = select_table.SelectedItem.Text + " 数据导入 " + db.TransUpdate();
                    }
                }
            }
            else
                alert.InnerHtml = "没有可导入的数据！";
        }

        //获取源数据
        private void getOld()
        {
            alert.InnerHtml = "";
            //需要导入数据的表名
            string h_tablename = "";
            
            if (select_table.SelectedItem != null && select_table.SelectedItem.Value != "")
            {
                h_tablename = select_table.SelectedItem.Value;
                //连接源数据库，并按选择的表名查询
                //判断文件是否存在
                if (File.Exists(connstring))
                {
                    db_old.ConnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + connstring + ";User Id=admin;Password=;";
                    db_old.SqlString = "select * from " + h_tablename;
                    dt_old = db_old.GetDataTable();
                    
                }
                else
                {
                    alert.InnerHtml = "文件不存在！";//输出提示信息
                }
            }
        }
    
        //生成模块数据表
        private void module_Click(object sender, EventArgs e)
        {
            getOld();
            
            //确认源数据库有数据
            if (dt_old != null && dt_old.Rows.Count > 0)
            {
                //Response.Write(dt_old.Rows.Count);
                //需要导入数据的表名
                string h_tablename = "";
                //需要导入数据的字段名
                string h_fieldname = "";
                if (select_table.SelectedItem != null && select_table.SelectedItem.Value != "")
                {
                    h_tablename = select_table.SelectedItem.Value;
                }
                //获取目标表数据
                db.SqlString = "select modulecode from gmis_module where moduleuppercode=1124 and moduleurl='" + h_tablename + "' and modulename<>''";
                DataTable dt = db.GetDataTable();
                string h_mtable = "";
                string id = "0";
                if (dt != null && dt.Rows.Count > 0)
                {
                    h_mtable = "gmis_mo_" + dt.Rows[0][0].ToString();
                    id = dt.Rows[0][0].ToString();
                }
                
                string exeinfo = "";
              
                
                DataRow[] fdr = GetFields(id).Select("fieldname<>'mocode'");
                StringBuilder createtablesb = new StringBuilder();
                if (fdr.Length > 0)
                {
                    createtablesb.Append("Begin if not exists (select id from sysobjects where id = object_id('" + h_mtable + "')) create table [dbo].[" + h_mtable + "] (MoCode int IDENTITY(1,1) PRIMARY KEY CLUSTERED");
                    foreach (DataRow dr in fdr)
                    {
                        string h_datalength = "";
                        if (dr["sqlname"].ToString().ToLower() == "varchar")
                        {
                            h_datalength = "(" + dr["datalength"].ToString() + ")";
                        }
                        string h_defaultvalue = dr["defaultvalue"].ToString();
                        if (h_defaultvalue == "")
                        {
                            h_defaultvalue = "''";
                        }
                        createtablesb.Append("," + dr["fieldname"].ToString() + " " + dr["sqlname"].ToString() + h_datalength + " not null Default(" + h_defaultvalue + ")");

                    }
                    createtablesb.Append("); End");
                }

                //Response.Write(createtablesb.ToString());
                
                if (createtablesb.Length > 0)
                {
                    db.SqlString = createtablesb.ToString();
                    exeinfo = db.UpdateTable();
                }
                alert.InnerHtml = select_table.SelectedItem.Text + " 生成模块数据表 " + exeinfo + ";当前需导入的数据共 " + dt_old.Rows.Count+" 条！";
                  
            }
            else
                alert.InnerHtml = "没有可导入的数据！";
        }
        //获取字段
        private DataTable GetFields(string mid)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select gmis_field.fieldname,gmis_field.caption,gmis_field.fieldtypecode,gmis_field.fieldcode,gmis_field.datalength,gmis_field.fieldindex,");
            sb.Append("gmis_field.isprimarykey,gmis_field.isvital,gmis_field.oneditlist,gmis_field.editlistcolumnwidth,gmis_field.onedit,gmis_field.fullline,gmis_field.oneditmust,");
            sb.Append("gmis_field.fielddatasrc,gmis_field.defaultvalue,gmis_fieldtype.fieldtypename,gmis_fieldtype.sqlname,case when (isvital=0 and fieldname like '%fld_%')  then Cast(Replace(fieldname,'fld_'+cast(gmis_field.modulecode as varchar(50))+'_','') as int) else 0 end as fldindex from gmis_field ");
            sb.Append("left outer join gmis_fieldtype on gmis_field.fieldtypecode=gmis_fieldtype.fieldtypecode ");
            sb.Append(" where gmis_field.modulecode=" + mid + " order by fieldindex asc");
            db.SqlString = sb.ToString();
            return db.GetDataTable();
        }
    
       
</script>
<body>
    <form runat="server">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" style="border-right: #8c9dbe 1px solid;border-top: #8c9dbe 1px solid;border-left: #8c9dbe 1px solid;border-bottom: #8c9dbe 1px solid;"> 
            <tr align="center">
                <td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:DropDownList ID="select_table" runat="server" ></asp:DropDownList>
                </td>
                <td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:LinkButton ID="btn_module" runat="server" style="width:100px;" OnClick="module_Click" Text="生成模块数据表"></asp:LinkButton>
                </td>
                <td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:LinkButton ID="btn_insert" runat="server" style="width:100px;" OnClick="insert_Click" Text="导入数据"></asp:LinkButton>
                </td>
                
            </tr>
        </table>
        <div id="alert" runat="server"></div>
    </form>
</body>
</html>