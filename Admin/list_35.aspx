<!--�߽��������ŷ����,�б�ҳ-->
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

        list.SqlStr = "select  '" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_35_1,fld_35_2,fld_35_3,cast(fld_35_4 AS VARCHAR(10))+'��',cast(fld_35_5 AS VARCHAR(10))+'��','&nbsp;' as btnstr from gmis_mo_35 order by mocode desc";
        list.Rows = GetListRows();
        SetSESSION("extinfo", "35");
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
			<td >����Դ����</td>
			<td >��ҹ��Ч����</td>
			<td >ҹ���ֵ����</td>
			<td >���</td>
			<td >�·�</td>
			<td width="5%" align="center">����</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td><a href="view_35.aspx?aid=*&mid=*&id=*&navindex=*" title="�鿴��ϸ">*&nbsp;</a></td>
			<td>*</td>
			<td>*</td>
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
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_35.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--��̬����html,����-->
</form>
</body>
</html>
