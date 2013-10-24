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
		private void Page_Load(object sender, System.EventArgs e)
		{
            if (!IsPostBack)
            {
                //清空下拉菜单
                select_table.Items.Clear();
                //填充下拉菜单
               // db.SqlString = "select moduleurl,modulename,modulecode from gmis_module where modulestate=0 and moduleurl<>''";
                db.SqlString = "select moduleurl,modulename,modulecode from gmis_module where modulecode in(734) and moduleurl<>''";

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

			//DataTable h_mdt = db.GetDataTable(db.ConnStr,"select modulecode,moduleurl from gmis_module where moduleurl<>'' and modulestate=0 and modulecode in (select distinct modulecode from gmis_field where caption in ('名称'))");
            DataTable h_mdt = db.GetDataTable(db.ConnStr, "select modulecode,moduleurl from gmis_module where moduleurl<>'' and modulecode in(1024)");
            bool flag = true;
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
                db.SqlString = "select modulecode from gmis_module where moduleurl='" + h_tablename + "'";
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
					string strsql = "truncate table gmis_mo_"+ dt.Rows[0][0].ToString() +";delete gmis_mo_1197 where modulecode="+dt.Rows[0][0].ToString()+";";
                    //开始导入
                    DataRow[] h_mdr = h_mdt.Select("modulecode="+dt.Rows[0][0].ToString());
					if (h_mdr.Length>0)
					{
						flag = false;
					}
					if (h_fieldname.Trim(',') != "")
                    {                  
						foreach (DataRow dr in dt_old.Rows)
                        {
                            string str_temp = "";
                            for (int i = 0; i < dt_old.Columns.Count; i++)
                            {
                                str_temp += "'" + dr[i].ToString() + "',";
                            }
                            if (str_temp.Trim(',') != "")
							{
                                strsql += "insert into gmis_mo_" + dt.Rows[0][0].ToString() + " (" + h_fieldname.Trim(',') + ") values (" + str_temp.Trim(',') + ");";
								
							}
                        } 
						                       
                    }
					
					//Response.Write(strsql);
                    db.SqlString = "begin " + strsql + " end";
					string exeinfo = db.TransUpdate();
					if (!flag && exeinfo == "操作成功！")
					{
						db.SqlString = "select fld_"+dt.Rows[0][0].ToString()+"_1,fld_"+dt.Rows[0][0].ToString()+"_2,mocode from gmis_mo_"+dt.Rows[0][0].ToString()+"";
						DataTable idt = db.GetDataTable();
						strsql = "";
						foreach (DataRow idr in idt.Rows)
						{
							strsql += "insert into gmis_mo_1197 (datamocode,modulecode,orgcode,orgname) values ("+idr["mocode"].ToString()+","+dt.Rows[0][0].ToString()+",'"+idr[0].ToString()+"','"+idr[1].ToString()+"');";
						}
						
						//DataTable ddt =  db.GetDataTable
						//DataRow[] h_dr = h_dt.Select("fld_1202_2 = '"+dr[0].ToString()+"'");
					}
					db.SqlString = "begin " + strsql + " end";
					//Response.Write(db.SqlString);
					exeinfo = db.TransUpdate();
                    alert.InnerHtml = select_table.SelectedItem.Text + " 数据导入 " + exeinfo;
                }
            }
            else
			{
				//需要导入数据的表名
                string h_tablename = "";
                if (select_table.SelectedItem != null && select_table.SelectedItem.Value != "")
                {
                    h_tablename = select_table.SelectedItem.Value;
                }
				//获取目标表数据
                db.SqlString = "select modulecode from gmis_module where moduleuppercode not in (40) and convert(int,modulecode)>128 and moduleurl='" + h_tablename + "'";
                DataTable dt = db.GetDataTable();
                if (dt != null && dt.Rows.Count > 0)
                {
					db.SqlString = "truncate table gmis_mo_"+dt.Rows[0][0].ToString()+";delete gmis_mo_1197 where modulecode="+dt.Rows[0][0].ToString()+";";
					db.TransUpdate();
					alert.InnerHtml = "没有可导入的数据！";
				}
			}
                

        }

        //获取源数据
        private void getOld()
        {
            //需要导入数据的表名
            string h_tablename = "";
            if (select_table.SelectedItem != null && select_table.SelectedItem.Value != "")
            {
                h_tablename = select_table.SelectedItem.Value;
                //连接源数据库，并按选择的表名查询
                db_old.ConnStr = "User ID=guangye;Password=guangye;Initial Catalog=xuhuihuanbao;Data Source=dv;";

                db_old.SqlString = "select * from " + h_tablename;
                dt_old = db_old.GetDataTable();
            }
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
                    <asp:LinkButton ID="btn_insert" runat="server" style="width:100px;" OnClick="insert_Click" Text="导入数据"></asp:LinkButton>
                </td>
                
            </tr>
        </table>
        <div id="alert" runat="server"></div>
    </form>
</body>
</html>