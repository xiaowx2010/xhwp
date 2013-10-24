<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
	<script runat=server language=C#>
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!IsSystemDeveloper())
			{
				Response.Redirect("getpage.aspx");
			}
			SetToolBar();//设置工具条,同时获取固定URL参数    
			dtable = "gmis_Action";
			filter = " ActionCode="+id;
			flds = new string[]{"actionname","actionlink"};
			mflds = new string[]{"操作名|actionname"};
			types = "00";
			
			if (!IsPostBack)
			{
				if(id != "0")//绑定所有值
					guangye.BindData(dtable,filter,flds);
			}
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
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
      <td align="right"  class="td_viewcontent_title">操作名：</td>
      <td class="td_viewcontent_content"><input id="actionname" type="text" style="width:160px" maxlength="100" runat="server"></td>
      <td align="right"  class="td_viewcontent_title">外部链接：</td>
      <td class="td_viewcontent_content"><input id="actionlink" type="text" style="width:160px" maxlength="20" runat="server"></td>
    </tr> 
</table>
</form>
</body>
</html>
