<!--J501 表污水处理厂基本情况表_主表-->
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
    string orgcode = GetQueryString("orgcode","");
    content_0.SqlStr = "select fld_1453_2,fld_1453_4,fld_1453_13,fld_1453_6,fld_1453_74,fld_1453_75,fld_1453_81,fld_1453_82,fld_1453_70,fld_1453_15,fld_1453_16,fld_1453_17,fld_1453_78,fld_1453_79,fld_1453_80,fld_1453_73,fld_1453_11,fld_1453_12,fld_1453_9,fld_1453_71,fld_1453_83,(fld_1453_18+'='+(select fld_1166_2 from gmis_mo_1166 where fld_1166_1=fld_1453_18)),fld_1453_19,fld_1453_20,(fld_1453_21+'='+(select fld_1063_2 from gmis_mo_1063 where fld_1063_1=fld_1453_21)),fld_1453_22,fld_1453_23,fld_1453_24,fld_1453_25,fld_1453_26,fld_1453_27,fld_1453_28,fld_1453_29,fld_1453_30,fld_1453_31,fld_1453_32,(fld_1453_33+'='+(select fld_981_2 from gmis_mo_981 where fld_981_1=fld_1453_33)),fld_1453_34,fld_1453_35,(fld_1453_36+'='+(select fld_635_2 from gmis_mo_635 where fld_635_1=fld_1453_36)),fld_1453_37,fld_1453_38,fld_1453_39,fld_1453_40,fld_1453_41,fld_1453_42,fld_1453_43,fld_1453_44,fld_1453_45,fld_1453_46,fld_1453_47,fld_1453_48,fld_1453_49,fld_1453_50,fld_1453_51,fld_1453_52,fld_1453_53,fld_1453_54,fld_1453_55,fld_1453_56,fld_1453_57,fld_1453_58,fld_1453_59,fld_1453_60,fld_1453_61,fld_1453_62,fld_1453_63,fld_1453_64,fld_1453_65,fld_1453_66,fld_1453_67,fld_1453_68,fld_1453_69,fld_1453_14,fld_1453_76,fld_1453_77,fld_1453_84,fld_1453_72,fld_1453_10,fld_1453_1 from " + GetModuleTableName(mid) + " where fld_1453_1='"+orgcode+"'";
    iframe_658.Attributes["src"] = "iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
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
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><!--表头-->
    <table width="100%">
        <tr>
            <td width="30%">&nbsp;</td>
            <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">污水处理厂基本情况表<br><span style="font-size:small; font-weight:normal;">2010年</span></td>
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
    <tr>
        <td><!--内容-->
            <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
                <tr><td align="right"    class="td_viewcontent_title_top">1.单位名称</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>
                <tr><td align="right"     class="td_viewcontent_title_top">2.单位代码</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>
                <tr><td align="right"     class="td_viewcontent_title_top">3.法定代表人</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>

                <tr><td align="center"  style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">4.单位所在地及行政规划</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">行政区划代码：</td><td class="td_viewcontent_content">*</td><td align="right"     class="td_viewcontent_title">(省)</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">(市)</td><td class="td_viewcontent_content">*</td><td align="right"     class="td_viewcontent_title">(区县)</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">(乡)</td><td class="td_viewcontent_content">*</td><td align="right"     class="td_viewcontent_title">(村,街道)</td><td class="td_viewcontent_content">*&nbsp;</td></tr>

                <tr><td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">5.地理坐标</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">中心经度：</td><td class="td_viewcontent_content">&nbsp;*°*′*″&nbsp;&nbsp;</td><td align="right"     class="td_viewcontent_title">中心纬度：</td><td class="td_viewcontent_content">&nbsp;*°*′*″&nbsp;&nbsp;</td></tr>

                <tr><td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">6.联系方式</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">区号：</td><td class="td_viewcontent_content">*&nbsp;</td><td align="right"     class="td_viewcontent_title">电话：</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">分机：</td><td class="td_viewcontent_content">*</td><td  align="right"     class="td_viewcontent_title">传真：</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">联系人：</td><td class="td_viewcontent_content">*</td><td align="right"     class="td_viewcontent_title">邮编：</td><td class="td_viewcontent_content">*</td></tr>

                <tr><td align="right"     class="td_viewcontent_title_top">7.污水处理设施类型</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>
                <tr><td align="right"     width="15%" class="td_viewcontent_title_top">8.建成时间</td><td class="td_viewcontent_content" width="35%">*&nbsp;年*&nbsp;月</td>
    <td class="td_viewcontent_title_top" width="15%" align="right"   >
        9.污水处理级别</td>
    <td class="td_viewcontent_content" width="35%">
        *&nbsp;</td>
