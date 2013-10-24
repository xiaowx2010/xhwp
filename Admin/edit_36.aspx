<!--大气质量监测信息,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string dtable_1197, filter_1197, types_1197;
    string[]  flds_1197;
private void Page_Load(object sender, System.EventArgs e)
{    
     
    SetToolBar();//设置工具条,同时获取固定URL参数    
    dtable = "gmis_Mo_36";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_36_1", "fld_36_2", "fld_36_3", "creatorcode", "fld_36_4" };
    types = "00010";

    dtable_1197 = "gmis_mo_1197";
    flds_1197 = new string[] { "modulecode", "datamocode", "orgcode", "orgname", "featurecode", "typecode", "areacode", "rivercode" };
    types_1197 = "11001111";
    filter_1197 = "modulecode=" + mid + " and datamocode=" + id;
    
    if (!IsPostBack)
    {
        //先绑定列表
        creatorcode.Value = GetUID();//创建人ID

        if (id != "0")
        {//绑定所有值
            guangye.BindData(dtable, filter, flds);
            guangye.BindData(dtable_1197, filter_1197, flds_1197);
        }
    }   
 }
public override void BeforeSave()
{
    orgname.Value = fld_36_2.Value;
    modulecode.Value = mid;
    db.SqlString = "select top 1 typecode from gmis_type where modulecode=" + mid + " order by typeindex desc";
    DataTable dt_temp = db.GetDataTable();
    if (dt_temp != null && dt_temp.Rows.Count > 0)
    {
        if (dt_temp.Rows[0][0].ToString() != "")
            typecode.Value = dt_temp.Rows[0][0].ToString();
    }
    if (id == "0")
    {
        datamocode.Value = "@mocode";

        SetSESSION("sql", guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int;select @mocode=@@IDENTITY;" + guangye.GetInsertSql(dtable_1197, flds_1197, types_1197));

    }
    else
    {
        datamocode.Value = id;
        SetSESSION("sql", guangye.GetUpdateSql(dtable, filter, flds, types) + ";" + guangye.GetUpdateSql(dtable_1197, filter_1197, flds_1197, types_1197));

    }
    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
}
    
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<input id="creatorcode" runat="server" type="hidden" />
<input id="typecode" Value="0" type="hidden" runat="server"/>
<input id="modulecode" Value="0" type="hidden" runat="server"/>
<input id="datamocode" Value="0" type="hidden" runat="server"/>
<input id="orgcode" Value="" type="hidden" runat="server"/>
<input id="orgname" Value="" type="hidden" runat="server"/>
<input id="featurecode" Value="0" type="hidden" runat="server"/>
<input id="areacode" Value="0" type="hidden" runat="server"/>
<input id="rivercode" Value="0" type="hidden" runat="server"/>
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">Logger Id:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_36_1" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">Logger Name:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_36_2" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">Interval:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_36_3" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">导入时间:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_36_4" class="boxbline" style="width:160px;" type="text" runat="server" readonly>&nbsp;&nbsp;<G:GetDate id="get_fld_36_4" return="fld_36_4" runat="server" /></td>
		</tr>
	</table>
<!--动态生成html,结束-->
</form>
</body>
</html>
