<!--J502 �����������������������_����-->
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
        string orgcode = GetQueryString("orgcode", "0");
        string sqlstring1 = "select fld_848_2,fld_848_4,fld_848_13,fld_848_6,fld_848_82,fld_848_83,fld_848_89,fld_848_90,fld_848_78,fld_848_15,fld_848_16,fld_848_17,fld_848_86,fld_848_87,fld_848_88,fld_848_81,fld_848_11,fld_848_12,fld_848_9,fld_848_79,fld_848_91,fld_848_18,fld_848_19,(case fld_848_20 when '' then '' else fld_848_20+'='+(select substring(caption,12,len(caption)-4) from gmis_field where fieldname='fld_848_20') end),(case fld_848_21 when '' then '' else fld_848_21+'='+(select substring(caption,12,len(caption)-4) from gmis_field where fieldname='fld_848_21') end),(case fld_848_22 when '' then '' else fld_848_22+'='+(select substring(caption,12,len(caption)-4) from gmis_field where fieldname='fld_848_22') end),fld_848_23,fld_848_24,fld_848_25,fld_848_26,fld_848_27,(case fld_848_28 when '' then '' else fld_848_28+'='+(select substring(caption,11,len(caption)-5) from gmis_field where fieldname='fld_848_28') end),(case fld_848_29 when '' then '' else fld_848_29+'='+(select substring(caption,11,len(caption)-5) from gmis_field where fieldname='fld_848_29') end),fld_848_30,fld_848_31,fld_848_32,(fld_848_33+'='+(select fld_1190_2 from gmis_mo_1190 where fld_1190_1=fld_848_33)),(fld_848_34+'='+(select fld_1190_2 from gmis_mo_1190 where fld_1190_1=fld_848_34)),";
        string sqlstring2 = "fld_848_35,fld_848_36,(case fld_848_37 when '1' then '1=��' when '2' then '2=��' else '' end),fld_848_38,fld_848_39,fld_848_40,fld_848_41,fld_848_42,fld_848_43,fld_848_44,fld_848_45,fld_848_46,fld_848_47,fld_848_48,fld_848_49,fld_848_50,fld_848_51,fld_848_52,fld_848_53,fld_848_54,fld_848_55,(fld_848_56+'='+(select fld_1190_2 from gmis_mo_1190 where fld_1190_1=fld_848_56)),(fld_848_57+'='+(select fld_1190_2 from gmis_mo_1190 where fld_1190_1=fld_848_57)),fld_848_58,fld_848_59,(fld_848_60+'='+(select fld_633_2 from gmis_mo_633 where fld_633_1=fld_848_60)),(fld_848_61+'='+(select fld_1189_2 from gmis_mo_1189 where fld_1189_1=fld_848_61)),fld_848_62,fld_848_63,fld_848_64,fld_848_65,fld_848_66,fld_848_67,fld_848_68,fld_848_69,fld_848_70,fld_848_71,fld_848_72,fld_848_73,(fld_848_74+'='+(select fld_981_2 from gmis_mo_981 where fld_981_1=fld_848_74)),fld_848_75,fld_848_76,(fld_848_77+'='+(select fld_635_2 from gmis_mo_635 where fld_635_1=fld_848_77)),fld_848_14,fld_848_84,fld_848_85,fld_848_92,fld_848_80,fld_848_10 ,fld_848_1 from " + GetModuleTableName(mid) + " where 1=1 " + filter + "";
        content_0.SqlStr = sqlstring1 + sqlstring2;
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
    <td id="tb_backlist_1199" visible="false" runat="server" style="padding-left:5px;width:75px;" nowrap>
        <G:Button id="btn_backlist_1199" type="toolbar" mode="on" icon="tb13" text="�����б�" onclick="Click_BackList_1199" runat="server"></G:Button>
        </td>
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
            <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">�����������������<br><span style="font-size:small; font-weight:normal;">2007��</span></td>
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
        <tr><td align="right"     class="td_viewcontent_title" style="font-weight:bold;">
            1.��λ����:</td>
            <td class="td_viewcontent_content" colspan="3">
                *&nbsp;</td>
        </tr>
        <tr><td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
            2.��λ����:</td>
              <td class="td_viewcontent_content" colspan="3">
                  *&nbsp;</td>
          </tr>
        <tr><td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
              3.����������:</td>
              <td class="td_viewcontent_content" colspan="3">
                  *&nbsp;</td>
          </tr>
        <tr><td align="center"  style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">4.��λ���ڵؼ������滮</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">�����������룺</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title">(ʡ)</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">(��)</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title">(����)</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">(��)</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title">(��,�ֵ�)</td><td class="td_viewcontent_content">*&nbsp;</td></tr>
                
                <tr><td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">5.��������</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">���ľ��ȣ�</td><td class="td_viewcontent_content">&nbsp;*��*��*��&nbsp;&nbsp;</td><td align="right"  class="td_viewcontent_title">����γ�ȣ�</td><td class="td_viewcontent_content">&nbsp;*��*��*��&nbsp;&nbsp;</td></tr>
                
                <tr><td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">6.��ϵ��ʽ</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">���ţ�</td><td class="td_viewcontent_content">*&nbsp;</td><td align="right"  class="td_viewcontent_title">�绰��</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">�ֻ���</td><td class="td_viewcontent_content">*</td><td  align="right"  class="td_viewcontent_title">���棺</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">��ϵ�ˣ�</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title">�ʱࣺ</td><td class="td_viewcontent_content">*</td></tr>
        <tr>
            <td align="right"  width="15%"   class="td_viewcontent_title" style="font-weight:bold;">
                7.����ʱ��:</td>
            <td class="td_viewcontent_content">*&nbsp;��*&nbsp;��
            </td>
            <td align="right" width="15%"   class="td_viewcontent_title" style="font-weight:bold;">
                8.��������ʽ:</td>
            <td class="td_viewcontent_content">*&nbsp;*&nbsp;*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title" style="font-weight:bold;">
                9.��������Χ(ƽ��ǧ��):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
                10.����������:</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
                11.��Ͷ��(��Ԫ):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
                12.�����з���(��Ԫ):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
                13.ʵ�ʴ�����(��):</td>
            <td  class="td_viewcontent_content" colspan="3">*&nbsp;
            </td>
            <%--<td class="td_viewcontent_title">&nbsp;</td>
            <td class="td_viewcontent_content">&nbsp;</td>--%>
        </tr>
        <tr>
            <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="4">�����÷�ʽ(�������÷�ʽ���)</td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">
                14.����ʽ:</td>
            <td  class="td_viewcontent_content" >*&nbsp;*&nbsp;
            </td>
            <td align="right"      class="td_viewcontent_title">
                15.�������(������):</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">
                16.��������(������):</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
            <td align="right"      class="td_viewcontent_title">
                17.������(��):</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">
                18.����:</td>
            <td class="td_viewcontent_content" colspan="3">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">
                19.����Һ�ռ�ϵͳ:</td>
            <td class="td_viewcontent_content" colspan="3">*&nbsp; 
            </td>
        </tr>
        <tr>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center" colspan="4">
                �ѷʴ���ʽ(�жѷʴ���ʽ���)&nbsp;</td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">
                20.��ƴ�������(��/��):</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
            <td align="right"      class="td_viewcontent_title">
                21.������(��):<td class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">22.����Һ�ռ�ϵͳ</td>
            <td class="td_viewcontent_content" colspan="3">
                *&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="4">
                ���մ��÷�ʽ(�з��մ��÷�ʽ���)</td>
        </tr>
        <tr>
            <td    class="td_viewcontent_title" align="right">
                23.��ʩ����(̨):</td>
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
            <td     class="td_viewcontent_title" align="right">
                24.��ƴ�������(��/��):</td>
            <td  class="td_viewcontent_content" >*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                25.������(��):</td>
            <td  class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
            26.ú̿������(��):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                27.ȼ����������(����������)(��):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                28.����������ʩ��:</td>
            <td  class="td_viewcontent_content" colspan="3">*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                29.����������������:</td>
            <td colspan="3" class="td_viewcontent_content"><table width="100%"><tr><td align="left" width="50%">*&nbsp;</td><td align="left" width="50%">*&nbsp;</td></tr></table>
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                30.����������������:</td>
            <td colspan="3" class="td_viewcontent_content"><table width="100%"><tr><td align="left" width="50%">*&nbsp;</td><td align="left" width="50%">*&nbsp;</td></tr></table>
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">31.����������ʩ��ƴ�������(������/Сʱ)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">32.����ʵ�ʴ�����(��������)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">33.�����ŷ�����(��������)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">34.����������ʩ��ĵ���(��ǧ��ʱ)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">35.�ѷų�����</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">36.�ѷų�����Һ�ռ�ϵͳ</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td    class="td_viewcontent_title" align="right">37.���ղ���������(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">38.���зɻҲ�����(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">39.�������÷�ʽ����</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">40.�ɻҴ��÷�ʽ����</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">41.����������(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">42.����:�ɻҴ�����(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td    class="td_viewcontent_title" align="right">43.�����ۺ�������(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">44.�����㵹������(ǧ��)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">45.���зɻ��㵹������(ǧ��)</td><td  class="td_viewcontent_content" colspan="3">*&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">
                ����Һ�������������</td>
        </tr>
        <tr>
            <td align="right"     class="td_viewcontent_title">
                46.����Һ����������:</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                47.����Һ����������:</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
        <td     class="td_viewcontent_title" align="right">
                        48.����Һ������ʩ��ƴ�������(������/��)</td><td class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">
                49.����Һ������ʩ��ƴ�����(������)</td><td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">
                50.����Һ������ʩ��ĵ���(��ǧ��ʱ)</td><td class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                        51.����Һ������(������)</td><td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">
                52.����Һ�ŷ���(������)</td><td class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">53.��ˮȥ�����ʹ���</td><td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                54.����ˮ������:</td>
            <td colspan="3" class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                55.����ˮ�����:</td>
            <td colspan="3" class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                56.����ˮ��ˮ������������:</td>
            <td class="td_viewcontent_content" colspan="3">*&nbsp;
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