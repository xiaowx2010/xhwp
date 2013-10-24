<!--数据管理-字段管理-环境监察信息管理-->
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
	dtable = "gmis_Mo_66";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_66_1", "fld_66_2", "fld_66_5", "fld_66_3", "fld_66_4", "fld_66_6", "creatorcode" ,"fld_66_7"};
  
    types = "00000010";
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
    if (fld_66_3.Value != "" && fld_66_4.Value != "")
    {
        if (Convert.ToDateTime(fld_66_3.Value) > Convert.ToDateTime(fld_66_4.Value))
        {
            SetSESSION("alert", "限期治理起始日期不能晚于限期治理截止日期");
            Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=66");
        }
    }
    CheckMustAndFieldType();
    string h_sql = "";
    if (id == "0")
    {
        h_sql += guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=" + mid + ";select @name=fld_17_2 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_66_7) + "';if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (@mid,@mocode,'" + guangye.GetControlValue(fld_66_7) + "',@name) end";
        //Response.Write(h_sql);
        SetSESSION("sql", h_sql);
    }
    else
    {
        SetSESSION("sql", guangye.GetUpdateSql(dtable, filter, flds, types) + ";declare @name as varchar(50);select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_66_7) + "';update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_66_7) + "',orgname=@name where datamocode=" + id + " and modulecode=" + mid + "");
    }
    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
}
private void Click_Search(object sender, System.EventArgs e)
{
    string scriptstr = "";
    if (guangye.GetControlValue(fld_66_7).Length > 0)
    {
        DataTable dtt = db.GetDataTable(db.ConnStr,"select fld_17_1 from gmis_mo_17 where fld_17_1 like '%"+fld_66_7.Value.Trim()+"%'");
        if (dtt.Rows.Count > 0)
        {
            alertmess.InnerText = "";
            scriptstr = "<scrip" + "t>__doOpenView('pop_27.aspx?mid=" + mid + "&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_66_7).Trim()) + "',800,600,10,50);</scrip" + "t>";
            Page.RegisterStartupScript("popwin", scriptstr);
        }
        else alertmess.InnerText = "找不到单位代码："+fld_66_7.Value.Trim();
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
	    <td class="td_viewcontent_content" width="35%">
		<input id="fld_66_7" class="boxbline" style="width:80%" type="text" runat="server" />&nbsp;&nbsp;
		<asp:LinkButton ID="btn_search" runat="server" OnClick="Click_Search"><img src="images/icons/search.gif" style="cursor:hand" title="查询" border="0" /></asp:LinkButton>
		</td>
	    <td align="right"  class="td_viewcontent_title">处理单位名称：</td>
	    <td class="td_viewcontent_content" width="35%" ><input id="fld_66_1" style="width:95%"  class="boxbline" type="text"  runat="server" /></td>
	   
    </tr>
    <tr>
     <td align="right"  class="td_viewcontent_title">案由：</td>
	    <td class="td_viewcontent_content" colspan="3"><input id="fld_66_2" class="boxbline"  style="width:98%" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">限期治理起始日期：</td>
	    <td class="td_viewcontent_content"><input id="fld_66_3" class="boxbline" style="width: 160px;" type="text" runat="server" readonly>&nbsp;&nbsp;<g:getdate id="get_fld_66_3" return="fld_66_3" runat="server" /></td>
     <td align="right"  class="td_viewcontent_title">实施要求：</td>
	    <td class="td_viewcontent_content"><input id="fld_66_5" class="boxbline"  style="width:95%"  type="text"  runat="server" /></td>
    </tr>
    
    
    <tr>
    	    <td align="right"  class="td_viewcontent_title">限期治理截至日期：</td>
	    <td class="td_viewcontent_content"><input id="fld_66_4" class="boxbline" style="width: 160px;" type="text" runat="server" readonly>&nbsp;&nbsp;<g:getdate id="get_fld_66_4" return="fld_66_4" runat="server" /></td>
	   
	    <td align="right"  class="td_viewcontent_title">核查情况：</td>
	    <td class="td_viewcontent_content"><input id="fld_66_6" class="boxbline"  style="width:95%"  type="text"  runat="server" /></td>
    </tr>
</table>
<!--动态生成结束-->
</form>
</body>
</html>