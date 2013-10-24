<!--S405_C 城市居民污染物表_主表-->
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
<script language="c#" runat="server">
    string hycode = "";
private void Page_Load(object sender,System.EventArgs e)
{
    SetToolBar();
   hycode = GetQueryString("hycode", "");
    string     orgcode = GetQueryString("orgcode", "0");
    view.SqlStr="select (select fld_1383_2 from gmis_mo_1383 where fld_1383_1=fld_1384_1),fld_1384_19,fld_1384_15,fld_1384_4,fld_1384_20,fld_1384_22,fld_1384_7,fld_1384_18,fld_1384_9,fld_1384_5,fld_1384_23,fld_1384_12,fld_1384_6,fld_1384_16,fld_1384_11,fld_1384_8,fld_1384_24,fld_1384_13,fld_1384_10,fld_1384_14,fld_1384_17,fld_1384_21,fld_1384_1 from gmis_mo_1384 a where fld_1384_1='"+orgcode+"'";
    list.SqlStr = "select fld_1385_2,fld_1385_3,fld_1385_4,fld_1385_5,fld_1385_6,fld_1385_7 from gmis_mo_1385 b left outer join gmis_mo_1384 a on a.fld_1384_1=b.fld_1385_1 where fld_1384_1='"+orgcode+"'";
    list.Rows=list.DataTable.Rows.Count;
    iframe_658.Attributes["src"] = "iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
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
    <!--内容-->
<!--操作工具条--> 

<!--操作工具条-->
<G:content id="view" runat="server">
<G:template id="templateview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">单位名称</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">一、污染物产排总量</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td align="center" class="td_viewcontent_title">生活污水产生量</td>
      <td align="center" class="td_viewcontent_content">*吨</td>
      <td align="center" class="td_viewcontent_title">生活垃圾产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*吨</td>
      <td align="center"class="td_viewcontent_title">总氮产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">生活污水排放量</td>
      <td align="center" class="td_viewcontent_content">*吨</td>
      <td align="center"class="td_viewcontent_title">生活垃圾排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*吨</td>
      <td align="center"class="td_viewcontent_title">总氮排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">氨氮产生量</td>
      <td align="center"class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">食用油产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">总磷产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">氨氮排放量</td>
      <td align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">食用油排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">总磷排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">化学需氧量产生量</td>
      <td align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">五日生化需氧量产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">氮氧化物产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">化学需氧量排放量</td>
      <td align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">五日生化需氧量排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">二氧化硫产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">煤渣产生量</td>
      <td align="center" class="td_viewcontent_content">*万吨</td>
      <td align="center"class="td_viewcontent_title">　烟尘产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">烟气量产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*万标立方米</td>
    </tr>
</table>
</G:template>
</G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" style="margin-top:5px; ">
    <tr>
      <td align="center" class="td_viewcontent_title">代码</td>
      <td align="center" class="td_viewcontent_title">氮氧化物产生量</td>
      <td align="center" class="td_viewcontent_title">二氧化硫产生量</td>
      <td  align="center" class="td_viewcontent_title">　烟尘产生量</td>
      <td  align="center" class="td_viewcontent_title">烟气量产生量</td>
      <td  align="center" class="td_viewcontent_title">煤渣产生量</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">甲</td>
      <td align="center" class="td_viewcontent_title">1</td>
      <td align="center" class="td_viewcontent_title">2</td>
      <td align="center" class="td_viewcontent_title">3</td>
      <td align="center" class="td_viewcontent_title">4</td>
      <td align="center" class="td_viewcontent_title">5</td>
    </tr>
    <G:listbox id="list" runat="server">
    <G:template id="templatelist" runat="server">
    <tr>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    </G:template>
    </G:listbox>
  </table>
  </form>
</body>
</html>
