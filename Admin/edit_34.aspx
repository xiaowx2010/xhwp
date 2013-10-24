<!--数据管理-字段管理-噪声排放源-->
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
	dtable = "gmis_Mo_34";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_34_1", "fld_34_2", "fld_34_3", "fld_34_4", "fld_34_5", "fld_34_6", "creatorcode" };
  
    types = "0110001";
    if (!IsPostBack) 
    {
        //先绑定列表
        creatorcode.Value = GetUID();//创建人ID

        //管辖权属
        BindListControl(fld_34_3,"mocode","fld_44_1","select mocode,fld_44_1 from gmis_mo_44","请选择");
        SetFilter(fld_34_3,"0");
        //所属区域
        BindListControl(fld_34_2,"mocode","fld_1201_1","select mocode,fld_1201_1 from gmis_mo_1201","请选择");
        SetFilter(fld_34_2, "0");
        
        
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
	    <td align="right"  class="td_viewcontent_title">污染源名称：</td>
	    <td class="td_viewcontent_content"><input id="fld_34_1" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">所属区域：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_34_2" runat="server" Width="150"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">管辖权属：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList id="fld_34_3" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">声源名称：</td>
	    <td class="td_viewcontent_content"><input id="fld_34_4" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">声源编号：</td>
	    <td class="td_viewcontent_content"><input id="fld_34_5" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">声源位置：</td>
	    <td class="td_viewcontent_content"><input id="fld_34_6" class="boxbline" type="text" runat="server" /></td>
    </tr>
</table>
<!--动态生成结束-->
</form>
</body>
</html>