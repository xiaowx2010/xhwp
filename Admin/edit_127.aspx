<!--废气排放口污染物清单,编辑页-->
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
    dtable = "gmis_mo_" + mid + "";
    mflds = new string[] { "排放口编号|fld_127_1" };
    flds = new string[] { "fld_" + mid + "_1", "fld_" + mid + "_2", "fld_" + mid + "_3", "fld_" + mid + "_4", "fld_" + mid + "_5","fld_"+mid+"_6"};
    types = "010000";
    filter = "mocode=" + id;
    if (!IsPostBack)
    {
        BindListControl(fld_127_2, "mocode", "fld_55_1", "select mocode,fld_55_1 from gmis_mo_55", "----请选择类别----");
        BindListControl(fld_127_4, "mocode", "fld_1206_1", "select mocode,fld_1206_1 from gmis_mo_1206");
        //fld_127_3.Value = fld_127_4.SelectedItem.Value;
        SetFilter(fld_127_2,"0");
        BindListControl(fld_127_6,"fld_17_1","fld_17_1","select distinct fld_17_1 from gmis_mo_17");
        if (id != "0")
        {
            guangye.BindData(dtable, filter, flds);
        }
    }
    if (fld_127_4.SelectedItem != null)
    {
        db.SqlString = "select fld_1206_2 from gmis_mo_1206 where mocode=" + fld_127_4.SelectedItem.Value;

        DTsql = db.GetDataTable();
        if (DTsql != null && DTsql.Rows.Count > 0)
            fld_127_3.Value = DTsql.Rows[0][0].ToString();
    }  
 }
public override void BeforeSave()
{
    CheckMustAndFieldType();
    string h_sql = "";
    string h_typecode = "0";
    db.SqlString = "select top 1 typecode from gmis_type where modulecode=" + mid + " order by typeindex desc";
    DataTable dt_temp = db.GetDataTable();
    if (dt_temp != null && dt_temp.Rows.Count > 0)
    {
        if (dt_temp.Rows[0][0].ToString() != "")
            h_typecode = dt_temp.Rows[0][0].ToString();
    }
    if (id == "0")
    {
        h_sql += guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=" + mid + ";select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_127_6) + "';if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname,typecode,areacode,rivercode) values (@mid,@mocode,'" + guangye.GetControlValue(fld_127_6) + "',@name,"+h_typecode+",0,0) end";
        //Response.Write(h_sql);
        SetSESSION("sql", h_sql);
    }
    else
    {
        SetSESSION("sql", guangye.GetUpdateSql(dtable, filter, flds, types) + ";declare @name as varchar(50);select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_127_6) + "';update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_127_6) + "',orgname=@name,typecode="+h_typecode+",areacode=0,rivercode=0 where datamocode=" + id + " and modulecode=" + mid + "");
    }
    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
}

    private void selectchanged(object sender, System.EventArgs e)
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
<!--动态生成html,开始-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">单位代码:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList id="fld_127_6" class="boxbline" style="width:95%;"   runat="server" /></td>
		
		<td width="100" align="right"  class="td_viewcontent_title"><font color="#ff6600">*</font>排放口编号:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_127_1" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">废气污染物类别:</td>
		<td colspan="3" class="td_viewcontent_content" style="width:35%"><asp:DropDownList ID="fld_127_2" runat="server" style="width:98%;"></asp:DropDownList></td>
		
		
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">污染物名称:</td>
		<td class="td_viewcontent_content" ><asp:DropDownList ID="fld_127_4" Width="160px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="selectchanged"></asp:DropDownList></td>
		<td width="100" align="right"  class="td_viewcontent_title">污染物代码:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_127_3" readonly class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">污染物排放标准:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_127_5" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
		</tr>
	</table>
<!--动态生成html,结束-->
</form>
</body>
</html>
