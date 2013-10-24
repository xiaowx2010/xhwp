<!--生活源-S404-->

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
    string hycode = "";
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();
		string 	orgcode = GetQueryString("orgcode", "0");
        hycode = GetQueryString("hycode","0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select fld_1016_2,fld_1016_4,fld_1016_9,fld_1016_6,(fld_1016_10+fld_1016_51+fld_1016_52+fld_1016_54+fld_1016_56),fld_1016_11+'-'+cast(convert(decimal(11,0),fld_1016_12) as varchar(20)),case when cast(convert(decimal(11,0),fld_1016_13) as varchar(20))='0' then '' else cast(convert(decimal(11,0),fld_1016_13) as varchar(20)) end,fld_1016_14,fld_1016_15,(select top 1 fld_1021_3 from gmis_mo_1021 where fld_1021_1=fld_1016_1),cast((select top 1 fld_1021_4 from gmis_mo_1021 where fld_1021_1=fld_1016_1) as varchar(20))+'年'+cast((select top 1 fld_1021_5 from gmis_mo_1021 where fld_1021_1=fld_1016_1) as varchar(20))+'月',(select top 1 fld_1021_6 from gmis_mo_1021 where fld_1021_1=fld_1016_1),(select top 1 fld_1021_7 from gmis_mo_1021 where fld_1021_1=fld_1016_1),(select top 1 fld_1021_8 from gmis_mo_1021 where fld_1021_1=fld_1016_1)+'='+(select fld_783_2 from gmis_mo_783 where fld_783_1=(select top 1 fld_1021_8");
        sb.Append(" from gmis_mo_1021 where fld_1021_1=fld_1016_1)),(select top 1 fld_1021_9 from gmis_mo_1021 where fld_1021_1=fld_1016_1),(select top 1 fld_1021_10 from gmis_mo_1021 where fld_1021_1=fld_1016_1)+'='+(select fld_784_2 from gmis_mo_784 where fld_784_1=(select top 1 fld_1021_10 from gmis_mo_1021 where fld_1021_1=fld_1016_1)),(select top 1 fld_1021_11 from gmis_mo_1021 where fld_1021_1=fld_1016_1),(select top 1 fld_1021_12 from gmis_mo_1021 where fld_1021_1=fld_1016_1),fld_1016_21,fld_1016_22,fld_1016_16,fld_1016_17,fld_1016_18,(select top 1 fld_1021_13 from gmis_mo_1021 where fld_1021_1=fld_1016_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select top 1 fld_1021_13 from gmis_mo_1021 where fld_1021_1=fld_1016_1)),(select top 1 fld_1021_14 from gmis_mo_1021 where fld_1021_1=fld_1016_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select top 1 fld_1021_14 from gmis_mo_1021 where fld_1021_1=fld_1016_1)),fld_1016_20+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_1016_20),fld_1016_19,fld_1016_38,fld_1016_39,fld_1016_42,'200'+cast(convert(decimal(10,0),fld_1016_27) as varchar(20))+'年'+cast(convert(decimal(10,0),fld_1016_29) as varchar(20))+'月'+cast(convert(decimal(10,0),fld_1016_30) as varchar(20))+'日',fld_1016_25,fld_1016_26,'200'+cast(convert(decimal(10,0),fld_1016_43) as varchar(20))+'年'+cast(convert(decimal(10,0),fld_1016_46) as varchar(20))+'月'+cast(convert(decimal(10,0),fld_1016_47) as varchar(20))+'日' ,fld_1016_1 from gmis_mo_1016 where fld_1016_1='"+orgcode+"'");
        view.SqlStr = sb.ToString();
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
        <tr>
        <td width="30%"></td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               独立燃烧设施普查表
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            表    &nbsp;&nbsp;&nbsp;号：S404表
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
    <table cellpadding="3" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
    <tr>
		<td width="100" align="right"  class="td_viewcontent_title">1.单位名称:</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">2.单位代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">3.法定代表人:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">4.单位所在地行政划区</td>
	</tr>

		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>行政区划代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>单位所在地:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">5.联系方式</td>
	</tr>

		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>区号-电话号码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>传真号码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>邮政编码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>联系人姓名:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>6.锅炉序号:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>7.投运时间（年/月）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>8.额定出力（兆瓦）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>9.运行时间（小时）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>10.燃料类型代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>11.燃料消费量（吨/立方米）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>12.燃烧方式代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>13.燃料硫份（%）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>14.燃料灰粉（%）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>15.废气处理设施数（套）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>16.废气处理设施处理总能力（立方米/时）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>17.废气处理设施总投资（万元）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>18.废气实际处理量（万立方米）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>19.废气处理设施运行费用（万元）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>20.脱硫工艺代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>21.除尘工艺代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>22.粉煤灰、炉渣收集方式:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>23.废气处理设施运行时间（小时）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
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
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>审核日期:</td>
		<td class="td_viewcontent_content" colspan="3">*&nbsp;</td>
		
        </tr>
	</table>
</G:Template>
</G:Content>

    </form>
</body>
</html>
