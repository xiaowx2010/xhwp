<!--G204 废气污染物产生及处理、排放情况普查表-->

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
        view.SqlStr = "select top 1 (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_740_1) as comname ,(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_740_1) as comcode,fld_740_4,fld_740_5,fld_740_6,fld_740_7,fld_740_8,fld_740_9,fld_740_10,fld_740_11,fld_740_12,fld_740_13,fld_740_14,fld_740_15,fld_740_16,fld_740_17,fld_740_18,fld_740_19,fld_740_20,fld_740_21,fld_740_22,fld_740_23,fld_740_24,fld_740_25,fld_740_26,fld_740_27,fld_740_28,fld_740_29,fld_740_30,fld_740_31,fld_740_32,fld_740_3,fld_740_34,fld_740_35,fld_740_36,fld_740_33,fld_740_2,fld_740_1 from gmis_mo_740 where fld_740_1='"+orgcode+"'";
        iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
    }
</script>
<body><form id="form1" runat="server">

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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="60%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" class="font_2635B_000">废气污染物产生及处理、排放情况普查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：G204表</td>
      </tr>
      <tr>
        <td class="font1220_000000">制表机关：国务院第一次全国污染普查领导小组办公室</td>
      </tr>
      <tr>
        <td class="font1220_000000">批准机关：国家统计局</td>
      </tr>
      <tr>
        <td class="font1220_000000">批准文号：国统制[2007]124号</td>
      </tr>
      <tr>
        <td class="font1220_000000">有效期至：2008年6月30日</td>
      </tr>
    </table></td>
  </tr>
</table>
<!--操作工具条-->
 <G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="100" align="right"  class="td_viewcontent_title">单位名称（公章）</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right" width="100"  class="td_viewcontent_title">单位代码</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">一、废气产生、处理设施情况</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%"  align="center" class="td_viewcontent_title">指标名称</td>
      <td width="15%"  align="center" class="td_viewcontent_title">计量单位</td>
      <td width="13%"  align="center" class="td_viewcontent_title">年实际</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">1、工业锅炉数</td>
      <td align="center" class="td_viewcontent_content">座</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">2、工业锅粮炉总额定出力</td>
      <td align="center" class="td_viewcontent_content">兆瓦</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">3、工业窑炉数</td>
      <td align="center" class="td_viewcontent_content">座</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">4、废气处理设施数</td>
      <td align="center" class="td_viewcontent_content">套</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">5、其中：除尘设施数</td>
      <td align="center" class="td_viewcontent_content">套</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">6、其中：脱硫设施数</td>
      <td align="center" class="td_viewcontent_content">套</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">7、设施建设总投资额</td>
      <td align="center" class="td_viewcontent_content">万元</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">8、设施运行费用</td>
      <td align="center" class="td_viewcontent_content">万元</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">9、设施设计处理能力</td>
      <td align="center" class="td_viewcontent_content">立方米/时</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">10、设施实际处理量</td>
      <td align="center" class="td_viewcontent_content">万立方米</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:100px;">11、设施运行机制耗电量</td>
      <td align="center" class="td_viewcontent_content">万千瓦时</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">一、废气排放情况</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:100px;">12、废气排放量</td>
      <td width="19%" align="center" class="td_viewcontent_content">万立方米</td>
      <td width="33%" align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:100px;">13、其中：燃烧废气排放量</td>
      <td align="center" class="td_viewcontent_content">万立方米</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" align="left" class="td_viewcontent_content"style="padding-left:100px;">14、其中：工艺废气排放量</td>
      <td align="center" class="td_viewcontent_content">万立方米</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td width="29%" rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">15、烟尘</td>
      <td width="19%" align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">16、二氧化硫</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">17、其中：燃烧废气中二氧化硫</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">18、氮氧化物</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">19、其中：燃烧废气中氮氧化物</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">20、工业粉尘</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td rowspan="2" class="td_viewcontent_content" style="padding-left:100px;">21、氟化物</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left">
      <td colspan="3" class="td_viewcontent_content" style="padding-left:100px;">22、废气数据来源：1、产排污染数 2、实际监测 3、物料衡算： </td>
            <td align="center" class="td_viewcontent_content">*&nbsp;</td>

    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">单位负责人</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">审核人 </td>
       <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td width="100" align="right"  class="td_viewcontent_title">填表人</td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="right"  class="td_viewcontent_title">填表日期</td>
      <td width="210" align="left" class="td_viewcontent_content">200*年*月*日</td>
    </tr>

  </table>
  </G:template>
  </G:Content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">注：&nbsp;指标关系：4≥5；4≥6；12≥13+14；12≥13；16≥17；18≥19；15-21中产生量≥排放量。</td>
    </tr></table>

  
 </form>
</body>
</html>
