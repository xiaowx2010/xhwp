<!--���ݹ���-�ֶι���-�߽��������ŷ����-->
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
    string fcode = GetQueryString("fcode", "");
    hycode = GetQueryString("hycode", "");
	tb_2.Visible=false;
	if(aid=="list")
	{
		tb_backlist.Visible=false;
	}
	if (fcode != "")
    {
        tools.Visible = false;
    }
    string orgcode = GetQueryString("orgcode", "0");
    if (orgcode != "0")
    {
        filter = " and fld_35_7='" + orgcode + "'";
       list.SqlStr = "select fld_35_7,fld_35_6,fld_35_1,fld_35_2,fld_35_3,cast(fld_35_4 AS VARCHAR(10))+'��',cast(fld_35_5 AS VARCHAR(10))+'��' from gmis_mo_35 where 1=1 " + filter;
       list.Rows = list.DataTable.Rows.Count;
    }

    if (hycode != "")
    {
        tb_backlist.Visible = false;
        tb_backlist_1199.Visible = true;
        iframe_17.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&navindex=" + navindex + "&fcode=" + fcode + "&hycode=" + hycode;
    }
    else
    {
        iframe_17.Attributes["src"] = "iframe_658.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&navindex=" + navindex + "&fcode=" + fcode;
    }

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
			<!--#include file="toolbar_17.aspx"-->
			<td id="tb_backlist_1199" visible="false" runat="server" style="padding-left:5px;width:75px;" nowrap>
        <G:Button id="btn_backlist_1199" type="toolbar" mode="on" icon="tb13" text="�����б�" onclick="Click_BackList_1199" runat="server"></G:Button>
        </td>
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
	   </div>
<!--����������-->
<!--����-->
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">
<tr>
	<td valign="top"  style="width:100%" class="td_viewcontent_content" >
<G:listbox ID="list" runat="server">
<G:Template id="tempview" runat="server">
	<table width="100%" border="0"  cellspacing="0" >
    <tr valign="middle" class="zy_bold_lineX" align="left" height="22">
	  <td width="8%">��λ���룺</td>
	     <td width="15%" >*&nbsp;</td>
	   <td width="8%">��ȾԴ����:</td>
	    <td width="15%" >*&nbsp;</td>
	   <td width="8%">����Դ����:</td>
	    <td width="15%" >*&nbsp;</td>
    </tr>
    <tr valign="middle" class="zy_bold_lineX" align="left" height="22">   
	   <td width="8%">��ҹ��Ч����:</td>
	    <td>*&nbsp;</td>
	   <td width="8%">ҹ���ֵ����:</td>
	    <td>*&nbsp;</td>
	    <td width="8%">���:</td>
	    <td>*&nbsp;</td>
	</tr>
    <tr valign="middle"  align="left" height="22">   
	   <td width="8%">�·�:</td>
	    <td>*&nbsp;</td>	 	
	</tr>    
      <tr >
	<td colspan="6"  height=1 style="background-color:#627C9D"></td>
	</tr>
</table>
</G:Template> 
</G:listbox> 
</td></tr></table>
<!--��̬���ɽ���-->
</form>
</body>
</html>