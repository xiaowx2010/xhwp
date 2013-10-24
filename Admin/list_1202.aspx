<!--企业信息,列表页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private string p_fstr = "";
private void Page_Load(object sender, System.EventArgs e)
{    
     
	mid = GetQueryString("mid", "0");
	navindex = GetQueryString("navindex", "0");
	if(!IsPostBack)
	{
		//绑定行政区域
		db.SqlString = "select mocode,fld_1201_1,fld_1201_2,fld_1201_3 from gmis_mo_1201 order by fld_1201_5 asc";
		DataTable idt = db.GetDataTable();
		select_area.Items.Add(new ListItem("全部","0"));
		string img="";
		foreach(DataRow dr in idt.Rows)
		{
			img="";
			for(int i=0;i<Convert.ToInt32(dr["fld_1201_2"]);i++)
			{
				img+=">";
			}
			select_area.Items.Add(new ListItem(img+dr["fld_1201_1"].ToString(),dr["mocode"].ToString()));			
		}		
		SetFilter(select_area,"0");
		
		//绑定行业类别
		db.SqlString = "select mocode,fld_1200_1,fld_1200_3,fld_1200_4 from gmis_mo_1200 order by fld_1200_6 asc";
		idt = db.GetDataTable();
		select_type.Items.Add(new ListItem("全部","0"));
		foreach(DataRow dr in idt.Rows)
		{
			img="";
			for(int i=0;i<Convert.ToInt32(dr["fld_1200_3"]);i++)
			{
				img+=">";
			}
			select_type.Items.Add(new ListItem(img+dr["fld_1200_1"].ToString(),dr["mocode"].ToString()));			
		}		
		SetFilter(select_type,"0");		
	   
		//绑定登记注册类型
		BindListControl(select_kind,"mocode","name","select mocode,fld_1157_1+'|'+fld_1157_2 as name from gmis_mo_1157","全部");
		SetFilter(select_kind,"0");		

		//绑定企业规模
		BindListControl(select_scale,"mocode","name","select mocode,fld_1162_1+'|'+fld_1162_2 as name from gmis_mo_1162","全部");
		SetFilter(select_scale,"0");	

	}
	
	ReadSession();
	BindDataList();
	
}
//按钮事件
private void Click_Toolbar(object sender, System.EventArgs e)
{
	string exeinfo = "";      
	string h_data = ((Guangye.WebApplication.Controls.Button)sender).Data;
	//重置条件
	if (h_data == "-1")
	{		
		txt_key.Value = "";
		SetFilter(select_field,"0");		
		SetFilter(select_area,"0");		
		SetFilter(select_type,"0");		
		SetFilter(select_kind,"0");		
		SetFilter(select_scale,"0");		
	}
	else if (h_data == "1")
	{
		Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("add")+"&mid="+mid+"&tid="+tid+"&pid="+pid+"");
	}
	else
	{
		string h_fstr = "";
		if(select_field.SelectedItem != null && select_field.SelectedItem.Value != "0" && txt_key.Value != "")
		{
			switch (select_field.SelectedItem.Value)
			{	
				case "1":
					h_fstr += " and fld_1202_1='"+txt_key.Value+"'";
					break;
				case "2":
					h_fstr += " and fld_1202_2='"+txt_key.Value+"'";
					break;
				case "3":
					h_fstr += " and fld_1202_3='"+txt_key.Value+"'";
					break;
				case "4":
					h_fstr += " and fld_1202_15='"+txt_key.Value+"'";
					break;			
			}
		}
		if(select_area.SelectedItem != null && select_area.SelectedItem.Value != "0")
		{
			h_fstr += " and fld_1202_4='"+select_area.SelectedItem.Value+"'";
		}
		if(select_type.SelectedItem != null && select_type.SelectedItem.Value != "0")
		{
			h_fstr += " and fld_1202_21='"+select_type.SelectedItem.Value+"'";
		}
		if(select_kind.SelectedItem != null && select_kind.SelectedItem.Value != "0")
		{
			h_fstr += " and fld_1202_17='"+select_kind.SelectedItem.Value+"'";
		}
		if(select_scale.SelectedItem != null && select_scale.SelectedItem.Value != "0")
		{
			h_fstr += " and fld_1202_19='"+select_scale.SelectedItem.Value+"'";
		}	
		SetSESSION("filter", h_fstr);        
                       
        Response.Redirect("list_1202.aspx?aid=bGlzdA==&mid="+mid+"&id="+id+"&navindex=0&pid="+pid);
	}
}

