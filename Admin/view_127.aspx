<!--�����ŷſ���Ⱦ���嵥,�鿴ҳ-->
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
     
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
    string orgcode = GetQueryString("orgcode", "0");//Response.Write(orgcode);
    string fcode = GetQueryString("fcode", "");
    if (fcode != "")
    {
        tools.Visible = false;
    }
    if (orgcode != "0")
    {
        filter = " and fld_127_6='" + orgcode + "'";
    }
    else
    {
        filter = " and mocode=" + id;
    }
    view.SqlStr = "select fld_" + mid + "_6,fld_" + mid + "_1,(select fld_55_1 from gmis_mo_55 where mocode=fld_" + mid + "_2),(select fld_1206_1 from gmis_mo_1206 where mocode=fld_" + mid + "_4),fld_" + mid + "_3,fld_" + mid + "_5,mocode from gmis_mo_" + mid + " where 1=1 " + filter;
    if (id != "0")
    {
        orgcode = view.DataTable.Rows[0]["fld_127_6"].ToString();
    }
    else
        id = view.DataTable.Rows[0]["mocode"].ToString();
    iframe_17.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&fcode=" + fcode + "&id=" + id;
     
 }
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
<div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar_17.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--����������-->
<!--��̬����html,��ʼ-->
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td>
<iframe id="iframe_17"  runat="server" frameborder="0"  width="100%" height="30" scrolling="no"></iframe>
</td></tr></table>
<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��λ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">�ŷſڱ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">������Ⱦ�����:</td>
		<td colspan="3" class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��Ⱦ������:</td>
		<td class="td_viewcontent_content" >*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title">��Ⱦ�����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��Ⱦ���ŷű�׼:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
		</tr>
	</table>
</G:Template>
</G:Content>
<!--��̬����html,����-->
</form>
</body>
</html>
