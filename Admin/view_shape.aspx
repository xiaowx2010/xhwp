<!--图形数据,查看页-->
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
	mid = GetQueryString("mid", "0");
	id = GetQueryString("id", "0");

	SetToolBar();//设置工具条,同时获取固定URL参数 
	view.SqlStr = "select Featurename,t.typename,Featurebrief,case when Featurestate = 0 then '启用' when Featurestate = -1 then '禁用' when Featurestate = 1 then '隐藏' else '&nbsp;' end as Featurestate,Featuredepth,Featuredesc from gmis_Feature f Left Outer Join gmis_type t on f.typecode=t.typecode where Featurecode="+id;
   
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
<!--动态生成html,开始-->
<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr> 
        <td  class="td_viewcontent_title" align="right">图形名：</td>
        <td  class="td_viewcontent_content" colspan="3">&nbsp;*</td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" width="160" align="right">所属层：</td> 
        <td class="td_viewcontent_content" width="200">&nbsp;*</td>               
        <td class="td_viewcontent_title"  width="160" align="right">简称：</td>
        <td  class="td_viewcontent_content" width="200">&nbsp;*</td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">状态：</td>
        <td class="td_viewcontent_content">&nbsp;*</td>
        <td class="td_viewcontent_title" align="right">深度：</td>
        <td class="td_viewcontent_content">&nbsp;*</td>
    </tr>
    <tr>
        <td class="td_viewcontent_title" align="right">介绍：</td>
        <td class="td_viewcontent_content" colspan="3"><div style="width:500px;overflow-x:auto">&nbsp;*<div></td>
    </tr>
</table>
</G:Template>
</G:Content>
<!--动态生成html,结束-->
</form>
</body>
</html>
