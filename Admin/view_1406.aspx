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


	view1.SqlStr="select  (select fld_1396_2 from gmis_mo_1396 where fld_1396_1=fld_"+mid+"_57) as c_name,(select fld_1396_4 from gmis_mo_1396 where fld_1396_1=fld_"+mid+"_57),fld_1406_62,fld_1406_21,fld_1406_22,fld_1406_58,fld_1406_59,fld_1406_3,fld_1406_4,fld_1406_1,fld_1406_2,fld_1406_60,fld_1406_61,fld_1406_5,fld_1406_6,fld_1406_7,fld_1406_8,fld_1406_9,fld_1406_10,fld_1406_11,fld_1406_12,fld_1406_13,fld_1406_14,fld_1406_15,fld_1406_16,fld_1406_17,fld_1406_18,fld_1406_19,fld_1406_20 from gmis_mo_1406 where fld_1406_57='"+orgcode+"'";
	view2.SqlStr="select fld_1406_24,fld_1406_26,fld_1406_27,fld_1406_28,fld_1406_25,fld_1406_23  from gmis_mo_1406 where fld_1406_57='"+orgcode+"'";
//    Response.Write(view1.SqlStr);

	iframe_1280.Attributes["src"]="iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;


}

</script>
<body>

<form id="form1" runat="server">
    <!--选项卡-->
        <table width="100%">
            <tr>
                <td>
      <iframe id="iframe_1280"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
        <td align="right" class="font_2635B_000">废气污染物产生量、排放量调查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2010年</td>
      </tr>
    </table></td>
    <td><table>
                    <tr>
                        <td>
                            表    号：Gl09表
                        </td>
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
                            批准文号：国统制[2009]113号
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
<G:content id="view1" runat="server">
<G:template id="templateview1" runat="server">
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
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2"  align="center" class="td_viewcontent_title">指标名称</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">1、废气排放量（万立方米）</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">烟尘（吨）</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">工业粉尘（吨）</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">二氧化硫（吨）</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">氮氧化物（吨）</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">氟化物（吨）</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">2、产生量</td>
      <td align="center" class="td_viewcontent_title">3、排放量</td>
      <td align="center" class="td_viewcontent_title">4、产生量</td>
      <td align="center" class="td_viewcontent_title">5、排放量</td>
      <td align="center" class="td_viewcontent_title">6、产生量</td>
      <td align="center" class="td_viewcontent_title">7、排放量</td>
      <td align="center" class="td_viewcontent_title">8、产生量</td>
      <td align="center" class="td_viewcontent_title">9、排放量</td>
      <td align="center" class="td_viewcontent_title">10、产生量</td>
      <td align="center" class="td_viewcontent_title">11、排放量</td>
    </tr>
 <tr>
      <td align="center" class="td_viewcontent_title">总计</td>
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
    <tr>
      <td align="center" class="td_viewcontent_title">其中：燃烧过程</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">工艺过程</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
</G:template>
</G:content>
  <G:content id="view2" runat="server">
  <G:template id="templateview2" runat="server">
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
      <td width="210" align="left" class="td_viewcontent_content">201*年*月*日&nbsp;</td>
    </tr>

  </table>
  </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000"><p>注：①数据来源：1产排污系数、2实际监测、3物料衡算，将代码填入表格内。②氟化物的产生、排放量保留一位小数；其他指标保留两位小数。</p>
          <p>②氟化物的产生、排放量保留一位小数，其他指标保留两位小数。指标间关系：产生量≥排放量。</p>
          <p>③一种污染物的产生量或排放量仅可填报一种数据来源。</p>
          </td>
    </tr></table>


</form>
</body>
</html>
