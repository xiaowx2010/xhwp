<!--��ˮ�ŷſ����ŷ����,�༭ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->

<!--����gmis_mo_20
������gmis_mo_19��������������gmis_mo_19.fld_19_3=gmis_mo_20.fld_20_2��;��
-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{    
     
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
	tb_save.Visible = false; //���ر��水ť


	/*ģ��༭����*/
	dtable = "gmis_mo_20";
	filter = " mocode=" + id;
	flds = new string[] { "fld_20_1", "fld_20_2", "fld_20_3", "fld_20_4", "fld_20_5"};
	types = "01110";
	/*ģ��༭����*/	

	if(!IsPostBack)
	{
		if(id!="0")
		{
			guangye.BindData(dtable, filter, flds);	

			SetFilter(fld_20_4txt,(guangye.GetControlValue(fld_20_4).ToLower()=="true")?"1":"0");
			guangye.SetControlValue(fld_20_1txt,guangye.GetControlValue(fld_20_1));
			guangye.SetControlValue(fld_20_2txt,guangye.GetControlValue(fld_20_2));
		}
		BindListForm();//�󶨱���
	}
}
/***************************************************************
��������BindListForm()
��;���󶨱���
�����/����:������  2009-4-30
***************************************************************/
private void BindListForm()
{
	StringBuilder h_sb;
	
	string h_code19;
	double h_pfl,h_dbpfl,h_cbpfl;
	string h_53_5="",h_53_7="",h_53_8="",h_53_10="";
	
	DataTable h_dt53 = db.GetDataTable(db.ConnStr,"select fld_53_5,(select fld_1165_2 from gmis_mo_1165 where mocode=fld_53_7) as fld_53_7,fld_53_8,(select fld_1196_1 from gmis_mo_1196 where mocode=fld_53_10) as fld_53_10 from gmis_mo_53 where fld_53_1='"+guangye.GetControlValue(fld_20_1txt)+"'");//��ȡ�ŷſ�����
	if(h_dt53.Rows.Count>0)
	{
		h_53_5 = h_dt53.Rows[0]["fld_53_5"].ToString();//�ŷſ�λ��
		h_53_7 = h_dt53.Rows[0]["fld_53_7"].ToString();//�ŷ�ȥ��
		h_53_8 = h_dt53.Rows[0]["fld_53_8"].ToString();//��ˮ�ŷŹ���
		h_53_10 = h_dt53.Rows[0]["fld_53_10"].ToString();//ˮ������
	}
	

	DataTable h_dt19 = db.GetDataTable(db.ConnStr,"select a.mocode,fld_19_5,case when sum(fld_1209_5) is null then 0 else sum(fld_1209_5) end as fld_1209_5,case when sum(fld_1209_6) is null then 0 else sum(fld_1209_6) end as fld_1209_6 from gmis_mo_19 a left outer join gmis_mo_1209 b on a.mocode=b.fld_1209_1 where fld_19_2='"+guangye.GetControlValue(fld_20_1txt)+"' and fld_19_3="+guangye.GetControlValue(fld_20_2txt)+" group by a.mocode,fld_19_5");//��ȡ�����µ��������ݡ������ݡ�fld_1209_5���͡�fld_1209_6��Ϊ������չ���Ӧ�ֶεĺͣ�������1�Զ�Ĺ�ϵ����������GROUP BY��

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

		h_sb = new StringBuilder();//�������stringbuilder

		h_sb.Append("<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\">��ˮ�ŷſ����ŷ����</td>\n</tr>\n</table>\n");

		h_sb.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> �ŷſڱ��</td>\n<td colspan=\"2\">"+guangye.GetControlValue(fld_20_1txt)+"&nbsp; </td>\n<td> �ŷſ�λ�� </td>\n<td colspan=\"5\">"+h_53_5+"&nbsp; </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> �ŷ�����</td>\n<td colspan=\"2\">"+guangye.GetControlValue(fld_20_3)+"&nbsp; </td>\n<td> �ŷ�ȥ�� </td>\n<td width=\"15%\">"+h_53_7+"&nbsp;</td>\n<td rowspan=\"2\"> ��ˮ�ŷ���<br>����֣� </td>\n<td width=\"100\" rowspan=\"2\">"+h_pfl.ToString()+"&nbsp;</td>\n<td> ���д���ŷ�������֣� </td>\n<td width=\"9%\">"+h_dbpfl.ToString()+"&nbsp;</td>\n</tr>\n  <tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ��ˮ�ŷŹ��� </td>\n<td colspan=\"2\">"+h_53_8+"&nbsp; </td>\n <td> ˮ������ </td>\n<td>"+h_53_10+"&nbsp;</td>\n<td> ���г����ŷ�������֣� </td>\n <td>"+h_cbpfl.ToString()+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ��ˮ�����Ƿ�ί��<br>רҵ�����е�λ���� </td>\n<td colspan=\"3\">"+fld_20_4txt.SelectedItem.Text+"&nbsp;</td>\n<td> רҵ�����е�λ���� </td>\n<td colspan=\"4\">"+guangye.GetControlValue(fld_20_5)+"&nbsp;</td>\n</tr>\n");

		h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"3\">��Ⱦ������</td>\n<td colspan=\"8\"> ��Ⱦ���ŷ������֣�</td>\n</tr>\n<tr align=\"center\" valign=\"middle\">\n<td width=\"10%\" rowspan=\"2\" bgcolor=\"#FFFFFF\"> �ϼ� </td>\n<td colspan=\"7\" bgcolor=\"#FFFFFF\"> ���� </td>\n</tr>\n<tr align=\"center\" valign=\"middle\">\n<td colspan=\"3\" bgcolor=\"#FFFFFF\"> ����ŷ���  </td>\n<td colspan=\"4\" bgcolor=\"#FFFFFF\">�����ŷ��� </td>\n</tr>\n");

		if(h_dt1209.Rows.Count>0)
		{
			int i = 1;//���
			foreach (DataRow h_dr1209 in h_dt1209.Rows)
			{
				h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ��"+i.ToString()+"��"+h_dr1209["fld_1209_2"].ToString()+" </td>\n<td>"+h_dr1209["fld_1209_4"].ToString()+"&nbsp;</td>\n<td colspan=\"3\">"+h_dr1209["fld_1209_5"].ToString()+"&nbsp;</td>\n<td colspan=\"4\">"+h_dr1209["fld_1209_6"].ToString()+"&nbsp;</td>\n</tr>\n");
				i++;
			}
			
		}
		
		h_sb.Append("</table>\n");

		guangye.SetControlValue(div_form,h_sb.ToString());
	}	
}
private void Click_Toolbar(object sender, System.EventArgs e)
{
	string idstr = ((Control)sender).ID.ToLower();
	switch (idstr)
	{
		//���ɱ���
		case "btn_putdata":
			guangye.SetControlValue(fld_20_1,guangye.GetControlValue(fld_20_1txt));//�ŷſڴ���
			guangye.SetControlValue(fld_20_2,guangye.GetControlValue(fld_20_2txt));//���
			guangye.SetControlValue(fld_20_4,guangye.GetControlValue(fld_20_4txt));//��ˮ�����Ƿ�ί��רҵ�����е�λ����
			tb_save.Visible = true;
			BindListForm();//�󶨱���
			break;
	}
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<td align=left style="padding-left: 5px;" nowrap>
				<G:Button id="btn_putdata" type="toolbar" mode="on" icon="TB24" text="���ɱ���" onclick="Click_Toolbar" runat="server">
				</G:Button>
			</td>
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<!--������Ϣ,��ʼ-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="150" align="right"  class="td_viewcontent_title">�ŷſڴ���:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<span id="fld_20_1txt" runat=server></span>
		<input id="fld_20_1" type="hidden" runat="server" ></td>
		
		<td width="150" align="right"  class="td_viewcontent_title">���:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<span id="fld_20_2txt" runat=server></span>&nbsp;��
		<input id="fld_20_2" type="hidden" runat="server" >
		</td>
	</tr>
	<tr>
		<td width="150" align="right"  class="td_viewcontent_title">�ŷ�����:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_20_3" type="text" class="boxbline" style="width:95%;"  maxlength="4" runat="server" ></td>		
		<td width="150" align="right"  class="td_viewcontent_title">��ˮ�����Ƿ�ί��רҵ�����е�λ����:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_20_4" type="hidden" runat="server" >
		<asp:DropDownList id="fld_20_4txt" style="width:95%;" runat="server">
		<asp:ListItem Value="0">��</asp:ListItem>
		<asp:ListItem Value="1">��</asp:ListItem>
		</asp:DropDownList></td>
	</tr>
	<tr>
		<td width="150" align="right"  class="td_viewcontent_title">רҵ�����е�λ����:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_20_5" type="text" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>		
		<td width="150" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
	</tr>
</table>
<!--������Ϣ,����-->
<!--����,��ʼ-->
<div id="div_form" runat=server></div>
<!--����,����-->
<!--��̬����html,����-->
</form>
</body>
</html>
