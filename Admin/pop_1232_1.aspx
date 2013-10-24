<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<style type="text/css">
.righttableline {
	margin-top: 10px;
	border: #999999 1px solid;
	margin-bottom: 10px;
}
.tr_listtitle
{    
    font-size: 12px;
	line-height: 22px;
	font-weight: bold;
	color: #FFFFFF;
	text-decoration: none;
	padding:0px 5px 0px 5px;
	background-color:#627C9D;   
}


.tr_listcontent{    
    font-size: 12px;
	line-height: 22px;
	color: #000000;
	text-decoration: none;
	padding:0px 5px 0px 5px;
	background-color:#ffffff; 
}
</style>
<!--#include file="func.aspx"-->
<!--#include file="func/func_1232.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{      

	
	if (GetSESSION("filter")!="")
	{
		string[] h_keystr = GetSESSION("filter").Split('#');
		
		if (h_keystr.Length>5)
		{
			guangye.SetControlValue(fld_1232_2,h_keystr[0]);
			guangye.SetControlValue(fld_1232_3,h_keystr[1]);
			guangye.SetControlValue(fld_1232_4,h_keystr[2]);
			guangye.SetControlValue(fld_1232_5,h_keystr[3]);
			guangye.SetControlValue(fld_1232_6,h_keystr[4]);
			guangye.SetControlValue(fld_1232_7,h_keystr[5]);
		}
		SetSESSION("filter","");
	}
	BindListData();
}
/***************************************************************
函数名：BindListData()
用途：查询
变更人/日期:孙振宇  2009-6-19
***************************************************************/
private void BindListData()
{	
	StringBuilder h_hsb = new StringBuilder();//表头
	StringBuilder h_lsb = new StringBuilder();//列表
	StringBuilder h_tsb = new StringBuilder();//空白
	string h_field = "",h_table = "",h_where = "",h_order = "";//字段，表名，条件，排序

	h_hsb.Append("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"righttableline\">\n<tr class=\"tr_listtitle\">\n");
	h_lsb.Append("<tr class=\"tr_listcontent\">\n");
	h_tsb.Append("<tr class=\"tr_listcontent\">\n");
	if (guangye.GetControlValue(fld_1232_7)!="")
	{
		//画表
		string[] h_v0 = guangye.GetControlValue(fld_1232_7).Trim('|').Split('|');
		if (h_v0.Length>0)
		{
			for (int i=0;i<h_v0.Length;i++)
			{
				string[] h_v1 = h_v0[i].Split(';');
				if (h_v1.Length>2)
				{
					h_field += ChangeToFieldnam(h_v1[0],guangye.GetControlValue(fld_1232_5))+",";
					h_hsb.Append("<td width=\""+h_v1[2]+"\" align=\"left\">"+h_v1[1]+"</td>\n");
					h_lsb.Append("<td>*&nbsp;</td>\n");
					h_tsb.Append("<td>&nbsp;</td>\n");
				}
			}
		}
	}
	
	if (guangye.GetControlValue(fld_1232_4)!="")
	{
		//画表
		string[] h_v0 = guangye.GetControlValue(fld_1232_4).Trim('|').Split('|');
		if (h_v0.Length>0)
		{
			h_table = "gmis_mo_"+guangye.GetControlValue(fld_1232_5);
			for (int i=0;i<h_v0.Length;i++)
			{
				string[] h_v1 = h_v0[i].Split(',');
				if (h_v1.Length>1)
				{
					h_field += CheckSearchField(h_v1[0])+",";
					h_hsb.Append("<td width=\""+h_v1[1]+"\" align=\"left\">"+GetOneFieldValue("select caption from gmis_field where fieldname ='"+h_v1[0]+"'")+"</td>\n");
					h_lsb.Append("<td>*&nbsp;</td>\n");
					h_tsb.Append("<td>&nbsp;</td>\n");
				}
			}
			h_field = h_field.Trim(',');
		}
	}

	h_hsb.Append("</tr>\n");
	h_lsb.Append("</tr>\n");
	h_tsb.Append("</tr>\n");

	listtemphead.InnerHtml = h_hsb.ToString();
	listtemp1.InnerHtml = h_lsb.ToString();
	listtemp2.InnerHtml = h_tsb.ToString();

	//排序
	if (guangye.GetControlValue(fld_1232_3)!="")
	{
		string[] h_o0 = guangye.GetControlValue(fld_1232_3).Trim('|').Split('|');
		if (h_o0.Length>0)
		{
			h_order = " order by ";
			for (int i=0;i<h_o0.Length;i++)
			{
				string[] h_o1 = h_o0[i].Split(';');
				if (h_o1.Length>1)
				{
					h_order += h_o1[0]+" "+h_o1[1]+",";					
				}
			}
			h_order = h_order.Trim(',');
		}
	}

	//条件
	if (guangye.GetControlValue(fld_1232_2)=="")
	{
		fld_1232_2.Value=StringUtility.StringToBase64(CheckSearchFilter(guangye.GetControlValue(fld_1232_6)));//获取查询条件
	}
	h_where = (guangye.GetControlValue(fld_1232_2)=="")?"":" where "+StringUtility.Base64ToString(guangye.GetControlValue(fld_1232_2));

	string h_sqlstr = "select "+h_field+" from "+h_table+" "+h_where+" "+h_order+"";//SQL语句
	
	list.SqlStr = h_sqlstr;
	list.Rows = list.DataTable.Rows.Count;
	
}
//导出为EXCEL
protected void Go_OutPutData(object sender, System.EventArgs e)
{
    /**隐藏页面上不导出的内容如：按钮**/
    btnContainter.Visible = false;
    guangye.Visible = false;
	Response.Clear();
    Response.Buffer = true;
    Response.Charset = "GB2312";
    Response.AppendHeader("Content-Disposition", "attachment;filename=高级查询.xls");
    Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-7");
    Response.ContentType = "application/ms-excel";
    this.EnableViewState = false;
    System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
    System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
    System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
    this.RenderControl(oHtmlTextWriter);
    Response.Write(oStringWriter.ToString());
    Response.End();

    btnContainter.Visible = true;
}

//按钮事件
private void Filter_Change(object sender, System.EventArgs e)
{
    string h_idstr = ((Control)sender).ID;//按钮名
    switch (h_idstr)
    { 
        case "btn_print"://打印
            Page.RegisterStartupScript("", "<scrip" + "t >window.print();</scrip" + "t>");
            break;
        default: 
            break;
    }
    
}
    
</script>

<body style="padding:10px;text-align:center;" >

<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<div id="btnContainter" runat="server">
<!--动态生成html,开始-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="打印"></G:Button> </td> 
            <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel" type="toolbar" mode="on" text="导出EXCEL" onclick="Go_OutPutData"></G:Button> </td> 
			
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->

<!--查询条件-->
<input id="fld_1232_2" runat="server" type="hidden" />
<!--查询条件-->
<!--排序条件-->
<input id="fld_1232_3" runat="server" type="hidden" />
<!--排序条件-->
<!--显示字段-->
<input id="fld_1232_4" runat="server" type="hidden" />
<input id="fld_1232_7" runat="server" type="hidden" />
<!--显示字段-->
<!--模块ID-->
<input id="fld_1232_5" runat="server" type="hidden" />
<!--模块ID-->
<!--查询条件字段-->
<input id="fld_1232_6" runat="server" type="hidden" />
<!--查询条件字段-->
</div>
<G:ListTable ID="list" Rows="20"  IsProPage="true" runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		
	</G:Template>	
</G:ListTable>
</form>
</body>
</html>
