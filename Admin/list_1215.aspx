<!--��Դ����ͳ��,�б�ҳ-->
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
StringBuilder p_sb=new StringBuilder();//��ͼ��
private void Page_Load(object sender, System.EventArgs e)
{   
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 
    string h_preview = GetQueryString("preview", "0");
	tb_2.Visible=false;
    if (h_preview != "0")//��ӡԤ��
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
��������GetChartData()
��;����ͼ��
�����/����:������  2009-6-18
***************************************************************/
private void GetChartData()
{
    //Random h_rd = new Random();
	string h_fs660 = ""; //��gmis_mo_660���ֶ�
	string h_fs732 = ""; //��gmis_mo_732���ֶ�
	string[] h_typestr = new string[] {"ԭú", "ϴ��ú", "����ϴú", "��ú", "��̿", "��¯ú��", "��¯ú��", "��Ȼ��", "Һ����Ȼ��", "Һ��ʯ����", "��������", "ԭ��", "����", "ú��", "����", "ȼ����", "����ȼ��", "����", "����", "�ۺ���Դ������"};//��Դ�����	
   //ģ������ֵ
    /* double[] h_arrdbl = new double[h_typestr.Length];
    
    for (int k = 0; k < h_arrdbl.Length; k++)
    {
        h_arrdbl[k] = h_rd.NextDouble() * 3735345;
    }
    */
	string[] h_valuestr = new string[] {"��������","���У�����ԭ����"};	  //ͳ������
	p_sb.Append("<chart caption='��Դ����ͳ��' decimals='2' numberPrefix='' showValues='0'   rotateYAxisName='0'  rotateLabels='1'><categories>");
	DataTable h_picdt = new DataTable();
	h_picdt.Columns.Add("captions");
	h_picdt.Columns.Add("sums1");		
	h_picdt.Columns.Add("sums2");	
	double h_value=0;//�ϼ�
	string h_linestr = "";//����
	for (int i =0;i<h_typestr.Length ;i++ )
	{
		p_sb.Append("<category label='"+h_typestr[i]+"' />");
		string h_per = ""; //��λ
		switch (h_typestr[i])
		{
			case "��¯ú��":
			case "��¯ú��":
			case "��Ȼ��":
				h_per = " (��������)";
				break;
			case "����ȼ��":
			case "�ۺ���Դ������":
				h_per = " (�ֱ�׼ú)";
				break;
			case "����":
				h_per = " (����ǧ��)";
				break;
			case "����":
				h_per = " (��ǧ��ʱ)";
				break;
			default:
				h_per = " (��)";
				break;
		}

		DataRow h_newdr = h_picdt.NewRow();
		h_newdr["captions"] = h_typestr[i]+h_per;
		h_newdr["sums1"] = "0";
		h_newdr["sums2"] = "0";
		h_picdt.Rows.Add(h_newdr);
	}
	p_sb.Append("</categories>"); 
	
	//���ڸ�����Ӧ�ı��ֶβ�ͬ������ֻ�ܷ���ѭ���ж�̬��ȡ��
    
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
                h_value=0;//��0
            }			
        }
        p_sb.Append("</dataset>");
    }
    //ģ������
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
            h_value = 0;//��0

        }
        p_sb.Append("</dataset>");
    }*/
   
		
		
	p_sb.Append("</chart>");


	//���б�ؼ�
	list.DataTable=h_picdt;
	list.Rows=h_picdt.Rows.Count;

}

/***************************************************************
��������GetPicFieldName(string mid, string caption)
��;����ȡ�ֶ����� 
������mid(ģ��ID)��filter(��������)
�����/����:������  2009-6-18
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
//����ΪEXCEL
protected void Go_OutPutData(object sender, System.EventArgs e)
{
    /**����ҳ���ϲ������������磺��ť**/
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

//��ť�¼�
private void Filter_Change(object sender, System.EventArgs e)
{
    string h_idstr = ((Control)sender).ID;//��ť��
    switch (h_idstr)
    { 
        case "btn_preview"://��ӡԤ��
            Page.RegisterStartupScript("", "<scrip" + "t >window.open('list_1215.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid="+mid+"&navindex=0&pid="+pid+"&preview=1');</scrip" + "t>");
            break;
        case "btn_print"://��ӡ
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
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="��ӡ"></G:Button> </td> 
			<td id="tb_21" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_preview" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="��ӡԤ��"></G:Button> </td> 
            <td id="tb_22" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_outputexcel" runat="server" icon="excel" type="toolbar" mode="on" text="����EXCEL" Url="javascript:clickOutPutExcel();"></G:Button> </td> 
			
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<!--ͼ��FLASH-->
<%--<div id="chartdiv" align="center" style="padding-top:10px;"> </div>
<script type="text/javascript">      
CreateChartsControl("chartdiv","ChartId","Common/getcontrol.aspx?dir=Charts&key=MSColumn2D","<%=p_sb.ToString()%>", "100%", "350", "#ffffff");
</script>--%>
</div>
<!--ͼ��FLASH-->
<!--�б�-->
<div id="divOutPut" runat="server">
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
<G:Template id="listtemphead" type="head" runat="server">
	<table width="100%"  border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;border: #999999 1px solid;margin-bottom: 10px;" >
	<tr lign="left" style="font-size: 12px;line-height: 22px;font-weight: bold;color: #FFFFFF;text-decoration: none;padding:0px 5px 0px 5px;background-color:#627C9D;">
		<td width="40%" style="border-top: #999999 1px solid;vertical-align: top;">��Դ�����</td>
		<td width="30%" style="border-top: #999999 1px solid;vertical-align: top;">��������</td>
		<td width="30%" style="border-top: #999999 1px solid;vertical-align: top;">���У�����ԭ����</td>
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
<!--�б�-->

<!--��̬����html,����-->
</form>
</body>
</html>
