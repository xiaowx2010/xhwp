<!--G203 ��ҵ��ˮ����ˮ�����ŷ�����ղ��-->

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
    private void Page_Load(object sender,System.EventArgs e)
    {
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����   
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode","0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_734_1),(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_734_1),fld_734_4,fld_734_10,fld_734_5,fld_734_11,fld_734_6,fld_734_12,fld_734_7,fld_734_13,fld_734_8,fld_734_14,fld_734_9,fld_734_15+'='+(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_734_15),fld_734_16,fld_734_17,fld_734_18,fld_734_26,fld_734_19,fld_734_27,fld_734_20,fld_734_28,fld_734_21,fld_734_29,fld_734_22,fld_734_30,fld_734_23,fld_734_31,fld_734_24,fld_734_32,fld_734_25,fld_734_33,fld_734_36,fld_734_34,fld_734_37,fld_734_35,fld_734_38,fld_734_39,fld_734_42,fld_734_45,fld_734_48,fld_734_40,fld_734_43,fld_734_46,fld_734_49,fld_734_41,fld_734_44,fld_734_47,fld_734_50,fld_734_3,fld_734_52,fld_734_53,fld_734_54,fld_734_51,fld_734_2 ,fld_734_1 from gmis_mo_734 where fld_734_1='"+orgcode+"'");
        view.SqlStr = sb.ToString();
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

    <!--��̬����html,��ʼ-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="60%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" class="font_2635B_000">��ҵ��ˮ����ˮ�����ŷ�����ղ��</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G203��</td>
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
      <td width="150" nowrap  align="right"  class="td_viewcontent_title">��λ���ƣ����£�</td>
      <td width="100%" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td   align="right"  class="td_viewcontent_title">��λ����</td>
      <td  colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title"">һ����ˮ����ˮ�ŷ����</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="13%"  align="center" class="td_viewcontent_title"">ָ������</td>
      <td width="21%"  align="center" class="td_viewcontent_title"">������λ</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">��ʵ��</td>
      <td width="24%"  align="center" class="td_viewcontent_title"">ָ������</td>
      <td width="8%"  align="center" class="td_viewcontent_title"">������λ</td>
      <td width="20%"  align="center" class="td_viewcontent_title"">��ʵ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">1����ˮ����</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">7����ˮ�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >2�����У�ȡˮ����</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">8�����У�����ˮ����</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >3�����У��Ա�ˮ</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">9�����У�ֱ���뺣��</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >4�����У��ظ���ˮ��</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">10�����У�������ˮ���д�����</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >5����ˮ������</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">11����������������λ��</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >6����ˮʵ�ʴ�����</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >12����ˮ��Ҫ��ˮȥ�����ʹ���</td>
      <td colspan="2" align="left" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_content">13������ˮ������</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >14������ˮ�����<span class="midtop_bnt_font1220B_000000">���ղ������д��</span></td>
      <td colspan="2" align="left" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">�������չ���</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="13%" rowspan="2" align="center" class="td_viewcontent_content" >15����ѧ������</td>
      <td width="12%" align="center" class="td_viewcontent_content" >������</td>
      <td width="9%" align="center" class="td_viewcontent_content" >��</td>
      <td width="14%" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="12%" rowspan="2" align="center" class="td_viewcontent_content" >19������������</td>
      <td width="19%" align="center" class="td_viewcontent_content" >������</td>
      <td width="6%" align="center" class="td_viewcontent_content" >��</td>
      <td width="15%" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_content" >16������</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">20���軯��</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_content" >17��ʯ����</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">21����</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">�ŷ���</td>
      <td align="center" class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_content" >18���ӷ���</td>
      <td align="center" class="td_viewcontent_content">������</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" rowspan="2" align="center" class="td_viewcontent_content"  >22����ˮ������Դ��1������ϵ�� 2ʵ�ʼ�� 3 </td>
      <td colspan="2" rowspan="2" align="center" class="td_viewcontent_content"  >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >�ŷ���</td>
      <td align="center" class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">������ˮ������ʩ���</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="13%" align="center" class="td_viewcontent_content" >23����ʩ��</td>
      <td width="12%" align="center" class="td_viewcontent_content" >��</td>
      <td width="23%" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="31%" align="center" class="td_viewcontent_content" >26����ƴ�������</td>
      <td width="8%" align="center" class="td_viewcontent_content" >��/��</td>
      <td width="13%" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td width="13%" align="center" class="td_viewcontent_content" >24����Ͷ�ʶ�</td>
      <td align="center" class="td_viewcontent_content">��Ԫ</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">27���ĵ���</td>
      <td width="8%" align="center" class="td_viewcontent_content" >��ǧ��ʱ</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >25�����з���</td>
      <td align="center" class="td_viewcontent_content">��Ԫ</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">28����ί�д���λ���ƣ�<br>
��ί��������λ��������ί�е�λ���ƣ�</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left" class="td_viewcontent_content">
      <td colspan="6"  >��ˮ������ʩ����ķ�ˮ���ͼ�������</td>
    </tr>
    <tr align="center">
      <td class="td_viewcontent_content" >29����ˮ����</td>
      <td colspan="2" class="td_viewcontent_content" >30����ˮ���ʹ���</td>
      <td class="td_viewcontent_content" >31������������</td>
      <td colspan="2" class="td_viewcontent_content" >32������������</td>
    </tr>
    <tr align="left">
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr align="left">
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr align="left">
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right" width="100" nowrap  class="td_viewcontent_title" style="padding-right:5px; ">��λ������</td>
       <td width="35%" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">����� </td>
       <td  width="35%" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td width="100" align="right"  class="td_viewcontent_title">�����</td>
      <td width="35%" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="right"  class="td_viewcontent_title">�������</td>
      <td width="35%" align="left" class="td_viewcontent_content">200*��*��*��</td>
    </tr>

  </table></G:template></G:Content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">ע��ָ���ϵ��1��2��1=2+4��2��3��7��8��7��9��7��10��7��11��8��9��</td>
    </tr>
  </table></form>
</body>
</html>
