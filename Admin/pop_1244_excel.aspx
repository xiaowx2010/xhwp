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
  BindData();
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


    string h_sql= GetSESSION("sql");
    if (h_sql.ToString() != "")
    {
        string h_fld = h_sql.ToString().Substring(h_sql.ToString().IndexOf("select") + 6, h_sql.ToString().IndexOf("from") - 6);//取出显示字段
        db.SqlString = "select fieldname,caption,isvital from gmis_field where ((modulecode>657 and modulecode<1028) or modulecode in(1093,683,828,907,1018,1021)) and isvital=0 ";
        string[] h_arr = h_fld.ToString().Trim().Split(',');
        if (h_arr.Length > 0)
        {
            h_head.Append("<table width=\"100%\" border=\"1\" cellpadding=\"3\" cellspacing=\"1\" style=\"border-collapse:collapse\" class=\"righttableline\">\n<tr >\n");
            h_text.Append("<tr >");
            h_tab.Append("<tr >");
            for (int i = 0; i < h_arr.Length; i++)
            {

                DataRow[] drr = db.GetDataTable().Select(" fieldname='" + h_arr[i].ToString().Trim() + "'");
                if (drr.Length > 0)
                {
                    h_head.Append("<td>" + drr[0]["caption"].ToString() + "</td>");
                    h_text.Append("<td>*</td>");
                    h_tab.Append("<td>&nbsp;</td>");
                }

            }
            h_head.Append("</tr>");
            h_text.Append("</tr>");
            h_tab.Append("</tr>");
        }
        listtemphead.InnerHtml = h_head.ToString();
        listtemp1.InnerHtml = h_text.ToString();
        listtemp2.InnerHtml = h_tab.ToString();
        list.SqlStr = h_sql;
        list.Rows = list.DataTable.Rows.Count;
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
    Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
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
</G:ListTable>
</div>
</form>
</body>
</html>