</tr>
                <tr><td align="right"    class="td_viewcontent_title_top">10.年运行天数(天)</td><td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
              <td class="td_viewcontent_title_top" width="15%" align="right"    >
                  11.汇水区面积(平方千米)</td>
              <td class="td_viewcontent_content" style="height: 25px">*&nbsp;
              </td>
          </tr>

            <tr>
                <td align="right"    class="td_viewcontent_title_top" style="height: 25px">12.总投资(万元)</td>
                <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                <td align="right"    class="td_viewcontent_title_top" style="height: 25px">13.年运行费用：(万元)</td>
                <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td></tr>
            <tr>
                <td align="right"    class="td_viewcontent_title_top" style="height: 25px">14.耗电量：(万千瓦时)</td>
                <td class="td_viewcontent_content" style="height: 25px" colspan="3">*&nbsp;</td>

          </tr>

                <tr><td align="right"    class="td_viewcontent_title">15.污水处理方法名称</td><td class="td_viewcontent_content" colspan="3"><table width="100%"><tr><td>
              *&nbsp;</td><td>
              *&nbsp;</td><td>
              *&nbsp;</td></tr></table></td></tr>
                <tr><td align="right"    class="td_viewcontent_title" style="height: 25px">16.污水处理方法代码</td><td class="td_viewcontent_content" colspan="3" style="height: 25px"><table width="100%"><tr><td>
              *&nbsp;</td><td>
              *&nbsp;</td><td>
              *&nbsp;</td></tr></table></td></tr>
                <tr><td align="right"    class="td_viewcontent_title">17.排水去向类型代码</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  18.受纳水体名称</td>
              <td class="td_viewcontent_content">*&nbsp;
              </td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">19.受纳水体代码</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>
                <tr><td align="right"     class="td_viewcontent_title">20.受纳水体属于功能区类别代码</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td></tr>

               <tr>
            <td  colspan="4" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" align="center">
                21.污水在线监测仪器数(台):</td>
        </tr>
        <tr>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">流量</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">化学需氧量</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    </tr>
                    <tr>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">氨氮</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">总氮</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    </tr>
                    <tr>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">总磷</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    <td align="right"    class="td_viewcontent_title" style="height: 25px">石油类</td>
                            <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
                    </tr>
                <tr><td align="right"     class="td_viewcontent_title">22.污水设计处理能力(吨/日)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  23.污水实际处理量(万吨)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">24.其中：生活污水处理量(万吨)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  25.其中：工业污水处理量(万吨)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">26.污水排放量(万吨)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                 27.再生水利用量(万吨)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
          <tr>
            <td  colspan="4" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" align="center">
                28.絮凝剂种类及用量(吨):</td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">铝盐</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">铁盐</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td></tr>
            <tr>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">有机絮凝剂</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">其他</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
        </tr>
        <tr>
            <td  colspan="4" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" align="center">
                29.其中：污水处理中絮凝剂种类及用量(吨):</td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">铝盐</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">铁盐</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td></tr>
            <tr>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">有机絮凝剂</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
            <td align="right"    class="td_viewcontent_title" style="height: 25px">其他</td>
                    <td class="td_viewcontent_content" style="height: 25px">*&nbsp;</td>
        </tr>
                <tr><td align="right"     class="td_viewcontent_title">30.污泥产生量(吨)</td><td class="td_viewcontent_content" colspan="3">*&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">31.污泥处理方法名称</td><td class="td_viewcontent_content" colspan="3">*&nbsp;*&nbsp;*&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">32.污泥处理方法代码</td><td class="td_viewcontent_content" colspan="3">*&nbsp;*&nbsp;*&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">33.污泥处置量(吨)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  34.其中：土地利用量(吨)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">35.其中：填埋处置量(吨)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  36.其中：建筑材料利用量(吨)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
                <tr><td align="right"     class="td_viewcontent_title">37.其中：焚烧处置量(吨)</td><td class="td_viewcontent_content">*&nbsp;</td>
              <td class="td_viewcontent_title"  width="15%" align="right"    >
                  38.污泥倾倒丢弃量(吨)</td>
              <td class="td_viewcontent_content">
                  *&nbsp;</td>
          </tr>
          <tr><td     class="td_viewcontent_title" align="right">
                单位负责人:</td><td class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                       审核人:</td><td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">
                填表人:</td><td class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                        填表日期</td><td class="td_viewcontent_content">201*年*月*日
            </td>
        </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td_viewcontent_content"><!--表底-->

        </td>
    </tr>
</table>
</G:Template></G:Content></td></tr></table>
<!--动态生成结束-->

</form>
</body>
</html>