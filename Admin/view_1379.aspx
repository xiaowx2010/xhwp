<!--n302_2_cˮ����ֳ�����䣩��Ⱦ���_����,�鿴ҳ-->
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
<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">����:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">����:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">���:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">����������:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">�����ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������1:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���1:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">COD������:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">COD�ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����1:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����1:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">���ű���:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��Ʒ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������2:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���2:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">����:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��������:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����2:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����2:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">ͭ������:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">ͭ�ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������3:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���3:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">п������:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">п�ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����3:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����3:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">��ֳģʽ:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ֳƷ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������4:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���4:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">��ֳˮ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">������:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����4:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����4:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">�ܵ�������:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">�ܵ��ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������5:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���5:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">���ײ�����:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">�����ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����5:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����5:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������6:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���6:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����6:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����6:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������7:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���7:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����7:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����7:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������8:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���8:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����8:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����8:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
		</tr>
	</table>
</G:Template>
</G:Content>
<!--��̬����html,����-->
</form>
</body>
</html>
