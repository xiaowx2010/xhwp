<!--数据管理-字段模块-行业类别-->
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
    view.SqlStr ="select fld_45_1 as 分类名称,'第 '+cast(fld_45_2 as varchar(50))+' 级',case when fld_45_3=0 then '&nbsp;' else (select fld_45_1 from gmis_mo_45 t1 where t1.mocode=t2.fld_45_3 ) end as 直属上级 from gmis_mo_45 t2 where mocode="+id+" ";
    
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
        <td align="right"  class="td_viewcontent_title">行业类别：</td>
	    <td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
		<td width="100" align="right"  class="td_viewcontent_title">层级:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">直属上级:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	</tr>	
</table>
</G:Template> 
</G:Content> 
<!--动态生成结束-->
</form>
</body>
</html>