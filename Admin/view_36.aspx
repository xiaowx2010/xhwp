<!--�������������Ϣ,�鿴ҳ-->
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
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
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
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
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
		    <td align="center" class="td_viewcontent_title" style="width:70" nowrap>Date(����):</td>
		    <td align="center" class="td_viewcontent_title" style="width:70" nowrap>Time(ʱ��):</td>
	        <td align="center" class="td_viewcontent_title">SO2(��������)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">NO2(��������)MG/M3:</td>
            <td align="center" class="td_viewcontent_title">NOX(��������)MG/M3:</td>	
	        <td align="center" class="td_viewcontent_title">NO(һ������)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">CO(һ����̼)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">O3(����)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">PM10(�����������)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">ws(����)M/S:</td>
	        <td align="center" class="td_viewcontent_title">wd(����)DEG:</td>
	        <td align="center" class="td_viewcontent_title">t(�¶�)MG/M3:</td>
	        <td align="center" class="td_viewcontent_title">rh(ʪ��)%:</td>
	        <td align="center" class="td_viewcontent_title">bp(��ѹ)HPA:</td>
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
<!--��̬����html,����-->
</form>
</body>
</html>
