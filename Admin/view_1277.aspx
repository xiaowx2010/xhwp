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
	sb.Append("select fld_1277_2,fld_1277_3,fld_1277_4,fld_1277_5,fld_1277_6,fld_1277_36,fld_1277_37,fld_1277_38,fld_1277_39,fld_1277_19,fld_1277_43,fld_1277_44,fld_1277_45,fld_1277_42,fld_1277_40 from gmis_mo_1277");
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
                ��ҵԴΣ�շ���������ۺ����ü�����������ص�����
            </td>
            <td style="width: 30%" rowspan="2">
                <table>
                    <tr>
                        <td>
                            �� &nbsp;&nbsp;&nbsp;�ţ�G207��
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
    <tr><td align="center" class="td_viewcontent_title" colspan="3">
                    ��ҵΣ�շ���������ۺ������봦�����
                    </td></tr>
            <tr>
                    <td colspan="2" align="left" class="td_viewcontent_title" style="width:50%">
                     &nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:50%">
                       �ܼ�
                    </td>
                </tr>
				 <tr align="center">
                   <td  rowspan="2" class="td_viewcontent_content" style="width:20%">
                     �������
                    </td>
                    <td class="td_viewcontent_content" style="width:30%">
                       2.���������֣�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                    <td class="td_viewcontent_content" style="width:30%">
                       3.������ҵ��������
                    </td>
                    <td class="td_viewcontent_content">
                        ---&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                   <td  rowspan="2" class="td_viewcontent_content" style="width:20%">
                     �ۺ��������
                    </td>
                    <td class="td_viewcontent_content" style="width:30%">
                       4.���������֣�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                    <td class="td_viewcontent_content" style="width:30%">
                       5.���У������������������֣�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                   <td  rowspan="2" class="td_viewcontent_content" style="width:20%">
                     �������
                    </td>
                    <td class="td_viewcontent_content" style="width:30%">
                       6.���������֣�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                    <td class="td_viewcontent_content" style="width:30%">
                       7.���У������������������֣�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                   <td  rowspan="3" class="td_viewcontent_content" style="width:20%">
                     �������
                    </td>
                    <td class="td_viewcontent_content" style="width:30%">
                       8.�������������֣�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                    <td class="td_viewcontent_content" style="width:30%">
                       9.���У����ϻ���Ҫ������������֣�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                    <td class="td_viewcontent_content" style="width:30%">
                      10.�������������֣�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                   <td   class="td_viewcontent_content" style="width:20%">
                     �㵹�������
                    </td>
                    <td class="td_viewcontent_content" style="width:30%">
                       11.�㵹���������֣�
                    </td>
                    <td class="td_viewcontent_content">
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
