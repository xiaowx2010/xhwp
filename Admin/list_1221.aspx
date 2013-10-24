<!--统计月报-->
<%@ Page Language="c#" Debug="true" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
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
private string p_fstr = "";//筛选条件
StringBuilder p_sb;//xml数据
private void Page_Load(object sender, System.EventArgs e)
{    
	mid = GetQueryString("mid", "0");
	navindex = GetQueryString("navindex", "0");
    tabid = GetQueryString("tabid", "1");
    string h_preview = GetQueryString("preview", "0");//打印预览状态
    
    /**追加选项卡**/
    
    AddTab("1", "废水污染物比例");
    AddTab("2", "废气污染物比例");
    AddTab("3", "废水排放趋势分析");
    AddTab("4", "废气排放趋势分析");
    if (!IsPostBack)
    {
        //年份
        sel_year.Items.Clear();
        for (int i = 1999; i <= DateTime.Now.Year; i++)
        {
            sel_year.Items.Add(i.ToString());
        }
        SetFilter(sel_year, DateTime.Now.Year.ToString());
    } 
    if(sel_year.SelectedItem!=null)
        sel_date.Value = sel_year.SelectedItem.Value;
    switch (tabid)//按选项卡显示或隐藏部分控件
    {
        case "1":
        case "2":
            div_pie.Visible = true;
            div_area.Visible = false;
            list.Visible = true;
            tb_22.Visible = true;
            tb_sel.Visible = false;//隐藏年份选择
          
            GetChartData();
            break;
        case "3":
        case "4":
            div_pie.Visible = false;
            div_area.Visible = true;
            list.Visible = false;
            tb_22.Visible = false;
            tb_sel.Visible = true;//显示年份选择
            
            break;
        default:
            break;
    }
    if (h_preview != "0")//打印预览
    {
        tb_21.Visible = false;
        tb_22.Visible = false;
        Td1.Visible = true;
        tabs.Visible = false;
    }
    else
    {
        Td1.Visible = false;
    }
    SetSESSION("guangye", "1");
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
            Page.RegisterStartupScript("", "<scrip" + "t >window.open('list_1221.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&navindex=0&pid=" + pid + "&preview=1&tabid=" + tabid + "');</scrip" + "t>");
            break;
        case "btn_print"://打印
            Page.RegisterStartupScript("", "<scrip" + "t >window.print();</scrip" + "t>");
            break;
        default:
            break;
    }

}
//统计数据
private void GetChartData()
{
    p_sb = new StringBuilder();
    
    string h_fstr = "";//查询itiaojian
    DataTable h_dt = new DataTable();//数据表
    string h_name = "";//标题名
    switch(tabid)
    {
        case "1"://废水污染物比例
            h_name = "废水污染物比例";
            h_dt = db.GetDataTable(db.ConnStr, "select fld_1205_1 as title, fld_1205_4 as num,'0%' as perenum,(select sum(fld_1205_4) from gmis_mo_1205 where 1=1 " + h_fstr + ") as allcount from gmis_mo_1205");
            break;
        case "2"://废气污染物比例
            h_name = "废气污染物比例";
            h_dt = db.GetDataTable(db.ConnStr, "select fld_1206_1 as title, fld_1206_4 as num,'0%' as perenum,(select sum(fld_1206_4) from gmis_mo_1206 where 1=1 " + h_fstr + ") as allcount from gmis_mo_1206");
            break;
        default: 
            break;
    }
    p_sb.Append("<chart palette='4' caption='" + h_name + "比例情况' showValues='1' showShadow='1' use3DLighting='0' enableRotation='1' plotBorderAlpha='100' bgColor='ffffff' smartLineColor='999999' baseFontColor='000000' labelDistance='50' smartLabelClearance='30'>");
    int _i = 0;
    foreach (DataRow dr in h_dt.Rows)
    {
        p_sb.Append("<set label='" + dr["title"].ToString() + "' value='" + dr["num"].ToString() + "' color='" + GetColorStr(_i) + "'/>");
        if (!Convert.IsDBNull(dr["num"]))
        {
            dr["perenum"] = Math.Round(Convert.ToDouble(dr["num"].ToString()) / Convert.ToDouble(dr["allcount"].ToString()) * 100, 2).ToString() + "%";
        }
        _i++;
    }
    p_sb.Append("</chart>");

    //绑定列表控件
    list.DataTable = h_dt;
    list.Rows = h_dt.Rows.Count;

    
}
//面积图
private string GetChartDataArea()
{

    p_sb = new StringBuilder();//XML数据
    string h_name = "";//标题名
    DataTable h_dt1=new DataTable();//统计项
    DataTable h_dtmonth = new DataTable();//统计月份
    DataTable h_dt = new DataTable();//统计数据
    string[] h_arrtype = new string[] { };//统计项集合
    
    switch (tabid)
    {
        case "3"://废水排放趋势分析
            h_name = "废水排放趋势分析";
            //排放口
            if (sel_date.Value != "")
                p_fstr = " where fld_19_3=" + sel_date.Value;
            db.SqlString = "select fld_19_2 as title from gmis_mo_19 "+p_fstr+" group by fld_19_2";
            h_dt1 = db.GetDataTable();
            if (h_dt1 != null && h_dt1.Rows.Count > 0)
            {
                string h_temp = "";
                foreach (DataRow row1 in h_dt1.Rows)
                {
                    h_temp += row1["title"].ToString() + ",";
                }
                h_arrtype = h_temp.Trim(',').Split(',');
            }
            db.SqlString = "select fld_19_4 as month from gmis_mo_19 " + p_fstr + " group by fld_19_4";
            h_dtmonth = db.GetDataTable();
            db.SqlString = "select fld_19_2 as title,fld_19_4 as month,fld_19_5 as num from gmis_mo_19 " + p_fstr + "";
            h_dt = db.GetDataTable();
            break;
        case "4"://废气排放趋势分析
            h_name = "废气排放趋势分析";
            if (sel_date.Value != "")
                p_fstr = " where fld_58_3=" + sel_date.Value;
            //排放口
            db.SqlString = "select fld_58_2 as title from gmis_mo_58 " + p_fstr + " group by fld_58_2";
            h_dt1 = db.GetDataTable();
            
            if (h_dt1 != null && h_dt1.Rows.Count > 0)
            {
                string h_temp = "";
                foreach (DataRow row1 in h_dt1.Rows)
                {
                    h_temp += row1["title"].ToString() + ",";
                }
                h_arrtype = h_temp.Trim(',').Split(',');
            }
            db.SqlString = "select fld_58_4 as month from gmis_mo_58 " + p_fstr + " group by fld_58_4";
            h_dtmonth = db.GetDataTable();
            db.SqlString = "select fld_58_2 as title,fld_58_4 as month,fld_58_5 as num from gmis_mo_58 " + p_fstr + "";
            h_dt = db.GetDataTable();
            break;
        default:
            break;
    }
    if (h_dt != null && h_dt.Rows.Count > 0 && h_dtmonth != null && h_dtmonth.Rows.Count > 0 && h_arrtype.Length > 0)
    {
        p_sb.Append("<chart caption='" + h_name + "' xAxisName='月份' numberSuffix='' showValues='0'>");
        p_sb.Append("<categories>");

        foreach (DataRow row in h_dtmonth.Rows)
        {
            p_sb.Append("<category label='" + row["month"].ToString() + "月' />");//横轴标示

        }
        p_sb.Append("</categories>");

        for (int i = 0; i < h_arrtype.Length; i++)
        {
            p_sb.Append("<dataset seriesName='" + h_arrtype[i].ToString() + "'>");
            foreach (DataRow rowm in h_dtmonth.Rows)
            {
                DataRow[] h_rows = h_dt.Select("title='" + h_arrtype[i].ToString() + "' and month=" + rowm[0].ToString());
                foreach (DataRow dr in h_rows)
                {
                    p_sb.Append("<set value='" + dr["num"] + "' />");//统计值
                }
            }
            p_sb.Append("</dataset>");
        }
        p_sb.Append("</chart>");
    }
    else
    {
        p_sb.Append("<chart caption='趋势分析' xAxisName='月份' numberSuffix='' showValues='0'>");
        p_sb.Append("<categories>");
        p_sb.Append("<category label='' />");//横轴标示
        p_sb.Append("</categories>");
        p_sb.Append("<dataset seriesName=''>");
        p_sb.Append("<set value='0' />");//统计值
        p_sb.Append("</dataset>");
        p_sb.Append("</chart>");
    }
    return p_sb.ToString();

}
//动态添加选项卡//
private void AddTab(string tabcode, string tabname)
{
    if (tabcode != "1")
    {
        HtmlTableCell cell0 = new HtmlTableCell();
        cell0.InnerText = (tabcode == "0") ? ";" : "|";
        cell0.Width = "11";
        cell0.Align = "center";
        tabs.Rows[0].Cells.Add(cell0);
    }
    HtmlTableCell cell = new HtmlTableCell();
    Guangye.WebApplication.Controls.Button btn = new Guangye.WebApplication.Controls.Button();
    btn.ID = "btn_bs_" + tabcode;
    btn.Text = tabname;
    btn.Type = "tab";
    btn.Mode = (tabid == tabcode) ? "on" : "off";

    btn.Url = "list_1221.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tabid=" + tabcode + "&pid=" + pid + "&id=" + id;

    cell.Controls.Add(btn);
    tabs.Rows[0].Cells.Add(cell);
}
</script>

