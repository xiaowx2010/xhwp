<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
	<script runat=server language=C#>
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!IsSystemDeveloper())
			{
				Response.Redirect("getpage.aspx");
			}
			SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����		
            list.Rows = GetListRows();
            list.SqlStr = GetListSQL(Convert.ToInt32(navindex) * list.Rows, list.Rows);
        }
        private string GetListSQL(int fromcount, int pagerows)
        {
            return "declare @allcount int;select @allcount=count(1) from gmis_action;select @allcount as allcount,'" + StringUtility.StringToBase64("view") + "'," + mid + ",actioncode," + navindex + ",actionname,case when Actionlink='' then '&nbsp;' else Actionlink end,'&nbsp;' as btnstr from gmis_action where actioncode not in (select top " + fromcount + " actioncode from gmis_action order by actioncode) and actioncode in (select top " + (fromcount + pagerows) + " actioncode from gmis_action order by actioncode) order by actioncode";
        }
		public override void BeforeOutput(DataTable dt, int rowi)
		{
			DataRow dr = dt.Rows[rowi];   
			if (mua.IndexOf(";3;") != -1)
			{
				dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["actioncode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
			}

			if (mua.IndexOf(";4;") != -1)
			{
				dr["btnstr"] += "<a href=\"javascript:if(confirm('ȷ��ɾ����')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["actioncode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"ɾ��\" align=\"absmiddle\" border=\"0\"></a>";
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
<G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
<G:Template id="listtemphead" type="head" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
    <tr class="tr_listtitle">
		<td>&nbsp;</td>
		<td width="60%" align="left">������</td>
		<td width="32%" align="left">�ⲿ����</td>
		<td width="8%"align="center">����</td>
    </tr>
</G:Template>
<G:Template id="listtemp1" runat="server">
	<tr class="tr_listcontent">
		<td>&nbsp;</td>
		<td align="left"><a href="view_action.aspx?aid=*&mid=*&id=*&navindex=*" title="�鿴��ϸ">*</a></td>
		<td align="left">*</td>
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
<G:NavStyle5 ID="NavStyle" PageUrl="getpage.aspx" runat="server"></G:NavStyle5>
</G:ListTable>        
</form>
</body>
</html>