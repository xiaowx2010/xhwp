<!--J502_1 ����������������Ⱦ���ŷ����ղ��
-->
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
    string     orgcode = GetQueryString("orgcode", "0");
    content_0.SqlStr = "select fld_848_2,fld_848_4,fld_849_4,fld_849_6,fld_849_5,fld_849_7,fld_849_8,fld_849_10,fld_849_9,fld_849_11,fld_849_12,fld_849_14,fld_849_13,fld_849_15,fld_849_16,fld_849_18,fld_849_17,fld_849_19,fld_849_20,fld_849_22,fld_849_21,fld_849_23,fld_849_24,fld_849_26,fld_849_25,fld_849_27,fld_849_28,fld_849_30,fld_849_29,fld_849_31,fld_849_32,fld_849_34,fld_849_33,fld_849_35,fld_849_36,fld_849_38,fld_849_37,fld_849_39,fld_849_40,fld_849_42,fld_849_41,fld_849_43,fld_849_44,fld_849_46,fld_849_45,fld_849_47,fld_849_48,fld_849_50,fld_849_49,fld_849_51,fld_849_52,fld_849_54,fld_849_53,fld_849_55,fld_849_56,fld_849_58,fld_849_57,fld_849_59,fld_849_3,fld_849_61,fld_849_62,fld_849_63,fld_849_60,fld_849_2,fld_849_1 from " + GetModuleTableName(mid) + " a left join " + GetModuleTableName("848") + " b on fld_849_1=fld_848_1 where fld_849_1='"+orgcode+"' ";
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
            <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">����������Ⱦ���ŷ����ղ��<br><span style="font-size:small; font-weight:normal;">2007��</span></td>
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
</tr>
<tr><td>

    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
        <tr><td align="right" width="15%"   class="td_viewcontent_title" style="font-weight:bold;">
            ��λ����:</td>
            <td class="td_viewcontent_content" width="35%">
                *&nbsp;</td><td align="right" width="15%"   class="td_viewcontent_title" style="font-weight:bold;">
            ��λ����:</td>
              <td class="td_viewcontent_content" width="35%">
                  *&nbsp;</td>
          </tr></table>
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
        <tr>
            <td align="right" width="120" class="td_viewcontent_title_top" rowspan="2">
                ָ������</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; width:60px; font-weight:bold;" rowspan="2" align="center">
                ������λ</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="2" align="center">
                ������ϵ����</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="2" align="center">
                ʵ�ʼ��</td>
        </tr>
        <tr>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">������</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">�ŷ���</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">������</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">�ŷ���</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title_top">
                ��ˮ��Ҫ��Ⱦ��</td>
            <td class="td_viewcontent_title" align="center" style="width: 38px">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                1.��ѧ������</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                2.����</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                3.ʯ����</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                4.����</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                5.�ӷ���</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                6.�軯��</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">ǧ��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
               7. ��</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">ǧ��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                8.�ܸ�</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">ǧ��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                9.Ǧ</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">ǧ��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                10.��</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">ǧ��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                11.��</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">ǧ��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title_top">
                ���շ�����Ҫ��Ⱦ��</td>
            <td class="td_viewcontent_title" align="center" style="width: 38px">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                12.�̳�</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                13.��������</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                14.��������</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">��</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
   </table>
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
        <tr>
            <td align="right"   class="td_viewcontent_title">    ��λ������:</td>
            <td class="td_viewcontent_content">*&nbsp;&nbsp;&nbsp;</td>
            <td align="right"   class="td_viewcontent_title">    �����:</td>
            <td class="td_viewcontent_content">*&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">    �����:</td>
            <td class="td_viewcontent_content">*&nbsp;&nbsp;&nbsp;</td>
            <td align="right"   class="td_viewcontent_title">    �������:</td>
            <td class="td_viewcontent_content">200*��*��*��</td>
        </tr>
    </table>
</td></tr></table>
</G:Template></G:Content></td></tr></table>
<!--��̬���ɽ���-->
</form>
</body>
</html>