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
       str1 = ",fld_835_4,fld_835_9,fld_835_14,fld_835_19,fld_835_24,fld_835_29,fld_835_34,fld_835_39,fld_835_44,fld_835_49,fld_835_54,fld_835_59,fld_835_64,fld_835_69,fld_835_74,fld_835_5,fld_835_10,fld_835_15,fld_835_20,fld_835_25,fld_835_30,fld_835_35,fld_835_40,fld_835_45,fld_835_50,fld_835_55,fld_835_60,fld_835_65,fld_835_70,fld_835_75,fld_835_6,fld_835_11,fld_835_16,fld_835_21,fld_835_26,fld_835_31,fld_835_36,fld_835_41,fld_835_46,fld_835_51,fld_835_56,fld_835_61,fld_835_66,fld_835_71,fld_835_76,fld_835_7,fld_835_12,fld_835_17,fld_835_22,fld_835_27,fld_835_32,fld_835_37,fld_835_42,fld_835_47,fld_835_52,fld_835_57,fld_835_62,fld_835_67,fld_835_72,fld_835_77,fld_835_8,fld_835_13,fld_835_18,fld_835_23,fld_835_28,fld_835_33,fld_835_38,fld_835_43,fld_835_48,fld_835_53,fld_835_58,fld_835_63,fld_835_68,fld_835_73,fld_835_78";
       str2 = ",fld_835_79,fld_835_84,fld_835_89,fld_835_94,fld_835_99,fld_835_104,fld_835_109,fld_835_114,fld_835_119,fld_835_124,fld_835_129,fld_835_134,fld_835_139,fld_835_144,''as orgdata149,fld_835_80,fld_835_85,fld_835_90,fld_835_95,fld_835_100,fld_835_105,fld_835_110,fld_835_115,fld_835_120,fld_835_125,fld_835_130,fld_835_135,fld_835_140,fld_835_145,''as orgdata150,fld_835_81,fld_835_86,fld_835_91,fld_835_96,fld_835_101,fld_835_106,fld_835_111,fld_835_116,fld_835_121,fld_835_126,fld_835_131,fld_835_136,fld_835_141,fld_835_146,''as orgdata151,fld_835_82,fld_835_87,fld_835_92,fld_835_97,fld_835_102,fld_835_107,fld_835_112,fld_835_117,fld_835_122,fld_835_127,fld_835_132,fld_835_137,fld_835_142,fld_835_147,''as orgdata152,fld_835_83,fld_835_88,fld_835_93,fld_835_98,fld_835_103,fld_835_108,fld_835_113,fld_835_118,fld_835_123,fld_835_128,fld_835_133,fld_835_138,fld_835_143,fld_835_148";
       view.SqlStr = "select  (select fld_834_2 from gmis_mo_834 where fld_834_1=fld_835_1),(select fld_834_4 from gmis_mo_834 where fld_834_1=fld_835_1) " + str1 + " " + str2 + ",fld_835_3,fld_835_154,fld_835_155,fld_835_156,fld_835_153,fld_835_2,fld_835_149,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_835_149) as fld_835_149_1,fld_835_150,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_835_150) as fld_835_150_1,fld_835_151,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_835_151) as fld_835_151_1,fld_835_152,(select fld_1036_2 from gmis_mo_1036 where fld_1036_1=fld_835_152) as fld_835_152_1,fld_835_1 from gmis_mo_835 where 1=1 and fld_835_1='"+orgcode+"'" ;
       DataTable dt = view.DataTable;
       if (dt.Rows.Count > 0)
       {
           for(int i=149;i<153;i++)
           {
               dt.Rows[0]["orgdata" + i + ""] = dt.Rows[0]["fld_835_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_835_" + i + "_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_835_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_835_" + i + "_1"].ToString();
           }
       }
       iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);  
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
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：J501-1表　</td>
      </tr>
      <tr>
        <td class="font1220_000000">制表机关：国务院第一次全国污染普<br>
          　　　　　查领导小组办公室</td>
      </tr>
      <tr>
        <td class="font1220_000000">批准机关：国家统计局</td>
      </tr>
      <tr>
        <td class="font1220_000000">批准文号：国统制[2007]124号</td>
      </tr>
      <tr>
        <td class="font1220_000000">有效期至：2008年6月30日</td>
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
      <td width="210" align="left" class="td_viewcontent_content">200*年*月*日</td>
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
