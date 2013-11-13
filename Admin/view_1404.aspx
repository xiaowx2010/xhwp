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

	content_0.SqlStr = "select fld_1396_2,fld_1396_4 from gmis_Mo_1396 where fld_1396_1='"+orgcode+"'";
	list.SqlStr="select (case fld_1417_3 when '' then '' else 'YL-'+fld_1417_3 end) , fld_1417_4, fld_1417_5, fld_1417_6, fld_1417_7, fld_1417_8, fld_1417_9,(fld_1417_10+'='+(select fld_975_2 from gmis_mo_975 where fld_975_1=fld_1417_10)), fld_1417_11, fld_1417_12, fld_1417_13, fld_1417_14, fld_1417_15, (case fld_1417_22 when '' then '' else 'QZ-'+fld_1417_22 end), (case fld_1417_23 when '' then '' else 'QZ-'+fld_1417_23 end), fld_1417_16, fld_1417_17, fld_1417_18, fld_1417_19, fld_1417_20, fld_1417_21 from gmis_mo_1417 where fld_1417_1='"+orgcode+"'";
	list_1.SqlStr="select (case fld_1418_3 when '' then '' else 'QZ-'+fld_1418_3 end), fld_1418_4, fld_1418_5, fld_1418_6, fld_1418_7, fld_1418_8, fld_1418_9, fld_1418_10, fld_1418_11, fld_1418_12, fld_1418_13, fld_1418_14, fld_1418_15, fld_1418_16, fld_1418_17, fld_1418_18, fld_1418_19, fld_1418_21, fld_1418_22, fld_1418_23, fld_1418_24, fld_1418_25 from gmis_mo_1418 where fld_1418_1='"+orgcode+"'";
    content_1.SqlStr="select fld_1404_19,fld_1404_2,fld_1404_3,fld_1404_4,fld_1404_5,fld_1404_6,fld_1404_1 from gmis_mo_1404 where fld_1404_1='"+orgcode+"'";
	list.Rows = list.DataTable.Rows.Count;
	list_1.Rows = list_1.DataTable.Rows.Count;
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
<table width="100%"><tr><td>
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><!--表头-->
            <table width="100%">
                <tr>
                    <td width="30%">&nbsp;</td>
                    <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">窑炉及废气处理设施普查表<br><span style="font-size:small; font-weight:normal;">2010年</span></td>
                    <td width="30%">
                       <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="top_font1220_000000">表　　号：G107表</td>
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
            </table>
        </td>
    </tr>
    <tr>
        <td><!--内容-->
            <G:Content ID="content_0" runat="server" Alert="...">
            <G:Template id="template_0" runat="server">
                <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
                    <tr>
                        <td   class="td_viewcontent_title" width="15%" align="right">
                            单位名称：</td>
                        <td class="td_viewcontent_content" width="35%">*&nbsp;
                        </td>
                        <td     class="td_viewcontent_title" width="15%" align="right">
                            单位代码：</td>
                        <td class="td_viewcontent_content" width="35%">*&nbsp;
                        </td>
                    </tr>
                </table>
            </G:Template></G:Content>
            <G:ListTable id="list" runat="server" >
    <G:Template id="listtemphead" type="head" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
                <tr>
                    <td   class="td_viewcontent_title" align="center" colspan="14">
                        一、窑炉基本情况</td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        1.窑炉编号</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        2.窑炉类别</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        3.窑炉类别代码</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        4.投入使用时间</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        5.计量单位</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        6.设计生产能力</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        7.运行小时</td>
                    <td   class="td_viewcontent_title" align="center" colspan="3">
                        能源</td>
                    <td   class="td_viewcontent_title" align="center" colspan="3">
                        原辅材料</td>
                    <td   class="td_viewcontent_title" align="center" rowspan="2">
                        14.对应的处理设施编号</td>
                </tr>
                <tr>
                    <td   class="td_viewcontent_title" align="center">
                        8.名称</td>
                    <td   class="td_viewcontent_title" align="center">
                        9.计量单位</td>
                    <td   class="td_viewcontent_title" align="center">
                        10.消耗量</td>
                    <td   class="td_viewcontent_title" align="center">
                        11.名称</td>
                    <td   class="td_viewcontent_title" align="center">
                        12.计量单位</td>
                    <td   class="td_viewcontent_title" align="center">
                        13.使用量</td>
                </tr>
        </G:Template>
            <G:Template id="templist"  runat="server">
            <tr>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        *&nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        *&nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                       *&nbsp;<br>*</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
              </G:Template>
        </table>
   </G:ListTable>
            <G:ListTable ID="list_1" runat="server">
            <G:Template id="listtemphead_1" type="head" runat="server">
            <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
                <tr>
                    <td   class="td_viewcontent_title" align="center" colspan="14">
                        二、处理设施基本情况</td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        1.处理设施编号</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        2.总投资额(万元)</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        3.设计处理能力(立方米/时)</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        4.运行费用(万元)</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        5.运行小时</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        6.耗电量(万千瓦时)</td>
                    <td   class="td_viewcontent_title" align="center" colspan="2">
                        处理方法</td>
                    <td   class="td_viewcontent_title" align="center" colspan="3">
                        处理的主要污染物</td>
                    <td   class="td_viewcontent_title" align="center" rowspan="2">
                        12.废气实际处理量(万立方米)</td>
                </tr>
                <tr>
                    <td   class="td_viewcontent_title" align="center">
                        7.名称</td>
                    <td   class="td_viewcontent_title" align="center">
                        8.代码</td>
                    <td   class="td_viewcontent_title" align="center">
                        9.名称</td>
                    <td   class="td_viewcontent_title" align="center">
                        10.代码</td>
                    <td   class="td_viewcontent_title" align="center">
                        11.处理效率(%)</td>
                </tr>
	            </G:Template>
                <G:Template id="template_1" runat="server">
                <tr>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                </tr>
            </G:Template>
            <G:Template id="template_1_e" runat="server">
                <tr>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                </tr>

            </G:Template></table></G:ListTable>
            <G:Content ID="content_1" runat="server" Alert="...">
<G:Template id="template_01" runat="server">
            <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
                <tr>
                    <td class="td_viewcontent_title" width="15%" align="right">单位负责人:</td>
                    <td class="td_viewcontent_content" width="35%">*&nbsp;</td>
                    <td class="td_viewcontent_title" width="15%" align="right">审核人:</td>
                    <td class="td_viewcontent_content" width="35%">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_title" width="15%" align="right">填表人:</td>
                    <td class="td_viewcontent_content" width="35%">*&nbsp;</td>
                    <td class="td_viewcontent_title" width="15%" align="right">填表日期</td>
                    <td class="td_viewcontent_content" width="35%">201*年*月*日</td>
                </tr>
            </table>
            </G:Template></G:Content>
        </td>
    </tr>
    <tr>
        <td class="td_viewcontent_content"><!--表底-->
            
        </td>
    </tr>
</table>
</td></tr></table>
<!--动态生成结束-->
</form>
</body>
</html>