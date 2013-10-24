<!--G203-1 废水污染物监测表-->

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
        StringBuilder h_sb=new StringBuilder();//sql语句
        h_sb.Append("select top 1 (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_735_1) as comname ,(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_735_1) as comcode,fld_738_3,fld_738_4,fld_738_5+'='+(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_738_5),fld_738_6+'='+(select fld_1035_2 from gmis_mo_1035 where fld_1035_1=fld_738_6),(case when fld_738_7!=0 then cast(fld_738_7 as nvarchar)+'年' else '' end),(case when fld_738_8!=0 then cast(fld_738_8 as nvarchar)+'月' else '' end),fld_738_9,fld_738_10,fld_738_11,fld_738_12,fld_738_13,fld_738_14,fld_738_15,(case when fld_738_26!=0 then cast(fld_738_26 as nvarchar)+'年' else '' end),(case when fld_738_27!=0 then cast(fld_738_27 as nvarchar)+'月' else '' end),fld_738_28,fld_738_29,fld_738_30,fld_738_31,fld_738_32,fld_738_33,fld_738_34,(case when fld_738_45!=0 then cast(fld_738_45 as nvarchar)+'年' else '' end),(case when fld_738_46!=0 then cast(fld_738_46 as nvarchar)+'月' else '' end),fld_738_47,fld_738_48,fld_738_49,fld_738_50,fld_738_51,fld_738_52,");
        h_sb.Append("fld_738_53,(case when fld_738_64!=0 then cast(fld_738_64 as nvarchar)+'年' else '' end),(case when fld_738_65!=0 then cast(fld_738_65 as nvarchar)+'月' else '' end),fld_738_66,fld_738_67,fld_738_68,fld_738_69,fld_738_70,fld_738_71,fld_738_72,(case when fld_738_16!=0 then cast(fld_738_16 as nvarchar)+'年' else '' end),(case when fld_738_17!=0 then cast(fld_738_17 as nvarchar)+'月' else '' end),fld_738_18,fld_738_19,fld_738_20,fld_738_21,fld_738_22,fld_738_23,fld_738_24,fld_738_25,(case when fld_738_35!=0 then cast(fld_738_35 as nvarchar)+'年' else '' end),(case when fld_738_36!=0 then cast(fld_738_36 as nvarchar)+'月' else '' end),fld_738_37,fld_738_38,fld_738_39,fld_738_40,fld_738_41,fld_738_42,fld_738_43,fld_738_44,(case when fld_738_54!=0 then cast(fld_738_54 as nvarchar)+'年' else '' end),(case when fld_738_55!=0 then cast(fld_738_55 as nvarchar)+'月' else '' end),fld_738_56,fld_738_57,fld_738_58,fld_738_59,fld_738_60,fld_738_61,fld_738_62,fld_738_63,(case when fld_738_73!=0 then cast(fld_738_73 as nvarchar)+'年' else '' end),(case when fld_738_74!=0 then cast(fld_738_74 as nvarchar)+'月' else '' end),fld_738_75,fld_738_76,fld_738_77,fld_738_78,fld_738_79,fld_738_80,fld_738_81,fld_738_82,fld_735_18,fld_735_2,fld_735_3,fld_735_4,fld_735_5,fld_735_6 ,fld_735_1 from gmis_mo_735 a  left outer join   gmis_mo_738 on fld_738_1=fld_735_1 where fld_735_1='"+orgcode+"'");
        view.SqlStr =h_sb.ToString();
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
        <td align="right" class="font_2635B_000">废水污染物监测表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：G203-1表</td>
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
      <td align="right" width="100" class="td_viewcontent_title">单位代码</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td width="216" align="right"  class="td_viewcontent_title">处理设施编号：</td>
      <td width="195" align="left"  class="td_viewcontent_content">SZ--* </td>
      <td width="200" align="right"  class="td_viewcontent_title">对应的排放口编号：</td>
      <td width="195" align="left"  class="td_viewcontent_content">FS--*</td>
      <td width="200" align="right"  class="td_viewcontent_title">排水去向类型</td>
      <td width="195" class="td_viewcontent_content">*</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%" rowspan="3"  align="center" class="td_viewcontent_title">数据来源</td>
      <td width="15%" rowspan="3"  align="center" class="td_viewcontent_title">1、监测时间（年月）</td>
      <td width="13%" rowspan="3"  align="center" class="td_viewcontent_title">2废水流量（立方米/时）</td>
      <td colspan="6"  align="center" class="td_viewcontent_title">污染物浓度（毫克/升）</td>
    </tr>
    <tr>
      <td colspan="2"  align="center" class="td_viewcontent_title">化学需氧量</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">氨氮</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">石油类</td>
    </tr>
    <tr>
      <td width="13%"  align="center" class="td_viewcontent_title">3、进口</td>
      <td width="9%"  align="center" class="td_viewcontent_title">4、排口</td>
      <td width="10%"  align="center" class="td_viewcontent_title">5、进口</td>
      <td width="10%"  align="center" class="td_viewcontent_title">6、排口</td>
      <td width="9%"  align="center" class="td_viewcontent_title">7、进口</td>
      <td width="10%"  align="center" class="td_viewcontent_title">8、排口</td>
    </tr>
    <tr>
      <td rowspan="4" align="center" class="td_viewcontent_content">*</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">污染物浓度(毫克/升)</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2"  align="center" class="td_viewcontent_title">1、监测时间（年月）</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">挥发酚</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">生化需氧量</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">氰化物</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">砷</td>
    </tr>
    <tr>
      <td  align="center" class="td_viewcontent_title">9、进口</td>
      <td  align="center" class="td_viewcontent_title">10、排口</td>
      <td  align="center" class="td_viewcontent_title">11、进口</td>
      <td  align="center" class="td_viewcontent_title">12、排口</td>
      <td  align="center" class="td_viewcontent_title">13、进口</td>
      <td  align="center" class="td_viewcontent_title">14、排口</td>
      <td  align="center" class="td_viewcontent_title">15、进口</td>
      <td  align="center" class="td_viewcontent_title">16、排口</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
      <td align="center" class="td_viewcontent_content">*&nbsp</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right" width="100" class="td_viewcontent_title" style="padding-right:5px; ">单位负责人</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">审核人 </td>
       <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right" width="100" class="td_viewcontent_title">填表日期 </td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="right"  class="td_viewcontent_title">填表日期 </td>
      <td width="210" align="left" class="td_viewcontent_content">200*年*月*日</td>
    </tr>
  </table>
  </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">注：①如表格不够填写,请自行复印。②数据来源：指获取监测数据的监测活动方式。按a、普查监测、b、监督监测、c、验收监测、d、委托监测、e、企业自测、f、在线监测，将代码填入表格内。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;③废水流量保留整数、污染物监测方法对应有效数字填报。<br>
      &nbsp;&nbsp;&nbsp;&nbsp;指标关系：进口浓度≥排口浓度</td>
    </tr></table>
</form>
</body>
</html>
