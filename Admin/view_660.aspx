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
	str2 = ",fld_660_37,fld_660_42,fld_660_47,fld_660_52,fld_660_38,fld_660_43,fld_660_48,fld_660_53,fld_660_39,fld_660_44,fld_660_49,fld_660_54,fld_660_40,fld_660_45,fld_660_50,fld_660_55,fld_660_41,fld_660_46,fld_660_51,fld_660_56";
	str3 = ",fld_660_58,fld_660_78,fld_660_95,fld_660_112,fld_660_116,fld_660_59,fld_660_79,fld_660_96,fld_660_113,fld_660_117,fld_660_60,fld_660_80,fld_660_97,fld_660_114,fld_660_118,fld_660_61,fld_660_81,fld_660_98,fld_660_115,fld_660_119,fld_660_62,fld_660_82,fld_660_99,fld_660_120,fld_660_63,fld_660_83,fld_660_100,fld_660_121,fld_660_64,fld_660_84,fld_660_101,fld_660_122,fld_660_65,fld_660_85,fld_660_102,fld_660_123,fld_660_66,fld_660_86,fld_660_103,fld_660_124,fld_660_67,fld_660_87,fld_660_104,fld_660_125,fld_660_68,fld_660_88,fld_660_105,fld_660_126,fld_660_69,fld_660_89,fld_660_106,fld_660_127,fld_660_70,fld_660_90,fld_660_107,fld_660_128,fld_660_71,fld_660_91,fld_660_108,fld_660_129,fld_660_72,fld_660_92,fld_660_109,fld_660_130,fld_660_73,fld_660_93,fld_660_110,fld_660_131,fld_660_74,fld_660_94,fld_660_111,fld_660_75,fld_660_132,fld_660_76,fld_660_133,fld_660_57,fld_660_77";
	str4=",fld_660_3,fld_660_5,fld_660_6,''as createdate,fld_660_134,fld_660_4,fld_660_2";

	view.SqlStr = "select (select fld_658_2 from gmis_mo_658 where fld_658_1=fld_660_1),(select fld_658_4 from gmis_mo_658 where fld_658_1=fld_660_1),fld_660_7,fld_660_12,fld_660_17,fld_660_22,fld_660_27,fld_660_32,fld_660_8,fld_660_13,fld_660_18,fld_660_23,fld_660_28,fld_660_33,fld_660_9,fld_660_14,fld_660_19,fld_660_24,fld_660_29,fld_660_34,fld_660_10,fld_660_15,fld_660_20,fld_660_25,fld_660_30,fld_660_35,fld_660_11,fld_660_16,fld_660_21,fld_660_26,fld_660_31,fld_660_36 " + str2 + " "+str3+" "+str4+" ,fld_660_1 from gmis_mo_660 where 1=1 and fld_660_1='"+orgcode+"'";
   
	DataTable dt = view.DataTable;
	if (dt.Rows.Count > 0)
	{ 
		dt.Rows[0]["createdate"] = "200"+dt.Rows[0]["fld_" + mid + "_134"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "��";
	}

	iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
	

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
               <table>
                    <tr>
                        <td>
                            �Ʊ���أ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼���أ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �ĺţ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��Ч������
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr><td style="font-size:small; font-weight:normal;width:34%" align="center" >2007��</td></tr>
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
                    <td align="center" class="td_viewcontent_title" style="width:10%" rowspan="2">
                        8.���õ��۱�ϵ��
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
                        ԭú
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ϴ��ú
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ����ϴú
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                       ��ú
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       104
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ��̼
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       105
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
                       ����&nbsp
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ��Ȼ��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       204
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                       Һ����Ȼ��
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                       Һ��ʯ����
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       206
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        ��������
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      207
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        ԭ��
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        ����
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                       ú��
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      303
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        ����
                    </td>
                    <td align="center" class="td_viewcontent_content">
                     304
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                       ȼ����
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      305
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
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
                      ����ǧ��
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        ����
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      600
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
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                       �ۺ���Դ������
                    </td>
                    <td align="center" class="td_viewcontent_content">
                     ��
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
