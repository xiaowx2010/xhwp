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
    str1 = ",''as goclass7,'' as orgdata17,fld_1400_22,fld_1400_28,fld_1400_34,fld_1400_40,fld_1400_46,fld_1400_52,fld_1400_58,fld_1400_64,''as goclass9,''as orgdata18,fld_1400_23,fld_1400_29,fld_1400_35,fld_1400_41,fld_1400_47,fld_1400_53,fld_1400_59,fld_1400_65,''as goclass10,'' as orgdata19,fld_1400_24,fld_1400_30,fld_1400_36,fld_1400_42,fld_1400_48,fld_1400_54,fld_1400_60,fld_1400_66,''as goclass11,''as orgdata20,fld_1400_25,fld_1400_31,fld_1400_37,fld_1400_43,fld_1400_49,fld_1400_55,fld_1400_61,fld_1400_67,''as goclass12,''as orgdata21,fld_1400_26,fld_1400_32,fld_1400_38,fld_1400_44,fld_1400_50,fld_1400_56,fld_1400_62,fld_1400_68,fld_1400_27,fld_1400_33,fld_1400_39,fld_1400_45,fld_1400_51,fld_1400_57,fld_1400_63,fld_1400_69";
    str2 = ",''as goclass13,fld_1400_82,fld_1400_88,fld_1400_94,fld_1400_100,fld_1400_106,fld_1400_112,fld_1400_118,fld_1400_124,fld_1400_130,fld_1400_136,fld_1400_142,fld_1400_148,fld_1400_154,fld_1400_160,''as goclass14,fld_1400_83,fld_1400_89,fld_1400_95,fld_1400_101,fld_1400_107,fld_1400_113,fld_1400_119,fld_1400_125,fld_1400_131,fld_1400_137,fld_1400_143,fld_1400_149,fld_1400_155,fld_1400_161,''as goclass15,fld_1400_84,fld_1400_90,fld_1400_96,fld_1400_102,fld_1400_108,fld_1400_114,fld_1400_120,fld_1400_126,fld_1400_132,fld_1400_138,fld_1400_144,fld_1400_150,fld_1400_156,fld_1400_162,''as goclass16,fld_1400_85,fld_1400_91,fld_1400_97,fld_1400_103,fld_1400_109,fld_1400_115,fld_1400_121,fld_1400_127,fld_1400_133,fld_1400_139,fld_1400_145,fld_1400_151,fld_1400_157,fld_1400_163,''as goclass8,fld_1400_86,fld_1400_92,fld_1400_98,fld_1400_104,fld_1400_110,fld_1400_116,fld_1400_122,fld_1400_128,fld_1400_134,fld_1400_140,fld_1400_146,fld_1400_152,fld_1400_158,fld_1400_164,fld_1400_87,fld_1400_93,fld_1400_99,fld_1400_105,fld_1400_111,fld_1400_117,fld_1400_123,fld_1400_129,fld_1400_135,fld_1400_141,fld_1400_147,fld_1400_153,fld_1400_159,fld_1400_165";
    str3=",fld_1400_3,fld_1400_5,fld_1400_6,''as createdate,fld_1400_166,fld_1400_4,fld_1400_2";

	view.SqlStr = "select (select fld_1396_2 from gmis_mo_1396 where fld_1396_1=fld_1400_1),(select fld_1396_4 from gmis_mo_1396 where fld_1396_1=fld_1400_1) "+str1+" "+str2+" "+str3+",fld_1400_7,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1400_7) as fld_1400_7_1,fld_1400_9,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1400_9) as fld_1400_9_1,fld_1400_10,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1400_10) as fld_1400_10_1,fld_1400_11,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1400_11) as fld_1400_11_1,fld_1400_12,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1400_12) as fld_1400_12_1, fld_1400_13,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1400_13) as fld_1400_13_1,fld_1400_14,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1400_14) as fld_1400_14_1,fld_1400_15,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1400_15) as fld_1400_15_1,fld_1400_16,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1400_16) as fld_1400_16_1, fld_1400_8,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1400_8) as fld_1400_8_1,fld_1400_17,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1400_17) as fld_1400_17_1,fld_1400_18,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1400_18) as fld_1400_18_1,fld_1400_19,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1400_19) as fld_1400_19_1,fld_1400_20,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1400_20) as fld_1400_20_1,fld_1400_21,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_1400_21) as fld_1400_21_1 ,fld_1400_1 from gmis_mo_1400 where fld_1400_1='"+orgcode+"'";
//	Response.Write(view.SqlStr);
    DataTable dt = view.DataTable;
    if (dt.Rows.Count > 0)
    {

        dt.Rows[0]["createdate"] = "201" + dt.Rows[0]["fld_" + mid + "_166"].ToString() + "年" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "月" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "日";
        for(int i=7;i<17;i++)
        {
            dt.Rows[0]["goclass"+i+""]=dt.Rows[0]["fld_1400_"+i+""].ToString()+"="+dt.Rows[0]["fld_1400_"+i+"_1"].ToString()=="="?"":dt.Rows[0]["fld_1400_"+i+""].ToString()+"="+dt.Rows[0]["fld_1400_"+i+"_1"].ToString();
        }
        for(int i=17;i<22;i++)
        {
            dt.Rows[0]["orgdata"+i+""]=dt.Rows[0]["fld_1400_"+i+""].ToString()+"="+dt.Rows[0]["fld_1400_"+i+"_1"].ToString()=="="?"":dt.Rows[0]["fld_1400_"+i+""].ToString()+"="+dt.Rows[0]["fld_1400_"+i+"_1"].ToString();
        }
    }

	iframe_1396.Attributes["src"]="iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;


}


</script>

<body style="padding:10px;text-align:center">
<form id="form1" runat="server">

<!--选项卡-->
        <table width="100%">
            <tr>
                <td>
<iframe id="iframe_1396"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
        <tr><td style="font-size:small; font-weight:normal; width:40%" align="center" >2010年</td></tr>
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
        <td align="center"  class="td_viewcontent_title"  colspan="2" >氨氮</td>
          <td align="center"  class="td_viewcontent_title" colspan="2" >石油类</td>
        <td align="center"  class="td_viewcontent_title"  colspan="2" >挥发酚</td>
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

                </tr>
</table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
   <tr>
        <td align="center"  class="td_viewcontent_title" colspan="15" style="width:100%" >主要污染物（千克）</td>
   </tr>
   <tr>
        <td align="center"  class="td_viewcontent_title" style="width:16%" rowspan="2"  >排水去向类型</td>
         <td align="center"  class="td_viewcontent_title"  colspan="2" >氰化物</td>
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