<!--GH203 工业用水及废水处理、排放情况普查表-->

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
    private void Page_Load(object sender,System.EventArgs e)
    {
        SetToolBar();//设置工具条,同时获取固定URL参数   
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode","0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_774_1),(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_774_1),fld_774_4,fld_774_10,fld_774_5,fld_774_11,fld_774_6,fld_774_12,fld_774_7,fld_774_13,fld_774_8,fld_774_14,fld_774_9,fld_774_15,fld_774_16,fld_774_17,fld_774_18,fld_774_26,fld_774_19,fld_774_27,fld_774_20,fld_774_28,fld_774_21,fld_774_29,fld_774_22,fld_774_30,fld_774_23,fld_774_31,fld_774_24,fld_774_32,fld_774_25,fld_774_33,fld_774_36,fld_774_34,fld_774_37,fld_774_35,fld_774_38,fld_774_39,fld_774_42,fld_774_45,fld_774_48,fld_774_40,fld_774_43,fld_774_46,fld_774_49,fld_774_41,fld_774_44,fld_774_47,fld_774_50,fld_774_3,fld_774_52,fld_774_53,fld_774_54,fld_774_51,fld_774_2 ,fld_774_1 from gmis_mo_774 where fld_774_1='"+orgcode+"'");
        view.SqlStr = sb.ToString();
        iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
    }
</script>
<body>

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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">工业用水及废水处理、排放情况普查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：GH203表</td>
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
      <td align="center" class="td_viewcontent_title"">一、用水、废水排放情况</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="13%"  align="center" class="td_viewcontent_title"">指标名称</td>
      <td width="21%"  align="center" class="td_viewcontent_title"">计量单位</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">年实际</td>
      <td width="24%"  align="center" class="td_viewcontent_title"">指标名称</td>
      <td width="8%"  align="center" class="td_viewcontent_title"">计量单位</td>
      <td width="20%"  align="center" class="td_viewcontent_title"">年实际</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">1、用水总量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">7、废水排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >2、其中：取水总量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">8、其中：排入水体量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >3、其中：自备水</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">9、其中：直排入海量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >4、其中：重复用水量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">10、其中：排入污水集中处理厂量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >5、废水产生量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">11、其中排入其他单位量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >6、废水实际处理量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >12、废水主要排水去向类型代码</td>
      <td colspan="2" align="left" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_content">13、受纳水体名称</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >14、受纳水体代码<span class="midtop_bnt_font1220B_000000">（普查机构填写）</span></td>
      <td colspan="2" align="left" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">二、工艺过程</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="13%" rowspan="2" align="center" class="td_viewcontent_content" >15、化学需氧量</td>
      <td width="12%" align="center" class="td_viewcontent_content" >产生量</td>
      <td width="9%" align="center" class="td_viewcontent_content" >吨</td>
      <td width="14%" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="12%" rowspan="2" align="center" class="td_viewcontent_content" >19、生化需氧量</td>
      <td width="19%" align="center" class="td_viewcontent_content" >产生量</td>
      <td width="6%" align="center" class="td_viewcontent_content" >吨</td>
      <td width="15%" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_content" >16、氨氮</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">20、氰化物</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_content" >17、石油类</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">21、砷</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_content" >18、挥发酚</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" rowspan="2" align="center" class="td_viewcontent_content"  >22、废水数据来源：1产排污系数 2实际监测 3 </td>
      <td colspan="2" rowspan="2" align="center" class="td_viewcontent_content"  >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >排放量</td>
      <td align="center" class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">三、废水处理设施情况</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="13%" align="center" class="td_viewcontent_content" >23、设施数</td>
      <td width="12%" align="center" class="td_viewcontent_content" >套</td>
      <td width="23%" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="31%" align="center" class="td_viewcontent_content" >26、设计处理能力</td>
      <td width="8%" align="center" class="td_viewcontent_content" >吨/日</td>
      <td width="13%" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td width="13%" align="center" class="td_viewcontent_content" >24、总投资额</td>
      <td align="center" class="td_viewcontent_content">万元</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">27、耗电量</td>
      <td width="8%" align="center" class="td_viewcontent_content" >万千瓦时</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >25、运行费用</td>
      <td align="center" class="td_viewcontent_content">万元</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">28、受委托处理单位名称：<br>
（委托其他单位处理的填报受委托单位名称）</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr align="left" class="td_viewcontent_content">
      <td colspan="6"  >废水处理设施处理的废水类型及处理方法</td>
    </tr>
    <tr align="center">
      <td class="td_viewcontent_content" >29、废水类型</td>
      <td colspan="2" class="td_viewcontent_content" >30、废水类型代码</td>
      <td class="td_viewcontent_content" >31、处理方法名称</td>
      <td colspan="2" class="td_viewcontent_content" >32、处理方法代码</td>
    </tr>
    <tr align="left">
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr align="left">
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr align="left">
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right" width="100"  class="td_viewcontent_title" style="padding-right:5px; ">单位负责人</td>
       <td align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">审核人 </td>
       <td  align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right" width="100" class="td_viewcontent_title">填表人</td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="right"  class="td_viewcontent_title">填表日期</td>
      <td width="210" align="left" class="td_viewcontent_content">200*年*月*日</td>
    </tr>

  </table></G:template></G:Content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">注：指标关系：1≥2；1=2+4；2≥3；7≥8；7≥9；7≥10；7≥11；8≥9；</td>
    </tr>
  </table></form>
</body>
</html>
