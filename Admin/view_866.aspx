<!--J503 Σ�շ��ﴦ�ó����������_����-->
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
    hycode = GetQueryString("hycode", "");
    string  orgcode = GetQueryString("orgcode", "0");
    content_0.SqlStr = "select fld_866_2,fld_866_4,fld_866_13,fld_866_6,fld_866_90,fld_866_91,fld_866_97,fld_866_98,fld_866_86,fld_866_15,fld_866_16,fld_866_17,fld_866_94,fld_866_95,fld_866_96,fld_866_89,fld_866_11,fld_866_12,fld_866_9,fld_866_87,fld_866_99,(case fld_866_18 when '' then '' else fld_866_18+'='+(select substring(caption,12,len(caption)-2) from gmis_field where fieldname='fld_866_18') end),(case fld_866_19 when '' then '' else fld_866_19+'='+(select substring(caption,12,len(caption)-2) from gmis_field where fieldname='fld_866_19') end),fld_866_20,fld_866_21,fld_866_22,fld_866_23,fld_866_24,fld_866_25,fld_866_26,fld_866_27,fld_866_28,fld_866_29,fld_866_30,fld_866_31,fld_866_32,fld_866_33,fld_866_34,fld_866_35,fld_866_36,fld_866_37,fld_866_38,fld_866_39,fld_866_40,fld_866_41,fld_866_42,fld_866_43,fld_866_44,fld_866_45,fld_866_46,fld_866_47,fld_866_48,fld_866_49,fld_866_50,fld_866_51,fld_866_52,fld_866_53,fld_866_54,fld_866_55,fld_866_56,fld_866_57,fld_866_58,fld_866_59,fld_866_60,fld_866_61,(fld_866_62+'='+(select fld_633_2 from gmis_mo_633 where fld_633_1=fld_866_62)),(fld_866_63+'='+(select fld_1189_2 from gmis_mo_1189 where fld_1189_1=fld_866_63)),fld_866_64,fld_866_65,fld_866_66,fld_866_67,fld_866_68,fld_866_69,fld_866_70,fld_866_71,fld_866_72,(fld_866_73+'='+(select fld_1191_2 from gmis_mo_1191 where fld_1191_1=fld_866_73)),(fld_866_74+'='+(select fld_1191_2 from gmis_mo_1191 where fld_1191_1=fld_866_74)),fld_866_75,fld_866_76,fld_866_77,fld_866_78,fld_866_79,fld_866_80,fld_866_81,(fld_866_82+'='+(select fld_981_2 from gmis_mo_981 where fld_981_1=fld_866_82)),fld_866_83,fld_866_84,(fld_866_85+'='+(select fld_635_2 from gmis_mo_635 where fld_635_1=fld_866_85)),fld_866_14,fld_866_92,fld_866_93,fld_866_100,fld_866_88,fld_866_10,fld_866_1 from " + GetModuleTableName(mid) + " where fld_866_1='"+orgcode+"'";
    iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
}
</script>
<body style="padding:10px;text-align:center">
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
<table width="100%"><tr><td>
<G:Content ID="content_0" runat="server" Alert="...">
<G:Template id="template_0" runat="server">
<table width="100%">
<tr>
<td><!--��ͷ-->
    <table width="100%">
        <tr>
            <td width="30%">&nbsp;</td>
            <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">Σ�շ��ﴦ�ó����������<br><span style="font-size:small; font-weight:normal;">2007��</span></td>
            <td width="30%">
                <table width="100%">
                    <tr><td width="80px" align="right" >��&nbsp;&nbsp;&nbsp;&nbsp;�ţ�</td></tr>
                    <tr><td width="80px" align="right">�Ʊ���أ�</td></tr>
                    <tr><td width="80px" align="right">��׼���أ�</td></tr>
                    <tr><td width="80px" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;�ţ�</td></tr>
                    <tr><td width="80px" align="right">��Ч������</td></tr>
                </table>
            </td>
        </tr>
    </table>
