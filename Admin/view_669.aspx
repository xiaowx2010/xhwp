<!--工业源-工业源普查详表（g105_1）-->

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
    
string hycode;//行业
    
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();
	hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");
	view1.SqlStr = "select fld_658_2,fld_658_4,fld_658_1 from gmis_mo_658 where fld_658_1=(select fld_669_1 from gmis_mo_669 where mocode="+id+")";
	list.SqlStr = "select fld_672_3,fld_672_4,fld_672_5,fld_672_6,fld_672_7,fld_672_8,fld_672_9,fld_672_10,fld_672_11,fld_672_12,fld_672_13,fld_672_14,fld_672_15,fld_672_16 from gmis_mo_672 where fld_672_1='"+orgcode+"'";
	view.SqlStr = "select fld_670_19,fld_670_2,fld_670_3,'200'+cast(fld_670_4 as varchar(20))+'年'+cast(fld_670_5 as varchar(20))+'月'+cast(fld_670_6 as varchar(20))+'日' from gmis_mo_670 where fld_670_1='"+orgcode+"'";     
	list.Rows = list.DataTable.Rows.Count;
	iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
}

</script>

<body style="padding: 10px; text-align: center">
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
    <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
        <td style="width: 30%" >&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               废水污染物产排污系数测算表
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            表    号：Gl05_1表
                        </td>
                    </tr>
                    <tr>
                        <td>
                            制表机关：国务院第一次全国污染源普查领导小组办公室
                        </td>
                    </tr>
                    <tr>
                        <td>
                            批准机关：国家统计局
                        </td>
                    </tr>
                    <tr>
                        <td>
                            文    号：国统制[2007]124号
                        </td>
                    </tr>
                    <tr>
                        <td>
                            有效期至：2008年6月30日
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
        <tr><td  colspan=3 style="font-size:small; font-weight:normal; width:40%" align="center" >2007年</td></tr>
    </table>
    <g:Content id=view1 runat=server >
        <g:template id=tempview1 runat=server>
            <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        单位名称（公章）：
                    </td>
                    <td class="td_viewcontent_content" style="width:33%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        单位代码：
                    </td>
                    <td class="td_viewcontent_content" style="width:33%">
                        *&nbsp;
                    </td>
                </tr>
                </table>
        </g:template>
    </g:Content>
    <G:ListTable id="list" runat="server" >
    <G:Template id="listtemphead" type="head" runat="server"> 
    
    <table width="100%" border="0" cellpadding="1" cellspacing="1"   style="margin-top: 10px;" class="table_graybgcolor">
        <tr align="center" >
            <td align="center" class="td_viewcontent_title" width="8%" >
                1.产品名称
            </td>
            <td align="center" class="td_viewcontent_title" width="10%" >
                2.原料名称
            </td>
            <td align="center" class="td_viewcontent_title" width="11%" >
                3.生产工艺名称
            </td>
            <td align="center" class="td_viewcontent_title" width="8%" >
                4.计量单位
            </td>
            <td align="center" class="td_viewcontent_title" >
                5.生产能力
            </td>
            <td align="center" class="td_viewcontent_title" width="8%">
                6.计量单位
            </td>
            <td align="center" class="td_viewcontent_title" width="8%">
                7.生产使用量
            </td>
            <td align="center" class="td_viewcontent_title" width="7%" >
                8.废水处理工艺名称
            </td>
            <td align="center" class="td_viewcontent_title" width="7%" >
                9.污染物名称
            </td>
            <td align="center" class="td_viewcontent_title" >
                10.产污系数
            </td>
            <td align="center" class="td_viewcontent_title">
                11.排污系数
            </td>
            <td align="center" class="td_viewcontent_title" width="11%" >
                12.计量单位
            </td>
            <td align="center" class="td_viewcontent_title" >
                13.污染物生产量
            </td>
            <td align="center" class="td_viewcontent_title" >
                14.污染物排放量
            </td>
        </tr>
        </G:Template>
            <G:Template id="templist"  runat="server">
            <tr >
                <td align=center class="td_viewcontent_content"  >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content">
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content"  >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
            </tr>
              </G:Template>
        </table>
   </G:ListTable>
   <g:Content id="view" runat=server>
    <g:template id="tempview" runat=server>
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
    </g:template>
   </g:Content>
    </form>
</body>
</html>
