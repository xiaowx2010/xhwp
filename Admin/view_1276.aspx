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
	sb.Append("select fld_1276_7,fld_1276_8,fld_1276_9,fld_1276_10,fld_1276_11,fld_1276_12,fld_1276_13,fld_1276_14,fld_1276_15,fld_1276_16,fld_1276_17,fld_1276_18,fld_1276_19,fld_1276_20,fld_1276_21,fld_1276_22,fld_1276_23,fld_1276_24,fld_1276_25,fld_1276_26,fld_1276_27,fld_1276_28,fld_1276_29,fld_1276_30,fld_1276_31,fld_1276_32,fld_1276_33,fld_1276_34,fld_1276_35,fld_1276_36,fld_1276_46,fld_1276_47,fld_1276_48,fld_1276_49,fld_1276_50,fld_1276_51,fld_1276_52,fld_1276_53,fld_1276_54,fld_1276_55,fld_1276_56,fld_1276_57,fld_1276_58,fld_1276_59,fld_1276_60,fld_1276_61,fld_1276_62,fld_1276_63,fld_1276_64,fld_1276_65,fld_1276_75,fld_1276_76,fld_1276_77,fld_1276_78,fld_1276_79,fld_1276_80,fld_1276_81,fld_1276_82,fld_1276_83,fld_1276_84,fld_1276_85,fld_1276_86,fld_1276_87,fld_1276_88,fld_1276_89,fld_1276_90,fld_1276_91,fld_1276_92,fld_1276_93,fld_1276_94,fld_1276_95,fld_1276_96,fld_1276_97,fld_1276_98,fld_1276_99,fld_1276_100,fld_1276_101,fld_1276_102,fld_1276_103,fld_1276_104,fld_1276_114,fld_1276_115,fld_1276_116,fld_1276_117,fld_1276_118,fld_1276_119,fld_1276_120,fld_1276_121,fld_1276_122,fld_1276_123,fld_1276_3,fld_1276_5,fld_1276_6,fld_1276_139,fld_1276_4,fld_1276_2 from gmis_mo_1276");
	view.SqlStr = sb.ToString();
    iframe_658.Attributes["src"] = "iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
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
	<G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
    <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
            <td style="width: 30%">
                <table>
                    <tr>
                        <td>
                            ��λ���ƣ����£����Ϻ�����Ͻ�������
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                           �����������룺310104000000
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 40%" align="center" valign="middle" style="font-size: large; font-weight: bold;">
                ��ҵԴ�������������ۺ�����<br />
				������������ص�����
            </td>
            <td style="width: 30%" rowspan="2">
                <table>
                    <tr>
                        <td>
                            �� &nbsp;&nbsp;&nbsp;�ţ�G206��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �Ʊ���أ�����������
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼���أ�����ͳ�ƾ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �� &nbsp;&nbsp;&nbsp;�ţ���ͳ��[2009]113��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��Ч������2011��12��
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="font-size: small; font-weight: normal; width: 40%" align="center">
                2009��
            </td>
        </tr>
    </table>
            <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
    <tr><td align="center" class="td_viewcontent_title" colspan="12">
                     һ����ҵ�������������ۺ������봦�����
                    </td></tr>
            <tr>
                    <td align="left" colspan=2 class="td_viewcontent_title" style="width:23%">
                     1.��������
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       �ܼ�
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
						ұ������
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       ��ú��
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       ¯��
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       ú�ʯ
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       β��
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       ����ʯ��
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       ����
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       �����Է���
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       ��������
                    </td>
                </tr>
				<tr>
                    <td align="left" rowspan="2" class="td_viewcontent_content" style="width:8%">
                     �������
                    </td>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     2.���������֣�
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                   
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     3.������ҵ��������
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                      ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                      ---
                    </td>
                </tr>
				<tr>
                    <td align="left" rowspan="2" class="td_viewcontent_content" style="width:8%">
                     �ۺ��������
                    </td>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     4.���������֣�
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     5.���У���������<br />���������֣�
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" rowspan="2" class="td_viewcontent_content" style="width:8%">
                     �������
                    </td>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     6.���������֣�
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     7.���У���������<br />���������֣�
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" rowspan="3" class="td_viewcontent_content" style="width:8%">
                     �������
                    </td>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     8.�������������֣�
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     9.���У����ϻ���<br />Ҫ���������<br />���֣�
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     10.�������������֣�
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" class="td_viewcontent_content" style="width:8%">
                     �㵹�������
                    </td>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                    11.�㵹���������֣�
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
                </table>
               <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
    <tr><td align="center" class="td_viewcontent_title" colspan="12">
                     ������ҵ����������桢������ʩ���
                    </td></tr>
					<tr>
                    <td align="center" colspan="2" class="td_viewcontent_title" style="width:16%">
                     ���泡�������ף�
                    </td>
                    <td align="center" colspan="2" class="td_viewcontent_title" style="width:16%">
                       ���񳡣������ף�
                    </td>
                    <td align="center" colspan="2" class="td_viewcontent_title" style="width:16%">
						����װ�ã�̨��
                    </td>
                    <td align="center" colspan="2" class="td_viewcontent_title" >
                       ����װ����ƴ�����������/�죩
                    </td>
                    <td align="center" colspan="2" class="td_viewcontent_title" style="width:16%">
                       Ͷ�ʣ���Ԫ��
                    </td>
                    <td align="center" colspan="2" class="td_viewcontent_title" style="width:16%">
                       ���з��ã���Ԫ��
                    </td></tr>
            <tr>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                     ������
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       ���У�Σ�շ���
                    </td><td align="center" class="td_viewcontent_title" style="width:8%">
                     ������
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       ���У�Σ�շ���
                    </td><td align="center" class="td_viewcontent_title" style="width:8%">
                     ������
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       ���У�Σ�շ���
                    </td>
					<td align="center" class="td_viewcontent_title" style="width:8%">
                     ������
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       ���У�Σ�շ���
                    </td>
					<td align="center" class="td_viewcontent_title" style="width:8%">
                     ��Ͷ��
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       ���У�Σ�շ���
                    </td>
					<td align="center" class="td_viewcontent_title" style="width:8%">
                     �����з���
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       ���У�Σ�շ���
                    </td>
                    
                </tr>
				<tr>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                     ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td><td align="center" class="td_viewcontent_content" style="width:8%">
                     ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td><td align="center" class="td_viewcontent_content" style="width:8%">
                     ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td>
					<td align="center" class="td_viewcontent_content" style="width:8%">
                     ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td>
					<td align="center" class="td_viewcontent_content" style="width:8%">
                     ��Ͷ��
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td>
					<td align="center" class="td_viewcontent_content" style="width:8%">
                     ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td>
                    
                </tr>
				</table>
            <table cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                
                <tr>
                    <td colspan=8 class="td_viewcontent_content">ע���ԡ������ס�Ϊ������λ��ָ�걣���������ԡ���/�졢��Ԫ��Ϊ������λ��ָ��������һλС��������ָ����������λС����<br />��ҵ�������������ۺ������봦�����ָ���ϵ��3��10,4��5,7��8,10��11,3=4+7+10-(5+8)+14��
                    </td>
                </tr>
                
                </table>
               
                <table cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                    <tr>
                    <td align="right" class="td_viewcontent_title">
                        ��λ�����ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ����ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        ����ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ������ڣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        201*&nbsp;��*&nbsp;��*&nbsp;��&nbsp;
                    </td>
                </tr>
                </table>
        </G:template>
    </G:Content>
    <!--��̬����html,����-->
    </form>
</body>
</html>
