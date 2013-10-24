<!--J503 危险废物处置厂基本情况表_主表-->
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
    string  orgcode = GetQueryString("orgcode", "0");
    content_0.SqlStr = "select fld_866_2,fld_866_4,fld_866_13,fld_866_6,fld_866_90,fld_866_91,fld_866_97,fld_866_98,fld_866_86,fld_866_15,fld_866_16,fld_866_17,fld_866_94,fld_866_95,fld_866_96,fld_866_89,fld_866_11,fld_866_12,fld_866_9,fld_866_87,fld_866_99,(case fld_866_18 when '' then '' else fld_866_18+'='+(select substring(caption,12,len(caption)-2) from gmis_field where fieldname='fld_866_18') end),(case fld_866_19 when '' then '' else fld_866_19+'='+(select substring(caption,12,len(caption)-2) from gmis_field where fieldname='fld_866_19') end),fld_866_20,fld_866_21,fld_866_22,fld_866_23,fld_866_24,fld_866_25,fld_866_26,fld_866_27,fld_866_28,fld_866_29,fld_866_30,fld_866_31,fld_866_32,fld_866_33,fld_866_34,fld_866_35,fld_866_36,fld_866_37,fld_866_38,fld_866_39,fld_866_40,fld_866_41,fld_866_42,fld_866_43,fld_866_44,fld_866_45,fld_866_46,fld_866_47,fld_866_48,fld_866_49,fld_866_50,fld_866_51,fld_866_52,fld_866_53,fld_866_54,fld_866_55,fld_866_56,fld_866_57,fld_866_58,fld_866_59,fld_866_60,fld_866_61,(fld_866_62+'='+(select fld_633_2 from gmis_mo_633 where fld_633_1=fld_866_62)),(fld_866_63+'='+(select fld_1189_2 from gmis_mo_1189 where fld_1189_1=fld_866_63)),fld_866_64,fld_866_65,fld_866_66,fld_866_67,fld_866_68,fld_866_69,fld_866_70,fld_866_71,fld_866_72,(fld_866_73+'='+(select fld_1191_2 from gmis_mo_1191 where fld_1191_1=fld_866_73)),(fld_866_74+'='+(select fld_1191_2 from gmis_mo_1191 where fld_1191_1=fld_866_74)),fld_866_75,fld_866_76,fld_866_77,fld_866_78,fld_866_79,fld_866_80,fld_866_81,(fld_866_82+'='+(select fld_981_2 from gmis_mo_981 where fld_981_1=fld_866_82)),fld_866_83,fld_866_84,(fld_866_85+'='+(select fld_635_2 from gmis_mo_635 where fld_635_1=fld_866_85)),fld_866_14,fld_866_92,fld_866_93,fld_866_100,fld_866_88,fld_866_10,fld_866_1 from " + GetModuleTableName(mid) + " where fld_866_1='"+orgcode+"'";
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
            <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">危险废物处置厂基本情况表<br><span style="font-size:small; font-weight:normal;">2007年</span></td>
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
        <tr><td align="right"    class="td_viewcontent_title" style="font-weight:bold;">
            1.单位名称:</td>
            <td class="td_viewcontent_content" colspan="3">
                *&nbsp;</td>
        </tr>
        <tr><td align="right"     class="td_viewcontent_title" style="font-weight:bold;">
            2.单位代码:</td>
              <td class="td_viewcontent_content" colspan="3">
                  *&nbsp;</td>
          </tr>
        <tr><td align="right"     class="td_viewcontent_title" style="font-weight:bold;">
              3.法定代表人:</td>
              <td class="td_viewcontent_content" colspan="3">
                  *&nbsp;</td>
          </tr>
        <tr>
        <td align="center"  style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">4.单位所在地及行政规划</td>
        </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">行政区划代码：</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title"   >(省)</td><td class="td_viewcontent_content">*</td>
                </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">(市)</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title"   >(区县)</td><td class="td_viewcontent_content">*</td>
                </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">(乡)</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title"   >(村,街道)</td><td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                
                <tr>
                <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">5.地理坐标</td>
                </tr>
                <tr>
                <td align="right"  class="td_viewcontent_title"   >中心经度：</td><td class="td_viewcontent_content">&nbsp;*°*′*″&nbsp;&nbsp;</td><td align="right"  class="td_viewcontent_title"   >中心纬度：</td><td class="td_viewcontent_content">&nbsp;*°*′*″&nbsp;&nbsp;</td>
                </tr>
                
                <tr>
                <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">6.联系方式</td>
                </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">区号：</td><td class="td_viewcontent_content">*&nbsp;</td><td align="right"  class="td_viewcontent_title"   >电话：</td><td class="td_viewcontent_content">*</td>
                </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">分机：</td><td class="td_viewcontent_content">*</td><td  align="right"  class="td_viewcontent_title"   >传真：</td><td class="td_viewcontent_content">*</td>
                </tr>
                <tr>
                <td align="right"     class="td_viewcontent_title">联系人：</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title"   >邮编：</td><td class="td_viewcontent_content">*</td>
                </tr>
        <tr>
            <td align="right" width="15%"   class="td_viewcontent_title" style="font-weight:bold">
                7.危险废物处置方式:</td>
            <td class="td_viewcontent_content" width="35%">*&nbsp;*&nbsp;
            </td>
            <td align="right" width="15%"    class="td_viewcontent_title" style="font-weight:bold">
                8.建成时间:</td>
            <td class="td_viewcontent_content" width="35%">*&nbsp;年*&nbsp;月
            </td>
        </tr>
        <tr>
            <td align="right"     class="td_viewcontent_title" style="font-weight:bold">
                9.服务区域范围(平方千米):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title" style="font-weight:bold">
                10.年运行天数:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title" style="font-weight:bold">
                11.总投资(万元):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title" style="font-weight:bold">
                12.年运行费用(万元):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="4">
                危险废物主要处置情况</td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                13.危险飞舞设计处理能力(吨/日):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                14.危险废物处置量(吨):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                15.其中:处置工业危险废物量(吨):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                16.其中:处置医疗废物量(吨):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                17.其中:处置其他危险废物量(吨):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                18.危险废物综合利用量(吨):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                19.种类(1)名称:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                20.种类(1)处置量(吨):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                21.种类(2)名称:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                22.种类(2)处置量(吨):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                23.种类(3)名称:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                24.种类(3)处置量(吨):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                25.种类(4)名称:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td   align="right"    class="td_viewcontent_title">
                26.种类(4)处置量(吨):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title">
                27.种类(5)名称:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"    class="td_viewcontent_title">
                28.种类(5)处置量(吨):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="4">
                焚烧处置方式(有焚烧处置方式的填报)</td>
        </tr>
        <tr>
            <td    class="td_viewcontent_title" align="right">
                29.设施数量(台):</td>
        <td colspan="3" class="td_viewcontent_content">
                <table width="100%">
                    <tr>
                    <td width="50" align="right">
                        固定床:</td>
                    <td>*&nbsp;
                    </td>
                    <td align="right">
                       炉排炉:</td>
                    <td>*&nbsp;
                    </td>
                    <td align="right">
                        流化床:</td>
                    <td>*&nbsp;
                    </td>
                    <td align="right">
                        旋转窑:</td>
                    <td>*&nbsp;
                    </td>
                    <td align="right">
                        其他:</td>
                    <td>*&nbsp;
                    </td>
                    </tr>   
                </table>
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                30.设计处理能力(吨/日):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                31.处置量(吨):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                32.煤炭消费量(吨):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                33.燃料油消费量(不含车船用)(吨):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                34.废气净化方法名称:</td>
            <td colspan="3" class="td_viewcontent_content"><table width="100%"><tr><td align="left" width="50%">*&nbsp;</td><td align="left" width="50%">*&nbsp;</td></tr></table>
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                35.废气净化方法代码:</td>
            <td colspan="3" class="td_viewcontent_content"><table width="100%"><tr><td align="left" width="50%">*&nbsp;</td><td align="left" width="50%">*&nbsp;</td></tr></table>
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >36.废气处理设施数(套)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >37.废气处理设施设计处理能力(立方米/小时)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            </tr>
            <tr>
            <td class="td_viewcontent_title" align="right"  >38.废气实际处理量(万立方米)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >39.废气排放总量(万立方米)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            </tr>
            <tr>
            <td class="td_viewcontent_title" align="right"  >40.废气处理设施年耗电量(万千瓦时)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >41.焚烧残渣产生量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            </tr>
            <tr>
            <td class="td_viewcontent_title" align="right"  >42.其中飞灰产生量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >43.残渣处置方式代码</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            </tr>
            <tr><td class="td_viewcontent_title" align="right"  >44.飞灰处置方式代码</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >45.残渣处置量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >46.其中:飞灰处置量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >47.残渣综合利用量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                48.残渣倾倒丢弃量(千克):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                49.其中:飞灰倾倒丢弃量(千克):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">
                填埋处置方式(有填埋处置方式的填报)</td>
        </tr>
        <tr>
        <td class="td_viewcontent_title" align="right"  >50.设计容量(立方米)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >51.已填容量(立方米)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
                    <tr><td class="td_viewcontent_title" align="right"  >52.设计处置能力(吨/日)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                53.处置量(吨):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td></tr>
                    <tr>
            <td class="td_viewcontent_title" align="right"  >
                54.防渗:</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                55.渗滤液收集系统:</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;">
                废水产生及处理情况</td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                56.废水处理方法名称:</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td class="td_viewcontent_title" align="right"  >
                57.废水处理方法代码:</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
        <td class="td_viewcontent_title" align="right"  >58.废水处理设施设计处理能力(立方米/日)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >59.废水处理设施设计处理量(立方米)</td><td  class="td_viewcontent_content">*&nbsp;
            </td></tr>
                    <tr><td class="td_viewcontent_title" align="right"  >60.废水处理设施年耗电量(万千瓦时)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >61.废水产生量(立方米)</td><td  class="td_viewcontent_content">*&nbsp;
            </td></tr>
                    <tr><td class="td_viewcontent_title" align="right"  >62.废水排放量(立方米)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td class="td_viewcontent_title" align="right"  >63.排水去向类型代码</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                64.受纳水体名称:</td>
            <td colspan="3" class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                65.受纳水体代码:</td>
            <td  colspan="3" class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title" align="right"  >
                66.受纳水体水域功能区类别代码:</td>
            <td  class="td_viewcontent_content" colspan="3">*&nbsp;
            </td>
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
                        填表日期</td><td class="td_viewcontent_content">200*年*月*日
            </td>
        </tr>
        </table>
</td></tr></table>
</G:Template></G:Content></td></tr></table>
<!--动态生成结束-->
</form>
</body>
</html>