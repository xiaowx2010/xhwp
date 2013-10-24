<!--G105-->
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

    string str1 = "", str2 = "",str3="";
    str1 = ",''as goclass7,'' as orgdata17,fld_1284_22,fld_1284_28,fld_1284_34,fld_1284_40,fld_1284_46,fld_1284_52,fld_1284_58,fld_1284_64,fld_1284_70,fld_1284_76,''as goclass9,''as orgdata18,fld_1284_23,fld_1284_29,fld_1284_35,fld_1284_41,fld_1284_47,fld_1284_53,fld_1284_59,fld_1284_65,fld_1284_71,fld_1284_77,''as goclass10,'' as orgdata19,fld_1284_24,fld_1284_30,fld_1284_36,fld_1284_42,fld_1284_48,fld_1284_54,fld_1284_60,fld_1284_66,fld_1284_72,fld_1284_78,''as goclass11,''as orgdata20,fld_1284_25,fld_1284_31,fld_1284_37,fld_1284_43,fld_1284_49,fld_1284_55,fld_1284_61,fld_1284_67,fld_1284_73,fld_1284_79,''as goclass12,''as orgdata21,fld_1284_26,fld_1284_32,fld_1284_38,fld_1284_44,fld_1284_50,fld_1284_56,fld_1284_62,fld_1284_68,fld_1284_74,fld_1284_80,fld_1284_27,fld_1284_33,fld_1284_39,fld_1284_45,fld_1284_51,fld_1284_57,fld_1284_63,fld_1284_69,fld_1284_75,fld_1284_81";
    str2 = ",''as goclass13,fld_1284_82,fld_1284_88,fld_1284_94,fld_1284_100,fld_1284_106,fld_1284_112,fld_1284_118,fld_1284_124,fld_1284_130,fld_1284_136,fld_1284_142,fld_1284_148,fld_1284_154,fld_1284_160,''as goclass14,fld_1284_83,fld_1284_89,fld_1284_95,fld_1284_101,fld_1284_107,fld_1284_113,fld_1284_119,fld_1284_125,fld_1284_131,fld_1284_137,fld_1284_143,fld_1284_149,fld_1284_155,fld_1284_161,''as goclass15,fld_1284_84,fld_1284_90,fld_1284_96,fld_1284_102,fld_1284_108,fld_1284_114,fld_1284_120,fld_1284_126,fld_1284_132,fld_1284_138,fld_1284_144,fld_1284_150,fld_1284_156,fld_1284_162,''as goclass16,fld_1284_85,fld_1284_91,fld_1284_97,fld_1284_103,fld_1284_109,fld_1284_115,fld_1284_121,fld_1284_127,fld_1284_133,fld_1284_139,fld_1284_145,fld_1284_151,fld_1284_157,fld_1284_163,''as goclass8,fld_1284_86,fld_1284_92,fld_1284_98,fld_1284_104,fld_1284_110,fld_1284_116,fld_1284_122,fld_1284_128,fld_1284_134,fld_1284_140,fld_1284_146,fld_1284_152,fld_1284_158,fld_1284_164,fld_1284_87,fld_1284_93,fld_1284_99,fld_1284_105,fld_1284_111,fld_1284_117,fld_1284_123,fld_1284_129,fld_1284_135,fld_1284_141,fld_1284_147,fld_1284_153,fld_1284_159,fld_1284_165";
    str3=",fld_1284_3,fld_1284_5,fld_1284_6,''as createdate,fld_1284_166,fld_1284_4,fld_1284_2";

	view.SqlStr = "select (select fld_1280_2 from gmis_mo_1280 where fld_1280_1=fld_1284_1),(select fld_1280_4 from gmis_mo_1280 where fld_1280_1=fld_1284_1) "+str1+" "+str2+" "+str3+",fld_1284_7,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_7) as fld_1284_7_1,fld_1284_9,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_9) as fld_1284_9_1,fld_1284_10,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_10) as fld_1284_10_1,fld_1284_11,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_11) as fld_1284_11_1,fld_1284_12,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_12) as fld_1284_12_1, fld_1284_13,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_13) as fld_1284_13_1,fld_1284_14,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_14) as fld_1284_14_1,fld_1284_15,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_15) as fld_1284_15_1,fld_1284_16,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_16) as fld_1284_16_1, fld_1284_8,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_8) as fld_1284_8_1,fld_1284_17,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1284_17) as fld_1284_17_1,fld_1284_18,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1284_18) as fld_1284_18_1,fld_1284_19,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1284_19) as fld_1284_19_1,fld_1284_20,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1284_20) as fld_1284_20_1,fld_1284_21,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1284_21) as fld_1284_21_1 ,fld_1284_1 from gmis_mo_1284 where fld_1284_1='"+orgcode+"'";
    DataTable dt = view.DataTable;
    if (dt.Rows.Count > 0)
    {
       
        dt.Rows[0]["createdate"] = "201" + dt.Rows[0]["fld_" + mid + "_166"].ToString() + "年" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "月" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "日";
        for(int i=7;i<17;i++)
        {
            dt.Rows[0]["goclass"+i+""]=dt.Rows[0]["fld_1284_"+i+""].ToString()+"="+dt.Rows[0]["fld_1284_"+i+"_1"].ToString()=="="?"":dt.Rows[0]["fld_1284_"+i+""].ToString()+"="+dt.Rows[0]["fld_1284_"+i+"_1"].ToString();
        }
        for(int i=17;i<22;i++)
        {
            dt.Rows[0]["orgdata"+i+""]=dt.Rows[0]["fld_1284_"+i+""].ToString()+"="+dt.Rows[0]["fld_1284_"+i+"_1"].ToString()=="="?"":dt.Rows[0]["fld_1284_"+i+""].ToString()+"="+dt.Rows[0]["fld_1284_"+i+"_1"].ToString();
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
<!--内容-->

<!--动态生成结束-->
<table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
         <td style="width: 30%" rowspan="2">&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
                 废水污染物产生量、排放量普查表
            </td>
            <td style="width: 30%" rowspan="2">
             <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="top_font1220_000000">表　　号：G105表</td>
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
        <tr><td style="font-size:small; font-weight:normal; width:40%" align="center" >2009年</td></tr>
    </table>
   
<G:content ID="view" runat="server">
<G:Template id="tempview" runat="server">
	<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="right"  class="td_viewcontent_title_top">单位名称：</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	     <td align="right"  class="td_viewcontent_title_top">单位代码：</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
    </tr>  
</table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    
     <tr>
        <td align="center"  class="td_viewcontent_title" style="width:25%" rowspan="3" >1.排水去向类型</td>
        <td align="center"  class="td_viewcontent_title" style="width:15%" rowspan="3" >2.数据来源</td>
        <td align="center"  class="td_viewcontent_title"  style="width:60%" colspan="10">主要污染物（吨）</td>
        
    </tr>  
    <tr>
       <td align="center"  class="td_viewcontent_title" colspan="2" >化学需氧量</td>
        <td align="center"  class="td_viewcontent_title"  colspan="2" >氨气</td>
          <td align="center"  class="td_viewcontent_title" colspan="2" >石油类</td>
        <td align="center"  class="td_viewcontent_title"  colspan="2" >挥发酚</td>
          <td align="center"  class="td_viewcontent_title" colspan="2"  >生化需氧量</td>        
        </tr>
        <tr>
       <td align="center"  class="td_viewcontent_title"  >3.产生量</td>
        <td align="center"  class="td_viewcontent_title"   >4.排放量</td>
          <td align="center"  class="td_viewcontent_title"  >5.产生量</td>
        <td align="center"  class="td_viewcontent_title"   >6.排放量</td>
          <td align="center"  class="td_viewcontent_title"   >7.产生量</td>       
           <td align="center"  class="td_viewcontent_title"  >8.排放量</td>
        <td align="center"  class="td_viewcontent_title"   >9.产生量</td>
          <td align="center"  class="td_viewcontent_title"  >10.排放量</td>
        <td align="center"  class="td_viewcontent_title"   >11.产生量</td>
          <td align="center"  class="td_viewcontent_title"   >12.排放量</td>    
        </tr>
            <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>
               <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>
                  <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>
                  <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>
                  <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>
                  <tr>              
                    <td align="center" class="td_viewcontent_title" colspan="2">
                        总计
                    </td>
                   
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>              
</table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
   <tr>
        <td align="center"  class="td_viewcontent_title" colspan="15" style="width:100%" >主要污染物（千克）</td>             
   </tr>  
   <tr>
        <td align="center"  class="td_viewcontent_title" style="width:16%" rowspan="2"  >排水去向类型</td>     
         <td align="center"  class="td_viewcontent_title"  colspan="2" >氢化物</td>  
          <td align="center"  class="td_viewcontent_title" colspan="2"  >砷</td>  
           <td align="center"  class="td_viewcontent_title" colspan="2"  >总铬</td>  
            <td align="center"  class="td_viewcontent_title"  colspan="2" >六价铬</td>  
             <td align="center"  class="td_viewcontent_title" colspan="2" >铅</td>  
              <td align="center"  class="td_viewcontent_title"  colspan="2"  >镉</td>  
               <td align="center"  class="td_viewcontent_title"colspan="2" >汞</td>          
   </tr> 
    <tr>
        
         <td align="center"  class="td_viewcontent_title"  >13.产生量</td>  
          <td align="center"  class="td_viewcontent_title"   >14.排放量</td>
           <td align="center"  class="td_viewcontent_title" >15.产生量</td>  
           <td align="center"  class="td_viewcontent_title"   >16.排放量</td>
             <td align="center"  class="td_viewcontent_title" >17.产生量</td>  
             <td align="center"  class="td_viewcontent_title"   >18.排放量</td>
               <td align="center"  class="td_viewcontent_title">19.产生量</td> 
               <td align="center"  class="td_viewcontent_title"   >20.排放量</td>   
                <td align="center"  class="td_viewcontent_title">21.产生量</td>   
                <td align="center"  class="td_viewcontent_title"   >22.排放量</td>   
                 <td align="center"  class="td_viewcontent_title">23.产生量</td>  
                 <td align="center"  class="td_viewcontent_title"   >24.排放量</td> 
                  <td align="center"  class="td_viewcontent_title">25.产生量</td>      
                   <td align="center"  class="td_viewcontent_title"   >26.排放量</td>       
   </tr> 
       <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>  
           <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>  
                 <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>  
                 <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>  
                 <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>  
                    <tr>              
                    <td align="center" class="td_viewcontent_content" >
                        总计
                    </td>
                    
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
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
</G:content>
</form>
</body>
</html>