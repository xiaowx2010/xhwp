<!--全行业自定义高级查询结果弹出页-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" debug="true"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <style type="text/css">
    	td {
	    font-family: 宋体, Verdana, Arial, Helvetica;
	    font-size: 12px;
	    text-decoration: none;
    }
    </style>
</head>
<!--#include file="func.aspx"-->
<script language="javascript" type="text/javascript">
function loadData(){
//alert(opener.document.getElementById("fld_1242_2").value);
//var myurl = document.URL;
//document.URL=myurl;
document.getElementById("fld_1242_2").value=opener.document.getElementById("fld_1242_2").value;
document.getElementById("showcaption").value=opener.document.getElementById("showcaption").value;
document.getElementById("selectfiled").value=opener.document.getElementById("selectfiled").value;
    if(document.getElementById("fld_1242_2").value != "***")
    {
    //alert(document.getElementById("fld_1242_2").value );
     __doPostBack('BindData_Btn','');
    }
}
</script>
<script language="c#" runat="server">
string[] p_filter,p_mid;//条件数组，模块数组
string p_t;//判断是否显示数据
string sortstr, sortdir;//获得排序字段及排序方式
string hycode;
private void Page_Load(object sender,System.EventArgs e)
{
    if (!IsPostBack)
    {
        Page.RegisterStartupScript("str", "<script" + " language='javascript'>loadData();</scr" + "ipt>");
    }
  navindex = GetQueryString("navindex","0");
  p_t = GetQueryString("t","0");
  id = GetQueryString("id","0");
  sortstr = GetQueryString("sortstr", "");  //排序字段
  sortdir = GetQueryString("sortdir", "1");  //1降序，0升序
  p_filter = fld_1242_2.Value.Split('*');
  
}
/*
* 函数：BindHead()
* 功能：根据写的条件和原先的设置重新绑定表头
*/
private void BindHead()
{
    string[] h_captions = showcaption.Value.Trim('#').Split('#');
    DataTable fdt = db.GetDataTable(db.ConnStr, "select modulecode,fieldname,caption from gmis_field");
    string sqlstr = "";
    for (int i = 0; i < h_captions.Length; i++)
    {
        if (guangye.GetControlValue(selectfiled) != "1" && guangye.GetControlValue(selectfiled) != "2")//当未设置过显示字段的时候，将上次设置的未保存模块的现实字段清空（排除默认显示的2个字段）。
        {
            sqlstr += "delete gmis_mo_1243 where fld_1243_6=0 and fld_1243_1!='fld_1202_1' and fld_1243_1!='fld_1202_2';";
        }
        if (h_captions[i].IndexOf('|') !=- 1)//污染物条件带2个字段
        {
            string[] h_wrw = h_captions[i].Split('|');
            if (h_wrw.Length == 2)
            {
                for (int j = 0; j < 2; j++)
                {
                    DataRow[] jdrs = fdt.Select("fieldname = '" + h_wrw[j]+ "'");
                    if (jdrs.Length > 0)
                    {
                        sqlstr += "if not exists (select fld_1243_1 from gmis_mo_1243 where fld_1243_1='" + h_wrw[j] + "' and fld_1243_6=" + id + ") insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6)values('" + h_wrw[j] + "','" + jdrs[0]["caption"].ToString() + "',150,1," + jdrs[0]["modulecode"].ToString() + "," + id + ");";
                    }
                } 
            }
        }
        else
        {
            DataRow[] fdrs = fdt.Select("fieldname = '" + h_captions[i] + "'");
            if (fdrs.Length > 0)
            {
                sqlstr += "if not exists (select fld_1243_1 from gmis_mo_1243 where fld_1243_1='" + h_captions[i] + "' and fld_1243_6=" + id + ") insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6)values('" + h_captions[i] + "','" + fdrs[0]["caption"].ToString() + "',150,1," + fdrs[0]["modulecode"].ToString() + "," + id + ");";
            }
       }
    }
    if(sqlstr!="")    guangye.ExeBySql(sqlstr, 1);
}
/*
 * 函数：BindData()
 * 功能：绑定显示数据
 */
