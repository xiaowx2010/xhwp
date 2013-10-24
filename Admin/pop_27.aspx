<!--能源消耗，大气治理设施，主要产品及原辅材料--查询编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    //string opennerurl = "";
    private void Page_Load(object sender, System.EventArgs e)
    {
        string h_key = GetQueryString("keynumber", "0");
        mid = GetQueryString("mid", "0");
        SetToolBar();//设置工具条,同时获取固定URL参数 
        tb_2.Visible = false;
        list.SqlStr = "select 'td_'+cast(mocode as varchar(50))+'_1',fld_17_1,'td_'+cast(mocode as varchar(50))+'_2',fld_17_3,'' as btnstr ,mocode from gmis_mo_17 where fld_17_1 like '%" + h_key + "%'";
        list.Rows = list.DataTable.Rows.Count;        
    }

//处理当前页数据，处理操作列显示的操作
public override void BeforeOutput(DataTable dt, int rowi)
{
    DataRow dr = dt.Rows[rowi];
    dr["btnstr"] += "<a href=\"javascript:chooseOne('" + dr["mocode"].ToString() + "','"+mid+"');\"><img src=\"images/icons/selectall.gif\" title=\"确认\" align=\"absmiddle\" border=\"0\"></a>";
}
    
    
</script>
<script type="text/javascript">
function chooseOne(arg1,arg2)
{
	if(arg2=="27")
		opener.form1.fld_27_4.value=document.getElementById("td_"+arg1+"_1").innerText;
	if(arg2=="26")
		opener.form1.fld_26_6.value=document.getElementById("td_"+arg1+"_1").innerText;
	if(arg2=="28")       
		opener.form1.fld_28_12.value=document.getElementById("td_"+arg1+"_1").innerText;
	if(arg2=="68")   
	{
		opener.form1.fld_68_5.value=document.getElementById("td_"+arg1+"_1").innerText;
		opener.form1.fld_68_1.value=document.getElementById("td_"+arg1+"_2").innerText;
	}
	if(arg2=="67")   
	{
		opener.form1.fld_67_6.value=document.getElementById("td_"+arg1+"_1").innerText;
		opener.form1.fld_67_1.value=document.getElementById("td_"+arg1+"_2").innerText;
	}
	if(arg2=="66")   
	{
		opener.form1.fld_66_7.value=document.getElementById("td_"+arg1+"_1").innerText;
		opener.form1.fld_66_1.value=document.getElementById("td_"+arg1+"_2").innerText;
	}
	if(arg2=="35")   
	{
		opener.form1.fld_35_7.value=document.getElementById("td_"+arg1+"_1").innerText;
		opener.form1.fld_35_6.value=document.getElementById("td_"+arg1+"_2").innerText;
	}
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
<input id="opennerurl" runat="server" type="hidden" />
<div id="controlheight" runat="server" style=" height:550px; overflow-y:auto">
<G:ListTable ID="list" IsProPage=true runat="server" >
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			
                    <td width="15%">
                        单位代码
                    </td>
                    <td width="10%">
                        单位名称
                    </td>
                    <td align="center" width="10%">
                        操作
                    </td>		
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td id="*" >*&nbsp;</td>
			<td id="*" >*&nbsp;</td>			
			<td align="center" style="padding-top:3px;">*&nbsp;</td>		
			</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	</G:ListTable> 	
	</div>
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
			   <td style="padding-right: 5px;" nowrap>
        <G:Button Text="取 消" type="toolbar" mode="on" url="javascript:closeThis();" runat="server">
        </G:Button>
    </td>
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
</form>
</body>
</html>
