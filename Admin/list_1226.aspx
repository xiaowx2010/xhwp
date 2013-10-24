<!--��ҵ�������ͳ��-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	<script type="text/javascript">
function viewprintPreview(aim){
	var p = open(aim,"Preview","fullscreen=no,status=yes,toolbar=no,menubar=no,location=no,resizable=yes,scrollbars=yes,directories=no",true);
	p.focus();
}

</script>
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    StringBuilder p_sb; //XML����
private void Page_Load(object sender, System.EventArgs e)
{    
	mid = GetQueryString("mid", "0");
	navindex = GetQueryString("navindex", "0");
    string h_preview = GetQueryString("preview", "0");
    if (h_preview != "0")//��ӡԤ��
    {
        tb_21.Visible = false;
        Td1.Visible = true;
    }
    else
    {
        Td1.Visible = false;
    }
    if (!IsPostBack)
    {
        sel_year.Items.Clear();
        for (int i = 1999; i <= DateTime.Now.Year; i++)
        {
            sel_year.Items.Add(i.ToString());
        }
        SetFilter(sel_year, DateTime.Now.Year.ToString());
    }
    
    if (sel_year.SelectedItem != null )
            sel_date.Value = sel_year.SelectedItem.Value;
    GetChartData();
    SetSESSION("guangye", "1");
}
//ͳ������
private void GetChartData()
{
    p_sb = new StringBuilder();//XML����
    string[] h_arrtype = new string[] { "������", "������", "������", "����������", "�㵹������" };//ͳ�Ʒ��༯��
    string[] h_arrname = new string[] { "�ܼ�", "ұ������", "��ú��", "¯��", "ú�ʯ","β��","����ʯ��","����","�����Է���","��������" };//ͳ�����
    DataTable h_dt = new DataTable();
    string h_filedname = "";
    for (int n = 0; n < h_arrname.Length; n++)
    {
        for (int i = 0; i < h_arrtype.Length; i++)
        {
            DataRow[] h_rows = GetFields("746").Select("caption like ('%" + h_arrtype[i].ToString() + "%') and caption like ('%" + h_arrname[n].ToString() + "%')");//��ȡ�ֶ�
            if (h_rows.Length > 0)
            {
                foreach (DataRow row in h_rows)
                {
                    h_filedname += "sum(" + row["fieldname"].ToString() + ") as " + row["fieldname"].ToString() + ",";
                }
            }
        }
    }
    
    //��ȡ����
    if (h_filedname.Trim(',') != "" && sel_date.Value.Trim() != "")
    {
        db.SqlString = "select " + h_filedname.Trim(',') + " from gmis_mo_746 where Cast(datepart(year,createdate) as varchar(50))='"+sel_date.Value+"'";
        h_dt = db.GetDataTable();
        
    }
    
    p_sb.Append("<chart caption='��ҵ�������ͳ��' xAxisName='ͳ����' numberSuffix='' showValues='0'>");
    p_sb.Append("<categories>");
    for (int i = 0; i < h_arrname.Length; i++)
    {
        p_sb.Append("<category label='" + h_arrname[i].ToString() + "' />");//�����ʾ
    }
    p_sb.Append("</categories>");
    for (int i = 0; i < h_arrtype.Length; i++)
    {
        p_sb.Append("<dataset seriesName='" + h_arrtype[i].ToString() + "'>");
        for (int n = 0; n < h_arrname.Length; n++)
        {
            DataRow[] h_rows = GetFields("746").Select("caption like ('%" + h_arrtype[i].ToString() + "%') and caption like ('%" + h_arrname[n].ToString() + "%')");//��ȡ�ֶ�
            
            if (h_rows.Length > 0)
            {
                foreach (DataRow dr in h_rows)
                {
                    for (int c = 0; c < h_dt.Columns.Count; c++)
                    {
                        if (h_dt.Columns[c].ColumnName.ToString() == dr["fieldname"].ToString())
                        {
                            p_sb.Append("<set value='" + h_dt.Rows[0][c].ToString() + "' />");//ͳ��ֵ
                        }
                    }
                }
            }
        }
        p_sb.Append("</dataset>");
    }
    p_sb.Append("</chart>");
}


//��ť�¼�
private void Filter_Change(object sender, System.EventArgs e)
{
    string h_idstr = ((Control)sender).ID;//��ť��
    switch (h_idstr)
    {
        case "btn_preview"://��ӡԤ��
            Page.RegisterStartupScript("", "<scrip" + "t >window.open('list_1226.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&navindex=0&pid=" + pid + "&preview=1');</scrip" + "t>");
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
<asp:LinkButton ID="btn_date" OnClick="Filter_Change" runat="server"></asp:LinkButton>
<input id="sel_date" runat="server" type="hidden" />
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
<div id="btnContainter" runat="server">

    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			    <td id="tb_sel" runat="server" nowrap>
			       <asp:DropDownList ID="sel_year" runat="server" AutoPostBack="true"></asp:DropDownList> �� 
			    </td>
			<!--�ұ߹̶���ť-->
			<td width="100%" nowrap>&nbsp;<span id="alertleft" runat="server" style="color:Red"></span></td>
			<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="��ӡ"></G:Button> </td> 
            <td id="tb_21" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_preview" runat="server" icon="search" type="toolbar" onclick="Filter_Change" mode="on" text="��ӡԤ��"></G:Button> </td> 
            

	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--����������-->
<!--��̬����html,��ʼ-->
<div id="chartdiv" align="center" style="padding-top:10px;"> </div>
<script type="text/javascript">      
CreateChartsControl("chartdiv","ChartId","Common/getcontrol.aspx?dir=Charts&key=MSColumn2D","<%=p_sb.ToString()%>", "100%", "350", "#ffffff");
</script> 

<!--��̬����html,����-->
</form>
</body>
</html>
