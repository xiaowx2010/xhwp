<!--���ݹ���-�ֶι���-����������Ϣ����-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string hycode = "";//��ҵ
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
    string h_fcode = GetQueryString("fcode", "0");
    if (h_fcode != "0" && h_fcode != "")
    {
        tb_backlist.Visible = false;
    }
    string orgcode = GetQueryString("orgcode", "0");//Response.Write(orgcode);
    if (orgcode != "0")
    {
        filter = " and fld_67_6='" + orgcode + "'";
    }
    else
    {
        filter = " and mocode=" + id;
    }
    view.SqlStr = "select fld_67_1,Cast(datepart(year,fld_67_2) as varchar(50))+'-'+Case when datepart(month,fld_67_2)<10 then ('0'+Cast(datepart(month,fld_67_2) as varchar(50))) else Cast(datepart(month,fld_67_2) as varchar(50)) end +'-'+Case when datepart(day,fld_67_2)<10 then ('0'+Cast(datepart(day,fld_67_2) as varchar(50))) else Cast(datepart(day,fld_67_2) as varchar(50)) end,fld_67_6,fld_67_3,(select fld_63_1 from gmis_mo_63 where gmis_mo_63.mocode=fld_67_4),fld_67_5 from gmis_mo_67 where 1=1 " + filter;
 
    if (view.DataTable != null && view.DataTable.Rows.Count > 0)
    {
        orgcode = view.DataTable.Rows[0]["fld_67_6"].ToString();
        
    }
    iframe_17.Attributes["src"] = "iframe_658.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&fcode=" + h_fcode;
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td>
<iframe id="iframe_17"  runat="server" frameborder="0"  width="100%" height="30" scrolling="no"></iframe>
</td></tr></table>
<div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--����������-->
<!--����-->

<G:Content ID="view" runat="server">
<G:Template id="tempview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
	    <td align="right"  class="td_viewcontent_title">��������λ���ƣ�</td>
	    <td class="td_viewcontent_content" colspan="3">*&nbsp;</td>
	   
    </tr>
    <tr> <td align="right"  class="td_viewcontent_title">�������ڣ�</td>
	    <td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	     <td align="right"  class="td_viewcontent_title">��λ���룺</td>
	    <td class="td_viewcontent_content"  style="width:35%">*&nbsp;</td></tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">���ɣ�</td>
	    <td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">�������ͣ�</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">������</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
</G:Template> 
</G:Content> 
<!--��̬���ɽ���-->
</form>
</body>
</html>