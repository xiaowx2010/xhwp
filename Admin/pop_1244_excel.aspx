<!--ȫ��ҵ�Զ���߼���ѯ�������ҳ-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" debug="true"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <style type="text/css">
    	td {
	    font-family: ����, Verdana, Arial, Helvetica;
	    font-size: 12px;
	    text-decoration: none;
    }
    </style>
</head>
<!--#include file="func.aspx"-->
<script language="c#" runat="server">
string[] p_filter,p_mid;//�������飬ģ������
string p_t;//�ж��Ƿ���ʾ����
private void Page_Load(object sender,System.EventArgs e)
{
  navindex = GetQueryString("navindex","0");
  BindData();
}
/*
 * ������BindData()
 * ���ܣ�����ʾ����
 */
private void BindData()
{
    StringBuilder h_head=new StringBuilder();//��ͷ
    StringBuilder h_text=new StringBuilder();//����
    StringBuilder h_tab=new StringBuilder();//�հ�


    string h_sql= GetSESSION("sql");
    if (h_sql.ToString() != "")
    {
        string h_fld = h_sql.ToString().Substring(h_sql.ToString().IndexOf("select") + 6, h_sql.ToString().IndexOf("from") - 6);//ȡ����ʾ�ֶ�
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


//����ΪEXCEL
protected void Go_OutPutData(object sender, System.EventArgs e)
{
    /**����ҳ���ϲ������������磺��ť**/
    btnContainter.Visible = false;
    guangye.Visible = false;
    Response.Clear();
    Response.Buffer = true;
    Response.Charset = "GB2312";
    Response.AppendHeader("Content-Disposition", "attachment;filename=�߼���ѯ.xls");
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

//��ť�¼�
private void Filter_Change(object sender, System.EventArgs e)
{
    string h_idstr = ((Control)sender).ID;//��ť��
    switch (h_idstr)
    {
        case "btn_print"://��ӡ
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
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="��ӡ"></G:Button> </td> 
            <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel" type="toolbar" mode="on" text="����EXCEL" onclick="Go_OutPutData"></G:Button> </td> 
			
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
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
