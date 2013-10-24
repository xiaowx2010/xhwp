<!--废气排放口污染物月排放情况,查看页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string p_year,p_month,p_pfk;
private void Page_Load(object sender, System.EventArgs e)
{    
    id = GetQueryString("id", "0");  
    
	WriteTable();//画报表
}
/***************************************************************
函数名：WriteTable()
用途：画报表
变更人/日期:孙振宇  2009-5-4
***************************************************************/
private void WriteTable()
{
	string h_formstr = "";//页面显示
	string h_wordstr = "";//导出WORD
	string h_temp = "";//转换用字符串

	DataTable h_maindt = db.GetDataTable(db.ConnStr,"select fld_58_1,(select fld_54_1 from gmis_mo_54 a left outer join gmis_mo_23 b on a.mocode=fld_23_6 where fld_23_1=fld_58_2) as fld_54_1,fld_58_2,fld_58_3,fld_58_4,fld_58_5,(select fld_1208_1 from gmis_mo_1208 where mocode=fld_58_6) as fld_58_6,fld_58_7,fld_58_8 from gmis_mo_58 where mocode="+id+"");//绑定主表
		
	DataTable h_extdt = db.GetDataTable(db.ConnStr,"select (select fld_1206_1 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_1,(select fld_1206_4 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_4,fld_1210_3,(select fld_1206_5 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_5,fld_1210_4,fld_1210_5,fld_1210_6,fld_1210_7,(select fld_1208_1 from gmis_mo_1208 where mocode=fld_1210_8) as fld_1210_8 from gmis_mo_1210 where fld_1210_1="+id+"");//绑定扩展表

	if (h_maindt.Rows.Count>0)
	{
		
		p_year = h_maindt.Rows[0]["fld_58_3"].ToString();
		p_month = h_maindt.Rows[0]["fld_58_4"].ToString();
		p_pfk = h_maindt.Rows[0]["fld_58_2"].ToString();

		h_formstr = "<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0 ;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\"><p>废气排放口污染物月排放情况</p></td>\n</tr>\n</table>\n";

		h_wordstr = h_formstr;

		h_formstr += "<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n";
		h_wordstr += "<table width=\"100%\"  border=\"1\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n";

		h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"8%\"> 排放口编号 </td>\n<td width=\"8%\">"+h_maindt.Rows[0]["fld_58_2"].ToString()+"&nbsp;</td>\n<td width=\"8%\"> 排放口类型 </td>\n<td width=\"10%\">"+h_maindt.Rows[0]["fld_54_1"].ToString()+"&nbsp;</td>\n<td width=\"8%\">废气排放量（标立方米）</td>\n<td width=\"10%\">"+h_maindt.Rows[0]["fld_58_5"].ToString()+"&nbsp;</td>\n<td width=\"8%\"> 废气排放数据来源 </td>\n<td width=\"9%\">"+h_maindt.Rows[0]["fld_58_6"].ToString()+"&nbsp;</td>\n<td width=\"6%\"> 排放天数（天） </td>\n<td width=\"9%\">"+h_maindt.Rows[0]["fld_58_7"].ToString()+"&nbsp;</td>\n<td width=\"8%\"> 林格曼黑度（级） </td>\n<td width=\"8%\">"+h_maindt.Rows[0]["fld_58_8"].ToString()+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"2\"> 污染物名称 </td>\n<td colspan=\"2\"> 排放浓度（毫克/小时） </td>\n<td colspan=\"2\"> 排放速率（千克/小时） </td>\n<td rowspan=\"2\"> 数据来源 </td>\n<td colspan=\"6\"> 排放量（千克） </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> 执行标准值 </td>\n<td> 排放浓度 </td>\n<td> 执行标准值 </td>\n<td> 排放速率 </td>\n<td colspan=\"2\"> 合计  </td>\n<td colspan=\"2\">达标排放量 </td>\n<td colspan=\"2\"> 超标排放量 </td>\n</tr>\n";

		h_formstr += h_temp;
		
		h_wordstr += h_temp;
		
		if (h_extdt.Rows.Count>0)
		{
			int i = 1 ;
			foreach (DataRow h_extdr in h_extdt.Rows)
			{
				h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td>"+(i+1).ToString()+"）"+h_extdr["fld_1206_1"].ToString()+"</td>\n<td>"+h_extdr["fld_1206_4"].ToString()+"&nbsp;</td>\n<td>"+h_extdr["fld_1210_3"].ToString()+"&nbsp;</td>\n<td>"+h_extdr["fld_1206_5"].ToString()+"&nbsp;</td>\n<td>"+h_extdr["fld_1210_4"].ToString()+"&nbsp;</td>\n<td>"+h_extdr["fld_1210_8"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_extdr["fld_1210_5"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_extdr["fld_1210_6"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_extdr["fld_1210_7"].ToString()+"&nbsp;</td>\n</tr>\n";	
				
				h_formstr += h_temp;
		
				h_wordstr += h_temp;

				i++;
			}		
		}
	
		h_temp ="</table>\n";

		h_formstr += h_temp;				
				
		h_wordstr += h_temp;
	
		div_form.InnerHtml = h_formstr;
		div_word.InnerHtml = h_wordstr;
	}
	


}
private void Click_Toolbar(object sender, System.EventArgs e)
{
    string idstr = ((Control)sender).ID.ToLower();

    switch (idstr)
    {
        case "btn_word":
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "GB2312";
            Response.AppendHeader("Content-Disposition", "attachment;filename="+p_year+"年"+p_month+"月"+p_pfk+"排放口月废气排放情况.doc");
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
            Response.ContentType = "application/ms-word";
            this.EnableViewState = false;
            System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
            System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
            System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
            oHtmlTextWriter.Write(div_word.InnerHtml);
            Response.Write(oStringWriter.ToString());
            Response.End();
            break;        
        case "btn_print":         
            SetSESSION("filter", div_form.InnerHtml);
            Page.RegisterStartupScript("print", "<scrip" + "t>window.open('pop_0.aspx', 'newwindow', 'height=600,width=800,top=30,left=30,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no')</" + "script>");
            break;
    }
}

</script>
<script>
function clickPrint()
{   
	__doPostBack("btn_print","");
}
function clickOutPutWord()
{
	__doPostBack("btn_word","");
}

</script>


<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<table width="100%">
<tr>
<!--打印预览-->
<td width="100%"></td>
<td style="padding-right:5px;" nowrap align="right">
	<G:Button id="btn_printtxt" type="toolbar" mode="on" text="打印预览" icon="print" Url="javascript:clickPrint();" runat="server"></G:Button>
</td> 
<!--打印预览-->
<!--导出Word-->
<td style="padding-right:5px;" nowrap align="right">
	<G:Button id="btn_wordtxt" type="toolbar" mode="on" text="导出Word" icon="word" Url="javascript:clickOutPutWord();" runat="server"></G:Button>
</td> 
<!--导出Word-->
</tr>
</table>
<!--动态生成html,开始-->
<asp:LinkButton ID="btn_print" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<asp:LinkButton ID="btn_word" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<!--报表,开始-->
<div id="div_form" runat=server></div>
<!--报表,结束-->
<!--动态生成html,结束-->
<div id="div_word" runat=server style="display:none"></div>
</form>
</body>
</html>
