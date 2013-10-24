<!--水质量监测信息,查看页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{    
     
    SetToolBar();//设置工具条,同时获取固定URL参数  
    string fcode = GetQueryString("fcode", "");
    string h_fstr = " and mocode="+id;//条件
	if (fcode != "")
    {
		h_fstr = " and fld_37_35 = "+fcode;
		tools.Visible = false;
    }

    view.SqlStr = "select convert(nvarchar(10),fld_" + mid + "_1,120),convert(nvarchar(10),fld_" + mid + "_2,120),fld_" + mid + "_3,fld_" + mid + "_4,fld_" + mid + "_5,fld_" + mid + "_6,fld_" + mid + "_7,fld_" + mid + "_8,fld_" + mid + "_9,fld_" + mid + "_10,fld_" + mid + "_11,fld_" + mid + "_12,fld_" + mid + "_13,fld_" + mid + "_14,fld_" + mid + "_15,fld_" + mid + "_16,fld_" + mid + "_17,fld_" + mid + "_18,fld_" + mid + "_19,fld_" + mid + "_20,fld_" + mid + "_21,fld_" + mid + "_22,fld_" + mid + "_23,fld_" + mid + "_24,fld_" + mid + "_25,fld_" + mid + "_26,fld_" + mid + "_27,fld_" + mid + "_28,fld_" + mid + "_29,fld_" + mid + "_30,fld_" + mid + "_31,fld_" + mid + "_32,fld_" + mid + "_33,fld_" + mid + "_34 from gmis_mo_" + mid + " where 1=1 " + h_fstr;
 
 }
</script>
<body style="padding:10px;text-align:center">
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
</div>
<!--操作工具条-->
<!--动态生成html,开始-->
<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">监测日期:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">收到日期:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">湖岸名称:</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">采样点位置:</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">采样时间:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">氨氮:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">溶解氧:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">PH:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">电导率:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">高锰酸盐指数:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">化学需氧量（CODcr）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">挥发酚:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">生化需氧量（BOD5）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">石油类（石油醚萃取）:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">水温:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">铁:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">透明度:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">总氮:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">总磷（以P计）:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">总汞:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">总锰:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">总铅:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">氟化物（以F-计）:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">铬（六价）:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">硫化物:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">阴离子表面活性剂:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">总镉:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">总氰化物:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">总砷:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">总铜:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">总锌:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">粪大肠菌群:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">硒:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">叶绿素a:</td>
		<td class="td_viewcontent_content" style="width:35%">*</td>
		</tr>
	</table>
</G:Template>
</G:Content>
<!--动态生成html,结束-->
</form>
</body>
</html>
