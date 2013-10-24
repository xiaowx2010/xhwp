<!--�����������Ʒ���,�б�ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" debug=true%>
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
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
	tb_2.Visible=false;
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
		//��ɸѡ����			
		select_type.Items.Add(new ListItem("�����","1"));
        //select_type.Items.Add(new ListItem("���·�","2")); 
		SetFilter(select_type, "1");

		//���
		DataTable h_ydt = db.GetDataTable(db.ConnStr,"select distinct datepart(year,fld_1204_1) as year from gmis_mo_1204 order by datepart(year,fld_1204_1)");
		if (h_ydt.Rows.Count>0)
		{
			BindListControl(select_year, "year", "year", h_ydt);
			SetFilter(select_year, h_ydt.Rows[0][0].ToString());
		}		

		//�·�
		for (int i=1;i<13;i++)
		{
			select_month.Items.Add(new ListItem(i.ToString().PadLeft(2,'0'),i.ToString()));
		}
		SetFilter(select_month, "1");

		//����ָ��		
		string[] h_title = new string[] {"SO2(��������)","NO2(��������)","NOX(��������)","NO(һ������)","CO(һ����̼)","PM10(�����������)","ws(����)","wd(����)","t(�¶�)"};
		for(int i =0;i<h_title.Length;i++)
		{
			select_state.Items.Add(new ListItem(h_title[i],i.ToString()));			
		}
		SetFilter(select_state, "0");

		if (GetSESSION("filter") != "")
		{
			//ʹ��������ʽȡ��Session�������     
			Regex r;
			Match m;
		   
			r = new Regex(".*?type=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				SetFilter(select_type, m.Result("${txt}"));
			}	
			
			r = new Regex(".*?year=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				SetFilter(select_year, m.Result("${txt}"));
			}
			
			r = new Regex(".*?month=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				SetFilter(select_month, m.Result("${txt}"));
			}

			r = new Regex(".*?state=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				SetFilter(select_state, m.Result("${txt}"));
			}
		} 

		if (guangye.GetControlValue(select_type)=="1")
		{
			td_year.Visible = true;
		}
		else if (guangye.GetControlValue(select_type)=="2")
		{
			td_year.Visible = true;
			td_month.Visible = true;
		}
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
    Random h_rd = new Random();
	string h_fstr = "",h_group = "",h_field = ""; //����
	int h_max = 1;//���ѭ����
	string[] h_title = new string[] {"��������","��������","��������","һ������","һ����̼","�����������","����","����","�¶�"};
	string[] h_fields = new string[] {"sum(cast(fld_1204_2 as float)) as SO2","sum(cast(fld_1204_3 as float)) as NO1","sum(cast(fld_1204_4 as float)) as NOX","sum(cast(fld_1204_5 as float)) as NO","sum(cast(fld_1204_6 as float)) as CO","sum(cast(fld_1204_8 as float)) as PM10","sum(cast(fld_1204_9 as float)) as WS","sum(cast(fld_1204_10 as float)) as WD","sum(cast(fld_1204_11 as float)) as T"};
	DataTable h_picdt;
	
	if (guangye.GetControlValue(select_type)=="1")
	{
		p_sb.Append("<chart caption='�������������·���ͼ("+h_title[Convert.ToInt32(guangye.GetControlValue(select_state))]+")' xAxisName='��' yAxisName='"+h_title[Convert.ToInt32(guangye.GetControlValue(select_state))]+"'  showValues='0'>");
		h_max = 12;
		h_fstr = " and datepart(year,fld_1204_1) = "+ guangye.GetControlValue(select_year);
		h_group = "datepart(month,fld_1204_1)";
		h_field = h_fields[Convert.ToInt32(guangye.GetControlValue(select_state))]+",datepart(month,fld_1204_1) as times";
	}
	else if (guangye.GetControlValue(select_type)=="2")
	{
		p_sb.Append("<chart caption='�������������·���ͼ("+h_title[Convert.ToInt32(guangye.GetControlValue(select_state))]+")' xAxisName='��' yAxisName='"+h_title[Convert.ToInt32(guangye.GetControlValue(select_state))]+"'  showValues='0'>");
		h_max = DateTime.DaysInMonth(Convert.ToInt32(guangye.GetControlValue(select_year)),Convert.ToInt32(guangye.GetControlValue(select_month)));
		h_fstr = " and datepart(year,fld_1204_1) = "+ guangye.GetControlValue(select_year) +" and datepart(month,fld_1204_1) = "+guangye.GetControlValue(select_month);
		h_group = "datepart(day,fld_1204_1)";
		h_field = h_fields[Convert.ToInt32(guangye.GetControlValue(select_state))]+",datepart(day,fld_1204_1) as times";
	}
	h_picdt = new DataTable();
	h_picdt.Columns.Add("times");
	h_picdt.Columns.Add("sums");	
	DataTable h_dt = db.GetDataTable(db.ConnStr,"select "+h_field+" from gmis_mo_1204 where 1=1 "+h_fstr+" group by "+h_group);
	if (h_dt.Rows.Count>0)
	{
		for (int i =1;i<=h_max;i++ )
		{			
			DataRow[] h_dr = h_dt.Select("times="+i.ToString()+"");
			DataRow h_newdr = h_picdt.NewRow();
			h_newdr["times"] = i.ToString();
			if(h_dr.Length>0)
			{
				h_newdr["sums"] = h_dr[0][0].ToString();
			}
			else
			{
				h_newdr["sums"] =  "0";
			}
            p_sb.Append("<set label='" + i.ToString() + "' value='" + h_rd.Next(100).ToString() + "' />");
			//p_sb.Append("<set label='"+i.ToString()+"' value='"+h_newdr["sums"].ToString()+"' />");
			h_picdt.Rows.Add(h_newdr);
		}
	}

	p_sb.Append("</chart>");		

}


