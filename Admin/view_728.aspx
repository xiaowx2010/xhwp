<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
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
//G116 消耗臭氧层物质普查表_主表
        SetToolBar();//设置工具条,同时获取固定URL参数
        string hycode = GetQueryString("hycode", ""); 
        string orgcode=GetQueryString("orgcode","0");
        view.SqlStr = "select (select top 1 fld_1202_1 from gmis_mo_1202 where fld_1202_2=fld_" + mid + "_1),fld_" + mid + "_1,fld_" + mid + "_7,fld_" + mid + "_8,fld_" + mid + "_9,fld_" + mid + "_10,fld_" + mid + "_11,fld_" + mid + "_12,fld_" + mid + "_13,fld_" + mid + "_14,fld_" + mid + "_15,fld_" + mid + "_16,fld_" + mid + "_17,fld_" + mid + "_18,fld_" + mid + "_19,fld_" + mid + "_20,fld_" + mid + "_21,fld_" + mid + "_22 ,fld_" + mid + "_23,fld_" + mid + "_24,fld_" + mid + "_25,fld_" + mid + "_26,fld_" + mid + "_27,fld_" + mid + "_3,fld_" + mid + "_5,fld_" + mid + "_6,((case when fld_" + mid + "_28<10 then '200'+cast(fld_" + mid + "_28 as char(4)) else cast(fld_" + mid + "_28 as char(4)) end)+'年 '+(case when fld_" + mid + "_4<10 then '0'+cast(fld_" + mid + "_4 as char(1)) else cast(fld_" + mid + "_4 as char(2)) end)+' 月 '+(case when fld_" + mid + "_2<10 then '0'+cast(fld_" + mid + "_2 as char(1)) else cast(fld_" + mid + "_2 as char(2)) end)+' 日') from gmis_mo_" + mid + " where 1=1 and fld_728_1='"+orgcode+"'" ;      
        iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
}  
</script>

<body style="width:97%;">
    <form id="form1" runat="server">
    <!--选项卡-->
        <table width="100%">
            <tr>
                <td>
                    <iframe id="iframe_658" runat="server" frameborder="0" width="100%" height="25" scrolling="no">
                    </iframe>
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
    </div>
    <!--操作工具条-->
    <!--内容-->
    <!--动态生成结束--> 
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
        <td class="font1220_000000">表　　号：G116表</td>
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

    <G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="15%" align="right"  class="td_viewcontent_title">单位名称（公章）</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">单位代码</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="new_td_viewcontent_title">一、产品情况（生产下列产品的单位填报）</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">序号</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">指标名称</td>
      <td width="11%"  align="center" class="new01_td_viewcontent_title">计量单位</td>
      <td width="15%"  align="center" class="new01_td_viewcontent_title">生产量</td>
      <td width="10%"  align="center" class="new01_td_viewcontent_title">销售量</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">销毁量</td>
      <td width="11%"  align="center" class="new01_td_viewcontent_title">库存量</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >1</td>
      <td align="center" class="new_td_viewcontent_content">四氯化碳</td>
      <td align="center" class="new_td_viewcontent_content">千克</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >2</td>
      <td align="center" class="new_td_viewcontent_content">甲基溴</td>
      <td align="center" class="new_td_viewcontent_content">千克</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >3</td>
      <td align="center" class="new_td_viewcontent_content">含氢氯氟烃</td>
      <td align="center" class="new_td_viewcontent_content">千克</td>
      <blockquote>&nbsp; </blockquote>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="new_td_viewcontent_title">二、原辅材料情况（作为原辅材料使用的单位填表）</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="13%"  align="center" class="new01_td_viewcontent_title">序号</td>
      <td width="13%"  align="center" class="new01_td_viewcontent_title">指标名称</td>
      <td width="15%"  align="center" class="new01_td_viewcontent_title">计量单位</td>
      <td width="19%"  align="center" class="new01_td_viewcontent_title">采购量</td>
      <td width="14%"  align="center" class="new01_td_viewcontent_title">使用量</td>
      <td width="26%"  align="center" class="new01_td_viewcontent_title">库存量</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >1</td>
      <td align="center" class="new_td_viewcontent_content">四氯化碳</td>
      <td align="center" class="new_td_viewcontent_content">千克</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >2</td>
      <td align="center" class="new_td_viewcontent_content">甲基溴</td>
      <td align="center" class="new_td_viewcontent_content">千克</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >3</td>
      <td align="center" class="new_td_viewcontent_content">含氢氯氟烃</td>
      <td align="center" class="new_td_viewcontent_content">千克</td>
      <blockquote>&nbsp; </blockquote>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  class="td_viewcontent_title"  width="15%">单位负责人</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td align="right"  class="td_viewcontent_title"  width="15%">审核人 </td>
       <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right"  class="td_viewcontent_title">填表人</td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">填表日期</td>
      <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>

  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">注：①生产或使用表中所列消耗臭氧层物质的单位填写此表。②表中各项指标保留整数。</td>
    </tr>
  </table>
        </G:Template>
    </G:Content>
</form>
</body>
</html>
