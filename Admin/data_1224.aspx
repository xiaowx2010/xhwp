<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
StringBuilder p_sb=new StringBuilder();//画图表
private void Page_Load(object sender, System.EventArgs e)
{     
    //工业用水量统计,flash数据-->
	GetChartData();
	SetSESSION("guangye", "1");
}
/***************************************************************
函数名：GetChartData()
用途：画图表
变更人/日期:孙振宇  2009-6-18
***************************************************************/
private void GetChartData()
{
    DataTable h_picdt = db.GetDataTable(db.ConnStr, "select sum(fld_662_9),sum(fld_662_11),sum(fld_662_12),sum(fld_662_14),sum(fld_662_15),sum(fld_662_9+fld_662_11+fld_662_12+fld_662_14+fld_662_15) from gmis_mo_662");
    DataTable h_dtList = new DataTable();
    h_dtList.Columns.Add("type");
    h_dtList.Columns.Add("count");
    h_dtList.Columns.Add("rate");
    DataRow h_drList;
    p_sb.Append("<chart palette='4' caption='工业用水量统计' showValues='1' showShadow='1' use3DLighting='0' enableRotation='1'  bgColor='f2f2f2' showBorder='0'  smartLineColor='999999' baseFontColor='000000' labelDistance='50' smartLabelClearance='30' showPercentageValues='1'>");
	
	string[] h_title = new string[] {"城市自来水","自备水-地表水","自备水-地下水","自备水-其他-利用周边工业企业用水","自备水-其他-重复用水量"};
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
	}

	p_sb.Append("</chart>");
}
</script>
<body style="padding:0px;text-align:center; vertical-align:top; background-color:#f2f2f2;">
<div id="chartdiv1224" align="center"></div>
<script type="text/javascript"> 
    
CreateChartsControl("chartdiv1224","ChartId","Common/getcontrol.aspx?dir=Charts&key=Pie2D","<%=p_sb.ToString()%>", "368", "295", "#f2f2f2");
/*
if(yfla.version()>7){

}else{
	window.parent.location.href= "player/upgrade.htm";
}*/
</script>
<SCRIPT language=VBScript>
Function VBGetSwfVer(i)
	on error resume next
	Dim swControl, swVersion
	swVersion = 0

	set swControl = CreateObject("ShockwaveFlash.ShockwaveFlash." + CStr(i))
	if (IsObject(swControl)) then
    		swVersion = swControl.GetVariable("$version")
	end if
    	VBGetSwfVer = swVersion
End Function
</SCRIPT>
</body>
</html>