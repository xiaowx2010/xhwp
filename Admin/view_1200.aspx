<!--��ҵ���루ͳһ��,�鿴ҳ-->
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
    view.SqlStr = "select fld_1200_1,fld_1200_8,(case fld_1200_2 when '1' then '��ҵԴ' when '2' then '����Դ' when '3' then '����ʽ��Ⱦ������ʩ' else '' end),fld_1200_3,(select fld_1200_1 from gmis_mo_1200 a where a.mocode=b.fld_1200_4),fld_1200_7 from gmis_mo_1200 b where mocode=" + id;
    //Response.Write(view.SqlStr);   
}
private void Edit_Click(object sender, System.EventArgs e)
{
    Response.Redirect("getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id);
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<td width="100%" align="right">
			    <G:Button id="btn_edit" type="toolbar" mode="on" text="���ݹ���" onclick="Edit_Click" runat="server"></G:Button>
			</td>
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
            <G:Content id="view" runat="server">
            <G:Template id="Template1" runat="server">
                <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:8px;">
                    <tr>
	                    <td width="100" align="right"  class="td_viewcontent_title">��ҵ����:</td>
	                    <td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
                    </tr>
                    <tr>
	                    <td width="100" align="right"  class="td_viewcontent_title">��ҵ����:</td>
	                    <td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
                    	
	                    <td width="100" align="right"  class="td_viewcontent_title">����:</td>
	                    <td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
                    	
                    </tr>
                    <tr>
	                    <td width="100" align="right"  class="td_viewcontent_title">�㼶:</td>
	                    <td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	                    <td width="100" align="right"  class="td_viewcontent_title">ֱ���ϼ�:</td>
	                    <td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
                    </tr>
                    <tr>
	                    <td width="100" align="right"  class="td_viewcontent_title">����˵��:</td>
	                    <td colspan="3" class="td_viewcontent_content" ><div style="height:295px;">*&nbsp;</div></td>
	                </tr>
                </table>
            </G:Template>
            </G:Content>
<!--��̬����html,����-->
</form>
</body>
</html>
