<!--�߽��������ŷ����,�鿴ҳ-->
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
    id = GetQueryString("id", "0");
    string fcode = GetQueryString("fcode", "");
    if (fcode != "")
    {
        tools.Visible = false;
    }
    string orgcode = GetQueryString("orgcode", "0");//Response.Write(orgcode);
    if (orgcode != "0")
    {
        filter = " and fld_35_7='" + orgcode + "'";
    }
    else
    {
        filter = " and mocode=" + id;
    }

    view.SqlStr = "select fld_35_1,fld_35_2,fld_35_3,cast(fld_35_4 AS VARCHAR(10))+'��',cast(fld_35_5 AS VARCHAR(10))+'��',fld_35_7,fld_35_6 from gmis_mo_35 where 1=1 " + filter;//,(select fld_17_1 from gmis_mo_17 where gmis_mo_17.mocode=fld_35_7)
    //Response.Write(view.SqlStr);

    if (id != "0")
    {
        orgcode = view.DataTable.Rows[0]["fld_35_7"].ToString();
    }
    
 }
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->

<div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar_17.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--��̬����html,��ʼ-->

<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">����Դ����:</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ҹ��Ч����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">ҹ���ֵ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">�·�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��λ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title">��ȾԴ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		</tr>
	</table>
</G:Template>
</G:Content>
<!--��̬����html,����-->
</form>
</body>
</html>
