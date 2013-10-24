<!--G202 危险废物普查表_主表,查看页-->

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
    
string hycode = "";//行业
    
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//设置工具条,同时获取固定URL参数   
	hycode = GetQueryString("hycode", "");
    string orgcode = GetQueryString("orgcode","0");
	StringBuilder sb = new StringBuilder();
	sb.Append("select (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_732_1),(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_732_1),fld_732_7,fld_732_12,fld_732_17,fld_732_22,fld_732_27,fld_732_32,fld_732_134,fld_732_8,fld_732_13,fld_732_18,fld_732_23,fld_732_28,fld_732_33,fld_732_135,fld_732_9,fld_732_14,fld_732_19,fld_732_24,fld_732_29,fld_732_34,fld_732_136,fld_732_10,fld_732_15,fld_732_20,fld_732_25,fld_732_30,fld_732_35,fld_732_137,fld_732_11,fld_732_16,fld_732_21,fld_732_26,fld_732_31,fld_732_36,fld_732_138,fld_732_37,fld_732_42,fld_732_47,fld_732_52,fld_732_38,fld_732_43,fld_732_48,fld_732_53,fld_732_39,fld_732_44,fld_732_49,fld_732_54,fld_732_40,fld_732_45,fld_732_50,fld_732_55,fld_732_41,fld_732_46,fld_732_51,fld_732_56,fld_732_58,fld_732_78,fld_732_95,fld_732_112,fld_732_116,fld_732_59,fld_732_79,fld_732_96,fld_732_113,fld_732_117,fld_732_60,fld_732_80,fld_732_97,fld_732_114,fld_732_118,fld_732_61,fld_732_81,fld_732_98,fld_732_115,fld_732_119,fld_732_62,fld_732_82,fld_732_99,fld_732_120,fld_732_63,fld_732_83,fld_732_100,fld_732_121,fld_732_64,fld_732_84,fld_732_101,fld_732_122,fld_732_65,fld_732_85,fld_732_102,fld_732_123,fld_732_66,fld_732_86,fld_732_103,fld_732_124,fld_732_67,fld_732_87,fld_732_104,fld_732_125,fld_732_68,fld_732_88,fld_732_105,fld_732_126,fld_732_69,fld_732_89,fld_732_106,fld_732_127,fld_732_70,fld_732_90,fld_732_107,fld_732_128,fld_732_71,fld_732_91,fld_732_108,fld_732_129,fld_732_72,fld_732_92,fld_732_109,fld_732_130,fld_732_73,fld_732_93,fld_732_110,fld_732_131,fld_732_74,fld_732_94,fld_732_111,fld_732_75,fld_732_132,fld_732_76,fld_732_133,fld_732_57,fld_732_77");
	sb.Append(",fld_732_3,fld_732_5,fld_732_6,'200'+cast(fld_732_139 as varchar(20))+'年'+case when cast(convert(decimal(10,0),fld_732_4) as varchar(20))='0' then ' ' else cast(convert(decimal(10,0),fld_732_4) as varchar(20)) end+'月'+case when cast(convert(decimal(10,0),fld_732_2) as varchar(20))='0' then ' ' else cast(convert(decimal(10,0),fld_732_2) as varchar(20)) end+'日',fld_732_1 from gmis_mo_732 where fld_732_1='"+orgcode+"'");
	view.SqlStr = sb.ToString();
    iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
}
</script>

