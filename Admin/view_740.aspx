<!--G204 ������Ⱦ������������ŷ�����ղ��-->

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
        view.SqlStr = "select top 1 (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_740_1) as comname ,(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_740_1) as comcode,fld_740_4,fld_740_5,fld_740_6,fld_740_7,fld_740_8,fld_740_9,fld_740_10,fld_740_11,fld_740_12,fld_740_13,fld_740_14,fld_740_15,fld_740_16,fld_740_17,fld_740_18,fld_740_19,fld_740_20,fld_740_21,fld_740_22,fld_740_23,fld_740_24,fld_740_25,fld_740_26,fld_740_27,fld_740_28,fld_740_29,fld_740_30,fld_740_31,fld_740_32,fld_740_3,fld_740_34,fld_740_35,fld_740_36,fld_740_33,fld_740_2,fld_740_1 from gmis_mo_740 where fld_740_1='"+orgcode+"'";
        iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
    }
</script>
<body><form id="form1" runat="server">

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

    <!--��̬����html,��ʼ-->  
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="60%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" class="font_2635B_000">������Ⱦ������������ŷ�����ղ��</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G204��</td>
      </tr>
      <tr>
        <td class="font1220_000000">�Ʊ���أ�����Ժ��һ��ȫ����Ⱦ�ղ��쵼С��칫��</td>
      </tr>
      <tr>
        <td class="font1220_000000">��׼���أ�����ͳ�ƾ�</td>
      </tr>
      <tr>
        <td class="font1220_000000">��׼�ĺţ���ͳ��[2007]124��</td>
      </tr>
      <tr>
        <td class="font1220_000000">��Ч������2008��6��30��</td>
      </tr>
    </table></td>
  </tr>
</table>
<!--����������-->
 <G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="100" align="right"  class="td_viewcontent_title">��λ���ƣ����£�</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right" width="100"  class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">һ������������������ʩ���</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%"  align="center" class="td_viewcontent_title">ָ������</td>
      <td width="15%"  align="center" class="td_viewcontent_title">������λ</td>
      <td width="13%"  align="center" class="td_viewcontent_title">��ʵ��</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">1����ҵ��¯��</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">2����ҵ����¯�ܶ����</td>
      <td align="center" class="td_viewcontent_content">����</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">3����ҵҤ¯��</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">4������������ʩ��</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">5�����У�������ʩ��</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">6�����У�������ʩ��</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">7����ʩ������Ͷ�ʶ�</td>
      <td align="center" class="td_viewcontent_content">��Ԫ</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">8����ʩ���з���</td>
      <td align="center" class="td_viewcontent_content">��Ԫ</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">9����ʩ��ƴ�������</td>
      <td align="center" class="td_viewcontent_content">������/ʱ</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">10����ʩʵ�ʴ�����</td>
      <td align="center" class="td_viewcontent_content">��������</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">11����ʩ���л��ƺĵ���</td>
      <td align="center" class="td_viewcontent_content">��ǧ��ʱ</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">һ�������ŷ����</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:100px;">12�������ŷ���</td>
      <td width="19%" align="center" class="td_viewcontent_content">��������</td>
      <td width="33%" align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:100px;">13�����У�ȼ�շ����ŷ���</td>
      <td align="center" class="td_viewcontent_content">��������</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" align="left" class="td_viewcontent_content"style="padding-left:100px;">14�����У����շ����ŷ���</td>
      <td align="center" class="td_viewcontent_content">��������</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td width="29%" rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">15���̳�</td>
      <td width="19%" align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">16����������</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">17�����У�ȼ�շ����ж�������</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">18����������</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">19�����У�ȼ�շ����е�������</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">20����ҵ�۳�</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">21��������</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td colspan="3" class="td_viewcontent_content" style="padding-left:100px;">22������������Դ��1��������Ⱦ�� 2��ʵ�ʼ�� 3�����Ϻ��㣺 </td>
            <td align="center" class="td_viewcontent_content">*&nbsp;</td>

    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">��λ������</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">����� </td>
       <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td width="100" align="right"  class="td_viewcontent_title">�����</td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="right"  class="td_viewcontent_title">�������</td>
      <td width="210" align="left" class="td_viewcontent_content">200*��*��*��</td>
    </tr>

  </table>
  </G:template>
  </G:Content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">ע��&nbsp;ָ���ϵ��4��5��4��6��12��13+14��12��13��16��17��18��19��15-21�в��������ŷ�����</td>
    </tr></table>

  
 </form>
</body>
</html>
