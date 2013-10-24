<!--ͳ���걨-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	<script type="text/javascript">
function viewprintPreview(aim){
	var p = open(aim,"Preview","fullscreen=no,status=yes,toolbar=no,menubar=no,location=no,resizable=yes,scrollbars=yes,directories=no",true);
	p.focus();
}

</script>
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">

private void Page_Load(object sender, System.EventArgs e)
{    
	mid = GetQueryString("mid", "0");
	navindex = GetQueryString("navindex", "0");

	if(!IsPostBack)
	{
        //����
        BindListControl(sel_year, "years", "years", "select Cast(datepart(year,fld_1204_1) as varchar(50)) as years,Cast(datepart(year,fld_1204_1) as varchar(50)) as years from gmis_mo_1204 group by Cast(datepart(year,fld_1204_1) as varchar(50)) ");
    
	}
    if (sel_year.SelectedItem != null)
            sel_date.Value = sel_year.SelectedItem.Value;
	BindDataList();//��
    

}


//���б�
private void BindDataList()
{
    if (sel_date.Value != "")
    {
        btn_preview.Url = "javascript:viewprintPreview('pop_1219.aspx?date=" + StringUtility.StringToBase64(sel_date.Value) + "')";
        list.SqlStr = "select Cast(datepart(year,fld_1204_1) as varchar(50)) +'-'+Cast(datepart(month,fld_1204_1) as varchar(50)),case when sum(cast(fld_1204_2 as float)) is null then 0 else sum(cast(fld_1204_2 as float)) end as fld_1204_2,case when sum(cast(fld_1204_3 as float)) is null then 0 else sum(cast(fld_1204_3 as float)) end as fld_1204_3,case when sum(cast(fld_1204_4 as float)) is null then 0 else sum(cast(fld_1204_4 as float)) end as fld_1204_4,case when sum(cast(fld_1204_5 as float))is null then 0 else sum(cast(fld_1204_5 as float)) end as fld_1204_5,case when sum(cast(fld_1204_6 as float)) is null then 0 else sum(cast(fld_1204_6 as float)) end as fld_1204_6,case when sum(cast(fld_1204_8 as float)) is null then 0 else sum(cast(fld_1204_8 as float)) end as fld_1204_8 ,case when sum(cast(fld_1204_9 as float)) is null then 0 else sum(cast(fld_1204_9 as float)) end as fld_1204_9,case when sum(cast(fld_1204_10 as float)) is null then 0 else sum(cast(fld_1204_10 as float)) end as fld_1204_10,case when sum(cast(fld_1204_11 as float)) is null then 0 else sum(cast(fld_1204_11 as float)) end as fld_1204_11 from gmis_mo_1204 where Cast(datepart(year,fld_1204_1) as varchar(50))='" + sel_date.Value + "' group by Cast(datepart(year,fld_1204_1) as varchar(50)) +'-'+Cast(datepart(month,fld_1204_1) as varchar(50))";
    }
}

    //����ΪEXCEL
protected void Go_OutPutData(object sender, System.EventArgs e)
{
    /**����ҳ���ϲ������������磺��ť**/
    btnContainter.Visible = false;

    Response.Clear();
    Response.Buffer = true;
    Response.Charset = "GB2312";
    Response.AppendHeader("Content-Disposition", "attachment;filename=excel.xls");
    Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-7");
    Response.ContentType = "application/ms-excel";
    this.EnableViewState = false;
    System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
    System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
    System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
    this.RenderControl(oHtmlTextWriter);
    Response.Write(oStringWriter.ToString());
    Response.End();

    btnContainter.Visible = true;
}

    //��ť�¼�
private void Filter_Change(object sender, System.EventArgs e)
{
    string h_exeinfo = "";//��ʾ
    string h_idstr = ((Control)sender).ID;//��ť��
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<asp:LinkButton ID="btn_date" OnClick="Filter_Change" runat="server"></asp:LinkButton>
<input id="sel_date" runat="server" type="hidden" />
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
<div id="btnContainter" runat="server">

    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			    <td id="tb_sel" runat="server" nowrap>
			       <asp:DropDownList ID="sel_year" runat="server"  AutoPostBack="true"></asp:DropDownList>�� &nbsp;
			    </td>
			<!--�ұ߹̶���ť-->
			<td width="100%" nowrap>&nbsp;<span id="alertleft" runat="server" style="color:Red"></span></td>
            <td id="tb_21" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_preview" runat="server" icon="search" type="toolbar" mode="on" text="��ӡԤ��"></G:Button> </td> 
            <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel" type="toolbar" mode="on" text="����EXCEL" onclick="Go_OutPutData"></G:Button> </td> 

	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--����������-->
<!--��̬����html,��ʼ-->
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

<!--��̬����html,����-->
</form>
</body>
</html>
