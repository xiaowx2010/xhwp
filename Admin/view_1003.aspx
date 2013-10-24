<!--生活源-S403_1-->

<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->

<script language="C#" runat="server">
string  hycode = "";//行业
private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode", "0");
        view.SqlStr="select fld_1002_2,fld_1002_4 from gmis_mo_1002 where fld_1002_1='"+orgcode+"'";
        list1.SqlStr="select fld_1008_2,fld_1008_3,fld_1008_4,fld_1008_5,fld_1008_6,cast(fld_1008_7 as varchar(20))+'年'+cast(fld_1008_8 as varchar(20))+'月',fld_1008_9 from gmis_mo_1008 where fld_1008_1='"+orgcode+"'";
        list1.Rows = list1.DataTable.Rows.Count;
        list2.SqlStr = "select fld_1009_2,fld_1009_4,fld_1009_5,fld_1009_6,(cast(fld_1009_7 as varchar(20))+'年'+cast(fld_1009_8 as varchar(20))+'月'),fld_1009_9 from gmis_mo_1009 where fld_1009_1='" + orgcode+"'";
        list2.Rows = list2.DataTable.Rows.Count;
        list3.SqlStr = "select fld_1010_2,fld_1010_3,fld_1010_4,fld_1010_5+'='+(select fld_1049_2 from gmis_mo_1049 where fld_1049_1=fld_1010_5),(cast(fld_1010_6 as varchar(20))+'年'+cast(fld_1010_7 as varchar(20))+'月'),fld_1010_8+'='+(select fld_1031_2 from gmis_mo_1031 where fld_1031_1=fld_1010_8) from gmis_mo_1010 where fld_1010_1='"+orgcode+"'";
        list3.Rows = list3.DataTable.Rows.Count;
        view2.SqlStr = "select fld_1004_2,fld_1004_3,fld_1004_4,'200'+cast(fld_1004_5 as varchar(20))+'年'+cast(fld_1004_6 as varchar(20))+'月'+cast(fld_1004_7 as varchar(20))+'日',fld_1004_10,fld_1004_11 from gmis_mo_1004 where fld_1004_1='"+orgcode+"'";
        iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode); 
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
        <tr><td width="30%">&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
                医用电磁辐射设备和放射性同位素与射线装置普查表
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            表    &nbsp;&nbsp;&nbsp;号：S403_1表
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
                            文    &nbsp;&nbsp;&nbsp;号：国统制[2007]124号
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
    <G:Content id="view" runat="server">
    <G:Template id="Template1" runat="server">
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="right"  class="td_viewcontent_title_top">单位名称：</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	     <td align="right"  class="td_viewcontent_title_top">单位代码：</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
    </tr>  
</table>
</G:Template>
</G:Content>
<g:ListTable id="list1" runat=server>
<g:template type=head id="temp_1" runat=server>
    <table cellpadding="3" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
    
    <tr align="center">
		<td colspan="7" align="center" class="td_viewcontent_title_top">一.医用电磁辐射设备（频率大于500赫兹切功率大于5千瓦）</td>
	    </tr>
	    <tr>
	       <td width="9%" align="center"  class="td_viewcontent_title" >1.设备类别:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >2.设备代码:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >3.设备型号:</td>
	       <td width="13%" align="center"  class="td_viewcontent_title" >4.标称功率（千瓦）:</td>
	       <td width="13%" align="center"  class="td_viewcontent_title" >5.工作频率（千赫）:</td>
	       <td width="13%" align="center"  class="td_viewcontent_title" >6.启用时间（年月）:</td>
	       <td width="11%" align="center"  class="td_viewcontent_title" >7.设备使用状态:</td>
	    </tr>
	    </g:template>
	    <g:template id="temp_11" runat=server>
	    <tr >
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	    </tr>
	    </g:template>
	</g:ListTable>
	
	
	<g:ListTable id="list2" runat=server>
	<g:template id="temp2" type=head runat=server>
       <table cellpadding="2" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
    <tr align="center">
		<td colspan="6" align="center" class="td_viewcontent_title_top" width="100%">二.医用含放射源设备</td>
	    </tr>
	    <tr>
	       <td width="12%" align="center"  class="td_viewcontent_title" >8.含放射源设备类别:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >9.设备代码:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >10.设备型号:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >11.标称功率（千瓦）:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >12.工作频率（千赫）:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >13.启用时间（年月）:</td>
	     
	    </tr>
	    </g:template>
	    <g:template id="temp_22" runat=server>
	    <tr>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
	       
	    </tr>

	</g:template>
	</g:ListTable>
	
	<g:ListTable id="list3" runat=server>
	<g:template id="temp3" type="head" runat=server>
        <table cellpadding="3" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
    <tr align="center">
		<td colspan="6" align="center" class="td_viewcontent_title_top" width="100%">三.医用射线装置</td>
	    </tr>
	    <tr>
	       <td width="14%" align="center"  class="td_viewcontent_title" >14.射线装置名称:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >15.设备代码:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >16.设备型号:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >17.射线装置类别:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >18.启用时间（年月）:</td>
	       <td width="11%" align="center"  class="td_viewcontent_title" >19.装置使用状态:</td>
	     
	    </tr>
	    </g:template>
	    <g:template id="temp33" runat=server>
	    <tr>
	       <td  align="center"  class="td_viewcontent_content">*&nbsp;</td>
	       <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td  align="center"  class="td_viewcontent_content" >*&nbsp;</td>
	       <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
	       
	    </tr>
	    </g:template>
      </g:ListTable> 
      
      <g:Content id="view2" runat=server>
      <g:template id="temp_view2" runat=server>
	    <table cellpadding="3" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>单位负责人:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>审核人:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>填表人:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>填表日期:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>普查员:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>普查指导员:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        
	</table>
</g:template>
</g:Content>
    </form>
</body>
</html>
