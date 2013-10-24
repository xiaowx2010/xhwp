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
string p_field,p_area;
private void Page_Load(object sender, System.EventArgs e)
{     
	p_field = GetQueryString("fid", "原煤");  //所选择字段
	p_area = GetQueryString("select_Area", "0");  //行政区域
	if(!IsPostBack)
        {
			BindListControl(select_field,"fld_1390_1","fld_1390_1","select fld_1390_1,fld_1390_1 from gmis_mo_1390 where fld_1390_1<>'排水去向' and fld_1390_1<>'洗精煤' and fld_1390_1<>'其他洗煤'  and fld_1390_1<>'型煤' and fld_1390_1<>'焦炭' and fld_1390_1<>'高炉煤气' and fld_1390_1<>'液化石油气' and fld_1390_1<>'炼厂干气' and fld_1390_1<>'原油' and fld_1390_1<>'燃料油' and fld_1390_1<>'热力' and fld_1390_1 not like '砷' and fld_1390_1 not like '总铬' and fld_1390_1 not like '汞'");
            SetFilter(select_field,p_field);
			BindListControl(select_Area,"fld_1201_1","fld_1201_1","select fld_1201_1 from gmis_mo_1201","-行政区域-");
            SetFilter(select_Area,p_area);
           
            
        }
    //工业用水量统计,flash数据-->
	GetChartData();
	SetSESSION("guangye", "1");
}
	private DataTable GetData()
    {
		db.SqlString = "select mocode,fld_1390_2,fld_1390_1,fld_1390_3,fld_1390_4 from gmis_mo_1390 where fld_1390_1='"+p_field+"'";
		DataTable fieldDT = db.GetDataTable();
		
		string h_unit = fieldDT.Rows[0]["fld_1390_4"].ToString();
		string h_newFieldCode = fieldDT.Rows[0]["fld_1390_2"].ToString();
		string h_oldFieldCode = fieldDT.Rows[0]["fld_1390_3"].ToString();
		string h_fieldName = fieldDT.Rows[0]["fld_1390_1"].ToString();//污染因子
		string h_newModuleCode = h_newFieldCode.Substring(h_newFieldCode.IndexOf('_')+1,4);
		string h_oldModuleCode = h_oldFieldCode.Substring(h_oldFieldCode.IndexOf('_')+1,3);
		
        string h_fstr = "";

        /*设置筛选条件*/
		if(p_area != "0")
		{
			h_fstr += " and fld_1280_41='"+p_area+"'";
		}
        /*设置筛选条件*/

        string tablename = " gmis_mo_1280 g1280 left join gmis_mo_658 g658 on g1280.fld_1280_1=g658.fld_658_1 ";//数据表名称
        tablename += " inner join gmis_mo_"+h_newModuleCode+" on fld_1280_1=fld_"+h_newModuleCode+"_1 ";
		tablename += " inner join gmis_mo_"+h_oldModuleCode+" on fld_1280_1=fld_"+h_oldModuleCode+"_1 ";
		if(h_fieldName.IndexOf("二氧化硫") > -1 || h_fieldName.IndexOf("氮氧化物") > -1)
		{
			tablename += " inner join gmis_mo_1312 on fld_1280_1=fld_1312_1 ";
			tablename += " inner join gmis_mo_707 on fld_1280_1=fld_707_1 ";
		}
      

       
        //设置列表控件显示行数
        //设置列表控件数据源    
       db.SqlString = "select sum(isnull("+h_newFieldCode+",0)) as h_newFieldCode,sum("+h_oldFieldCode+") as h_oldFieldCode from "+tablename+"  where 1=1 " + h_fstr  + " ";
	   DataTable adt = db.GetDataTable();
	   
		return adt;


    }
/***************************************************************
函数名：GetChartData()
用途：画图表
变更人/日期:孙振宇  2009-6-18
***************************************************************/
private void GetChartData()
{
    DataTable h_picdt = GetData();
    
    p_sb.Append("<chart palette='4' caption='污染物分类按时间对比("+guangye.GetControlValue(select_field)+")' showValues='1' showShadow='1' use3DLighting='0' enableRotation='1'  bgColor='f2f2f2' showBorder='0'  smartLineColor='999999' baseFontColor='000000' labelDistance='50' smartLabelClearance='30' showPercentageValues='1'>");
	
	string[] h_title = new string[] {"2009年数据","2007年数据"};
	if (h_picdt.Rows.Count>0)
	{
		for (int i =0;i<h_title.Length ;i++ )
		{
            p_sb.Append("<set label='"+h_title[i]+"' value='"+h_picdt.Rows[0][i].ToString()+"' />");
		}
	}

	p_sb.Append("</chart>");
	Response.Write(p_sb.ToString());
        
}
    private void Change_Type(object sender, System.EventArgs e)
    {
		string h_fstr;//url参数
		h_fstr ="";
         
		if(select_Area.SelectedItem!=null&&guangye.GetControlValue(select_Area)!="0")
		{
			h_fstr += "&select_Area="+StringUtility.StringToBase64(guangye.GetControlValue(select_Area));
		}             
		if(select_field.SelectedItem!=null&&guangye.GetControlValue(select_field)!="0")
		{
			h_fstr += "&fid="+StringUtility.StringToBase64(guangye.GetControlValue(select_field));
		}            
        Response.Redirect("data_1390.aspx?aid="+StringUtility.StringToBase64(aid)+""+h_fstr);
	}
</script>
<body style="padding:0px;text-align:center; vertical-align:top; background-color:#f2f2f2;" >
   <form id="form1" runat="server">
<div align="center">                  
		<table width="80%"  border="0" cellspacing="0" cellpadding="0" style="margin:5px  0;">
                    <tr>
                      <td align="left">污染因子：<br /><asp:DropDownList AutoPostBack="true" ID="select_field" runat="server"  OnSelectedIndexChanged="Change_Type" style="width: 120px;">
        </asp:DropDownList></td>
                      <td align="left">行政区域：<br /><asp:DropDownList AutoPostBack="true" ID="select_Area" runat="server" OnSelectedIndexChanged="Change_Type"  style="width: 120px;">
        </asp:DropDownList></td>
                    </tr>
                  </table>
</div>
<div id="chartdiv1224" align="center">

</div>
<script type="text/javascript"> 
CreateChartsControl("chartdiv1224","ChartId","Common/getcontrol.aspx?dir=Charts&key=Pie2D","<%=p_sb.ToString()%>", "300", "235", "#f2f2f2");
/*
if(yfla.version()>7){

}else{
	window.parent.location.href= "player/upgrade.htm";
}*/
function xise_cn()
{
 if (event.button==2)1=1;
}
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
</form>
</body>
</html>