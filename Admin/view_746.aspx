<!--G205 工业固体废物普查表_主表,查看页-->

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
	sb.Append("select (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_746_1),(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_746_1),fld_746_7,fld_746_17,fld_746_27,fld_746_46,fld_746_56,fld_746_75,fld_746_85,fld_746_95,fld_746_114,fld_746_8,fld_746_18,fld_746_28,fld_746_37,fld_746_47,fld_746_57,fld_746_66,fld_746_76,fld_746_86,fld_746_96,fld_746_105,fld_746_115,fld_746_124,fld_746_9,fld_746_19,fld_746_29,fld_746_38,fld_746_48,fld_746_58,fld_746_67,fld_746_77,fld_746_87,fld_746_97,fld_746_106,fld_746_116,fld_746_125,fld_746_10,fld_746_20,fld_746_30,fld_746_39,fld_746_49,fld_746_59,fld_746_68,fld_746_78,fld_746_88,fld_746_98,fld_746_107,fld_746_117,fld_746_126,fld_746_11,fld_746_21,fld_746_31,fld_746_40,fld_746_50,fld_746_60,fld_746_69,fld_746_79,fld_746_89,fld_746_99,fld_746_108,fld_746_118,fld_746_127,fld_746_12,fld_746_22,fld_746_32,fld_746_41,fld_746_51,fld_746_61,fld_746_70,fld_746_80,fld_746_90,fld_746_100,fld_746_109,fld_746_119,fld_746_128,fld_746_13,fld_746_23,fld_746_33,fld_746_42,fld_746_52,fld_746_62,fld_746_71,fld_746_81,fld_746_91,fld_746_101,fld_746_110,fld_746_120,fld_746_129,fld_746_14,fld_746_24,fld_746_34,fld_746_43,fld_746_53,fld_746_63,fld_746_72,fld_746_82,fld_746_92,fld_746_102,fld_746_111,fld_746_121,fld_746_130,fld_746_15,fld_746_25,fld_746_35,fld_746_44,fld_746_54,fld_746_64,fld_746_73,fld_746_83,fld_746_93,fld_746_103,fld_746_112,fld_746_122,fld_746_131,fld_746_16,fld_746_26,fld_746_36,fld_746_45,fld_746_55,fld_746_65,fld_746_74,fld_746_84,fld_746_94,fld_746_104,fld_746_113,fld_746_123,fld_746_132,fld_746_133,fld_746_134,fld_746_135,fld_746_136,fld_746_137,fld_746_138");
	sb.Append(",fld_746_3,fld_746_5,fld_746_6,'200'+cast(fld_746_139 as varchar(20))+'年'+case when cast(convert(decimal(10,0),fld_746_4) as varchar(20))='0' then ' ' else cast(convert(decimal(10,0),fld_746_4) as varchar(20)) end+'月'+case when cast(convert(decimal(10,0),fld_746_2) as varchar(20))='0' then ' ' else cast(convert(decimal(10,0),fld_746_2) as varchar(20)) end+'日',fld_746_1 from gmis_mo_746 where fld_746_1='"+orgcode+"'");
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
                工业固体废物普查表
            </td>
            <td style="width: 30%" rowspan="2">
                <table>
                    <tr>
                        <td>
                            表 &nbsp;&nbsp;&nbsp;号：G205表
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
                    <td class="td_viewcontent_content" style="width:34%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        单位代码：
                    </td>
                    <td class="td_viewcontent_content" style="width:34%">
                        *&nbsp;
                    </td>
                </tr>
                </table>
                <table border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td width="100%" colspan="15" align="center" class="td_viewcontent_title_top">
                        一、工业固体废物产生、综合利用与处理情况
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
                        冶炼废渣
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        1
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
                        粉煤灰
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        2
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
                        炉渣
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        3
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
                        煤矸石
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        4
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
                        尾矿
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        5
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
                        脱硫石膏
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        6
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
                        污泥
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        7
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
                        放射性废物
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        8
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
                        其他废物
                    </td>
                    <td width="6%" class="td_viewcontent_content">
                        9
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
                        二、工业固体险废物贮存、处置设施情况
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
