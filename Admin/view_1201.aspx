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

        view.SqlStr = "select fld_1201_1,fld_1201_6,fld_1201_2,(select fld_1201_1 from gmis_mo_1201 a where a.mocode=b.fld_1201_3),fld_1201_7 from gmis_mo_1201 b where mocode=" + id;
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
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<td width="100%" align="right">
			    <G:Button id="btn_edit" type="toolbar" mode="on" text="内容管理" onclick="Edit_Click" runat="server"></G:Button>
			</td>
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<table>
    <tr>
        <td width="150px">
            <iframe id="frmTree" src="view_1201managetree.aspx?id=<%=id%>" width="150" height="400" frameborder="0" scrolling="no"></iframe>
        </td>
        <td width="100%" valign="top">
<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:10px;">
	<tr>
		<td nowrap align="right"  class="td_viewcontent_title">区域名称:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td nowrap align="right"  class="td_viewcontent_title">行政区域代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td nowrap align="right"  class="td_viewcontent_title">层级:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td nowrap align="right"  class="td_viewcontent_title">直属上级:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
        <tr>
            <td nowrap align="right"  class="td_viewcontent_title">说明:</td>
            <td colspan="3" class="td_viewcontent_content" ><div style="height:328px; overflow:hidden;">*&nbsp;</div></td>
        </tr>
	</table>
</G:Template>
</G:Content>
</td></tr></table>
<!--动态生成html,结束-->
</form>
</body>
</html>
