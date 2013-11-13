<!--G102-->
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
string hycode;
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//设置工具条,同时获取固定URL参数
	hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");

	string str2 = "",str3="",str4="";
	str2 = ",fld_1397_37,fld_1397_42,fld_1397_47,fld_1397_52,fld_1397_38,fld_1397_43,fld_1397_48,fld_1397_53,fld_1397_39,fld_1397_44,fld_1397_49,fld_1397_54,fld_1397_40,fld_1397_45,fld_1397_50,fld_1397_55,fld_1397_41,fld_1397_46,fld_1397_51,fld_1397_56";
	str3 = ",fld_1397_58,fld_1397_78,fld_1397_95,fld_1397_112,fld_1397_59,fld_1397_79,fld_1397_96,fld_1397_113,fld_1397_60,fld_1397_80,fld_1397_97,fld_1397_114,fld_1397_63,fld_1397_83,fld_1397_100,fld_1397_64,fld_1397_84,fld_1397_101,fld_1397_65,fld_1397_85,fld_1397_102,fld_1397_66,fld_1397_86,fld_1397_103,fld_1397_67,fld_1397_87,fld_1397_104,fld_1397_69,fld_1397_89,fld_1397_106,fld_1397_70,fld_1397_90,fld_1397_107,fld_1397_74,fld_1397_94,fld_1397_111,fld_1397_75";
	str4=",fld_1397_3,fld_1397_5,fld_1397_6,''as createdate,fld_1397_134,fld_1397_4,fld_1397_2";
    string a = "select (select fld_1396_2 from gmis_mo_1396 where fld_1396_1=fld_1397_1),(select fld_1396_4 from gmis_mo_1396 where fld_1396_1=fld_1397_1),fld_1397_7,fld_1397_12,fld_1397_17,fld_1397_22,fld_1397_27,fld_1397_32,fld_1397_8,fld_1397_13,fld_1397_18,fld_1397_23,fld_1397_28,fld_1397_33,fld_1397_9,fld_1397_14,fld_1397_19,fld_1397_24,fld_1397_29,fld_1397_34,fld_1397_10,fld_1397_15,fld_1397_20,fld_1397_25,fld_1397_30,fld_1397_35,fld_1397_11,fld_1397_16,fld_1397_21,fld_1397_26,fld_1397_31,fld_1397_36 " + str2 + " "+str3+" "+str4+" ,fld_1397_1 from gmis_mo_1397 where 1=1 and fld_1397_1='"+orgcode+"'";
	view.SqlStr = "select (select fld_1396_2 from gmis_mo_1396 where fld_1396_1=fld_1397_1),(select fld_1396_4 from gmis_mo_1396 where fld_1396_1=fld_1397_1),fld_1397_7,fld_1397_12,fld_1397_17,fld_1397_22,fld_1397_27,fld_1397_32,fld_1397_8,fld_1397_13,fld_1397_18,fld_1397_23,fld_1397_28,fld_1397_33,fld_1397_9,fld_1397_14,fld_1397_19,fld_1397_24,fld_1397_29,fld_1397_34,fld_1397_10,fld_1397_15,fld_1397_20,fld_1397_25,fld_1397_30,fld_1397_35,fld_1397_11,fld_1397_16,fld_1397_21,fld_1397_26,fld_1397_31,fld_1397_36 " + str2 + " "+str3+" "+str4+" ,fld_1397_1 from gmis_mo_1397 where 1=1 and fld_1397_1='"+orgcode+"'";
//    Response.Write(a);
	DataTable dt = view.DataTable;
	if (dt.Rows.Count > 0)
	{
		dt.Rows[0]["createdate"] = "201"+dt.Rows[0]["fld_" + mid + "_134"].ToString() + "年" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "月" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "日";
	}

	iframe_1396.Attributes["src"] = "iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;


}


