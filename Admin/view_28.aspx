<!--数据管理-字段管理-主要产品及原辅材料-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string hycode = "";//行业
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();//设置工具条,同时获取固定URL参数
    string h_fcode = GetQueryString("fcode", "0");
    if (h_fcode != "" && h_fcode!="0")
    {
        tools.Visible = false;
    }
    string orgcode = GetQueryString("orgcode", "0");//Response.Write(orgcode);
    if (orgcode != "0")
    {
        filter = " and fld_28_12='" + orgcode + "'";
    }
    else
    {
        filter = " and mocode=" + id;
    }
    view.SqlStr = "select fld_28_12,fld_28_1,fld_28_2,fld_28_3,fld_28_4,fld_28_5,fld_28_6,fld_28_7,fld_28_8,fld_28_9,fld_28_10,fld_28_11 from gmis_mo_28 where 1=1 " + filter;
    if (id!="0"&&view.DataTable != null && view.DataTable.Rows.Count > 0)
    {
        iframe_17.Attributes["src"] = "iframe_658.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(view.DataTable.Rows[0]["fld_28_12"].ToString()) + "&fcode=" + h_fcode;
    }else
        iframe_17.Attributes["src"] = "iframe_658.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&fcode=" + h_fcode;
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td>
<iframe id="iframe_17"  runat="server" frameborder="0"  width="100%" height="30" scrolling="no"></iframe>
</td></tr></table>
 <div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar_17.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
	   </div>
<!--操作工具条-->
<!--内容-->
<G:Content ID="view" runat="server">
<G:Template id="tempview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
	    <td align="right"  class="td_viewcontent_title">单位代码：</td>
	    <td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">主要产品编号：</td>
	    <td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">主要产品名称：</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">工艺名称：</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">设备名称：</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">设备型号：</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">日工作小时：</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">年工作天数：</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">设计年产量：</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">实际年产量：</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">原辅材料名称：</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">年消耗量</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
</G:Template> 
</G:Content> 
<!--动态生成结束-->
</form>
</body>
</html>