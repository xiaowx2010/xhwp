<!--�ձ���ӡԤ��-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<object classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" id="wb" width="0" name="wb"></object>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{    

    
    string h_date = GetQueryString("date","");//����
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
    tb_2.Visible = false;
    if (h_date!="")
        list.SqlStr = "select '" + h_date + "',case when sum(cast(fld_1204_2 as float)) is null then 0 else sum(cast(fld_1204_2 as float)) end as fld_1204_2,case when sum(cast(fld_1204_3 as float)) is null then 0 else sum(cast(fld_1204_3 as float)) end as fld_1204_3,case when sum(cast(fld_1204_4 as float)) is null then 0 else sum(cast(fld_1204_4 as float)) end as fld_1204_4,case when sum(cast(fld_1204_5 as float))is null then 0 else sum(cast(fld_1204_5 as float)) end as fld_1204_5,case when sum(cast(fld_1204_6 as float)) is null then 0 else sum(cast(fld_1204_6 as float)) end as fld_1204_6,case when sum(cast(fld_1204_8 as float)) is null then 0 else sum(cast(fld_1204_8 as float)) end as fld_1204_8 ,case when sum(cast(fld_1204_9 as float)) is null then 0 else sum(cast(fld_1204_9 as float)) end as fld_1204_9,case when sum(cast(fld_1204_10 as float)) is null then 0 else sum(cast(fld_1204_10 as float)) end as fld_1204_10,case when sum(cast(fld_1204_11 as float)) is null then 0 else sum(cast(fld_1204_11 as float)) end as fld_1204_11 from gmis_mo_1204 where Cast(datepart(year,fld_1204_1) as varchar(50))+'-'+Cast(datepart(month,fld_1204_1) as varchar(50))+'-'+Cast(datepart(day,fld_1204_1) as varchar(50))='" + h_date + "'";
    
}

 
    
</script>
<script type="text/javascript">
    function printsetup(){ 
����    // ��ӡҳ������ 
����    wb.execwb(8,1); 
����} 
����function printpreview(){ 
����    wb.ExecWB(7,1);// ��ӡҳ��Ԥ�� 
����} 

����function printit() 
����{ 
����    wb.execwb(6,6); 
����}

</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--��̬����html,��ʼ-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<td nowrap style="padding-left:5px;"><G:Button id="btn_1" runat="server" icon="search" url="javascript:printsetup()" type="toolbar" mode="on" text="ҳ������"></G:Button></td>
            <td nowrap="nowrap" style="padding-left:5px;"><G:Button id="btn_2" runat="server" icon="tb48" url="javascript:printit()" type="toolbar" mode="on" text="��ӡ"></G:Button></td>
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
			<tr class="tr_listtitle">
				<td width="10%" align="left">����</td>
				<td width="10%" align="left">��������</td>
				<td width="10%" align="left" nowrap>��������</td>
				<td width="10%" >��������</td>
				<td width="10%">һ������</td>
				<td width="10%">һ����̼</td>
				<td width="10%">�����������</td>
				<td width="10%">����</td>
				<td width="10%">����</td>
				<td width="10%">�¶�</td>
			</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
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
		</tr>
	</G:Template>
	
</G:ListTable>
</form>
</body>
</html>
