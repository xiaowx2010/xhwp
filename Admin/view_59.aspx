<!--�����ŷſ����ŷ����,�鿴ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{    
    id = GetQueryString("id", "0");  
    
	WriteTable();//������
}
/***************************************************************
��������WriteTable()
��;��������
�����/����:������  2009-5-5
***************************************************************/
private void WriteTable()
{
	/*ģ��༭����*/
	dtable = "gmis_mo_59";
	filter = " mocode=" + id;
	flds = new string[] { "fld_59_1", "fld_59_2", "fld_59_3",};
	types = "011";
	/*ģ��༭����*/
	
	if(id!="0")
	{
		guangye.BindData(dtable, filter, flds);	
	}

	string h_formstr = "";//ҳ����ʾ
	string h_wordstr = "";//����WORD
	string h_temp = "";//ת�����ַ���
	
	string h_code58;
	double h_pfl,h_dbpfl,h_cbpfl;
	double h_rlxh= 0;//ȼ������
	string h_23_5="",h_23_6="",h_sbname="",h_rlname="";
	
	DataTable h_dt25 = db.GetDataTable(db.ConnStr,"select fld_25_2 from gmis_mo_25 where fld_25_15='"+guangye.GetControlValue(fld_59_1)+"'");//��ȡ��¯¯Ҥ����
	if(h_dt25.Rows.Count>0)
	{
		foreach (DataRow h_dr25 in h_dt25.Rows)
		{
			h_sbname += h_dr25["fld_25_2"].ToString()+",";
		}
		h_sbname = h_sbname.Trim(',');
	}
	
	DataTable h_dt27 = db.GetDataTable(db.ConnStr,"select (select fld_62_1 from gmis_mo_62 where mocode=fld_27_1) as fld_27_1,fld_27_4,fld_27_2/10000 as fld_27_2 from gmis_mo_27");//��ȡ����ȼ����������

	DataTable h_dt23 = db.GetDataTable(db.ConnStr,"select fld_23_3,fld_23_5,(select fld_54_1 from gmis_mo_54 where mocode=fld_23_6) as fld_23_6 from gmis_mo_23 where fld_23_1='"+guangye.GetControlValue(fld_59_1)+"'");//��ȡ�ŷſ�����
	if(h_dt23.Rows.Count>0)
	{
		h_23_5 = h_dt23.Rows[0]["fld_23_5"].ToString();//�ŷſ�λ��
		h_23_6 = h_dt23.Rows[0]["fld_23_6"].ToString();//�ŷſ�����
		DataRow[] h_dr27 = h_dt27.Select("fld_27_4='"+h_dt23.Rows[0]["fld_23_3"].ToString()+"'");//ɸѡ���ŷſڵ�ȼ������
		if(h_dr27.Length>0)
		{
			foreach (DataRow h_ddr27 in h_dr27)
			{
				h_rlname += h_ddr27["fld_27_1"].ToString()+",";
				h_rlxh += Convert.ToDouble(h_ddr27["fld_27_2"]);
			}
			h_rlname = h_rlname.Trim(',');
			h_rlxh = Math.Round(h_rlxh/h_dr27.Length,4);
		}			
	}
	

	DataTable h_dt58 = db.GetDataTable(db.ConnStr,"select a.mocode,fld_58_5,case when sum(fld_1210_6) is null then 0 else sum(fld_1210_6) end as fld_1210_6,case when sum(fld_1210_7) is null then 0 else sum(fld_1210_7) end as fld_1210_7 from gmis_mo_58 a left outer join gmis_mo_1210 b on a.mocode=b.fld_1210_1 where fld_58_2='"+guangye.GetControlValue(fld_59_1)+"' and fld_58_3="+guangye.GetControlValue(fld_59_2)+" group by a.mocode,fld_58_5");//��ȡ�����µ��������ݡ������ݡ�fld_1210_6���͡�fld_1210_7��Ϊ������չ���Ӧ�ֶεĺͣ�������1�Զ�Ĺ�ϵ����������GROUP BY��

	if (h_dt58.Rows.Count>0)
	{		
		h_code58 = "";//����mocode��
		h_pfl = 0;//���ŷ���
		h_dbpfl = 0;//���д���ŷ���
		h_cbpfl = 0;//���г����ŷ���
		foreach (DataRow h_dr58 in h_dt58.Rows)
		{
			h_code58 += h_dr58["mocode"].ToString()+",";
			h_pfl += Convert.ToDouble(h_dr58["fld_58_5"]);
			if(h_dr58["fld_1210_6"].ToString()!="0")
			{
				h_dbpfl += Convert.ToDouble(h_dr58["fld_58_5"]);
			}
			else if(h_dr58["fld_1210_7"].ToString()!="0")
			{
				h_cbpfl += Convert.ToDouble(h_dr58["fld_58_5"]);
			}
		}
		h_code58 = h_code58.Trim(',');
		h_pfl = Math.Round(h_pfl/10000,6);
		h_dbpfl = Math.Round(h_dbpfl/10000,6);
		h_cbpfl = Math.Round(h_cbpfl/10000,6);
		

		DataTable h_dt1210 = db.GetDataTable(db.ConnStr,"select (select fld_1206_1 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1210_2,sum(fld_1210_5)/1000 as fld_1210_5,sum(fld_1210_6)/1000 as fld_1210_6,sum(fld_1210_7)/1000 as fld_1210_7 from gmis_mo_1210 where fld_1210_1 in ("+h_code58+") group by fld_1210_2");//��ȡ�����µ���չ�����ݸ���Ⱦ�����ֵ��

		h_formstr = "<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\">�����ŷſ����ŷ����</td>\n</tr>\n</table>\n";

		h_wordstr = h_formstr;
		
		h_formstr += "<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n";
		h_wordstr += "<table width=\"100%\"  border=\"1\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n";
		
		h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"10%\"> �ŷſڱ�� </td>\n<td colspan=\"2\">"+guangye.GetControlValue(fld_59_1)+"&nbsp;</td>\n<td>�ŷſ�λ�� </td>\n<td width=\"30%\" colspan=\"4\">"+h_23_5+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> �ŷſ�����</td>\n<td colspan=\"2\">"+h_23_6+"&nbsp;</td>\n<td width=\"16%\">�豸����</td>\n<td colspan=\"4\">"+h_sbname+"&nbsp; </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> �ŷ����� </td>\n<td align=\"left\" style=\"padding-left:180px\" colspan=\"7\">"+guangye.GetControlValue(fld_59_3)+"&nbsp; </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ȼ������ </td>\n<td colspan=\"2\">"+h_rlname+"&nbsp;</td>\n<td> ȼ�Ϻ�������ֻ��������ף� </td>\n<td colspan=\"4\">"+h_rlxh.ToString()+"&nbsp; </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"2\"> �����ŷ�������������ף� </td>\n<td colspan=\"2\" rowspan=\"2\">"+h_pfl.ToString()+"&nbsp; </td>\n<td width=\"16%\"> ���д���ŷ�������������ף� </td>\n<td colspan=\"4\">"+h_dbpfl.ToString()+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ���г����ŷ���(���������) </td>\n<td colspan=\"4\">"+h_cbpfl.ToString()+"&nbsp;</td>\n</tr>\n";

		h_formstr += h_temp;
		
		h_wordstr += h_temp;
		
		h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"3\"> ��Ⱦ������ </td>\n<td colspan=\"7\"> ��Ⱦ���ŷ������֣� </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"11%\" rowspan=\"2\"> �ϼ� </td>\n<td colspan=\"6\"> ���� </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"33%\" colspan=\"3\"> ����ŷ���  </td>\n<td colspan=\"3\">�����ŷ��� </td>\n</tr>\n";

		h_formstr += h_temp;
		
		h_wordstr += h_temp;


		if(h_dt1210.Rows.Count>0)
		{
			int i = 1;//���
			foreach (DataRow h_dr1210 in h_dt1210.Rows)
			{
				h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td>��"+i.ToString()+"��"+h_dr1210["fld_1210_2"].ToString()+" </td>\n<td>"+h_dr1210["fld_1210_5"].ToString()+"&nbsp;</td>\n<td colspan=\"3\">"+h_dr1210["fld_1210_6"].ToString()+"&nbsp;</td>\n<td colspan=\"3\">"+h_dr1210["fld_1210_7"].ToString()+"&nbsp;</td>\n</tr>\n";

				h_formstr += h_temp;
		
				h_wordstr += h_temp;
				
				i++;
			}
			
		}
		
		h_temp ="</table>\n";

		h_formstr += h_temp;				
				
		h_wordstr += h_temp;
	


		guangye.SetControlValue(div_form,h_formstr);
		guangye.SetControlValue(div_word,h_wordstr);
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
            Response.AppendHeader("Content-Disposition", "attachment;filename="+guangye.GetControlValue(fld_59_2)+"��"+guangye.GetControlValue(fld_59_1)+"�ŷſ�������ŷ����.doc");
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
<input id="fld_59_1" type="hidden" runat="server" ></td>
<input id="fld_59_2" type="hidden" runat="server" ></td>
<input id="fld_59_3" type="hidden" runat="server" ></td>
<!--����,��ʼ-->
<div id="div_form" runat=server></div>
<!--����,����-->
<!--��̬����html,����-->
<div id="div_word" runat=server style="display:none"></div>
</form>
</body>
</html>
