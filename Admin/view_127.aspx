<!--废气排放口污染物清单,查看页-->
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
    string orgcode = GetQueryString("orgcode", "0");//Response.Write(orgcode);
    string fcode = GetQueryString("fcode", "");
    if (fcode != "")
    {
        tools.Visible = false;
    }
    if (orgcode != "0")
    {
        filter = " and fld_127_6='" + orgcode + "'";
    }
    else
    {
        filter = " and mocode=" + id;
    }
    view.SqlStr = "select fld_" + mid + "_6,fld_" + mid + "_1,(select fld_55_1 from gmis_mo_55 where mocode=fld_" + mid + "_2),(select fld_1206_1 from gmis_mo_1206 where mocode=fld_" + mid + "_4),fld_" + mid + "_3,fld_" + mid + "_5,mocode from gmis_mo_" + mid + " where 1=1 " + filter;
    if (id != "0")
    {
        orgcode = view.DataTable.Rows[0]["fld_127_6"].ToString();
    }
    else
        id = view.DataTable.Rows[0]["mocode"].ToString();
    iframe_17.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&fcode=" + fcode + "&id=" + id;
     
 }
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
<div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar_17.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--操作工具条-->
<!--动态生成html,开始-->
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td>
<iframe id="iframe_17"  runat="server" frameborder="0"  width="100%" height="30" scrolling="no"></iframe>
</td></tr></table>
<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">单位代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">排放口编号:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">废气污染物类别:</td>
		<td colspan="3" class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">污染物名称:</td>
		<td class="td_viewcontent_content" >*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title">污染物代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">污染物排放标准:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
		</tr>
	</table>
</G:Template>
</G:Content>
<!--动态生成html,结束-->
</form>
</body>
</html>
