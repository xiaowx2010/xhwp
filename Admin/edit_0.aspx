<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string sortid,sortdir;
string dtable_1197, filter_1197, types_1197;
    string[] flds_1197;
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();//设置工具条,同时获取固定URL参数
    btn_clear.Click+= new EventHandler(ClearData);;
    tb_2.Visible=false;
    sortid = GetQueryString("sortid", "0");  //排序字段
    sortdir = GetQueryString("sortdir", "1");  //1降序，0升序
	CreateField(GetContent());
	
	dtable_1197 = "gmis_mo_1197";
    flds_1197 = new string[] { "modulecode", "datamocode", "orgcode", "orgname", "featurecode", "typecode", "areacode", "rivercode" };
    types_1197 = "11001111";
    filter_1197 = "modulecode=" + mid + " and datamocode=" + id;
    
    if (!IsPostBack) {//先绑定列表
		if(id != "0"){//绑定所有值
            guangye.BindData(dtable_1197, filter_1197, flds_1197);
		}
        
	}  
}
//保存之前的数据处理
public override void BeforeSave()
{
	string exeinfo="";
	if(CheckMustAndFieldType(mid))
	{
		if(id!="0")
		{
			exeinfo=GetUpdateArticle(mid,id);
		}else
		{
			exeinfo=GetInsertArticle(mid);
		}   
		if(exeinfo.Trim().Length>0)
		{
			SetSESSION("alert",exeinfo);
		}
	}
	 Response.Redirect("execommand.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&tid="+tid+"&id="+id+"&pid="+pid);
}
//获取该条数据
    private DataTable GetContent()
    {
        return db.GetDataTable(db.ConnStr, "select * from " + GetModuleTableName(mid) + " where mocode=" + id);
    }

