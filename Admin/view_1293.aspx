
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

	str2=",fld_1293_7,fld_1293_17,fld_1293_27,fld_1293_46,fld_1293_56,fld_1293_75,fld_1293_85,fld_1293_95,fld_1293_114,fld_1293_8,fld_1293_18,fld_1293_28,fld_1293_38,fld_1293_47,fld_1293_57,fld_1293_66,fld_1293_76,fld_1293_86,fld_1293_96,fld_1293_105,fld_1293_115,fld_1293_124,fld_1293_9,fld_1293_19,fld_1293_29,fld_1293_38,fld_1293_48,fld_1293_58,fld_1293_67,fld_1293_77,fld_1293_87,fld_1293_97,fld_1293_106,fld_1293_116,fld_1293_125,fld_1293_10,fld_1293_20,fld_1293_30,fld_1293_39,fld_1293_49,fld_1293_59,fld_1293_68,fld_1293_78,fld_1293_88,fld_1293_98,fld_1293_107,fld_1293_117,fld_1293_126,fld_1293_11,fld_1293_21,fld_1293_31,fld_1293_40,fld_1293_50,fld_1293_60,fld_1293_69,fld_1293_79,fld_1293_89,fld_1293_99,fld_1293_108,fld_1293_118,fld_1293_127,fld_1293_12,fld_1293_22,fld_1293_32,fld_1293_41,fld_1293_51,fld_1293_61,fld_1293_70,fld_1293_80,fld_1293_90,fld_1293_100,fld_1293_109,fld_1293_119,fld_1293_128,fld_1293_13,fld_1293_23,fld_1293_33,fld_1293_42,fld_1293_52,fld_1293_62,fld_1293_71,fld_1293_81,fld_1293_91,fld_1293_101,fld_1293_110,fld_1293_120,fld_1293_129,fld_1293_14,fld_1293_24,fld_1293_34,fld_1293_43,fld_1293_53,fld_1293_63,fld_1293_72,fld_1293_82,fld_1293_92,fld_1293_102,fld_1293_111,fld_1293_121,fld_1293_130,fld_1293_15,fld_1293_25,fld_1293_35,fld_1293_44,fld_1293_54,fld_1293_64,fld_1293_73,fld_1293_83,fld_1293_93,fld_1293_103,fld_1293_112,fld_1293_122,fld_1293_131,fld_1293_16,fld_1293_26,fld_1293_36,fld_1293_45,fld_1293_55,fld_1293_65,fld_1293_74,fld_1293_84,fld_1293_94,fld_1293_104,fld_1293_113,fld_1293_123,fld_1293_132";
	str3=",fld_1293_133,fld_1293_134,fld_1293_135,fld_1293_136,fld_1293_137,fld_1293_138";
	str4=",fld_1293_3,fld_1293_5,fld_1293_6,fld_1293_139,fld_1293_4,fld_1293_2";

	view.SqlStr = "select (select fld_1280_2 from gmis_mo_1280 where fld_1280_1=fld_1293_1),(select fld_1280_4 from gmis_mo_1280 where fld_1280_1=fld_1293_1) " + str2 + " " + str3 + " " + str4 + ",fld_1293_1 from gmis_mo_1293 where fld_1293_1='"+orgcode+"'";     


  
	iframe_1280.Attributes["src"]="iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
	


}
</script>
<body>  <form id="form1" runat="server">
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
    <div id="fold" runat="server" style="">
    </div>
                                      
 
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">工业固体废物普查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2009年</td>
      </tr>
    </table></td>
    <td><table>
                    <tr>
                        <td>
                            表    号：Gl10表
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
      <td width="210" align="left" class="td_viewcontent_content">201*年*月*日&nbsp;</td>
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
