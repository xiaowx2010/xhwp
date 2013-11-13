<!--J501_2 污水处理厂污水监测表_主表-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<body>
<script language="c#" runat="server">
string hycode = "";//行业
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();
    hycode = GetQueryString("hycode", "");
    string    orgcode = GetQueryString("orgcode", "0");
    string str1=",fld_1456_3,''as watchdate1,'' as orgdata1";
    for(int i=7;i<132;i++)
    {
        str1+=",fld_1456_"+i+"";
        if(i==17)
        {
            str1+=",''as watchdate2,'' as orgdata2";
            i=38;
        }
          if(i==49)
        {
            str1+=",''as watchdate3,'' as orgdata3";
            i=70;
        }
         if(i==81)
        {
            str1+=",''as watchdate4,'' as orgdata4";
            i=102;
        }
         if(i==113)
        {
           i=17;
        }
         if(i==35)
        {
           i=49;
        }
         if(i==67)
        {
           i=81;
        }
          if(i==99)
        {
           i=113;
        }
    }
   view.SqlStr="select (select fld_1453_2 from gmis_mo_1453 where fld_1453_1=fld_1455_1),(select fld_1453_4 from gmis_mo_1453 where fld_1453_1=fld_1455_1) "+str1+",fld_1455_19,fld_1455_2,fld_1455_3,fld_1455_4,fld_1455_5,fld_1455_6,fld_1456_4,fld_1456_5,fld_1456_36,fld_1456_37,fld_1456_68,fld_1456_69,fld_1456_100,fld_1456_101,fld_1456_6,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_1456_6) as fld_1456_6_1,fld_1456_38,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_1456_38) as fld_1456_38_1,fld_1456_70,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_1456_70) as fld_1456_70_1,fld_1456_102,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_1456_102) as fld_1456_102_1,fld_1455_1 from gmis_mo_1455 a left outer join gmis_mo_1456 b on a.fld_1455_1=b.fld_1456_1 where fld_1455_1='"+orgcode+"'";
   DataTable dt=view.DataTable;
   if (dt.Rows.Count > 0)
   {
       dt.Rows[0]["watchdate1"] = dt.Rows[0]["fld_1456_4"].ToString() + "年" + dt.Rows[0]["fld_1456_5"].ToString() + "月" == "0年0月" ? "" : dt.Rows[0]["fld_1456_4"].ToString() + "年" + dt.Rows[0]["fld_1456_5"].ToString() + "月";
       dt.Rows[0]["watchdate2"] = dt.Rows[0]["fld_1456_36"].ToString() + "年" + dt.Rows[0]["fld_1456_37"].ToString() + "月" == "0年0月" ? "" : dt.Rows[0]["fld_1456_36"].ToString() + "年" + dt.Rows[0]["fld_1456_37"].ToString() + "月";
       dt.Rows[0]["watchdate3"] = dt.Rows[0]["fld_1456_68"].ToString() + "年" + dt.Rows[0]["fld_1456_69"].ToString() + "月" == "0年0月" ? "" : dt.Rows[0]["fld_1456_68"].ToString() + "年" + dt.Rows[0]["fld_1456_69"].ToString() + "月";
       dt.Rows[0]["watchdate4"] = dt.Rows[0]["fld_1456_100"].ToString() + "年" + dt.Rows[0]["fld_1456_101"].ToString() + "月" == "0年0月" ? "" : dt.Rows[0]["fld_1456_100"].ToString() + "年" + dt.Rows[0]["fld_1456_101"].ToString() + "月";
       dt.Rows[0]["orgdata1"] = dt.Rows[0]["fld_1456_6"].ToString() + "=" + dt.Rows[0]["fld_1456_6_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_1456_6"].ToString() + "=" + dt.Rows[0]["fld_1456_6_1"].ToString();
       dt.Rows[0]["orgdata2"] = dt.Rows[0]["fld_1456_38"].ToString() + "=" + dt.Rows[0]["fld_1456_38_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_1456_38"].ToString() + "=" + dt.Rows[0]["fld_1456_38_1"].ToString();
       dt.Rows[0]["orgdata3"] = dt.Rows[0]["fld_1456_70"].ToString() + "=" + dt.Rows[0]["fld_1456_70_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_1456_70"].ToString() + "=" + dt.Rows[0]["fld_1456_70_1"].ToString();
       dt.Rows[0]["orgdata4"] = dt.Rows[0]["fld_1456_102"].ToString() + "=" + dt.Rows[0]["fld_1456_102_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_1456_102"].ToString() + "=" + dt.Rows[0]["fld_1456_102_1"].ToString();
   }
   iframe_658.Attributes["src"] = "iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
}

</script>

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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">污水处理厂污水监测表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2010年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：J501-2表　</td>
      </tr>
     <tr>
                        <td>
                            制表机关：环境保护部
                        </td>
                    </tr>
                    <tr>
                        <td>
                            批准机关：国家统计局
                        </td>
                    </tr>
                    <tr>
                        <td>
                            文 &nbsp;&nbsp;&nbsp;号：国统制[2009]113号
                        </td>
                    </tr>
                    <tr>
                        <td>
                            有效期至：2011年12月
                        </td>
                    </tr>
    </table></td>
  </tr>
