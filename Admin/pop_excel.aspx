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
<script language="c#" runat="server">
string[] p_filter,p_mid;//条件数组，模块数组
string p_t;//判断是否显示数据
private void Page_Load(object sender,System.EventArgs e)
{
  navindex = GetQueryString("navindex","0");
  p_t = GetQueryString("t","0");
  id = GetQueryString("id","0");
  p_filter = GetSESSION("filter").Split('*');
  SearchMid();
  if (GetSESSION("filter") != "***") BindData();
}
/*
 * 函数：BindData()
 * 功能：绑定显示数据
 */
private void BindData()
{
    StringBuilder h_head=new StringBuilder();//表头
    StringBuilder h_text=new StringBuilder();//内容
    StringBuilder h_tab=new StringBuilder();//空白

    
    
    db.SqlString="select fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_5 from gmis_mo_1243 where fld_1243_6= "+id;

    if (db.GetDataTable().Rows.Count > 0)
    {
        h_head.Append("<table width=\"100%\" border=\"1\" cellpadding=\"3\" cellspacing=\"1\" style=\"border-collapse:collapse\" class=\"righttableline\">\n<tr >\n");
        h_text.Append("<tr >");
        h_tab.Append("<tr >");
        string h_filed = "";//查询的字段
        foreach (DataRow dr in db.GetDataTable().Rows)
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
/*
 * 函数：SearchMid()
 * 功能：查找关联的表,整合了从条件里面涉及到的表和从字段显示所涉及到的表。
 */
private void SearchMid()
{
   string h_mid="";//mid组串
   //db.SqlString = "select distinct fld_1239_5 from gmis_mo_1239 where fld_1239_2 in(select fld_1243_1 from gmis_mo_1243 where fld_1243_5='1239')";
   db.SqlString = "select distinct modulecode from gmis_field where fieldname in(select fld_1243_1 from gmis_mo_1243 where fld_1243_5!='1202' and fld_1243_6='" + id + "')";
   DataTable h_dtt = db.GetDataTable();
   if (h_dtt.Rows.Count > 0)
   {
       foreach (DataRow dr in h_dtt.Rows)
       {
           h_mid += dr[0].ToString() + ",";//取出显示字段所在表的mid
       } 
   }

    db.SqlString = "select fld_1241_4 from "+GetModuleTableName("1241")+" where mocode="+id+"";
    DataTable h_dt = db.GetDataTable();
    if (h_dt.Rows.Count > 0&&h_dt.Rows[0][0].ToString()!="")
    {
        h_mid += h_dt.Rows[0][0].ToString();//取出条件所涉及到的表的MID
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


//导出为EXCEL
protected void Go_OutPutData(object sender, System.EventArgs e)
{
    /**隐藏页面上不导出的内容如：按钮**/
    btnContainter.Visible = false;
    guangye.Visible = false;
    Response.Clear();
    Response.Buffer = true;
    Response.Charset = "GB2312";
    Response.AppendHeader("Content-Disposition", "attachment;filename=高级查询.xls");
    Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-7");
    Response.ContentType = "application/ms-excel";
    this.EnableViewState = false;
    System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
    System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
    System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
    this.RenderControl(oHtmlTextWriter);
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
        case "btn_print"://打印
            Page.RegisterStartupScript("", "<scrip" + "t >window.print();</scrip" + "t>");
            break;
        default:
            break;
    }

}
</script>

<body>
<form id="form1" runat="server">
<div align="center">
<div id="btnContainter" runat="server">
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="打印"></G:Button> </td> 
            <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel" type="toolbar" mode="on" text="导出EXCEL" onclick="Go_OutPutData"></G:Button> </td> 
			
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
</div>
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
</form>
</body>
</html>
