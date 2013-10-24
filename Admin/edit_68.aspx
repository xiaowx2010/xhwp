<!--数据管理-字段管理-信访投诉信息管理-->
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
	dtable = "gmis_Mo_68";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_68_1", "fld_68_2", "fld_68_3", "fld_68_4", "creatorcode","fld_68_5" };
  
    types = "000010";
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
        h_sql += guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=" + mid + ";select @name=fld_17_2 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_68_5) + "';if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (@mid,@mocode,'" + guangye.GetControlValue(fld_68_5) + "',@name) end";
        //Response.Write(h_sql);
        SetSESSION("sql", h_sql);
    }
    else
    {
        SetSESSION("sql", guangye.GetUpdateSql(dtable, filter, flds, types) + ";declare @name as varchar(50);select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_68_5) + "';update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_68_5) + "',orgname=@name where datamocode=" + id + " and modulecode=" + mid + "");
    }
    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
}

private void Click_Search(object sender, System.EventArgs e)
{
    string scriptstr = "";
    if (guangye.GetControlValue(fld_68_5).Length > 0)
    {
        DataTable dtt = db.GetDataTable(db.ConnStr,"select fld_17_1 from gmis_mo_17 where fld_17_1 like '%"+fld_68_5.Value.Trim()+"%'");
        if (dtt.Rows.Count > 0)
        {
            alertmess.InnerText = "";
            scriptstr = "<scrip" + "t>__doOpenView('pop_27.aspx?mid=" + mid + "&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_68_5).Trim()) + "',800,600,10,50);</scrip" + "t>";
            Page.RegisterStartupScript("popwin", scriptstr);
        }
        else alertmess.InnerText = "找不到单位代码："+fld_68_5.Value.Trim();
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
	    <td class="td_viewcontent_content" style="width:35%">
			<input id="fld_68_5" class="boxbline" style="width:80%" type="text" runat="server" />&nbsp;&nbsp;
			<asp:LinkButton ID="btn_search" runat="server" OnClick="Click_Search"><img src="images/icons/search.gif" style="cursor:hand" title="查询" border="0" /></asp:LinkButton>
		
		</td>

	    <td align="right"  class="td_viewcontent_title">被投诉单位名称：</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_68_1" class="boxbline" style="width:95%" type="text" runat="server" /></td>
    </tr>
    <tr>	    
    <td align="right"  class="td_viewcontent_title">投诉日期：</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_68_2" class="boxbline" style="width: 160px;" type="text" runat="server" readonly>&nbsp;&nbsp;<g:getdate id="get_fld_68_2" return="fld_68_2" runat="server" /></td>
    <td align="right"  class="td_viewcontent_title">&nbsp;</td>
	    <td class="td_viewcontent_content" style="width:35%">&nbsp;</td>

</tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">投诉内容：</td>
	    <td colspan="3" class="td_viewcontent_content"><textarea id="fld_68_3" class="boxbline" style="width: 98%; height: 50px;" runat="server"></textarea></td></tr>
   <tr>
        <td align="right"  class="td_viewcontent_title">查处情况：</td>
        <td colspan="3" class="td_viewcontent_content"><g:editor id="fld_68_4" height="100" toolbarset="Basic" width="100%" basepath="Common/Editor/" runat="server" /></td>
    </tr>
</table>
<!--动态生成结束-->
</form>
</body>
</html>