<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<div id="btnContainter" runat="server">
<asp:LinkButton ID="btn_date" OnClick="Filter_Change" runat="server"></asp:LinkButton>
<input id="sel_date" runat="server" type="hidden" />
<input id="hiddenHtml" type="hidden" runat="server" />
<asp:LinkButton ID="btn_excel" OnClick="Go_OutPutData" runat="server"></asp:LinkButton>
<!--选项卡-->
<div align=right>
<table id="tabs" runat="server" border="0" cellpadding="0" cellspacing="0" ><tr></tr></table>
</div>
<!--选项卡-->
<!--操作工具条-->
<!--#include file="toolbarleft.aspx"--> 
		<!--右边固定按钮-->
		    <td id="tb_sel" runat="server" nowrap>
		       <asp:DropDownList ID="sel_year" runat="server" AutoPostBack="true"></asp:DropDownList> 年
		    </td>
		<!--右边固定按钮-->
		<td width="100%" nowrap>&nbsp;<span id="alertleft" runat="server" style="color:Red"></span></td>
		<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="打印"></G:Button> </td> 
        <td id="tb_21" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_preview" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="打印预览"></G:Button> </td> 
        <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel" type="toolbar" mode="on" text="导出EXCEL" Url="javascript:clickOutPutExcel();"></G:Button> </td> 

   <!--#include file="toolbarright.aspx"--> 


