<!--行政区域,列表页-->
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
    string h_fstr = "";

    if (!IsPostBack)
    {
        BindListControl(fld_1201_2, "fld_1201_2", "fld_1201_2_index", "select distinct fld_1201_2,('第 '+cast(fld_1201_2 as varchar(10))+' 级') as fld_1201_2_index from gmis_mo_1201", "全部层级");
        if (GetSESSION("filter") != "")
        {
            SetFilter(fld_1201_2, GetSESSION("filter"));
        }
        else
        SetFilter(fld_1201_2, "0");
    }

    if (fld_1201_2.SelectedItem != null && fld_1201_2.SelectedItem.Value != "0")
    {
        h_fstr += " and fld_1201_2=" + fld_1201_2.SelectedItem.Value;
    }
     
    int pagesize = GetListRows();//获取列表每页显示的记录数
    int fromcount = Convert.ToInt32(navindex) * pagesize;//计算已翻过页数的记录数
    list.Rows = pagesize;

   list.SqlStr = "declare @allcount int;select @allcount=count(1) from gmis_mo_1201 where 1=1 " + h_fstr + " ;select   @allcount as allcount,'' as preTopic,'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_1201_1,'&nbsp;' as btnstr,fld_1201_2 from gmis_mo_1201 where mocode in (select top " + (fromcount + pagesize) + " mocode from gmis_mo_1201 where 1=1 " + h_fstr + " order by fld_1201_5) and mocode not in (select top " + fromcount + " mocode from gmis_mo_1201 where 1=1 " + h_fstr + " order by fld_1201_5)" + h_fstr + " order by fld_1201_5";
   

}
public override void BeforeOutput(DataTable dt, int rowi)
{	//处理当前页数据

    DataRow dr = dt.Rows[rowi];
    if (mua.IndexOf(";3;") != -1)
    {
        dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
    }

    if (mua.IndexOf(";4;") != -1)
    {
        dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
    }

    for (int i = 1; i < Convert.ToUInt32(dr["fld_1201_2"]); i++)
    {
        dr["preTopic"] = "&nbsp;&nbsp;&nbsp;&nbsp;" + dr["preTopic"].ToString();
    }
}
private void Change_Level(object sender, System.EventArgs e)
{
    if (fld_1201_2.SelectedItem != null)
    {
        SetSESSION("filter", fld_1201_2.SelectedItem.Value);
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
			<td><asp:DropDownList runat="server" ID="fld_1201_2" Width="160" AutoPostBack="true" OnSelectedIndexChanged="Change_Level"></asp:DropDownList></td>
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			<td >区域名称</td>
			<td width="5%" align="center">操作</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td>*<a href="view_1201.aspx?aid=*&mid=*&id=*&navindex=*" title="查看明细">*&nbsp;</a></td>
			<td align="center">*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_1201.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--动态生成html,结束-->
</form>
</body>
</html>
