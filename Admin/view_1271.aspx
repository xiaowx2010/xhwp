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
	sb.Append("select fld_1271_4,fld_1271_5,fld_1271_14,fld_1271_6,fld_1271_7,fld_1271_8,fld_1271_10,fld_1271_11,fld_1271_12,fld_1271_13,fld_1271_3,fld_1271_52,fld_1271_53,fld_1271_54,fld_1271_51,fld_1271_2 from gmis_mo_1271");
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
                工业源用水、排水及废水处理情况非重点估算表
            </td>
            <td style="width: 30%" rowspan="2">
                <table>
                    <tr>
                        <td>
                            表 &nbsp;&nbsp;&nbsp;号：G203表
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
                       一、用水总量
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
                       &nbsp;&nbsp;1.取水总量
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
                       &nbsp;&nbsp;其中：（1）城市自来水
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
                       &nbsp;&nbsp;&nbsp;&nbsp;（2）自备水
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
                       &nbsp;&nbsp;2.重复用水量
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
                      二、废水产生量
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
                      三、废水排放量
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
                       &nbsp;&nbsp;其中：直接排入环境水体量
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
                       &nbsp;&nbsp;其中：直接进入海域量
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
                       &nbsp;&nbsp;其中：进入污水集中处理厂量
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
                     四、工业企业废水处理情况
                    </td>
                    <td class="td_viewcontent_content" >
                       --
                    </td>
                    <td  class="td_viewcontent_content">
                      --
                    </td>
                    <td class="td_viewcontent_content" style="width:22%">
                      --
                    </td>
                </tr>
				<tr align="center">
                    <td align="left" class="td_viewcontent_content">
                       &nbsp;&nbsp;1.废水治理设施数
                    </td>
                    <td class="td_viewcontent_content" >
                       套
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
                       &nbsp;&nbsp;2.废水治理设施的总投资
                    </td>
                    <td class="td_viewcontent_content" >
                       万元
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
                       &nbsp;&nbsp;3.废水治理设施的运行费用
                    </td>
                    <td class="td_viewcontent_content" >
                       万元
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
                       &nbsp;&nbsp;4.沸水治理耗电量
                    </td>
                    <td class="td_viewcontent_content" >
                      万千瓦时
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
                       &nbsp;&nbsp;5.废水治理设施设计处理能力
                    </td>
                    <td class="td_viewcontent_content" >
                       吨/日
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
                       &nbsp;&nbsp;6.废水实际处理量
                    </td>
                    <td class="td_viewcontent_content" >
                       万吨
                    </td>
                    <td class="td_viewcontent_content">
                       --
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
