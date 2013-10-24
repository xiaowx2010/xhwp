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
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2009年</td>
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
