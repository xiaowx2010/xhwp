<!--S402_C �������ҵ��Ⱦ���_����-->
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
        string orgcode= GetQueryString("orgcode","0");
        hycode = GetQueryString("hycode", "");
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
        list1.SqlStr="select fld_997_2,fld_997_21,fld_997_3,fld_997_20,fld_997_30,fld_997_4,fld_997_15,fld_997_5,fld_997_6,fld_997_7,fld_997_8,fld_997_9,fld_997_10,fld_997_13,fld_997_14,fld_997_11,fld_997_12,fld_997_16,fld_997_17,fld_997_18,fld_997_19,fld_997_22,fld_997_23,fld_997_31,fld_997_32,fld_997_24,fld_997_25,fld_997_26,fld_997_27,fld_997_28,fld_997_29 from gmis_mo_997 b left outer join gmis_mo_996 a on a.fld_996_1=b.fld_997_1 where fld_996_1='"+orgcode+"'";
        list1.Rows=list1.DataTable.Rows.Count;
        list2.SqlStr="select fld_998_2,fld_998_3,fld_998_4,fld_998_5,fld_998_6,fld_998_7,fld_998_8,fld_998_9,fld_998_10,fld_998_11,fld_998_12,fld_998_14,fld_998_15,fld_998_17,fld_998_18,fld_998_20,fld_998_21,fld_998_13,fld_998_16,fld_998_19,fld_998_22,fld_998_23,fld_998_24,fld_998_25 from gmis_mo_998 b  left outer join gmis_mo_996 a on a.fld_996_1=b.fld_998_1  where fld_996_1='"+orgcode+"'";
        list2.Rows=list2.DataTable.Rows.Count;
        string str996="";
        str996 = ",fld_996_35,fld_996_36,fld_996_18,fld_996_19,fld_996_45,fld_996_26,fld_996_30,fld_996_46,fld_996_27,fld_996_31,fld_996_32,fld_996_22,fld_996_28,fld_996_33,fld_996_23,fld_996_29,fld_996_4,fld_996_14,fld_996_5,fld_996_15,fld_996_10,fld_996_2,fld_996_6,fld_996_11,fld_996_3,fld_996_7,fld_996_43,fld_996_8,fld_996_24,fld_996_44,fld_996_9,fld_996_25,fld_997_2,fld_996_38,fld_996_39,fld_996_41,fld_996_40,fld_996_34";
        view.SqlStr="select (select fld_995_4 from gmis_mo_995 where fld_995_1=fld_996_1),(select fld_995_2 from gmis_mo_995 where fld_995_1=fld_996_1) "+str996+",fld_996_1 from gmis_mo_996 a left outer join gmis_mo_997 b on a.fld_996_1=b.fld_997_1 where fld_996_1='"+orgcode+"'";
        iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
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
<G:template id="template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">��λ����</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��λ����</td>
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
      <td rowspan="2" align="center" class="td_viewcontent_title">��ˮ����</td>
      <td  align="center" class="td_viewcontent_content">������</td>
      <td  align="center" class="td_viewcontent_content">*��</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">���У�Ӫҵ����</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td  align="center" class="td_viewcontent_content">(��)��</td>
      <td  rowspan="2" align="center" class="td_viewcontent_title">���У���¯����</td>
      <td  align="center" class="td_viewcontent_content">������</td>
      <td  align="center" class="td_viewcontent_content">(��)��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">*��</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">(��)��</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">(��)��</td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">��ѧ����������</td>
      <td align="center" class="td_viewcontent_content">&nbsp;������</td>
      <td align="center" class="td_viewcontent_content">*ǧ��</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">���У�Ӫҵ����</td>
      <td align="center" class="td_viewcontent_content">&nbsp;������</td>
      <td align="center" class="td_viewcontent_content">(��)ǧ��</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">���У���¯����</td>
      <td align="center" class="td_viewcontent_content">&nbsp;������</td>
      <td align="center" class="td_viewcontent_content">(��)ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">(��)ǧ��</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">(��)ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�ܸ�������</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*��</td>
      <td align="center"class="td_viewcontent_title">���ײ�����</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">Ǧ������</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�ܸ��ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��</td>
      <td align="center"class="td_viewcontent_title">�����ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">Ǧ�ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">ʯ�Ͳ�����</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">&nbsp;&nbsp;���۸��Ͳ�����</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*��</td>
      <td align="center"class="td_viewcontent_title">�軯�������</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">ʯ���ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">���۸��ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��</td>
      <td align="center"class="td_viewcontent_title">�軯���ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�ܵ�������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">��������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��</td>
      <td align="center"class="td_viewcontent_title">&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�ܵ��ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">���ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��</td>
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
      <td align="center"class="td_viewcontent_title">¯��������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�̳��ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">��ú���ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">¯���ŷ���</td>
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
      <td width="230" align="left" style="width:35%" class="td_viewcontent_content">*��0-������1-����</td>
      <td width="122" align="right"  class="td_viewcontent_title">��ˮУ��ֵ</td>
      <td width="210" align="left" style="width:35%" class="td_viewcontent_content">*&nbsp;</td>
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
      <td align="center" class="td_viewcontent_title">�ġ�����ҵ��Ⱦ�����</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">����</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">��������</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">�������</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��ģ��</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">Ӫҵ����</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��ˮ������</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��Ӳ����</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">�ܵ�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ѧ������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">����</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">���۸�</td>
       <td colspan="2"  align="center" class="td_viewcontent_title">�軯��</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">Ǧ</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">ʯ��</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">�ܸ�</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">��ˮ����ϵ��</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">��ˮУ��ֵ</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">��ˮ������������</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">��ˮ����У������</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">��ˮУ��ϵ������</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">��ˮУ��ϵ������</td>

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
       <td align="center" class="td_viewcontent_title">25</td>
      <td align="center" class="td_viewcontent_title">26</td>
      <td align="center" class="td_viewcontent_title">27</td>
      <td align="center" class="td_viewcontent_title">28</td>
      <td align="center" class="td_viewcontent_title">29</td>
      <td align="center" class="td_viewcontent_title">30</td>
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
      <td align="center" class="td_viewcontent_title">�塢����¯��Ⱦ�����</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">����</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��������</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ú�ҡ�</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ҵ����</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ҵ��ˮ</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ѧ������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">����</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">�̳�</td>
               <td rowspan="2" align="center" class="td_viewcontent_title">�ҷ�</td>
                <td rowspan="2" align="center" class="td_viewcontent_title">���</td>
                 <td rowspan="2" align="center" class="td_viewcontent_title">ȼ�շ�ʽ</td>
                  <td rowspan="2" align="center" class="td_viewcontent_title">��������</td>
                   <td rowspan="2" align="center" class="td_viewcontent_title">ԭ�ϴ���</td>
                    <td rowspan="2" align="center" class="td_viewcontent_title">ȼ������</td>
                     <td rowspan="2" align="center" class="td_viewcontent_title">������</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td  align="center" class="td_viewcontent_title">������</td>
      <td  align="center" class="td_viewcontent_title">�ŷ���</td>
      <td  align="center" class="td_viewcontent_title">������</td>
      <td  align="center" class="td_viewcontent_title">�ŷ���</td>
      <td  align="center" class="td_viewcontent_title">������</td>
      <td  align="center" class="td_viewcontent_title">�ŷ���</td>
      <td  align="center" class="td_viewcontent_title">������</td>
      <td  align="center" class="td_viewcontent_title">�ŷ���</td>
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
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    </G:template>
    </G:listbox>
  </table>
  </form>
</body>
</html>
