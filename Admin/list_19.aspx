<!--��ˮ�ŷſ���Ⱦ�����ŷ����,�б�ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{   
     
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
	tb_2.Visible=false;//����������ť
	
	if (!IsPostBack)
	{
        int h_yearstr = Convert.ToInt32(DateTime.Now.Year);
		//�����������
		for (int i=h_yearstr-10;i<h_yearstr+10;i++)
		{
			select_year.Items.Add(new ListItem(i.ToString(),i.ToString()));
		}
		select_year.Items.Add(new ListItem("-ȫ��-","0"));

		//���·�������
		for (int i=1;i<13;i++)
		{
			select_month.Items.Add(new ListItem(i.ToString().PadLeft(2,'0'),i.ToString()));
		}
		select_month.Items.Add(new ListItem("-ȫ��-","0"));
		
		//�󶨼����ֶ�������		
		select_field.Items.Add(new ListItem("-��ѡ��-","0"));
		select_field.Items.Add(new ListItem("�ŷſڴ���","1"));
        select_field.Items.Add(new ListItem("�ŷſ�����","2"));    	
		

		string h_year = "0",h_month = "0",h_field = "0";//��ݣ��·ݣ��ֶ�
		if (GetSESSION("filter") != "")
		{
			//ʹ��������ʽȡ��Session�������     
			Regex r;
			Match m;
		   
			r = new Regex(".*?year=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				h_year =  m.Result("${txt}");
			}		

			r = new Regex(".*?month=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				h_month =  m.Result("${txt}");
			}

			r = new Regex(".*?field=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				h_field =  m.Result("${txt}");
			}		

			r = new Regex(".*?key=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				guangye.SetControlValue(key, m.Result("${txt}")); 
			}
		} 
		SetFilter(select_year, h_year);    
		SetFilter(select_month, h_month);    
		SetFilter(select_field, h_field);
	}
	
	string h_fstr = ""; //ɸѡ���� 

	//������ɸѡ����
	if (guangye.GetControlValue(select_year) != "" && guangye.GetControlValue(select_year) != "0")
	{
		h_fstr += " and fld_19_3 = "+guangye.GetControlValue(select_year)+"";
	}

	//����·�ɸѡ����
	if (guangye.GetControlValue(select_month) != "" && guangye.GetControlValue(select_month) != "0")
	{
		h_fstr += " and fld_19_4 = "+guangye.GetControlValue(select_month)+"";
	}
	
	//����ֶ�ɸѡ����
	if (guangye.GetControlValue(key) != "" && guangye.GetControlValue(select_field) != "" && guangye.GetControlValue(select_field) != "0")
	{
		string h_field = (guangye.GetControlValue(select_field)=="1")?"fld_19_2":"(select fld_53_2 from gmis_mo_53 where fld_53_1=fld_19_2)";
		h_fstr += " and "+h_field+" like '%"+guangye.GetControlValue(key)+"%'";
	}

	list.SqlStr = "select  '" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode,fld_19_3,fld_19_4,fld_19_2,'' btnstr from gmis_mo_19 where 1=1 "+h_fstr+" order by fld_19_3 desc,fld_19_4 desc";
	list.Rows = GetListRows();
}
public override void BeforeOutput(DataTable dt, int rowi)
{	//����ǰҳ����

	DataRow dr = dt.Rows[rowi];
	if (mua.IndexOf(";3;") != -1)
	{
		dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
	}

	if (mua.IndexOf(";4;") != -1)
	{
		dr["btnstr"] += "<a href=\"javascript:if(confirm('ȷ��ɾ����')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"ɾ��\" align=\"absmiddle\" border=\"0\"></a>";
	}

}

//��ť��ѯ
private void Click_Seach(object sender, System.EventArgs e)
{   
	CheckSelect();//ִ�в�ѯ	
}
//��ݡ��·�ɸѡ
private void Change_Date(object sender, System.EventArgs e)
{
	CheckSelect();//ִ�в�ѯ	
}
/***************************************************************
��������CheckSelect()
��;��ִ�в�ѯ
�����/����:������  2009-4-29
***************************************************************/
private void CheckSelect()
{
	
	string h_fstr;//url����
	h_fstr ="";

	if (guangye.GetControlValue(select_year) != "" && guangye.GetControlValue(select_year) != "0")
	{
		h_fstr = " and year='" + guangye.GetControlValue(select_year) + "'";
	}
	
	if (guangye.GetControlValue(select_month) != "" && guangye.GetControlValue(select_month) != "0")
	{
		h_fstr = " and month='" + guangye.GetControlValue(select_month) + "'";
	}
	if(guangye.GetControlValue(select_field)!=""&&guangye.GetControlValue(select_field)!="0"&&guangye.GetControlValue(key)!="")
	{
		h_fstr += " and field='" + guangye.GetControlValue(select_field) + "' and key='" + guangye.GetControlValue(key) + "'";
	} 
	SetSESSION("filter", h_fstr);
	Response.Redirect("list_19.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&navindex=0");
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
		<!--���-->
		<td nowrap >
		   ��ݣ�<asp:DropDownList ID="select_year" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server" >
			</asp:DropDownList>
		</td>
		<!--���-->
		<!--�·�-->
		<td nowrap style="padding-left: 10px;">
		   �·ݣ�<asp:DropDownList ID="select_month" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server" >
			</asp:DropDownList>
		</td>
		<!--�·�-->
		<td nowrap style="padding-left: 10px;">
			ѡ���ֶΣ�<asp:DropDownList ID="select_field" runat="server" Width="120px">
			</asp:DropDownList>
		</td>
		<td nowrap style="padding-left: 10px;">
			�ؼ��֣�<input id="key" runat="server" type="text" style="width: 120px;" onkeydown="javascript:{if(event.keyCode==13)__doPostBack('btn_seach$btn','');}" />
		</td>
		<td nowrap style="padding-left: 10px;">
			<G:Button id="btn_seach" type="toolbar" mode="on" icon="tb08" text="��ѯ" onclick="Click_Seach"
				runat="server">
			</G:Button>
		</td>
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			<td >���ŷ����</td>
			<td width="5%">����</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td><a href="getpage.aspx?aid=*&mid=*&id=*" target="_blank">*��*��*�ŷſ����ŷ����</a></td>
			<td align="center">*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_19.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--��̬����html,����-->
</form>
</body>
</html>
