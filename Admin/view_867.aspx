<!--J503_1 危险废物处置厂污染物排放量普查表_主-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string hycode = "";//行业
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();//设置工具条,同时获取固定URL参数
    hycode = GetQueryString("hycode", "");
    string orgcode = GetQueryString("orgcode", "0");
    content_0.SqlStr = "select fld_866_2,fld_866_4,fld_867_4,fld_867_6,fld_867_5,fld_867_7,fld_867_8,fld_867_10,fld_867_9,fld_867_11,fld_867_12,fld_867_14,fld_867_13,fld_867_15,fld_867_16,fld_867_18,fld_867_17,fld_867_19,fld_867_20,fld_867_22,fld_867_21,fld_867_23,fld_867_24,fld_867_26,fld_867_25,fld_867_27,fld_867_28,fld_867_30,fld_867_29,fld_867_31,fld_867_32,fld_867_34,fld_867_33,fld_867_35,fld_867_36,fld_867_38,fld_867_37,fld_867_39,fld_867_40,fld_867_42,fld_867_41,fld_867_43,fld_867_44,fld_867_46,fld_867_45,fld_867_47,fld_867_48,fld_867_50,fld_867_49,fld_867_51,fld_867_52,fld_867_54,fld_867_53,fld_867_55,fld_867_56,fld_867_58,fld_867_57,fld_867_59,fld_867_3,fld_867_61,fld_867_62,fld_867_63,fld_867_60,fld_867_2,fld_867_1 from " + GetModuleTableName(mid) + " a left join " + GetModuleTableName("866") + " b on fld_866_1=fld_867_1 where fld_866='"+orgcode+"'" ;
    iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
}
</script>
<body style="padding:10px;text-align:center">
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

<table width="100%"><tr><td>
<G:Content ID="content_0" runat="server" Alert="...">
<G:Template id="template_0" runat="server">
<table width="100%">
<tr>
<td><!--表头-->
    <table width="100%">
        <tr>
            <td width="30%">&nbsp;</td>
            <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">危险废物处置厂污染物排放量普查表<br><span style="font-size:small; font-weight:normal;">2007年</span></td>
            <td width="30%">
                <table width="100%">
                    <tr><td width="80px" align="right" >表&nbsp;&nbsp;&nbsp;&nbsp;号：</td></tr>
                    <tr><td width="80px" align="right">制表机关：</td></tr>
                    <tr><td width="80px" align="right">批准机关：</td></tr>
                    <tr><td width="80px" align="right">文&nbsp;&nbsp;&nbsp;&nbsp;号：</td></tr>
                    <tr><td width="80px" align="right">有效期至：</td></tr>
                </table>
            </td>
        </tr>
    </table>
</td>
</tr>
<tr><td>
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
        <tr><td align="right" width="15%"   class="td_viewcontent_title" style="font-weight:bold;">
            单位名称:</td>
            <td class="td_viewcontent_content" width="35%">
                *&nbsp;</td><td align="right" width="15%"   class="td_viewcontent_title" style="font-weight:bold;">
            单位代码:</td>
              <td class="td_viewcontent_content" width="35%">
                  *&nbsp;</td>
          </tr></table>
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
        <tr>
            <td align="right" width="120" class="td_viewcontent_title_top" rowspan="2">
                指标名称</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; width:60px; font-weight:bold;" rowspan="2" align="center">
                计量单位</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="2" align="center">
                产排污系数法</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="2" align="center">
                实际监测</td>
        </tr>
        <tr>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">产生量</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">排放量</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">产生量</td>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">排放量</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title_top">
                废水主要污染物</td>
            <td class="td_viewcontent_title" align="center" style="width: 38px">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                1.化学需氧量</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">吨</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                2.氨氮</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">吨</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                3.石油类</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">吨</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                4.总磷</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">吨</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                5.挥发酚</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">吨</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                6.氰化物</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">千克</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
               7. 砷</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">千克</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                8.总铬</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">千克</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                9.铅</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">千克</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                10.镉</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">千克</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                11.汞</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">千克</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title_top">
                焚烧废气主要污染物</td>
            <td class="td_viewcontent_title" align="center" style="width: 38px">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
            <td class="td_viewcontent_title">--</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                12.烟尘</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">吨</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                13.二氧化硫</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">吨</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">
                14.诞氧化物</td>
            <td class="td_viewcontent_content" align="center" style="width: 38px">吨</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
            <td class="td_viewcontent_content">*&nbsp;</td>
        </tr>
   </table>
        <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
        <tr>
            <td align="right"   class="td_viewcontent_title">    单位负责人:</td>
            <td class="td_viewcontent_content">*&nbsp;&nbsp;&nbsp;</td>
            <td align="right"   class="td_viewcontent_title">    审核人:</td>
            <td class="td_viewcontent_content">*&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td align="right"   class="td_viewcontent_title">    填表人:</td>
            <td class="td_viewcontent_content">*&nbsp;&nbsp;&nbsp;</td>
            <td align="right"   class="td_viewcontent_title">    填表日期:</td>
            <td class="td_viewcontent_content">200*年*月*日</td>
        </tr>
    </table>
</td></tr></table>
</G:Template></G:Content></td></tr></table>
<!--动态生成结束-->
</form>
</body>
</html>