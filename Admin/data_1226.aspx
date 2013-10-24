
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    StringBuilder p_sb; //XML����
private void Page_Load(object sender, System.EventArgs e)
{   
    //��ҵ�������ͳ�� flash����--> 
    GetChartData();
    SetSESSION("guangye", "1");
}
//ͳ������
private void GetChartData()
{
    p_sb = new StringBuilder();//XML����
    string[] h_arrtype = new string[] { "������", "������", "������", "����������", "�㵹������" };//ͳ�Ʒ��༯��
    string[] h_arrname = new string[] { "�ܼ�", "ұ������", "��ú��", "¯��", "ú�ʯ","β��","����ʯ��","����","�����Է���","��������" };//ͳ�����
    DataTable h_dt = new DataTable();
    string h_filedname = "";
    for (int n = 0; n < h_arrname.Length; n++)
    {
        for (int i = 0; i < h_arrtype.Length; i++)
        {
            DataRow[] h_rows = GetFields("746").Select("caption like ('%" + h_arrtype[i].ToString() + "%') and caption like ('%" + h_arrname[n].ToString() + "%')");//��ȡ�ֶ�
            if (h_rows.Length > 0)
            {
                foreach (DataRow row in h_rows)
                {
                    h_filedname += "sum(" + row["fieldname"].ToString() + ") as " + row["fieldname"].ToString() + ",";
                }
            }
        }
    }
    
    //��ȡ����
    if (h_filedname.Trim(',') != "")
    {
        db.SqlString = "select " + h_filedname.Trim(',') + " from gmis_mo_746 where Cast(datepart(year,createdate) as varchar(50))='"+DateTime.Now.Year.ToString()+"'";
        h_dt = db.GetDataTable();
        
    }
    
    p_sb.Append("<chart caption='��ҵ�������ͳ��' xAxisName='ͳ����' numberSuffix='' showValues='0'>");
    p_sb.Append("<categories>");
    for (int i = 0; i < h_arrname.Length; i++)
    {
        p_sb.Append("<category label='" + h_arrname[i].ToString() + "' />");//�����ʾ
    }
    p_sb.Append("</categories>");
    for (int i = 0; i < h_arrtype.Length; i++)
    {
        p_sb.Append("<dataset seriesName='" + h_arrtype[i].ToString() + "'>");
        for (int n = 0; n < h_arrname.Length; n++)
        {
            DataRow[] h_rows = GetFields("746").Select("caption like ('%" + h_arrtype[i].ToString() + "%') and caption like ('%" + h_arrname[n].ToString() + "%')");//��ȡ�ֶ�
            
            if (h_rows.Length > 0)
            {
                foreach (DataRow dr in h_rows)
                {
                    for (int c = 0; c < h_dt.Columns.Count; c++)
                    {
                        if (h_dt.Columns[c].ColumnName.ToString() == dr["fieldname"].ToString())
                        {
                            p_sb.Append("<set value='" + h_dt.Rows[0][c].ToString() + "' />");//ͳ��ֵ
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