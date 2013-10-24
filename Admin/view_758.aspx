<!--G208 消耗臭氧层物质普查表-->

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
        view.SqlStr ="select top 1 (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_758_1) as comname ,(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_758_1) as comcode,fld_758_7,fld_758_8,fld_758_9,fld_758_10,fld_758_11,fld_758_12,fld_758_13,fld_758_14,fld_758_15,fld_758_16,fld_758_17,fld_758_18,fld_758_19,fld_758_20,fld_758_21,fld_758_22,fld_758_23,fld_758_24,fld_758_25,fld_758_26,fld_758_27,fld_758_3,fld_758_5,fld_758_6,fld_758_28,fld_758_4,fld_758_2,fld_758_1 from gmis_mo_758 where fld_758_1='"+orgcode+"'";
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
        <td align="right" class="font_2635B_000">消耗臭氧层物质普查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：G208表</td>
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
      <td width="100"align="right"  class="td_viewcontent_title">单位名称（公章）</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right" width="100" class="td_viewcontent_title">单位代码</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">一、产品情况（生产下列产品的单位填报）</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%"  align="center" class="td_viewcontent_title">序号</td>
      <td width="15%"  align="center" class="td_viewcontent_title">指标名称</td>
      <td width="13%"  align="center" class="td_viewcontent_title">计量单位</td>
      <td width="13%"  align="center" class="td_viewcontent_title">生产量</td>
      <td width="13%"  align="center" class="td_viewcontent_title">销售量</td>
      <td width="13%"  align="center" class="td_viewcontent_title">销毁量</td>
      <td width="13%"  align="center" class="td_viewcontent_title">库存量</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >1</td>
      <td align="center" class="td_viewcontent_content">四氯化碳</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >2</td>
      <td align="center" class="td_viewcontent_content">甲基溴</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >3</td>
      <td align="center" class="td_viewcontent_content">含氢氯氟烃</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">二、原辅材料情况（使用下列原辅材料单位填报）</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="13%"  align="center" class="td_viewcontent_title">序号</td>
      <td width="16%"  align="center" class="td_viewcontent_title">指标名称</td>
      <td width="14%"  align="center" class="td_viewcontent_title">计量单位</td>
      <td width="15%"  align="center" class="td_viewcontent_title">采购量</td>
      <td width="14%"  align="center" class="td_viewcontent_title">使用量</td>
      <td width="28%"  align="center" class="td_viewcontent_title">库存量</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >1</td>
      <td align="center" class="td_viewcontent_content">四氯化碳</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >2</td>
      <td align="center" class="td_viewcontent_content">甲基溴</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >3</td>
      <td align="center" class="td_viewcontent_content">含氢氯氟烃</td>
      <td align="center" class="td_viewcontent_content">千克</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right" width="100" class="td_viewcontent_title" style="padding-right:5px; ">单位负责人</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="122" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">审核人 </td>
       <td width="100" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right" width="100" class="td_viewcontent_title">填表人</td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="122" align="right"  class="td_viewcontent_title">填表日期</td>
      <td width="100" align="left" class="td_viewcontent_content">200*年*月*日</td>
    </tr>
  </table>
  </G:template>
  </G:Content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">注：生产或使用表中所列消耗臭氧层物质单位填写此表。</td>
    </tr>
  </table></form>
</body>
</html>
