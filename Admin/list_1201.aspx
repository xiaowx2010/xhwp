<!--��������,�б�ҳ-->
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
        BindListControl(fld_1201_2, "fld_1201_2", "fld_1201_2_index", "select distinct fld_1201_2,('�� '+cast(fld_1201_2 as varchar(10))+' ��') as fld_1201_2_index from gmis_mo_1201", "ȫ���㼶");
        if (GetSESSION("filter") != "")
        {
            SetFilter(fld_1201_2, GetSESSION("filter"));
        }
        else
        SetFilter(fld_1201_2, "0");
    }

    if (fld_1201_2.SelectedItem != null && fld_1201_2.SelectedItem.Value != "0")
    {
        h_fstr += " and fld_1201_2=" + fld_1201_2.SelectedItem.Value;
    }
     
    int pagesize = GetListRows();//��ȡ�б�ÿҳ��ʾ�ļ�¼��
    int fromcount = Convert.ToInt32(navindex) * pagesize;//�����ѷ���ҳ���ļ�¼��
    list.Rows = pagesize;

   list.SqlStr = "declare @allcount int;select @allcount=count(1) from gmis_mo_1201 where 1=1 " + h_fstr + " ;select   @allcount as allcount,'' as preTopic,'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_1201_1,'&nbsp;' as btnstr,fld_1201_2 from gmis_mo_1201 where mocode in (select top " + (fromcount + pagesize) + " mocode from gmis_mo_1201 where 1=1 " + h_fstr + " order by fld_1201_5) and mocode not in (select top " + fromcount + " mocode from gmis_mo_1201 where 1=1 " + h_fstr + " order by fld_1201_5)" + h_fstr + " order by fld_1201_5";
   

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

    for (int i = 1; i < Convert.ToUInt32(dr["fld_1201_2"]); i++)
    {
        dr["preTopic"] = "&nbsp;&nbsp;&nbsp;&nbsp;" + dr["preTopic"].ToString();
    }
}
private void Change_Level(object sender, System.EventArgs e)
{
    if (fld_1201_2.SelectedItem != null)
    {
        SetSESSION("filter", fld_1201_2.SelectedItem.Value);
    }
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<td><asp:DropDownList runat="server" ID="fld_1201_2" Width="160" AutoPostBack="true" OnSelectedIndexChanged="Change_Level"></asp:DropDownList></td>
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			<td >��������</td>
			<td width="5%" align="center">����</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td>*<a href="view_1201.aspx?aid=*&mid=*&id=*&navindex=*" title="�鿴��ϸ">*&nbsp;</a></td>
			<td align="center">*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_1201.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--��̬����html,����-->
</form>
</body>
</html>
