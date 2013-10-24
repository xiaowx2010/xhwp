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
<SCRIPT language=javascript>

function setzlkzstar(strzl){

	
	if(strzl=="show"){

		

		document.all.hiddzl.style.display = "";

		document.all.zlkzdiv.style.display = "";

		
		document.all.showzl.style.display = "none";

	}else{		

		
		document.all.showzl.style.display = "";

		document.all.hiddzl.style.display = "none";

		document.all.zlkzdiv.style.display = "none";

	}

}
</SCRIPT>

<script language="C#" runat="server">
    string hycode = "";//行业
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode", "0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select case fld_1260_81 when '' then '徐汇区环保局建设项目环保设施竣工验收简要表' else fld_1260_81 end,fld_1260_2,fld_1260_3,fld_1260_4,fld_1260_5,fld_1260_1,fld_1260_6,fld_1260_7,fld_1260_8,fld_1260_9,fld_1260_10,fld_1260_17,fld_1260_18,fld_1260_19,fld_1260_20,fld_1260_21,fld_1260_11,fld_1260_12,fld_1260_13,fld_1260_14,fld_1260_15,fld_1260_16,fld_1260_75 as 审批性质,fld_1260_24,fld_1260_76 as 建设内容,'' as 设计生产能力,fld_1260_74 as 总投资,fld_1260_26,fld_1260_72 as 占地面积,fld_1260_73 as 建筑面积,fld_1260_25,fld_1260_26,case CONVERT(varchar(10), fld_1260_27, 120) when '1900-01-01' then '' else CONVERT(varchar(10), fld_1260_27, 120) end,case CONVERT(varchar(10), fld_1260_28, 120) when '1900-01-01' then '' else CONVERT(varchar(10), fld_1260_28, 120) end,fld_1260_32,fld_1260_34,fld_1260_33,fld_1260_35,fld_1260_36,fld_1260_62,fld_1260_63,fld_1260_64,fld_1260_37,fld_1260_43,fld_1260_38,fld_1260_44,fld_1260_39,fld_1260_45,fld_1260_40,fld_1260_46,fld_1260_41,fld_1260_47,fld_1260_42,fld_1260_48,fld_1260_49,fld_1260_51,fld_1260_52,fld_1260_53,case CONVERT(varchar(10), fld_1260_54, 120) when '1900-01-01' then '' else CONVERT(varchar(10), fld_1260_54, 120) end,fld_1260_65,fld_1260_82,fld_1260_83,fld_1260_84,fld_1260_55,fld_1260_56,fld_1260_69,fld_1260_57,fld_1260_58,case CONVERT(varchar(10), fld_1260_59, 120) when '1900-01-01' then '' else CONVERT(varchar(10), fld_1260_59, 120) end,fld_1260_60 from gmis_mo_1260 where mocode="+id+";");
        
        view.SqlStr = sb.ToString();
    }
  
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--选项卡-->

    <!--选项卡-->
    <!--操作工具条-->
    <div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbar.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbarright.aspx"-->
    <!--操作工具条-->
    </div>

    <!--内容-->
    
    <G:Content id="view" runat="server">
    <G:Template id="Template1" runat="server">
	<table border="0" width="100%">
	<tr><td align="center" style="TEXT-ALIGN: center; FONT-FAMILY: ??ì?, Arial; COLOR: #ff0000; FONT-SIZE: 20pt; FONT-WEIGHT: bold">
	*
	</td></tr>
	<tr><td>
	<table cellpadding="3" cellspacing="1" border="0" width="100%" >
	<tr>
		<td width="120px">项目登记号：</td><td width="40%">*&nbsp;</td>
		<td width="120px" >受 理 号：</td><td width="40%">*&nbsp;</td> 	
	</tr>
	<tr>
		<td width="120px">申请事项：</td><td>*&nbsp;</td>
		<td >查 询 号：</td><td>*&nbsp;</td> 	
	</tr>
	</table></td></tr><tr><td>
    <table  cellpadding="3" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
	 <tr>
		<td colspan="8" class="td_viewcontent_title">项目基本信息：</td>
	</tr>
    <tr>
		<td width="12.5%"  class="td_viewcontent_content">项目名称</td>
		<td width="37.5%"  colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td width="12.5%"    class="td_viewcontent_content">项目类型</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
		<td width="12.5%"    class="td_viewcontent_content">建设性质</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">建设地点</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">街  镇</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">工 业 区</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">周边保护区</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">重点项目： *&nbsp;</td>
		<td class="td_viewcontent_content">秘    密： *&nbsp;</td>
		<td   class="td_viewcontent_content">经    度： *&nbsp;</td>
		<td class="td_viewcontent_content">纬    度： *&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">建设单位</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">单位性质：</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">主管部门</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">通讯地址</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">联 系 人</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">联系电话</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">审批性质</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">行业类别</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">建设内容</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">设计生产能力</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">总投资（万元）</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">环保投资（万元）</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">占地面积（m2）</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">建筑面积（m2）</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">实际总投资（万元）</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">环保投资（万元）</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">开工日期</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">建成日期</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  rowspan="2" class="td_viewcontent_content">锅炉</td>
		<td  class="td_viewcontent_content">燃    料</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td  rowspan="2" class="td_viewcontent_content">废    水</td>
		<td  class="td_viewcontent_content">排水方式</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">蒸发量（蒸吨）</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td  class="td_viewcontent_content">日排量（吨/日）</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td class="td_viewcontent_content">一类污染物</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td class="td_viewcontent_content">环评单位</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td class="td_viewcontent_content">评价经费（万元）</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td  class="td_viewcontent_content">环评扣分</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
