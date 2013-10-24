<!--n302_2_c水产养殖（网箱）污染物表_主表,编辑页-->
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
 }
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">代码:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_1" class="boxbline" style="width:95%;"  maxlength="32" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">代码:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_1" class="boxbline" style="width:95%;"  maxlength="32" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">序号:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_2" class="boxbline" style="width:95%;"  maxlength="16" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">氨氮产生量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_2" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">氨氮排放量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_3" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.养殖品种名称1:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_3" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.养殖品种代码1:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_4" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">COD产生量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_4" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">COD排放量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_5" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.投放量1:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_5" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.产量1:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_6" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">产排比例:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_6" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">产品类别:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_7" class="boxbline" style="width:95%;"  maxlength="2" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.养殖品种名称2:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_7" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.养殖品种代码2:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_8" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">区域:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_8" class="boxbline" style="width:95%;"  maxlength="2" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">行政区划:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_9" class="boxbline" style="width:95%;"  maxlength="5" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.投放量2:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_9" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.产量2:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_10" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">铜产生量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_10" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">铜排放量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_11" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.养殖品种名称3:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_11" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.养殖品种代码3:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_12" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">锌产生量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_12" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">锌排放量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_13" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.投放量3:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_13" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.产量3:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_14" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">养殖模式:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_14" class="boxbline" style="width:95%;"  maxlength="2" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">养殖品种:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_15" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.养殖品种名称4:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_15" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.养殖品种代码4:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_16" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">养殖水体:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_16" class="boxbline" style="width:95%;"  maxlength="2" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">增产量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_17" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.投放量4:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_17" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.产量4:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_18" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">总氮产生量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_18" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">总氮排放量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_19" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.养殖品种名称5:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_19" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.养殖品种代码5:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_20" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">总磷产生量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_20" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">总磷排放量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_21" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.投放量5:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_21" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.产量5:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_22" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.养殖品种名称6:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_23" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.养殖品种代码6:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_24" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.投放量6:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_25" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.产量6:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_26" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.养殖品种名称7:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_27" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.养殖品种代码7:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_28" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.投放量7:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_29" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.产量7:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_30" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">15.养殖品种名称8:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_31" class="boxbline" style="width:95%;"  maxlength="80" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">16.养殖品种代码8:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_32" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">17.投放量8:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_33" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">18.产量8:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1379_34" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
		</tr>
	</table>
<!--动态生成html,结束-->
</form>
</body>
</html>
