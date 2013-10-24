<!--生活源-S405-->

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
    string hycode="";
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();
        string    orgcode = GetQueryString("orgcode", "0");
        hycode = GetQueryString("hycode","0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select fld_1022_2,fld_1022_6,fld_1022_16+'-'+cast(convert(decimal(11,0),fld_1022_11) as varchar(20)),case when cast(convert(decimal(11,0),fld_1022_9) as varchar(20))='0' then '' else cast(convert(decimal(11,0),fld_1022_9) as varchar(20)) end ,fld_1022_14,fld_1022_22,fld_1022_23,fld_1022_24,fld_1022_25,fld_1022_26,fld_1022_27,fld_1022_28,fld_1022_29,fld_1022_30,fld_1022_31,fld_1022_32,fld_1022_33,fld_1022_34,fld_1022_35,fld_1022_36,fld_1022_37,fld_1022_38,fld_1022_39,fld_1022_45,case when cast(convert(decimal(11,0),fld_1022_51) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1022_51) as varchar(20)) end,fld_1022_40,fld_1022_46,case when cast(convert(decimal(11,0),fld_1022_52) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1022_52) as varchar(20)) end,fld_1022_41,fld_1022_47,case when cast(convert(decimal(11,0),fld_1022_53) as varchar(20))='0' then ' ' else cast(convert(decimal(10,0),fld_1022_53) as varchar(20)) end,fld_1022_42,fld_1022_48,case when");
        sb.Append(" cast(convert(decimal(11,0),fld_1022_54) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1022_54) as varchar(20)) end,fld_1022_43,fld_1022_49,case when cast(convert(decimal(11,0),fld_1022_55) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1022_55) as varchar(20)) end,fld_1022_44,fld_1022_50,case when cast(convert(decimal(11,0),fld_1022_56) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1022_56) as varchar(20)) end,fld_1022_13,fld_1022_59,fld_1022_60,'200'+cast(fld_1022_21 as varchar(20))+'年'+(case when cast(convert(decimal(11,0),fld_1022_15) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1022_15) as varchar(20)) end)+'月'+(case when cast(convert(decimal(11,0),fld_1022_10) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1022_10) as varchar(20)) end)+'日',fld_1022_19,fld_1022_20,'200'+cast(fld_1022_61 as varchar(20))+'年'+(case when cast(convert(decimal(11,0),fld_1022_58) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1022_58) as varchar(20)) end)+'月'+(case when cast(convert(decimal(11,0),fld_1022_57) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1022_57) as varchar(20)) end)+'日',fld_1022_1 from gmis_mo_1022 where fld_1022_1='"+orgcode+"'");
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
        <tr><td width="30%"></td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               城镇居民生活污染源普查表
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            表    &nbsp;&nbsp;&nbsp;号：S405表
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
		<td width="100" align="right"  class="td_viewcontent_title">1.设区城市的区、县（县级市）、建制镇名称（公章）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">2.行政区划代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">3.联系方式</td>
	    </tr>
		
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>区号-电话号码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>传真号码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>联系人姓名:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
		</tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>4.辖区内城镇长住人口（万人）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>5.煤炭消费量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>6.煤炭中平均硫份（%）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>7.煤炭中平均灰份（%）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>8.燃料油消费量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>9.燃料油中平均硫份（%）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>10.管道煤气消费量（万立方米）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>11.天然气消费量（万消费量）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>12.液化石油气消费量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>13.生活垃圾清运量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>14.其中：生活垃圾无害化填埋量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>15.其中：生活垃圾简易填埋量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>16.其中：生活垃圾堆肥量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>17.其中：生活垃圾焚烧量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>18.其中：生活垃圾其他处理方式处理量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>19.生活用水总量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>20.其中：居民家庭用水总量（万吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
        </tr>
        </table>
        
        <table cellpadding="2" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
        <tr align="center">
		<td width="150"  align="center"  class="td_viewcontent_title" nowrap>21.受纳水体名称:</td>
		<td width="120" align="center"  class="td_viewcontent_title" nowrap>22.其中：受纳水体代码:</td>
		<td width="120" align="center"  class="td_viewcontent_title" nowrap>23.排入受纳水体的污水量&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150"  align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150"  align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150"  align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150"  align="right"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150" align="right"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    </table>
	    <table cellpadding="2" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
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