</table></td></tr><tr><td>
<TABLE border=0 width="96%" align=center>
	<TR>
		<TD>
			<SPAN  id=showzl><A onclick="setzlkzstar('show')" href="#">显示总量</A></SPAN>
			<SPAN style="DISPLAY: none" id=hiddzl><A onclick="setzlkzstar('hid')"  href="#">隐藏总量</A></SPAN>
		</TD>
	</TR>
</TABLE>
</td></tr><tr><td>
<TABLE style="DISPLAY: none" id=zlkzdiv border=1 cellSpacing=0 borderColor=#000000 borderColorDark=#ffffff cellPadding=2 width="96%" align=center valign="center">

  <TBODY>

  <TR>

    <TD width="12.5%">总量控制（COD）</TD>

    <TD width="37.5%" colSpan=3>&nbsp; </TD>

    <TD width="12.5%">总量控制（SO2）</TD>

    <TD width="37.5%" colSpan=3>&nbsp; </TD></TR>

  <TR>

    <TD>COD排放总量</TD>

    <TD colSpan=3>*&nbsp;吨/年 </TD>

    <TD >SO2排放总量</TD>

    <TD colSpan=3>*&nbsp;吨/年 </TD></TR>

  <TR>

    <TD >COD“以新带老“增减量</TD>

    <TD  colSpan=3>*&nbsp;吨/年 </TD>

    <TD >SO2“以新带老“增减量</TD>

    <TD  colSpan=3>*&nbsp;吨/年 </TD></TR>

  <TR>

    <TD >COD排放增减量</TD>

    <TD colSpan=3>*&nbsp;吨/年 </TD>

    <TD >SO2排放增减量</TD>

    <TD  colSpan=3>*&nbsp;吨/年 </TD></TR>

  <TR>

    <TD >总量控制（NH3）</TD>

    <TD colSpan=3>&nbsp; </TD>

    <TD>总量控制（NO）</TD>

    <TD  colSpan=3>&nbsp; </TD></TR>

  <TR>

    <TD>NH3排放总量</TD>

    <TD colSpan=3>*&nbsp;吨/年 </TD>

    <TD >NO排放总量</TD>

    <TD  colSpan=3>*&nbsp;吨/年 </TD></TR>

  <TR>

    <TD>NH3“以新带老“增减量</TD>

    <TD colSpan=3>*&nbsp;吨/年 </TD>

    <TD >NO“以新带老“增减量</TD>

    <TD colSpan=3>*&nbsp;吨/年 </TD></TR>

  <TR>

    <TD>NH3排放增减量</TD>

    <TD  colSpan=3>*&nbsp;吨/年 </TD>

    <TD >NO排放增减量</TD>

    <TD colSpan=3>*&nbsp;吨/年 </TD></TR></TBODY></TABLE></td></tr><tr><td>
<table  cellpadding="3" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
	 <tr>
		<td  class="td_viewcontent_content">申报材料</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
    <tr>
		<td width="12.5%"  class="td_viewcontent_content">送达方式</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
		<td width="12.5%"    class="td_viewcontent_content">受理单位</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
		<td width="12.5%"    class="td_viewcontent_content">收 件 人</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
		<td width="12.5%"    class="td_viewcontent_content">收件日期</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	 <tr>
		<td colspan="8" class="td_viewcontent_title"></td>
	</tr>
	<tr>
		<td colspan="8" class="td_viewcontent_title">公示信息：</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">公众参与</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">项目简介</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">环评结论</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">公众留言</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	 <tr>
		<td colspan="8" class="td_viewcontent_title"></td>
	</tr>
	<tr>
		<td colspan="8" class="td_viewcontent_title">拟办意见：</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">受理形式</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">行政许可意见形式</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">项目概况</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">拟办意见</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td colspan="8" class="td_viewcontent_title">内勤编号：</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">批 文 号</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">批文日期</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td  class="td_viewcontent_content">审批结果</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
	</tr>

	
</table></td></tr></table>
</G:Template>
</G:Content>
      

    </form>
</body>
</html>
