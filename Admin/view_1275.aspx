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
	sb.Append("select fld_1275_7,fld_1275_8,fld_1275_9,fld_1275_10,fld_1275_11,fld_1275_12,fld_1275_13,fld_1275_14,fld_1275_15,fld_1275_16,fld_1275_17,fld_1275_18,fld_1275_19,fld_1275_20,fld_1275_21,fld_1275_22,fld_1275_3,fld_1275_5,fld_1275_6,fld_1275_23,fld_1275_4,fld_1275_2 from gmis_mo_1275");
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
                工业源废气治理设施于污染物产生及排放情况非重点估算表
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
    <tr><td align="center" class="td_viewcontent_title" colspan="4">
                     一、废气产生、处理设施情况
                    </td></tr>
            <tr>
                    <td align="left" class="td_viewcontent_title" style="width:40%">
                     指标名称
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                       计量单位
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                        年实际
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                       汇总企业数（个）
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;1.工业锅炉数
                    </td>
                    <td class="td_viewcontent_content" >
                       座
                    </td>
                    <td class="td_viewcontent_content">
                        ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;2.工业锅炉总额定出力
                    </td>
                    <td class="td_viewcontent_content" >
                       兆瓦
                    </td>
                    <td  class="td_viewcontent_content">
                       ---&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                     ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;3.工业窑炉数
                    </td>
                    <td class="td_viewcontent_content" >
                       座
                    </td>
                    <td class="td_viewcontent_content">
                        ---&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;4.废气处理设施数
                    </td>
                    <td class="td_viewcontent_content" >
                       套
                    </td>
                    <td class="td_viewcontent_content">
                        ---&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;&nbsp;&nbsp;其中：除尘设施数
                    </td>
                    <td class="td_viewcontent_content" >
                       套
                    </td>
                    <td class="td_viewcontent_content">
                        ---&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                     &nbsp;&nbsp;&nbsp;&nbsp;其中：脱硫设施数
                    </td>
                    <td class="td_viewcontent_content" >
                       套
					   </td>
                    <td class="td_viewcontent_content">
                        ---&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                      &nbsp;&nbsp;5.设施建设总投资额
                    </td>
                    <td class="td_viewcontent_content" >
                       万元
                    </td>
                    <td class="td_viewcontent_content">
                        ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                      &nbsp;&nbsp;6.设施运行费用
                    <td class="td_viewcontent_content" >
                       万元
                    </td>
                    <td class="td_viewcontent_content">
                       ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;7.设施设计处理能力
                    </td>
                    <td class="td_viewcontent_content" >
                       立方米/时
                    </td>
                    <td class="td_viewcontent_content">
                        ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                      &nbsp;&nbsp;8.设施实际处理量
                    </td>
                    <td class="td_viewcontent_content" >
                       万立方米
                    </td>
                    <td class="td_viewcontent_content">
                       ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                     &nbsp;&nbsp;9.设施运行耗电量
                    </td>
                    <td class="td_viewcontent_content" >
                       万千瓦时
                    </td>
                    <td  class="td_viewcontent_content">
                     ---
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr></table>
				
    <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
    <tr><td align="center" class="td_viewcontent_title" colspan="5">
                     二、废气排放情况
                    </td></tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" colspan=2  style="width:40%">
                       &nbsp;&nbsp;10.废气排放量
                    </td>
                    <td class="td_viewcontent_content"  style="width:20%">
                       万立方米
                    </td>
                    <td class="td_viewcontent_content" style="width:20%">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:20%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" colspan=2>
                       &nbsp;&nbsp;&nbsp;&nbsp;其中：燃烧废气排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       万立方米
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" colspan=2>
                       &nbsp;&nbsp;&nbsp;&nbsp;其中：工艺废气排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       万立方米
                    </td>
                    <td class="td_viewcontent_content">
                        ---
                    </td>
                    <td class="td_viewcontent_content" style="width:20%">
                      ---
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;11.烟尘
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       产生量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td class="td_viewcontent_content" width="10%">
                       排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;12.二氧化硫
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       产生量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td class="td_viewcontent_content" width="10%">
                       排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;13.其中：燃烧废气中二氧化硫
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       产生量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td class="td_viewcontent_content" width="10%">
                       排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;14.氮氧化物
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       产生量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td class="td_viewcontent_content" width="10%">
                       排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;15.其中：燃烧废气中氮氧化物
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       产生量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td class="td_viewcontent_content" width="10%">
                       排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;16.工业粉尘
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       产生量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td class="td_viewcontent_content" width="10%">
                       排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr><tr align="center">
                    <td align="left" class="td_viewcontent_content" rowspan="2" width="30%">
                       &nbsp;&nbsp;17.氟化物
                    </td>
                    <td class="td_viewcontent_content" width="10%">
                       产生量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td class="td_viewcontent_content" width="10%">
                       排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
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
