<!--G102-->
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
string hycode;
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
	hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");

	string str2 = "",str3="",str4="";
	str2 = ",fld_1397_37,fld_1397_42,fld_1397_47,fld_1397_52,fld_1397_38,fld_1397_43,fld_1397_48,fld_1397_53,fld_1397_39,fld_1397_44,fld_1397_49,fld_1397_54,fld_1397_40,fld_1397_45,fld_1397_50,fld_1397_55,fld_1397_41,fld_1397_46,fld_1397_51,fld_1397_56";
	str3 = ",fld_1397_58,fld_1397_78,fld_1397_95,fld_1397_112,fld_1397_59,fld_1397_79,fld_1397_96,fld_1397_113,fld_1397_60,fld_1397_80,fld_1397_97,fld_1397_114,fld_1397_63,fld_1397_83,fld_1397_100,fld_1397_64,fld_1397_84,fld_1397_101,fld_1397_65,fld_1397_85,fld_1397_102,fld_1397_66,fld_1397_86,fld_1397_103,fld_1397_67,fld_1397_87,fld_1397_104,fld_1397_69,fld_1397_89,fld_1397_106,fld_1397_70,fld_1397_90,fld_1397_107,fld_1397_74,fld_1397_94,fld_1397_111,fld_1397_75";
	str4=",fld_1397_3,fld_1397_5,fld_1397_6,''as createdate,fld_1397_134,fld_1397_4,fld_1397_2";
    string a = "select (select fld_1396_2 from gmis_mo_1396 where fld_1396_1=fld_1397_1),(select fld_1396_4 from gmis_mo_1396 where fld_1396_1=fld_1397_1),fld_1397_7,fld_1397_12,fld_1397_17,fld_1397_22,fld_1397_27,fld_1397_32,fld_1397_8,fld_1397_13,fld_1397_18,fld_1397_23,fld_1397_28,fld_1397_33,fld_1397_9,fld_1397_14,fld_1397_19,fld_1397_24,fld_1397_29,fld_1397_34,fld_1397_10,fld_1397_15,fld_1397_20,fld_1397_25,fld_1397_30,fld_1397_35,fld_1397_11,fld_1397_16,fld_1397_21,fld_1397_26,fld_1397_31,fld_1397_36 " + str2 + " "+str3+" "+str4+" ,fld_1397_1 from gmis_mo_1397 where 1=1 and fld_1397_1='"+orgcode+"'";
	view.SqlStr = "select (select fld_1396_2 from gmis_mo_1396 where fld_1396_1=fld_1397_1),(select fld_1396_4 from gmis_mo_1396 where fld_1396_1=fld_1397_1),fld_1397_7,fld_1397_12,fld_1397_17,fld_1397_22,fld_1397_27,fld_1397_32,fld_1397_8,fld_1397_13,fld_1397_18,fld_1397_23,fld_1397_28,fld_1397_33,fld_1397_9,fld_1397_14,fld_1397_19,fld_1397_24,fld_1397_29,fld_1397_34,fld_1397_10,fld_1397_15,fld_1397_20,fld_1397_25,fld_1397_30,fld_1397_35,fld_1397_11,fld_1397_16,fld_1397_21,fld_1397_26,fld_1397_31,fld_1397_36 " + str2 + " "+str3+" "+str4+" ,fld_1397_1 from gmis_mo_1397 where 1=1 and fld_1397_1='"+orgcode+"'";
//    Response.Write(a);
	DataTable dt = view.DataTable;
	if (dt.Rows.Count > 0)
	{
		dt.Rows[0]["createdate"] = "201"+dt.Rows[0]["fld_" + mid + "_134"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "��";
	}

	iframe_1396.Attributes["src"] = "iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;


}


