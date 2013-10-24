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
	sb.Append("select fld_1276_7,fld_1276_8,fld_1276_9,fld_1276_10,fld_1276_11,fld_1276_12,fld_1276_13,fld_1276_14,fld_1276_15,fld_1276_16,fld_1276_17,fld_1276_18,fld_1276_19,fld_1276_20,fld_1276_21,fld_1276_22,fld_1276_23,fld_1276_24,fld_1276_25,fld_1276_26,fld_1276_27,fld_1276_28,fld_1276_29,fld_1276_30,fld_1276_31,fld_1276_32,fld_1276_33,fld_1276_34,fld_1276_35,fld_1276_36,fld_1276_46,fld_1276_47,fld_1276_48,fld_1276_49,fld_1276_50,fld_1276_51,fld_1276_52,fld_1276_53,fld_1276_54,fld_1276_55,fld_1276_56,fld_1276_57,fld_1276_58,fld_1276_59,fld_1276_60,fld_1276_61,fld_1276_62,fld_1276_63,fld_1276_64,fld_1276_65,fld_1276_75,fld_1276_76,fld_1276_77,fld_1276_78,fld_1276_79,fld_1276_80,fld_1276_81,fld_1276_82,fld_1276_83,fld_1276_84,fld_1276_85,fld_1276_86,fld_1276_87,fld_1276_88,fld_1276_89,fld_1276_90,fld_1276_91,fld_1276_92,fld_1276_93,fld_1276_94,fld_1276_95,fld_1276_96,fld_1276_97,fld_1276_98,fld_1276_99,fld_1276_100,fld_1276_101,fld_1276_102,fld_1276_103,fld_1276_104,fld_1276_114,fld_1276_115,fld_1276_116,fld_1276_117,fld_1276_118,fld_1276_119,fld_1276_120,fld_1276_121,fld_1276_122,fld_1276_123,fld_1276_3,fld_1276_5,fld_1276_6,fld_1276_139,fld_1276_4,fld_1276_2 from gmis_mo_1276");
	view.SqlStr = sb.ToString();
    iframe_658.Attributes["src"] = "iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
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
	<G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
    <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
            <td style="width: 30%">
                <table>
                    <tr>
                        <td>
                            单位名称（公章）：上海市市辖区徐汇区
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                           行政区划代码：310104000000
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 40%" align="center" valign="middle" style="font-size: large; font-weight: bold;">
                工业源固体废物产生、综合利用<br />
				及处置情况非重点估算表
            </td>
            <td style="width: 30%" rowspan="2">
                <table>
                    <tr>
                        <td>
                            表 &nbsp;&nbsp;&nbsp;号：G206表
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
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="font-size: small; font-weight: normal; width: 40%" align="center">
                2009年
            </td>
        </tr>
    </table>
            <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
    <tr><td align="center" class="td_viewcontent_title" colspan="12">
                     一、工业固体废物产生、综合利用与处置情况
                    </td></tr>
            <tr>
                    <td align="left" colspan=2 class="td_viewcontent_title" style="width:23%">
                     1.废物名称
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       总计
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
						冶炼废渣
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       粉煤灰
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       炉渣
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       煤矸石
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       尾矿
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       脱硫石膏
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       污泥
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       放射性废物
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:7%">
                       其他废物
                    </td>
                </tr>
				<tr>
                    <td align="left" rowspan="2" class="td_viewcontent_content" style="width:8%">
                     产生情况
                    </td>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     2.产生量（吨）
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                   
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     3.汇总企业数（个）
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                      ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                      ---
                    </td>
                </tr>
				<tr>
                    <td align="left" rowspan="2" class="td_viewcontent_content" style="width:8%">
                     综合利用情况
                    </td>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     4.利用量（吨）
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     5.其中：利用往年<br />贮存量（吨）
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" rowspan="2" class="td_viewcontent_content" style="width:8%">
                     处置情况
                    </td>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     6.处置量（吨）
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     7.其中：处置往年<br />贮存量（吨）
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" rowspan="3" class="td_viewcontent_content" style="width:8%">
                     贮存情况
                    </td>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     8.本年贮存量（吨）
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     9.其中：符合环保<br />要求的贮存量<br />（吨）
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                     10.往年贮存量（吨）
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
				<tr>
                    <td align="left" class="td_viewcontent_content" style="width:8%">
                     倾倒丢弃情况
                    </td>
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                    11.倾倒丢弃量（吨）
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
						*&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:7%">
                       *&nbsp;
                    </td>
                </tr>
                </table>
               <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
    <tr><td align="center" class="td_viewcontent_title" colspan="12">
                     二、工业固体废物贮存、处置设施情况
                    </td></tr>
					<tr>
                    <td align="center" colspan="2" class="td_viewcontent_title" style="width:16%">
                     贮存场（立方米）
                    </td>
                    <td align="center" colspan="2" class="td_viewcontent_title" style="width:16%">
                       填埋场（立方米）
                    </td>
                    <td align="center" colspan="2" class="td_viewcontent_title" style="width:16%">
						处理装置（台）
                    </td>
                    <td align="center" colspan="2" class="td_viewcontent_title" >
                       处理装置设计处理能力（吨/天）
                    </td>
                    <td align="center" colspan="2" class="td_viewcontent_title" style="width:16%">
                       投资（万元）
                    </td>
                    <td align="center" colspan="2" class="td_viewcontent_title" style="width:16%">
                       运行费用（万元）
                    </td></tr>
            <tr>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                     总容量
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       其中：危险废物
                    </td><td align="center" class="td_viewcontent_title" style="width:8%">
                     总容量
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       其中：危险废物
                    </td><td align="center" class="td_viewcontent_title" style="width:8%">
                     总数量
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       其中：危险废物
                    </td>
					<td align="center" class="td_viewcontent_title" style="width:8%">
                     总能力
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       其中：危险废物
                    </td>
					<td align="center" class="td_viewcontent_title" style="width:8%">
                     总投资
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       其中：危险废物
                    </td>
					<td align="center" class="td_viewcontent_title" style="width:8%">
                     总运行费用
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:8%">
                       其中：危险废物
                    </td>
                    
                </tr>
				<tr>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                     ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td><td align="center" class="td_viewcontent_content" style="width:8%">
                     ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td><td align="center" class="td_viewcontent_content" style="width:8%">
                     ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td>
					<td align="center" class="td_viewcontent_content" style="width:8%">
                     ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td>
					<td align="center" class="td_viewcontent_content" style="width:8%">
                     总投资
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td>
					<td align="center" class="td_viewcontent_content" style="width:8%">
                     ---
                    </td>
                    <td align="center" class="td_viewcontent_content" style="width:8%">
                       ---
                    </td>
                    
                </tr>
				</table>
            <table cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                
                <tr>
                    <td colspan=8 class="td_viewcontent_content">注：以“立方米”为计量单位的指标保留整数；以“吨/天、万元”为计量单位的指标允许保留一位小数；其它指标允许保留两位小数。<br />工业固体废物产生、综合利用与处置情况指标关系：3≥10,4≥5,7≥8,10≥11,3=4+7+10-(5+8)+14。
                    </td>
                </tr>
                
                </table>
               
                <table cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                    <tr>
                    <td align="right" class="td_viewcontent_title">
                        单位负责人：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        审核人：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        填表人：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        填表日期：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        201*&nbsp;年*&nbsp;月*&nbsp;日&nbsp;
                    </td>
                </tr>
                </table>
        </G:template>
    </G:Content>
    <!--动态生成html,结束-->
    </form>
</body>
</html>
