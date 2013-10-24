<!--G204_1 废气污染物产生及处理、排放情况普查表-->

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
    string p_name="";//单位名称
    string p_code="";//单位代码
    
private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//设置工具条,同时获取固定URL参数   
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode","0");
        view.SqlStr = "select top 1 fld_741_18,fld_741_2,fld_741_3,fld_741_4,fld_741_5,fld_741_6,fld_741_1,(select fld_730_2 from gmis_mo_730 where fld_730_1=fld_741_1) as comname ,(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_741_1) as comcode from gmis_mo_741 where fld_741_1='"+orgcode+"'";
        DataTable dt = view.DataTable;
        if (dt.Rows.Count > 0)
        {
            p_name=dt.Rows[0]["comname"].ToString();
            p_code=dt.Rows[0]["comcode"].ToString();
        }
        list1.SqlStr="select top 2 (select fld_1035_2 from gmis_mo_1035 where fld_1035_1=fld_744_2),fld_744_4,fld_744_5,(case when fld_744_6!=0.0 then cast(fld_744_6 as nvarchar)+'年' else '' end),(case when fld_744_7!=0.0 then cast(fld_744_7 as nvarchar)+'月' else '' end),fld_744_8,fld_744_9,fld_744_10,fld_744_11,fld_744_12,fld_744_13,fld_744_14,fld_744_15,fld_744_16,fld_744_17,fld_744_18,fld_744_19 from gmis_mo_744  where fld_744_1='"+orgcode+"'";
        list2.SqlStr="select top 2 fld_744_20,fld_744_21,fld_744_22,fld_744_23,fld_744_24,fld_744_25,fld_744_26,fld_744_27,fld_744_28,fld_744_29,fld_744_30,fld_744_31,fld_744_32,fld_744_33,fld_744_34,fld_744_35,fld_744_36 from gmis_mo_744  where fld_744_1='"+orgcode+"'";
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
        <td align="right" class="font_2635B_000">废气污染物监测表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：G204-1表</td>
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

  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">单位名称（公章）</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content"><%=p_name.ToString() %></td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">单位代码</td>
      <td colspan="3" align="left" class="td_viewcontent_content"><%=p_code.ToString() %></td>
    </tr>
</table>

  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%" rowspan="4"  align="center" class="td_viewcontent_title">数据来源</td>
      <td width="15%" rowspan="4"  align="center" class="td_viewcontent_title">1、处理设施编号</td>
      <td width="13%" rowspan="4"  align="center" class="td_viewcontent_title">2、对应的排放放口编号</td>
      <td width="13%" rowspan="4"  align="center" class="td_viewcontent_title">3、监测时间（年月）</td>
      <td colspan="2" rowspan="2"  align="center" class="td_viewcontent_title">废气流量（立方米/时）</td>
      <td colspan="3"  align="center" class="td_viewcontent_title">污染物浓度（毫克/立方米）</td>
    </tr>
    <tr>
      <td colspan="3"  align="center" class="td_viewcontent_title">烟（粉）尘</td>
    </tr>
    <tr>
      <td width="13%" rowspan="2"  align="center" class="td_viewcontent_title">4、处理设施前</td>
      <td width="13%" rowspan="2"  align="center" class="td_viewcontent_title">5、处理设施后</td>
      <td width="13%" rowspan="2"  align="center" class="td_viewcontent_title">6、进口</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">排口</td>
    </tr>
    <tr>
      <td width="13%"  align="center" class="td_viewcontent_title">7、实测</td>
      <td width="13%"  align="center" class="td_viewcontent_title">8、折算</td>
    </tr>
<G:listbox id="list1" runat="server" rows="2" showallline="true">
    <G:template id="temp_0" runat="server">
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">QZ--*</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">FQ--*</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
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

  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">污染物浓度（毫克/立方米）</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="3"  align="center" class="td_viewcontent_title">1、处理设施编号</td>
      <td colspan="3"  align="center" class="td_viewcontent_title">二氧化硫</td>
      <td colspan="3"  align="center" class="td_viewcontent_title">氮氧化物</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">氟化物</td>
    </tr>
    <tr>
      <td rowspan="2"  align="center" class="td_viewcontent_title">9、进口</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">排口</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">12、进口</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">排口</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">15、进口</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">16、排口</td>
    </tr>
    <tr>
      <td  align="center" class="td_viewcontent_title">10、实测</td>
      <td  align="center" class="td_viewcontent_title">11、折算</td>
      <td  align="center" class="td_viewcontent_title">13、实测</td>
      <td  align="center" class="td_viewcontent_title">14、折算</td>
    </tr>
    <tr>

<G:listbox id="list2" runat="server" rows="2" showallline="true">
<G:template id="temp_2" runat="server" >
      <td width="13%" rowspan="2" align="center" valign="middle" class="td_viewcontent_content" >QZ--*</td>
      <td width="15%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td width="15%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
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

   <G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  width="100"  class="td_viewcontent_title" style="padding-right:5px; ">单位负责人</td>
       <td width="230" align="left" class="td_viewcontent_content">*</td>
       <td width="100"  align="right"  class="td_viewcontent_title" style="padding-right:5px; ">审核人 </td>
       <td width="210" align="left" class="td_viewcontent_content">*</td>
    </tr>
   <tr>
      <td align="right" width="100"  class="td_viewcontent_title">填表人</td>
      <td width="230" align="left" class="td_viewcontent_content">*</td>
      <td width="100" align="right"  class="td_viewcontent_title">填表日期</td>
      <td width="210" align="left" class="td_viewcontent_content">200*年*月*日</td>
    </tr>
  </table>
  </G:template>
  </G:Content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">注：①如表格不够填写,请自行复印。②数据来源：指获取监测数据的监测活动方式。按a、普查监测、b、监督监测、c、验收监测、d、委托监测、e、企业自测、f、在线监测，将代码填入表格内。<br>
&nbsp;&nbsp;&nbsp;&nbsp;③废水流量保留整数、污染物监测方法对应有效数字填报。<br>
&nbsp;&nbsp;&nbsp;&nbsp;指标关系：6≥7；9≥10；12≥13；15≥16；</td>
    </tr>
  </table></form>
</body>
</html>
