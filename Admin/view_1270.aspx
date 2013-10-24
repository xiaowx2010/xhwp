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
	sb.Append("select fld_1270_7,fld_1270_10,fld_1270_58,fld_1270_78,fld_1270_59,fld_1270_79,fld_1270_60,fld_1270_80,fld_1270_61,fld_1270_81,fld_1270_62,fld_1270_82,fld_1270_63,fld_1270_83,fld_1270_64,fld_1270_84,fld_1270_65,fld_1270_85,fld_1270_66,fld_1270_86,fld_1270_67,fld_1270_87,fld_1270_68,fld_1270_88,fld_1270_69,fld_1270_89,fld_1270_70,fld_1270_90,fld_1270_71,fld_1270_91,fld_1270_72,fld_1270_92,fld_1270_73,fld_1270_93,fld_1270_74,fld_1270_94,fld_1270_75,fld_1270_76,fld_1270_57,fld_1270_77,fld_1270_3,fld_1270_5,fld_1270_6,fld_1270_139,fld_1270_4,fld_1270_2 from gmis_mo_1270");
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
                            单位名称（公章）：*&nbsp;
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                           行政区划代码：*&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 40%" align="center" valign="middle" style="font-size: large; font-weight: bold;">
                工业源能用消费情况非重点估算表
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
            <tr>
                    <td align="left" class="td_viewcontent_title" style="width:15%">
                       1、能源名称
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:10%">
                        2、代码
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:10%">
                        3、计量单位
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:22%">
                        4、消费总量
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:22%">
                       5、其中：用作原料量
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:22%">
                        6、汇总企业数
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       原煤
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       101
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       洗精煤
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       102
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       其他洗煤
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       103
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       型煤
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       104
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       焦炭
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       105
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       焦炉煤气
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       201
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                      万立方米
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                      高炉煤气
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                      202
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       万立方米
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       天然气＊
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                      204
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       万立方米
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     --
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       液化天然气＊
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       205
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       液化石油气＊
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       206
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       炼厂干气＊
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       207
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       原油＊
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       301
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       汽油＊
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       302
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       煤油＊
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       303
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       柴油＊
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       304
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       燃料油＊
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       305
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       其它燃料＊
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       400
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨标准煤
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                      热力
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       500
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       百万千焦
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       电力
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       600
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       万千瓦时
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" style="width:15%">
                       综合能源消费量
                    </td>
                    <td class="td_viewcontent_content" style="width:10%">
                       ---
                    </td>
                    <td  class="td_viewcontent_content" style="width:10%">
                       吨标准煤
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                        --
                    </td>
                </tr>
                </table>
              
           
                <table cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                
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
