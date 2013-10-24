<!--图形数据,编辑页-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string  p_types, p_dtable, p_filter;
string[] p_flds;
private void Page_Load(object sender, System.EventArgs e)
{     
	
	
	SetToolBar();//设置工具条,同时获取固定URL参数	

    p_dtable = "gmis_mo_1196";
    p_filter = " mocode=" + id;
    p_flds = new string[] {"fld_1196_1","fld_1196_2" };
    p_types = "01";
    
    dtable = "gmis_Feature";   
	flds = new string[]{"Featurename","Featurebrief","typecode","areacode","Featuremode","Featurex","Featurey","Featuredata","Featuredepth","Featurestate","Featuredesc","FeatureKind"};
	mflds = new string[]{"河流名称|Featurename"};
	types = "001111101001";
    
	if (!IsPostBack)
	{
		//先绑定列表
		BindListControl(typecode,"typecode","typename","select typecode,typename from gmis_type where typekind='图形' order by typeindex");
        SetFilter(typecode, tid);	
		BindListControl(areacode,"areacode","areaname","select areacode,areaname from gmis_area where areastate='启用' order by areaindex","无区域");

        dstr1.Value = "#ff0000";
		if(id != "0")
		{
           
            //绑定所有值
            guangye.BindData(p_dtable, p_filter, p_flds);
            
            filter = " featurecode=" + guangye.GetControlValue(fld_1196_2);
            
			guangye.BindData(dtable,filter,flds);            
			
			if(Featuredata.Value != "")
			{
				string[] color = Featuredata.Value.ToString().Trim('|').Split('|');                
				if(color.Length > 0 )
				{
					string[] _color = color[0].ToString().Trim(',').Split(',');
					if(_color.Length > 0)
					{
						dstr1.Value = "#"+_color[1].ToString();//颜色控件的背景和值
                        dstr1.Attributes["style"] = "background-color:" + dstr1.Value;
					}
				}
			}
			
		}
        FeatureKind.Value = "2";
	}
}
public override void BeforeSave()
{
    Featurename.Value=fld_1196_1.Value;
    tid = (typecode.SelectedItem != null) ? typecode.SelectedItem.Value : "0";
    CheckMustAndFieldType();
    db.SqlString = "select 1 mocode from " + p_dtable + " where fld_1196_1='" + guangye.GetControlValue(fld_1196_1) + "' and mocode<>" + id;
    if (db.GetDataTable().Rows.Count > 0)
    {
        SetSESSION("alert", "已有重名河流！");
        Response.Redirect("execommand.aspx?mid=" + mid + "&pid=" + pid + "&id=" + id);
    }
    if (guangye.GetControlValue(Featuredata) != "")
    {
        Featuredata.Value = Featuredepth.Value + "," + dstr1.Value.Replace("#", "0x") + "," + dstr1.Value.Replace("#", "0x") + Featuredata.Value.Substring(Featuredata.Value.IndexOf('|'));//替换Featuredata的颜色
    }
    if (GetSESSION("alert") == "")
    {
        if (id != "0")
        {
            filter = " featurecode=" + guangye.GetControlValue(fld_1196_2); 
            fld_1196_2.Value = "@FeatureID";
            SetSESSION("sql", "Declare @FeatureID as int;If Not Exists (select featurecode from " + dtable + " where " + filter + ") begin  " + guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'FeatureCode';select @FeatureID=@@IDENTITY; end else select @FeatureID=featurecode from " + dtable + " where " + filter + "; " + guangye.GetUpdateSql(dtable, filter, flds, types) + ";" + guangye.GetUpdateSql(p_dtable, p_filter, p_flds, p_types));
        }
        else//新增
        {
            fld_1196_2.Value = "@FeatureID";
            SetSESSION("sql", "declare @FeatureID as int;" + guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'FeatureCode';select @FeatureID=@@IDENTITY;" + guangye.GetInsertSql(p_dtable, p_flds, p_types));
        }
    }

    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
    
}
</script>
<script>
function GetData(args)
{	
	var arrstr = args.toString().split(",");
	if(arrstr.length > 2)
	{
		if(window.document.form1.Featuredata != null)
		{			
			window.document.form1.Featuredata.value=args;
			window.document.form1.Featuredepth.value=arrstr[0];
		}
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
<input id="Featurename" type="hidden"  runat="server">
<input id="fld_1196_2" type="hidden"  runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr> 
        <td class="td_viewcontent_title" align="right">河流名称：</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="fld_1196_1" type="text" style="width:95%" maxlength="200" runat="server">
		<input id="FeatureKind" Value="2" type="hidden" runat="server"></td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">状态：</td>
        <td class="td_viewcontent_content">
        <select id="Featurestate" style="width:250px" runat="server">
			<option value="启用">启用</option>
            <option value="禁用">禁用</option>          
        </select></td>        
        <td class="td_viewcontent_title" align="right">简称：</td>
        <td class="td_viewcontent_content">
        <input id="Featurebrief" type="text" style="width:250px" title="地图上显示简称" maxlength="12" runat="server"></td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">数据：</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="Featuredata" type="hidden" runat="server">
        <input id="Featurex" type="hidden" runat="server">
        <input id="Featurey" type="hidden" runat="server">
        <table><tr><td>
		<input id="dataface" type="password" style="width:200px" title="请从地图获取数据" value="1111111111111111111111111111" readonly="true">
        </td><td >&nbsp;深度：</td><td >
        <input id="tmpdepth" type="hidden" value="0" runat="server">
		<input id="Featuredepth" type="text" style="width:60px" value="0" onmousedown="this.value=''" onmouseout="if(this.value=='') {this.value=tmpdepth.value}"  title="只能输入数字"  runat="server">
        </td><td>&nbsp;<a href="javascript:__doOpenMap('2',form1.fld_1196_2.value+'|'+form1.FeatureKind.value+'|'+form1.typecode.value)"><img src="images/getdata_.gif" border="0"></a>
        </td></tr></table>
        </td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">所属层：</td>
        <td class="td_viewcontent_content">
		<asp:DropDownList id="typecode" style="width:250px" runat="server"/></td>
        <td class="td_viewcontent_title" align="right">模式：</td>
        <td class="td_viewcontent_content">
        <select id="Featuremode" style="width:250px" runat="server">
            <option value="1">数据模式</option>
            <option value="2">底图模式</option>
            <option value="3">区位模式</option>
        </select>
        </td>
    </tr>
     <tr > 
        <td class="td_viewcontent_title" align="right">所属区域：</td>
        <td class="td_viewcontent_content">
		<asp:DropDownList id="areacode" style="width:250px" runat="server"/></td>
        <td class="td_viewcontent_title" align="right">选择颜色：</td>
        <td class="td_viewcontent_content"><input id="dstr1" type="text" readonly style="width:165px;" runat="server"><div id="div_color" style="position:absolute;"></div></td>
    </tr>   
<%--<script language="javascript" src="charts.js"></script>--%>
<script language="javascript">
<!--
	var cp1 = CreateColorControl( "div_color","colorpicker1","1",1,"<%=dstr1.Value.ToString().Replace("#","0x")%>");

	function colorpicker1_DoFSCommand(command, args)
	{
		if(command == "showcontrol")
		{
			showControl(cp1,args);
		}
		else if(command == "value")
		{
			//接收到选择的颜色值
			document.getElementById("dstr1").value = args;
			document.getElementById("dstr1").style.backgroundColor = args;
			closeControl(cp1);
		}
	}
	//-->
</script>
<SCRIPT LANGUAGE="VBScript">
Sub colorpicker1_FSCommand(ByVal cmd, ByVal args)
 call colorpicker1_DoFSCommand(cmd, args)
end sub
</SCRIPT>

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
