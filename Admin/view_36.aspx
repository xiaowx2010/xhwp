<!--大气质量监测信息,查看页-->
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
    view.SqlStr = "select fld_36_1,fld_36_2,fld_36_3 from gmis_mo_36 where mocode="+id;
    db.SqlString = "select '' as det,'' as dit,fld_1204_2,fld_1204_3,fld_1204_4,fld_1204_5,fld_1204_6,fld_1204_7,fld_1204_8,fld_1204_9,fld_1204_10,fld_1204_11,fld_1204_12,fld_1204_13,fld_1204_1 from gmis_mo_1204 where fld_1204_14=" + id + " order by mocode desc";
    DataTable dt = db.GetDataTable();
    if (dt != null && dt.Rows.Count > 0)
    {
        foreach (DataRow row in dt.Rows)
        {
            if (row["fld_1204_1"].ToString() != "")
            {
                row["det"] = row["fld_1204_1"].ToString().Trim().Split(' ')[0].ToString();
                row["dit"] = row["fld_1204_1"].ToString().Trim().Split(' ')[1].ToString();
            }
            row["fld_1204_13"] = row["fld_1204_13"].ToString().Replace("<", "&lt;");
        }
    }
    list.DataTable = dt;
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
<G:Content id="view" runat="server">
<G:Template id="Tempview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" >
    <tr class="tr_listcontent">
        <td align="center" colspan="5">Logger Id:*&nbsp;</td>
	    <td align="center" colspan="5">Logger Name:*&nbsp;</td>
	    <td align="center" colspan="4">Interval:*&nbsp;</td>
    </tr>
</table>
</G:Template>
</G:Content>

<G:ListTable ID="list" Rows="15" IsProPage="true" runat="server">
    <G:Template id="listtemphead" type="head" runat="server">
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	    <tr>
		    <td align="center" class="td_viewcontent_title" style="width:70" nowrap>Date(日期):</td>
		    <td align="center" class="td_viewcontent_title" style="width:70" nowrap>Time(时间):</td>
	        <td align="center" class="td_viewcontent_title">SO2(二氧化硫)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">NO2(二氧化氮)MG/M3:</td>
            <td align="center" class="td_viewcontent_title">NOX(氮氧化物)MG/M3:</td>	
	        <td align="center" class="td_viewcontent_title">NO(一氧化氮)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">CO(一氧化碳)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">O3(臭氧)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">PM10(可吸入颗粒物)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">ws(风速)M/S:</td>
	        <td align="center" class="td_viewcontent_title">wd(风向)DEG:</td>
	        <td align="center" class="td_viewcontent_title">t(温度)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">rh(湿度)%:</td>
	        <td align="center" class="td_viewcontent_title">bp(气压)HPA:</td>
	    </tr>
    </G:Template>
    <G:Template id="listtemp1" runat="server">
        <tr class="tr_listcontent">
            <td align="center" >*&nbsp;</td>
            <td align="center" >*&nbsp;</td>
	        <td align="center" >*&nbsp;</td>
	        <td align="center" >*&nbsp;</td>
            <td align="center" >*&nbsp;</td>	
	        <td align="center" >*&nbsp;</td>
	        <td align="center" >*&nbsp;</td>
	        <td align="center" >*&nbsp;</td>
	        <td align="center" >*&nbsp;</td>
	        <td align="center" >*&nbsp;</td>
	        <td align="center" >*&nbsp;</td>
	        <td align="center" >*&nbsp;</td>
	        <td align="center" >*&nbsp;</td>
	        <td align="center" >*&nbsp;</td>
	    </tr>
    </G:Template>
    <G:Template id="listtemp2" runat="server">
        <tr class="tr_listcontent">
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td> 
            <td>&nbsp;</td> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td> 
            <td>&nbsp;</td> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td> 
            <td>&nbsp;</td> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </G:Template>
    <G:NavStyle5 ID="NavStyle" PageUrl="getpage.aspx" runat="server"></G:NavStyle5>
</G:ListTable>
<!--动态生成html,结束-->
</form>
</body>
</html>
