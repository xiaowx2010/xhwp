<!--GH203 ��ҵ��ˮ����ˮ�����ŷ�����ղ��-->

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
        sb.Append("select (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_774_1),(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_774_1),fld_774_4,fld_774_10,fld_774_5,fld_774_11,fld_774_6,fld_774_12,fld_774_7,fld_774_13,fld_774_8,fld_774_14,fld_774_9,fld_774_15,fld_774_16,fld_774_17,fld_774_18,fld_774_26,fld_774_19,fld_774_27,fld_774_20,fld_774_28,fld_774_21,fld_774_29,fld_774_22,fld_774_30,fld_774_23,fld_774_31,fld_774_24,fld_774_32,fld_774_25,fld_774_33,fld_774_36,fld_774_34,fld_774_37,fld_774_35,fld_774_38,fld_774_39,fld_774_42,fld_774_45,fld_774_48,fld_774_40,fld_774_43,fld_774_46,fld_774_49,fld_774_41,fld_774_44,fld_774_47,fld_774_50,fld_774_3,fld_774_52,fld_774_53,fld_774_54,fld_774_51,fld_774_2 ,fld_774_1 from gmis_mo_774 where fld_774_1='"+orgcode+"'");
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
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">��ҵ��ˮ����ˮ�����ŷ�����ղ��</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�GH203��</td>
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
       <td align="right" width="100"  class="td_viewcontent_title" style="padding-right:5px; ">��λ������</td>
       <td align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">����� </td>
       <td  align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right" width="100" class="td_viewcontent_title">�����</td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="right"  class="td_viewcontent_title">�������</td>
      <td width="210" align="left" class="td_viewcontent_content">200*��*��*��</td>
    </tr>

  </table></G:template></G:Content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">ע��ָ���ϵ��1��2��1=2+4��2��3��7��8��7��9��7��10��7��11��8��9��</td>
    </tr>
  </table></form>
</body>
</html>
