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
private void Page_Load(object sender, System.EventArgs e)
{
    //��Դ����ͳ��,flash����-->
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
    Random h_rd = new Random();
	string h_fs660 = ""; //��gmis_mo_660���ֶ�
	string h_fs732 = ""; //��gmis_mo_732���ֶ�
	string[] h_typestr = new string[] {"ԭú", "ϴ��ú", "����ϴú", "��ú", "��̿", "��¯ú��", "��¯ú��", "��Ȼ��", "Һ����Ȼ��", "Һ��ʯ����", "��������", "ԭ��", "����", "ú��", "����", "ȼ����", "����ȼ��", "����", "����", "�ۺ���Դ������"};//��Դ�����	
    //ģ������
    /*double[] h_arrdbl = new double[h_typestr.Length];

    for (int k = 0; k < h_arrdbl.Length; k++)
    {
        h_arrdbl[k] = h_rd.NextDouble() * 3735345;
    }
    */
	string[] h_valuestr = new string[] {"��������","���У�����ԭ����"};	  //ͳ������
    p_sb.Append("<chart caption='��Դ����ͳ��' decimals='2' numberPrefix='' plotSpacePercent='40' showValues='0'  baseFontSize='12'  rotateYAxisName='0'   rotateLabels='1'><categories >");
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
    for (int j = 0; j < h_valuestr.Length; j++)
    {
        p_sb.Append("<dataset seriesName='" + h_valuestr[j] + "'>");

        h_linestr = (j == 0) ? "sums1" : "sums2";
        for (int i = 0; i < h_typestr.Length; i++)
        {
            h_fs660 = GetPicFieldName("660", " and caption like '%" + h_valuestr[j] + "%' and caption like '%" + h_typestr[i] + "%' ");
            h_fs732 = GetPicFieldName("732", " and caption like '%" + h_valuestr[j] + "%' and caption like '%" + h_typestr[i] + "%' ");
            if (h_fs660 != "" || h_fs732 != "")
            {
                if (h_fs660 != "")
                {
                    DataTable h_dt660 = db.GetDataTable(db.ConnStr, "select sum(" + h_fs660 + ") from gmis_mo_660");
                    if (h_dt660.Rows.Count > 0)
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
                p_sb.Append("<set value='" + h_value.ToString() + "' />");

                h_picdt.Rows[i][h_linestr] = Math.Round(h_value, 2).ToString();
                h_value = 0;//��0
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
    }
*/

    p_sb.Append("</chart>");
}
/***************************************************************
��������GetPicFieldName(string mid, string caption)
��;����ȡ�ֶ����� 
������mid(ģ��ID)��filter(��������)
�����/����:������  2009-6-18
***************************************************************/
private string GetPicFieldName(string mid, string filter)
{
    DataTable h_fdt = db.GetDataTable(db.ConnStr, "select fieldname from gmis_field where modulecode=" + mid + " and fieldstatus=0 " + filter + " order by fieldindex asc");
    if (h_fdt != null && h_fdt.Rows.Count > 0)
    {

        return h_fdt.Rows[0]["fieldname"].ToString();
    }
    return "";
}
</script>

<body style="padding:0px;text-align:center; vertical-align:top;">
<div id="chartdiv1215" align="center" style="width:100%" ></div>
<script type="text/javascript">  
  
CreateChartsControl("chartdiv1215","ChartId","Common/getcontrol.aspx?dir=Charts&key=MSColumn2D","<%=p_sb.ToString()%>", "850", "273", "#f2f2f2");
if(yfla.version()>7){

}else{
	window.parent.location.href= "player/upgrade.htm";
} 
</script>
</body>
</html>