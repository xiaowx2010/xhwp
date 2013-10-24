<!--能源消费统计,列表页-->
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
StringBuilder p_sb=new StringBuilder();//画图表
private void Page_Load(object sender, System.EventArgs e)
{   
    SetToolBar();//设置工具条,同时获取固定URL参数 
    string h_preview = GetQueryString("preview", "0");
	tb_2.Visible=false;
    if (h_preview != "0")//打印预览
    {
        tb_21.Visible = false;
        tb_22.Visible = false;
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
函数名：GetChartData()
用途：画图表
变更人/日期:孙振宇  2009-6-18
***************************************************************/
private void GetChartData()
{
    //Random h_rd = new Random();
	string h_fs660 = ""; //表gmis_mo_660中字段
	string h_fs732 = ""; //表gmis_mo_732中字段
	string[] h_typestr = new string[] {"原煤", "洗精煤", "其他洗煤", "型煤", "焦炭", "焦炉煤气", "高炉煤气", "天然气", "液化天然气", "液化石油气", "炼厂干气", "原油", "汽油", "煤油", "柴油", "燃料油", "其他燃料", "热力", "电力", "综合能源消费量"};//能源类别名	
   //模拟数据值
    /* double[] h_arrdbl = new double[h_typestr.Length];
    
    for (int k = 0; k < h_arrdbl.Length; k++)
    {
        h_arrdbl[k] = h_rd.NextDouble() * 3735345;
    }
    */
	string[] h_valuestr = new string[] {"消费总量","其中：用作原料量"};	  //统计内容
	p_sb.Append("<chart caption='能源消费统计' decimals='2' numberPrefix='' showValues='0'   rotateYAxisName='0'  rotateLabels='1'><categories>");
	DataTable h_picdt = new DataTable();
	h_picdt.Columns.Add("captions");
	h_picdt.Columns.Add("sums1");		
	h_picdt.Columns.Add("sums2");	
	double h_value=0;//合计
	string h_linestr = "";//列名
	for (int i =0;i<h_typestr.Length ;i++ )
	{
		p_sb.Append("<category label='"+h_typestr[i]+"' />");
		string h_per = ""; //单位
		switch (h_typestr[i])
		{
			case "焦炉煤气":
			case "高炉煤气":
			case "天然气":
				h_per = " (万立方米)";
				break;
			case "其他燃料":
			case "综合能源消费量":
				h_per = " (吨标准煤)";
				break;
			case "热力":
				h_per = " (百万千焦)";
				break;
			case "电力":
				h_per = " (万千瓦时)";
				break;
			default:
				h_per = " (吨)";
				break;
		}

		DataRow h_newdr = h_picdt.NewRow();
		h_newdr["captions"] = h_typestr[i]+h_per;
		h_newdr["sums1"] = "0";
		h_newdr["sums2"] = "0";
		h_picdt.Rows.Add(h_newdr);
	}
	p_sb.Append("</categories>"); 
	
	//由于各类别对应的表字段不同，这里只能放在循环中动态读取。
    
    for (int j =0;j<h_valuestr.Length ;j++ )
    {
        p_sb.Append("<dataset seriesName='"+h_valuestr[j]+"'>");
		
        h_linestr = (j==0)?"sums1":"sums2";
        for (int i =0;i<h_typestr.Length ;i++ )
        {
            h_fs660 = GetPicFieldName("660"," and caption like '%"+h_valuestr[j]+"%' and caption like '%"+h_typestr[i]+"%' ");
            h_fs732 = GetPicFieldName("732"," and caption like '%"+h_valuestr[j]+"%' and caption like '%"+h_typestr[i]+"%' ");
            if (h_fs660 != "" || h_fs732 != "")
            {			
                if(h_fs660 != "")
                {			
                    DataTable h_dt660 = db.GetDataTable(db.ConnStr,"select sum("+h_fs660+") from gmis_mo_660");
                    if (h_dt660.Rows.Count>0)
                    {
                        h_value += Convert.ToDouble(h_dt660.Rows[0][0]);
                    }
                }
                if (h_fs732 != "")
                {
                    DataTable h_dt732 = db.GetDataTable(db.ConnStr, "select sum(" + h_fs732 + ") from gmis_mo_732");
                    if (h_dt732.Rows.Count > 0)
                    {
                        h_value += Convert.ToDouble(h_dt732.Rows[0][0]);
                    }
                }
                p_sb.Append("<set value='"+h_value.ToString()+"' />");
                
                h_picdt.Rows[i][h_linestr] = Math.Round(h_value,2).ToString();
                h_value=0;//清0
            }			
        }
        p_sb.Append("</dataset>");
    }
    //模拟数据
    /*double h_dbltemp = 0;
    for (int j = 0; j < h_valuestr.Length; j++)
    {

        p_sb.Append("<dataset seriesName='" + h_valuestr[j] + "'>");
        h_linestr = (j == 0) ? "sums1" : "sums2";
        for (int i = 0; i < h_typestr.Length; i++)
        {
            h_dbltemp = (j == 0) ? h_arrdbl[i] : h_arrdbl[i] * h_rd.NextDouble();

            p_sb.Append("<set value='" + h_dbltemp.ToString() + "' />");

            h_picdt.Rows[i][h_linestr] = Math.Round(h_dbltemp, 2).ToString();
            h_value = 0;//清0

        }
        p_sb.Append("</dataset>");
    }*/
   
		
		
	p_sb.Append("</chart>");


	//绑定列表控件
	list.DataTable=h_picdt;
	list.Rows=h_picdt.Rows.Count;

}

/***************************************************************
函数名：GetPicFieldName(string mid, string caption)
用途：获取字段名称 
参数：mid(模块ID)；filter(查找条件)
变更人/日期:孙振宇  2009-6-18
***************************************************************/
private string GetPicFieldName(string mid, string filter)
{
    DataTable h_fdt = db.GetDataTable(db.ConnStr,"select fieldname from gmis_field where modulecode="+mid+" and fieldstatus=0 "+filter+" order by fieldindex asc");
    if (h_fdt != null && h_fdt.Rows.Count > 0)
    {
		
		return h_fdt.Rows[0]["fieldname"].ToString();        
    }
    return "";
}
//导出为EXCEL
protected void Go_OutPutData(object sender, System.EventArgs e)
{
    /**隐藏页面上不导出的内容如：按钮**/
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

//按钮事件
private void Filter_Change(object sender, System.EventArgs e)
{
    string h_idstr = ((Control)sender).ID;//按钮名
    switch (h_idstr)
    { 
        case "btn_preview"://打印预览
            Page.RegisterStartupScript("", "<scrip" + "t >window.open('list_1215.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid="+mid+"&navindex=0&pid="+pid+"&preview=1');</scrip" + "t>");
            break;
        case "btn_print"://打印
            Page.RegisterStartupScript("", "<scrip" + "t >window.print();</scrip" + "t>");
            break;
        default: 
            break;
    }
    
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<input id="hiddenHtml" type="hidden" runat="server" />
<asp:LinkButton ID="btn_excel" OnClick="Go_OutPutData" runat="server"></asp:LinkButton>
<div id="btnContainter" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="打印"></G:Button> </td> 
			<td id="tb_21" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_preview" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="打印预览"></G:Button> </td> 
            <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel" type="toolbar" mode="on" text="导出EXCEL" Url="javascript:clickOutPutExcel();"></G:Button> </td> 
			
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<!--图表FLASH-->
<%--<div id="chartdiv" align="center" style="padding-top:10px;"> </div>
<script type="text/javascript">      
CreateChartsControl("chartdiv","ChartId","Common/getcontrol.aspx?dir=Charts&key=MSColumn2D","<%=p_sb.ToString()%>", "100%", "350", "#ffffff");
</script>--%>
</div>
<!--图表FLASH-->
<!--列表-->
<div id="divOutPut" runat="server">
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
<G:Template id="listtemphead" type="head" runat="server">
	<table width="100%"  border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;border: #999999 1px solid;margin-bottom: 10px;" >
	<tr lign="left" style="font-size: 12px;line-height: 22px;font-weight: bold;color: #FFFFFF;text-decoration: none;padding:0px 5px 0px 5px;background-color:#627C9D;">
		<td width="40%" style="border-top: #999999 1px solid;vertical-align: top;">能源类别名</td>
		<td width="30%" style="border-top: #999999 1px solid;vertical-align: top;">消费总量</td>
		<td width="30%" style="border-top: #999999 1px solid;vertical-align: top;">其中：用作原料量</td>
	</tr>
</G:Template>
<G:Template id="listtemp1" runat="server">
	<tr style="font-size: 12px;line-height: 22px;color: #000000;text-decoration: none;padding:0px 5px 0px 5px;background-color:#ffffff; ">
		<td style="border-top: #999999 1px solid;vertical-align: top;">*</td>
		<td style="border-top: #999999 1px solid;vertical-align: top;">*</td>
		<td style="border-top: #999999 1px solid;vertical-align: top;">*</td>
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
<!--列表-->

<!--动态生成html,结束-->
</form>
</body>
</html>
