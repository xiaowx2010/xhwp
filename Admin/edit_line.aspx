<!--线路数据,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string p_color = "";
private void Page_Load(object sender, System.EventArgs e)
{    
	mid = GetQueryString("mid","0");
	tid = GetQueryString("tid","0");
	id = GetQueryString("id","0");
    SetToolBar();//设置工具条,同时获取固定URL参数    

    
    dtable = "gmis_Feature";
    filter = "Featurecode=" + id;
    flds = new string[] { "Featurename", "Featurebrief", "typecode", "Featuremode", "Featurex", "Featurey", "Featuredata", "Featuredepth", "Featurestate", "Featuredesc", "FeatureKind" };
    mflds = new string[] { "线路名|Featurename", "简称|Featurebrief" };
    types = "00111101001";
    
	if (!IsPostBack) 
	{
		//先绑定列表
		BindListControl(typecode,"typecode","typename","select typecode,typename from gmis_type where typekind='线路'");	
		dstr1.Value = "ff0000";
		if(id != "0")
		{
			//绑定所有值
			guangye.BindData(dtable,filter,flds);
			tmpdepth.Value=Featuredepth.Value;
			string FWidth="1";
			if(Featuredata.Value.Length>0)
			{
				FWidth=Featuredata.Value.Substring(0,1);
				string[] color = Featuredata.Value.ToString().Trim('|').Split('|');
				if(color.Length > 0 )
				{
					string[] _color = color[0].ToString().Trim(',').Split(',');
					if(_color.Length > 1)
					{
						dstr1.Value = _color[1].ToString();
						dstr1.Attributes["style"] = "background-color:" + _color[1].ToString();
					}
				}
			}
			SetFilter(Featurewidth,FWidth.ToString());//绑定线宽
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
		if(Featuredata.Value.Trim() != "" && dstr1.Value.Trim() != "" && Featuredata.Value.IndexOf('|') > 0)//有ID
		{
			Featuredata.Value = Featurewidth.SelectedItem.Value + "," + dstr1.Value + "," + dstr1.Value + Featuredata.Value.Substring(Featuredata.Value.IndexOf('|'));
		}
		else//新增
		{
			Featuredata.Value = Featurewidth.SelectedItem.Value + "," + dstr1.Value + "," + dstr1.Value + '|';
		}
		if(id == "0" && Featurename.Value.Trim() != "")
		{
			SqlDB db = new SqlDB();
			db.SqlString = "select * from gmis_Feature where Featurename='"+Featurename.Value.Trim()+"'";
			if(db.GetDataTable().Rows.Count>0)
			{
				Session["alert"] = "已有重名线路！";
				Response.Redirect("execommand.aspx?mid="+mid+"&pid="+pid+"&id="+id);
			}
		}
	}
</script>
<script>
function GetData(args)
{		
	var arrstr = args.toString().split("&");
	if(window.document.form1.Featuredata != null)
	{			
		window.document.form1.Featuredata.value=arrstr[1];
		window.document.form1.Featuredepth.value=arrstr[0];
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
        <td  class="td_viewcontent_title"  align="right">线路名：</td>
        <td  class="td_viewcontent_content" colspan="3">
        <input id="Featurename" type="text" style="width:95%"  runat="server"></td>
		<input id="FeatureKind" Value="3" type="hidden" runat="server">
    </tr>
    <tr> 
        <td class="td_viewcontent_title"  align="right">状态：</td>
        <td class="td_viewcontent_content">
        <select id="Featurestate" style="width:250px" runat="server">
            <option value="0">启用</option>
            <option value="-1">禁用</option>
            <option value="1">隐藏</option>
        </select></td>        
        <td  class="td_viewcontent_title"  align="right">简称：</td>
        <td  class="td_viewcontent_content">
        <input id="Featurebrief" type="text" style="width:250px" title="地图上显示简称" maxlength="12" runat="server"></td>
    </tr>
    <tr> 
        <td  class="td_viewcontent_title"  align="right">数据：</td>
        <td  class="td_viewcontent_content" colspan="3">
        <input id="Featuredata" type="hidden" runat="server">
        <input id="Featurex" type="hidden" runat="server">
        <input id="Featurey" type="hidden" runat="server">
        <table><tr><td>
		<input id="dataface" type="password" style="width:200px" title="请从地图获取数据" value="1111111111111111111111111111" readonly="true">
        </td><td >&nbsp;深度：</td><td >
		<input id="tmpdepth" type="hidden" value="0" runat="server">
		<input id="Featuredepth" type="text" style="width:60px" value="0" onmousedown="this.value=''" onmouseout="if(this.value=='') {this.value=tmpdepth.value}"  title="只能输入数字"  runat="server">
        </td><td>&nbsp;<a href="javascript:__doOpenMap('3',<%=id%>+'|'+form1.FeatureKind.value+'|'+form1.typecode.value)"><img src="images/getdata_.gif" border="0"></a>
       </td></tr></table>
        </td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title"  align="right">所属层：</td>
        <td class="td_viewcontent_content">
		<asp:DropDownList id="typecode" style="width:250px" runat="server"/></td>
        <td class="td_viewcontent_title"  align="right">模式：</td>
        <td class="td_viewcontent_content">
        <select id="Featuremode" style="width:250px" runat="server">
            <option value="1">数据模式</option>
            <option value="2">底图模式</option>
            <option value="3">区位模式</option>
        </select>
        </td>
    </tr>
    <tr>
    <td class="td_viewcontent_title"  align="right">线宽：</td>
    <td class="td_viewcontent_content" >
         <asp:DropDownList id="Featurewidth" style="width:50px" runat="server">
             <asp:ListItem>1</asp:ListItem>
             <asp:ListItem>2</asp:ListItem>
             <asp:ListItem>3</asp:ListItem>
             <asp:ListItem>4</asp:ListItem>
             <asp:ListItem>5</asp:ListItem>             
        </asp:DropDownList>
      </td>
      <td class="td_viewcontent_title" >选择颜色：</td>
		<td class="td_viewcontent_content" ><input id="dstr1" type="text" readonly="true" style="width:165px" runat="server"><div id="div_color" style="position:absolute;"></div></td>
    </tr>
    <script language="javascript">
<!--
	var cp1 = CreateColorControl( "div_color","colorpicker1","1",1,"<%=dstr1.Value.Replace("#","0x")%>");

	function colorpicker1_DoFSCommand(command, args)
	{
		if(command == "showcontrol")
		{
			showControl(cp1,args);
		}
		else if(command == "value")
		{//接收到选择的颜色值
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