private void BindData(object sender, System.EventArgs e)
{
    if (id == "0")
    {
        BindHead();
    }
	
	string h_year = GetQueryString("year","2007");
    SearchMid();
    StringBuilder h_head=new StringBuilder();//表头
    StringBuilder h_text=new StringBuilder();//内容
    StringBuilder h_tab=new StringBuilder();//空白
    
    string h_all = "";//计算合计
    string h_filter = "";//条件
    for (int i = 0; i < p_filter.Length - 1; i++)
    {
        h_filter += p_filter[i].ToString();
    }
    db.SqlString="select fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_5 from gmis_mo_1243 where fld_1243_6= "+id;
	DataTable h_dt = db.GetDataTable();
    if (h_dt.Rows.Count > 0)
    {
        string h_orderby = "";//排序
        if (p_filter[p_filter.Length - 1].ToString().Trim(',') != "") h_orderby = " order by " + p_filter[p_filter.Length - 1].ToString().Trim(',');
        if (sortstr != "")
        {
            h_orderby = " order by " + sortstr + " " + ((sortdir == "1") ? " desc" : " asc");
        }
       
        h_head.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  class=\"righttableline\">\n<tr class=\"tr_listtitle\">\n");
        h_text.Append("<tr class=\"tr_listcontent\">");
        h_tab.Append("<tr class=\"tr_listcontent\">");
        sortdir = (sortdir == "0") ? "1" : "0";//设置排序顺序
        string h_filed = "";//查询的字段
        string h_sum = "";//合计
        bool h_cs_t=false;//是否是产生量
        bool h_pf_t=false;//是否的排放量
        foreach (DataRow dr in h_dt.Rows)
        {
            if (dr["fld_1243_1"].ToString() == "fld_1235_1") h_filed += " (select fld_1236_1 from gmis_mo_1236 where mocode=" + dr["fld_1243_1"].ToString() + ") as " + dr["fld_1243_1"].ToString() + " ,";
            else if (dr["fld_1243_1"].ToString() == "fld_1202_4") h_filed += " (select fld_1201_1 from gmis_mo_1201 a1201 where a1201.mocode=" + dr["fld_1243_1"].ToString() + ") as " + dr["fld_1243_1"].ToString() + ",";
            else if (dr["fld_1243_1"].ToString() == "fld_1202_17") h_filed += " (select fld_1157_2 from gmis_mo_1157  where fld_1157_1=" + dr["fld_1243_1"].ToString() + ") as " + dr["fld_1243_1"].ToString() + ",";
            else if (dr["fld_1243_1"].ToString() == "fld_1202_21") h_filed += " (select fld_1200_1 from gmis_mo_1200 a1200  where a1200.mocode=" + dr["fld_1243_1"].ToString() + ") as " + dr["fld_1243_1"].ToString() + ",";
            else
            {
                
                if (dr["fld_1243_1"].ToString() == "fld_1235_3")
                {
                    h_cs_t = true;
                    h_filed += "cast(fld_1235_3 as decimal(38,8)) as fld_1235_3,";//精确位数
                }
                else if (dr["fld_1243_1"].ToString() == "fld_1235_4")
                {
                    h_filed += "cast(fld_1235_4 as decimal(38,8)) as fld_1235_4,";//精确位数
                    h_pf_t = true;
                }
                else
                {
                    if (dr["fld_1243_1"].ToString() == "fld_1202_2")
                    {
                        h_filed += " '' as orgcode,''as hycode,"; 
                    }
                    h_filed += dr["fld_1243_1"].ToString() + ",";
                }
            }
            if (dr["fld_1243_2"].ToString() == "污染物编号") dr["fld_1243_2"] = "污染物名称";

            if (dr["fld_1243_1"].ToString() == sortstr)
            {
                string h_dirstr = (sortdir == "0") ? "升序" : "降序";
                string h_dirimg = (sortdir == "0") ? "<img src=\"images/asc.gif\" style=\"margin:3px\" title=\"升序\"/>" : "<img src=\"images/desc.gif\" style=\"margin:3px\" title=\"降序\" />";

                h_head.Append("<td width=\"" + dr["fld_1243_3"] + "\" align=\"left\"><a href=\"pop_1241_2.aspx?id=" + id + "&sortstr=" + StringUtility.StringToBase64(dr["fld_1243_1"].ToString()) + "&year="+h_year+"&sortdir=" + sortdir + "\" class=\"listtitle\" title=\"" + dr["fld_1243_2"] + h_dirstr + "\">" + dr["fld_1243_2"] + "</a>" + h_dirimg + " </td>\n");
            }
            else
            {                
                h_head.Append("<td width=\"" + dr["fld_1243_3"] + "\" align=\"left\"><a href=\"pop_1241_2.aspx?id=" + id + "&sortstr=" + StringUtility.StringToBase64(dr["fld_1243_1"].ToString()) + "&year="+h_year+"&sortdir=" + sortdir + "\" class=\"listtitle\" title=\"" + dr["fld_1243_2"] + "降序\">" + dr["fld_1243_2"] + "</a> </td>\n");
            }
           if (dr["fld_1243_1"].ToString() == "fld_1202_2") h_text.Append("<td><a href=\"view_1199.aspx?aid=dmlldw==&mid=1199&orgcode=*&hycode=*\"  >*</a>&nbsp;</td>");
           else     
            h_text.Append("<td>*&nbsp;</td>");
            h_tab.Append("<td>&nbsp;</td>");
        }
        h_head.Append("</tr>");
        h_text.Append("</tr>");
        h_tab.Append("</tr>");
        h_filed = h_filed.ToString().Trim(',');
        listtemphead.InnerHtml = h_head.ToString();
        listtemp1.InnerHtml = h_text.ToString();
        listtemp2.InnerHtml = h_tab.ToString();

        string h_jointab = "";
		bool is1235=false;
        if (p_mid != null)
        {
            for (int i = 0; i < p_mid.Length; i++)
            {
                if (p_mid[i].ToString() == "1235")
                {
                    h_jointab += " left outer join gmis_mo_1235 on fld_1202_2=fld_1235_2 ";
					h_filed += " ,fld_1235_5 as danwei1,fld_1235_6 as danwei2";
					is1235=true;
                }
                else h_jointab += " left outer join gmis_mo_" + p_mid[i].ToString() + " b" + i + " on fld_1202_2=b" + i + ".fld_" + p_mid[i].ToString() + "_1 ";
            }
        }
        if (h_filed.ToString() != "" && p_t != "1")
        {
			if(h_year == "2009")
				h_jointab+=" inner join gmis_mo_1280 on fld_1202_2=fld_1280_1 ";
			string h_SqlStr = "select distinct " + h_filed + ",fld_1202_20  from gmis_mo_1202  " + h_jointab + " where 1=1 " + h_filter + h_orderby;
			if(h_year == "2009")
			{
				db.SqlString="select g2.modulecode as g2,g1.modulecode as g1 from gmis_module g1 	inner join gmis_module g2 on g1.ModuleUrl=g2.ModuleUrl 	where g1.ModuleUrl<>'' and g1.moduleCode<>g2.ModuleCode and g1.modulecode<1100 order by g1.modulecode";
				DataTable h_rdt = db.GetDataTable();
				foreach(DataRow dr in h_rdt.Rows)
				{
					h_SqlStr = h_SqlStr.Replace(dr["g1"].ToString(),dr["g2"].ToString());
				}
			}
			
			
            list.SqlStr = h_SqlStr;
            //Response.Write(h_SqlStr+"");
			list.Rows = list.DataTable.Rows.Count;
			if(is1235)
			{
				String h_danwei1=list.DataTable.Rows[0]["danwei1"].ToString();
				String h_danwei2=list.DataTable.Rows[0]["danwei2"].ToString();
				listtemphead.InnerHtml = h_head.ToString().Replace("产生量","产生量("+h_danwei1+")").Replace("排放量","排放量("+h_danwei2+")");
			}
        }     
        if ( p_t != "1" && list.DataTable.Rows.Count > 0)
        {
            decimal h_1235_3 = 0;//单位统一值产生量
            decimal h_1235_4 = 0;//单位统一值排放量
            decimal h_vall_1 = 0;//产生量总值
            decimal h_vall_2 = 0;//排放量总值
            foreach (DataRow dr in list.DataTable.Rows)
            {
                if (h_cs_t)
                {
                    if (dr["danwei1"].ToString() != "")
                    {
                        switch (dr["danwei1"].ToString())
                        {                           
                            case "千克":
                                h_1235_3 = Convert.ToDecimal(dr["fld_1235_3"].ToString()) / 1000;
                                break;
                            case "克":
                                h_1235_3 = Convert.ToDecimal(dr["fld_1235_3"].ToString()) / 1000000;
                                break;
                            case "万吨":
                                h_1235_3 = Convert.ToDecimal(dr["fld_1235_3"].ToString()) * 10000;
                                break;
                            case "万标立方米":
                                h_1235_3 = Convert.ToDecimal(dr["fld_1235_3"].ToString()) * 10000;
                                break;
                            default:
                                h_1235_3 = Convert.ToDecimal(dr["fld_1235_3"].ToString());
                                break; 
                        }
                        h_vall_1 += h_1235_3;
                    }                   
                }
                if (h_pf_t)
                {
                    if (dr["danwei2"].ToString() != "")
                    {
                        switch (dr["danwei2"].ToString())
                        {
                            case "吨":
                                h_1235_4 = Convert.ToDecimal(dr["fld_1235_4"].ToString());
                                break;
                            case "千克":
                                h_1235_4 = Convert.ToDecimal(dr["fld_1235_4"].ToString())/1000;
                                break;
                            case "克":
                                h_1235_4 = Convert.ToDecimal(dr["fld_1235_4"].ToString())/1000000;
                                break;
                            case "万吨":
                                h_1235_4 = Convert.ToDecimal(dr["fld_1235_4"].ToString())*10000;
                                break;
                        }
                        h_vall_2 += h_1235_4;
                    }
                }
            }
            string h_wrwhtml = "";
            h_wrwhtml += "合计：";
            if (h_vall_1 != 0) h_wrwhtml += "产生量：" + h_vall_1 + " 吨&nbsp;&nbsp;";
            if (h_vall_2 != 0) h_wrwhtml += "排放量：" + h_vall_2 + " 吨";
            companyname.InnerHtml = h_wrwhtml;          
        }
    }
    else
    {
        h_head.Append("<table width=\"100%\" border=\"0\"  class=\"righttableline\" cellpadding=\"0\" cellspacing=\"0\" >\n<tr class=\"tr_listtitle\">\n");
        h_text.Append("<tr class=\"tr_listcontent\">\n");
        h_tab.Append("<tr class=\"tr_listcontent\">\n");
        string h_filed = "";//查询的字段
            h_head.Append("<td width=\"150\" align=\"left\">企业名称</td>\n");
            h_head.Append("<td width=\"150\" align=\"left\">企业代码</td>\n");
            h_text.Append("<td>*&nbsp;</td><td>*&nbsp;</td>");
            h_tab.Append("<td>&nbsp;</td><td>&nbsp;</td>");
        // Response.Write(h_filed);
        h_head.Append("</tr>");
        h_text.Append("</tr>");
        h_tab.Append("</tr>");
        listtemphead.InnerHtml = h_head.ToString();
        listtemp1.InnerHtml = h_text.ToString();
        listtemp2.InnerHtml = h_tab.ToString();
        list.SqlStr = "select fld_1202_1,fld_1202_2 from gmis_mo_1202  where 1=1 " + h_filter;//+p_filter[2].ToString();
        list.Rows = list.DataTable.Rows.Count;
    }
}
/*
 * 函数：SearchMid()
 * 功能：查找关联的表,整合了从条件里面涉及到的表和从字段显示所涉及到的表。
 */
