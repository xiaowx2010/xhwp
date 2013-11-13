<!--J501_1 污水处理厂污染物排放量普查表_主表-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string hycode = "";//行业
    private void Page_Load(object sender, System.EventArgs e)
    {
       SetToolBar();//设置工具条,同时获取固定URL参数
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
  <!--选项卡-->
        <table width="100%">
            <tr>
                <td>
    	   <iframe id="iframe_658"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
                </td>
            </tr>
        </table>
    <!--选项卡-->
    <!--操作工具条-->
    <div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbar_17.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbarright.aspx"-->
    <!--操作工具条-->
    </div>

    <!--内容-->
    <G:content id="view" runat="server">
    <G:template id="template1" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">污水处理厂污染物排放量普查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2010年</td>
      </tr>
    </table></td>
    <td><table>
                    <tr>
                        <td>
                            表 &nbsp;&nbsp;&nbsp;号：J501-1表
                        </td>
                    </tr>
                    <tr>
                        <td>
                            制表机关：环境保护部
                        </td>
                    </tr>
                    <tr>
                        <td>
                            批准机关：国家统计局
                        </td>
                    </tr>
                    <tr>
                        <td>
                            文 &nbsp;&nbsp;&nbsp;号：国统制[2009]113号
                        </td>
                    </tr>
                    <tr>
                        <td>
                            有效期至：2011年12月
                        </td>
                    </tr>
                </table></td>
  </tr>
</table>
<!--操作工具条-->

  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">单位名称（公章）</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">单位代码</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title">1、季度</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title">2、污水排放量（万吨）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">化学需氧量（吨）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">氨氮（吨）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">石油类（吨）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">总氮（吨）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">总磷（吨）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">生化需氧量（吨）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">挥发酚（吨）</td>
    </tr>
    <tr>
      <td width="100" align="center" class="td_viewcontent_title" >3、进口</td>
      <td width="100" align="center" class="td_viewcontent_title" >4、排口</td>
      <td width="100" align="center" class="td_viewcontent_title" >5、进口</td>
      <td width="100" align="center" class="td_viewcontent_title" >6、排口</td>
      <td width="100" align="center" class="td_viewcontent_title">7、进口</td>
      <td width="100" align="center" class="td_viewcontent_title">8、排口</td>
      <td width="100" align="center" class="td_viewcontent_title">9、进口</td>
      <td width="100" align="center" class="td_viewcontent_title">10、排口</td>
      <td width="100" align="center" class="td_viewcontent_title">11、进口</td>
      <td width="100" align="center" class="td_viewcontent_title">12、排口</td>
      <td width="100" align="center" class="td_viewcontent_title">13、进口</td>
      <td width="100" align="center" class="td_viewcontent_title">14、排口</td>
      <td width="100" align="center" class="td_viewcontent_title">15、进口</td>
      <td width="100" align="center" class="td_viewcontent_title" >16、排口</td>
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
      <td align="center" class="td_viewcontent_content" >合计</td>
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
      <td align="left" class="font1225_black" >续表</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">1、季度</td>
      <td colspan="2" align="center" class="td_viewcontent_title">氰化物（千克）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">砷（千克）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">总铬（千克）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">六价格（千克）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">铅（千克）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">镉（千克）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">汞（千克）</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">13、数据来源</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">17、进口</td>
      <td align="center" class="td_viewcontent_title" >18、出口</td>
      <td align="center" class="td_viewcontent_title" >19、进口</td>
      <td align="center" class="td_viewcontent_title" >20、出口</td>
      <td align="center" class="td_viewcontent_title">21、进口</td>
      <td align="center" class="td_viewcontent_title" >22、出口</td>
      <td align="center" class="td_viewcontent_title">23、进口</td>
      <td align="center" class="td_viewcontent_title" >24、出口</td>
      <td align="center" class="td_viewcontent_title">25、进口</td>
      <td align="center" class="td_viewcontent_title" >26、出口</td>
      <td align="center" class="td_viewcontent_title">27、进口</td>
      <td align="center" class="td_viewcontent_title" >28、出口</td>
      <td align="center" class="td_viewcontent_title">29、进口</td>
      <td align="center"class="td_viewcontent_title" >30、出口</td>
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
      <td align="center" class="td_viewcontent_content" >合计</td>
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
       <td align="right"  class="td_viewcontent_title" style="padding-right:5px; ">单位负责人</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="122" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">审核人 </td>
      <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right"  class="td_viewcontent_title">填表人 </td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="122" align="right"  class="td_viewcontent_title">填表日期 </td>
      <td width="210" align="left" class="td_viewcontent_content">201*年*月*日</td>
    </tr>

  </table>
  </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000"><p>注：①污水排放量允许保留两位小数，污染物纳入（进口）量和（排放）量保留两位小数。<br>
        　
        &nbsp;②填表时注意表中单位的不同，苦普查对象有2个或2个以上进口或排口，按合计量填报。<br>　
        &nbsp;③数据来源：指获取监测数据的监测活动方式。按a、普查监测、b、监督监测、c、验收监测、d、委托监测、e、企业自测、f、在线监测，将代码填入表格内。<br>
        指标间的关系：3≥4，5≥6，7≥8，9≥10，11≥12，13≥14，15≥16，17≥18，19≥20，21≥22，23≥24，25≥26，27≥28，29≥30.<br>
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
