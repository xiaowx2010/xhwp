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
	sb.Append("select fld_1394_19,fld_1394_20,fld_1394_21,fld_1394_22,fld_1394_23,fld_1394_24,fld_1394_25,fld_1394_26,fld_1394_27,fld_1394_28,fld_1394_29,fld_1394_30,fld_1394_31,fld_1394_32,fld_1394_33,fld_1394_34,fld_1394_35,fld_1394_36,fld_1394_40,fld_1394_38,fld_1394_41,fld_1394_42,fld_1394_43,fld_1394_39,fld_1394_37 from gmis_mo_1394");
	view.SqlStr = sb.ToString();
    iframe_658.Attributes["src"] = "iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
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
                工业源污染物产生及排放情况非重点估算表
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
                2010年
            </td>
        </tr>
    </table>

            <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
            <tr>
                    <td align="left" class="td_viewcontent_title" style="width:40%">
                     指标名称
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                       计量单位
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                        非重点排放量
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:20%">
                       非重点比例（%）
                    </td>
                </tr>
				 <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       一、工业废水
                    </td>
                    <td class="td_viewcontent_content" >
                       --
                    </td>
                    <td class="td_viewcontent_content">
                        --
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;1.工业用水总量
                    </td>
                    <td class="td_viewcontent_content" >
                       万吨
                    </td>
                    <td  class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;其中：取水总量
                    </td>
                    <td class="td_viewcontent_content" >
                       万吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;&nbsp;&nbsp;重复用水量
                    </td>
                    <td class="td_viewcontent_content" >
                       万吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;2.工业废水排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       万吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                      3.工业废水中COD排放量
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
                    <td align="left" class="td_viewcontent_content">
                      4.工业废水中氨氮排放量
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
                    <td align="left" class="td_viewcontent_content">
                       二、工业废气
                    </td>
                    <td class="td_viewcontent_content" >
                       --
                    </td>
                    <td class="td_viewcontent_content">
                       --
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       1.煤炭消费量
                    </td>
                    <td class="td_viewcontent_content" >
                       万吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       其中：原料煤消费量
                    </td>
                    <td class="td_viewcontent_content" >
                       万吨
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                     2.二氧化硫排放量
                    </td>
                    <td class="td_viewcontent_content" >
                       吨
                    </td>
                    <td  class="td_viewcontent_content">
                      *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       其中：燃料燃烧过程中排放量
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
                    <td align="left" class="td_viewcontent_content">
                       3.氮氧化物排放量
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
                    <td align="left" class="td_viewcontent_content">
                       其中：燃烧过程中排放量
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
                    <td align="left" class="td_viewcontent_content">
                       4.烟尘排放量
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
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;5.粉尘排放量
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
                    <td align="left" class="td_viewcontent_content">
                       三、工业固体废物
                    </td>
                    <td class="td_viewcontent_content" >
                       --
                    </td>
                    <td class="td_viewcontent_content">
                       --
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
                <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       1.工业固体废物产生量
                    </td>
                    <td class="td_viewcontent_content" >
                       万吨
                    </td>
                    <td class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
                <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       2.工业固体废物倾倒丢弃量
                    </td>
                    <td class="td_viewcontent_content" >
                       万吨
                    </td>
                    <td class="td_viewcontent_content">
                       *&nbsp;
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
                <tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       3.危险废物倾倒丢弃量
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
                    <td align="left" class="td_viewcontent_content">
                       4.危险废物倾倒丢弃量
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
                <tr align="left">
                    <td align="left" class="td_viewcontent_content">
                       备注说明：
                    </td>
                    <td colspan="3" class="td_viewcontent_content" >
                       *&nbsp;
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