private void SearchMid()
{
   string h_mid="";//mid组串
   db.SqlString ="select distinct modulecode from gmis_field where fieldname in(select fld_1243_1 from gmis_mo_1243 where fld_1243_5!='1202' and fld_1243_6='"+id+"')";
   DataTable h_dtt = db.GetDataTable();
   if (h_dtt.Rows.Count > 0)
   {
       foreach (DataRow dr in h_dtt.Rows)
       {
           h_mid += dr[0].ToString() + ",";//取出显示字段所在表的mid

       }
   }

    h_mid = h_mid.ToString().Trim(',');
    if (h_mid != "")
    {
        string[] h_arr = h_mid.Split(',');//mid临时字符串组
        if (h_arr.Length > 0)
        {
            for (int i = 0; i < h_arr.Length; i++)
            {
                for (int j = i + 1; j < h_arr.Length; j++)
                {
                    if (h_arr[i].ToString() == h_arr[j].ToString())
                    {
                        h_arr[j] = "0"; //将字符串数组里的元素做判断，当有重复数据时，将元素更改为0；
                    }
                }
            }
        }
        h_mid = "";//清掉前期数据

        for (int i = 0; i < h_arr.Length; i++)//去掉字符串数组里被改为0后的元素
        {
            if (h_arr[i] != "0")
            {
                h_mid += h_arr[i] + ",";
            }
        }
        p_mid = h_mid.ToString().Trim(',').Split(',');//将处理好后的mid组赋值给p_mid
    }
}

