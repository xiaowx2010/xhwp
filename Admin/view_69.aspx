<!--���ݹ���-�ֶι���-��������-->
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
   
    view.SqlStr = "select fld_69_1 from gmis_mo_69 where mocode=" + id;
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
	    <td align="right" width="100"  class="td_viewcontent_title">�������ͣ�</td>
	    <td width="35%" class="td_viewcontent_content">*&nbsp;</td>
	       <td align="right"  width="100" class="td_viewcontent_title">&nbsp;</td>
	    <td width="35%" class="td_viewcontent_content">&nbsp;</td>

    </tr>
    
</table>
</G:Template> 
</G:Content> 
<!--��̬���ɽ���-->
</form>
</body>
</html>