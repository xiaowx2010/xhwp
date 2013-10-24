<!--数据管理-字段模块-所属行业-->
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
    SetToolBar();//设置工具条,同时获取固定URL参数
    view.SqlStr = "select fld_46_1,fld_46_2,(select fld_45_1 from gmis_mo_45 where gmis_mo_45.mocode=fld_46_4),(select fld_45_1 from gmis_mo_45 where gmis_mo_45.mocode=fld_46_5) from gmis_mo_46 where mocode=" + id + " ";
    
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--内容-->
<G:Content ID="view" runat="server">
<G:Template id="tempview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="right"  class="td_viewcontent_title">行业名称：</td>
	    <td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title">行业代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	</tr>	
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">行业大类:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title">行业小类:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	</tr>	
</table>
</G:Template> 
</G:Content> 
<!--动态生成结束-->
</form>
</body>
</html>