<!--行政区域,查看页-->
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
        mid = GetQueryString("mid", "0");
        id = GetQueryString("id", "0");
        tb_2.Visible = false;
        tb_backlist.Visible = false;
        view.SqlStr = "select fld_1201_1,fld_1201_6,fld_1201_7 from gmis_mo_1201 b where mocode=" + id;
        //Response.Write(view.SqlStr);
    }
    private void Edit_Click(object sender, System.EventArgs e)
    {
        Response.Redirect("getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id);
    }
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
<div id="tools" runat="server" visible="false">
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--操作工具条-->
<!--动态生成html,开始-->
<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline1" style="margin-top:10px;">
	<tr>
		<td nowrap align="right" class="tr_listtitle1" style="background-color:#8DD4CA;color:#20554E;">区域名称:</td>
		<td style="width:35%" class="tr_listcontent">*&nbsp;</td>
		
		<td nowrap align="right" class="tr_listtitle1"  style="background-color:#8DD4CA;color:#20554E;">行政区域代码:</td>
		<td style="width:35%" class="tr_listcontent">*&nbsp;</td>
	</tr>
    <tr >
        <td nowrap class="tr_listtitle1" align="right" style="background-color:#8DD4CA;color:#20554E;" >说明:</td>
        <td colspan="3" style="height:328px; overflow:hidden;" class="tr_listcontent">*&nbsp;</td>
    </tr>
</table>
</G:Template>
</G:Content>
<!--动态生成html,结束-->
</form>
</body>
</html>
