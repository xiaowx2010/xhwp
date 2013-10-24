<!--G111 危险废物普查表_主表,查看页-->

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
	string orgcode = GetQueryString("orgcode","");

	StringBuilder sb = new StringBuilder();

	sb.Append("select (select fld_1280_2 from gmis_mo_1280 where fld_1280_1=fld_1294_1),(select fld_1280_4 from gmis_mo_1280 where fld_1280_1=fld_1294_1),fld_1294_25,fld_1294_35,fld_1294_45,fld_1294_64,fld_1294_74,fld_1294_93,fld_1294_103,fld_1294_113,fld_1294_132,fld_1294_7,fld_1294_16,fld_1294_26,fld_1294_36,fld_1294_46,fld_1294_55,fld_1294_65,fld_1294_75,fld_1294_84,fld_1294_94,fld_1294_104,fld_1294_114,fld_1294_123,fld_1294_133,fld_1294_142,fld_1294_8,fld_1294_17,fld_1294_27,fld_1294_37,fld_1294_47,fld_1294_56,fld_1294_66,fld_1294_76,fld_1294_85,fld_1294_95,fld_1294_105,fld_1294_115,fld_1294_124,fld_1294_134,fld_1294_143,fld_1294_9,fld_1294_18,fld_1294_28,fld_1294_38,fld_1294_48,fld_1294_57,fld_1294_67,fld_1294_77,fld_1294_86,fld_1294_96,fld_1294_106,fld_1294_116,fld_1294_125,fld_1294_135,fld_1294_144,fld_1294_10,fld_1294_19,fld_1294_29,fld_1294_39,fld_1294_49,fld_1294_58,fld_1294_68,fld_1294_78,fld_1294_87,fld_1294_97,fld_1294_107,fld_1294_117,fld_1294_126,fld_1294_136,fld_1294_145,fld_1294_11,fld_1294_20,fld_1294_30,fld_1294_40,fld_1294_50,fld_1294_59,fld_1294_69,fld_1294_79,fld_1294_88,fld_1294_98,fld_1294_108,fld_1294_118,fld_1294_127,fld_1294_137,fld_1294_146,fld_1294_12,fld_1294_21,fld_1294_31,fld_1294_41,fld_1294_51,fld_1294_60,fld_1294_70,fld_1294_80,fld_1294_89,fld_1294_99,fld_1294_109,fld_1294_119,fld_1294_128,fld_1294_138,fld_1294_147,fld_1294_13,fld_1294_22,fld_1294_32,fld_1294_42,fld_1294_52,fld_1294_61,fld_1294_71,fld_1294_81,fld_1294_90,fld_1294_100,fld_1294_110,fld_1294_120,fld_1294_129,fld_1294_139,fld_1294_148,fld_1294_14,fld_1294_23,fld_1294_33,fld_1294_43,fld_1294_53,fld_1294_62,fld_1294_72,fld_1294_82,fld_1294_91,fld_1294_101,fld_1294_111,fld_1294_121,fld_1294_130,fld_1294_140,fld_1294_149,fld_1294_15,fld_1294_24,fld_1294_34,fld_1294_44,fld_1294_54,fld_1294_63,fld_1294_73,fld_1294_83,fld_1294_92,fld_1294_102,fld_1294_112,fld_1294_122,fld_1294_131,fld_1294_141,fld_1294_150,");
	sb.Append("fld_1294_151,fld_1294_152,fld_1294_153,fld_1294_154,fld_1294_155,fld_1294_156,fld_1294_3,fld_1294_5,fld_1294_6,'201'+cast(fld_1294_157 as varchar(20))+'年'+case when cast(convert(decimal(10,0),fld_1294_4) as varchar(20))='0' then ' ' else cast(convert(decimal(10,0),fld_1294_4) as varchar(20)) end+'月'+case when cast(convert(decimal(10,0),fld_1294_2) as varchar(20))='0' then ' ' else cast(convert(decimal(10,0),fld_1294_2) as varchar(20)) end+'日' ,fld_1294_1 from gmis_mo_1294 where fld_1294_1='"+orgcode+"'");
	view.SqlStr = sb.ToString();
	iframe_1280.Attributes["src"]="iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;

}

