<!--ͼ������,�鿴ҳ-->
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
	mid = GetQueryString("mid", "0");
	id = GetQueryString("id", "0");

	SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 
	view.SqlStr = "select Featurename,t.typename,Featurebrief,case when Featurestate = 0 then '����' when Featurestate = -1 then '����' when Featurestate = 1 then '����' else '&nbsp;' end as Featurestate,Featuredepth,Featuredesc from gmis_Feature f Left Outer Join gmis_type t on f.typecode=t.typecode where Featurecode="+id;
   
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
        <td  class="td_viewcontent_title" align="right">ͼ������</td>
        <td  class="td_viewcontent_content" colspan="3">&nbsp;*</td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" width="160" align="right">�����㣺</td> 
        <td class="td_viewcontent_content" width="200">&nbsp;*</td>               
        <td class="td_viewcontent_title"  width="160" align="right">��ƣ�</td>
        <td  class="td_viewcontent_content" width="200">&nbsp;*</td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">״̬��</td>
        <td class="td_viewcontent_content">&nbsp;*</td>
        <td class="td_viewcontent_title" align="right">��ȣ�</td>
        <td class="td_viewcontent_content">&nbsp;*</td>
    </tr>
    <tr>
        <td class="td_viewcontent_title" align="right">���ܣ�</td>
        <td class="td_viewcontent_content" colspan="3"><div style="width:500px;overflow-x:auto">&nbsp;*<div></td>
    </tr>
</table>
</G:Template>
</G:Content>
<!--��̬����html,����-->
</form>
</body>
</html>
