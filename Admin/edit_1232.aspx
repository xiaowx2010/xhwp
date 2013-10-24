<!--高级查询,编辑页-->
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
     
    SetToolBar();//设置工具条,同时获取固定URL参数    
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
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">模版名称:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1232_1" class="boxbline" style="width:95%;"  maxlength="200" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">查询条件:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1232_2" class="boxbline" style="width:95%;"  maxlength="2000" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">排序条件:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1232_3" class="boxbline" style="width:95%;"  maxlength="2000" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">显示字段:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1232_4" class="boxbline" style="width:95%;"  maxlength="2000" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">模块ID:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1232_5" class="boxbline" style="width:95%;"  maxlength="4" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">查询条件字段:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1232_6" class="boxbline" style="width:95%;"  maxlength="2000" runat="server" ></td>
		</tr>
	</table>
<!--动态生成html,结束-->
</form>
</body>
</html>
