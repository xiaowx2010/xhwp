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
       str1 = ",fld_1348_4,fld_1348_9,fld_1348_14,fld_1348_19,fld_1348_24,fld_1348_29,fld_1348_34,fld_1348_39,fld_1348_44,fld_1348_49,fld_1348_54,fld_1348_59,fld_1348_64,fld_1348_69,fld_1348_74,fld_1348_5,fld_1348_10,fld_1348_15,fld_1348_20,fld_1348_25,fld_1348_30,fld_1348_35,fld_1348_40,fld_1348_45,fld_1348_50,fld_1348_55,fld_1348_60,fld_1348_65,fld_1348_70,fld_1348_75,fld_1348_6,fld_1348_11,fld_1348_16,fld_1348_21,fld_1348_26,fld_1348_31,fld_1348_36,fld_1348_41,fld_1348_46,fld_1348_51,fld_1348_56,fld_1348_61,fld_1348_66,fld_1348_71,fld_1348_76,fld_1348_7,fld_1348_12,fld_1348_17,fld_1348_22,fld_1348_27,fld_1348_32,fld_1348_37,fld_1348_42,fld_1348_47,fld_1348_52,fld_1348_57,fld_1348_62,fld_1348_67,fld_1348_72,fld_1348_77,fld_1348_8,fld_1348_13,fld_1348_18,fld_1348_23,fld_1348_28,fld_1348_33,fld_1348_38,fld_1348_43,fld_1348_48,fld_1348_53,fld_1348_58,fld_1348_63,fld_1348_68,fld_1348_73,fld_1348_78";
       str2 = ",fld_1348_79,fld_1348_84,fld_1348_89,fld_1348_94,fld_1348_99,fld_1348_104,fld_1348_109,fld_1348_114,fld_1348_119,fld_1348_124,fld_1348_129,fld_1348_134,fld_1348_139,fld_1348_144,''as orgdata149,fld_1348_80,fld_1348_85,fld_1348_90,fld_1348_95,fld_1348_100,fld_1348_105,fld_1348_110,fld_1348_115,fld_1348_120,fld_1348_125,fld_1348_130,fld_1348_135,fld_1348_140,fld_1348_145,''as orgdata150,fld_1348_81,fld_1348_86,fld_1348_91,fld_1348_96,fld_1348_101,fld_1348_106,fld_1348_111,fld_1348_116,fld_1348_121,fld_1348_126,fld_1348_131,fld_1348_136,fld_1348_141,fld_1348_146,''as orgdata151,fld_1348_82,fld_1348_87,fld_1348_92,fld_1348_97,fld_1348_102,fld_1348_107,fld_1348_112,fld_1348_117,fld_1348_122,fld_1348_127,fld_1348_132,fld_1348_137,fld_1348_142,fld_1348_147,''as orgdata152,fld_1348_83,fld_1348_88,fld_1348_93,fld_1348_98,fld_1348_103,fld_1348_108,fld_1348_113,fld_1348_118,fld_1348_123,fld_1348_128,fld_1348_133,fld_1348_138,fld_1348_143,fld_1348_148";
       view.SqlStr = "select  (select fld_834_2 from gmis_mo_834 where fld_834_1=fld_1348_1),(select fld_834_4 from gmis_mo_834 where fld_834_1=fld_1348_1) " + str1 + " " + str2 + ",fld_1348_3,fld_1348_154,fld_1348_155,fld_1348_156,fld_1348_153,fld_1348_2,fld_1348_149,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_1348_149) as fld_1348_149_1,fld_1348_150,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_1348_150) as fld_1348_150_1,fld_1348_151,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_1348_151) as fld_1348_151_1,fld_1348_152,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_1348_152) as fld_1348_152_1,fld_1348_1 from gmis_mo_1348 where 1=1 and fld_1348_1='"+orgcode+"'" ;
       DataTable dt = view.DataTable;
       if (dt.Rows.Count > 0)
       {
           for(int i=149;i<153;i++)
           {
               dt.Rows[0]["orgdata" + i + ""] = dt.Rows[0]["fld_1348_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_1348_" + i + "_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_1348_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_1348_" + i + "_1"].ToString();
           }
       }
       iframe_658.Attributes["src"] = "iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);  
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
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2009��</td>
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
