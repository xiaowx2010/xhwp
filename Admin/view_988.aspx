<!--生活源-S401住宿业、餐饮业污染源普查表（S401） ）-->

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
        string  orgcode = GetQueryString("orgcode", "0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select fld_988_2,fld_988_4,fld_988_9,fld_988_6,(fld_988_10+fld_988_52+fld_988_53+fld_988_54+fld_988_55),fld_988_11+'-'+cast(convert(decimal(11,0),fld_988_12) as varchar(20)),case when cast(fld_988_13 as varchar(20))='0' then '' else cast(fld_988_13 as varchar(20)) end,fld_988_14,fld_988_15,fld_988_16,fld_988_17+'='+fld_988_16,(cast(fld_988_18 as varchar(20))+'年'+cast(fld_988_19 as varchar(20))+'月'),fld_988_20,fld_988_56+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_988_56),fld_988_21,fld_988_22,fld_988_23,fld_988_24,fld_988_25,fld_988_26+'='+(select fld_652_2 from gmis_mo_652 where fld_652_1=fld_988_26),fld_988_57,fld_988_27+'='+(select fld_980_2 from gmis_mo_980 where fld_980_1=fld_988_27),fld_988_28,fld_988_58,fld_988_29,fld_988_30,fld_988_31,fld_988_32,fld_988_33,fld_988_34,fld_988_35,fld_988_36,fld_988_37,fld_988_38,");
        sb.Append(" fld_988_39,fld_988_40,(select fld_993_3 from gmis_mo_993 where fld_993_1=fld_988_1),(cast((select fld_993_4 from gmis_mo_993 where fld_993_1=fld_988_1) as varchar(20))+'年'+cast((select fld_993_5 from gmis_mo_993 where fld_993_1=fld_988_1) as varchar(20))+'月'),(select fld_993_6 from gmis_mo_993 where fld_993_1=fld_988_1),(select fld_993_7 from gmis_mo_993 where fld_993_1=fld_988_1),(select fld_993_8 from gmis_mo_993 where fld_993_1=fld_988_1)+'='+(select fld_783_2 from gmis_mo_783 where fld_783_1=(select fld_993_8 from gmis_mo_993 where fld_993_1=fld_988_1)),(select fld_993_9 from gmis_mo_993 where fld_993_1=fld_988_1),(select fld_993_10 from gmis_mo_993 where fld_993_1=fld_988_1)+'='+(select fld_785_2 from gmis_mo_785 where fld_785_1=(select fld_993_10 from gmis_mo_993 where fld_993_1=fld_988_1)),(select fld_993_11 from gmis_mo_993 where fld_993_1=fld_988_1),(select fld_993_12 from gmis_mo_993 where fld_993_1=fld_988_1),fld_988_41,fld_988_95,fld_988_42,fld_988_43,fld_988_44,(select fld_993_13 from gmis_mo_993 where fld_993_1=fld_988_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select fld_993_13 from gmis_mo_993 where fld_993_1=fld_988_1)),(select fld_993_14 from gmis_mo_993 where fld_993_1=fld_988_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select fld_993_14 from gmis_mo_993 where fld_993_1=fld_988_1)),fld_988_59+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_988_59),fld_988_45,fld_988_46,fld_988_47,fld_988_48,'200'+(cast(fld_988_49 as varchar(20))+'年'+cast(fld_988_50 as varchar(20))+'月'+cast(fld_988_51 as varchar(20))+'日'),fld_988_62,fld_988_64,'200'+(cast(fld_988_66 as varchar(20))+'年'+cast(fld_988_67 as varchar(20))+'月'+cast(fld_988_69 as varchar(20))+'日'),fld_988_1 from gmis_mo_988 where fld_988_1='"+orgcode+"'");
        view.SqlStr=sb.ToString();
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
        <tr><td width="30%"></td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               住宿业、餐饮业污染源普查表
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            表&nbsp;&nbsp;&nbsp;&nbsp;号：S401表
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
                            文&nbsp;&nbsp;&nbsp;&nbsp;号：国统制[2007]124号
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
		<td width="100" align="right"  class="td_viewcontent_title_top">1.单位名称:</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title_top">2.单位代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title_top">3.法定代表人:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" style="line-height:25px" width="100%">4.单位所在地行政划区</td>
	</tr>

		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>行政区划代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>单位所在地:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">5.联系方式</td>
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
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>9.生活垃圾收集方式:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">用水污水处理与排水情况</td>
	</tr>
	<tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>10.用水总量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>11.污水处理设施处理能力（吨/日）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>12.污水处理设施总投资（万元）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>13.污水实际处理量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>14.污水处理设施运行费用(万元):</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>15.污水处理工艺代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>16.污水处理后回用量（吨）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>17.排水去向类型代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>18.受纳水体名称:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>19.受纳水体代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">住宿业填报</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>20.宾馆饭店等级代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>21.床位数（张）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>22.年平均入住率（%）:</td>
		<td colspan="3" class="td_viewcontent_content" >*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">住宿业含的洗染服务业填报</td>
	    </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>23.洗染设备总容量（公斤）:</td>
		<td colspan="3" class="td_viewcontent_content" >*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">住宿业含的理发及美容保健服务业填报</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>24.美容保健床位数（张）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>25.理发坐位数（个）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">住宿业含的洗浴服务业填报</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>26.澡堂桑拿衣柜个数（个）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>27.沐足坐位数（个）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">餐饮业填报</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>28.经营面积（平方米）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>29.餐位数（个）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>30.固定灶头数（个）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>31.油烟进化器数（个）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">锅炉基本情况</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>32.锅炉序号:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>33.投运时间:</td>
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
