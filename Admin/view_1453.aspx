<!--J501 ����ˮ�������������_����-->
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
    string orgcode = GetQueryString("orgcode","");
    content_0.SqlStr = "select fld_1453_2,fld_1453_4,fld_1453_13,fld_1453_6,fld_1453_74,fld_1453_75,fld_1453_81,fld_1453_82,fld_1453_70,fld_1453_15,fld_1453_16,fld_1453_17,fld_1453_78,fld_1453_79,fld_1453_80,fld_1453_73,fld_1453_11,fld_1453_12,fld_1453_9,fld_1453_71,fld_1453_83,(fld_1453_18+'='+(select fld_1166_2 from gmis_mo_1166 where fld_1166_1=fld_1453_18)),fld_1453_19,fld_1453_20,(fld_1453_21+'='+(select fld_1063_2 from gmis_mo_1063 where fld_1063_1=fld_1453_21)),fld_1453_22,fld_1453_23,fld_1453_24,fld_1453_25,fld_1453_26,fld_1453_27,fld_1453_28,fld_1453_29,fld_1453_30,fld_1453_31,fld_1453_32,(fld_1453_33+'='+(select fld_981_2 from gmis_mo_981 where fld_981_1=fld_1453_33)),fld_1453_34,fld_1453_35,(fld_1453_36+'='+(select fld_635_2 from gmis_mo_635 where fld_635_1=fld_1453_36)),fld_1453_37,fld_1453_38,fld_1453_39,fld_1453_40,fld_1453_41,fld_1453_42,fld_1453_43,fld_1453_44,fld_1453_45,fld_1453_46,fld_1453_47,fld_1453_48,fld_1453_49,fld_1453_50,fld_1453_51,fld_1453_52,fld_1453_53,fld_1453_54,fld_1453_55,fld_1453_56,fld_1453_57,fld_1453_58,fld_1453_59,fld_1453_60,fld_1453_61,fld_1453_62,fld_1453_63,fld_1453_64,fld_1453_65,fld_1453_66,fld_1453_67,fld_1453_68,fld_1453_69,fld_1453_14,fld_1453_76,fld_1453_77,fld_1453_84,fld_1453_72,fld_1453_10,fld_1453_1 from " + GetModuleTableName(mid) + " where fld_1453_1='"+orgcode+"'";
    iframe_658.Attributes["src"] = "iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
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
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><!--��ͷ-->
    <table width="100%">
        <tr>
            <td width="30%">&nbsp;</td>
            <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">��ˮ�������������<br><span style="font-size:small; font-weight:normal;">2010��</span></td>
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
    <tr>
        <td><!--����-->
            <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
                <tr><td align="right"    class="td_viewcontent_title_top">1.��λ����</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>
                <tr><td align="right"     class="td_viewcontent_title_top">2.��λ����</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>
                <tr><td align="right"     class="td_viewcontent_title_top">3.����������</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>

                <tr><td align="center"  style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">4.��λ���ڵؼ������滮</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">�����������룺</td><td class="td_viewcontent_content">*</td><td align="right"     class="td_viewcontent_title">(ʡ)</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">(��)</td><td class="td_viewcontent_content">*</td><td align="right"     class="td_viewcontent_title">(����)</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">(��)</td><td class="td_viewcontent_content">*</td><td align="right"     class="td_viewcontent_title">(��,�ֵ�)</td><td class="td_viewcontent_content">*&nbsp;</td></tr>

                <tr><td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">5.��������</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">���ľ��ȣ�</td><td class="td_viewcontent_content">&nbsp;*��*��*��&nbsp;&nbsp;</td><td align="right"     class="td_viewcontent_title">����γ�ȣ�</td><td class="td_viewcontent_content">&nbsp;*��*��*��&nbsp;&nbsp;</td></tr>

                <tr><td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">6.��ϵ��ʽ</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">���ţ�</td><td class="td_viewcontent_content">*&nbsp;</td><td align="right"     class="td_viewcontent_title">�绰��</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">�ֻ���</td><td class="td_viewcontent_content">*</td><td  align="right"     class="td_viewcontent_title">���棺</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">��ϵ�ˣ�</td><td class="td_viewcontent_content">*</td><td align="right"     class="td_viewcontent_title">�ʱࣺ</td><td class="td_viewcontent_content">*</td></tr>

                <tr><td align="right"     class="td_viewcontent_title_top">7.��ˮ������ʩ����</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>
                <tr><td align="right"     width="15%" class="td_viewcontent_title_top">8.����ʱ��</td><td class="td_viewcontent_content" width="35%">*&nbsp;��*&nbsp;��</td>
    <td class="td_viewcontent_title_top" width="15%" align="right"   >
        9.��ˮ������</td>
    <td class="td_viewcontent_content" width="35%">
        *&nbsp;</td>
