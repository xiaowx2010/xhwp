<!--���ݹ���-�ֶ�ģ��-Σ����ȾԴ����-->
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
	dtable = "gmis_Mo_51";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_51_1" ,"creatorcode"};
    mflds = new string[] { "Σ����ȾԴ����|fld_51_1" };
    types = "01";
    if (!IsPostBack) {//�Ȱ��б�
        creatorcode.Value = GetUID();//������ID
		if(id != "0"){//������ֵ
		    guangye.BindData(dtable,filter,flds);
		}
        
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
<input id="creatorcode" runat="server" type="hidden" />
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
	<tr>
	    <td align="right"  width="100" class="td_viewcontent_title">Σ����ȾԴ����</td>
	    <td  width="35%" class="td_viewcontent_content"><input id="fld_51_1" style="width:95%;" class="boxbline" type="text" runat="server" /></td>
	    	    <td align="right"  width="100" class="td_viewcontent_title">&nbsp;</td>
	    <td  width="35%" class="td_viewcontent_content">&nbsp;</td>

    </tr>
</table>
<!--��̬���ɽ���-->
</form>
</body>
</html>