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
	str2 = ",fld_1281_37,fld_1281_42,fld_1281_47,fld_1281_52,fld_1281_38,fld_1281_43,fld_1281_48,fld_1281_53,fld_1281_39,fld_1281_44,fld_1281_49,fld_1281_54,fld_1281_40,fld_1281_45,fld_1281_50,fld_1281_55,fld_1281_41,fld_1281_46,fld_1281_51,fld_1281_56";
	str3 = ",fld_1281_58,fld_1281_78,fld_1281_95,fld_1281_112,fld_1281_116,fld_1281_59,fld_1281_79,fld_1281_96,fld_1281_113,fld_1281_117,fld_1281_60,fld_1281_80,fld_1281_97,fld_1281_114,fld_1281_118,fld_1281_61,fld_1281_81,fld_1281_98,fld_1281_115,fld_1281_119,fld_1281_62,fld_1281_82,fld_1281_99,fld_1281_120,fld_1281_63,fld_1281_83,fld_1281_100,fld_1281_121,fld_1281_64,fld_1281_84,fld_1281_101,fld_1281_122,fld_1281_65,fld_1281_85,fld_1281_102,fld_1281_123,fld_1281_66,fld_1281_86,fld_1281_103,fld_1281_124,fld_1281_67,fld_1281_87,fld_1281_104,fld_1281_125,fld_1281_68,fld_1281_88,fld_1281_105,fld_1281_126,fld_1281_69,fld_1281_89,fld_1281_106,fld_1281_127,fld_1281_70,fld_1281_90,fld_1281_107,fld_1281_128,fld_1281_71,fld_1281_91,fld_1281_108,fld_1281_129,fld_1281_72,fld_1281_92,fld_1281_109,fld_1281_130,fld_1281_73,fld_1281_93,fld_1281_110,fld_1281_131,fld_1281_74,fld_1281_94,fld_1281_111,fld_1281_75,fld_1281_132,fld_1281_76,fld_1281_133,fld_1281_57,fld_1281_77";
	str4=",fld_1281_3,fld_1281_5,fld_1281_6,''as createdate,fld_1281_134,fld_1281_4,fld_1281_2";

	view.SqlStr = "select (select fld_1280_2 from gmis_mo_1280 where fld_1280_1=fld_1281_1),(select fld_1280_4 from gmis_mo_1280 where fld_1280_1=fld_1281_1),fld_1281_7,fld_1281_12,fld_1281_17,fld_1281_22,fld_1281_27,fld_1281_32,fld_1281_8,fld_1281_13,fld_1281_18,fld_1281_23,fld_1281_28,fld_1281_33,fld_1281_9,fld_1281_14,fld_1281_19,fld_1281_24,fld_1281_29,fld_1281_34,fld_1281_10,fld_1281_15,fld_1281_20,fld_1281_25,fld_1281_30,fld_1281_35,fld_1281_11,fld_1281_16,fld_1281_21,fld_1281_26,fld_1281_31,fld_1281_36 " + str2 + " "+str3+" "+str4+" ,fld_1281_1 from gmis_mo_1281 where 1=1 and fld_1281_1='"+orgcode+"'";
   
	DataTable dt = view.DataTable;
	if (dt.Rows.Count > 0)
	{ 
		dt.Rows[0]["createdate"] = "201"+dt.Rows[0]["fld_" + mid + "_134"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "��";
	}

	iframe_1280.Attributes["src"] = "iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
	

}
 

</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--ѡ�-->
        <table width="100%">
            <tr>
                <td>
    <iframe id="iframe_1280"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
        <tr><td style="font-size:small; font-weight:normal;width:34%" align="center" >2009��</td></tr>
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
