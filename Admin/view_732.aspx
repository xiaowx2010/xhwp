<!--G202 Σ�շ����ղ��_����,�鿴ҳ-->

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
	StringBuilder sb = new StringBuilder();
	sb.Append("select (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_732_1),(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_732_1),fld_732_7,fld_732_12,fld_732_17,fld_732_22,fld_732_27,fld_732_32,fld_732_134,fld_732_8,fld_732_13,fld_732_18,fld_732_23,fld_732_28,fld_732_33,fld_732_135,fld_732_9,fld_732_14,fld_732_19,fld_732_24,fld_732_29,fld_732_34,fld_732_136,fld_732_10,fld_732_15,fld_732_20,fld_732_25,fld_732_30,fld_732_35,fld_732_137,fld_732_11,fld_732_16,fld_732_21,fld_732_26,fld_732_31,fld_732_36,fld_732_138,fld_732_37,fld_732_42,fld_732_47,fld_732_52,fld_732_38,fld_732_43,fld_732_48,fld_732_53,fld_732_39,fld_732_44,fld_732_49,fld_732_54,fld_732_40,fld_732_45,fld_732_50,fld_732_55,fld_732_41,fld_732_46,fld_732_51,fld_732_56,fld_732_58,fld_732_78,fld_732_95,fld_732_112,fld_732_116,fld_732_59,fld_732_79,fld_732_96,fld_732_113,fld_732_117,fld_732_60,fld_732_80,fld_732_97,fld_732_114,fld_732_118,fld_732_61,fld_732_81,fld_732_98,fld_732_115,fld_732_119,fld_732_62,fld_732_82,fld_732_99,fld_732_120,fld_732_63,fld_732_83,fld_732_100,fld_732_121,fld_732_64,fld_732_84,fld_732_101,fld_732_122,fld_732_65,fld_732_85,fld_732_102,fld_732_123,fld_732_66,fld_732_86,fld_732_103,fld_732_124,fld_732_67,fld_732_87,fld_732_104,fld_732_125,fld_732_68,fld_732_88,fld_732_105,fld_732_126,fld_732_69,fld_732_89,fld_732_106,fld_732_127,fld_732_70,fld_732_90,fld_732_107,fld_732_128,fld_732_71,fld_732_91,fld_732_108,fld_732_129,fld_732_72,fld_732_92,fld_732_109,fld_732_130,fld_732_73,fld_732_93,fld_732_110,fld_732_131,fld_732_74,fld_732_94,fld_732_111,fld_732_75,fld_732_132,fld_732_76,fld_732_133,fld_732_57,fld_732_77");
	sb.Append(",fld_732_3,fld_732_5,fld_732_6,'200'+cast(fld_732_139 as varchar(20))+'��'+case when cast(convert(decimal(10,0),fld_732_4) as varchar(20))='0' then ' ' else cast(convert(decimal(10,0),fld_732_4) as varchar(20)) end+'��'+case when cast(convert(decimal(10,0),fld_732_2) as varchar(20))='0' then ' ' else cast(convert(decimal(10,0),fld_732_2) as varchar(20)) end+'��',fld_732_1 from gmis_mo_732 where fld_732_1='"+orgcode+"'");
	view.SqlStr = sb.ToString();
    iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
}
</script>

