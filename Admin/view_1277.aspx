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
	sb.Append("select fld_1277_2,fld_1277_3,fld_1277_4,fld_1277_5,fld_1277_6,fld_1277_36,fld_1277_37,fld_1277_38,fld_1277_39,fld_1277_19,fld_1277_43,fld_1277_44,fld_1277_45,fld_1277_42,fld_1277_40 from gmis_mo_1277");
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
                工业源危险废物产生、综合利用及处置情况非重点估算表
            </td>
            <td style="width: 30%" rowspan="2">
                <table>
                    <tr>
                        <td>
                            表 &nbsp;&nbsp;&nbsp;号：G207表
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
    <tr><td align="center" class="td_viewcontent_title" colspan="3">
                    工业危险废物产生、综合利用与处置情况
                    </td></tr>
            <tr>
                    <td colspan="2" align="left" class="td_viewcontent_title" style="width:50%">
                     &nbsp;
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:50%">
                       总计
                    </td>
                </tr>
				 <tr align="center">
                   <td  rowspan="2" class="td_viewcontent_content" style="width:20%">
                     产生情况
                    </td>
                    <td class="td_viewcontent_content" style="width:30%">
                       2.产生量（吨）
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                    <td class="td_viewcontent_content" style="width:30%">
                       3.汇总企业数（个）
                    </td>
                    <td class="td_viewcontent_content">
                        ---&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                   <td  rowspan="2" class="td_viewcontent_content" style="width:20%">
                     综合利用情况
                    </td>
                    <td class="td_viewcontent_content" style="width:30%">
                       4.利用量（吨）
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                    <td class="td_viewcontent_content" style="width:30%">
                       5.其中：利用往年贮存量（吨）
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                   <td  rowspan="2" class="td_viewcontent_content" style="width:20%">
                     处置情况
                    </td>
                    <td class="td_viewcontent_content" style="width:30%">
                       6.处置量（吨）
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                    <td class="td_viewcontent_content" style="width:30%">
                       7.其中：处置往年贮存量（吨）
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                   <td  rowspan="3" class="td_viewcontent_content" style="width:20%">
                     贮存情况
                    </td>
                    <td class="td_viewcontent_content" style="width:30%">
                       8.本年贮存量（吨）
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                    <td class="td_viewcontent_content" style="width:30%">
                       9.其中：符合环保要求的贮存量（吨）
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                    <td class="td_viewcontent_content" style="width:30%">
                      10.往年贮存量（吨）
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
				 <tr align="center">
                   <td   class="td_viewcontent_content" style="width:20%">
                     倾倒丢弃情况
                    </td>
                    <td class="td_viewcontent_content" style="width:30%">
                       11.倾倒丢弃量（吨）
                    </td>
                    <td class="td_viewcontent_content">
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
