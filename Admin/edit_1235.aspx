<!--��Ⱦ���ŷ������,�༭ҳ-->
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
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��Ⱦ����:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1235_1" class="boxbline" style="width:95%;"  maxlength="4" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">��ҵ����:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1235_2" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1235_3" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">�ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1235_4" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��������λ:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1235_5" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">�ŷ�����λ:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1235_6" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">���㷽��:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1235_7" class="boxbline" style="width:95%;"  maxlength="4" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
		</tr>
	</table>
<!--��̬����html,����-->
</form>
</body>
</html>
