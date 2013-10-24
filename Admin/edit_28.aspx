<!--数据管理-字段管理-主要产品及原辅材料-->
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
	dtable = "gmis_Mo_28";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_28_1", "fld_28_2", "fld_28_3", "fld_28_4", "fld_28_5", "fld_28_6", "fld_28_7", "fld_28_8", "fld_28_9", "fld_28_10", "fld_28_11", "creatorcode" ,"fld_28_12"};
  
    types = "0000011000010";
    if (!IsPostBack) 
    {
        //先绑定列表
        creatorcode.Value = GetUID();//创建人ID
		if(id != "0"){//绑定所有值
		    guangye.BindData(dtable,filter,flds);
		}
    }   
}

//保存之前的数据处理
public override void BeforeSave()
{
    CheckMustAndFieldType();
    string h_sql = "";
    if (id == "0")
    {
        h_sql += guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=" + mid + ";select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_28_12) + "';if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (@mid,@mocode,'" + guangye.GetControlValue(fld_28_12) + "',@name) end";
        //Response.Write(h_sql);
        SetSESSION("sql", h_sql);
    }
    else
    {
        SetSESSION("sql", guangye.GetUpdateSql(dtable, filter, flds, types) + ";declare @name as varchar(50);select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_28_12) + "';update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_28_12) + "',orgname=@name where datamocode=" + id + " and modulecode=" + mid + "");
    }
    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
}
private void Click_Search(object sender, System.EventArgs e)
{
    string scriptstr = "";
    if (guangye.GetControlValue(fld_28_12).Length > 0)
    {
        DataTable dtt = db.GetDataTable(db.ConnStr, "select fld_17_1 from gmis_mo_17 where fld_17_1 like '%" + fld_28_12.Value.Trim() + "%'");
        if (dtt.Rows.Count > 0)
        {
            alertmess.InnerText = "";
            scriptstr = "<scrip" + "t>__doOpenView('pop_27.aspx?mid=" + mid + "&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_28_12).Trim()) + "',800,600,10,50);</scrip" + "t>";
            Page.RegisterStartupScript("popwin", scriptstr);
        }
        else alertmess.InnerText = "找不到单位代码：" + fld_28_12.Value.Trim();
    }
    else alertmess.InnerText = "请输入查询数据！";
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
	    <td align="right"  class="td_viewcontent_title">单位代码：</td>
	    <td class="td_viewcontent_content" width="35%"><input id="fld_28_12" style="width:85%" class="boxbline" type="text" runat="server" />&nbsp;&nbsp;<asp:LinkButton ID="btn_search" runat="server" OnClick="Click_Search"><img src="images/icons/search.gif" style="cursor:hand" title="查询" border="0" /></asp:LinkButton></td>
	    <td align="right"  class="td_viewcontent_title">主要产品编号：</td>
	    <td class="td_viewcontent_content" width="35%"><input id="fld_28_1" style="width:95%" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title"><span style="color:Red">*</span>主要产品名称：</td>
	    <td class="td_viewcontent_content"><input id="fld_28_2" class="boxbline"  style="width:95%"  type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">工艺名称：</td>
	    <td class="td_viewcontent_content"><input id="fld_28_3" class="boxbline"  style="width:95%"  type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">设备名称：</td>
	    <td class="td_viewcontent_content"><input id="fld_28_4" class="boxbline"  style="width:95%"  type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">设备型号：</td>
	    <td class="td_viewcontent_content"><input id="fld_28_5" class="boxbline"  style="width:95%"  type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">日工作小时：</td>
	    <td class="td_viewcontent_content"><input id="fld_28_6" class="boxbline"  style="width:95%"  type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">年工作天数：</td>
	    <td class="td_viewcontent_content"><input id="fld_28_7" class="boxbline"  style="width:95%"  type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">设计年产量：</td>
	    <td class="td_viewcontent_content"><input id="fld_28_8" class="boxbline"  style="width:95%"  type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">实际年产量：</td>
	    <td class="td_viewcontent_content"><input id="fld_28_9" class="boxbline"  style="width:95%"  type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">原辅材料名称：</td>
	    <td class="td_viewcontent_content"><input id="fld_28_10" class="boxbline"  style="width:95%"  type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">年消耗量</td>
	    <td class="td_viewcontent_content"><input id="fld_28_11" class="boxbline"  style="width:95%"  type="text" runat="server" /></td>
    </tr>
</table>
<!--动态生成结束-->
</form>
</body>
</html>