<!--��ҵ���루ͳһ��,�б�ҳ-->
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
    string h_fstr = "";

    if (!IsPostBack)
    {
        BindListControl(fld_1200_3, "fld_1200_3", "fld_1200_3_index", "select distinct fld_1200_3,('�� '+cast(fld_1200_3 as varchar(10))+' ��') as fld_1200_3_index from gmis_mo_1200","ȫ���㼶");
        
		string h_levelstr = "0";
		if (GetSESSION("filter") != "")
		{
			//ʹ��������ʽȡ��Session�������     
			Regex r;
			Match m;
		   
			r = new Regex(".*?key=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				guangye.SetControlValue(key,m.Result("${txt}"));
			}	
			
			r = new Regex(".*?level=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				h_levelstr = m.Result("${txt}");				
			}
		}
		SetFilter(fld_1200_3, h_levelstr);
    }

    if (fld_1200_3.SelectedItem != null && fld_1200_3.SelectedItem.Value != "0")
    {
        h_fstr += " and fld_1200_3=" + fld_1200_3.SelectedItem.Value; 
    }
	if (guangye.GetControlValue(key) != "")
	{
		h_fstr += " and fld_1200_1 like '%"+guangye.GetControlValue(key)+"%'" ;
	}
    int pagesize = GetListRows();//��ȡ�б�ÿҳ��ʾ�ļ�¼��
    int fromcount = Convert.ToInt32(navindex) * pagesize;//�����ѷ���ҳ���ļ�¼��
    list.Rows = pagesize;
    
    list.SqlStr = "declare @allcount int;select @allcount=count(1) from gmis_mo_1200 where 1=1 " + h_fstr + " ;select   @allcount as allcount,'' as preTopic,'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_1200_1,(case fld_1200_2 when '1' then '��ҵԴ' when '2' then '����Դ' when '3' then '����ʽ��Ⱦ������ʩ' else '' end),'&nbsp;' as btnstr,fld_1200_3 from gmis_mo_1200 where mocode in (select top " + (fromcount + pagesize) + " mocode from gmis_mo_1200 where 1=1 " + h_fstr + " order by fld_1200_6) and mocode not in (select top " + fromcount + " mocode from gmis_mo_1200 where 1=1 " + h_fstr + " order by fld_1200_6)" + h_fstr + " order by fld_1200_6";
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

    for (int i = 1; i < Convert.ToUInt32(dr["fld_1200_3"]); i++)
    {
        dr["preTopic"] = "&nbsp;&nbsp;&nbsp;&nbsp;" + dr["preTopic"].ToString();
    }
}


    private void Change_Level(object sender, System.EventArgs e)
    {
        string h_filter = "";
		if (guangye.GetControlValue(key) != "")
        {
			h_filter += " and key='" + guangye.GetControlValue(key) + "'";
		}
		if (guangye.GetControlValue(fld_1200_3) != "0")
        {
            h_filter += " and level='" + guangye.GetControlValue(fld_1200_3) + "'";
        }
		SetSESSION("filter", h_filter);
    }
	private void Click_Seach(object sender, System.EventArgs e)
    {
		string h_filter = "";
		if (guangye.GetControlValue(key) != "")
        {
			h_filter += " and key='" + guangye.GetControlValue(key) + "'";
		}
		if (guangye.GetControlValue(fld_1200_3) != "0")
        {
            h_filter += " and level='" + guangye.GetControlValue(fld_1200_3) + "'";
        }
		SetSESSION("filter", h_filter);
	}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<td><asp:DropDownList runat="server" ID="fld_1200_3" Width="160" AutoPostBack="true" OnSelectedIndexChanged="Change_Level"></asp:DropDownList></td>
			<td nowrap style="padding-left: 10px;">
				��ҵ���ƣ�<input id="key" runat="server" type="text" style="width: 100px;" onkeydown="javascript:{if(event.keyCode==13)__doPostBack('btn_seach$btn','');}" />
			</td>
			<td nowrap style="padding-left: 10px;">
				<G:Button id="btn_seach" type="toolbar" mode="on" icon="tb08" text="��ѯ" onclick="Click_Seach"
					runat="server">
				</G:Button>
			</td>
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			<td >��ҵ����</td>
			<td >����</td>
			<td width="5%" align="center">����</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td>*<a href="view_1200.aspx?aid=*&mid=*&id=*&navindex=*" title="�鿴��ϸ">*&nbsp;</a></td>
			<td>*</td>
			<td align="center">*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_1200.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--��̬����html,����-->
</form>
</body>
</html>
