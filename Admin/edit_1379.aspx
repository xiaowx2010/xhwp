<!--n302_2_cˮ����ֳ�����䣩��Ⱦ���_����,�༭ҳ-->
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
		<td width="100" align="right"  class="td_viewcontent_title">����:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_1" class="boxbline" style="width:95%;"  maxlength="32" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">����:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_1" class="boxbline" style="width:95%;"  maxlength="32" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_2" class="boxbline" style="width:95%;"  maxlength="16" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">����������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_2" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">�����ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_3" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������1:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_3" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���1:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_4" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">COD������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_4" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">COD�ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_5" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����1:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_5" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����1:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_6" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">���ű���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_6" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��Ʒ���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_7" class="boxbline" style="width:95%;"  maxlength="2" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������2:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_7" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���2:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_8" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">����:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_8" class="boxbline" style="width:95%;"  maxlength="2" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_9" class="boxbline" style="width:95%;"  maxlength="5" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����2:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_9" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����2:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_10" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">ͭ������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_10" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">ͭ�ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_11" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������3:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_11" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���3:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_12" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">п������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_12" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">п�ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_13" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����3:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_13" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����3:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_14" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">��ֳģʽ:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_14" class="boxbline" style="width:95%;"  maxlength="2" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ֳƷ��:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_15" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������4:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_15" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���4:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_16" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">��ֳˮ��:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_16" class="boxbline" style="width:95%;"  maxlength="2" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_17" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����4:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_17" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����4:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_18" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">�ܵ�������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_18" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">�ܵ��ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_19" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������5:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_19" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���5:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_20" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">���ײ�����:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_20" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">�����ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_21" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����5:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_21" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����5:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_22" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������6:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_23" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���6:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_24" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����6:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_25" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����6:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_26" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������7:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_27" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���7:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_28" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����7:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_29" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����7:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_30" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.��ֳƷ������8:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_31" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.��ֳƷ�ִ���8:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_32" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.Ͷ����8:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_33" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.����8:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_34" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
		</tr>
	</table>
<!--��̬����html,����-->
</form>
</body>
</html>
