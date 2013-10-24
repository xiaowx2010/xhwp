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
			view.SqlStr = "select deptname from gmis_dept where deptcode="+id;
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
        <td align="right"  class="td_viewcontent_title">部门名称：</td>
        <td class="td_viewcontent_content">*</td>
        <td align="right"  class="td_viewcontent_title">状态：</td>
        <td class="td_viewcontent_content">*</td>
    </tr>
    <tr> 
        <td align="right"  class="td_viewcontent_title">说明：</td>
        <td class="td_viewcontent_content" colspan="3">*</td>
    </tr>
</table>
</G:Template>                    
</G:Content>                                
</form>
</body>
</html>
