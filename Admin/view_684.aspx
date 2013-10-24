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

	content_0.SqlStr = "select fld_658_2,fld_658_4,(case fld_688_3 when '' then '' else 'YL-'+fld_688_3 end), fld_688_4, fld_688_5, fld_688_6, fld_688_7, fld_688_8, fld_688_9,(fld_688_10+'='+(select fld_975_2 from gmis_mo_975 where fld_975_1=fld_688_10)), fld_688_11, fld_688_12, fld_688_13, fld_688_14, fld_688_15, (case fld_688_22 when '' then '' else 'QZ-'+fld_688_22 end), (case fld_688_23 when '' then '' else 'QZ-'+fld_688_23 end), fld_688_16, fld_688_17, fld_688_18, fld_688_19, fld_688_20, fld_688_21, (case fld_689_3 when '' then '' else 'QZ-'+fld_689_3 end), fld_689_4, fld_689_5, fld_689_6, fld_689_7, fld_689_8, fld_689_9, fld_689_10, fld_689_11, fld_689_12, fld_689_13, fld_689_14, fld_689_15, fld_689_16, fld_689_17, fld_689_18, fld_689_19, fld_689_20, fld_689_21, fld_689_22, fld_689_23, fld_689_24, fld_689_25, fld_689_26,fld_684_19,fld_684_2,fld_684_3,fld_684_4,fld_684_5,fld_684_6,fld_684_1 from " + GetModuleTableName(mid) + " a left join " + GetModuleTableName("688") + " b on fld_688_1=fld_684_1 left join " + GetModuleTableName("689") + " c on fld_689_1=fld_684_1 left join " + GetModuleTableName("658") + " d on fld_658_1=fld_684_1 where fld_684_1='"+orgcode+"'";     

	iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
}

</script>

<body style="padding:10px;text-align:center">
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
<table width="100%"><tr><td>
<G:Content ID="content_0" runat="server" Alert="...">
<G:Template id="template_0" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><!--表头-->
            <table width="100%">
                <tr>
                    <td width="30%">&nbsp;</td>
                    <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">窑炉及废气处理设施普查表<br><span style="font-size:small; font-weight:normal;">2007年</span></td>
                    <td width="30%">
                        <table width="100%">
                            <tr><td width="80px" align="right" >表&nbsp;&nbsp;&nbsp;&nbsp;号：</td></tr>
                            <tr><td width="80px" align="right">制表机关：</td></tr>
                            <tr><td width="80px" align="right">批准机关：</td></tr>
                            <tr><td width="80px" align="right">文&nbsp;&nbsp;&nbsp;&nbsp;号：</td></tr>
                            <tr><td width="80px" align="right">有效期至：</td></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td><!--内容-->
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
                    
            </table>
            <%--</G:Template></G:Content>
            <G:Content ID="content_1" runat="server" Alert="...">
            <G:Template id="template_1" runat="server">--%>
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
                    <td class="td_viewcontent_content">* &nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                </tr>
            </table>
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
                    <td class="td_viewcontent_content" width="35%">200*年*月*日</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td_viewcontent_content"><!--表底-->
            
        </td>
    </tr>
</table>
</G:Template></G:Content></td></tr></table>
<!--动态生成结束-->
</form>
</body>
</html>