<!--�۱�ά��������ά��,�б�ҳ-->
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
    string h_tablename = "gmis_module";//���ݱ����� 
    int h_pagesize = GetListRows();//��ȡ�б�ÿҳ��ʾ�ļ�¼��
    int h_fromcount = Convert.ToInt32(navindex) * h_pagesize;//�����ѷ���ҳ���ļ�¼��  
    string h_sortstr = " order by moduleindex";
    string h_fstr = " and modulestate=0 and modulelevel=3 and moduleindex like '%'+(select moduleindex from gmis_module where modulecode =" + mid + ")+'%'";

    list.Rows = h_pagesize;

    list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + h_tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount,'" + StringUtility.StringToBase64("list") + "',modulecode," + navindex + ",modulename from " + h_tablename + " where modulecode in (select top " + (h_fromcount + h_pagesize) + " modulecode from " + h_tablename + " where 1=1 " + h_fstr + " " + h_sortstr + ") and modulecode not in (select top " + h_fromcount + " modulecode from " + h_tablename + " where 1=1 " + h_fstr + "" + h_sortstr + " ) " + h_fstr + " " + h_sortstr;

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
		    <td width="100%">����</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
		    <td align="left"><a href="getpage.aspx?aid=*&mid=*&navindex=*" title="�鿴��ϸ">*</a>&nbsp;</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_1118.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--��̬����html,����-->
</form>
</body>
</html>