/*
 * 函数：BindExcelData()
 * 功能：绑定导出excel显示的数据
 */
private void BindExcelData()
{
    if (id == "0")
    {
        BindHead();
    }
    SearchMid();
    StringBuilder h_head = new StringBuilder();//表头
    StringBuilder h_text = new StringBuilder();//内容
    StringBuilder h_tab = new StringBuilder();//空白
    Response.Write("###");
    db.SqlString = "select fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_5 from gmis_mo_1243 where fld_1243_6= " + id;
	DataTable h_dt = db.GetDataTable();
    if (h_dt.Rows.Count > 0)
    {
        h_head.Append("<table width=\"100%\" border=\"1\" cellpadding=\"3\" cellspacing=\"1\" style=\"border-collapse:collapse\" class=\"righttableline\">\n<tr >\n");
        h_text.Append("<tr >");
        h_tab.Append("<tr >");
        string h_filed = "";//查询的字段
        foreach (DataRow dr in h_dt.Rows)
        {
            if (dr["fld_1243_1"].ToString() == "fld_1235_1") h_filed += " (select fld_1236_1 from gmis_mo_1236 where mocode=" + dr["fld_1243_1"].ToString() + "),";
            else h_filed += dr["fld_1243_1"].ToString() + ",";
            if (dr["fld_1243_2"].ToString() == "污染物编号") dr["fld_1243_2"] = "污染物名称";
            h_head.Append("<td width=\"" + dr["fld_1243_3"] + "\" align=\"left\">" + dr["fld_1243_2"] + "</td>\n");
            h_text.Append("<td>*&nbsp;</td>");
            h_tab.Append("<td>&nbsp;</td>");
        }
        //Response.Write(h_filed);
        h_head.Append("</tr>");
        h_text.Append("</tr>");
        h_tab.Append("</tr>");
        h_filed = h_filed.ToString().Trim(',');
        listtemphead.InnerHtml = h_head.ToString();
        listtemp1.InnerHtml = h_text.ToString();
        listtemp2.InnerHtml = h_tab.ToString();
        string h_filter = "";//条件
        for (int i = 0; i < p_filter.Length - 1; i++)
        {
            h_filter += p_filter[i].ToString();
        }
        string h_orderby = "";//排序
        if (p_filter[p_filter.Length - 1].ToString() != "") h_orderby = " order by " + p_filter[p_filter.Length - 1].ToString();
        string h_jointab = "";
        if (p_mid != null)
        {
            for (int i = 0; i < p_mid.Length; i++)
            {
                h_jointab += " left outer join gmis_mo_" + p_mid[i].ToString() + " b" + i + " on fld_1202_2=b" + i + ".fld_" + p_mid[i].ToString() + "_1 ";
            }
        }
        if (h_filed.ToString() != "" && p_t != "1")
        {
            list.SqlStr = "select " + h_filed + " from gmis_mo_1202  " + h_jointab + " where 1=1 " + h_filter + h_orderby;//+p_filter[2].ToString();
            list.Rows = list.DataTable.Rows.Count;
        }
        //Response.Write("select " + h_filed + " from gmis_mo_1202 left outer join gmis_mo_1235 on fld_1202_2=fld_1235_2  " + h_jointab + " where 1=1 " + h_filter + h_orderby);//+p_filter[2].ToString(););
    }
    else
    {
        h_head.Append("<table width=\"100%\" border=\"1\" style=\"border-collapse:collapse\" cellpadding=\"3\" cellspacing=\"1\" >\n<tr>\n");
        h_text.Append("<tr>\n");
        h_tab.Append("<tr>\n");
        string h_filed = "";//查询的字段
        h_head.Append("<td width=\"150\" align=\"left\">企业名称</td>\n");
        h_head.Append("<td width=\"150\" align=\"left\">企业代码</td>\n");
        h_text.Append("<td>*&nbsp;</td><td>*&nbsp;</td>");
        h_tab.Append("<td>&nbsp;</td><td>&nbsp;</td>");
        // Response.Write(h_filed);
        h_head.Append("</tr>");
        h_text.Append("</tr>");
        h_tab.Append("</tr>");
        listtemphead.InnerHtml = h_head.ToString();
        listtemp1.InnerHtml = h_text.ToString();
        listtemp2.InnerHtml = h_tab.ToString();
    }
}


