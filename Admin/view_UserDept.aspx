<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
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
			view.SqlStr = "select deptname from gmis_dept where deptcode="+id;
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
<!--����-->
<G:Content ID="view" runat="server">
<G:Template id="tempview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="right"  class="td_viewcontent_title">�������ƣ�</td>
        <td class="td_viewcontent_content">*</td>
        <td align="right"  class="td_viewcontent_title">״̬��</td>
        <td class="td_viewcontent_content">*</td>
    </tr>
    <tr> 
        <td align="right"  class="td_viewcontent_title">˵����</td>
        <td class="td_viewcontent_content" colspan="3">*</td>
    </tr>
</table>
</G:Template>                    
</G:Content>                                
</form>
</body>
</html>
