<!--���ݹ���-�ֶ�ģ��-��ҵ���-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
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
    view.SqlStr ="select fld_45_1 as ��������,'�� '+cast(fld_45_2 as varchar(50))+' ��',case when fld_45_3=0 then '&nbsp;' else (select fld_45_1 from gmis_mo_45 t1 where t1.mocode=t2.fld_45_3 ) end as ֱ���ϼ� from gmis_mo_45 t2 where mocode="+id+" ";
    
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
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--����-->
<G:Content ID="view" runat="server">
<G:Template id="tempview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="right"  class="td_viewcontent_title">��ҵ���</td>
	    <td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
		<td width="100" align="right"  class="td_viewcontent_title">�㼶:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">ֱ���ϼ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	</tr>	
</table>
</G:Template> 
</G:Content> 
<!--��̬���ɽ���-->
</form>
</body>
</html>