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
	sb.Append("select fld_1275_7,fld_1275_8,fld_1275_9,fld_1275_10,fld_1275_11,fld_1275_12,fld_1275_13,fld_1275_14,fld_1275_15,fld_1275_16,fld_1275_17,fld_1275_18,fld_1275_19,fld_1275_20,fld_1275_21,fld_1275_22,fld_1275_3,fld_1275_5,fld_1275_6,fld_1275_23,fld_1275_4,fld_1275_2 from gmis_mo_1275");
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
                ��ҵԴ����������ʩ����Ⱦ��������ŷ�������ص�����
            </td>
            <td style="width: 30%" rowspan="2">
                <table>
                    <tr>
                        <td>
                            �� &nbsp;&nbsp;&nbsp;�ţ�G205��
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
    <tr><td align="center" class="td_viewcontent_title" colspan="4">
                     һ������������������ʩ���
                    </td></tr>
            <tr>
                    <td align="left" class="td_viewcontent_title" style="width:40%">
                     ָ������
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                       ������λ
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                        ��ʵ��
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                       ������ҵ��������
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;1.��ҵ��¯��
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                        ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;2.��ҵ��¯�ܶ����
                    </td>
                    <td class="td_viewcontent_content" >
                       ����
                    </td>
                    <td  class="td_viewcontent_content">
                       ---&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;3.��ҵҤ¯��
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                        ---&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;4.����������ʩ��
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                        ---&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;&nbsp;&nbsp;���У�������ʩ��
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
                    </td>
                    <td class="td_viewcontent_content">
                        ---&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                     &nbsp;&nbsp;&nbsp;&nbsp;���У�������ʩ��
                    </td>
                    <td class="td_viewcontent_content" >
                       ��
					   </td>
                    <td class="td_viewcontent_content">
                        ---&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                      &nbsp;&nbsp;5.��ʩ������Ͷ�ʶ�
                    </td>
                    <td class="td_viewcontent_content" >
                       ��Ԫ
                    </td>
                    <td class="td_viewcontent_content">
                        ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                      &nbsp;&nbsp;6.��ʩ���з���
                    <td class="td_viewcontent_content" >
                       ��Ԫ
                    </td>
                    <td class="td_viewcontent_content">
                       ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;7.��ʩ��ƴ�������
                    </td>
                    <td class="td_viewcontent_content" >
                       ������/ʱ
                    </td>
                    <td class="td_viewcontent_content">
                        ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                      &nbsp;&nbsp;8.��ʩʵ�ʴ�����
                    </td>
                    <td class="td_viewcontent_content" >
                       ��������
                    </td>
                    <td class="td_viewcontent_content">
                       ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                     &nbsp;&nbsp;9.��ʩ���кĵ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ��ǧ��ʱ
                    </td>
                    <td  class="td_viewcontent_content">
                     ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr></table>
				
    <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
    <tr><td align="center" class="td_viewcontent_title" colspan="5">
                     ���������ŷ����
                    </td></tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" colspan=2  style="width:40%">
                       &nbsp;&nbsp;10.�����ŷ���
                    </td>
                    <td class="td_viewcontent_content"  style="width:20%">
                       ��������
                    </td>
                    <td class="td_viewcontent_content" style="width:20%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:20%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" colspan=2>
                       &nbsp;&nbsp;&nbsp;&nbsp;���У�ȼ�շ����ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ��������
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" colspan=2>
                       &nbsp;&nbsp;&nbsp;&nbsp;���У����շ����ŷ���
                    </td>
                    <td class="td_viewcontent_content" >
                       ��������
                    </td>
                    <td class="td_viewcontent_content">
                        ---
                    </td>
                    <td class="td_viewcontent_content" style="width:20%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;11.�̳�
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       ������
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
                    <td class="td_viewcontent_content" width="10%">
                       �ŷ���
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
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;12.��������
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       ������
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
                    <td class="td_viewcontent_content" width="10%">
                       �ŷ���
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
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;13.���У�ȼ�շ����ж�������
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       ������
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
                    <td class="td_viewcontent_content" width="10%">
                       �ŷ���
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
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;14.��������
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       ������
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
                    <td class="td_viewcontent_content" width="10%">
                       �ŷ���
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
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;15.���У�ȼ�շ����е�������
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       ������
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
                    <td class="td_viewcontent_content" width="10%">
                       �ŷ���
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
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;16.��ҵ�۳�
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       ������
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
                    <td class="td_viewcontent_content" width="10%">
                       �ŷ���
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
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;17.������
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       ������
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
                    <td class="td_viewcontent_content" width="10%">
                       �ŷ���
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
