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
	sb.Append("select fld_1394_19,fld_1394_20,fld_1394_21,fld_1394_22,fld_1394_23,fld_1394_24,fld_1394_25,fld_1394_26,fld_1394_27,fld_1394_28,fld_1394_29,fld_1394_30,fld_1394_31,fld_1394_32,fld_1394_33,fld_1394_34,fld_1394_35,fld_1394_36,fld_1394_40,fld_1394_38,fld_1394_41,fld_1394_42,fld_1394_43,fld_1394_39,fld_1394_37 from gmis_mo_1394");
	view.SqlStr = sb.ToString();
    iframe_658.Attributes["src"] = "iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
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
                ��ҵԴ��Ⱦ��������ŷ�������ص�����
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
                2010��
            </td>
        </tr>
    </table>

            <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
            <tr>
                    <td align="left" class="td_viewcontent_title" style="width:40%">
                     ָ������
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                       ������λ
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                        ���ص��ŷ���
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                       ���ص������%��
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       һ����ҵ��ˮ
                    </td>
                    <td class="td_viewcontent_content" >
                       --
                    </td>
                    <td class="td_viewcontent_content">
                        --
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;1.��ҵ��ˮ����
                    </td>
                    <td class="td_viewcontent_content" >
                       ���
                    </td>
                    <td  class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;���У�ȡˮ����
                    </td>
                    <td class="td_viewcontent_content" >
                       ���
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;&nbsp;&nbsp;�ظ���ˮ��
                    </td>
                    <td class="td_viewcontent_content" >
                       ���
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;2.��ҵ��ˮ�ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ���
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                      3.��ҵ��ˮ��COD�ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
					   </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                      4.��ҵ��ˮ�а����ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       ������ҵ����
                    </td>
                    <td class="td_viewcontent_content" >
                       --
                    </td>
                    <td class="td_viewcontent_content">
                       --
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       1.ú̿������
                    </td>
                    <td class="td_viewcontent_content" >
                       ���
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       ���У�ԭ��ú������
                    </td>
                    <td class="td_viewcontent_content" >
                       ���
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                     2.���������ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td  class="td_viewcontent_content">
                      *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       ���У�ȼ��ȼ�չ������ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       3.���������ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       ���У�ȼ�չ������ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       4.�̳��ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                      ��
                    </td>
                    <td class="td_viewcontent_content">
                      *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;5.�۳��ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       ������ҵ�������
                    </td>
                    <td class="td_viewcontent_content" >
                       --
                    </td>
                    <td class="td_viewcontent_content">
                       --
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
                <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       1.��ҵ������������
                    </td>
                    <td class="td_viewcontent_content" >
                       ���
                    </td>
                    <td class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
                <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       2.��ҵ��������㵹������
                    </td>
                    <td class="td_viewcontent_content" >
                       ���
                    </td>
                    <td class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
                <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       3.Σ�շ����㵹������
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
                <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       4.Σ�շ����㵹������
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
                <tr align="left">
                    <td align="left" class="td_viewcontent_content">
                       ��ע˵����
                    </td>
                    <td colspan="3" class="td_viewcontent_content" >
                       *&nbsp;
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
