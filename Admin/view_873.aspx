<!--J503_3 危险废物处置厂焚烧废气监测表_主表-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<body>
<script language="C#" runat="server">
string hycode = "";//行业
private void Page_Load(object sender,System.EventArgs e)
{
     SetToolBar();//设置工具条,同时获取固定URL参数
     hycode = GetQueryString("hycode", "");
     string str1="",orgcode="";
     orgcode = GetQueryString("orgcode", "0");
     for(int i=7;i<32;i++)
     {
     str1+=",fld_876_"+i+"";
     if(i==17)
     {
     str1+=",''as watchdate2,''as orgdata2";
      i=20;
      }
     }
     list.SqlStr="select fld_876_3,''as watchdate1,''as orgdata1 "+str1+",fld_876_4, fld_876_5,fld_876_18,fld_876_19,fld_876_6,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_876_6) as fld_876_6_1,fld_876_20,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_876_20) as fld_876_20_1,fld_873_1 from gmis_mo_876 b left outer join gmis_mo_873 a on a.fld_873_1=b.fld_876_1 where fld_873_1='"+orgcode+"'";
    DataTable dt=list.DataTable;
    if(dt.Rows.Count>0)
        {            
            dt.Rows[0]["watchdate1"]=dt.Rows[0]["fld_876_4"].ToString()+"年"+dt.Rows[0]["fld_876_5"].ToString()+"月"=="0年0月"?"":dt.Rows[0]["fld_876_4"].ToString()+"年"+dt.Rows[0]["fld_876_5"].ToString()+"月";
            dt.Rows[0]["watchdate2"]=dt.Rows[0]["fld_876_18"].ToString()+"年"+dt.Rows[0]["fld_876_19"].ToString()+"月"=="0年0月"?"":dt.Rows[0]["fld_876_18"].ToString()+"年"+dt.Rows[0]["fld_876_19"].ToString()+"月";
           dt.Rows[0]["orgdata1"] = dt.Rows[0]["fld_876_6"].ToString() + "=" + dt.Rows[0]["fld_876_6_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_876_6"].ToString() + "=" + dt.Rows[0]["fld_876_6_1"].ToString();
           dt.Rows[0]["orgdata2"] = dt.Rows[0]["fld_876_20"].ToString() + "=" + dt.Rows[0]["fld_876_20_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_876_20"].ToString() + "=" + dt.Rows[0]["fld_876_20_1"].ToString();
        }
    list.Rows=list.DataTable.Rows.Count;
    view1.SqlStr="select (select fld_866_2 from gmis_mo_866 where fld_866_1=fld_873_1),(select fld_866_4 from gmis_mo_866 where fld_866_1=fld_873_1) from gmis_mo_873 where fld_873_1='"+orgcode+"'";
    view2.SqlStr = "select fld_873_18 ,fld_873_2,fld_873_3,fld_873_4,fld_873_5,fld_873_6,fld_873_1 from gmis_mo_873 where  fld_873_1='" + orgcode + "'";
    iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
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
        <td align="right" class="font_2635B_000">危险废物处置厂焚烧废气监测表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：J503-3表　</td>
      </tr>
      <tr>
        <td class="font1220_000000">制表机关：国务院第一次全国污染普<br>
          　　　　　查领导小组办公室</td>
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
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="font1225_000000">如果污染物监测数据为未检出，数据录入时在检出限前加负号（－），如表格中填写＜0.003或0.003l,则录入-0.003</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="100" rowspan="4" align="center" class="td_viewcontent_title">1、焚烧废气处理设施编号　</td>
      <td width="100" rowspan="4" align="center" class="td_viewcontent_title">2、监测时间（年月）</td>
      <td width="100" rowspan="4" align="center" class="td_viewcontent_title">3、数据来源</td>
      <td colspan="2" rowspan="2" align="center" class="td_viewcontent_title">废气流量（立方米/时）</td>
      <td colspan="9" align="center" class="td_viewcontent_title">主要污染物浓度（毫克/立方米）</td>
    </tr>
    <tr>
      <td colspan="3" align="center" class="td_viewcontent_title" >烟尘</td>
      <td colspan="3" align="center" class="td_viewcontent_title" >二氧化硫</td>
      <td colspan="3" align="center" class="td_viewcontent_title" >氮氧化物</td>
    </tr>
    <tr>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title" >4、处理设施前</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title" >5、设施处理后</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title" >6、进口</td>
      <td colspan="2" align="center" class="td_viewcontent_title" >排口</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title" >9、进口</td>
      <td colspan="2" align="center" class="td_viewcontent_title" >排口</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title" >12、进口</td>
      <td colspan="2" align="center" class="td_viewcontent_title" >排口</td>
    </tr>
    <tr>
      <td width="100" align="center" class="td_viewcontent_title" >7、实测</td>
      <td width="100" align="center" class="td_viewcontent_title" >8、折算</td>
      <td width="100" align="center" class="td_viewcontent_title" ><p>10、实测</p>
      </td>
      <td width="100" align="center" class="td_viewcontent_title" >11、折算</td>
      <td width="100" align="center" class="td_viewcontent_title" >13、实测</td>
      <td width="100" align="center" class="td_viewcontent_title" >14、折算</td>
    </tr>
<G:listbox id="list" runat="server">
<G:template id="template1" runat="server">
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_content" >QZ--*</td>
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
      <td width="210" align="left" class="td_viewcontent_content">200*年*月*日</td>
    </tr>

  </table>
  </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">注：①废气流量保留整数，污染物浓度按监测方法对应的有效数字填报。<br>
        　
        &nbsp;②如表格不够填写，请自行复印。<br>　
        &nbsp;③数据来源：指获取监测数据的监测活动方式。按a、普查监测、b、监督监测、c、验收监测、d、委托监测、e、企业自测、f、在线监测，将代码填入表格内。</td>
    </tr>
    </table>

 </form> 
 
</body>
</html>
