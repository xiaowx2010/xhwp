<!--水质量监测信息,列表页-->
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
    BindListData();
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


}
private void BindListData()
{
    string h_fstr = "";
    int pagesize = GetListRows();//获取列表每页显示的记录数
    int fromcount = Convert.ToInt32(navindex) * pagesize;//计算已翻过页数的记录数
    string tablename = "gmis_mo_37";//数据表名称
    string orderstr = " order by fld_37_1";//排序条件;
    //设置列表控件显示行数
    list.Rows = pagesize;
    //设置列表控件数据源
    list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount,'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_37_3,fld_37_4,fld_37_5,'' as btnstr,mocode from " + tablename + " t2 where mocode in (select top " + (fromcount + pagesize) + " mocode from " + tablename + " where 1=1 " + h_fstr + " " + orderstr + ") and mocode not in (select top " + fromcount + " mocode from " + tablename + " where 1=1 " + h_fstr + "" + orderstr + " ) " + h_fstr + " " + orderstr + " ";

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
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			
			<td >湖岸名称</td>
			<td >采样点位置</td>
			<td >采样时间</td>
			<td width="5%">操作</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td><a href="view_37.aspx?aid=*&mid=*&id=*&navindex=*">*</a></td>
			<td>*</td>
			<td>*</td>
			<td align="center">*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
				<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_37.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--动态生成html,结束-->
</form>
</body>
</html>