//获取编辑字段
    private DataTable GetEditFields(string mid)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("select f.fieldname,f.caption,f.fieldtypecode,f.fieldcode,f.datalength,f.fieldindex,0 as sortable,f.isprimarykey,f.isvital,f.oneditlist, editlistcolumnwidth as oneditlistcolumnwidth,f.onedit,fullline as oneditfullline,f.oneditmust,0 as OnView,0 as OnViewFullLine,0 as sortmode,f.fielddatasrc,f.defaultvalue,fy.fieldtypename,fy.sqlname,case when (isvital=0) then Cast(Replace(fieldname,'fld_'+cast(Modulecode as varchar(50))+'_','') as int) else 0 end as fldindex from gmis_field f left outer join gmis_fieldtype fy on f.fieldtypecode=fy.fieldtypecode ");
        sb.Append(" where onedit=1 and Modulecode=" + mid);
        sb.Append(" order by fieldindex asc");
        db.SqlString = sb.ToString();
        //Response.Write(sb.ToString());
        return db.GetDataTable();
    }
    //动态生成字段
    private void CreateField(DataTable cdt)
    {
              
        Literal lt_0 = new Literal();
        lt_0.Text = "<table width=\"100%\"  border=\"0\" cellpadding=\"3\" cellspacing=\"1\" class=\"table_graybgcolor\" >";
        fold.Controls.Add(lt_0);
        DataTable fdt = GetEditFields(mid);
        bool isfullline = true, newline = true;
        string h_editmust = "", h_vfield = "";
        foreach (DataRow dr in fdt.Rows)
        {
            isfullline = Convert.ToBoolean(dr["oneditFullline"]);
            
            Literal lh = new Literal();
            h_editmust = "";
            if (Convert.ToBoolean(dr["OneditMust"])) h_editmust = "<font color=red>*</font>";
            if (newline)
            {
                if (isfullline)
                {
                    lh.Text = "<tr><td align=\"right\" nowrap class=\"td_viewcontent_title\">" + h_editmust + dr["Caption"].ToString() + ":</td><td colspan=\"3\" class=\"td_viewcontent_content\">";
                }
                else
                {
                    lh.Text = "<tr><td align=\"right\" nowrap class=\"td_viewcontent_title\">" + h_editmust + dr["Caption"].ToString() + ":</td><td  style=\"width:35%\" class=\"td_viewcontent_content\">";
                }
            }
            else
            {
                if (isfullline)
                {
                    lh.Text = "<td align=\"right\" nowrap class=\"td_viewcontent_title\">&nbsp;</td><td class=\"td_viewcontent_content\" style=\"width:35%\">&nbsp;</td></tr><tr>" +
                                "<td align=\"right\" nowrap class=\"td_viewcontent_title\">" + h_editmust + dr["Caption"].ToString() + ":</td><td colspan=\"3\" class=\"td_viewcontent_content\" >";
                }
                else
                {
                    lh.Text = "<td align=\"right\" nowrap class=\"td_viewcontent_title\">" + h_editmust + dr["Caption"].ToString() + ":</td><td class=\"td_viewcontent_content\" style=\"width:35%\">";
                }
            }
            fold.Controls.Add(lh);      
            fold.Controls.Add(GetFieldControls(dr, isfullline, cdt)); 
        
            Literal lf = new Literal();
            if (newline && !isfullline)
            {
                newline = false;
                lf.Text = "</td>";
            }
            else
            {
                newline = true;
                lf.Text = "</td></tr>";
            }
            fold.Controls.Add(lf);
        }
        Literal lt_1 = new Literal();
        if (!newline)
        {
            lt_1.Text = "<td align=\"right\"  class=\"td_viewcontent_title\">&nbsp;</td><td class=\"td_viewcontent_content\" style=\"width:35%\">&nbsp;</td></tr></table>";
        }
        else
        {
            lt_1.Text = "</table>";
        }
        fold.Controls.Add(lt_1);
    }
 //根据字段生成控件并绑定数据
    public Control GetFieldControls(DataRow dr, bool isfullline, DataTable cdt)
    {

        string ftype = dr["fieldtypecode"].ToString();
        if (ftype == "3")
        {//格式文本
            Editor c = new Guangye.WebApplication.Controls.Editor();
            c.ID = "fld_" + dr["fieldcode"].ToString();
            c.Value = (cdt.Rows.Count > 0) ? cdt.Rows[0][dr["fieldname"].ToString()].ToString() : dr["defaultvalue"].ToString();
            c.Height = new Unit(240);
            c.ToolbarSet = "Default";
            c.BasePath = "Common/Editor/";
            return c;
        }
        else if (ftype == "4")
        {//附件
            Editor c = new Guangye.WebApplication.Controls.Editor();
            c.ID = "fld_" + dr["fieldcode"].ToString();
            c.Value = (cdt.Rows.Count > 0) ? cdt.Rows[0][dr["fieldname"].ToString()].ToString() : dr["defaultvalue"].ToString();
            c.Height = new Unit(100);
            c.ToolbarSet = "UpLoad";
            c.BasePath = "Common/Editor/";
            return c;
        }
        else if (ftype == "9")
        {//简单格式文本
            Editor c = new Guangye.WebApplication.Controls.Editor();
            c.ID = "fld_" + dr["fieldcode"].ToString();
            c.Value = (cdt.Rows.Count > 0) ? cdt.Rows[0][dr["fieldname"].ToString()].ToString() : dr["defaultvalue"].ToString();
            c.Height = new Unit(100);
            c.ToolbarSet = "Basic";
            c.BasePath = "Common/Editor/";
            return c;
        }
        else if (ftype == "5")
        {//多选一
            HtmlSelect c = new HtmlSelect();
            c.ID = "fld_" + dr["fieldcode"].ToString();
            string[] src = dr["fielddatasrc"].ToString().Split('|');
            if (src.Length > 0) { foreach (string v in src) { c.Items.Add(v); } }
            c.Value = (cdt.Rows.Count > 0) ? cdt.Rows[0][dr["fieldname"].ToString()].ToString() : dr["defaultvalue"].ToString();
            if (isfullline) { c.Attributes.Add("style", "width:98%;"); } else { c.Attributes.Add("style", "width:95%;"); }
            return c;
        }
        else if (ftype == "6")
        {//是非
            HtmlSelect c = new HtmlSelect();
            c.ID = "fld_" + dr["fieldcode"].ToString();
            c.Items.Add(new ListItem("否", "0"));
            c.Items.Add(new ListItem("是", "1"));
            if (cdt.Rows.Count > 0)
            {

                try
                {
                    c.Value = Convert.ToBoolean(cdt.Rows[0][dr["fieldname"].ToString()]) ? "1" : "0";
                }
                catch
                {
                    c.Value = cdt.Rows[0][dr["fieldname"].ToString()].ToString();
                }

            }
            else
            {
                c.Value = dr["defaultvalue"].ToString();
            }
            if (isfullline) { c.Attributes.Add("style", "width:98%;"); } else { c.Attributes.Add("style", "width:95%;"); }
            return c;
        }
        //else if (ftype == "7")
        //{//日期
         //   Guangye.WebApplication.Controls.ChoseDate c = new Guangye.WebApplication.Controls.ChoseDate();
         //   c.ID = "fld_" + dr["fieldcode"].ToString();
         //   c.Class = "boxbline";
         //   c.Align = "right";
         //   c.Value = (cdt.Rows.Count > 0) ? cdt.Rows[0][dr["fieldname"].ToString()].ToString() : System.DateTime.Now.ToString();
         //   return c;
       // }
        else if (ftype == "8")
        {//简单文本
            HtmlTextArea c = new HtmlTextArea();
            c.ID = "fld_" + dr["fieldcode"].ToString();
            c.Value = (cdt.Rows.Count > 0) ? cdt.Rows[0][dr["fieldname"].ToString()].ToString() : dr["defaultvalue"].ToString();
            c.Attributes.Add("class", "boxbline");
            if (isfullline) { c.Attributes.Add("style", "width:98%; height:50px;"); } else { c.Attributes.Add("style", "width:95%; height:50px;"); }
            return c;
        }
        else if (ftype == "2"  )
        {
            DropDownList c = new DropDownList();
            c.ID = "fld_" + dr["fieldcode"].ToString();            
            c.Width = new Unit(400);
            BindListControl(c, "mocode", "fld_73_1", "select mocode,fld_73_1 from gmis_mo_73");
            SetFilter(c,((cdt.Rows.Count > 0) ? cdt.Rows[0][dr["fieldname"].ToString()].ToString() : "0"));
            return c;
        }
        else
        {//短语

            HtmlInputText c = new HtmlInputText();
            c.ID = "fld_" + dr["fieldcode"].ToString();
            if (ftype == "2" || ftype == "11")//整数，小整数
            {
                try
                {
                    c.Value = (cdt.Rows.Count > 0) ? Convert.ToInt32(cdt.Rows[0][dr["fieldname"].ToString()]).ToString() : dr["defaultvalue"].ToString();
                }
                catch
                {
                    c.Value = dr["defaultvalue"].ToString();
                }
            }
            else
            {
                c.Value = (cdt.Rows.Count > 0) ? cdt.Rows[0][dr["fieldname"].ToString()].ToString() : dr["defaultvalue"].ToString();
            }
            c.Attributes.Add("class", "boxbline");

            if (isfullline) { c.Attributes.Add("style", "width:98%; height:20px;"); } else { c.Attributes.Add("style", "width:95%; height:16px;"); }

            return c;
        }

    }
    //判断必填项及输入类型
    private bool CheckMustAndFieldType(string mid)
    {
        StringBuilder astr = new StringBuilder();
        DataTable fdt = GetEditFields(mid);
        string h_vreturn = "";
        foreach (DataRow fdr in fdt.Rows)
        {
            h_vreturn = guangye.GetControlValue(fold.FindControl("fld_" + fdr["fieldcode"].ToString()));
            if (Convert.ToBoolean(fdr["oneditmust"]))//必填项
            {
                if (h_vreturn == "")
                {
                    astr.Append(fdr["caption"].ToString() + "不能为空！");
                }
            }
            if (h_vreturn != "")
            {
                switch (fdr["fieldtypecode"].ToString())
                {
                    case "2"://整数
                    case "11"://小整数
                        try
                        {
                            Convert.ToInt32(h_vreturn);
                        }
                        catch
                        {
                            astr.Append(fdr["caption"].ToString() + "应输入整数！");
                        }
                        break;
                    case "10"://浮点数                
                        try
                        {
                            Convert.ToDouble(h_vreturn);
                        }
                        catch
                        {
                            astr.Append(fdr["caption"].ToString() + "应输入数字！");
                        }
                        break;
                    case "7"://日期                
                        try
                        {
                            Convert.ToDateTime(h_vreturn);
                        }
                        catch
                        {
                            astr.Append(fdr["caption"].ToString() + "应输入日期格式！");
                        }
                        break;
                }
            }
        }

        if (astr.Length > 0)
        {
            SetSESSION("alert",astr.ToString());
            return false;
        }
        else
        {
            return true;
        }
    }
     //插入文章数据
    private string GetInsertArticle(string mid)
    {
        string exeinfo = "";       
        StringBuilder fsb = new StringBuilder();
        StringBuilder vsb = new StringBuilder();
        StringBuilder asb = new StringBuilder();
        
        DataTable dt = GetEditFields(mid);    
        bool isfullvalue = false;
        foreach (DataRow dr in dt.Rows)
        {
           
            if(dr["caption"].ToString()=="代码")
                orgcode.Value =guangye.GetControlValue(fold.FindControl("fld_" + dr["fieldcode"].ToString()));
            if(dr["caption"].ToString()=="名称")
                orgname.Value =guangye.GetControlValue(fold.FindControl("fld_" + dr["fieldcode"].ToString()));
            fsb.Append(dr["fieldname"].ToString() + ",");
            vsb.Append("'" + guangye.GetControlValue(fold.FindControl("fld_" + dr["fieldcode"].ToString())) + "',");
       
            if (guangye.GetControlValue(fold.FindControl("fld_" + dr["fieldcode"].ToString())).Trim() != "")
            {
                isfullvalue = true;
            }           

        }
        datamocode.Value = "@mocode";
        modulecode.Value = mid;
        db.SqlString = "select top 1 typecode from gmis_type where modulecode=" + mid + " order by typeindex desc";
        DataTable dt_temp = db.GetDataTable();
        if (dt_temp != null && dt_temp.Rows.Count > 0)
        {
            if (dt_temp.Rows[0][0].ToString() != "")
                typecode.Value = dt_temp.Rows[0][0].ToString();
        }
        
        if (fsb.Length > 0 && vsb.Length > 0 && isfullvalue)
        {
            string h_table = GetModuleTableName(mid);
            
            if (("," + fsb.ToString()).ToLower().IndexOf(",creatorcode,") == -1)
            {
                fsb.Append("creatorcode,");
                vsb.Append("'" + GetUID() + "',");
            }
           
            if (h_table.Length > 0)
            {             
				SetSESSION("sql","INSERT INTO " + h_table + "(" + fsb.ToString().Trim(',') + ")Values (" + vsb.ToString().Trim(',') + ");SELECT @@IDENTITY AS 'MoCode';declare @mocode as int;select @mocode=@@IDENTITY;"+guangye.GetInsertSql(dtable_1197, flds_1197, types_1197));
				
            }
            else
            {
                exeinfo = "物理表不存在！";
            }
        }
        else
        {
            exeinfo = "请输入数据！";
        }
        return exeinfo;
    }

    //更新文章数据
    private string GetUpdateArticle(string mid,string id)
    {
        string exeinfo = "";
        StringBuilder fsb = new StringBuilder();
        StringBuilder asb = new StringBuilder();
        DataTable dt = GetEditFields(mid);     
        foreach (DataRow dr in dt.Rows)
        {            
            
            fsb.Append(dr["fieldname"].ToString() + "='" + guangye.GetControlValue(fold.FindControl("fld_" + dr["fieldcode"].ToString())) + "',");
            if(dr["caption"].ToString()=="代码")
                orgcode.Value =guangye.GetControlValue(fold.FindControl("fld_" + dr["fieldcode"].ToString()));
            if(dr["caption"].ToString()=="名称")
                orgname.Value =guangye.GetControlValue(fold.FindControl("fld_" + dr["fieldcode"].ToString()));
        }
        datamocode.Value = id;
        modulecode.Value = mid;
        db.SqlString = "select top 1 typecode from gmis_type where modulecode=" + mid + " order by typeindex desc";
        DataTable dt_temp = db.GetDataTable();
        if (dt_temp != null && dt_temp.Rows.Count > 0)
        {
            if (dt_temp.Rows[0][0].ToString() != "")
                typecode.Value = dt_temp.Rows[0][0].ToString();
        }
        if (fsb.Length > 0)
        {  
            SetSESSION("sql", "Update " + GetModuleTableName(mid) + " Set " + fsb.ToString().Trim(',') + " where mocode=" + id + ";"+guangye.GetUpdateSql(dtable_1197, filter_1197, flds_1197, types_1197));
        }else
        {
			exeinfo="请输入数据！";
        }
        return exeinfo;
    }
     //清空控件值
    private void ClearData(object sender, System.EventArgs e)
    {
        DataTable dt = GetEditFields(mid);        
        foreach (DataRow dr in dt.Rows)
        {
            guangye.SetControlValue(fold.FindControl("fld_" + dr["fieldcode"].ToString()), "");
        }
    }
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<input id="typecode" Value="0" type="hidden" runat="server"/>
<input id="modulecode" Value="0" type="hidden" runat="server"/>
<input id="datamocode" Value="0" type="hidden" runat="server"/>
<input id="orgcode" Value="" type="hidden" runat="server"/>
<input id="orgname" Value="" type="hidden" runat="server"/>
<input id="featurecode" Value="0" type="hidden" runat="server"/>
<input id="areacode" Value="0" type="hidden" runat="server"/>
<input id="rivercode" Value="0" type="hidden" runat="server"/>
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--内容-->
<div id="fold" runat="server" style=""></div>
<!--动态生成结束-->
</form>
</body>
</html>