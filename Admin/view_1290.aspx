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


	view1.SqlStr="select  (select fld_1280_2 from gmis_mo_1280 where fld_1280_1=fld_1290_1),(select fld_1280_4 from gmis_mo_1280 where fld_1280_1=fld_1290_1) from gmis_mo_1290 where fld_1290_1='"+orgcode+"'";     
	view2.SqlStr="select fld_1290_18,fld_1290_2,fld_1290_3,fld_1290_4,fld_1290_5,fld_1290_6,fld_1290_1  from gmis_mo_1290 where fld_1290_1='"+orgcode+"'";     
	list1.SqlStr="select '' as orgdata, fld_1311_4, fld_1311_5, fld_1311_6, fld_1311_7, fld_1311_8, fld_1311_9, fld_1311_10,fld_1311_2,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1311_2) as fld_1311_2_1,fld_1290_1 from gmis_mo_1311  left outer join gmis_mo_1290 a  on fld_1311_1=fld_1290_1 where fld_1290_1='"+orgcode+"'";     
	list2.SqlStr="select ''as orgdata ,fld_1312_4,fld_1312_5,fld_1312_6,fld_1312_7,fld_1312_8,fld_1312_9,fld_1312_10,fld_1312_11,fld_1312_12,fld_1312_3,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1312_3) as fld_1312_3_1 from gmis_mo_1312  left outer join gmis_mo_1290 a on fld_1290_1=fld_1312_1 where fld_1290_1='"+orgcode+"'";
	DataTable dt=list1.DataTable;
	if(dt.Rows.Count>0)
	{
	  dt.Rows[0]["orgdata"]=dt.Rows[0]["fld_1311_2"].ToString() + "=" + dt.Rows[0]["fld_1311_2_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_1311_2"].ToString() + "=" + dt.Rows[0]["fld_1311_2_1"].ToString();
	}
	 DataTable dt2=list2.DataTable;
	if(dt2.Rows.Count>0)
	{
			dt2.Rows[0]["orgdata"]=dt2.Rows[0]["fld_1312_3"].ToString() + "=" + dt2.Rows[0]["fld_1312_3_1"].ToString() == "=" ? "" : dt2.Rows[0]["fld_1312_3"].ToString() + "=" + dt2.Rows[0]["fld_1312_3_1"].ToString();
	}
	list1.Rows=list1.DataTable.Rows.Count;
	list2.Rows=list2.DataTable.Rows.Count;


	iframe_1280.Attributes["src"]="iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
        

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
        <td align="right" class="font_2635B_000">废气污染物产生量、排放量普查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2009年</td>
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
</G:template>
</G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">一、燃烧过程</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="3"  align="center" class="td_viewcontent_title">1、数据来源</td>
      <td rowspan="3"  align="center" class="td_viewcontent_title">2、废气排放量（万立方米）</td>
      <td colspan="6"  align="center" class="td_viewcontent_title">主要污染物（吨）</td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_title">烟尘</td>
      <td colspan="2" align="center" class="td_viewcontent_title">二氧化硫</td>
      <td colspan="2" align="center" class="td_viewcontent_title">氮氧化物</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">3、产生量</td>
      <td align="center" class="td_viewcontent_title">4、排放量</td>
      <td align="center" class="td_viewcontent_title">5、产生量</td>
      <td align="center" class="td_viewcontent_title">6、排放量</td>
      <td align="center" class="td_viewcontent_title">7、产生量</td>
      <td align="center" class="td_viewcontent_title">8、排放量</td>
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
    </tr>
    
    </G:template>
    </G:listbox>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">二、工艺过程</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="3"  align="center" class="td_viewcontent_title">1、数据来源</td>
      <td rowspan="3"  align="center" class="td_viewcontent_title">2、废气排放量（万立方米）</td>
      <td colspan="8"  align="center" class="td_viewcontent_title">主要污染物（除<span class="font1225B_ffffff">氟化物为千克</span>外，其余均为吨）</td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_title">工业粉尘</td>
      <td colspan="2" align="center" class="td_viewcontent_title">二氧化硫</td>
      <td colspan="2" align="center" class="td_viewcontent_title">氮氧化物</td>
      <td colspan="2" align="center" class="td_viewcontent_title">氟化物</td>
    </tr>
      <tr>
      <td align="center" class="td_viewcontent_title">3、产生量</td>
      <td align="center" class="td_viewcontent_title">4、排放量</td>
      <td align="center" class="td_viewcontent_title">5、产生量</td>
      <td align="center" class="td_viewcontent_title">6、排放量</td>
      <td align="center" class="td_viewcontent_title">7、产生量</td>
      <td align="center" class="td_viewcontent_title">8、排放量</td>
      <td align="center" class="td_viewcontent_title">9、产生量</td>
      <td align="center" class="td_viewcontent_title">10、排放量</td>
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
    </tr>
    </G:template>
    </G:listbox>
  </table>
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
      <td align="left" class="font1220_000000">注：①数据来源：1产排污系数、2实际监测、3物料衡算，将代码填入表格内。②氟化物的产生、排放量保留一位小数；其他指标保留两位小数。      </td>
    </tr></table>

  
</form> 
</body>
</html>