//导出为EXCEL
protected void Go_OutPutData(object sender, System.EventArgs e)
{
    Response.Clear();
    Response.Buffer = true;
    Response.Charset = "GB2312";
    Response.AppendHeader("Content-Disposition", "attachment;filename=高级查询.xls");
    Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
    Response.ContentType = "application/ms-excel";
    this.EnableViewState = false;
    System.Globalization.CultureInfo myCItrad2 = new System.Globalization.CultureInfo("ZH-CN", true);
    System.IO.StringWriter oStringWriter2 = new System.IO.StringWriter(myCItrad2);
    System.Web.UI.HtmlTextWriter oHtmlTextWriter2 = new System.Web.UI.HtmlTextWriter(oStringWriter2);
    oHtmlTextWriter2.Write(hiddenHtml.Value);
    Response.Write(oStringWriter2.ToString());
    Response.End();
}

//按钮事件
private void Filter_Change(object sender, System.EventArgs e)
{
    string h_idstr = ((Control)sender).ID;//按钮名
    switch (h_idstr)
    {
        case "btn_print"://打印
            //BindExcelData();
            Page.RegisterStartupScript("", "<scrip" + "t >window.print();</scrip" + "t>");
            break;
        default:
            break;
    }

}
public override void BeforeOutput(DataTable dt, int rowi)
{
    DataRow dr = dt.Rows[rowi];
    dr["orgcode"] = StringUtility.StringToBase64(dr["fld_1202_2"].ToString());
    dr["hycode"] = StringUtility.StringToBase64(dr["fld_1202_20"].ToString().Substring(0,2));
}
</script>