//���ɸѡ
private void Change_Type(object sender,System.EventArgs e)
{
	string h_fstr = "";//url����
	if (guangye.GetControlValue(select_type)!="")
	{
		h_fstr += " and type='" + guangye.GetControlValue(select_type) + "'";
	}
	SetSESSION("filter", h_fstr);
	Response.Redirect("list_1220.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&navindex=0");
}
//����ָ��ɸѡ
private void Change_Date(object sender,System.EventArgs e)
{
	string h_fstr = "";//url����
	if (guangye.GetControlValue(select_type)!="")
	{
		h_fstr += " and type='" + guangye.GetControlValue(select_type) + "'";
	}
	if (guangye.GetControlValue(select_year)!="")
	{
		h_fstr += " and year='" + guangye.GetControlValue(select_year) + "'";
	}
	if (guangye.GetControlValue(select_month)!="")
	{
		h_fstr += " and month='" + guangye.GetControlValue(select_month) + "'";
	}
	if (guangye.GetControlValue(select_state)!="")
	{
		h_fstr += " and state='" + guangye.GetControlValue(select_state) + "'";
	}
	SetSESSION("filter", h_fstr);
	Response.Redirect("list_1220.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&navindex=0");
}
//��ť�¼�
private void Filter_Change(object sender, System.EventArgs e)
{
    string h_idstr = ((Control)sender).ID;//��ť��
    switch (h_idstr)
    {
        case "btn_preview"://��ӡԤ��
            Page.RegisterStartupScript("", "<scrip" + "t >window.open('list_1220.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&navindex=0&pid=" + pid + "&preview=1');</scrip" + "t>");
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
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--ɸѡ���-->
			<td nowrap>
				ɸѡ���
				<asp:DropDownList ID="select_type" AutoPostBack=true OnSelectedIndexChanged="Change_Type" runat="server"></asp:DropDownList>
			</td>
			<!--ɸѡ���-->
			<!--���-->
			<td id="td_year" visible=false runat=server style="padding-left:15px" nowrap>
				��ݣ�
				<asp:DropDownList ID="select_year" AutoPostBack=true OnSelectedIndexChanged="Change_Date" runat="server"></asp:DropDownList>
			</td>
			<!--���-->
			<!--�·�-->
			<td id="td_month" visible=false runat=server style="padding-left:15px" nowrap>
				�·ݣ�
				<asp:DropDownList ID="select_month" AutoPostBack=true OnSelectedIndexChanged="Change_Date" runat="server"></asp:DropDownList>
			</td>
			<!--�·�-->
			<!--����ָ��-->
			<td style="padding-left:15px" nowrap>
				����ָ�꣺
				<asp:DropDownList ID="select_state" AutoPostBack=true OnSelectedIndexChanged="Change_Date" runat="server"></asp:DropDownList>
			</td>
			<!--����ָ��-->
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<td id="Td1" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_print" runat="server" icon="search" onclick="Filter_Change" type="toolbar" mode="on" text="��ӡ"></G:Button> </td> 
            <td id="tb_21" nowrap runat="server" style="padding-left:5px;"><G:Button id="btn_preview" runat="server" icon="search" type="toolbar" onclick="Filter_Change" mode="on" text="��ӡԤ��"></G:Button> </td> 
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<!--ͼ��FLASH-->
<div id="chartdiv" align="center" style="padding-top:10px;"> </div>
<script type="text/javascript">      
CreateChartsControl("chartdiv","ChartId","Common/getcontrol.aspx?dir=Charts&key=Area2D","<%=p_sb.ToString()%>", "100%", "350", "#ffffff");
</script> 
<!--ͼ��FLASH-->
<!--��̬����html,����-->
</form>
</body>
</html>