<body style="padding: 10px; text-align: center">
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

    <!--动态生成html,开始-->
    <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
            <td style="width: 30%">
                &nbsp;
            </td>
            <td style="width: 40%" align="center" valign="middle" style="font-size: large; font-weight: bold;">
                主要产品、原辅材料及能源消费情况普查表
            </td>
            <td style="width: 30%" rowspan="2">
                <table>
                    <tr>
                        <td>
                            表 &nbsp;&nbsp;&nbsp;号：G202表
                        </td>
                    </tr>
                    <tr>
                        <td>
                            制表机关：国务院第一次全国污染源普查领导小组办公室
                        </td>
                    </tr>
                    <tr>
                        <td>
                            批准机关：国家统计局
                        </td>
                    </tr>
                    <tr>
                        <td>
                            文 &nbsp;&nbsp;&nbsp;号：国统制[2007]124号
                        </td>
                    </tr>
                    <tr>
                        <td>
                            有效期至：2008年6月30日
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="font-size: small; font-weight: normal; width: 40%" align="center">
                2007年
            </td>
        </tr>
    </table>
    <G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
            <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
            <tr>
                    <td align="right" class="td_viewcontent_title">
                        单位名称（公章）：
                    </td>
                    <td class="td_viewcontent_content" style="width:33%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        单位代码：
                    </td>
                    <td class="td_viewcontent_content" style="width:33%">
                        *&nbsp;
                    </td>
                </tr>
                </table>
                <table border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td width="100%" colspan="7" align="center" class="td_viewcontent_title_top">
                        一、主要产品
                    </td>
                </tr>
                <tr>
                    <td  width="7%" class="td_viewcontent_title">
                        1.产品名称
                    </td>
                    <td  width="4%" class="td_viewcontent_title">
                        2.产品代码
                    </td>
                    <td  width="6%" class="td_viewcontent_title">
                        3.计量单位
                    </td>
                    <td  align="center"  class="td_viewcontent_title">
                        4.生产能力
                    </td>
                    <td  align="center" class="td_viewcontent_title">
                        5.计量单位
                    </td>
                    <td  align="center" class="td_viewcontent_title">
                        6.实际产量
                    </td>
                    <td  align="center" class="td_viewcontent_title">
                        7.主要工艺
                    </td>
                </tr>
                <tr>
                   <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="9%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="9%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    
                    
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="9%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="9%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="9%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
            </table>
            <table border="0" width="100%" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td width="100%" colspan="6" align="center" class="td_viewcontent_title_top">
                        二、主要原辅材料
                    </td>
                </tr>
                <tr>
                    <td  class="td_viewcontent_title">1.原辅材料名称</td>
                    <td class="td_viewcontent_title">2.原辅材料代码</td>
                    
                    <td class="td_viewcontent_title">3.计量单位</td>
                    <td class="td_viewcontent_title">4.实际使用量</td>
                </tr>
                
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>

                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>

                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>

                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>

                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>

                </tr>
                </table>
                <table cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td width="100%" colspan="8" align="center" class="td_viewcontent_title_top">
                        三.能源消费情况
                    </td>
                </tr>
                <tr>
                    <td rowspan=2 class="td_viewcontent_title">1.能源名称</td>
                    <td rowspan=2 class="td_viewcontent_title">2.代码</td>
                    <td rowspan=2 class="td_viewcontent_title">3.计量单位</td>
                    <td colspan=2 class="td_viewcontent_title" align=center>能源消费量</td>
                    <td rowspan=2 class="td_viewcontent_title">6.硫份(%,气态能源mg/m3)</td>
                    <td rowspan=2 class="td_viewcontent_title">7.灰份(%)</td>
                    <td rowspan=2 class="td_viewcontent_title">8.采用的折标系数</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_title">4.消费总量</td>
                    <td class="td_viewcontent_title">5.其中:用作原料量</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">原煤</td>
                    <td class="td_viewcontent_content">101</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">洗精煤</td>
                    <td class="td_viewcontent_content">102</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">其他洗煤</td>
                    <td class="td_viewcontent_content">103</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">型煤</td>
                    <td class="td_viewcontent_content">104</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">焦碳</td>
                    <td class="td_viewcontent_content">105</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">焦炉煤气</td>
                    <td class="td_viewcontent_content">201</td>
                    <td class="td_viewcontent_content">万立方米</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">高炉煤气</td>
                    <td class="td_viewcontent_content">202</td>
                    <td class="td_viewcontent_content">万立方米</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">天然气＊</td>
                    <td class="td_viewcontent_content">204</td>
                    <td class="td_viewcontent_content">万立方米</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">液化天然气＊</td>
                    <td class="td_viewcontent_content">205</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">液化石油气</td>
                    <td class="td_viewcontent_content">206</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">炼厂干气＊</td>
                    <td class="td_viewcontent_content">207</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">原油</td>
                    <td class="td_viewcontent_content">301</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">汽油＊</td>
                    <td class="td_viewcontent_content">302</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">煤油＊</td>
                    <td class="td_viewcontent_content">303</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">柴油＊</td>
                    <td class="td_viewcontent_content">304</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">燃料油＊</td>
                    <td class="td_viewcontent_content">305</td>
                    <td class="td_viewcontent_content">吨</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">其他燃料＊</td>
                    <td class="td_viewcontent_content">400</td>
                    <td class="td_viewcontent_content">吨标准煤</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">热力</td>
                    <td class="td_viewcontent_content">500</td>
                    <td class="td_viewcontent_content">百万千焦</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">电力</td>
                    <td class="td_viewcontent_content">600</td>
                    <td class="td_viewcontent_content">万千瓦时</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">综合能源消费量</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">吨标准煤</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                </tr>
                <tr>
                    <td colspan=8 class="td_viewcontent_content">①注＊的能源，硫份为选填。②表中产品的生产能力保留整数；主要原辅材料实际使用量、以%为计量单位的指标允许保留一位小数；以“mg/m3”为计量单位的指标保留三位小数；其他指标允许保留两位小数 。
                    </td>
                </tr>
                
                </table>
                <table cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                    <tr>
                    <td align="right" class="td_viewcontent_title">
                        单位负责人：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        审核人：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        填表人：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        填表日期：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                </tr>
                </table>
        </G:template>
    </G:Content>
    <!--动态生成html,结束-->
    </form>
</body>
</html>
