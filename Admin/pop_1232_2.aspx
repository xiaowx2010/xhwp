<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--#include file="func/func_1232.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{      
	string field1 = Request.QueryString.Get("field1");
	string field2 = Request.QueryString.Get("field2");
	fld_1232_4.Value = field1;
	fld_1232_7.Value = field2;

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
			for (int i=0;i<h_v0.Length;i++)
			{
				string[] h_v1 = h_v0[i].Split(',');
				if (h_v1.Length>1)
				{
					h_hsb.Append("<td width=\""+h_v1[1]+"\" align=\"left\">"+GetOneFieldValue("select caption from gmis_field where fieldname ='"+h_v1[0]+"'")+"</td>\n");
					h_lsb.Append("<td>*&nbsp;</td>\n");
					h_tsb.Append("<td>&nbsp;</td>\n");
				}
			}
		}
	}
	h_hsb.Append("</tr>\n");
	h_lsb.Append("</tr>\n");
	h_tsb.Append("</tr>\n");

	listtemphead.InnerHtml = h_hsb.ToString();
	listtemp1.InnerHtml = h_lsb.ToString();
	listtemp2.InnerHtml = h_tsb.ToString();
}
 
    
</script>

<body style="padding:10px;text-align:center;" >

<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--动态生成html,开始-->
<!--操作工具条-->

<!--操作工具条-->

<!--显示字段-->
<input id="fld_1232_4" runat="server" type="hidden" />
<input id="fld_1232_7" runat="server" type="hidden" />
<!--显示字段-->


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
