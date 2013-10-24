<!--数据管理-字段管理-排放口基本情况-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<!--
主表：gmis_mo_23
关联表：gmis_mo_17，关联条件：（gmis_mo_17.fld_17_1=gmis_mo_23.fld_23_3）;gmis_mo_29，关联条件：（gmis_mo_29.mocode in gmis_mo_23.fld_23_11）
-->
<script runat="server" language="C#">
string sortid, sortdir;
DataTable p_wrwdt ;
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//设置工具条,同时获取固定URL参数  
	sortid = GetQueryString("sortid", "");  //排序字段
    sortdir = GetQueryString("sortdir", "1");  //1降序，0升序
	tb_2.Visible=false;//新增按钮隐藏

	if (!IsPostBack)
	{
        //绑定排放口类型下拉框
		BindListControl(select_type, "mocode", "fld_54_1", "select mocode,fld_54_1 from gmis_mo_54", "-所有类型-");

		//绑定检索字段下拉框		
		select_field.Items.Add(new ListItem("-请选择-","0"));
		select_field.Items.Add(new ListItem("单位代码","1"));
        select_field.Items.Add(new ListItem("单位名称","2"));    	
		

		string h_type = "0",h_field = "0";//排放口类型，字段
		if (GetSESSION("filter") != "")
		{
			//使用正则表达式取出Session里的条件     
			Regex r;
			Match m;
		   
			r = new Regex(".*?type=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				h_type =  m.Result("${txt}");
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
		SetFilter(select_type, h_type);    
		SetFilter(select_field, h_field);
	}

	BindDataList();

}

/***************************************************************
函数名：BindDataList()
用途：绑定列表
变更人/日期:孙振宇  2009-4-28
***************************************************************/
private void BindDataList()
{	
	/*设置筛选条件*/

	int pagesize = GetListRows();//获取列表每页显示的记录数
	int fromcount = Convert.ToInt32(navindex) * pagesize;//计算已翻过页数的记录数
	string h_tablename = "gmis_mo_23 ";//数据表名称
	string h_orderstr = " order by fld_23_1 asc";//排序条件;

	if (sortid != "")
	{
		h_orderstr = " order by " + sortid + " " + ((sortdir == "1") ? " desc" : " asc");
	}
	else
	{
		sortid = "fld_23_1";
	}
	
	ArrayList al = new ArrayList();//列字段数组
	StringBuilder h_sb_head = new StringBuilder();//标题行
	StringBuilder h_sb_temp1 = new StringBuilder();//内容行
	StringBuilder h_sb_temp2 = new StringBuilder();//空行
	StringBuilder h_fsb = new StringBuilder();//SQL读取字段
	string h_fstr = "";//SQL条件
	
	al.Add(new string[] { "单位代码", "15%", "fld_23_3" });
	al.Add(new string[] { "单位名称", "22%", "fld_23_4" });
	al.Add(new string[] { "排放口代码", "17%", "fld_23_1" });
	al.Add(new string[] { "排放口名称", "23%", "fld_23_2" });
	al.Add(new string[] { "污染物名称", "15%", "" });
	h_sb_temp1.Append("<tr class=\"tr_listcontent\">\n<td><a href=\"getpage.aspx?aid=*&mid=*&id=*\">*</a></td>\n<td>*&nbsp;</td>\n<td>*&nbsp;</td>\n<td>*&nbsp;</td>\n<td><img src=\"images/icons/TB07.gif\" title=\"*\" style=\"cursor:hand\"></td>\n<td>*&nbsp;</td>\n</tr>\n");
	h_fsb.Append("'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode,fld_23_3,fld_23_4,fld_23_1,fld_23_2,'' as wrw,'' as btnstr,fld_23_11,(select mocode from gmis_mo_17 where fld_17_1=fld_23_3) as mcode,fld_23_9");
	h_sb_temp2.Append("<tr class=\"tr_listcontent\">\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n");
	

	h_sb_head.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"righttableline\"><tr class=\"tr_listtitle\" align=\"left\">");
	
	sortdir = (sortdir == "0") ? "1" : "0";
	string h_dirstr = "";//升降序字样
	string h_dirimg = "";//升降序图标
	foreach (string[] arr in al)
	{
		if (arr[2] == sortid)
		{
			h_dirstr = (sortdir == "0") ? "升序" : "降序";
			h_dirimg = (sortdir == "0") ? "<img src=\"images/asc.gif\" style=\"margin:3px\" title=\"升序\"/>" : "<img src=\"images/desc.gif\" style=\"margin:3px\" title=\"降序\" />";

			h_sb_head.Append("<td style=\"padding-top:3px;\"  width=\"" + arr[1] + "\" ><a href=\"list_23.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&sortid=" + StringUtility.StringToBase64(arr[2]) + "&sortdir=" + sortdir + "\" class=\"listtitle\"  title=\"" + arr[0] + h_dirstr + "\">" + arr[0] + "</a>" + h_dirimg + "</td>\n");
			
		}
		else
		{
			h_sb_head.Append("<td width=\"" + arr[1] + "\" ><a href=\"list_23.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&sortid=" + StringUtility.StringToBase64(arr[2]) + "&sortdir=" + sortdir + "\" class=\"listtitle\"  title=\"" + arr[0] + "\">" + arr[0] + "</a></td>\n");
		}
	}
	h_sb_head.Append("<td width=\"8%\">操作</td>\n</tr>\n");

	listtemphead.InnerHtml = h_sb_head.ToString();
	listtemp1.InnerHtml = h_sb_temp1.ToString();
	listtemp2.InnerHtml = h_sb_temp2.ToString();
	
	//添加所属区域筛选条件
	if (guangye.GetControlValue(select_type) != "" && guangye.GetControlValue(select_type) != "0")
	{
		h_fstr += " and fld_23_6 = "+guangye.GetControlValue(select_type)+"";
	}
	
	//添加字段筛选条件
	if (guangye.GetControlValue(key) != "" && guangye.GetControlValue(select_field) != "" && guangye.GetControlValue(select_field) != "0")
	{
		string h_field = (guangye.GetControlValue(select_field)=="1")?"fld_23_3":"fld_23_4";
		h_fstr += " and "+h_field+" like '%"+guangye.GetControlValue(key)+"%'";
	}

	//设置列表控件显示行数
	list.Rows = pagesize;

	//设置列表控件数据源
	list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + h_tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount,"+h_fsb.ToString()+" from " + h_tablename + "  where mocode in (select top " + (fromcount + pagesize) + "  mocode from " + h_tablename + " where 1=1 " + h_fstr + " " + h_orderstr + ") and mocode not in (select top " + fromcount + " mocode from " + h_tablename + " where 1=1 " + h_fstr + "" + h_orderstr + " ) " + h_fstr + " " + h_orderstr + " ";     

	p_wrwdt = db.GetDataTable(db.ConnStr,"select mocode,(select fld_1206_1 from gmis_mo_1206 where mocode = fld_29_2) as wrwname,fld_29_3 from gmis_mo_29");//获取所有注册已处理污染物
}

