<!--生活源-S402-->

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
        string orgcode = GetQueryString("orgcode", "0");
        hycode = GetQueryString("hycode", "");
        SetToolBar();
        StringBuilder sb = new StringBuilder();
        sb.Append("select fld_995_2,fld_995_4,fld_995_9,fld_995_6,(fld_995_10+fld_995_50+fld_995_51+fld_995_52+fld_995_54),fld_995_11+'-'+cast(convert(decimal(11,0),fld_995_12) as varchar(20)),case when cast(fld_995_13 as varchar(20))='0' then '' else cast(fld_995_13 as varchar(20)) end,fld_995_14,fld_995_15,fld_995_26,fld_995_31+'='+fld_995_26,cast(fld_995_32 as varchar(20))+'年'+cast(fld_995_39 as varchar(20))+'月',fld_995_42,fld_995_43,fld_995_53+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_995_53),fld_995_17,fld_995_18,fld_995_20,fld_995_21,fld_995_24,fld_995_29+'='+(select fld_653_2 from gmis_mo_653 where fld_653_1=fld_995_29),fld_995_56,fld_995_37+'='+(select fld_980_2 from gmis_mo_980 where fld_980_1=fld_995_37),fld_995_46,fld_995_55,fld_995_34,fld_995_38,fld_995_45,fld_995_36,fld_995_49,fld_995_69,fld_995_47,fld_995_30,fld_995_68,fld_995_35,fld_995_41,(select fld_1001_3 from gmis_mo_1001 where fld_1001_1=fld_995_1),cast((select fld_1001_4 from gmis_mo_1001 where fld_1001_1=fld_995_1) as varchar(20))+'年'+cast((select fld_1001_5 from gmis_mo_1001 where fld_1001_1=fld_995_1) as varchar(20))+'月',(select fld_1001_6 from gmis_mo_1001 where fld_1001_1=fld_995_1),(select fld_1001_7 from gmis_mo_1001 where fld_1001_1=fld_995_1),");
        sb.Append("(select fld_1001_8 from gmis_mo_1001 where fld_1001_1=fld_995_1)+'='+(select fld_783_2 from gmis_mo_783 where fld_783_1=(select fld_1001_8 from gmis_mo_1001 where fld_1001_1=fld_995_1)),(select fld_1001_9 from gmis_mo_1001 where fld_1001_1=fld_995_1),(select fld_1001_10 from gmis_mo_1001 where fld_1001_1=fld_995_1)+'='+(select fld_784_2 from gmis_mo_784 where fld_784_1=(select fld_1001_10 from gmis_mo_1001 where fld_1001_1=fld_995_1)),(select fld_1001_11 from gmis_mo_1001 where fld_1001_1=fld_995_1),(select fld_1001_12 from gmis_mo_1001 where fld_1001_1=fld_995_1),fld_995_16,fld_995_58,fld_995_19,fld_995_23,fld_995_25,(select fld_1001_13 from gmis_mo_1001 where fld_1001_1=fld_995_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select fld_1001_13 from gmis_mo_1001 where fld_1001_1=fld_995_1)),(select fld_1001_14 from gmis_mo_1001 where fld_1001_1=fld_995_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select fld_1001_14 from gmis_mo_1001 where fld_1001_1=fld_995_1)),fld_995_57+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_995_57),fld_995_44,fld_995_22,fld_995_27,fld_995_28,'200'+cast(fld_995_33 as varchar(20))+'年'+cast(fld_995_40 as varchar(20))+'月'+cast(fld_995_48 as varchar(20))+'日',fld_995_61,fld_995_62,'200'+cast(fld_995_65 as varchar(20))+'年'+cast(fld_995_66 as varchar(20))+'月'+cast(fld_995_70 as varchar(20))+'日',fld_995_1 from gmis_mo_995 where fld_995_1='"+orgcode+"'");
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
        <tr><td width="30%">&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               居民服务和其他服务业污染源普查表
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            表    &nbsp;&nbsp;&nbsp;号：S402表
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
                            文&nbsp;&nbsp;&nbsp;   号：国统制[2007]124号
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
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>8.经营天数:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>9.经营面积（平方米）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>10.生活垃圾收集方式:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">用水污水处理与排水情况</td>
	</tr>
	<tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>11.用水总量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>12.污水处理设施处理能力（吨/日）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>13.污水处理设施总投资（万元）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>14.污水实际处理量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>15.污水处理设施运行费用(万元):</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>16.污水处理工艺代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>17.污水处理后回用量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>18.排水去向类型代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>19.受纳水体名称:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>20.受纳水体代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        
        
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">洗染服务业填报</td>
	    </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>21.洗染设备总容量（公斤）:</td>
		<td colspan="3" class="td_viewcontent_content" >*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">理发及美容保健服务业填报</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>22.美容保健床位数（张）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>23.理发坐位数（个）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">洗浴服务业填报</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>24.澡堂桑拿衣柜个数（个）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>25.沐足坐位数（个）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">摄影扩印服务业业填报</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>26.扩印设备总能力（张/小时）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>27.日平均扩印照片数（张/天）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">汽车、摩托车维护与保养服务业（洗车业）填报</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>28.车位数（个）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>29.专业洗车设备（压缩机台数（台））:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>30.专业洗车设备（压缩机总功率（千瓦））:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>31.新鲜用水量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">锅炉基本状况</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>32.锅炉序号:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>33.投运时间（年/月）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>34.额定出力（兆瓦）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>35.运行时间（小时）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>36.燃料类型代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>37.燃料消费量（吨/立方米）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>38.燃烧方式代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>39.燃料硫份（%）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>40.燃料灰粉（%）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>41.废气处理设施数（套）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>42.废气处理设施处理总能力（立方米/时）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>43.废气处理设施总投资（万元）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>44.废气实际处理量（万立方米）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>45.废气处理设施运行费用（万元）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>46.脱硫工艺代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>47.除尘工艺代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>48.粉煤灰、炉渣收集方式:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>49.废气处理设施运行时间（小时）:</td>
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
