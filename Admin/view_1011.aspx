<!--S403_C 医院污染物表_主表-->
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
        SetToolBar();//设置工具条,同时获取固定URL参数26
        hycode = GetQueryString("hycode", "");
        string   orgcode = GetQueryString("orgcode", "0");
        string str1012="",str1011="";
        for(int i=3;i<26;i++)
        {
            if (i == 23) str1012 += ",fld_1012_23+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=fld_1012_23)";
            //else if (i == 24) str1012 += ",fld_1012_24+'='+(select fld_784_2 from gmis_mo_784 where fld_784_1=fld_1012_24)";
            else str1012 += ",fld_1012_" + i + "";
        }
        list.SqlStr="select fld_1012_2 "+str1012+" from gmis_mo_1012 b left outer join gmis_mo_1011 a on a.fld_1011_1=b.fld_1012_1 where fld_1011_1='"+orgcode+"'";
        str1011 = ",fld_1011_45,fld_1011_46,fld_1011_24,fld_1011_25,fld_1011_6,fld_1011_2,fld_1011_14,fld_1011_7,fld_1011_3,fld_1011_15,fld_1011_27,fld_1011_49,fld_1011_35,fld_1011_28,fld_1011_55,fld_1011_36,fld_1011_16,fld_1011_8,fld_1011_10,fld_1011_17,fld_1011_9,fld_1011_11,fld_1011_47,fld_1011_12,fld_1011_29,fld_1011_48,fld_1011_13,fld_1011_30,fld_1011_26,(select fld_1079_2 from gmis_mo_1079 where fld_1079_1=left(fld_1011_26,4)),fld_1011_39,fld_1011_51,fld_1011_32,fld_1011_38,fld_1011_50,fld_1011_33,fld_1011_40,fld_1011_52,fld_1011_4,fld_1011_42,fld_1011_41,fld_1011_54,fld_1011_53,fld_1011_44";
        //1011-26行业代码表：1079
        view.SqlStr = "select (select fld_1002_4 from gmis_mo_1002 where fld_1002_1=fld_1011_1),(select fld_1002_2 from gmis_mo_1002 where fld_1002_1=fld_1011_1) "+str1011+",fld_1011_1 from gmis_mo_1011 a where fld_1011_1='"+orgcode+"'";
        list.Rows = list.DataTable.Rows.Count;
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
<G:content id="view" runat="server">
<G:template id="templateview" runat="server">
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
      <td width="100" align="center" class="td_viewcontent_content">产生量</td>
      <td width="100" align="center" class="td_viewcontent_content">*吨</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">其中：营业部分</td>
      <td width="100" align="center" class="td_viewcontent_content">产生量</td>
      <td width="100" align="center" class="td_viewcontent_content">(无)吨</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title">其中：锅炉部分</td>
      <td width="100" align="center" class="td_viewcontent_content">产生量</td>
      <td width="100" align="center" class="td_viewcontent_content">（无）吨</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">*吨</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">（无）吨</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">（无）吨</td>
    </tr>
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">化学需氧量总量</td>
      <td align="center" class="td_viewcontent_content">&nbsp;产生量</td>
      <td align="center" class="td_viewcontent_content">*千克</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">其中：营业部分</td>
      <td align="center" class="td_viewcontent_content">&nbsp;产生量</td>
      <td align="center" class="td_viewcontent_content">（无）千克</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">其中：锅炉部分</td>
      <td align="center" class="td_viewcontent_content">&nbsp;产生量</td>
      <td align="center" class="td_viewcontent_content">（无）千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">*千克</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">（无）千克</td>
      <td align="center" class="td_viewcontent_content">排放量</td>
      <td align="center" class="td_viewcontent_content">（无）千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">总氮产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">氨氮产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">汞产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">总氮排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">氨氮排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">汞排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">总磷产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">医疗废物产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*吨</td>
      <td align="center"class="td_viewcontent_title">五日生化需氧量产生量</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*千克</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">总磷排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
      <td align="center"class="td_viewcontent_title">医疗废物排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*吨</td>
      <td align="center"class="td_viewcontent_title">五日生化需氧量排放量</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*千克</td>
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
    <tr>
      <td colspan="9" align="center" class="td_viewcontent_title">三、系数计算辅助信息</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">行业代码</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*=*</td>
      <td align="center"class="td_viewcontent_title">污水校核标识</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*　　　　　　（0－不合理　1－合理）</td>
      <td align="center"class="td_viewcontent_title">医疗废物校核标识</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*　　　　　　（0－不合理　1－合理）</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">主硬件数</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*&nbsp;</td>
      <td align="center"class="td_viewcontent_title">污水发生系数</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*&nbsp;</td>
      <td align="center"class="td_viewcontent_title">医疗废物发生系数</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">规模</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*　　(0－全部　1－小　2－中　3-大)</td>
      <td align="center"class="td_viewcontent_title">污水核算系数</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*&nbsp;</td>
      <td align="center"class="td_viewcontent_title">医疗废物核算系数</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">区域代码</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*&nbsp;</td>
      <td align="center"class="td_viewcontent_title">污水核算系数范围</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*－－－－*</td>
      <td align="center"class="td_viewcontent_title">医疗废物校核系数范围</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*－－－－*</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">处理工艺</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">(无)C＝其他处理工艺</td>
      <td align="center"class="td_viewcontent_title">校核用水量</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">*</td>
      <td align="center"class="td_viewcontent_title">&nbsp;</td>
      <td colspan="2" align="left" class="td_viewcontent_content" style="padding-left:10px; ">&nbsp;</td>
    </tr>
</table>
</G:template>
</G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">四、各锅炉污染物分量</td>
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
             <td rowspan="2" align="center" class="td_viewcontent_title">脱硫工艺</td>
              <td rowspan="2" align="center" class="td_viewcontent_title">除尘工艺</td>
               <td rowspan="2" align="center" class="td_viewcontent_title">原料代码</td>
                <td rowspan="2" align="center" class="td_viewcontent_title">燃料总量</td>
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
