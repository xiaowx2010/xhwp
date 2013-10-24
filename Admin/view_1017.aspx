<!--S404_C 独立燃烧设施普查表_主表-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    string hycode = "";
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//设置工具条,同时获取固定URL参数
		string     orgcode = GetQueryString("orgcode", "0");
        hycode = GetQueryString("hycode","0");
        list.SqlStr="select fld_1018_2,fld_1018_20,fld_1018_21,fld_1018_17,fld_1018_18,fld_1018_14,fld_1018_15,fld_1018_11,fld_1018_12,fld_1018_9,fld_1018_10,fld_1018_3,fld_1018_4,fld_1018_5,fld_1018_6,fld_1018_7,fld_1018_8,fld_1018_13,fld_1018_16,fld_1018_19,fld_1018_22,fld_1018_23,fld_1018_24,fld_1018_25 from gmis_mo_1018 b left outer join gmis_mo_1017 a on a.fld_1017_1=b.fld_1018_1 where fld_1017_1='"+orgcode+"'";
        list.Rows = list.DataTable.Rows.Count;
        view.SqlStr="select (select fld_1016_4 from gmis_mo_1016 where fld_1016_1=fld_1017_1),(select fld_1016_2 from gmis_mo_1016 where fld_1016_1=fld_1017_1),fld_1017_4,fld_1017_8,fld_1017_2,fld_1017_5,fld_1017_9,fld_1017_3,fld_1017_16,fld_1017_6,fld_1017_14,fld_1017_17,fld_1017_7,fld_1017_15,fld_1017_10,fld_1017_12,fld_1017_11,fld_1017_13,fld_1017_1 from gmis_mo_1017 a where fld_1017_1='"+orgcode+"'";
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
    <!--内容-->
<!--操作工具条--> 
<!--操作工具条--> 

<!--操作工具条-->  
<!--操作工具条-->
<G:content id="view" runat="server">
<G:template id="templateview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:10px">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">单位代码</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">单位名称</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">一、污染物产排总量</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td align="center" class="td_viewcontent_title">二氧化硫产生量</td>
      <td align="center" class="td_viewcontent_content">*千克</td>
      <td align="center" class="td_viewcontent_title">工业废气产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*标立方米</td>
      <td align="center"class="td_viewcontent_title">氮氧化物产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">二氧化硫排放量</td>
      <td align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">工业废气排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*标立方米</td>
      <td align="center"class="td_viewcontent_title">氮氧化物排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">烟尘产生量</td>
      <td align="center"class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">粉煤灰产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">炉渣产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">烟尘排放量</td>
      <td align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">粉煤灰排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">炉渣排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">工业废水产生量</td>
      <td align="center" class="td_viewcontent_content">*吨</td>
      <td align="center"class="td_viewcontent_title">化学需氧量产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">工业废水排放量</td>
      <td align="center" class="td_viewcontent_content">*吨</td>
      <td align="center"class="td_viewcontent_title">化学需氧量排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
</table>
</G:template>
</G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">三、各行业污染物分量</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">代码</td>
      <td colspan="2" align="center" class="td_viewcontent_title">烟尘</td>
      <td colspan="2" align="center" class="td_viewcontent_title">炉渣</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">化学需氧量　</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">工业废水</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">工业废气</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">氮氧化物</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">二氧化硫</td>
        <td colspan="2"  align="center" class="td_viewcontent_title">粉煤灰</td>
           <td rowspan="2" align="center" class="td_viewcontent_title">灰份</td>
             <td rowspan="2" align="center" class="td_viewcontent_title">硫份</td>
                 <td rowspan="2" align="center" class="td_viewcontent_title">燃烧方式</td>
                                  <td rowspan="2" align="center" class="td_viewcontent_title">除尘工艺</td>
           <td rowspan="2" align="center" class="td_viewcontent_title">原料代码</td>
            <td rowspan="2" align="center" class="td_viewcontent_title">燃料总量</td>
               <td rowspan="2" align="center" class="td_viewcontent_title">脱硫工艺</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
      <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
      <td  align="center" class="td_viewcontent_title">产生量</td>
      <td  align="center" class="td_viewcontent_title">排放量</td>
      <td  align="center" class="td_viewcontent_title">产生量</td>
      <td  align="center" class="td_viewcontent_title">排放量</td>
      <td  align="center" class="td_viewcontent_title">产生量</td>
      <td  align="center" class="td_viewcontent_title">排放量</td>
      <td  align="center" class="td_viewcontent_title">产生量</td>
      <td  align="center" class="td_viewcontent_title">排放量</td>
         <td  align="center" class="td_viewcontent_title">产生量</td>
      <td  align="center" class="td_viewcontent_title">排放量</td>
      <td  align="center" class="td_viewcontent_title">产生量</td>
      <td  align="center" class="td_viewcontent_title">排放量</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">甲</td>
      <td align="center" class="td_viewcontent_title">1</td>
      <td align="center" class="td_viewcontent_title">2</td>
      <td align="center" class="td_viewcontent_title">3</td>
      <td align="center" class="td_viewcontent_title">4</td>
      <td align="center" class="td_viewcontent_title">5</td>
      <td align="center" class="td_viewcontent_title">6</td>
      <td align="center" class="td_viewcontent_title">7</td>
      <td align="center" class="td_viewcontent_title">8</td>
      <td align="center" class="td_viewcontent_title">9</td>
      <td align="center" class="td_viewcontent_title">10</td>
      <td align="center" class="td_viewcontent_title">11</td>
      <td align="center" class="td_viewcontent_title">12</td>
        <td align="center" class="td_viewcontent_title">13</td>
      <td align="center" class="td_viewcontent_title">14</td>
      <td align="center" class="td_viewcontent_title">15</td>
      <td align="center" class="td_viewcontent_title">16</td>
      <td align="center" class="td_viewcontent_title">17</td>
      <td align="center" class="td_viewcontent_title">18</td>
      <td align="center" class="td_viewcontent_title">19</td>
      <td align="center" class="td_viewcontent_title">20</td>
      <td align="center" class="td_viewcontent_title">21</td>
      <td align="center" class="td_viewcontent_title">22</td>
      <td align="center" class="td_viewcontent_title">23</td>
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
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
        <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
        <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
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