</tr>
                <tr><td align="right"    class="td_viewcontent_title_top">10.����������(��)</td><td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
              <td class="td_viewcontent_title_top" width="15%" align="right"    >
                  11.��ˮ�����(ƽ��ǧ��)</td>
              <td class="td_viewcontent_content" style="height: 25px">*&nbsp;
              </td>
          </tr>

            <tr>
                <td align="right"    class="td_viewcontent_title_top" style="height: 25px">12.��Ͷ��(��Ԫ)</td>
                <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                <td align="right"    class="td_viewcontent_title_top" style="height: 25px">13.�����з��ã�(��Ԫ)</td>
                <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td></tr>
            <tr>
                <td align="right"    class="td_viewcontent_title_top" style="height: 25px">14.�ĵ�����(��ǧ��ʱ)</td>
                <td class="td_viewcontent_content" style="height: 25px" colspan="3">*&nbsp;</td>

          </tr>

                <tr><td align="right"    class="td_viewcontent_title">15.��ˮ����������</td><td class="td_viewcontent_content" colspan="3"><table width="100%"><tr><td>
              *&nbsp;</td><td>
              *&nbsp;</td><td>
              *&nbsp;</td></tr></table></td></tr>
                <tr><td align="right"    class="td_viewcontent_title" style="height: 25px">16.��ˮ����������</td><td class="td_viewcontent_content" colspan="3" style="height: 25px"><table width="100%"><tr><td>
              *&nbsp;</td><td>
              *&nbsp;</td><td>
              *&nbsp;</td></tr></table></td></tr>
                <tr><td align="right"    class="td_viewcontent_title">17.��ˮȥ�����ʹ���</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  18.����ˮ������</td>
              <td class="td_viewcontent_content">*&nbsp;
              </td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">19.����ˮ�����</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">20.����ˮ�����ڹ�����������</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>

               <tr>
            <td  colspan="4" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" align="center">
                21.��ˮ���߼��������(̨):</td>
        </tr>
        <tr>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">����</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">��ѧ������</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    </tr>
                    <tr>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">����</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">�ܵ�</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    </tr>
                    <tr>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">����</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">ʯ����</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    </tr>
                <tr><td align="right"     class="td_viewcontent_title">22.��ˮ��ƴ�������(��/��)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  23.��ˮʵ�ʴ�����(���)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">24.���У�������ˮ������(���)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  25.���У���ҵ��ˮ������(���)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">26.��ˮ�ŷ���(���)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                 27.����ˮ������(���)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
          <tr>
            <td  colspan="4" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" align="center">
                28.���������༰����(��):</td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">����</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">����</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td></tr>
            <tr>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">�л�������</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">����</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
        </tr>
        <tr>
            <td  colspan="4" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" align="center">
                29.���У���ˮ���������������༰����(��):</td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">����</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">����</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td></tr>
            <tr>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">�л�������</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">����</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
        </tr>
                <tr><td align="right"     class="td_viewcontent_title">30.���������(��)</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">31.���ദ��������</td><td class="td_viewcontent_content" colspan="3">*&nbsp;*&nbsp;*&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">32.���ദ��������</td><td class="td_viewcontent_content" colspan="3">*&nbsp;*&nbsp;*&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">33.���ദ����(��)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  34.���У�����������(��)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">35.���У���������(��)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  36.���У���������������(��)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">37.���У����մ�����(��)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  38.�����㵹������(��)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
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
                        �������</td><td class="td_viewcontent_content">201*��*��*��
            </td>
        </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td_viewcontent_content"><!--���-->

        </td>
    </tr>
</table>
</G:Template></G:Content></td></tr></table>
<!--��̬���ɽ���-->

</form>
</body>
</html>