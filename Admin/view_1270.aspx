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
	sb.Append("select fld_1270_7,fld_1270_10,fld_1270_58,fld_1270_78,fld_1270_59,fld_1270_79,fld_1270_60,fld_1270_80,fld_1270_61,fld_1270_81,fld_1270_62,fld_1270_82,fld_1270_63,fld_1270_83,fld_1270_64,fld_1270_84,fld_1270_65,fld_1270_85,fld_1270_66,fld_1270_86,fld_1270_67,fld_1270_87,fld_1270_68,fld_1270_88,fld_1270_69,fld_1270_89,fld_1270_70,fld_1270_90,fld_1270_71,fld_1270_91,fld_1270_72,fld_1270_92,fld_1270_73,fld_1270_93,fld_1270_74,fld_1270_94,fld_1270_75,fld_1270_76,fld_1270_57,fld_1270_77,fld_1270_3,fld_1270_5,fld_1270_6,fld_1270_139,fld_1270_4,fld_1270_2 from gmis_mo_1270");
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
                            ��λ���ƣ����£���*&nbsp;
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                           �����������룺*&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 40%" align="center" valign="middle" style="font-size: large; font-weight: bold;">
                ��ҵԴ��������������ص�����
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
            <tr>
                    <td align="left" class="td_viewcontent_title" style="width:15%">
                       1����Դ����
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:10%">
                        2������
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:10%">
                        3��������λ
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:22%">
                        4����������
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:22%">
                       5�����У�����ԭ����
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:22%">
                        6��������ҵ��
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ԭú
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       101
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ϴ��ú
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       102
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ����ϴú
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       103
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ��ú
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       104
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ��̿
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       105
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ��¯ú��
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       201
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                      ��������
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                      ��¯ú��
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                      202
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��������
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ��Ȼ����
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                      204
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��������
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     --
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       Һ����Ȼ����
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       205
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       Һ��ʯ������
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       206
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ����������
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       207
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ԭ�ͣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       301
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ���ͣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       302
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ú�ͣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       303
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ���ͣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       304
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ȼ���ͣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       305
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ����ȼ�ϣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       400
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       �ֱ�׼ú
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                      ����
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       500
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ����ǧ��
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       ����
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       600
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       ��ǧ��ʱ
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       �ۺ���Դ������
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       ---
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       �ֱ�׼ú
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        --
                    </td>
                </tr>
                </table>
              
           
                <table cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                
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