<body style="padding: 10px; text-align: center">
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
    <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
            <td style="width: 30%">
                &nbsp;
            </td>
            <td style="width: 40%" align="center" valign="middle" style="font-size: large; font-weight: bold;">
                ��Ҫ��Ʒ��ԭ�����ϼ���Դ��������ղ��
            </td>
            <td style="width: 30%" rowspan="2">
                <table>
                    <tr>
                        <td>
                            �� &nbsp;&nbsp;&nbsp;�ţ�G202��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �Ʊ���أ�����Ժ��һ��ȫ����ȾԴ�ղ��쵼С��칫��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼���أ�����ͳ�ƾ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �� &nbsp;&nbsp;&nbsp;�ţ���ͳ��[2007]124��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��Ч������2008��6��30��
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="font-size: small; font-weight: normal; width: 40%" align="center">
                2007��
            </td>
        </tr>
    </table>
    <G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
            <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
            <tr>
                    <td align="right" class="td_viewcontent_title">
                        ��λ���ƣ����£���
                    </td>
                    <td class="td_viewcontent_content" style="width:33%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ��λ���룺
                    </td>
                    <td class="td_viewcontent_content" style="width:33%">
                        *&nbsp;
                    </td>
                </tr>
                </table>
                <table border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td width="100%" colspan="7" align="center" class="td_viewcontent_title_top">
                        һ����Ҫ��Ʒ
                    </td>
                </tr>
                <tr>
                    <td  width="7%" class="td_viewcontent_title">
                        1.��Ʒ����
                    </td>
                    <td  width="4%" class="td_viewcontent_title">
                        2.��Ʒ����
                    </td>
                    <td  width="6%" class="td_viewcontent_title">
                        3.������λ
                    </td>
                    <td  align="center"  class="td_viewcontent_title">
                        4.��������
                    </td>
                    <td  align="center" class="td_viewcontent_title">
                        5.������λ
                    </td>
                    <td  align="center" class="td_viewcontent_title">
                        6.ʵ�ʲ���
                    </td>
                    <td  align="center" class="td_viewcontent_title">
                        7.��Ҫ����
                    </td>
                </tr>
                <tr>
                   <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="9%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="9%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    
                    
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="9%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="9%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="9%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
            </table>
            <table border="0" width="100%" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td width="100%" colspan="6" align="center" class="td_viewcontent_title_top">
                        ������Ҫԭ������
                    </td>
                </tr>
                <tr>
                    <td  class="td_viewcontent_title">1.ԭ����������</td>
                    <td class="td_viewcontent_title">2.ԭ�����ϴ���</td>
                    
                    <td class="td_viewcontent_title">3.������λ</td>
                    <td class="td_viewcontent_title">4.ʵ��ʹ����</td>
                </tr>
                
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>

                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>

                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>

                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>

                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>

                </tr>
                </table>
                <table cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td width="100%" colspan="8" align="center" class="td_viewcontent_title_top">
                        ��.��Դ�������
                    </td>
                </tr>
                <tr>
                    <td rowspan=2 class="td_viewcontent_title">1.��Դ����</td>
                    <td rowspan=2 class="td_viewcontent_title">2.����</td>
                    <td rowspan=2 class="td_viewcontent_title">3.������λ</td>
                    <td colspan=2 class="td_viewcontent_title" align=center>��Դ������</td>
                    <td rowspan=2 class="td_viewcontent_title">6.���(%,��̬��Դmg/m3)</td>
                    <td rowspan=2 class="td_viewcontent_title">7.�ҷ�(%)</td>
                    <td rowspan=2 class="td_viewcontent_title">8.���õ��۱�ϵ��</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_title">4.��������</td>
                    <td class="td_viewcontent_title">5.����:����ԭ����</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">ԭú</td>
                    <td class="td_viewcontent_content">101</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">ϴ��ú</td>
                    <td class="td_viewcontent_content">102</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">����ϴú</td>
                    <td class="td_viewcontent_content">103</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">��ú</td>
                    <td class="td_viewcontent_content">104</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">��̼</td>
                    <td class="td_viewcontent_content">105</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">��¯ú��</td>
                    <td class="td_viewcontent_content">201</td>
                    <td class="td_viewcontent_content">��������</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">��¯ú��</td>
                    <td class="td_viewcontent_content">202</td>
                    <td class="td_viewcontent_content">��������</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">��Ȼ����</td>
                    <td class="td_viewcontent_content">204</td>
                    <td class="td_viewcontent_content">��������</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">Һ����Ȼ����</td>
                    <td class="td_viewcontent_content">205</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">Һ��ʯ����</td>
                    <td class="td_viewcontent_content">206</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">����������</td>
                    <td class="td_viewcontent_content">207</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">ԭ��</td>
                    <td class="td_viewcontent_content">301</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">���ͣ�</td>
                    <td class="td_viewcontent_content">302</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">ú�ͣ�</td>
                    <td class="td_viewcontent_content">303</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">���ͣ�</td>
                    <td class="td_viewcontent_content">304</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">ȼ���ͣ�</td>
                    <td class="td_viewcontent_content">305</td>
                    <td class="td_viewcontent_content">��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">����ȼ�ϣ�</td>
                    <td class="td_viewcontent_content">400</td>
                    <td class="td_viewcontent_content">�ֱ�׼ú</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">����</td>
                    <td class="td_viewcontent_content">500</td>
                    <td class="td_viewcontent_content">����ǧ��</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">����</td>
                    <td class="td_viewcontent_content">600</td>
                    <td class="td_viewcontent_content">��ǧ��ʱ</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">�ۺ���Դ������</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content">�ֱ�׼ú</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                    <td class="td_viewcontent_content" align=center>����</td>
                </tr>
                <tr>
                    <td colspan=8 class="td_viewcontent_content">��ע������Դ�����Ϊѡ��ڱ��в�Ʒ����������������������Ҫԭ������ʵ��ʹ��������%Ϊ������λ��ָ��������һλС�����ԡ�mg/m3��Ϊ������λ��ָ�걣����λС��������ָ����������λС�� ��
                    </td>
                </tr>
                
                </table>
                <table cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                    <tr>
                    <td align="right" class="td_viewcontent_title">
                        ��λ�����ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ����ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        ����ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ������ڣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                </tr>
                </table>
        </G:template>
    </G:Content>
    <!--��̬����html,����-->
    </form>
</body>
</html>