//获取搜索条件
private void ReadSession()
{
	//使用正则表达式取出Session里的条件     
	Regex r;
	Match m;
	
	r = new Regex(".*?fld_1202_1=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
	m = r.Match(GetSESSION("filter"));
	if (m.Success)
	{
		
		p_fstr += " and fld_1202_1 like '%"+m.Result("${txt}")+"%'";
	}
	r = new Regex(".*?fld_1202_2=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
	m = r.Match(GetSESSION("filter"));
	if (m.Success)
	{		
		p_fstr += " and fld_1202_2 like '%"+m.Result("${txt}")+"%'";
	}
	r = new Regex(".*?fld_1202_3=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
	m = r.Match(GetSESSION("filter"));
	if (m.Success)
	{
		p_fstr += " and fld_1202_3 like '%"+m.Result("${txt}")+"%'";
	}
	r = new Regex(".*?fld_1202_15=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
	m = r.Match(GetSESSION("filter"));
	if (m.Success)
	{
		p_fstr += " and fld_1202_15 like '%"+m.Result("${txt}")+"%'";
	}
	r = new Regex(".*?fld_1202_4=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
	m = r.Match(GetSESSION("filter"));
	if (m.Success)
	{
		p_fstr += " and fld_1202_4 = "+m.Result("${txt}")+"";
	}
	r = new Regex(".*?fld_1202_21=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
	m = r.Match(GetSESSION("filter"));
	if (m.Success)
	{
		p_fstr += " and substring(fld_1202_20,0,3) = '"+m.Result("${txt}")+"'";
	}
	r = new Regex(".*?fld_1202_17=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
	m = r.Match(GetSESSION("filter"));
	if (m.Success)
	{
		p_fstr += " and fld_1202_17 = "+m.Result("${txt}")+"";
	}
	r = new Regex(".*?fld_1202_19=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
	m = r.Match(GetSESSION("filter"));
	if (m.Success)
	{		
		p_fstr += " and fld_1202_19 = "+m.Result("${txt}")+"";
	}
	//Response.Write(p_fstr);
}
//绑定列表
private void BindDataList()
{
	int pagesize = GetListRows();//获取列表每页显示的记录数
    int fromcount = Convert.ToInt32(navindex) * pagesize;//计算已翻过页数的记录数
    list.Rows = pagesize;
	list.SqlStr = "declare @allcount int;select @allcount=count(1) from gmis_mo_1202 where 1=1 " + p_fstr + " ;select @allcount as allcount,'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_1202_1,fld_1202_2,fld_1202_3,fld_1202_15,'' as btnstr from gmis_mo_1202 where mocode in (select top " + (fromcount + pagesize) + " mocode from gmis_mo_1202 where 1=1 " + p_fstr + " order by mocode desc) and mocode not in (select top " + fromcount + " mocode from gmis_mo_1202 where 1=1 " + p_fstr + " order by  mocode desc)" + p_fstr + " order by  mocode desc";
	//Response.Write("declare @allcount int;select @allcount=count(1) from gmis_mo_1202 where 1=1 " + p_fstr + " ;select @allcount as allcount,'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_1202_1,fld_1202_2,fld_1202_3,fld_1202_15,'' as btnstr from gmis_mo_1202 where mocode in (select top " + (fromcount + pagesize) + " mocode from gmis_mo_1202 where 1=1 " + p_fstr + " order by mocode desc) and mocode not in (select top " + fromcount + " mocode from gmis_mo_1202 where 1=1 " + p_fstr + " order by  mocode desc)" + p_fstr + " order by  mocode desc");
}
public override void BeforeOutput(DataTable dt, int rowi)
{	//处理当前页数据

	mua=";"+GetModuleActions(mid)+";";//模块权限    
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
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">选择字段:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:dropdownlist id="select_field" class="boxbline" style="width: 95%;" runat="server" >
		<asp:ListItem Value="0">-请选择-</asp:ListItem>
		<asp:ListItem Value="1">企业名称</asp:ListItem>
		<asp:ListItem Value="2">企业代码</asp:ListItem>
		<asp:ListItem Value="3">企业详细地址</asp:ListItem>
		<asp:ListItem Value="4">法人姓名</asp:ListItem>
		</asp:dropdownlist>
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">关键字:</td>
		<td class="td_viewcontent_content">
		<input id="txt_key" class="boxbline" style="width:95%;" maxlength="250" runat="server" >
		</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">行政区域:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:dropdownlist id="select_area" class="boxbline" style="width: 95%;" runat="server"></asp:dropdownlist>
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">行业类别:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:dropdownlist id="select_type" class="boxbline" style="width: 95%;" runat="server"></asp:dropdownlist>
		</td>
	</tr>	
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">登记注册类型:</td>
		<td class="td_viewcontent_content">
		<asp:dropdownlist id="select_kind" class="boxbline" style="width: 95%;" runat="server"></asp:dropdownlist>
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">企业规模:</td>
		<td class="td_viewcontent_content">
		<asp:dropdownlist id="select_scale" class="boxbline" style="width: 95%;" runat="server"></asp:dropdownlist>
		</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td colspan="3" class="td_viewcontent_content">
		<table width="100%" border=0>
		<tr>
		<td nowrap><G:Button id="btn_search" type="toolbar" mode="on" icon="tb08" text="开始检索" onclick="Click_Toolbar" data="0" runat="server"></G:Button></td>
		<td style="padding-left:5px;" nowrap><G:Button id="btn_reset" type="toolbar" mode="on" icon="tb06" text="重置条件" onclick="Click_Toolbar" data="-1" runat="server"></G:Button></td>
		<td style="padding-left:5px;" nowrap><G:Button id="btn_newdataadd" type="toolbar" mode="on" icon="tb01" text="新增" onclick="Click_Toolbar" data="1" runat="server"></G:Button></td>
		<td style="padding-left:10px;width:100%" ><span id="alert" runat="server" style="color:red"></span></td>
		</tr>
		</table>
		</td>		
	</tr>
</table>
<G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
			<tr class="tr_listtitle">
				<td width="35%" align="left">
					企业名称</td>
				<td width="15%" align="left">
					企业代码</td>
				<td width="32%" align="left">
					企业详细地址</td>
				<td width="10%" align="left" nowrap>
					法人姓名</td>
				<td width="8%" align="center">
					操作</td>
			</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td class="tdpadd-LR-3">
				<a href="view_1202.aspx?aid=*&mid=*&id=*&navindex=*" title="查看明细">*</a>&nbsp;</td>
			<td>
				*&nbsp;</td>
			<td>
				*&nbsp;</td>
			<td>
				*&nbsp;</td>
			<td class="tdpadd-icon" align="center">
				*&nbsp;</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
		</tr>
	</G:Template>
	 <G:NavStyle5 ID="NavStyle" PageUrl="list_1202.aspx" runat="server"></G:NavStyle5>
</G:ListTable>

<!--动态生成html,结束-->
</form>
</body>
</html>
