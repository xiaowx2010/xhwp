<!--J501_1 ��ˮ������Ⱦ���ŷ����ղ��_����-->
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
       string orgcode = GetQueryString("orgcode","");
       string str1="",str2="";
       str1 = ",fld_1454_4,fld_1454_9,fld_1454_14,fld_1454_19,fld_1454_24,fld_1454_29,fld_1454_34,fld_1454_39,fld_1454_44,fld_1454_49,fld_1454_54,fld_1454_59,fld_1454_64,fld_1454_69,fld_1454_74,fld_1454_5,fld_1454_10,fld_1454_15,fld_1454_20,fld_1454_25,fld_1454_30,fld_1454_35,fld_1454_40,fld_1454_45,fld_1454_50,fld_1454_55,fld_1454_60,fld_1454_65,fld_1454_70,fld_1454_75,fld_1454_6,fld_1454_11,fld_1454_16,fld_1454_21,fld_1454_26,fld_1454_31,fld_1454_36,fld_1454_41,fld_1454_46,fld_1454_51,fld_1454_56,fld_1454_61,fld_1454_66,fld_1454_71,fld_1454_76,fld_1454_7,fld_1454_12,fld_1454_17,fld_1454_22,fld_1454_27,fld_1454_32,fld_1454_37,fld_1454_42,fld_1454_47,fld_1454_52,fld_1454_57,fld_1454_62,fld_1454_67,fld_1454_72,fld_1454_77,fld_1454_8,fld_1454_13,fld_1454_18,fld_1454_23,fld_1454_28,fld_1454_33,fld_1454_38,fld_1454_43,fld_1454_48,fld_1454_53,fld_1454_58,fld_1454_63,fld_1454_68,fld_1454_73,fld_1454_78";
       str2 = ",fld_1454_79,fld_1454_84,fld_1454_89,fld_1454_94,fld_1454_99,fld_1454_104,fld_1454_109,fld_1454_114,fld_1454_119,fld_1454_124,fld_1454_129,fld_1454_134,fld_1454_139,fld_1454_144,''as orgdata149,fld_1454_80,fld_1454_85,fld_1454_90,fld_1454_95,fld_1454_100,fld_1454_105,fld_1454_110,fld_1454_115,fld_1454_120,fld_1454_125,fld_1454_130,fld_1454_135,fld_1454_140,fld_1454_145,''as orgdata150,fld_1454_81,fld_1454_86,fld_1454_91,fld_1454_96,fld_1454_101,fld_1454_106,fld_1454_111,fld_1454_116,fld_1454_121,fld_1454_126,fld_1454_131,fld_1454_136,fld_1454_141,fld_1454_146,''as orgdata151,fld_1454_82,fld_1454_87,fld_1454_92,fld_1454_97,fld_1454_102,fld_1454_107,fld_1454_112,fld_1454_117,fld_1454_122,fld_1454_127,fld_1454_132,fld_1454_137,fld_1454_142,fld_1454_147,''as orgdata152,fld_1454_83,fld_1454_88,fld_1454_93,fld_1454_98,fld_1454_103,fld_1454_108,fld_1454_113,fld_1454_118,fld_1454_123,fld_1454_128,fld_1454_133,fld_1454_138,fld_1454_143,fld_1454_148";
       view.SqlStr = "select  (select fld_1453_2 from gmis_mo_1453 where fld_1453_1=fld_1454_1),(select fld_1453_4 from gmis_mo_1453 where fld_1453_1=fld_1454_1) " + str1 + " " + str2 + ",fld_1454_3,fld_1454_154,fld_1454_155,fld_1454_156,fld_1454_153,fld_1454_2,fld_1454_149,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_1454_149) as fld_1454_149_1,fld_1454_150,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_1454_150) as fld_1454_150_1,fld_1454_151,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_1454_151) as fld_1454_151_1,fld_1454_152,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_1454_152) as fld_1454_152_1,fld_1454_1 from gmis_mo_1454 where 1=1 and fld_1454_1='"+orgcode+"'" ;
//       Response.Write(view.SqlStr);
       DataTable dt = view.DataTable;
       if (dt.Rows.Count > 0)
       {
           for(int i=149;i<153;i++)
           {
               dt.Rows[0]["orgdata" + i + ""] = dt.Rows[0]["fld_1454_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_1454_" + i + "_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_1454_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_1454_" + i + "_1"].ToString();
           }
       }
       iframe_658.Attributes["src"] = "iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
    }