</table>
<!--操作工具条-->
<G:content id="view" runat="server">
<G:template id="template1" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">单位名称（公章）</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">单位代码</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="font1225_000000">如果污染物监测数据为未检出，数据录入时在检出限前加负号（－），如表格中填写＜0.003或0.003l,则录入-0.003</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="100" rowspan="3" align="center" class="td_viewcontent_title">1、排放口编号&nbsp;</td>
      <td width="100" rowspan="3" align="center" class="td_viewcontent_title">2、监测时间（年月）</td>
      <td width="100" rowspan="3" align="center" class="td_viewcontent_title">3、数据来源</td>
      <td width="100" rowspan="3" align="center" class="td_viewcontent_title">4、污水排放量（立方米/时）</td>
      <td colspan="10" align="center" class="td_viewcontent_title">主要污染物浓度（单位：毫克/升，汞为<span class="font1225B_ffffff">微克/升</span>）</td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_title">化学需氧量</td>
      <td colspan="2" align="center" class="td_viewcontent_title">氨氮</td>
      <td colspan="2" align="center" class="td_viewcontent_title">石油类</td>
      <td colspan="2" align="center" class="td_viewcontent_title">总氮</td>
      <td colspan="2" align="center" class="td_viewcontent_title">总磷</td>
    </tr>
    <tr>
      <td width="100" align="center" class="td_viewcontent_title">5、进口</td>
      <td width="100" align="center" class="td_viewcontent_title">6、排口</td>
      <td width="100" align="center" class="td_viewcontent_title">7、进口</td>
      <td width="100" align="center" class="td_viewcontent_title">8、排口</td>
      <td width="100" align="center" class="td_viewcontent_title">9、进口</td>
      <td width="100" align="center" class="td_viewcontent_title">10、排口</td>
      <td width="100" align="center" class="td_viewcontent_title">11、进口</td>
      <td width="100" align="center" class="td_viewcontent_title">12、排口</td>
      <td width="100" align="center" class="td_viewcontent_title">13、进口</td>
      <td width="100" align="center" class="td_viewcontent_title">14、排口</td>
    </tr>
    <tr>
      <td rowspan="4" align="center" class="td_viewcontent_content" >FS－－青浦－WS*</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">主要污染物浓度（单位：毫克/升，汞为<span class="font1225B_ffffff">微克/升</span>）</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_title">生化需氧量</td>
      <td colspan="2" align="center" class="td_viewcontent_title">挥发酚</td>
      <td colspan="2" align="center" class="td_viewcontent_title">氰化物</td>
      <td colspan="2" align="center" class="td_viewcontent_title">砷</td>
      <td colspan="2" align="center" class="td_viewcontent_title">总铬</td>
      <td colspan="2" align="center" class="td_viewcontent_title">六价铬</td>
      <td colspan="2" align="center" class="td_viewcontent_title">铅</td>
      <td colspan="2" align="center" class="td_viewcontent_title">镉　</td>
      <td colspan="2" align="center" class="td_viewcontent_title">汞</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">15、进口</td>
      <td align="center" class="td_viewcontent_title">16、排口</td>
      <td align="center" class="td_viewcontent_title">17、进口</td>
      <td align="center" class="td_viewcontent_title">18、排口</td>
      <td align="center" class="td_viewcontent_title">19、进口</td>
      <td align="center" class="td_viewcontent_title">20、排口</td>
      <td align="center" class="td_viewcontent_title">21、进口</td>
      <td align="center" class="td_viewcontent_title">22、排口</td>
      <td align="center" class="td_viewcontent_title">23、进口</td>
      <td align="center" class="td_viewcontent_title">24、排口</td>
      <td align="center" class="td_viewcontent_title">25、进口</td>
      <td align="center" class="td_viewcontent_title">26、排口</td>
      <td align="center" class="td_viewcontent_title">27、进口</td>
      <td align="center" class="td_viewcontent_title">28、排口</td>
      <td align="center" class="td_viewcontent_title">29、进口</td>
      <td align="center" class="td_viewcontent_title">30、排口</td>
      <td align="center" class="td_viewcontent_title">31、进口</td>
      <td align="center" class="td_viewcontent_title">32、排口</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  class="td_viewcontent_title" style="padding-right:5px; ">单位负责人</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="122" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">审核人 </td>
      <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right"  class="td_viewcontent_title">填表人 </td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="122" align="right"  class="td_viewcontent_title">填表日期 </td>
      <td width="210" align="left" class="td_viewcontent_content">201*年*月*日</td>
    </tr>

  </table>
  </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">注：①污水排放量允许保留整数，污染物浓度按监测方法对应的有效数字填报。<br>
        　
        &nbsp;②按排放口填报，有多个排放口的分别填报，请自行复印。<br>　
        &nbsp;③数据来源：指获取监测数据的监测活动方式。按a、普查监测、b、监督监测、c、验收监测、d、委托监测、e、企业自测、f、在线监测，将代码填入表格内。</td>
    </tr>
    </table>


 </form>
</body>
</html>
