<!--S401_C ס�޲�����Ⱦ���_����-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>

<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string hycode = "";//��ҵ
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode","0");
        list1.SqlStr="select fld_990_2,fld_990_17,fld_990_5,fld_990_6,fld_990_16,fld_990_26,fld_990_15,fld_990_3,fld_990_4,fld_990_7,fld_990_8,fld_990_9,fld_990_10,fld_990_13,fld_990_14,fld_990_11,fld_990_12,fld_990_18,fld_990_19,fld_990_20,fld_990_24,fld_990_25,fld_990_21,fld_990_22,fld_990_23 from gmis_mo_990 b left outer join gmis_mo_989 a on a.fld_989_1=b.fld_990_1 where fld_989_1='"+orgcode+"'";
        list1.Rows=list1.DataTable.Rows.Count;
        list2.SqlStr = "select fld_991_3,fld_991_4,fld_991_5,fld_991_6,fld_991_7,fld_991_8,fld_991_9,fld_991_10,fld_991_11,fld_991_12,fld_991_14,fld_991_15,fld_991_17,fld_991_18,fld_991_20,fld_991_21,fld_991_22,fld_991_23,fld_991_24,fld_991_25,fld_991_19,fld_991_13,fld_991_16 from gmis_mo_991 b left outer join gmis_mo_989 a on a.fld_989_1=b.fld_991_1  where fld_989_1='" + orgcode + "'";
        list2.Rows=list2.DataTable.Rows.Count;
        string str989="";
        str989 = ",fld_989_32,fld_989_33,fld_989_18,fld_989_19,fld_989_2,fld_989_6,fld_989_23,fld_989_3,fld_989_7,fld_989_24,fld_989_27,fld_989_29,fld_989_28,fld_989_30,fld_989_12,fld_989_4,fld_989_8,fld_989_13,fld_989_5,fld_989_9,fld_989_40,fld_989_10,fld_989_25,fld_989_41,fld_989_11,fld_989_26,fld_989_22,fld_989_35,fld_989_36,fld_989_38,fld_989_37 ,fld_989_31 ";
        view.SqlStr = "select (select fld_988_4 from gmis_mo_988 where fld_988_1=fld_989_1),(select fld_988_2 from gmis_mo_988 where fld_988_1=fld_989_1) " + str989 + " ,fld_989_1 from gmis_mo_989 a   where fld_989_1='" + orgcode + "'";
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
<G:content id="view" runat="server">
<G:template id="template" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">����</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">����</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">һ����Ⱦ���������</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title">��ˮ����</td>
      <td width="100" align="center" class="td_viewcontent_content">&nbsp;&nbsp;������</td>
      <td width="100" align="center" class="td_viewcontent_content">&nbsp;&nbsp;*��</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title">���У�Ӫҵ����</td>
      <td width="100" align="center" class="td_viewcontent_content">&nbsp;&nbsp;������</td>
      <td width="100" align="center" class="td_viewcontent_content">&nbsp;&nbsp;���ޣ���</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title">���У���¯����</td>
      <td width="100" align="center" class="td_viewcontent_content">&nbsp;&nbsp;������</td>
      <td width="100" align="center" class="td_viewcontent_content">&nbsp;&nbsp;���ޣ���</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">*��</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">���ޣ���</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">���ޣ���</td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">��ѧ����������</td>
      <td align="center" class="td_viewcontent_content">&nbsp;������</td>
      <td align="center" class="td_viewcontent_content">*ǧ��</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">���У�Ӫҵ����</td>
      <td align="center" class="td_viewcontent_content">&nbsp;������</td>
      <td align="center" class="td_viewcontent_content">���ޣ�ǧ��</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">���У���¯����</td>
      <td align="center" class="td_viewcontent_content">&nbsp;������</td>
      <td align="center" class="td_viewcontent_content">&nbsp;���ޣ�ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">���ޣ�ǧ��</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">&nbsp;���ޣ�ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">����������</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">�ܵ�������</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">����������</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�����ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">�ܵ��ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">�����ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">���ײ�����</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">�����Ͳ�����</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">&nbsp;</td>
      <td colspan="2" align="center"class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�����ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">�������ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="9" align="center" class="td_viewcontent_title">������¯���ֲ�������Ⱦ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">��ҵ��������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��������</td>
      <td align="center"class="td_viewcontent_title">�������������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">�������������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">��ҵ��������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��������</td>
      <td align="center"class="td_viewcontent_title">���������ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">���������ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�̳�������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">��ú�Ҳ�����</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">����������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�̳��ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">��ú���ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">�����ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