</script>
<body>
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
    <G:content id="view" runat="server">
    <G:template id="template1" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">��ˮ������Ⱦ���ŷ����ղ��</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2010��</td>
      </tr>
    </table></td>
    <td><table>
                    <tr>
                        <td>
                            �� &nbsp;&nbsp;&nbsp;�ţ�J501-1��
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
                </table></td>
  </tr>
</table>
<!--����������-->

  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">��λ���ƣ����£�</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title">1������</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title">2����ˮ�ŷ�������֣�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��ѧ���������֣�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�������֣�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">ʯ���ࣨ�֣�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�ܵ����֣�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">���ף��֣�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�������������֣�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�ӷ��ӣ��֣�</td>
    </tr>
    <tr>
      <td width="100" align="center" class="td_viewcontent_title" >3������</td>
      <td width="100" align="center" class="td_viewcontent_title" >4���ſ�</td>
      <td width="100" align="center" class="td_viewcontent_title" >5������</td>
      <td width="100" align="center" class="td_viewcontent_title" >6���ſ�</td>
      <td width="100" align="center" class="td_viewcontent_title">7������</td>
      <td width="100" align="center" class="td_viewcontent_title">8���ſ�</td>
      <td width="100" align="center" class="td_viewcontent_title">9������</td>
      <td width="100" align="center" class="td_viewcontent_title">10���ſ�</td>
      <td width="100" align="center" class="td_viewcontent_title">11������</td>
      <td width="100" align="center" class="td_viewcontent_title">12���ſ�</td>
      <td width="100" align="center" class="td_viewcontent_title">13������</td>
      <td width="100" align="center" class="td_viewcontent_title">14���ſ�</td>
      <td width="100" align="center" class="td_viewcontent_title">15������</td>
      <td width="100" align="center" class="td_viewcontent_title" >16���ſ�</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >1</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >2</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>    <tr>
      <td align="center" class="td_viewcontent_content" >3</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>    <tr>
      <td align="center" class="td_viewcontent_content" >4</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >�ϼ�</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="left" class="font1225_black" >����</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">1������</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�軯�ǧ�ˣ�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�飨ǧ�ˣ�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�ܸ���ǧ�ˣ�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">���۸�ǧ�ˣ�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">Ǧ��ǧ�ˣ�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�ӣ�ǧ�ˣ�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">����ǧ�ˣ�</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">13��������Դ</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">17������</td>
      <td align="center" class="td_viewcontent_title" >18������</td>
      <td align="center" class="td_viewcontent_title" >19������</td>
      <td align="center" class="td_viewcontent_title" >20������</td>
      <td align="center" class="td_viewcontent_title">21������</td>
      <td align="center" class="td_viewcontent_title" >22������</td>
      <td align="center" class="td_viewcontent_title">23������</td>
      <td align="center" class="td_viewcontent_title" >24������</td>
      <td align="center" class="td_viewcontent_title">25������</td>
      <td align="center" class="td_viewcontent_title" >26������</td>
      <td align="center" class="td_viewcontent_title">27������</td>
      <td align="center" class="td_viewcontent_title" >28������</td>
      <td align="center" class="td_viewcontent_title">29������</td>
      <td align="center"class="td_viewcontent_title" >30������</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >1</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >2</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >3</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >4</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >�ϼ�</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >--&nbsp;</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  class="td_viewcontent_title" style="padding-right:5px; ">��λ������</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="122" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">����� </td>
      <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right"  class="td_viewcontent_title">����� </td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="122" align="right"  class="td_viewcontent_title">������� </td>
      <td width="210" align="left" class="td_viewcontent_content">201*��*��*��</td>
    </tr>

  </table>
  </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000"><p>ע������ˮ�ŷ�����������λС������Ⱦ�����루���ڣ����ͣ��ŷţ���������λС����<br>
        ��
        &nbsp;�����ʱע����е�λ�Ĳ�ͬ�����ղ������2����2�����Ͻ��ڻ��ſڣ����ϼ������<br>��
        &nbsp;��������Դ��ָ��ȡ������ݵļ����ʽ����a���ղ��⡢b���ල��⡢c�����ռ�⡢d��ί�м�⡢e����ҵ�Բ⡢f�����߼�⣬�������������ڡ�<br>
        ָ���Ĺ�ϵ��3��4��5��6��7��8��9��10��11��12��13��14��15��16��17��18��19��20��21��22��23��24��25��26��27��28��29��30.<br>
        </p>
        </td>
    </tr>
    <tr>
      <td align="left" class="font1220_000000">&nbsp;</td>
    </tr>
  </table>

  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; "><tr></tr>
  </table>
 </form>
</body>
</html>