<div id="div_pie" runat="server">
<div id="chartdiv" align="center" style="padding-top:10px;"> </div>
<script type="text/javascript">      
CreateChartsControl("chartdiv","ChartId","Common/getcontrol.aspx?dir=Charts&key=Pie2D","<%=p_sb.ToString()%>", "100%", "350", "#ffffff");
</script> 
</div>
<div id="div_area" runat="server">
<div id="chartdiv1" align="center" style="padding-top:10px;"> </div>
<script type="text/javascript">      
CreateChartsControl("chartdiv1","ChartId1","Common/getcontrol.aspx?dir=Charts&key=MSArea","<%=GetChartDataArea()%>", "100%", "350", "#ffffff");
</script> 
</div>
</div>
<!--操作工具条-->
<!--动态生成html,开始-->
<div id="divOutPut" runat="server">
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;border: #999999 1px solid;margin-bottom: 10px;">
		<tr style="font-size: 12px;line-height: 22px;font-weight: bold;color: #FFFFFF;text-decoration: none;padding:0px 5px 0px 5px;background-color:#627C9D;" align="left">
			<td width="55%" style="border-top: #999999 1px solid;vertical-align: top;">业态</td>
			<td width="20%" style="border-top: #999999 1px solid;vertical-align: top;">数量</td>
			<td width="25%" style="border-top: #999999 1px solid;vertical-align: top;">所占比例</td>
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
<!--动态生成html,结束-->
</form>
</body>
</html>
