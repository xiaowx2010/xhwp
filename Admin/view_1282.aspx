<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string hycode;
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();//设置工具条,同时获取固定URL参数
    hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");
    string str1 = "",str2="",str3="";
    str1 = ",fld_1282_26,fld_1282_16,fld_1282_21,fld_1282_27,fld_1282_17,fld_1282_22,fld_1282_28,fld_1282_18,fld_1282_23,fld_1282_29,fld_1282_19,fld_1282_24,fld_1282_30,fld_1282_20,fld_1282_25,fld_1282_31";
    str2 = ",fld_1282_37,''classcode32,fld_1282_38,fld_1282_43,fld_1282_48,''as classcode33,fld_1282_39,fld_1282_44,fld_1282_49,''as classcode34,fld_1282_40,fld_1282_45,fld_1282_50,''as classcode35,fld_1282_41,fld_1282_46,fld_1282_51,''as classcode36,fld_1282_42,fld_1282_47,fld_1282_52,fld_1282_53";
    str3 = ",fld_1282_3,fld_1282_5,fld_1282_6,''as createdate,fld_1282_54,fld_1282_4,fld_1282_2";

	view.SqlStr = "select (select fld_1280_2 from gmis_mo_1280 where fld_1280_1=fld_1282_1),(select fld_1280_4 from gmis_mo_1280 where fld_1280_1=fld_1282_1),fld_1282_7,fld_1282_8,fld_1282_9,fld_1282_10,fld_1282_11,fld_1282_12,fld_1282_13,fld_1282_14,fld_1282_15 " + str1 + " " + str2 + " " + str3 + ",fld_1282_32,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1282_32) as fld_1282_32_1,fld_1282_33,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1282_33) as fld_1282_33_1,fld_1282_34,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1282_34) as fld_1282_34_1,fld_1282_35,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1282_35) as fld_1282_35_1,fld_1282_36,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1282_36) as fld_1282_36_1,fld_1282_1 from gmis_mo_1282 where fld_1282_1='"+orgcode+"'" ;
    DataTable dt = view.DataTable;
    if (dt.Rows.Count > 0)
    {         
        dt.Rows[0]["createdate"] = "201" + dt.Rows[0]["fld_" + mid + "_54"].ToString() + "年" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "月" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "日";
        for (int i = 32; i < 37; i++)
        {
            dt.Rows[0]["classcode" + i + ""] = dt.Rows[0]["fld_1282_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_1282_" + i + "_1"].ToString()=="="?"":dt.Rows[0]["fld_1282_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_1282_" + i + "_1"].ToString();
        }
    }

	iframe_1280.Attributes["src"]="iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;


}
    
</script>
<body style="padding:10px;text-align:center">
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
<!--操作工具条-->
<!--内容-->
<!--动态生成结束-->
<table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
         <td style="width: 25%" rowspan="2">&nbsp;</td>
            <td style="width: 45%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
              工业用水、排水情况普查表
            </td>
            <td style="width: 30%" rowspan="2">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="top_font1220_000000">表　　号：G103表</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">制表机关：环境保护部</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">批准机关：国家统计局</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">批准文号：国统制[2009]113号</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">有效期至：2011年12月</td>
      </tr>
    </table>
            </td>
        </tr>
        <tr><td style="font-size:small; font-weight:normal; width:45%" align="center" >2009年</td></tr>
    </table>
<G:Content ID="view" runat="server">
<G:Template id="tempview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">

    <tr>
        <td align="right"  class="td_viewcontent_title_top">1.单位名称：</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	     <td align="right"  class="td_viewcontent_title_top">2.单位代码：</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
    </tr>    
    
</table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">

    <tr>
        <td align="center"  class="td_viewcontent_title_top" colspan="4">一、用水情况</td>	    
    </tr>  
    <tr>
        <td align="center"  class="td_viewcontent_title" style="width:10%">序号</td>
        <td align="center"  class="td_viewcontent_title" style="width:40%">指标名称</td>
        <td align="center"  class="td_viewcontent_title" style="width:10%">计量单位</td>
        <td align="center"  class="td_viewcontent_title" style="width:40%">年实际</td>	    
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">1</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">用水总量</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">吨</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>	    
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">2</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">其中：1.取水总量</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">吨</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>	    
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">3</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">(1)城市自来水</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">吨</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>	    
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">4</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">(2)自备水</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">吨</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>	    
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">5</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">其中：①地表水</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">吨</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>	    
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">6</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">②地下水</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">吨</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>	    
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">7</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">③其他</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">吨</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>	    
    </tr> 
    <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">8</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">其中：利用周边工业企业用水</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">吨</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>	    
    </tr>   
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">9</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">其中：2.重复用水量</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">吨</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>	    
    </tr>  
    
</table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">

    <tr>
        <td align="center"  class="td_viewcontent_title_top" colspan="3">二、废水产生情况</td>	    
    </tr> 
     <tr>
        <td align="center"  class="td_viewcontent_title" style="width:50%">废水类型名称</td>
        <td align="center"  class="td_viewcontent_title" style="width:25%">废水类型代码</td>
        <td align="center"  class="td_viewcontent_title" style="width:25%">废水产生量（吨）</td>  
    </tr>    
     <tr>
        <td align="center"  class="td_viewcontent_content" >——</td>
        <td align="center"  class="td_viewcontent_content" >——</td>
        <td align="center"  class="td_viewcontent_content" >总计：*</td>  
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
    </tr>  
    <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
    </tr>  
    <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
    </tr>  
    <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
    </tr>  
    <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
    </tr>  
    
</table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">

    <tr>
        <td align="center"  class="td_viewcontent_title_top" colspan="4">三、废水排放情况</td>	    
    </tr>  
      <tr>
        <td align="center"  class="td_viewcontent_title" style="width:25%">1.排水去向类型代码</td>
        <td align="center"  class="td_viewcontent_title" style="width:25%">2.废水排放量（吨）</td>
        <td align="center"  class="td_viewcontent_title" style="width:25%">3.受纳水体名称</td>
        <td align="center"  class="td_viewcontent_title" style="width:25%">4.受纳水体代码</td>	    
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_content" >——</td>
        <td align="center"  class="td_viewcontent_content" >总计：*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >——</td>  
         <td align="center"  class="td_viewcontent_content" >——</td>  
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
    </tr>  
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
    </tr>  
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
    </tr>  
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
    </tr>  
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>  
    </tr>  
    <tr>
        <td align="right"  class="td_viewcontent_title" >5.受委托处理单位名称</td>
        <td align="center"  class="td_viewcontent_content" colspan="3" >*&nbsp;</td> 
    </tr>
    
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        单位负责人：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        审核人：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                </tr>
                 <tr>
                    <td align="right" class="td_viewcontent_title">
                        填表人：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        填表日期：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
            </table>
</G:Template> 
</G:Content>
</form>
</body>
</html>