</td>
</tr>
<tr><td>

    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
        <tr><td align="right"    class="td_viewcontent_title" style="font-weight:bold;">
            1.��λ����:</td>
            <td class="td_viewcontent_content" colspan="3">
                *&nbsp;</td>
        </tr>
        <tr><td align="right"     class="td_viewcontent_title" style="font-weight:bold;">
            2.��λ����:</td>
              <td class="td_viewcontent_content" colspan="3">
                  *&nbsp;</td>
          </tr>
        <tr><td align="right"     class="td_viewcontent_title" style="font-weight:bold;">
              3.����������:</td>
              <td class="td_viewcontent_content" colspan="3">
                  *&nbsp;</td>
          </tr>
        <tr>
        <td align="center"  style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">4.��λ���ڵؼ������滮</td>
        </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">�����������룺</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title"   >(ʡ)</td><td class="td_viewcontent_content">*</td>
                </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">(��)</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title"   >(����)</td><td class="td_viewcontent_content">*</td>
                </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">(��)</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title"   >(��,�ֵ�)</td><td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                
                <tr>
                <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">5.��������</td>
                </tr>
                <tr>
                <td align="right"  class="td_viewcontent_title"   >���ľ��ȣ�</td><td class="td_viewcontent_content">&nbsp;*��*��*��&nbsp;&nbsp;</td><td align="right"  class="td_viewcontent_title"   >����γ�ȣ�</td><td class="td_viewcontent_content">&nbsp;*��*��*��&nbsp;&nbsp;</td>
                </tr>
                
                <tr>
                <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">6.��ϵ��ʽ</td>
                </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">���ţ�</td><td class="td_viewcontent_content">*&nbsp;</td><td align="right"  class="td_viewcontent_title"   >�绰��</td><td class="td_viewcontent_content">*</td>
                </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">�ֻ���</td><td class="td_viewcontent_content">*</td><td  align="right"  class="td_viewcontent_title"   >���棺</td><td class="td_viewcontent_content">*</td>
                </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">��ϵ�ˣ�</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title"   >�ʱࣺ</td><td class="td_viewcontent_content">*</td>
                </tr>
        <tr>
            <td align="right" width="15%"   class="td_viewcontent_title" style="font-weight:bold">
                7.Σ�շ��ﴦ�÷�ʽ:</td>
            <td class="td_viewcontent_content" width="35%">*&nbsp;*&nbsp;
            </td>
            <td align="right" width="15%"    class="td_viewcontent_title" style="font-weight:bold">
                8.����ʱ��:</td>
            <td class="td_viewcontent_content" width="35%">*&nbsp;��*&nbsp;��
            </td>
        </tr>
        <tr>
            <td align="right"     class="td_viewcontent_title" style="font-weight:bold">
                9.��������Χ(ƽ��ǧ��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title" style="font-weight:bold">
                10.����������:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title" style="font-weight:bold">
                11.��Ͷ��(��Ԫ):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title" style="font-weight:bold">
                12.�����з���(��Ԫ):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="4">
                Σ�շ�����Ҫ�������</td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                13.Σ�շ�����ƴ�������(��/��):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                14.Σ�շ��ﴦ����(��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                15.����:���ù�ҵΣ�շ�����(��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                16.����:����ҽ�Ʒ�����(��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                17.����:��������Σ�շ�����(��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                18.Σ�շ����ۺ�������(��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                19.����(1)����:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                20.����(1)������(��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                21.����(2)����:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                22.����(2)������(��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                23.����(3)����:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                24.����(3)������(��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                25.����(4)����:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td   align="right"    class="td_viewcontent_title">
                26.����(4)������(��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                27.����(5)����:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                28.����(5)������(��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="4">
                ���մ��÷�ʽ(�з��մ��÷�ʽ���)</td>
        </tr>
        <tr>
            <td    class="td_viewcontent_title" align="right">
                29.��ʩ����(̨):</td>
        <td colspan="3" class="td_viewcontent_content">
                <table width="100%">
                    <tr>
                    <td width="50" align="right">
                        �̶���:</td>
                    <td>*&nbsp;
                    </td>
                    <td align="right">
                       ¯��¯:</td>
                    <td>*&nbsp;
                    </td>
                    <td align="right">
                        ������:</td>
                    <td>*&nbsp;
                    </td>
                    <td align="right">
                        ��תҤ:</td>
                    <td>*&nbsp;
                    </td>
                    <td align="right">
                        ����:</td>
                    <td>*&nbsp;
                    </td>
                    </tr>   
                </table>
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                30.��ƴ�������(��/��):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                31.������(��):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                32.ú̿������(��):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                33.ȼ����������(����������)(��):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                34.����������������:</td>
            <td colspan="3" class="td_viewcontent_content"><table width="100%"><tr><td align="left" width="50%">*&nbsp;</td><td align="left" width="50%">*&nbsp;</td></tr></table>
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                35.����������������:</td>
            <td colspan="3" class="td_viewcontent_content"><table width="100%"><tr><td align="left" width="50%">*&nbsp;</td><td align="left" width="50%">*&nbsp;</td></tr></table>
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >36.����������ʩ��(��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >37.����������ʩ��ƴ�������(������/Сʱ)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            </tr>
            <tr>
            <td class="td_viewcontent_title" align="right"  >38.����ʵ�ʴ�����(��������)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >39.�����ŷ�����(��������)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            </tr>
            <tr>
            <td class="td_viewcontent_title" align="right"  >40.����������ʩ��ĵ���(��ǧ��ʱ)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >41.���ղ���������(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            </tr>
            <tr>
            <td class="td_viewcontent_title" align="right"  >42.���зɻҲ�����(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >43.�������÷�ʽ����</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            </tr>
            <tr><td class="td_viewcontent_title" align="right"  >44.�ɻҴ��÷�ʽ����</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >45.����������(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >46.����:�ɻҴ�����(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >47.�����ۺ�������(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                48.�����㵹������(ǧ��):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                49.����:�ɻ��㵹������(ǧ��):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">
                �����÷�ʽ(�������÷�ʽ���)</td>
        </tr>
        <tr>
        <td class="td_viewcontent_title" align="right"  >50.�������(������)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >51.��������(������)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
                    <tr><td class="td_viewcontent_title" align="right"  >52.��ƴ�������(��/��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                53.������(��):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td></tr>
                    <tr>
            <td class="td_viewcontent_title" align="right"  >
                54.����:</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                55.����Һ�ռ�ϵͳ:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;">
                ��ˮ�������������</td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                56.��ˮ����������:</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                57.��ˮ����������:</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
        <td class="td_viewcontent_title" align="right"  >58.��ˮ������ʩ��ƴ�������(������/��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >59.��ˮ������ʩ��ƴ�����(������)</td><td  class="td_viewcontent_content">*&nbsp;
            </td></tr>
                    <tr><td class="td_viewcontent_title" align="right"  >60.��ˮ������ʩ��ĵ���(��ǧ��ʱ)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >61.��ˮ������(������)</td><td  class="td_viewcontent_content">*&nbsp;
            </td></tr>
                    <tr><td class="td_viewcontent_title" align="right"  >62.��ˮ�ŷ���(������)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >63.��ˮȥ�����ʹ���</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                64.����ˮ������:</td>
            <td colspan="3" class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                65.����ˮ�����:</td>
            <td  colspan="3" class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                66.����ˮ��ˮ������������:</td>
            <td  class="td_viewcontent_content" colspan="3">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">
                ��λ������:</td><td class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                       �����:</td><td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">
                �����:</td><td class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                        �������</td><td class="td_viewcontent_content">200*��*��*��
            </td>
        </tr>
        </table>
</td></tr></table>
</G:Template></G:Content></td></tr></table>
<!--��̬���ɽ���-->
</form>
</body>
</html>