</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--选项卡-->
        <table width="100%">
            <tr>
                <td>
    <iframe id="iframe_1396"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
        <td style="width: 30%" rowspan="2">&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
                主要产品、原辅材料及能源消费情况普查表
            </td>
            <td style="width: 30%" rowspan="2">
               <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="top_font1220_000000">表　　号：G102表</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">制表机关：环境保护部</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">批准机关：国家统计局</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">批准文号：国统制[2009]113号</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">有效期至：2011年12月</td>
      </tr>
    </table>
            </td>
        </tr>
        <tr><td style="font-size:small; font-weight:normal;width:34%" align="center" >2010年</td></tr>
    </table>



<G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        单位名称：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        单位代码：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="center" colspan="6" class="td_viewcontent_title_top">
                        一、主要产品
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width:50%" class="td_viewcontent_title">
                        1.产品名称
                    </td>
                    <td align="center" style="width:10%"  class="td_viewcontent_title">
                        2.产品代号
                    </td>
                    <td align="center" style="width:10%"  class="td_viewcontent_title">
                        3.计量单位
                    </td>
                    <td align="center" style="width:10%"  class="td_viewcontent_title">
                        4.生产能力
                    </td>
                    <td align="center" style="width:10%"  class="td_viewcontent_title">
                        5.计量单位
                    </td>
                    <td align="center" style="width:10%"  class="td_viewcontent_title">
                        6.实际产量
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        二、主要原辅材料
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width:55%"  class="td_viewcontent_title">
                        1.原辅材料名称
                    </td>
                    <td align="center" style="width:15%"  class="td_viewcontent_title">
                        2.原辅材料代号
                    </td>
                    <td align="center" style="width:15%"  class="td_viewcontent_title">
                        3.计量单位
                    </td>
                    <td align="center" style="width:15%"  class="td_viewcontent_title">
                        4.实际使用量
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="center" colspan="8" class="td_viewcontent_title_top">
                        三、能源消费情况
                    </td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_title" style="width:15%" rowspan="2">
                        1.能源名称
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:10%" rowspan="2">
                        2.代码
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:15%" rowspan="2">
                        3.计量单位
                    </td>
                     <td align="center" class="td_viewcontent_title" style="width:30%" colspan="2">
                                    能源消费量
                                </td>

                    <td align="center" class="td_viewcontent_title" style="width:10%" rowspan="2">
                        6.硫份（%，气态能源mg/m3）
                    </td>
                    <td align="center" class="td_viewcontent_title" style="width:10%" rowspan="2">
                        7.灰份（%）
                    </td>

                </tr>
                <tr>
                 <td align="center" class="td_viewcontent_title" >
                                    4.消费总量
                                </td>
                                <td align="center" class="td_viewcontent_title" >
                                    5.其中：用做原料量
                                </td></tr>
                                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        煤炭
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       101
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       吨
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>

                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        焦碳
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       102
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       吨
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       *&nbsp
                    </td>

                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        煤矸石
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       103
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       吨
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       *&nbsp
                    </td>

                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        焦炉煤气
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       201
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      万立方米
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ——
                    </td>

                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        高炉煤气
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       202
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       万立方米
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ——
                    </td>

                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        天然气
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       203
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       万立方米
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ——
                    </td>

                </tr>

                 <tr>
                    <td align="center" class="td_viewcontent_content">
                       液化石油气
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       204
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       吨
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      ——
                    </td>

                </tr>
                 <tr>
                    <td align="center" class="td_viewcontent_content">
                        炼厂干气
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      205
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       吨
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ——
                    </td>

                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        柴油
                    </td>
                    <td align="center" class="td_viewcontent_content">
                     301
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       吨
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ——
                    </td>

                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                       燃料油
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      302
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       吨
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ——
                    </td>

                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_content">
                        其他燃料
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      400
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       吨标准煤
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ——
                    </td>

                </tr>

                <tr>
                    <td align="center" class="td_viewcontent_content">
                        电力
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      500
                    </td>
                    <td align="center" class="td_viewcontent_content">
                      万千瓦时
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content">
                       ——
                    </td>
                    <td align="center" class="td_viewcontent_content">
                       ——
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        ——
                    </td>

                </tr>

            </table>
             <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
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