</table>
 
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
   <tr>
      <td align="center" colspan="4" class="td_viewcontent_title">����ϵ�����㸨����Ϣ</td>
    </tr>
     <tr>
       <td align="right"  class="td_viewcontent_title" style="padding-right:5px; ">��ҵ����</td>
       <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right"  class="td_viewcontent_title">��ˮУ�˱�ʶ</td>
      <td width="230" align="left" class="td_viewcontent_content">* ( 0-������1-����)</td>
      <td width="122" align="right"  class="td_viewcontent_title">��ˮУ��ֵ</td>
      <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
     <td align="right"  class="td_viewcontent_title">��ˮУ��ϵ����Χ</td>
     <td align="left" class="td_viewcontent_content">*---*</td>
     <td align="right"  class="td_viewcontent_title">У����ˮ��</td>
     <td align="left" class="td_viewcontent_content">*</td>
   </tr>

  </table>
</G:template>
  </G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">�ġ�����ҵ��Ⱦ�������</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">����</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">��������</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">�������</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��ˮ������</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��ģ��</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">Ӫҵ����</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��Ӳ����</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">����</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�ܵ�</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ѧ������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">����</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">����</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">������</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��ˮ����ϵ��</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��ˮУ��ϵ������</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��ˮУ��ϵ�����ޡ�</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��ˮУ��ֵ</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��ˮ��������</td>
       <td rowspan="2"  align="center" class="td_viewcontent_title">��ˮ��������</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">��</td>
      <td align="center" class="td_viewcontent_title">1</td>
      <td align="center" class="td_viewcontent_title">2</td>
      <td align="center" class="td_viewcontent_title">3</td>
      <td align="center" class="td_viewcontent_title">4</td>
      <td align="center" class="td_viewcontent_title">5</td>
      <td align="center" class="td_viewcontent_title">6</td>
      <td align="center" class="td_viewcontent_title">7</td>
      <td align="center" class="td_viewcontent_title">8</td>
      <td align="center" class="td_viewcontent_title">9</td>
      <td align="center" class="td_viewcontent_title">10</td>
      <td align="center" class="td_viewcontent_title">11</td>
      <td align="center" class="td_viewcontent_title">12</td>
      <td align="center" class="td_viewcontent_title">13</td>
      <td align="center" class="td_viewcontent_title">14</td>
      <td align="center" class="td_viewcontent_title">15</td>
      <td align="center" class="td_viewcontent_title">16</td>
      <td align="center" class="td_viewcontent_title">17</td>
      <td align="center" class="td_viewcontent_title">18</td>
      <td align="center" class="td_viewcontent_title">19</td>
      <td align="center" class="td_viewcontent_title">20</td>
      <td align="center" class="td_viewcontent_title">21</td>
      <td align="center" class="td_viewcontent_title">22</td>
      <td align="center" class="td_viewcontent_title">23</td>
         <td align="center" class="td_viewcontent_title">24</td>
    </tr>
    <G:listbox id="list1" runat="server">
    <G:template id="templatelist1" runat="server">
    <tr>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
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
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">�塢����¯��Ⱦ�������</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
     <td colspan="2" align="center" class="td_viewcontent_title">�������������</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��������</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��ú��</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��ҵ����</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��ҵ��ˮ</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��ѧ������</td>
      <td colspan="2" align="center" class="td_viewcontent_title">¯��</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�̳�</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">��������</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">ԭ�ϴ���</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">ȼ������</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">������</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">ȼ�շ�ʽ</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">�ҷ�</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">���</td>
    </tr>
    <tr>
    <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
    </tr>
    <tr>
    <td align="center" class="td_viewcontent_title">1</td>
      <td align="center" class="td_viewcontent_title">2</td>
      <td align="center" class="td_viewcontent_title">3</td>
      <td align="center" class="td_viewcontent_title">4</td>
      <td align="center" class="td_viewcontent_title">5</td>
      <td align="center" class="td_viewcontent_title">6</td>
      <td align="center" class="td_viewcontent_title">7</td>
      <td align="center" class="td_viewcontent_title">8</td>
      <td align="center" class="td_viewcontent_title">9</td>
      <td align="center" class="td_viewcontent_title">10</td>
      <td align="center" class="td_viewcontent_title">11</td>
      <td align="center" class="td_viewcontent_title">12</td>
      <td align="center" class="td_viewcontent_title">13</td>
      <td align="center" class="td_viewcontent_title">14</td>
      <td align="center" class="td_viewcontent_title">15</td>
      <td align="center" class="td_viewcontent_title">16</td>
      <td align="center" class="td_viewcontent_title">17</td>
      <td align="center" class="td_viewcontent_title">18</td>
      <td align="center" class="td_viewcontent_title">19</td>
      <td align="center" class="td_viewcontent_title">20</td>
      <td align="center" class="td_viewcontent_title">21</td>
      <td align="center" class="td_viewcontent_title">22</td>
      <td align="center" class="td_viewcontent_title">23</td>
    </tr>
       <G:listbox id="list2" runat="server">
    <G:template id="templatelist2" runat="server">
    <tr>
     <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
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
