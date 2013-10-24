<!--污水排放口污染物月排放情况,列表页-->
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
	tb_2.Visible=false;//隐藏新增按钮
	
	if (!IsPostBack)
	{
        int h_yearstr = Convert.ToInt32(DateTime.Now.Year);
		//绑定年份下拉框
		for (int i=h_yearstr-10;i<h_yearstr+10;i++)
		{
			select_year.Items.Add(new ListItem(i.ToString(),i.ToString()));
		}
		select_year.Items.Add(new ListItem("-全部-","0"));

		//绑定月份下拉框
		for (int i=1;i<13;i++)
		{
			select_month.Items.Add(new ListItem(i.ToString().PadLeft(2,'0'),i.ToString()));
		}
		select_month.Items.Add(new ListItem("-全部-","0"));
		
		//绑定检索字段下拉框		
		select_field.Items.Add(new ListItem("-请选择-","0"));
		select_field.Items.Add(new ListItem("排放口代码","1"));
        select_field.Items.Add(new ListItem("排放口名称","2"));    	
		

		string h_year = "0",h_month = "0",h_field = "0";//年份，月份，字段
		if (GetSESSION("filter") != "")
		{
			//使用正则表达式取出Session里的条件     
			Regex r;
			Match m;
		   
			r = new Regex(".*?year=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				h_year =  m.Result("${txt}");
			}		

			r = new Regex(".*?month=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				h_month =  m.Result("${txt}");
			}

			r = new Regex(".*?field=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				h_field =  m.Result("${txt}");
			}		

			r = new Regex(".*?key=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				guangye.SetControlValue(key, m.Result("${txt}")); 
			}
		} 
		SetFilter(select_year, h_year);    
		SetFilter(select_month, h_month);    
		SetFilter(select_field, h_field);
	}
	
	string h_fstr = ""; //筛选条件 

	//添加年份筛选条件
	if (guangye.GetControlValue(select_year) != "" && guangye.GetControlValue(select_year) != "0")
	{
		h_fstr += " and fld_19_3 = "+guangye.GetControlValue(select_year)+"";
	}

	//添加月份筛选条件
	if (guangye.GetControlValue(select_month) != "" && guangye.GetControlValue(select_month) != "0")
	{
		h_fstr += " and fld_19_4 = "+guangye.GetControlValue(select_month)+"";
	}
	
	//添加字段筛选条件
	if (guangye.GetControlValue(key) != "" && guangye.GetControlValue(select_field) != "" && guangye.GetControlValue(select_field) != "0")
	{
		string h_field = (guangye.GetControlValue(select_field)=="1")?"fld_19_2":"(select fld_53_2 from gmis_mo_53 where fld_53_1=fld_19_2)";
		h_fstr += " and "+h_field+" like '%"+guangye.GetControlValue(key)+"%'";
	}

	list.SqlStr = "select  '" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode,fld_19_3,fld_19_4,fld_19_2,'' btnstr from gmis_mo_19 where 1=1 "+h_fstr+" order by fld_19_3 desc,fld_19_4 desc";
	list.Rows = GetListRows();
}
public override void BeforeOutput(DataTable dt, int rowi)
{	//处理当前页数据

	DataRow dr = dt.Rows[rowi];
	if (mua.IndexOf(";3;") != -1)
	{
		dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
	}

	if (mua.IndexOf(";4;") != -1)
	{
		dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
	}

}

//按钮查询
private void Click_Seach(object sender, System.EventArgs e)
{   
	CheckSelect();//执行查询	
}
//年份、月份筛选
private void Change_Date(object sender, System.EventArgs e)
{
	CheckSelect();//执行查询	
}
/***************************************************************
函数名：CheckSelect()
用途：执行查询
变更人/日期:孙振宇  2009-4-29
***************************************************************/
private void CheckSelect()
{
	
	string h_fstr;//url参数
	h_fstr ="";

	if (guangye.GetControlValue(select_year) != "" && guangye.GetControlValue(select_year) != "0")
	{
		h_fstr = " and year='" + guangye.GetControlValue(select_year) + "'";
	}
	
	if (guangye.GetControlValue(select_month) != "" && guangye.GetControlValue(select_month) != "0")
	{
		h_fstr = " and month='" + guangye.GetControlValue(select_month) + "'";
	}
	if(guangye.GetControlValue(select_field)!=""&&guangye.GetControlValue(select_field)!="0"&&guangye.GetControlValue(key)!="")
	{
		h_fstr += " and field='" + guangye.GetControlValue(select_field) + "' and key='" + guangye.GetControlValue(key) + "'";
	} 
	SetSESSION("filter", h_fstr);
	Response.Redirect("list_19.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&navindex=0");
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
		<!--年份-->
		<td nowrap >
		   年份：<asp:DropDownList ID="select_year" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server" >
			</asp:DropDownList>
		</td>
		<!--年份-->
		<!--月份-->
		<td nowrap style="padding-left: 10px;">
		   月份：<asp:DropDownList ID="select_month" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server" >
			</asp:DropDownList>
		</td>
		<!--月份-->
		<td nowrap style="padding-left: 10px;">
			选择字段：<asp:DropDownList ID="select_field" runat="server" Width="120px">
			</asp:DropDownList>
		</td>
		<td nowrap style="padding-left: 10px;">
			关键字：<input id="key" runat="server" type="text" style="width: 120px;" onkeydown="javascript:{if(event.keyCode==13)__doPostBack('btn_seach$btn','');}" />
		</td>
		<td nowrap style="padding-left: 10px;">
			<G:Button id="btn_seach" type="toolbar" mode="on" icon="tb08" text="查询" onclick="Click_Seach"
				runat="server">
			</G:Button>
		</td>
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			<td >月排放情况</td>
			<td width="5%">操作</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td><a href="getpage.aspx?aid=*&mid=*&id=*" target="_blank">*年*月*排放口月排放情况</a></td>
			<td align="center">*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_19.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--动态生成html,结束-->
</form>
</body>
</html>
