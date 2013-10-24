<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
StringBuilder p_sb=new StringBuilder();//��ͼ��
string p_field,p_area;
private void Page_Load(object sender, System.EventArgs e)
{     
	p_field = GetQueryString("fid", "ԭú");  //��ѡ���ֶ�
	p_area = GetQueryString("select_Area", "0");  //��������
	if(!IsPostBack)
        {
			BindListControl(select_field,"fld_1390_1","fld_1390_1","select fld_1390_1,fld_1390_1 from gmis_mo_1390 where fld_1390_1<>'��ˮȥ��' and fld_1390_1<>'ϴ��ú' and fld_1390_1<>'����ϴú'  and fld_1390_1<>'��ú' and fld_1390_1<>'��̿' and fld_1390_1<>'��¯ú��' and fld_1390_1<>'Һ��ʯ����' and fld_1390_1<>'��������' and fld_1390_1<>'ԭ��' and fld_1390_1<>'ȼ����' and fld_1390_1<>'����' and fld_1390_1 not like '��' and fld_1390_1 not like '�ܸ�' and fld_1390_1 not like '��'");
            SetFilter(select_field,p_field);
			BindListControl(select_Area,"fld_1201_1","fld_1201_1","select fld_1201_1 from gmis_mo_1201","-��������-");
            SetFilter(select_Area,p_area);
           
            
        }
    //��ҵ��ˮ��ͳ��,flash����-->
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
		string h_fieldName = fieldDT.Rows[0]["fld_1390_1"].ToString();//��Ⱦ����
		string h_newModuleCode = h_newFieldCode.Substring(h_newFieldCode.IndexOf('_')+1,4);
		string h_oldModuleCode = h_oldFieldCode.Substring(h_oldFieldCode.IndexOf('_')+1,3);
		
        string h_fstr = "";

        /*����ɸѡ����*/
		if(p_area != "0")
		{
			h_fstr += " and fld_1280_41='"+p_area+"'";
		}
        /*����ɸѡ����*/

        string tablename = " gmis_mo_1280 g1280 left join gmis_mo_658 g658 on g1280.fld_1280_1=g658.fld_658_1 ";//���ݱ�����
        tablename += " inner join gmis_mo_"+h_newModuleCode+" on fld_1280_1=fld_"+h_newModuleCode+"_1 ";
		tablename += " inner join gmis_mo_"+h_oldModuleCode+" on fld_1280_1=fld_"+h_oldModuleCode+"_1 ";
		if(h_fieldName.IndexOf("��������") > -1 || h_fieldName.IndexOf("��������") > -1)
		{
			tablename += " inner join gmis_mo_1312 on fld_1280_1=fld_1312_1 ";
			tablename += " inner join gmis_mo_707 on fld_1280_1=fld_707_1 ";
		}
      

       
        //�����б�ؼ���ʾ����
        //�����б�ؼ�����Դ    
       db.SqlString = "select sum(isnull("+h_newFieldCode+",0)) as h_newFieldCode,sum("+h_oldFieldCode+") as h_oldFieldCode from "+tablename+"  where 1=1 " + h_fstr  + " ";
	   DataTable adt = db.GetDataTable();
	   
		return adt;


    }
/***************************************************************
��������GetChartData()
��;����ͼ��
�����/����:������  2009-6-18
***************************************************************/
private void GetChartData()
{
    DataTable h_picdt = GetData();
    
    p_sb.Append("<chart palette='4' caption='��Ⱦ����ఴʱ��Ա�("+guangye.GetControlValue(select_field)+")' showValues='1' showShadow='1' use3DLighting='0' enableRotation='1'  bgColor='f2f2f2' showBorder='0'  smartLineColor='999999' baseFontColor='000000' labelDistance='50' smartLabelClearance='30' showPercentageValues='1'>");
	
	string[] h_title = new string[] {"2009������","2007������"};
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
		string h_fstr;//url����
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
                      <td align="left">��Ⱦ���ӣ�<br /><asp:DropDownList AutoPostBack="true" ID="select_field" runat="server"  OnSelectedIndexChanged="Change_Type" style="width: 120px;">
        </asp:DropDownList></td>
                      <td align="left">��������<br /><asp:DropDownList AutoPostBack="true" ID="select_Area" runat="server" OnSelectedIndexChanged="Change_Type"  style="width: 120px;">
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