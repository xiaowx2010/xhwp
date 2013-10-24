<!--数据管理-字段管理-固体废物生产与处置信息管理-->
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
	dtable = "gmis_Mo_30";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_30_1", "fld_30_2", "fld_30_3", "fld_30_4", "fld_30_5", "fld_30_6", "fld_30_7", "fld_30_8", "fld_30_9", "fld_30_10", "fld_30_11", "fld_30_12", "fld_30_13", "creatorcode" };
  
    types = "00000000010001";
    if (!IsPostBack) 
    {
        //先绑定列表
        creatorcode.Value = GetUID();//创建人ID
        
        //处理类型
        BindListControl(fld_30_10,"mocode","fld_63_1","select mocode,fld_63_1 from gmis_mo_63","请选择");
        SetFilter(fld_30_10,"0");
        
		if(id != "0"){//绑定所有值
		    guangye.BindData(dtable,filter,flds);
		}
    }   
}

//保存之前的数据处理
public override void BeforeSave()
{
    
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
	    <td align="right"  class="td_viewcontent_title">废物类别编号：</td>
	    <td class="td_viewcontent_content"><input id="fld_30_1" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">废物产生源：</td>
	    <td class="td_viewcontent_content"><input id="fld_30_2" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">形态：</td>
	    <td class="td_viewcontent_content"><input id="fld_30_3" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">年废物产生量：</td>
	    <td class="td_viewcontent_content"><input id="fld_30_4" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">含水量：</td>
	    <td class="td_viewcontent_content"><input id="fld_30_5" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">历年存贮量</td>
	    <td class="td_viewcontent_content"><input id="fld_30_6" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">废物去向：</td>
	    <td class="td_viewcontent_content"><input id="fld_30_7" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">处理单位名称：</td>
	    <td class="td_viewcontent_content"><input id="fld_30_8" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">地址：</td>
	    <td colspan="3" class="td_viewcontent_content"><input id="fld_30_9" style="width:95%" class="boxbline" type="text" runat="server" /></td>
	</tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">处理类型：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_30_10" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">处理方法</td>
	    <td class="td_viewcontent_content"><input id="fld_30_11" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">处理设施名称：</td>
	    <td class="td_viewcontent_content"><input id="fld_30_12" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">处理能力</td>
	    <td class="td_viewcontent_content"><input id="fld_30_13" class="boxbline" type="text" runat="server" /></td>
    </tr>
</table>
<!--动态生成结束-->
</form>
</body>
</html>