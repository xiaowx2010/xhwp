<!--G203-1 ��ˮ��Ⱦ�����-->

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
        StringBuilder h_sb=new StringBuilder();//sql���
        h_sb.Append("select top 1 (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_735_1) as comname ,(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_735_1) as comcode,fld_738_3,fld_738_4,fld_738_5+'='+(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_738_5),fld_738_6+'='+(select fld_1035_2 from gmis_mo_1035 where fld_1035_1=fld_738_6),(case when fld_738_7!=0 then cast(fld_738_7 as nvarchar)+'��' else '' end),(case when fld_738_8!=0 then cast(fld_738_8 as nvarchar)+'��' else '' end),fld_738_9,fld_738_10,fld_738_11,fld_738_12,fld_738_13,fld_738_14,fld_738_15,(case when fld_738_26!=0 then cast(fld_738_26 as nvarchar)+'��' else '' end),(case when fld_738_27!=0 then cast(fld_738_27 as nvarchar)+'��' else '' end),fld_738_28,fld_738_29,fld_738_30,fld_738_31,fld_738_32,fld_738_33,fld_738_34,(case when fld_738_45!=0 then cast(fld_738_45 as nvarchar)+'��' else '' end),(case when fld_738_46!=0 then cast(fld_738_46 as nvarchar)+'��' else '' end),fld_738_47,fld_738_48,fld_738_49,fld_738_50,fld_738_51,fld_738_52,");
        h_sb.Append("fld_738_53,(case when fld_738_64!=0 then cast(fld_738_64 as nvarchar)+'��' else '' end),(case when fld_738_65!=0 then cast(fld_738_65 as nvarchar)+'��' else '' end),fld_738_66,fld_738_67,fld_738_68,fld_738_69,fld_738_70,fld_738_71,fld_738_72,(case when fld_738_16!=0 then cast(fld_738_16 as nvarchar)+'��' else '' end),(case when fld_738_17!=0 then cast(fld_738_17 as nvarchar)+'��' else '' end),fld_738_18,fld_738_19,fld_738_20,fld_738_21,fld_738_22,fld_738_23,fld_738_24,fld_738_25,(case when fld_738_35!=0 then cast(fld_738_35 as nvarchar)+'��' else '' end),(case when fld_738_36!=0 then cast(fld_738_36 as nvarchar)+'��' else '' end),fld_738_37,fld_738_38,fld_738_39,fld_738_40,fld_738_41,fld_738_42,fld_738_43,fld_738_44,(case when fld_738_54!=0 then cast(fld_738_54 as nvarchar)+'��' else '' end),(case when fld_738_55!=0 then cast(fld_738_55 as nvarchar)+'��' else '' end),fld_738_56,fld_738_57,fld_738_58,fld_738_59,fld_738_60,fld_738_61,fld_738_62,fld_738_63,(case when fld_738_73!=0 then cast(fld_738_73 as nvarchar)+'��' else '' end),(case when fld_738_74!=0 then cast(fld_738_74 as nvarchar)+'��' else '' end),fld_738_75,fld_738_76,fld_738_77,fld_738_78,fld_738_79,fld_738_80,fld_738_81,fld_738_82,fld_735_18,fld_735_2,fld_735_3,fld_735_4,fld_735_5,fld_735_6 ,fld_735_1 from gmis_mo_735 a  left outer join   gmis_mo_738 on fld_738_1=fld_735_1 where fld_735_1='"+orgcode+"'");
        view.SqlStr =h_sb.ToString();
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
        <td align="right" class="font_2635B_000">��ˮ��Ⱦ�����</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G203-1��</td>
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
      <td align="right" width="100" class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td width="216" align="right"  class="td_viewcontent_title">������ʩ��ţ�</td>
      <td width="195" align="left"  class="td_viewcontent_content">SZ--* </td>
      <td width="200" align="right"  class="td_viewcontent_title">��Ӧ���ŷſڱ�ţ�</td>
      <td width="195" align="left"  class="td_viewcontent_content">FS--*</td>
      <td width="200" align="right"  class="td_viewcontent_title">��ˮȥ������</td>
      <td width="195" class="td_viewcontent_content">*</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%" rowspan="3"  align="center" class="td_viewcontent_title">������Դ</td>
      <td width="15%" rowspan="3"  align="center" class="td_viewcontent_title">1�����ʱ�䣨���£�</td>
      <td width="13%" rowspan="3"  align="center" class="td_viewcontent_title">2��ˮ������������/ʱ��</td>
      <td colspan="6"  align="center" class="td_viewcontent_title">��Ⱦ��Ũ�ȣ�����/����</td>
    </tr>
    <tr>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ѧ������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">����</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">ʯ����</td>
    </tr>
    <tr>
      <td width="13%"  align="center" class="td_viewcontent_title">3������</td>
      <td width="9%"  align="center" class="td_viewcontent_title">4���ſ�</td>
      <td width="10%"  align="center" class="td_viewcontent_title">5������</td>
      <td width="10%"  align="center" class="td_viewcontent_title">6���ſ�</td>
      <td width="9%"  align="center" class="td_viewcontent_title">7������</td>
      <td width="10%"  align="center" class="td_viewcontent_title">8���ſ�</td>
    </tr>
    <tr>
      <td rowspan="4" align="center" class="td_viewcontent_content">*</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">��Ⱦ��Ũ��(����/��)</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2"  align="center" class="td_viewcontent_title">1�����ʱ�䣨���£�</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">�ӷ���</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">����������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">�軯��</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��</td>
    </tr>
    <tr>
      <td  align="center" class="td_viewcontent_title">9������</td>
      <td  align="center" class="td_viewcontent_title">10���ſ�</td>
      <td  align="center" class="td_viewcontent_title">11������</td>
      <td  align="center" class="td_viewcontent_title">12���ſ�</td>
      <td  align="center" class="td_viewcontent_title">13������</td>
      <td  align="center" class="td_viewcontent_title">14���ſ�</td>
      <td  align="center" class="td_viewcontent_title">15������</td>
      <td  align="center" class="td_viewcontent_title">16���ſ�</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right" width="100" class="td_viewcontent_title" style="padding-right:5px; ">��λ������</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">����� </td>
       <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right" width="100" class="td_viewcontent_title">������� </td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="right"  class="td_viewcontent_title">������� </td>
      <td width="210" align="left" class="td_viewcontent_content">200*��*��*��</td>
    </tr>
  </table>
  </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">ע�������񲻹���д,�����и�ӡ����������Դ��ָ��ȡ������ݵļ����ʽ����a���ղ��⡢b���ල��⡢c�����ռ�⡢d��ί�м�⡢e����ҵ�Բ⡢f�����߼�⣬�������������ڡ�<br>
      &nbsp;&nbsp;&nbsp;&nbsp;�۷�ˮ����������������Ⱦ���ⷽ����Ӧ��Ч�������<br>
      &nbsp;&nbsp;&nbsp;&nbsp;ָ���ϵ������Ũ�ȡ��ſ�Ũ��</td>
    </tr></table>
</form>
</body>
</html>
