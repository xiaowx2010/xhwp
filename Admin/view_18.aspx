<!--��ˮ�ŷſڼ��,�鿴ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->

<!--
����gmis_mo_18
������gmis_mo_53��������������gmis_mo_53.fld_53_1=gmis_mo_18.fld_18_1��gmis_mo_53.fld_53_2=gmis_mo_18.fld_18_2��gmis_mo_53.fld_53_3=gmis_mo_18.fld_18_8��
-->
<script language="C#" runat="server">
    DataTable p_wrwdt; string hycode = "";//��ҵ
private void Page_Load(object sender, System.EventArgs e)
{

    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
    string orgcode = GetQueryString("orgcode", "0"); //��ȡ��λ����
    string h_fcode = GetQueryString("fcode", "0");
    if (h_fcode != "0" && h_fcode!="")
    {
        tb_backlist.Visible = false;
    }
    if (orgcode != "0")
    {
        filter = " and fld_53_3='" + orgcode + "'";
        db.SqlString = "select mocode from gmis_mo_18 where fld_18_8=(select fld_53_3 from gmis_mo_53 where 1=1 " + filter + ")";
        
        if (db.GetDataTable().Rows.Count > 0)
        {
            id = db.GetDataTable().Rows[0][0].ToString();
        }
    }
    
    view.SqlStr = "select fld_53_3,fld_53_4,fld_53_1,fld_53_2,'' as wrw,Convert(nvarchar(10),fld_18_3,120),fld_18_4,fld_18_7,fld_53_11 from gmis_mo_18 left outer join gmis_mo_53 on fld_18_8=fld_53_3 and fld_18_1=fld_53_1 where gmis_mo_18.mocode=" + id;

	DataTable h_wrwdt = db.GetDataTable(db.ConnStr,"select mocode,(select fld_1205_1 from gmis_mo_1205 where mocode = fld_21_2) as wrwname from gmis_mo_21 where fld_21_3=(select fld_18_8 from gmis_mo_18 where mocode="+id+")");//��ȡ����ע���Ѵ�����Ⱦ��

	DataTable dt = view.DataTable;
	if (h_wrwdt != null && dt.Rows.Count>0 && h_wrwdt.Rows.Count>0)
	{		
		if(dt.Rows[0]["fld_53_11"].ToString().Trim(';')!= "")
		{
			string[] h_code = dt.Rows[0]["fld_53_11"].ToString().Trim(';').Split(';');
			if (h_code.Length>0)
			{
				for (int i=0;i<h_code.Length;i++)
				{
					DataRow[] h_wrwdr = h_wrwdt.Select("mocode="+h_code[i]+"");
					if(h_wrwdr.Length>0)
					{					
						dt.Rows[0]["wrw"] += h_wrwdr[0]["wrwname"].ToString()+",";								
					}
				}
				dt.Rows[0]["wrw"] = dt.Rows[0]["wrw"].ToString().Trim(',');
			}
		}

       
	}

    if (id!="0"&&dt != null && dt.Rows.Count > 0)
    {
        iframe_17.Attributes["src"] = "iframe_658.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(dt.Rows[0]["fld_53_3"].ToString()) + "&fcode=" + h_fcode;
    }else
        iframe_17.Attributes["src"] = "iframe_658.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&fcode=" + h_fcode;

}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td>
<iframe id="iframe_17"  runat="server" frameborder="0"  width="100%" height="30" scrolling="no"></iframe>
</td></tr></table>
<div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar_17.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--����������-->
<!--��̬����html,��ʼ-->
<!--�ŷſڼ����Ϣ-->
<G:Content id="view" runat="server">
<G:Template id="tmpview" runat="server">
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="margin-top: 10px;"> 
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">��λ����:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
		<td width="100" align="right" class="td_viewcontent_title">��λ����:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr> 
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">�ŷſڴ���:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
		<td width="100" align="right" class="td_viewcontent_title">�ŷſ�����:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">��Ⱦ������:</td>
		<td colspan="3" class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">�������:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
		<td width="100" align="right" class="td_viewcontent_title">����ʱ��:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">��ˮ���Ũ��:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
		<td width="100" align="right" class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width: 35%">&nbsp;</td>
	</tr>	
</table>
</G:Template>
</G:Content>
<!--�ŷſڼ����Ϣ-->	
<!--��̬����html,����-->
</form>
</body>
</html>
