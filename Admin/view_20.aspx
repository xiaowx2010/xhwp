<!--��ˮ�ŷſ����ŷ����,�鿴ҳ-->
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
�����/����:������  2009-5-4
***************************************************************/
private void WriteTable()
{
	/*ģ��༭����*/
	dtable = "gmis_mo_20";
	filter = " mocode=" + id;
	flds = new string[] { "fld_20_1", "fld_20_2", "fld_20_3", "fld_20_4", "fld_20_5"};
	types = "01110";
	/*ģ��༭����*/
	
	if(id!="0")
	{
		guangye.BindData(dtable, filter, flds);	
		guangye.SetControlValue(fld_20_4,(guangye.GetControlValue(fld_20_4).ToLower()=="true")?"��":"��");
	}

	string h_formstr = "";//ҳ����ʾ
	string h_wordstr = "";//����WORD
	string h_temp = "";//ת�����ַ���
	
	string h_code19;
	double h_pfl,h_dbpfl,h_cbpfl;
	string h_53_5="",h_53_7="",h_53_8="",h_53_10="";
	

	DataTable h_dt53 = db.GetDataTable(db.ConnStr,"select fld_53_5,(select fld_1165_2 from gmis_mo_1165 where mocode=fld_53_7) as fld_53_7,fld_53_8,(select fld_1196_1 from gmis_mo_1196 where mocode=fld_53_10) as fld_53_10 from gmis_mo_53 where fld_53_1='"+guangye.GetControlValue(fld_20_1)+"'");//��ȡ�ŷſ�����
	if(h_dt53.Rows.Count>0)
	{
		h_53_5 = h_dt53.Rows[0]["fld_53_5"].ToString();//�ŷſ�λ��
		h_53_7 = h_dt53.Rows[0]["fld_53_7"].ToString();//�ŷ�ȥ��
		h_53_8 = h_dt53.Rows[0]["fld_53_8"].ToString();//��ˮ�ŷŹ���
		h_53_10 = h_dt53.Rows[0]["fld_53_10"].ToString();//ˮ������
	}
	

	DataTable h_dt19 = db.GetDataTable(db.ConnStr,"select a.mocode,fld_19_5,case when sum(fld_1209_5) is null then 0 else sum(fld_1209_5) end as fld_1209_5,case when sum(fld_1209_6) is null then 0 else sum(fld_1209_6) end as fld_1209_6 from gmis_mo_19 a left outer join gmis_mo_1209 b on a.mocode=b.fld_1209_1 where fld_19_2='"+guangye.GetControlValue(fld_20_1)+"' and fld_19_3="+guangye.GetControlValue(fld_20_2)+" group by a.mocode,fld_19_5");//��ȡ�����µ��������ݡ������ݡ�fld_1209_5���͡�fld_1209_6��Ϊ������չ���Ӧ�ֶεĺͣ�������1�Զ�Ĺ�ϵ����������GROUP BY��

	

	if (h_dt19.Rows.Count>0)
	{
		
		h_code19 = "";//����mocode��
		h_pfl = 0;//���ŷ���
		h_dbpfl = 0;//���д���ŷ���
		h_cbpfl = 0;//���г����ŷ���
		foreach (DataRow h_dr19 in h_dt19.Rows)
		{
			h_code19 += h_dr19["mocode"].ToString()+",";
			h_pfl += Convert.ToDouble(h_dr19["fld_19_5"]);
			if(h_dr19["fld_1209_5"].ToString()!="0")
			{
				h_dbpfl += Convert.ToDouble(h_dr19["fld_19_5"]);
			}
			else if(h_dr19["fld_1209_6"].ToString()!="0")
			{
				h_cbpfl += Convert.ToDouble(h_dr19["fld_19_5"]);
			}
		}
		h_code19 = h_code19.Trim(',');
		h_pfl = Math.Round(h_pfl/10000,6);
		h_dbpfl = Math.Round(h_dbpfl/10000,6);
		h_cbpfl = Math.Round(h_cbpfl/10000,6);
		

		DataTable h_dt1209 = db.GetDataTable(db.ConnStr,"select (select fld_1205_1 from gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2=b.mocode where a.mocode=fld_1209_2) as fld_1209_2,sum(fld_1209_4)/1000 as fld_1209_4,sum(fld_1209_5)/1000 as fld_1209_5,sum(fld_1209_6)/1000 as fld_1209_6 from gmis_mo_1209 where fld_1209_1 in ("+h_code19+") group by fld_1209_2");//��ȡ�����µ���չ�����ݸ���Ⱦ�����ֵ��


		h_formstr = "<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\">��ˮ�ŷſ����ŷ����</td>\n</tr>\n</table>\n";

		h_wordstr = h_formstr;

		h_formstr += "<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n";
		h_wordstr += "<table width=\"100%\"  border=\"1\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n";
		
		h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> �ŷſڱ��</td>\n<td colspan=\"2\">"+guangye.GetControlValue(fld_20_1)+"&nbsp; </td>\n<td> �ŷſ�λ�� </td>\n<td colspan=\"5\">"+h_53_5+"&nbsp; </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> �ŷ�����</td>\n<td colspan=\"2\">"+guangye.GetControlValue(fld_20_3)+"&nbsp; </td>\n<td> �ŷ�ȥ�� </td>\n<td width=\"15%\">"+h_53_7+"&nbsp;</td>\n<td rowspan=\"2\"> ��ˮ�ŷ���<br>����֣� </td>\n<td width=\"100\" rowspan=\"2\">"+h_pfl.ToString()+"&nbsp;</td>\n<td> ���д���ŷ�������֣� </td>\n<td width=\"9%\">"+h_dbpfl.ToString()+"&nbsp;</td>\n</tr>\n  <tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ��ˮ�ŷŹ��� </td>\n<td colspan=\"2\">"+h_53_8+"&nbsp; </td>\n <td> ˮ������ </td>\n<td>"+h_53_10+"&nbsp;</td>\n<td> ���г����ŷ�������֣� </td>\n <td>"+h_cbpfl.ToString()+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ��ˮ�����Ƿ�ί��<br>רҵ�����е�λ���� </td>\n<td colspan=\"3\">"+guangye.GetControlValue(fld_20_4)+"&nbsp;</td>\n<td> רҵ�����е�λ���� </td>\n<td colspan=\"4\">"+guangye.GetControlValue(fld_20_5)+"&nbsp;</td>\n</tr>\n";

		h_formstr += h_temp;
		
		h_wordstr += h_temp;

		h_temp =  "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"3\">��Ⱦ������</td>\n<td colspan=\"8\"> ��Ⱦ���ŷ������֣�</td>\n</tr>\n<tr align=\"center\" valign=\"middle\">\n<td width=\"10%\" rowspan=\"2\" bgcolor=\"#FFFFFF\"> �ϼ� </td>\n<td colspan=\"7\" bgcolor=\"#FFFFFF\"> ���� </td>\n</tr>\n<tr align=\"center\" valign=\"middle\">\n<td colspan=\"3\" bgcolor=\"#FFFFFF\"> ����ŷ���  </td>\n<td colspan=\"4\" bgcolor=\"#FFFFFF\">�����ŷ��� </td>\n</tr>\n";

		h_formstr += h_temp;
		
		h_wordstr += h_temp;


		if(h_dt1209.Rows.Count>0)
		{
			int i = 1;//���
			foreach (DataRow h_dr1209 in h_dt1209.Rows)
			{
				h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ��"+i.ToString()+"��"+h_dr1209["fld_1209_2"].ToString()+" </td>\n<td>"+h_dr1209["fld_1209_4"].ToString()+"&nbsp;</td>\n<td colspan=\"3\">"+h_dr1209["fld_1209_5"].ToString()+"&nbsp;</td>\n<td colspan=\"4\">"+h_dr1209["fld_1209_6"].ToString()+"&nbsp;</td>\n</tr>\n";

				h_formstr += h_temp;
		
				h_wordstr += h_temp;
			}
			i++;
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
            Response.AppendHeader("Content-Disposition", "attachment;filename="+guangye.GetControlValue(fld_20_2)+"��"+guangye.GetControlValue(fld_20_1)+"�ŷſ�����ˮ�ŷ����.doc");
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
<input id="fld_20_1" type="hidden" runat="server" ></td>
<input id="fld_20_2" type="hidden" runat="server" ></td>
<input id="fld_20_3" type="hidden" runat="server" ></td>
<input id="fld_20_4" type="hidden" runat="server" ></td>
<input id="fld_20_5" type="hidden" runat="server" ></td>
<!--����,��ʼ-->
<div id="div_form" runat=server></div>
<!--����,����-->
<!--��̬����html,����-->
<div id="div_word" runat=server style="display:none"></div>
</form>
</body>
</html>
