<!--查询编辑页,列表页-->
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
    string h_year = GetQueryString("yeardata","0");
    string h_code = GetQueryString("codedata","0");
    SetToolBar();//设置工具条,同时获取固定URL参数    
    tb_2.Visible = false;  
    list.SqlStr = "select fld_1146_1,fld_1146_2,fld_1146_4,'' as btnstr ,mocode from gmis_mo_1146 where fld_1146_1="+h_year+" and fld_1146_2 like '%"+h_code+"%'";
    list.Rows = list.DataTable.Rows.Count;
}

//处理当前页数据，处理操作列显示的操作
public override void BeforeOutput(DataTable dt, int rowi)
{
    DataRow dr = dt.Rows[rowi];
    dr["btnstr"] += "<a href=\"javascript:chooseOne('" + mid + "','" + dr["mocode"].ToString() + "','" + StringUtility.StringToBase64("edit") + "');\"><img src=\"images/icons/selectall.gif\" title=\"确认\" align=\"absmiddle\" border=\"0\"></a>";
}
    
    
</script>
<script type="text/javascript">
function chooseOne(arg1,arg2,arg3)
{
   opener.window.location.href="getpage.aspx?aid="+arg3+"&mid="+arg1+"&id="+arg2+"";
   closeThis();

}

function closeThis()
{
    opener=null;
    window.close();
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->


<!--动态生成html,开始-->

<G:ListTable ID="list" IsProPage=true runat="server" >
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			<td  width="15%" >统计年份</td>
			<td  width="25%" >企业法人代码</td>
			<td  width="35%" >企业名称</td>			
			<td align="center" width="8%">操作</td>			
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td >*&nbsp;</td>
			<td >*&nbsp;</td>
			<td >*&nbsp;</td>			
			<td align="center" style="padding-top:3px;">*&nbsp;</td>		
			</td>
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
	</G:ListTable> 	
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<td style="padding-right:5px;" nowrap>
			<G:Button Text="取 消" type="toolbar" mode="on" url="javascript:closeThis();" runat="server"></G:Button>
			</td>
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
</form>
</body>
</html>
