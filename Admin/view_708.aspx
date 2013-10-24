
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string hycode = "";//行业
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//设置工具条,同时获取固定URL参数
	hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");
	string str2 = "",str3="",str4="";  

	str2=",fld_708_7,fld_708_17,fld_708_27,fld_708_46,fld_708_56,fld_708_75,fld_708_85,fld_708_95,fld_708_114,fld_708_8,fld_708_18,fld_708_28,fld_708_38,fld_708_47,fld_708_57,fld_708_66,fld_708_76,fld_708_86,fld_708_96,fld_708_105,fld_708_115,fld_708_124,fld_708_9,fld_708_19,fld_708_29,fld_708_38,fld_708_48,fld_708_58,fld_708_67,fld_708_77,fld_708_87,fld_708_97,fld_708_106,fld_708_116,fld_708_125,fld_708_10,fld_708_20,fld_708_30,fld_708_39,fld_708_49,fld_708_59,fld_708_68,fld_708_78,fld_708_88,fld_708_98,fld_708_107,fld_708_117,fld_708_126,fld_708_11,fld_708_21,fld_708_31,fld_708_40,fld_708_50,fld_708_60,fld_708_69,fld_708_79,fld_708_89,fld_708_99,fld_708_108,fld_708_118,fld_708_127,fld_708_12,fld_708_22,fld_708_32,fld_708_41,fld_708_51,fld_708_61,fld_708_70,fld_708_80,fld_708_90,fld_708_100,fld_708_109,fld_708_119,fld_708_128,fld_708_13,fld_708_23,fld_708_33,fld_708_42,fld_708_52,fld_708_62,fld_708_71,fld_708_81,fld_708_91,fld_708_101,fld_708_110,fld_708_120,fld_708_129,fld_708_14,fld_708_24,fld_708_34,fld_708_43,fld_708_53,fld_708_63,fld_708_72,fld_708_82,fld_708_92,fld_708_102,fld_708_111,fld_708_121,fld_708_130,fld_708_15,fld_708_25,fld_708_35,fld_708_44,fld_708_54,fld_708_64,fld_708_73,fld_708_83,fld_708_93,fld_708_103,fld_708_112,fld_708_122,fld_708_131,fld_708_16,fld_708_26,fld_708_36,fld_708_45,fld_708_55,fld_708_65,fld_708_74,fld_708_84,fld_708_94,fld_708_104,fld_708_113,fld_708_123,fld_708_132";
	str3=",fld_708_133,fld_708_134,fld_708_135,fld_708_136,fld_708_137,fld_708_138";
	str4=",fld_708_3,fld_708_5,fld_708_6,fld_708_139,fld_708_4,fld_708_2";

	view.SqlStr = "select (select fld_658_2 from gmis_mo_658 where fld_658_1=fld_708_1),(select fld_658_4 from gmis_mo_658 where fld_658_1=fld_708_1) " + str2 + " " + str3 + " " + str4 + ",fld_708_1 from gmis_mo_708 where fld_708_1='"+orgcode+"'";     


  
	iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
	


}
</script>
<body>  <form id="form1" runat="server">
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
    <div id="fold" runat="server" style="">
    </div>
                                      
 
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">工业固体废物普查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="top_font1220_000000">表　　号：G110表</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">制表机关：国务院第一次全国污染普<br>
          　　　　　查领导小组办公室</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">批准机关：国家统计局</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">批准文号：国统制[2007]124号</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">有效期至：2008年6月30日</td>
      </tr>
    </table></td>
  </tr>
</table>
<!--操作工具条-->
<G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
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
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">一、工业固体废物产生、综合利用与处置情况</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">1、废物名称</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">2、代码</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">3、产生量（吨）</td>
      <td colspan="3" align="center" class="td_viewcontent_title" >综合利用</td>
      <td colspan="3" align="center" class="td_viewcontent_title" >处置</td>
      <td colspan="4" align="center" class="td_viewcontent_title" >贮存</td>
      <td colspan="4" align="center" class="td_viewcontent_title" >倾倒丢弃</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">4、利用量
      (吨)</td>
      <td align="center"class="td_viewcontent_content" >5、其中利用往年贮存量(吨)</td>
      <td align="center" class="td_viewcontent_content">6、利用方式代码</td>
      <td align="center" class="td_viewcontent_content">7、处置量(吨)</td>
      <td align="center" class="td_viewcontent_content">8、其中处置往年贮存量(吨)</td>
      <td align="center" class="td_viewcontent_content">9、处置方式代码</td>
     <td align="center" class="td_viewcontent_content">10、本年贮存量(吨)</td>
    <td align="center" class="td_viewcontent_content">11、其中符合环保要求贮存量</td>
      <td align="center" class="td_viewcontent_content">12、往年贮存量(吨)</td>
      <td align="center" class="td_viewcontent_content">13、贮存方式代码</td>
      <td align="center" class="td_viewcontent_content">14、倾倒丢弃量(吨)</td>
      <td align="center" class="td_viewcontent_content">15、倾倒丢弃方式代码</td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_content">总计</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td colspan="2"  align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td width="100" align="left" class="td_viewcontent_content" style="padding-left:15px; ">冶炼废渣</td>
      <td align="center" class="td_viewcontent_content" >1</td>
     <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td  align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:15px; ">粉煤灰</td>
      <td align="center" class="td_viewcontent_content">2</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td  align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:15px; ">炉渣</td>
      <td align="center" class="td_viewcontent_content">3</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td  align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:15px; ">煤矸石</td>
      <td align="center" class="td_viewcontent_content">4</td>
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
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:15px; ">尾矿</td>
      <td align="center" class="td_viewcontent_content">5</td>
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
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:15px; ">脱硫石膏</td>
      <td align="center" class="td_viewcontent_content">6</td>
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
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:15px; ">污泥</td>
      <td align="center" class="td_viewcontent_content">7</td>
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
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:15px; ">放射性废物</td>
      <td align="center" class="td_viewcontent_content">8</td>
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
    <tr>
      <td align="left" class="td_viewcontent_content" style="padding-left:15px; ">其他废物</td>
      <td align="center" class="td_viewcontent_content">9</td>
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
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">二、工业固体废物贮存、处置设施情况</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999"  style="margin-bottom:5px; ">
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">1、贮存场容量（立方米）</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">2、填埋场容量（立方米）</td>
      <td colspan="2" align="center" class="td_viewcontent_title">处理设施</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">5、总投资额（万元）</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">6、运行费用（万元）</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">3、设施数量（台）</td>
      <td align="center" class="td_viewcontent_title">4、设计处理能力（吨/天）</td>
    </tr>
    <tr align="center">
      <td class="td_viewcontent_content">*&nbsp;</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
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
      <td width="210" align="left" class="td_viewcontent_content">200*年*月*日&nbsp;</td>
    </tr>

  </table>
 </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="top_font1220_000000">注：①以“立方米”为计量单位的指标保留整数；以“吨/天、万元”为计量单位的指标允许保留一位小数；其他指标允许保留两位小数。<br>
        工业固体废物产生、综合利用与处置情况指标关系：3≥10，4≥5，7≥8，10≥11，3＝4＋7＋10－(5＋8)＋14。</td>
    </tr></table>

  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; "><tr></tr>
  </table>
</form> 
</body>
</html>
