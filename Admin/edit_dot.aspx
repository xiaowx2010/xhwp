<!--点位数据,编辑页-->
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
     
    mid = GetQueryString("mid", "0");
    id = GetQueryString("id", "0");

    if (!IsPostBack)
    {
        if (id != "0")
        {
        }
    }   

	dtable = "gmis_Feature";
	filter = "Featurecode="+id;
	flds = new string[]{"Featurename","Featurebrief","typecode","areacode","Featurex","Featurey","Featuredepth","Featurestate","textlocation","Featuredesc","groupcode","Featurelink","FeatureKind"};
	mflds = new string[]{"数据点名|Featurename","简称|Featurebrief"};
	types = "0011111010001";
	SqlDB db = new SqlDB();
	if (!IsPostBack) 
	{
		//先绑定列表				
		BindListControl(typecode,"typecode","typename","select typecode,typename from gmis_type where typekind='数据点' order by typeindex");	
		BindListControl(areacode,"areacode","areaname","select areacode,areaname from gmis_area where AreaState='启用'  order by areaposition asc","无区域");
		SetFilter(areacode,"0");								
		if(id != "0")
		{
			//绑定所有值
			guangye.BindData(dtable,filter,flds);
			tmpdepth.Value=Featuredepth.Value;
		}
	}
}
public override void BeforeSave()
{	
	Featurename.Value=Featurename.Value.Trim().Replace("<","").Replace(">","").Replace("'","");
	Featurebrief.Value=Featurebrief.Value.Trim().Replace("<","").Replace(">","").Replace("'","");		
	if(Featurebrief.Value.Trim().Length == 0)
	{
		Featurebrief.Value = Featurename.Value.Trim();
	}
}
</script>

<script >


function GetData(args)
{		
	
	var arrstr = args.toString().split("|");
	if(arrstr.length>1)
	{			
		window.document.form1.Featurex.value=arrstr[0];
		window.document.form1.Featurey.value=arrstr[1];
	}
	window.document.focus();	
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
        <td class="td_viewcontent_title"  align="right">数据点名：</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="Featurename" type="text" style="width:95%" runat="server"></td>
		<input id="FeatureKind" Value="1" type="hidden" runat="server">
    </tr>
    <tr>         
		<td class="td_viewcontent_title"  align="right">状态：</td>
        <td class="td_viewcontent_content"><select id="Featurestate" style="width:250px" runat="server">
            <option value="0">启用</option>
            <option value="-1">禁用</option>
            <option value="1">隐藏</option>
        </select>
        </td>
        <td  class="td_viewcontent_title"  align="right">简称：</td>        
        <td  class="td_viewcontent_content">
        <input id="Featurebrief" type="text" style="width:250px" title="地图上显示简称" maxlength="12" runat="server"></td>
    </tr>
    <tr> 
        <td  class="td_viewcontent_title"  align="right">数据：</td>
        <td  class="td_viewcontent_content" colspan="3">
        <input id="Featurex" type="hidden" runat="server">
        <input id="Featurey" type="hidden" runat="server">
        <table><tr><td>
		<input id="dataface" type="password" style="width:200px" title="请从地图获取数据" value="1111111111111111111111111111" readonly="true">
        </td><td>&nbsp;深度：</td><td>
		 <input id="tmpdepth" type="hidden" value="0" runat="server">
		<input id="Featuredepth" type="text" style="width:60px" value="0" onmousedown="this.value=''" onmouseout="if(this.value=='') {this.value=tmpdepth.value}"  title="只能输入数字"  runat="server">
        </td><td>&nbsp;<a href="javascript:__doOpenMap('1',<%=id%>+'|'+form1.FeatureKind.value+'|'+form1.typecode.value)"><img src="images/getdata_.gif" border="0"></a>
        </td></tr></table>
        </td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title"  align="right">所属层：</td>
        <td class="td_viewcontent_content"><asp:DropDownList id="typecode"  style="width:250px" runat="server"/></td>
        <td class="td_viewcontent_title"  align="right">区域：</td>
        <td class="td_viewcontent_content"><asp:DropDownList id="areacode" style="width:250px" runat="server"/></td>
    </tr>
    <tr>         
		<td class="td_viewcontent_title"  align="right">标签位置：</td>
        <td class="td_viewcontent_content"><select id="textlocation" style="width:250px" runat="server">
			<option value="0" selected> 正下方 </option>
			<option value="2"> 正右方 </option>
			<option value="6"> 正左方 </option>
			<option value="4"> 正上方 </option>
			<option value="1"> 右下方 </option>
			<option value="3"> 右上方 </option>
			<option value="7"> 左下方 </option>
			<option value="5"> 左上方 </option>
        </select>
        </td>
        <td class="td_viewcontent_title"  align="right" >&nbsp;</td>        
        <td class="td_viewcontent_content" >&nbsp;<asp:DropDownList id="groupcode" style="width:250px" runat="server" visible=false/></td>
    </tr>    
    <tr>
		<td class="td_viewcontent_title" align="right" valign="top" align="right">介绍：</td>
		<td class="td_viewcontent_content" colspan="3" align="right">
        <G:Editor id="Featuredesc" height="300"  BasePath="Common/Editor/" runat="server"/>
        </td>
    </tr>
</table>
<!--动态生成html,结束-->
</form>
</body>
</html>
