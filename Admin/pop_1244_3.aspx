<!--ȫ��ҵ�Զ���߼���ѯ�������ҳ-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" debug="true"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<script language="javascript">
function loadData()
{
    document.getElementById("reltable").value=opener.window.showTabName;
    document.getElementById("showfield").value=opener.window.showFld;
    document.getElementById("showOrder").value=" order by "+opener.window.showOrder;
    document.getElementById("fldcon").value=opener.window.showCondition;
    document.getElementById("showJS").value=opener.window.showBDS;
    document.getElementById("asName").value=opener.window.asName;
    __doPostBack('btn_binddata','');
}
</script>
<!--#include file="func.aspx"-->
<script language="c#" runat="server">
    private void Page_Load(object sender, System.EventArgs e)
    {      
        if (!IsPostBack)
        {
            Page.RegisterStartupScript("str", "<script" + " language='javascript'>loadData();</scr" + "ipt>"); 
        }
        
    }
    /*********************************
     * ������BindData(object sender,System.EventArgs e)
     * ���ã�������
     * �����ˣ�YJ
     *********************************/
    private void BindData(object sender,System.EventArgs e)
    {
        //Response.Write(guangye.GetControlValue(reltable)+"|"+guangye.GetControlValue(showfield)+"|"+guangye.GetControlValue(fldcon));
        StringBuilder h_head = new StringBuilder();//��ͷ
        StringBuilder h_text = new StringBuilder();//����
        StringBuilder h_tab = new StringBuilder();//�հ�
        string h_field = "";//��ѯ�ֶ�
        h_head.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  class=\"righttableline\">\n<tr class=\"tr_listtitle\">\n");
        h_text.Append("<tr class=\"tr_listcontent\">");
        h_tab.Append("<tr class=\"tr_listcontent\">");
        db.SqlString = "select caption,fieldname from gmis_field where modulecode>657 and modulecode<1028 and  isvital=0 ";
        DataTable h_dt = db.GetDataTable();
        string[] h_fld = guangye.GetControlValue(showfield).Trim(',').Split(',');//�ֶ���       
        for (int i = 0; i < h_fld.Length; i++)
        {
            DataRow[] h_dr = h_dt.Select("fieldname='" + h_fld[i] + "'");
            if (h_dr.Length > 0)
            {
                h_head.Append("<td>" + h_dr[0]["caption"].ToString() + "</td>");
                h_text.Append("<td>*&nbsp;</td>");
                h_tab.Append("<td>&nbsp;</td>");
                h_field += h_dr[0]["fieldname"].ToString() + ",";
            }
        }
        bool  h_tf= false;//�жϼ������Ƿ�Ϊsum
        string h_group=h_field.ToString().Trim(',');//�����ʽΪsumʱ��group by �ֶ�
        if (guangye.GetControlValue(asName) != "")
        {
            string[] h_fldas = guangye.GetControlValue(asName).Trim(',').Split(',');//������    
            string[] h_fldjs = guangye.GetControlValue(showJS).Trim('|').Split('|');
            for (int i = 0; i < h_fldas.Length; i++)
            {
                if (h_fldas[i].ToString() != "" && h_fldas[i]!=null)
                {
                    h_head.Append("<td>" + h_fldas[i].ToString() + "</td>");
                    h_text.Append("<td>*&nbsp;</td>");
                    h_tab.Append("<td>&nbsp;</td>");
                    string h_sfld = "";//��ѯ�ֶ�
                    h_sfld = h_fldjs[i].ToString() == null ? "" : h_fldjs[i].ToString();
                    if (h_sfld.IndexOf("sum") > -1) h_tf = true;//���������Ϊsum������Ϊ��
                    h_field += "" + h_sfld + " as " + h_fldas[i].ToString() + ",";
                }
            }
        }
        h_head.Append("</tr>");
        h_text.Append("</tr>");
        h_tab.Append("</tr>");
        h_field = h_field.ToString().Trim(',');
        listtemphead.InnerHtml = h_head.ToString();
        listtemp1.InnerHtml = h_text.ToString();
        listtemp2.InnerHtml = h_tab.ToString();
        string h_tabname = "";//������
        h_tabname = guangye.GetControlValue(reltable);
        string h_orderby = "";//����
        h_orderby = showOrder.Value.Trim(',');
        if (!h_tf)
        {
            list.SqlStr = "select " + h_field + " from " + h_tabname + " where 1=1 " + fldcon.Value + " " + h_orderby + "";
        }
        else  //�����ʽΪsum
        {
            list.SqlStr = "select " + h_field + " from " + h_tabname + " where 1=1 " + fldcon.Value + " group by "+h_group+" " + h_orderby + "";
        }
        list.Rows = list.DataTable.Rows.Count;
        SetSESSION("sql",list.SqlStr);
       // Response.Write(list.SqlStr);
    }

    /*
     * ������BindData()
     * ���ܣ�����ʾ����
     */
    private void BindData()
    {
        StringBuilder h_head = new StringBuilder();//��ͷ
        StringBuilder h_text = new StringBuilder();//����
        StringBuilder h_tab = new StringBuilder();//�հ�


        string h_sql = GetSESSION("sql");
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
        BindData();
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

        Page.RegisterStartupScript("str", "<script" + " language='javascript'>__doPostBack('btn_binddata','');</scr" + "ipt>"); 
    }
</script>
<body>
<form id="form1" runat="server"><input id="showfield" type="hidden" runat="server" /><!--��ʾ�ֶ�-->
<input id="reltable" type="hidden" runat="server" />
<input id="fldcon" runat="server" type="hidden"><!--������-->
<input id="showJS" type="hidden" runat="server" /><!--�������ֶ�-->
<input id="asName" runat="server" type="hidden" /><!--�����б���-->
<input id="showOrder" runat="server" value="-1" type="hidden" /><!--����-->
<div align="center" >
<div id="btnContainter" runat="server">
<asp:LinkButton ID="btn_binddata" runat="server" OnClick="BindData"></asp:LinkButton>

<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->	
						<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search"  type="toolbar" url="javascript:doOpenExcel()" mode="on" text="��ӡ"></G:Button> </td> 
            <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel"  onclick="Go_OutPutData" type="toolbar" mode="on" text="����EXCEL" ></G:Button> </td>
				
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<script language="javascript">
function doOpenExcel()
{
//    window.open('pop_1244_excel.aspx');
//alert("123");
//window.location.reload();
window.print();
}
</script>
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
