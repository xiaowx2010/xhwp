<!--S405_C ���о�����Ⱦ���_����-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>

<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<script language="c#" runat="server">
    string hycode = "";
private void Page_Load(object sender,System.EventArgs e)
{
    SetToolBar();
   hycode = GetQueryString("hycode", "");
    string     orgcode = GetQueryString("orgcode", "0");
    view.SqlStr="select (select fld_1022_2 from gmis_mo_1022 where fld_1022_1=fld_1023_1),fld_1023_19,fld_1023_15,fld_1023_4,fld_1023_20,fld_1023_22,fld_1023_7,fld_1023_18,fld_1023_9,fld_1023_5,fld_1023_23,fld_1023_12,fld_1023_6,fld_1023_16,fld_1023_11,fld_1023_8,fld_1023_24,fld_1023_13,fld_1023_10,fld_1023_14,fld_1023_17,fld_1023_21,fld_1023_1 from gmis_mo_1023 a where fld_1023_1='"+orgcode+"'";
    list.SqlStr = "select fld_1024_2,fld_1024_3,fld_1024_4,fld_1024_5,fld_1024_6,fld_1024_7 from gmis_mo_1024 b left outer join gmis_mo_1023 a on a.fld_1023_1=b.fld_1024_1 where fld_1023_1='"+orgcode+"'";
    list.Rows=list.DataTable.Rows.Count;
    iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
}
</script>
<body>

<form id="form1" runat="server">
    <!--ѡ�-->
        <table width="100%">
            <tr>
                <td>
<iframe id="iframe_658"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
    <!--����������-->
    </div>
    <!--����-->
<!--����������--> 

<!--����������-->
<G:content id="view" runat="server">
<G:template id="templateview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">��λ����</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">һ����Ⱦ���������</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td align="center" class="td_viewcontent_title">������ˮ������</td>
      <td align="center" class="td_viewcontent_content">*��</td>
      <td align="center" class="td_viewcontent_title">��������������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��</td>
      <td align="center"class="td_viewcontent_title">�ܵ�������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">������ˮ�ŷ���</td>
      <td align="center" class="td_viewcontent_content">*��</td>
      <td align="center"class="td_viewcontent_title">���������ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��</td>
      <td align="center"class="td_viewcontent_title">�ܵ��ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">����������</td>
      <td align="center"class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">ʳ���Ͳ�����</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">���ײ�����</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�����ŷ���</td>
      <td align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">ʳ�����ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">�����ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">��ѧ������������</td>
      <td align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">��������������������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">�������������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">��ѧ�������ŷ���</td>
      <td align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">���������������ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">�������������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">ú��������</td>
      <td align="center" class="td_viewcontent_content">*���</td>
      <td align="center"class="td_viewcontent_title">���̳�������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">������������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*���������</td>
    </tr>
</table>
</G:template>
</G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" style="margin-top:5px; ">
    <tr>
      <td align="center" class="td_viewcontent_title">����</td>
      <td align="center" class="td_viewcontent_title">�������������</td>
      <td align="center" class="td_viewcontent_title">�������������</td>
      <td  align="center" class="td_viewcontent_title">���̳�������</td>
      <td  align="center" class="td_viewcontent_title">������������</td>
      <td  align="center" class="td_viewcontent_title">ú��������</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">��</td>
      <td align="center" class="td_viewcontent_title">1</td>
      <td align="center" class="td_viewcontent_title">2</td>
      <td align="center" class="td_viewcontent_title">3</td>
      <td align="center" class="td_viewcontent_title">4</td>
      <td align="center" class="td_viewcontent_title">5</td>
    </tr>
    <G:listbox id="list" runat="server">
    <G:template id="templatelist" runat="server">
    <tr>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    </G:template>
    </G:listbox>
  </table>
  </form>
</body>
</html>