</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--ѡ�-->
        <table width="100%">
            <tr>
                <td>
    <iframe id="iframe_1396"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
    <!--����-->
    <!--��̬���ɽ���-->
   <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
        <td style="width: 30%" rowspan="2">&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
                ��Ҫ��Ʒ��ԭ�����ϼ���Դ��������ղ��
            </td>
            <td style="width: 30%" rowspan="2">
               <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="top_font1220_000000">�����ţ�G102��</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">�Ʊ���أ�����������</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">��׼���أ�����ͳ�ƾ�</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">��׼�ĺţ���ͳ��[2009]113��</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">��Ч������2011��12��</td>
      </tr>
    </table>
            </td>
        </tr>
        <tr><td style="font-size:small; font-weight:normal;width:34%" align="center" >2010��</td></tr>
    </table>



<G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        ��λ���ƣ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        ��λ���룺
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="center" colspan="6" class="td_viewcontent_title_top">
                        һ����Ҫ��Ʒ
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width:50%" class="td_viewcontent_title">
                        1.��Ʒ����
                    </td>
                    <td align="center" style="width:10%"  class="td_viewcontent_title">
                        2.��Ʒ����
                    </td>
                    <td align="center" style="width:10%"  class="td_viewcontent_title">
                        3.������λ
                    </td>
                    <td align="center" style="width:10%"  class="td_viewcontent_title">
                        4.��������
                    </td>
                    <td align="center" style="width:10%"  class="td_viewcontent_title">
                        5.������λ
                    </td>
                    <td align="center" style="width:10%"  class="td_viewcontent_title">
                        6.ʵ�ʲ���
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        ������Ҫԭ������
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width:55%"  class="td_viewcontent_title">
                        1.ԭ����������
                    </td>
                    <td align="center" style="width:15%"  class="td_viewcontent_title">
                        2.ԭ�����ϴ���
                    </td>
                    <td align="center" style="width:15%"  class="td_viewcontent_title">
                        3.������λ
                    </td>
                    <td align="center" style="width:15%"  class="td_viewcontent_title">
                        4.ʵ��ʹ����
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="center" colspan="8" class="td_viewcontent_title_top">
                        ������Դ�������
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_title" style="width:15%" rowspan="2">
                        1.��Դ����
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:10%" rowspan="2">
                        2.����
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:15%" rowspan="2">
                        3.������λ
                    </td>
                     <td align="center" class="td_viewcontent_title" style="width:30%" colspan="2">
                                    ��Դ������
                                </td>

                    <td align="center" class="td_viewcontent_title" style="width:10%" rowspan="2">
                        6.��ݣ�%����̬��Դmg/m3��
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:10%" rowspan="2">
                        7.�ҷݣ�%��
                    </td>

                </tr>
                <tr>
                 <td align="center" class="td_viewcontent_title" >
                                    4.��������
                                </td>
                                <td align="center" class="td_viewcontent_title" >
                                    5.���У�����ԭ����
                                </td></tr>
                                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ú̿
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       101
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>

                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ��̼
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       102
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       *&nbsp
                    </td>

                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        ú�ʯ
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       103
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       *&nbsp
                    </td>

                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ��¯ú��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       201
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      ��������
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ����
                    </td>

                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ��¯ú��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       202
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ��������
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ����
                    </td>

                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ��Ȼ��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       203
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ��������
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ����
                    </td>

                </tr>

                 <tr>
                    <td align="center" class="td_viewcontent_content">
                       Һ��ʯ����
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       204
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      ����
                    </td>

                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ��������
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      205
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ����
                    </td>

                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        ����
                    </td>
                    <td align="center" class="td_viewcontent_content">
                     301
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ����
                    </td>

                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                       ȼ����
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      302
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ����
                    </td>

                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        ����ȼ��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      400
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       �ֱ�׼ú
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ����
                    </td>

                </tr>

                <tr>
                    <td align="center" class="td_viewcontent_content">
                        ����
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      500
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      ��ǧ��ʱ
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                       ����
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ����
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ����
                    </td>

                </tr>

            </table>
             <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
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
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ������ڣ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
            </table>
   </G:Template>
    </G:Content>
    </form>
</body>
</html>
