<!--��ҵ��Ϣ,�鿴ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"   %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string hycode = "";
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����      
	string orgcode = GetQueryString("orgcode","");
	hycode = GetQueryString("hycode","");

	view.SqlStr = "select fld_1202_1,fld_1202_3,fld_1202_2,fld_1202_15,(select fld_1201_1 from gmis_mo_1201 where mocode=fld_1202_4),fld_1202_5,(select fld_1200_1 from gmis_mo_1200 where mocode=fld_1202_21),fld_1202_20,(select fld_1157_1+'|'+fld_1157_2 as name from gmis_mo_1157 where fld_1157_1=fld_1202_17),(select fld_1162_1+'|'+fld_1162_2 as name from gmis_mo_1162 where fld_1162_1=fld_1202_19),fld_1202_6,fld_1202_7,fld_1202_8,fld_1202_9,fld_1202_10,fld_1202_11,fld_1202_16,fld_1202_12,fld_1202_13,fld_1202_14,fld_1202_18 from gmis_mo_1202 where fld_1202_2='"+orgcode+"'";


	if(GetQueryString("isNew","")=="1")
	{
		iframe_1199.Attributes["src"] = "iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
	}
	else
	{
		iframe_1199.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
	}
}

</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
     <table width="100%">
         <tr>
             <td>
                 <iframe id="iframe_1199" runat="server" frameborder="0" width="100%" height="25"
                     scrolling="no"></iframe>
             </td>
         </tr>
     </table>
<!--ѡ�-->
<!--����������-->
<div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar_17.aspx"-->

			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"-->
</div> 
<!--����������-->
<!--��̬����html,��ʼ-->
<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:10px;">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ҵ����:</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ҵ��ϸ��ַ:</td>
		<td colspan="3" class="td_viewcontent_content" >*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ҵ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title">����������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	</tr>	
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��������:</td>
		<td class="td_viewcontent_content">
			*&nbsp;
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">������������:</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ҵ���:</td>
		<td class="td_viewcontent_content">
			*&nbsp;
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">��ҵ����:</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">�Ǽ�ע������:</td>
		<td class="td_viewcontent_content" style="width:35%">
		*&nbsp;
		</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">��ҵ��ģ:</td>
		<td class="td_viewcontent_content" style="width:35%">
		*&nbsp;
		</td>
	</tr>	
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">���ľ���:</td>
		<td class="td_viewcontent_content" style="width:35%">
		*&nbsp;&nbsp;��*&nbsp;&nbsp;'*&nbsp;&nbsp;"&nbsp;
		</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">����γ��:</td>
		<td class="td_viewcontent_content" style="width:35%">
		*&nbsp;&nbsp;��*&nbsp;&nbsp;'*&nbsp;&nbsp;"&nbsp;
		</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ϵ������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">��ϵ�˵绰:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">�������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">��������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ҵʱ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
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
