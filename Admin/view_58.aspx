<!--�����ŷſ���Ⱦ�����ŷ����,�鿴ҳ-->
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
    
	WriteTable();//������
}
/***************************************************************
��������WriteTable()
��;��������
�����/����:������  2009-5-4
***************************************************************/
private void WriteTable()
{
	string h_formstr = "";//ҳ����ʾ
	string h_wordstr = "";//����WORD
	string h_temp = "";//ת�����ַ���

	DataTable h_maindt = db.GetDataTable(db.ConnStr,"select fld_58_1,(select fld_54_1 from gmis_mo_54 a left outer join gmis_mo_23 b on a.mocode=fld_23_6 where fld_23_1=fld_58_2) as fld_54_1,fld_58_2,fld_58_3,fld_58_4,fld_58_5,(select fld_1208_1 from gmis_mo_1208 where mocode=fld_58_6) as fld_58_6,fld_58_7,fld_58_8 from gmis_mo_58 where mocode="+id+"");//������
		
	DataTable h_extdt = db.GetDataTable(db.ConnStr,"select (select fld_1206_1 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_1,(select fld_1206_4 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_4,fld_1210_3,(select fld_1206_5 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_5,fld_1210_4,fld_1210_5,fld_1210_6,fld_1210_7,(select fld_1208_1 from gmis_mo_1208 where mocode=fld_1210_8) as fld_1210_8 from gmis_mo_1210 where fld_1210_1="+id+"");//����չ��

	if (h_maindt.Rows.Count>0)
	{
		
		p_year = h_maindt.Rows[0]["fld_58_3"].ToString();
		p_month = h_maindt.Rows[0]["fld_58_4"].ToString();
		p_pfk = h_maindt.Rows[0]["fld_58_2"].ToString();

		h_formstr = "<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0 ;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\"><p>�����ŷſ���Ⱦ�����ŷ����</p></td>\n</tr>\n</table>\n";

		h_wordstr = h_formstr;

		h_formstr += "<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n";
		h_wordstr += "<table width=\"100%\"  border=\"1\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n";

		h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"8%\"> �ŷſڱ�� </td>\n<td width=\"8%\">"+h_maindt.Rows[0]["fld_58_2"].ToString()+"&nbsp;</td>\n<td width=\"8%\"> �ŷſ����� </td>\n<td width=\"10%\">"+h_maindt.Rows[0]["fld_54_1"].ToString()+"&nbsp;</td>\n<td width=\"8%\">�����ŷ������������ף�</td>\n<td width=\"10%\">"+h_maindt.Rows[0]["fld_58_5"].ToString()+"&nbsp;</td>\n<td width=\"8%\"> �����ŷ�������Դ </td>\n<td width=\"9%\">"+h_maindt.Rows[0]["fld_58_6"].ToString()+"&nbsp;</td>\n<td width=\"6%\"> �ŷ��������죩 </td>\n<td width=\"9%\">"+h_maindt.Rows[0]["fld_58_7"].ToString()+"&nbsp;</td>\n<td width=\"8%\"> �ָ����ڶȣ����� </td>\n<td width=\"8%\">"+h_maindt.Rows[0]["fld_58_8"].ToString()+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"2\"> ��Ⱦ������ </td>\n<td colspan=\"2\"> �ŷ�Ũ�ȣ�����/Сʱ�� </td>\n<td colspan=\"2\"> �ŷ����ʣ�ǧ��/Сʱ�� </td>\n<td rowspan=\"2\"> ������Դ </td>\n<td colspan=\"6\"> �ŷ�����ǧ�ˣ� </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ִ�б�׼ֵ </td>\n<td> �ŷ�Ũ�� </td>\n<td> ִ�б�׼ֵ </td>\n<td> �ŷ����� </td>\n<td colspan=\"2\"> �ϼ�  </td>\n<td colspan=\"2\">����ŷ��� </td>\n<td colspan=\"2\"> �����ŷ��� </td>\n</tr>\n";

		h_formstr += h_temp;
		
		h_wordstr += h_temp;
		
		if (h_extdt.Rows.Count>0)
		{
			int i = 1 ;
			foreach (DataRow h_extdr in h_extdt.Rows)
			{
				h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td>"+(i+1).ToString()+"��"+h_extdr["fld_1206_1"].ToString()+"</td>\n<td>"+h_extdr["fld_1206_4"].ToString()+"&nbsp;</td>\n<td>"+h_extdr["fld_1210_3"].ToString()+"&nbsp;</td>\n<td>"+h_extdr["fld_1206_5"].ToString()+"&nbsp;</td>\n<td>"+h_extdr["fld_1210_4"].ToString()+"&nbsp;</td>\n<td>"+h_extdr["fld_1210_8"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_extdr["fld_1210_5"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_extdr["fld_1210_6"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_extdr["fld_1210_7"].ToString()+"&nbsp;</td>\n</tr>\n";	
				
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
            Response.AppendHeader("Content-Disposition", "attachment;filename="+p_year+"��"+p_month+"��"+p_pfk+"�ŷſ��·����ŷ����.doc");
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
<!--��ӡԤ��-->
<td width="100%"></td>
<td style="padding-right:5px;" nowrap align="right">
	<G:Button id="btn_printtxt" type="toolbar" mode="on" text="��ӡԤ��" icon="print" Url="javascript:clickPrint();" runat="server"></G:Button>
</td> 
<!--��ӡԤ��-->
<!--����Word-->
<td style="padding-right:5px;" nowrap align="right">
	<G:Button id="btn_wordtxt" type="toolbar" mode="on" text="����Word" icon="word" Url="javascript:clickOutPutWord();" runat="server"></G:Button>
</td> 
<!--����Word-->
</tr>
</table>
<!--��̬����html,��ʼ-->
<asp:LinkButton ID="btn_print" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<asp:LinkButton ID="btn_word" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<!--����,��ʼ-->
<div id="div_form" runat=server></div>
<!--����,����-->
<!--��̬����html,����-->
<div id="div_word" runat=server style="display:none"></div>
</form>
</body>
</html>