public override void BeforeOutput(DataTable dt, int rowi)
{	//处理当前页数据

	DataRow dr = dt.Rows[rowi];

	//获取污染物名称
	if(p_wrwdt != null && p_wrwdt.Rows.Count>0 && dr["fld_23_11"].ToString().Trim(';')!="")
	{
		string[] h_code = dr["fld_23_11"].ToString().Trim(';').Split(';');
		if (h_code.Length>0)
		{
			for (int i=0;i<h_code.Length;i++)
			{
				DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_code[i]+" and fld_29_3 = '"+dr["fld_23_3"].ToString()+"'");
				if(h_wrwdr.Length>0)
				{					
					dr["wrw"] += h_wrwdr[0]["wrwname"].ToString()+",";								
				}
			}
			dr["wrw"] = dr["wrw"].ToString().Trim(',');
		}
	}
	dr["btnstr"] += "<a href=\"edit_58.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pfkcode=" + StringUtility.StringToBase64(dr["fld_23_1"].ToString()) + "&dwcode=" + StringUtility.StringToBase64(dr["fld_23_3"].ToString()) + "&navindex=" + navindex + "\"><img src=\"images/icons/TB51.gif\" title=\"新增月报表\" align=\"absmiddle\" border=\"0\"></a>";//新增月报表
	
	if(dr["fld_23_9"].ToString()=="True")//判断是否监测
	{
		dr["btnstr"] += "<a href=\"edit_24.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/TB52.gif\" title=\"编辑废气排放口监测\" align=\"absmiddle\" border=\"0\"></a>";//编辑废水排放口监测
	}	
	
	dr["btnstr"] += "<a href=\"edit_25.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/TB53.gif\" title=\"编辑锅炉炉窑\" align=\"absmiddle\" border=\"0\"></a>";//编辑锅炉炉窑
	
	if (mua.IndexOf(";3;") != -1)
	{
		dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&pid=" + dr["mocode"].ToString() + "&mid=" + mid + "&id=" + dr["mcode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
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
//所属区域筛选
private void Change_Type(object sender, System.EventArgs e)
{
	CheckSelect();//执行查询	
}
/***************************************************************
函数名：CheckSelect()
用途：执行查询
变更人/日期:孙振宇  2009-4-28
***************************************************************/
private void CheckSelect()
{
	
	string h_fstr;//url参数
	h_fstr ="";

	if (guangye.GetControlValue(select_type) != "" && guangye.GetControlValue(select_type) != "0")
	{
		h_fstr = " and type='" + guangye.GetControlValue(select_type) + "'";
	}
	if(guangye.GetControlValue(select_field)!=""&&guangye.GetControlValue(select_field)!="0"&&guangye.GetControlValue(key)!="")
	{
		h_fstr += " and field='" + guangye.GetControlValue(select_field) + "' and key='" + guangye.GetControlValue(key) + "'";
	} 
	SetSESSION("filter", h_fstr);
	Response.Redirect("list_23.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&navindex=0&sortid=" + sortid + "&sortdir=" + sortdir + "");
}
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
        <!--选项卡-->
        <!--选项卡-->
        <!--操作工具条-->
        <!--#include file="toolbarleft.aspx"-->
		<!--排放口类型-->
		<td nowrap >
		   状态：<asp:DropDownList ID="select_type" AutoPostBack="true" OnSelectedIndexChanged="Change_Type" runat="server" >
			</asp:DropDownList>
		</td>
		<!--排放口类型-->
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
        <G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
            <G:Template id="listtemphead" type="head" runat="server">

			</G:Template>
            <G:Template id="listtemp1" runat="server">

			</G:Template>
            <G:Template id="listtemp2" runat="server">

			</G:Template>
            <G:NavStyle5 ID="NavStyle" PageUrl="getpage.aspx" runat="server"></G:NavStyle5>
        </G:ListTable>
        <!--动态生成结束-->
    </form>
</body>
</html>
