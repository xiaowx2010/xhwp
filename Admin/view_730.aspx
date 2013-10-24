<!--G201 工业企业基本情况表_主表,查看页-->
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
	view.SqlStr = "select fld_730_2,fld_730_4,fld_730_14,fld_730_6,fld_730_22,fld_730_23,fld_730_40,fld_730_41,fld_730_9,cast(fld_730_16 as varchar(20))+'°'+cast(fld_730_17 as varchar(20))+'′'+cast(fld_730_18 as varchar(20))+'″',cast(fld_730_26 as varchar(20))+'°'+cast(fld_730_27 as varchar(20))+'′'+cast(fld_730_28 as varchar(20))+'″',fld_730_29+'='+(select fld_788_2 from gmis_mo_788 where fld_788_1=fld_730_29),fld_730_21,fld_730_42,case when fld_730_12=0 then '' else cast(convert(decimal(12,0),fld_730_12) as varchar(20)) end,case when fld_730_10=0 then '' else cast(convert(decimal(12,0),fld_730_10) as varchar(20)) end,fld_730_19,fld_730_30,fld_730_31,fld_730_32+'='+(select fld_638_2 from gmis_mo_638 where fld_638_1=fld_730_32),fld_730_33+'='+(select fld_984_2 from gmis_mo_984 where fld_984_1=fld_730_33),case when fld_730_34=0 then '' else cast(convert(decimal(10,0),fld_730_34) as varchar(20))+'年' end+case when fld_730_35=0 then '' else cast(convert(decimal(10,0),fld_730_35) as varchar(20))+'月' end,case when fld_730_36=0 then '' else cast(convert(decimal(10,0),fld_730_36) as varchar(20))+'年' end+case when fld_730_37=0 then '' else cast(convert(decimal(10,0),fld_730_37) as varchar(20))+'月' end,fld_730_38,fld_730_39,fld_730_15,fld_730_24,fld_730_25,'200'+case when fld_730_43=0 then '' else cast(convert(decimal(10,0),fld_730_43) as varchar(20))+'年' end+case when fld_730_20=0 then '' else cast(convert(decimal(10,0),fld_730_20) as varchar(20))+'月' end+case when fld_730_11=0 then '' else cast(convert(decimal(10,0),fld_730_11) as varchar(20))+'日' end,fld_730_1 from gmis_mo_730 where fld_730_1='"+orgcode+"'";
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

    <!--内容-->
    <!--动态生成结束-->
    <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
            <td style="width: 30%">
                &nbsp;
            </td>
            <td style="width: 40%" align="center" valign="middle" style="font-size: large; font-weight: bold;">
               工业企业基本情况表
            </td>
            <td style="width: 30%" rowspan="2">
                <table>
                    <tr>
                        <td>
                            表    &nbsp;&nbsp;&nbsp;号：G201表
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
                            文    &nbsp;&nbsp;&nbsp;号：国统制[2007]124号
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
    <G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
             
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        1.单位名称：
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        2.单位代码：
                    </td>
                    <td class="td_viewcontent_content" style="width: 35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        3.法定代表人：
                    </td>
                    <td class="td_viewcontent_content" style="width: 35%">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        4.单位所在地及行政区划
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        行政区划代码：
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        省：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        地区：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        县：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        乡：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        街、门牌号：
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        5.地理位置
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        中心经度：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        中心纬度：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        6.所在工业园区名称：
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        7.联系方式
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        区号：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        邮政编码：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        电话号码：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        传真号码：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        联系人姓名：
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        8.行业类别：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        行业代码：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        9.登记注册类型：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        10.企业规模：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        11.开业时间：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        12.最新改扩建时间：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        13.年生产时间：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        14.工业总产值(万元)：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        单位负责人：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        审核人：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        填表人：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        填表日期：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
            </table>
        </G:Template>
    </G:Content>
    </form>
</body>
</html>


