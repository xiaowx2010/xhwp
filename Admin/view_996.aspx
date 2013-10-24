<!--S402_C 居民服务业污染物表_主表-->
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
string hycode = "";//行业
    private void Page_Load(object sender, System.EventArgs e)
    {
        string orgcode= GetQueryString("orgcode","0");
        hycode = GetQueryString("hycode", "");
        SetToolBar();//设置工具条,同时获取固定URL参数
        list1.SqlStr="select fld_997_2,fld_997_21,fld_997_3,fld_997_20,fld_997_30,fld_997_4,fld_997_15,fld_997_5,fld_997_6,fld_997_7,fld_997_8,fld_997_9,fld_997_10,fld_997_13,fld_997_14,fld_997_11,fld_997_12,fld_997_16,fld_997_17,fld_997_18,fld_997_19,fld_997_22,fld_997_23,fld_997_31,fld_997_32,fld_997_24,fld_997_25,fld_997_26,fld_997_27,fld_997_28,fld_997_29 from gmis_mo_997 b left outer join gmis_mo_996 a on a.fld_996_1=b.fld_997_1 where fld_996_1='"+orgcode+"'";
        list1.Rows=list1.DataTable.Rows.Count;
        list2.SqlStr="select fld_998_2,fld_998_3,fld_998_4,fld_998_5,fld_998_6,fld_998_7,fld_998_8,fld_998_9,fld_998_10,fld_998_11,fld_998_12,fld_998_14,fld_998_15,fld_998_17,fld_998_18,fld_998_20,fld_998_21,fld_998_13,fld_998_16,fld_998_19,fld_998_22,fld_998_23,fld_998_24,fld_998_25 from gmis_mo_998 b  left outer join gmis_mo_996 a on a.fld_996_1=b.fld_998_1  where fld_996_1='"+orgcode+"'";
        list2.Rows=list2.DataTable.Rows.Count;
        string str996="";
        str996 = ",fld_996_35,fld_996_36,fld_996_18,fld_996_19,fld_996_45,fld_996_26,fld_996_30,fld_996_46,fld_996_27,fld_996_31,fld_996_32,fld_996_22,fld_996_28,fld_996_33,fld_996_23,fld_996_29,fld_996_4,fld_996_14,fld_996_5,fld_996_15,fld_996_10,fld_996_2,fld_996_6,fld_996_11,fld_996_3,fld_996_7,fld_996_43,fld_996_8,fld_996_24,fld_996_44,fld_996_9,fld_996_25,fld_997_2,fld_996_38,fld_996_39,fld_996_41,fld_996_40,fld_996_34";
        view.SqlStr="select (select fld_995_4 from gmis_mo_995 where fld_995_1=fld_996_1),(select fld_995_2 from gmis_mo_995 where fld_995_1=fld_996_1) "+str996+",fld_996_1 from gmis_mo_996 a left outer join gmis_mo_997 b on a.fld_996_1=b.fld_997_1 where fld_996_1='"+orgcode+"'";
        iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
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
<G:template id="template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
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
      <td rowspan="2" align="center" class="td_viewcontent_title">污水总量</td>
      <td  align="center" class="td_viewcontent_content">产生量</td>
      <td  align="center" class="td_viewcontent_content">*吨</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">其中：营业部分</td>
      <td align="center" class="td_viewcontent_content">产生量</td>
      <td  align="center" class="td_viewcontent_content">(无)吨</td>
      <td  rowspan="2" align="center" class="td_viewcontent_title">其中：锅炉部分</td>
      <td  align="center" class="td_viewcontent_content">产生量</td>
      <td  align="center" class="td_viewcontent_content">(无)吨</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">*吨</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">(无)吨</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">(无)吨</td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">化学需氧量总量</td>
      <td align="center" class="td_viewcontent_content">&nbsp;产生量</td>
      <td align="center" class="td_viewcontent_content">*千克</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">其中：营业部分</td>
      <td align="center" class="td_viewcontent_content">&nbsp;产生量</td>
      <td align="center" class="td_viewcontent_content">(无)千克</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">其中：锅炉部分</td>
      <td align="center" class="td_viewcontent_content">&nbsp;产生量</td>
      <td align="center" class="td_viewcontent_content">(无)千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">*千克</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">(无)千克</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">(无)千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">总铬产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*克</td>
      <td align="center"class="td_viewcontent_title">总磷产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">铅产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">总铬排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*克</td>
      <td align="center"class="td_viewcontent_title">总磷排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">铅排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">石油产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">&nbsp;&nbsp;六价铬油产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*吨</td>
      <td align="center"class="td_viewcontent_title">氰化物产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">石油排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">六价铬排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*吨</td>
      <td align="center"class="td_viewcontent_title">氰化物排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">总氮产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">汞产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*克</td>
      <td align="center"class="td_viewcontent_title">&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">总氮排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">汞排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*克</td>
      <td align="center"class="td_viewcontent_title">&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="9" align="center" class="td_viewcontent_title">二、锅炉部分产生的污染物</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">工业废气产量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*标立方米</td>
      <td align="center"class="td_viewcontent_title">氮氧化物产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">二氧化硫产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">工业废气排量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*标立方米</td>
      <td align="center"class="td_viewcontent_title">氮氧化物排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">二氧化硫排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">烟尘产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">粉煤灰产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">炉渣产生量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">烟尘排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">粉煤灰排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">炉渣排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
   <tr>
      <td align="center" colspan="4" class="td_viewcontent_title">三、系数计算辅助信息</td>
    </tr>
     <tr>
       <td align="right"  class="td_viewcontent_title" style="padding-right:5px; ">行业代码</td>
       <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right"  class="td_viewcontent_title">污水校核标识</td>
      <td width="230" align="left" style="width:35%" class="td_viewcontent_content">*（0-不合理　1-合理）</td>
      <td width="122" align="right"  class="td_viewcontent_title">污水校核值</td>
      <td width="210" align="left" style="width:35%" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
     <td align="right"  class="td_viewcontent_title">污水校核系数范围</td>
     <td align="left" class="td_viewcontent_content">*---*</td>
     <td align="right"  class="td_viewcontent_title">校核用水量</td>
     <td align="left" class="td_viewcontent_content">*</td>
   </tr>

  </table>
 </G:template>
  </G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">四、各行业污染物分量</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">代码</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">行政区划</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">区域代码</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">规模　</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">营业天数</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">废水处理技术</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">主硬件数</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">总氮</td>
      <td colspan="2" align="center" class="td_viewcontent_title">汞</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">化学需氧量</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">总磷</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">六价铬</td>
       <td colspan="2"  align="center" class="td_viewcontent_title">氰化物</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">铅</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">石油</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">总铬</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">污水核算系数</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">污水校核值</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">污水总量核算上限</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">污水总量校核下限</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">污水校核系数上限</td>
       <td rowspan="2" align="center" class="td_viewcontent_title">污水校核系数下限</td>

    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
      <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
      <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
      <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
      <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
        <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
        <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
        <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
        <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
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
      <td align="center" class="td_viewcontent_title">24</td>
       <td align="center" class="td_viewcontent_title">25</td>
      <td align="center" class="td_viewcontent_title">26</td>
      <td align="center" class="td_viewcontent_title">27</td>
      <td align="center" class="td_viewcontent_title">28</td>
      <td align="center" class="td_viewcontent_title">29</td>
      <td align="center" class="td_viewcontent_title">30</td>
    </tr>
    <G:listbox id="list1" runat="server">
    <G:template id="templatelist1" runat="server">
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
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">五、各锅炉污染物分量</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">代码</td>
      <td colspan="2" align="center" class="td_viewcontent_title">氮氧化物</td>
      <td colspan="2" align="center" class="td_viewcontent_title">二氧化硫</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">粉煤灰　</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">工业废气</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">工业废水</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">化学需氧量</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">泸渣</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">烟尘</td>
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
      <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
      <td align="center" class="td_viewcontent_title">产生量</td>
      <td align="center" class="td_viewcontent_title">排放量</td>
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
    <G:listbox id="list2" runat="server">
    <G:template id="templatelist2" runat="server">
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
