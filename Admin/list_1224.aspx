<!--��ҵ��ˮ��ͳ��,�б�ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	<script type="text/javascript">
function clickOutPutExcel()
{
    document.getElementById("hiddenHtml").value=document.getElementById("divOutPut").innerHTML;
   __doPostBack("btn_excel","");
}
</script>
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
StringBuilder p_sb=new StringBuilder();//��ͼ��
private void Page_Load(object sender, System.EventArgs e)
{     
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
	tb_2.Visible=false;
    string h_preview = GetQueryString("preview", "0");
    if (h_preview != "0")//��ӡԤ��
    {
        tb_21.Visible = false;
        Td1.Visible = true;
    }
    else
    {
        Td1.Visible = false;
    }
	GetChartData();
	SetSESSION("guangye", "1");
}
/***************************************************************
��������GetChartData()
��;����ͼ��
�����/����:������  2009-6-18
***************************************************************/
private void GetChartData()
{
    DataTable h_picdt = db.GetDataTable(db.ConnStr, "select sum(fld_662_9),sum(fld_662_11),sum(fld_662_12),sum(fld_662_14),sum(fld_662_15),sum(fld_662_9+fld_662_11+fld_662_12+fld_662_14+fld_662_15) from gmis_mo_662");
    DataTable h_dtList = new DataTable();
    h_dtList.Columns.Add("type");
    h_dtList.Columns.Add("count");
    h_dtList.Columns.Add("rate");
    DataRow h_drList;
    p_sb.Append("<chart palette='4' caption='��ҵ��ˮ��ͳ��' showValues='1' showShadow='1' use3DLighting='0' enableRotation='1' plotBorderAlpha='100' bgColor='ffffff' smartLineColor='999999' baseFontColor='000000' labelDistance='50' smartLabelClearance='30' showPercentageValues='1'>");
	
	string[] h_title = new string[] {"��������ˮ","�Ա�ˮ-�ر�ˮ","�Ա�ˮ-����ˮ","�Ա�ˮ-����-�����ܱ߹�ҵ��ҵ��ˮ","�Ա�ˮ-����-�ظ���ˮ��"};
	if (h_picdt.Rows.Count>0)
	{
		for (int i =0;i<h_title.Length ;i++ )
		{
            h_drList = h_dtList.NewRow();
            h_drList["type"] = h_title[i];
            h_drList["count"] = h_picdt.Rows[0][i].ToString();
            double h_dblrate = 0;
            try
            {
                h_dblrate = Math.Round(Convert.ToDouble(h_drList["count"].ToString())*100 / Convert.ToDouble(h_picdt.Rows[0][5].ToString()),2);
            }
            catch
            {
                 
            }
            h_drList["rate"] = h_dblrate.ToString();
            h_dtList.Rows.Add(h_drList);
            p_sb.Append("<set label='"+h_title[i]+"' value='"+h_picdt.Rows[0][i].ToString()+"' />");
		}
        list.DataTable = h_dtList;
        list.Rows = h_dtList.Rows.Count;
	}

	p_sb.Append("</chart>");
}


//��ť�¼�
private void Filter_Change(object sender, System.EventArgs e)
{
    string h_idstr = ((Control)sender).ID;//��ť��
    switch (h_idstr)
    {
        case "btn_preview"://��ӡԤ��
            Page.RegisterStartupScript("", "<scrip" + "t >window.open('list_1224.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&navindex=0&pid=" + pid + "&preview=1');</scrip" + "t>");
            break;
        case "btn_print"://��ӡ
            Page.RegisterStartupScript("", "<scrip" + "t >window.print();</scrip" + "t>");
            break;
        default:
            break;
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
    oHtmlTextWriter.Write(hiddenHtml.Value);
    Response.Write(oStringWriter.ToString());
    Response.End();

    btnContainter.Visible = true;
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<input id="hiddenHtml" type="hidden" runat="server" />
<asp:LinkButton ID="btn_excel" OnClick="Go_OutPutData" runat="server"></asp:LinkButton>
<div id="btnContainter" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="��ӡ"></G:Button> </td> 
			<td id="tb_21" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_preview" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="��ӡԤ��"></G:Button> </td> 
            <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel" type="toolbar" mode="on" text="����EXCEL" Url="javascript:clickOutPutExcel();"></G:Button> </td> 
			
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<!--ͼ��FLASH-->
<div id="chartdiv" align="center" style="padding-top:10px;"> </div>
<script type="text/javascript">      
CreateChartsControl("chartdiv","ChartId","Common/getcontrol.aspx?dir=Charts&key=Pie2D","<%=p_sb.ToString()%>", "100%", "350", "#ffffff");
</script> 
</div>
<!--ͼ��FLASH-->
<div id="divOutPut" runat="server">
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;border: #999999 1px solid;margin-bottom: 10px;">
		<tr style="font-size: 12px;line-height: 22px;font-weight: bold;color: #FFFFFF;text-decoration: none;padding:0px 5px 0px 5px;background-color:#627C9D;" align="left">
			<td width="55%" style="border-top: #999999 1px solid;vertical-align: top;">���</td>
			<td width="20%" style="border-top: #999999 1px solid;vertical-align: top;">����</td>
			<td width="25%" style="border-top: #999999 1px solid;vertical-align: top;">��ռ����</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr style="font-size: 12px;line-height: 22px;color: #000000;text-decoration: none;padding:0px 5px 0px 5px;background-color:#ffffff; ">
			<td  style="border-top: #999999 1px solid;vertical-align: top;">*</td>
			<td  style="border-top: #999999 1px solid;vertical-align: top;">*</td>
			<td style="border-top: #999999 1px solid;vertical-align: top;">*%</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr style="font-size: 12px;line-height: 22px;color: #000000;text-decoration: none;padding:0px 5px 0px 5px;background-color:#ffffff; ">
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
