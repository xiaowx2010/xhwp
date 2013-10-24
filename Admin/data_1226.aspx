
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    StringBuilder p_sb; //XML数据
private void Page_Load(object sender, System.EventArgs e)
{   
    //工业固体废物统计 flash数据--> 
    GetChartData();
    SetSESSION("guangye", "1");
}
//统计数据
private void GetChartData()
{
    p_sb = new StringBuilder();//XML数据
    string[] h_arrtype = new string[] { "产生量", "利用量", "处置量", "本年贮存量", "倾倒丢弃量" };//统计分类集合
    string[] h_arrname = new string[] { "总计", "冶炼废渣", "粉煤灰", "炉渣", "煤矸石","尾矿","脱硫石膏","污泥","放射性废物","其他废物" };//统计项集合
    DataTable h_dt = new DataTable();
    string h_filedname = "";
    for (int n = 0; n < h_arrname.Length; n++)
    {
        for (int i = 0; i < h_arrtype.Length; i++)
        {
            DataRow[] h_rows = GetFields("746").Select("caption like ('%" + h_arrtype[i].ToString() + "%') and caption like ('%" + h_arrname[n].ToString() + "%')");//获取字段
            if (h_rows.Length > 0)
            {
                foreach (DataRow row in h_rows)
                {
                    h_filedname += "sum(" + row["fieldname"].ToString() + ") as " + row["fieldname"].ToString() + ",";
                }
            }
        }
    }
    
    //获取数据
    if (h_filedname.Trim(',') != "")
    {
        db.SqlString = "select " + h_filedname.Trim(',') + " from gmis_mo_746 where Cast(datepart(year,createdate) as varchar(50))='"+DateTime.Now.Year.ToString()+"'";
        h_dt = db.GetDataTable();
        
    }
    
    p_sb.Append("<chart caption='工业固体废物统计' xAxisName='统计项' numberSuffix='' showValues='0'>");
    p_sb.Append("<categories>");
    for (int i = 0; i < h_arrname.Length; i++)
    {
        p_sb.Append("<category label='" + h_arrname[i].ToString() + "' />");//横轴标示
    }
    p_sb.Append("</categories>");
    for (int i = 0; i < h_arrtype.Length; i++)
    {
        p_sb.Append("<dataset seriesName='" + h_arrtype[i].ToString() + "'>");
        for (int n = 0; n < h_arrname.Length; n++)
        {
            DataRow[] h_rows = GetFields("746").Select("caption like ('%" + h_arrtype[i].ToString() + "%') and caption like ('%" + h_arrname[n].ToString() + "%')");//获取字段
            
            if (h_rows.Length > 0)
            {
                foreach (DataRow dr in h_rows)
                {
                    for (int c = 0; c < h_dt.Columns.Count; c++)
                    {
                        if (h_dt.Columns[c].ColumnName.ToString() == dr["fieldname"].ToString())
                        {
                            p_sb.Append("<set value='" + h_dt.Rows[0][c].ToString() + "' />");//统计值
                        }
                    }
                }
            }
        }
        p_sb.Append("</dataset>");
    }
    p_sb.Append("</chart>");
    Response.Write(p_sb.ToString());
}
</script>

<body style="padding:0px;text-align:center">
<div id="chartdiv1226" align="center"></div>
<script type="text/javascript">
CreateChartsControl("chartdiv1226","ChartId","Common/getcontrol.aspx?dir=Charts&key=MSColumn2D","<%=p_sb.ToString()%>", "368", "295", "#f2f2f2");
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