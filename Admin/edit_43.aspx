<!--数据管理-字段模块-所在街道乡镇-->
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
	dtable = "gmis_Mo_43";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_43_1" ,"creatorcode"};
    mflds = new string[] { "所在乡镇|fld_43_1" };
    types = "01";
    if (!IsPostBack) {//先绑定列表
        creatorcode.Value = GetUID();//创建人ID
		if(id != "0"){//绑定所有值
		    guangye.BindData(dtable,filter,flds);
		}
        
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
<input id="creatorcode" runat="server" type="hidden" />
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
	<tr>
	    <td align="right"  class="td_viewcontent_title">所在乡镇：</td>
	    <td colspan="3" class="td_viewcontent_content"><input id="fld_43_1" style="width:95%;" class="boxbline" type="text" runat="server" /></td>
    </tr>
</table>
<!--动态生成结束-->
</form>
</body>
</html>