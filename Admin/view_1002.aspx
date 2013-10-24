<!--生活源-S403-->

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
    string hycode = "";//行业
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode", "0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select fld_1002_2,fld_1002_4,fld_1002_9,fld_1002_6,(fld_1002_10+fld_1002_47+fld_1002_49+fld_1002_50+fld_1002_52),(fld_1002_11+'-'+cast(convert(decimal(11,0),fld_1002_12) as varchar(20))),case when fld_1002_13=0 then '' else cast(convert(decimal(10,0),fld_1002_13) as varchar(20)) end,fld_1002_14,fld_1002_15,fld_1002_42,fld_1002_46+'='+fld_1002_42,cast(fld_1002_41 as varchar(20))+'年'+cast(fld_1002_43 as varchar(20))+'月',fld_1002_44,fld_1002_17,fld_1002_20,fld_1002_26,fld_1002_22,fld_1002_25,fld_1002_65+'='+(select fld_1065_2 from gmis_mo_1065 where fld_1065_1=fld_1002_65),fld_1002_30+'='+(select fld_980_2 from gmis_mo_980 where fld_980_1=fld_1002_30),fld_1002_34,fld_1002_39,fld_1002_48+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_1002_48),fld_1002_16,fld_1002_51+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_51)+';'+(case when fld_1002_53='' then '' else fld_1002_53+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_53)+';' end)+(case when fld_1002_54='' then '' else fld_1002_54+'='+(select ");
        sb.Append("fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_54) end),fld_1002_18,fld_1002_19,fld_1002_21,(case when fld_1002_55='' then '' else fld_1002_55+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_55)+';' end)+(case when fld_1002_56='' then '' else fld_1002_56+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_56)+';' end)+(case when fld_1002_57='' then '' else fld_1002_57+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_57)+';' end)+(case when fld_1002_58='' then '' else fld_1002_58+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_58)+';' end),(case when fld_1002_59='' then '' else (select fld_1193_2 from gmis_mo_1193 where fld_1193_1=fld_1002_59)+';' end)+(case when fld_1002_60='' then '' else (select fld_1193_2 from gmis_mo_1193 where fld_1193_1=fld_1002_60)+';' end)+(case when fld_1002_61='' then '' else (select fld_1193_2 from gmis_mo_1193 where fld_1193_1=fld_1002_61)+';' end)+(case when fld_1002_62='' then '' else (select fld_1193_2 from gmis_mo_1193 where fld_1193_1=fld_1002_62)+';' end)+(case when fld_1002_64='' then '' else (select fld_1193_2 from gmis_mo_1193 where fld_1193_1=fld_1002_64)+';' end),(case when fld_1002_31='' then '' else fld_1002_31+'='+(select fld_649_2 from gmis_mo_649 where fld_649_1=fld_1002_31)+';' end)+(case when fld_1002_27='' then '' else fld_1002_27+'='+(select fld_649_2 from gmis_mo_649 where fld_649_1=fld_1002_27)+';' end),fld_1002_33,");
        sb.Append("fld_1002_37,fld_1002_66,fld_1002_38,fld_1002_23,fld_1002_24,fld_1002_63+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_1002_63),fld_1002_32,fld_1002_28,fld_1002_29,fld_1002_35,'200'+(cast(convert(decimal(10,0),fld_1002_36) as varchar(20))+'年'+cast(convert(decimal(10,0),fld_1002_40) as varchar(20))+'月'+cast(convert(decimal(10,0),fld_1002_45) as varchar(20))+'日'),fld_1002_69,fld_1002_71,'200'+cast(convert(decimal(10,0),fld_1002_72) as varchar(20))+'年'+cast(convert(decimal(10,0),fld_1002_74) as varchar(20))+'月'+cast(convert(decimal(10,0),fld_1002_77) as varchar(20))+'日',fld_1002_1 from gmis_mo_1002 where fld_1002_1='"+orgcode+"' ");
        view.SqlStr = sb.ToString();
        list1.SqlStr = "select fld_1014_3,cast(fld_1014_4 as varchar(20))+'年'+cast(fld_1014_5 as varchar(20))+'月',fld_1014_6,fld_1014_7,fld_1014_8+'='+(select fld_783_2 from gmis_mo_783 where fld_783_1=fld_1014_8),fld_1014_9,fld_1014_10+'='+(select fld_784_2 from gmis_mo_784 where fld_784_1=fld_1014_10),fld_1014_11,fld_1014_12,fld_1014_13+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=fld_1014_13),fld_1014_14+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=fld_1014_14) from gmis_mo_1014 where fld_1014_1 in (select fld_1002_1 from gmis_mo_1002 where fld_1002_1='"+orgcode+"')";
        list1.Rows = list1.DataTable.Rows.Count;
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
                医院污染源普查表
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            表    &nbsp;&nbsp;&nbsp;号：S403表
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
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>6.行业类别:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>行业代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>7.开业时间:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>8.床位数（张）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">用水污水处理与排水情况</td>
	</tr>
	<tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>9.用水总量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>10.污水处理设施处理能力（吨/日）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>11.污水处理设施总投资（万元）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>12.污水实际处理量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>13.污水处理设施运行费用(万元):</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>14.污水处理工艺代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>15.排水去向类型代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>16.受纳水体名称:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>17.受纳水体代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
        </tr>
        
        
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">固体废物基本情况</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>18.生活垃圾收集方式:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>19.医疗废物生产量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>20.医疗废物处理方式:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>21.医疗废物无害化处置量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>22.其中本单位无害化处置的医疗废物量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>23.送医疗废物处置场量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>24.本单位医疗废物处置方式:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>25.焚烧炉类型:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>26.焚烧炉烟气处理方式:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>27.医疗废物本单位焚烧量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>37.废气处理设施数（套）:</td>
		<td class="td_viewcontent_content" style="width:35%" colspan="3">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>38.废气处理设施处理总能力（立方米/时）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>39.废气处理设施总投资（万元）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>40.废气实际处理量（万立方米）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>41.废气处理设施运行费用（万元）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>44.粉煤灰、炉渣收集方式:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>45.废气处理设施运行时间（小时）:</td>
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

<G:ListTable id="list1" runat="server">
<g:template id="temp11" type=head runat=server>
       <table cellpadding="2" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
        <tr align="center">
		<td colspan="11" align="center" class="td_viewcontent_title_top" width="100%">锅炉基本状况</td>
	    </tr>
	    <tr>
	       <td width="12%" align="center"  class="td_viewcontent_title" >28.锅炉序号:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >29.投运时间（年/月）:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >30.额定出力（兆瓦）:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >31.运行时间（小时）:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >32.燃料类型代码:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >33.燃料消费量（吨/立方米）:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >34.燃烧方式代码:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >35.燃料硫份（%）:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >36.燃料灰粉（%）:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >42.脱硫工艺代码:</td>
		<td width="12%"  class="td_viewcontent_title" nowrap>43.除尘工艺代码:</td>
	    </tr>
	    </g:template>
    <G:template id="temp1" runat="server">
    <tr>
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
    </G:template>
    </G:ListTable>

    </form>
</body>
</html>
