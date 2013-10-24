<!--�����������,�б�ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--
����gmis_mo_24
������gmis_mo_23��������������gmis_mo_23.fld_23_1=gmis_mo_24.fld_24_1��gmis_mo_23.fld_23_2=gmis_mo_24.fld_24_2��gmis_mo_23.fld_23_3=gmis_mo_24.fld_24_8��
-->
<script language="C#" runat="server">
string sortid, sortdir;
private void Page_Load(object sender, System.EventArgs e)
{    
     
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
	sortid = GetQueryString("sortid", "");  //�����ֶ�
    sortdir = GetQueryString("sortdir", "1");  //1����0����
	tb_2.Visible=false;//����������ť
	
	if (!IsPostBack)
	{		
		//�󶨼����ֶ�������		
		select_field.Items.Add(new ListItem("-��ѡ��-","0"));
		select_field.Items.Add(new ListItem("��λ����","1"));
        select_field.Items.Add(new ListItem("��λ����","2"));    		

		string h_field = "0";//�ֶ�
		if (GetSESSION("filter") != "")
		{
			//ʹ��������ʽȡ��Session�������     
			Regex r;
			Match m;
		   
			r = new Regex(".*?sdate=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				guangye.SetControlValue(startdate, m.Result("${txt}")); 
			}	
			
			r = new Regex(".*?edate=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				guangye.SetControlValue(enddate, m.Result("${txt}")); 
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
		SetFilter(select_field, h_field);
	}

	BindDataList();
}

/***************************************************************
��������BindDataList()
��;�����б�
�����/����:������  2009-4-28
***************************************************************/
private void BindDataList()
{	
	/*����ɸѡ����*/

	int pagesize = GetListRows();//��ȡ�б�ÿҳ��ʾ�ļ�¼��
	int fromcount = Convert.ToInt32(navindex) * pagesize;//�����ѷ���ҳ���ļ�¼��
	string h_tablename = "gmis_mo_24 a left outer join gmis_mo_23 b on a.fld_24_1=b.fld_23_1";//���ݱ�����
	string h_orderstr = " order by fld_24_3 desc";//��������;

	if (sortid != "")
	{
		h_orderstr = " order by " + sortid + " " + ((sortdir == "1") ? " desc" : " asc");
	}
	else
	{
		sortid = "fld_24_3";
	}
	
	ArrayList al = new ArrayList();//���ֶ�����
	StringBuilder h_sb_head = new StringBuilder();//������
	StringBuilder h_sb_temp1 = new StringBuilder();//������
	StringBuilder h_sb_temp2 = new StringBuilder();//����
	StringBuilder h_fsb = new StringBuilder();//SQL��ȡ�ֶ�
	string h_fstr = "";//SQL����

	
	al.Add(new string[] { "��λ����", "25%", "fld_23_4" });
	al.Add(new string[] { "��λ����", "18%", "fld_24_8" });
	al.Add(new string[] { "�ŷſڴ���", "18%", "fld_24_1" });
	al.Add(new string[] { "�����ŷ�Ũ��", "16%", "fld_24_7" });
	al.Add(new string[] { "�������", "15%", "fld_24_3" });
	h_sb_temp1.Append("<tr class=\"tr_listcontent\">\n<td><a href=\"getpage.aspx?aid=*&mid=*&id=*\">*</a></td>\n<td>*&nbsp;</td>\n<td>*&nbsp;</td>\n<td>*&nbsp;</td>\n<td>*&nbsp;</td>\n<td>*&nbsp;</td>\n</tr>\n");
	h_fsb.Append("'" + StringUtility.StringToBase64("view") + "'," + mid + ",a.mocode,fld_23_4,fld_24_8,fld_24_1,fld_24_7,Convert(nvarchar(10),fld_24_3,120),'' as btnstr,b.mocode as mcode");
	h_sb_temp2.Append("<tr class=\"tr_listcontent\">\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n");
	

	h_sb_head.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"righttableline\"><tr class=\"tr_listtitle\" align=\"left\">");
	
	sortdir = (sortdir == "0") ? "1" : "0";
	string h_dirstr = "";//����������
	string h_dirimg = "";//������ͼ��
	foreach (string[] arr in al)
	{
		if (arr[2] == sortid)
		{
			h_dirstr = (sortdir == "0") ? "����" : "����";
			h_dirimg = (sortdir == "0") ? "<img src=\"images/asc.gif\" style=\"margin:3px\" title=\"����\"/>" : "<img src=\"images/desc.gif\" style=\"margin:3px\" title=\"����\" />";

			h_sb_head.Append("<td style=\"padding-top:3px;\"  width=\"" + arr[1] + "\" ><a href=\"list_24.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&sortid=" + StringUtility.StringToBase64(arr[2]) + "&sortdir=" + sortdir + "\" class=\"listtitle\"  title=\"" + arr[0] + h_dirstr + "\">" + arr[0] + "</a>" + h_dirimg + "</td>\n");
			
		}
		else
		{
			h_sb_head.Append("<td width=\"" + arr[1] + "\" ><a href=\"list_24.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&sortid=" + StringUtility.StringToBase64(arr[2]) + "&sortdir=" + sortdir + "\" class=\"listtitle\"  title=\"" + arr[0] + "\">" + arr[0] + "</a></td>\n");
		}
	}
	h_sb_head.Append("<td width=\"8%\">����</td>\n</tr>\n");

	listtemphead.InnerHtml = h_sb_head.ToString();
	listtemp1.InnerHtml = h_sb_temp1.ToString();
	listtemp2.InnerHtml = h_sb_temp2.ToString();
	
	//��ӿ�ʼ����ɸѡ
	if (guangye.GetControlValue(startdate) != "")
	{
		h_fstr += " and datediff(day,fld_24_3,'"+guangye.GetControlValue(startdate)+"')<=0";
	}
	//��ӽ�������ɸѡ
	if (guangye.GetControlValue(enddate) != "")
	{
		h_fstr += " and datediff(day,fld_24_3,'"+guangye.GetControlValue(enddate)+"')>=0";
	}
	//����ֶ�ɸѡ����
	if (guangye.GetControlValue(key) != "" && guangye.GetControlValue(select_field) != "" && guangye.GetControlValue(select_field) != "0")
	{
		string h_field = (guangye.GetControlValue(select_field)=="1")?"fld_24_8":"fld_23_4";
		h_fstr += " and "+h_field+" like '%"+guangye.GetControlValue(key)+"%'";
	}

	//�����б�ؼ���ʾ����
	list.Rows = pagesize;

	//�����б�ؼ�����Դ
	list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + h_tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount,"+h_fsb.ToString()+" from " + h_tablename + "  where a.mocode in (select top " + (fromcount + pagesize) + "  a.mocode from " + h_tablename + " where 1=1 " + h_fstr + " " + h_orderstr + ") and a.mocode not in (select top " + fromcount + " a.mocode from " + h_tablename + " where 1=1 " + h_fstr + "" + h_orderstr + " ) " + h_fstr + " " + h_orderstr + " ";     
}


public override void BeforeOutput(DataTable dt, int rowi)
{	//����ǰҳ����

	DataRow dr = dt.Rows[rowi];
	
	if (mua.IndexOf(";3;") != -1)
	{
		dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&pid=" + dr["mocode"].ToString() + "&mid=" + mid + "&id=" + dr["mcode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
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
/***************************************************************
��������CheckSelect()
��;��ִ�в�ѯ
�����/����:������  2009-4-28
***************************************************************/
private void CheckSelect()
{	
	string h_fstr;//url����
	h_fstr ="";

	if (guangye.GetControlValue(startdate) != ""&&guangye.GetControlValue(enddate) != ""&&DateTime.Compare(Convert.ToDateTime(guangye.GetControlValue(startdate)),Convert.ToDateTime(guangye.GetControlValue(enddate)))>0)
	{
		alertmess.InnerHtml = "�������ʱ���ѡ�����";
	}
	else
	{
		if(guangye.GetControlValue(startdate)!="")
		{
			h_fstr += " and sdate='" + guangye.GetControlValue(startdate) + "'";
		}
		if(guangye.GetControlValue(enddate)!="")
		{
			h_fstr += " and edate='" + guangye.GetControlValue(enddate) + "'";
		}
		if(guangye.GetControlValue(select_field)!=""&&guangye.GetControlValue(select_field)!="0"&&guangye.GetControlValue(key)!="")
		{
			h_fstr += " and field='" + guangye.GetControlValue(select_field) + "' and key='" + guangye.GetControlValue(key) + "'";
		}
		SetSESSION("filter", h_fstr);
		Response.Redirect("list_24.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&navindex=0&sortid=" + sortid + "&sortdir=" + sortdir + "");
	}	
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�������ʱ���-->
			<td nowrap style="padding-left: 10px;">
				�������: ��&nbsp;<input id="startdate" class="boxbline" style="width: 60px;" type="text" runat="server" >
			   <G:GetDate id="get_startdate"  return="startdate" runat="server"  align="right"/>			  
			   <span style="padding-left:25px;padding-right:5px;">��</span>
			   <input id="enddate" class="boxbline" style="width: 60px;" type="text" runat="server" >       
			   <G:GetDate id="get_enddate"  return="enddate" runat="server" align="right"/>
			</td>
			<!--�������ʱ���-->
			<td nowrap style="padding-left: 25px;">
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
		
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_24.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--��̬����html,����-->
</form>
</body>
</html>
