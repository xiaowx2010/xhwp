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

private void Page_Load(object sender, System.EventArgs e)

{
    SetToolBar();//设置工具条,同时获取固定URL参数
    
	tb_2.Visible=false;
    
	sortid = GetQueryString("sortid", "0");  //排序字段
    sortdir = GetQueryString("sortdir", "1");  //1降序，0升序
	
	CreateField(GetContent());

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
                    lh.Text = "<tr><td align=\"right\" nowrap class=\"td_viewcontent_title\">" + h_editmust + dr["Caption"].ToString() + ":</td><td style=\"width:35%\" class=\"td_viewcontent_content\">";
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
            h_vfield = (cdt.Rows.Count > 0) ? cdt.Rows[0][dr["fieldname"].ToString()].ToString() : dr["defaultvalue"].ToString();
            h_vfield = (h_vfield.Length == 0) ? "&nbsp;" : h_vfield;
			if(dr["fieldname"].ToString()=="fld_"+mid+"_3" && (mid=="1205"||mid=="1206"))//调用污染物类别
			{	
				db.SqlString = "select fld_55_1 from gmis_mo_55 where mocode="+cdt.Rows[0][dr["fieldname"].ToString()].ToString();
				DataTable type_dt = db.GetDataTable();
				if(type_dt.Rows.Count>0)
				{
					h_vfield = type_dt.Rows[0][0].ToString();
				}
			}
            if (h_vfield.ToString().ToLower() == "true")
                h_vfield = "是";
            else if (h_vfield.ToString().ToLower() == "false")
                h_vfield = "否";

            Literal lv = new Literal();
            lv.Text = "<span >" + h_vfield + "</span>";
            fold.Controls.Add(lv);
            
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

</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
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