<!--ˮ���������Ϣ,�б�ҳ-->
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
    BindListData();
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
private void BindListData()
{
    string h_fstr = "";
    int pagesize = GetListRows();//��ȡ�б�ÿҳ��ʾ�ļ�¼��
    int fromcount = Convert.ToInt32(navindex) * pagesize;//�����ѷ���ҳ���ļ�¼��
    string tablename = "gmis_mo_37";//���ݱ�����
    string orderstr = " order by fld_37_1";//��������;
    //�����б�ؼ���ʾ����
    list.Rows = pagesize;
    //�����б�ؼ�����Դ
    list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount,'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_37_3,fld_37_4,fld_37_5,'' as btnstr,mocode from " + tablename + " t2 where mocode in (select top " + (fromcount + pagesize) + " mocode from " + tablename + " where 1=1 " + h_fstr + " " + orderstr + ") and mocode not in (select top " + fromcount + " mocode from " + tablename + " where 1=1 " + h_fstr + "" + orderstr + " ) " + h_fstr + " " + orderstr + " ";

}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
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
			
			<td >��������</td>
			<td >������λ��</td>
			<td >����ʱ��</td>
			<td width="5%">����</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td><a href="view_37.aspx?aid=*&mid=*&id=*&navindex=*">*</a></td>
			<td>*</td>
			<td>*</td>
			<td align="center">*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
				<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_37.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--��̬����html,����-->
</form>
</body>
</html>