</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--选项卡-->
        <table width="100%">
            <tr>
                <td>
                  <iframe id="iframe_1280"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
                危险废物普查表
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            表    号：Gl11表
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
                            批准文号：国统制[2009]113号
                        </td>
                    </tr>
                    <tr>
                        <td>
                            有效期至：2011年12月
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="font-size: small; font-weight: normal; width: 40%" align="center">
                2009年
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
                    <td width="100%" colspan="15" align="center" class="td_viewcontent_title_top">
                        一、危险废物产生、综合利用与处理情况
                    </td>
                </tr>
                <tr>
                    <td rowspan="2" width="7%" class="td_viewcontent_title">
                        1.废物名称
                    </td>
                    <td rowspan="2" width="4%" class="td_viewcontent_title">
                        2.代码
                    </td>
                    <td rowspan="2" width="6%" class="td_viewcontent_title">
                        3.生产量（吨）
                    </td>
                    <td colspan="3" align="center" width="" class="td_viewcontent_title">
                        综合利用
                    </td>
                    <td colspan="3" align="center" class="td_viewcontent_title">
                        处置
                    </td>
                    <td colspan="4" align="center" class="td_viewcontent_title">
                        贮存
                    </td>
                    <td colspan="2" align="center" class="td_viewcontent_title">
                        倾倒丢弃
                    </td>
                </tr>
                <tr>
                    <td width="6%" class="td_viewcontent_title">
                        4.利用量（吨）
                    </td>
                    <td width="8%" class="td_viewcontent_title">
                        5.其中利用往年贮存量（吨）
                    </td>
                    <td width="6%" class="td_viewcontent_title">
                        6.利用方式代码
                    </td>
                    <td width="6%" class="td_viewcontent_title">
                        7.处置量（吨）
                    </td>
                    <td width="6%" class="td_viewcontent_title">
                        8.其中处置往年贮存量（吨）
                    </td>
                    <td width="6%" class="td_viewcontent_title">
                        9.处置方式代码
                    </td>
                    <td width="6%" class="td_viewcontent_title">
                        10.本年贮存量（吨）
                    </td>
                    <td width="7%" class="td_viewcontent_title">
                        11.其中符合环保要求的贮存量（吨）
                    </td>
                    <td width="7%" class="td_viewcontent_title">
                        12.往年贮存量（吨）
                    </td>
                    <td width="6%" class="td_viewcontent_title">
                        13.贮存方式代码
                    </td>
                    <td width="7%" class="td_viewcontent_title">
                        14.倾倒丢弃量（吨）
                    </td>
                    <td width="9%" class="td_viewcontent_title">
                        15.倾倒丢弃方式代码
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="td_viewcontent_title" align=center>总计</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" align=center>——</td>
                </tr>
                <tr>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
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
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
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
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
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
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
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
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
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
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
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
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
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
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="7%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
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
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
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
                        二、危险废物贮存、处置设施情况
                    </td>
                </tr>
                <tr>
                    <td rowspan=2 class="td_viewcontent_title">1.贮存场容量（立方米）</td>
                    <td rowspan=2 class="td_viewcontent_title">2.填埋场容量（立方米）</td>
                    <td colspan="2" class="td_viewcontent_title" align=center>处理设施</td>
                    <td rowspan=2 class="td_viewcontent_title">5.总投资额（万元）</td>
                    <td rowspan=2 class="td_viewcontent_title">6.运行费用（万元）</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_title">3.设施数量（台）</td>
                    <td class="td_viewcontent_title">4.设施处理能力（吨/天）</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td colspan=6 class="td_viewcontent_content">注：以立方米为单位的指标保留整数；以吨/天，万元为计量单位的指标允许保留一位小数；其他指标允许保留两位小数。<br />
                工业固体废物产生、综合利用与处置情况指标关系：3≥10，4≥5，7≥8，10≥11，3=4+7+10-(5+8)+14。
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