<body>
<form id="form1" runat="server">
<input id="fld_1242_2" runat="server" type="hidden" style="width:1000px" /><!--从弹出页读取的，用来存放所有的SQL条件以及排序语句-->
<input id="showcaption" runat="server" type="hidden" style="width:1000px" /><!--从弹出页读取的，用来存放所有的条件的待显示字段-->
<input id="selectfiled" runat="server" type="hidden" /><!--判断是否设置显示字段-->
<asp:LinkButton ID="BindData_Btn" runat="server" OnClick="BindData"></asp:LinkButton>
<div align="center" >
<div id="btnContainter" runat="server">
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"-->
    <!--#include file="toolbar_17.aspx"--> 
			<!--右边固定按钮-->
			<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="打印"></G:Button></td> 
            <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel" type="toolbar" mode="on" text="导出EXCEL" Url="javascript:clickOutPutExcel();" ></G:Button> </td> 
			<asp:LinkButton ID="btn_excel" OnClick="Go_OutPutData" runat="server"></asp:LinkButton>
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
</div>
<div id="divOutPut">
<G:ListTable ID="list"  IsProPage="true" runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		
	</G:Template>	
	<%--<G:navstyle5  id="nav" runat="server" pageurl="pop_1241_2.aspx"></G:navstyle5>--%>
</G:ListTable>
</div>
</div>

<input id="hiddenHtml" type="hidden" runat="server" />
	<script type="text/javascript" language="javascript">
function clickOutPutExcel()
{
    document.getElementById("hiddenHtml").value= document.getElementById("companyname").innerText+document.getElementById("divOutPut").innerHTML;
   __doPostBack("btn_excel","");
}
</script>
</form>
</body>
</html>
