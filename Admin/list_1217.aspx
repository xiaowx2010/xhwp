<!--ͳ���ձ�-->
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
function clickOutPutExcel()
{
    document.getElementById("hiddenHtml").value=document.getElementById("divOutPut").innerHTML;
   __doPostBack("btn_excel","");
}
</script>
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">

private void Page_Load(object sender, System.EventArgs e)
{    
	mid = GetQueryString("mid", "0");
	navindex = GetQueryString("navindex", "0");

	BindDataList();//��
    

}


//���б�
private void BindDataList()
{
    if (sel_day.Value != "")
    {
        btn_preview.Url = "javascript:viewprintPreview('pop_1217.aspx?date=" + StringUtility.StringToBase64(sel_day.Value) + "')";
        list.SqlStr = "select '" + sel_day.Value + "',case when sum(cast(fld_1204_2 as float)) is null then 0 else sum(cast(fld_1204_2 as float)) end as fld_1204_2,case when sum(cast(fld_1204_3 as float)) is null then 0 else sum(cast(fld_1204_3 as float)) end as fld_1204_3,case when sum(cast(fld_1204_4 as float)) is null then 0 else sum(cast(fld_1204_4 as float)) end as fld_1204_4,case when sum(cast(fld_1204_5 as float))is null then 0 else sum(cast(fld_1204_5 as float)) end as fld_1204_5,case when sum(cast(fld_1204_6 as float)) is null then 0 else sum(cast(fld_1204_6 as float)) end as fld_1204_6,case when sum(cast(fld_1204_8 as float)) is null then 0 else sum(cast(fld_1204_8 as float)) end as fld_1204_8 ,case when sum(cast(fld_1204_9 as float)) is null then 0 else sum(cast(fld_1204_9 as float)) end as fld_1204_9,case when sum(cast(fld_1204_10 as float)) is null then 0 else sum(cast(fld_1204_10 as float)) end as fld_1204_10,case when sum(cast(fld_1204_11 as float)) is null then 0 else sum(cast(fld_1204_11 as float)) end as fld_1204_11 from gmis_mo_1204 where Cast(datepart(year,fld_1204_1) as varchar(50))+'-'+Cast(datepart(month,fld_1204_1) as varchar(50))+'-'+Cast(datepart(day,fld_1204_1) as varchar(50))='" + sel_day.Value + "'";
    }
}
public override void BeforeOutput(DataTable dt, int rowi)
{	//����ǰҳ����

	mua=";"+GetModuleActions(mid)+";";//ģ��Ȩ��    
	DataRow dr = dt.Rows[rowi];
	

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
    oHtmlTextWriter.Write(hiddenHtml.Value);
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
<asp:LinkButton ID="btn_excel" OnClick="Go_OutPutData" runat="server"></asp:LinkButton>
<input id="hiddenHtml" type="hidden" runat="server" />
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
<div id="btnContainter" runat="server">

    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			    <td id="tb_sel" runat="server">
			        <input id="sel_day" type="text" class="boxbline" style="width:80px;" runat="server" readonly/>&nbsp;<div id="div_get_sel_day" style="position:absolute;"></div>
			        <script language="javascript">
                    <!--
                    var cd_get_sel_day = CreateDate("div_get_sel_day","swf_get_sel_day","left",1)
                    function swf_get_sel_day_DoFSCommand(command, args)
                    {
                        if(command == "showdate")
                        {
	                         showChoseDate(cd_get_sel_day,args);
                        }
                        else if(command == "date")
                        {
	                         document.getElementById("sel_day").value = args;
	                         closeChoseDate(cd_get_sel_day);
	                         __doPostBack("btn_date","");
                        }
                    }
                    //-->
                    </script>
                    <SCRIPT LANGUAGE="VBScript">
                    Sub swf_get_sel_day_FSCommand(ByVal cmd, ByVal args)
                    call swf_get_sel_day_DoFSCommand(cmd, args)
                    end sub
                    </SCRIPT>
			    </td>
			<!--�ұ߹̶���ť-->
			<td width="100%" nowrap>&nbsp;<span id="alertleft" runat="server" style="color:Red"></span></td>
            <td id="tb_21" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_preview" runat="server" icon="search" type="toolbar" mode="on" text="��ӡԤ��"></G:Button> </td> 
            <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel" type="toolbar" mode="on" text="����EXCEL" Url="javascript:clickOutPutExcel();"></G:Button> </td> 

	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--����������-->
<!--��̬����html,��ʼ-->
<div id="divOutPut" runat="server">
<G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;border: #999999 1px solid;margin-bottom: 10px;">
			<tr style="font-size: 12px;line-height: 22px;font-weight: bold;color: #FFFFFF;text-decoration: none;padding:0px 5px 0px 5px;background-color:#627C9D;">
				<td width="10%" align="left" style="border-top: #999999 1px solid;vertical-align: top;">����</td>
				<td width="10%" align="left" style="border-top: #999999 1px solid;vertical-align: top;">��������</td>
				<td width="10%" align="left" style="border-top: #999999 1px solid;vertical-align: top;" nowrap>��������</td>
				<td width="10%" style="border-top: #999999 1px solid;vertical-align: top;" >��������</td>
				<td width="10%" style="border-top: #999999 1px solid;vertical-align: top;">һ������</td>
				<td width="10%" style="border-top: #999999 1px solid;vertical-align: top;">һ����̼</td>
				<td width="10%" style="border-top: #999999 1px solid;vertical-align: top;">�����������</td>
				<td width="10%" style="border-top: #999999 1px solid;vertical-align: top;">����</td>
				<td width="10%" style="border-top: #999999 1px solid;vertical-align: top;">����</td>
				<td width="10%" style="border-top: #999999 1px solid;vertical-align: top;">�¶�</td>
			</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr style="font-size: 12px;line-height: 22px;color: #000000;text-decoration: none;padding:0px 5px 0px 5px;background-color:#ffffff; ">
			<td style="border-top: #999999 1px solid;vertical-align: top;">*&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">*&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">*&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">*&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">*&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">*&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">*&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">*&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">*&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">*&nbsp;</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr style="font-size: 12px;line-height: 22px;color: #000000;text-decoration: none;padding:0px 5px 0px 5px;background-color:#ffffff; ">
			<td style="border-top: #999999 1px solid;vertical-align: top;">&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">&nbsp;</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">&nbsp;</td>
		</tr>
	</G:Template>

</G:ListTable>
</div>
<!--��̬����html,����-->
</form>
</body>
</html>
