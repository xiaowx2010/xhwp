<!--J502 垃圾处理厂（场）基本情况表_主表-->
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
        string sqlstring1 = "select fld_848_2,fld_848_4,fld_848_13,fld_848_6,fld_848_82,fld_848_83,fld_848_89,fld_848_90,fld_848_78,fld_848_15,fld_848_16,fld_848_17,fld_848_86,fld_848_87,fld_848_88,fld_848_81,fld_848_11,fld_848_12,fld_848_9,fld_848_79,fld_848_91,fld_848_18,fld_848_19,(case fld_848_20 when '' then '' else fld_848_20+'='+(select substring(caption,12,len(caption)-4) from gmis_field where fieldname='fld_848_20') end),(case fld_848_21 when '' then '' else fld_848_21+'='+(select substring(caption,12,len(caption)-4) from gmis_field where fieldname='fld_848_21') end),(case fld_848_22 when '' then '' else fld_848_22+'='+(select substring(caption,12,len(caption)-4) from gmis_field where fieldname='fld_848_22') end),fld_848_23,fld_848_24,fld_848_25,fld_848_26,fld_848_27,(case fld_848_28 when '' then '' else fld_848_28+'='+(select substring(caption,11,len(caption)-5) from gmis_field where fieldname='fld_848_28') end),(case fld_848_29 when '' then '' else fld_848_29+'='+(select substring(caption,11,len(caption)-5) from gmis_field where fieldname='fld_848_29') end),fld_848_30,fld_848_31,fld_848_32,(fld_848_33+'='+(select fld_1190_2 from gmis_mo_1190 where fld_1190_1=fld_848_33)),(fld_848_34+'='+(select fld_1190_2 from gmis_mo_1190 where fld_1190_1=fld_848_34)),";
        string sqlstring2 = "fld_848_35,fld_848_36,(case fld_848_37 when '1' then '1=有' when '2' then '2=无' else '' end),fld_848_38,fld_848_39,fld_848_40,fld_848_41,fld_848_42,fld_848_43,fld_848_44,fld_848_45,fld_848_46,fld_848_47,fld_848_48,fld_848_49,fld_848_50,fld_848_51,fld_848_52,fld_848_53,fld_848_54,fld_848_55,(fld_848_56+'='+(select fld_1190_2 from gmis_mo_1190 where fld_1190_1=fld_848_56)),(fld_848_57+'='+(select fld_1190_2 from gmis_mo_1190 where fld_1190_1=fld_848_57)),fld_848_58,fld_848_59,(fld_848_60+'='+(select fld_633_2 from gmis_mo_633 where fld_633_1=fld_848_60)),(fld_848_61+'='+(select fld_1189_2 from gmis_mo_1189 where fld_1189_1=fld_848_61)),fld_848_62,fld_848_63,fld_848_64,fld_848_65,fld_848_66,fld_848_67,fld_848_68,fld_848_69,fld_848_70,fld_848_71,fld_848_72,fld_848_73,(fld_848_74+'='+(select fld_981_2 from gmis_mo_981 where fld_981_1=fld_848_74)),fld_848_75,fld_848_76,(fld_848_77+'='+(select fld_635_2 from gmis_mo_635 where fld_635_1=fld_848_77)),fld_848_14,fld_848_84,fld_848_85,fld_848_92,fld_848_80,fld_848_10 ,fld_848_1 from " + GetModuleTableName(mid) + " where 1=1 " + filter + "";
        content_0.SqlStr = sqlstring1 + sqlstring2;
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
    <td id="tb_backlist_1199" visible="false" runat="server" style="padding-left:5px;width:75px;" nowrap>
        <G:Button id="btn_backlist_1199" type="toolbar" mode="on" icon="tb13" text="返回列表" onclick="Click_BackList_1199" runat="server"></G:Button>
        </td>
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
            <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">垃圾处理厂基本情况表<br><span style="font-size:small; font-weight:normal;">2007年</span></td>
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
        <tr><td align="right"     class="td_viewcontent_title" style="font-weight:bold;">
            1.单位名称:</td>
            <td class="td_viewcontent_content" colspan="3">
                *&nbsp;</td>
        </tr>
        <tr><td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
            2.单位代码:</td>
              <td class="td_viewcontent_content" colspan="3">
                  *&nbsp;</td>
          </tr>
        <tr><td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
              3.法定代表人:</td>
              <td class="td_viewcontent_content" colspan="3">
                  *&nbsp;</td>
          </tr>
        <tr><td align="center"  style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">4.单位所在地及行政规划</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">行政区划代码：</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title">(省)</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">(市)</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title">(区县)</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">(乡)</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title">(村,街道)</td><td class="td_viewcontent_content">*&nbsp;</td></tr>
                
                <tr><td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">5.地理坐标</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">中心经度：</td><td class="td_viewcontent_content">&nbsp;*°*′*″&nbsp;&nbsp;</td><td align="right"  class="td_viewcontent_title">中心纬度：</td><td class="td_viewcontent_content">&nbsp;*°*′*″&nbsp;&nbsp;</td></tr>
                
                <tr><td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight: bold;" colspan="4">6.联系方式</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">区号：</td><td class="td_viewcontent_content">*&nbsp;</td><td align="right"  class="td_viewcontent_title">电话：</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">分机：</td><td class="td_viewcontent_content">*</td><td  align="right"  class="td_viewcontent_title">传真：</td><td class="td_viewcontent_content">*</td></tr>
                <tr><td align="right"  class="td_viewcontent_title">联系人：</td><td class="td_viewcontent_content">*</td><td align="right"  class="td_viewcontent_title">邮编：</td><td class="td_viewcontent_content">*</td></tr>
        <tr>
            <td align="right"  width="15%"   class="td_viewcontent_title" style="font-weight:bold;">
                7.建成时间:</td>
            <td class="td_viewcontent_content">*&nbsp;年*&nbsp;月
            </td>
            <td align="right" width="15%"   class="td_viewcontent_title" style="font-weight:bold;">
                8.垃圾处理方式:</td>
            <td class="td_viewcontent_content">*&nbsp;*&nbsp;*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"    class="td_viewcontent_title" style="font-weight:bold;">
                9.服务区域范围(平方千米):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
                10.年运行天数:</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
                11.总投资(万元):</td>
            <td class="td_viewcontent_content">*&nbsp;
            </td>
            <td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
                12.年运行费用(万元):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title" style="font-weight:bold;">
                13.实际处理量(吨):</td>
            <td  class="td_viewcontent_content" colspan="3">*&nbsp;
            </td>
            <%--<td class="td_viewcontent_title">&nbsp;</td>
            <td class="td_viewcontent_content">&nbsp;</td>--%>
        </tr>
        <tr>
            <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="4">填埋处置方式(有填埋处置方式的填报)</td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">
                14.填埋方式:</td>
            <td  class="td_viewcontent_content" >*&nbsp;*&nbsp;
            </td>
            <td align="right"      class="td_viewcontent_title">
                15.设计容量(立方米):</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">
                16.已填容量(立方米):</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
            <td align="right"      class="td_viewcontent_title">
                17.处理量(吨):</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">
                18.防渗:</td>
            <td class="td_viewcontent_content" colspan="3">*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">
                19.渗滤液收集系统:</td>
            <td class="td_viewcontent_content" colspan="3">*&nbsp; 
            </td>
        </tr>
        <tr>
            <td style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center" colspan="4">
                堆肥处理方式(有堆肥处理方式的填报)&nbsp;</td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">
                20.设计处理能力(吨/日):</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
            <td align="right"      class="td_viewcontent_title">
                21.处理量(吨):<td class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"      class="td_viewcontent_title">22.渗滤液收集系统</td>
            <td class="td_viewcontent_content" colspan="3">
                *&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" colspan="4">
                焚烧处置方式(有焚烧处置方式的填报)</td>
        </tr>
        <tr>
            <td    class="td_viewcontent_title" align="right">
                23.设施数量(台):</td>
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
            <td     class="td_viewcontent_title" align="right">
                24.设计处理能力(吨/日):</td>
            <td  class="td_viewcontent_content" >*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                25.处置量(吨):</td>
            <td  class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
            26.煤炭消费量(吨):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                27.燃料油消费量(不含车船用)(吨):</td>
            <td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                28.废气处理设施数:</td>
            <td  class="td_viewcontent_content" colspan="3">*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                29.废气净化方法名称:</td>
            <td colspan="3" class="td_viewcontent_content"><table width="100%"><tr><td align="left" width="50%">*&nbsp;</td><td align="left" width="50%">*&nbsp;</td></tr></table>
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                30.废气净化方法代码:</td>
            <td colspan="3" class="td_viewcontent_content"><table width="100%"><tr><td align="left" width="50%">*&nbsp;</td><td align="left" width="50%">*&nbsp;</td></tr></table>
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">31.废气处理设施设计处理能力(立方米/小时)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">32.废气实际处理量(万立方米)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">33.废气排放总量(万立方米)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">34.废气处理设施年耗电量(万千瓦时)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">35.堆放场防渗</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">36.堆放场渗滤液收集系统</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td    class="td_viewcontent_title" align="right">37.焚烧残渣产生量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">38.其中飞灰产生量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">39.残渣处置方式代码</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">40.飞灰处置方式代码</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">41.残渣处置量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">42.其中:飞灰处置量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td    class="td_viewcontent_title" align="right">43.残渣综合利用量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">44.残渣倾倒丢弃量(千克)</td><td  class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">45.其中飞灰倾倒丢弃量(千克)</td><td  class="td_viewcontent_content" colspan="3">*&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4" style="background-color:#627C9D;font-size: 12px; border: 1px solid #FFFFFF; line-height: 25px; color: #FFFFFF; text-decoration: none; font-weight:bold;" align="center">
                渗滤液产生及处理情况</td>
        </tr>
        <tr>
            <td align="right"     class="td_viewcontent_title">
                46.渗滤液处理方法名称:</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                47.渗滤液处理方法代码:</td>
            <td class="td_viewcontent_content" >*&nbsp;
            </td>
        </tr>
        <tr>
        <td     class="td_viewcontent_title" align="right">
                        48.渗滤液处理设施设计处理能力(立方米/日)</td><td class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">
                49.渗滤液处理设施设计处理量(立方米)</td><td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">
                50.渗滤液处理设施年耗电量(万千瓦时)</td><td class="td_viewcontent_content">*&nbsp;
            </td>
            <td     class="td_viewcontent_title" align="right">
                        51.渗滤液产生量(立方米)</td><td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr><td     class="td_viewcontent_title" align="right">
                52.渗滤液排放量(立方米)</td><td class="td_viewcontent_content">*&nbsp;
            </td><td     class="td_viewcontent_title" align="right">53.排水去向类型代码</td><td class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                54.受纳水体名称:</td>
            <td colspan="3" class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                55.受纳水体代码:</td>
            <td colspan="3" class="td_viewcontent_content">*&nbsp;
            </td>
        </tr>
        <tr>
            <td     class="td_viewcontent_title" align="right">
                56.受纳水体水域功能区类别代码:</td>
            <td class="td_viewcontent_content" colspan="3">*&nbsp;
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