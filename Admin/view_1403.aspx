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
	string str2 = "",str3="";

	str2="fld_1415_3,fld_1415_4,fld_1415_5,fld_1415_6,fld_1415_7,fld_1415_8,fld_1415_9,(select fld_975_2 from gmis_mo_975 where fld_975_1=fld_1415_9),fld_1415_10,fld_1415_11,fld_1415_12,fld_1415_13,fld_1415_14";
	str3="fld_1416_3,fld_1416_4,fld_1416_5,fld_1416_6,fld_1416_7,''as wayname,fld_1416_9,fld_1416_10,fld_1416_11,fld_1416_12,fld_1416_13,fld_1416_14";

	view1.SqlStr = "select  (select fld_1396_2 from gmis_mo_1396 where fld_1396_1=fld_"+mid+"_1) as c_name,(select fld_1396_4 from gmis_mo_1396 where fld_1396_1=fld_"+mid+"_1),fld_1403_1 from gmis_mo_1403 a where fld_1403_1='"+orgcode+"'";
	list.SqlStr = "select " + str2 + "  from gmis_mo_1403 a left outer join gmis_mo_1415 b on a.fld_1403_1=b.fld_1415_1  where fld_1403_1='"+orgcode+"'";
	list2.SqlStr = "select " + str3 + ",fld_1416_8,(select fld_624_2 from gmis_mo_624 where fld_624_1=fld_1416_8) as fld_1416_8_1,fld_1403_1 from gmis_mo_1403 a left outer join gmis_mo_1416 c on a.fld_1403_1=c.fld_1416_1 where fld_1403_1='"+orgcode+"'";
	view2.SqlStr = "select fld_1403_18,fld_1403_2,fld_1403_3,fld_1403_4,fld_1403_5,fld_1403_6  from gmis_mo_1403 a where fld_1403_1='"+orgcode+"'";
	DataTable dt = list2.DataTable;
	if (dt.Rows.Count > 0)
	{
		dt.Rows[0]["wayname"] = dt.Rows[0]["fld_1416_8"].ToString()+"="+dt.Rows[0]["fld_1416_8_1"].ToString()=="="?"":dt.Rows[0]["fld_1416_8"].ToString()+"="+dt.Rows[0]["fld_1416_8_1"].ToString();
	}
    list.Rows= list.DataTable.Rows.Count;
    list2.Rows= list.DataTable.Rows.Count;

	iframe_658.Attributes["src"]="iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;

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
    <!--内容-->
    <div id="fold" runat="server" style="">
    </div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">锅炉及废气处理设施普查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2010年</td>
      </tr>
    </table></td>
    <td><table>
                    <tr>
                        <td>
                            表    号：Gl06表
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
<G:content  id="view1" runat="server">
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
</table></G:template>
</G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">一、锅炉基本情况</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">1、锅炉编号</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">2、锅炉型号</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">3、锅炉分类代码</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">4、投入使用时间（年）</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">5、额定出力（兆瓦）</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">6、运行小时</td>
      <td colspan="3" align="center" class="td_viewcontent_title">能源</td>
      <td colspan="2" align="center" class="td_viewcontent_title">燃烧方式</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">12、对应的设施处理编号</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">7、名称</td>
      <td align="center" class="td_viewcontent_title">8、计量单位</td>
      <td align="center" class="td_viewcontent_title">9、消耗量</td>
      <td align="center" class="td_viewcontent_title">10、名称</td>
      <td align="center" class="td_viewcontent_title">11、代码</td>
    </tr>
<G:listbox id="list" runat="server">
<G:template id="templatelist" runat="server">
    <tr>
      <td width="100" align="center" class="td_viewcontent_content" >GL-*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*=*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">QZ-*&nbsp;</td>
    </tr>

</G:template>
</G:listbox>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">二、处理设施基本情况</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">1、处理设施编号</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">2、总投资额（万元）</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">3、设计处理能力（立方米/时）</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">4、运行费用（万元）</td>
      <td width="90" rowspan="2" align="center" class="td_viewcontent_title">5、耗电量（万千瓦时）</td>
      <td colspan="3" align="center" class="td_viewcontent_title">除尘装置</td>
      <td colspan="3" align="center" class="td_viewcontent_title">脱硫装置</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">12、废气实际处理量
      （立方米）</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">6、除尘方法名称</td>
      <td align="center" class="td_viewcontent_title">7、除尘效率（%）</td>
      <td align="center" class="td_viewcontent_title">8、运行小时</td>
      <td align="center" class="td_viewcontent_title">9、脱硫方法名称</td>
      <td align="center" class="td_viewcontent_title">10、脱硫效率　（%）</td>
      <td align="center" class="td_viewcontent_title">11、运行小时</td>
    </tr>
    <G:listbox id="list2" runat="server">
<G:template id="templatelist2" runat="server">
    <tr>
      <td width="100" align="center" class="td_viewcontent_content" >QZ-*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
</G:template>
</G:listbox>
  </table>

    <G:content id="view2" runat="server">
    <G:template id="template3" runat="server">
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
      <td align="left" class="font1220_000000"><p>注：①如果表格不够填写，请自行复印。②运行小时和以“立方米/时”为计量单位的指标保留整数；以“兆瓦、万元、%”为计量单位的指标允许保留一位小数；其他指标允许保留两位小数。<br>
        </p>
        </td>
    </tr>
    <tr>
      <td align="left" class="font1220_000000">&nbsp;</td>
    </tr>
  </table>

  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; "><tr></tr>
  </table>
 </form>
</body>
</html>
