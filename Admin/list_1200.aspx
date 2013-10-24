<!--行业代码（统一）,列表页-->
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
    string h_fstr = "";

    if (!IsPostBack)
    {
        BindListControl(fld_1200_3, "fld_1200_3", "fld_1200_3_index", "select distinct fld_1200_3,('第 '+cast(fld_1200_3 as varchar(10))+' 级') as fld_1200_3_index from gmis_mo_1200","全部层级");
        
		string h_levelstr = "0";
		if (GetSESSION("filter") != "")
		{
			//使用正则表达式取出Session里的条件     
			Regex r;
			Match m;
		   
			r = new Regex(".*?key=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				guangye.SetControlValue(key,m.Result("${txt}"));
			}	
			
			r = new Regex(".*?level=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				h_levelstr = m.Result("${txt}");				
			}
		}
		SetFilter(fld_1200_3, h_levelstr);
    }

    if (fld_1200_3.SelectedItem != null && fld_1200_3.SelectedItem.Value != "0")
    {
        h_fstr += " and fld_1200_3=" + fld_1200_3.SelectedItem.Value; 
    }
	if (guangye.GetControlValue(key) != "")
	{
		h_fstr += " and fld_1200_1 like '%"+guangye.GetControlValue(key)+"%'" ;
	}
    int pagesize = GetListRows();//获取列表每页显示的记录数
    int fromcount = Convert.ToInt32(navindex) * pagesize;//计算已翻过页数的记录数
    list.Rows = pagesize;
    
    list.SqlStr = "declare @allcount int;select @allcount=count(1) from gmis_mo_1200 where 1=1 " + h_fstr + " ;select   @allcount as allcount,'' as preTopic,'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_1200_1,(case fld_1200_2 when '1' then '工业源' when '2' then '生活源' when '3' then '集中式污染治理设施' else '' end),'&nbsp;' as btnstr,fld_1200_3 from gmis_mo_1200 where mocode in (select top " + (fromcount + pagesize) + " mocode from gmis_mo_1200 where 1=1 " + h_fstr + " order by fld_1200_6) and mocode not in (select top " + fromcount + " mocode from gmis_mo_1200 where 1=1 " + h_fstr + " order by fld_1200_6)" + h_fstr + " order by fld_1200_6";
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

    for (int i = 1; i < Convert.ToUInt32(dr["fld_1200_3"]); i++)
    {
        dr["preTopic"] = "&nbsp;&nbsp;&nbsp;&nbsp;" + dr["preTopic"].ToString();
    }
}


    private void Change_Level(object sender, System.EventArgs e)
    {
        string h_filter = "";
		if (guangye.GetControlValue(key) != "")
        {
			h_filter += " and key='" + guangye.GetControlValue(key) + "'";
		}
		if (guangye.GetControlValue(fld_1200_3) != "0")
        {
            h_filter += " and level='" + guangye.GetControlValue(fld_1200_3) + "'";
        }
		SetSESSION("filter", h_filter);
    }
	private void Click_Seach(object sender, System.EventArgs e)
    {
		string h_filter = "";
		if (guangye.GetControlValue(key) != "")
        {
			h_filter += " and key='" + guangye.GetControlValue(key) + "'";
		}
		if (guangye.GetControlValue(fld_1200_3) != "0")
        {
            h_filter += " and level='" + guangye.GetControlValue(fld_1200_3) + "'";
        }
		SetSESSION("filter", h_filter);
	}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<td><asp:DropDownList runat="server" ID="fld_1200_3" Width="160" AutoPostBack="true" OnSelectedIndexChanged="Change_Level"></asp:DropDownList></td>
			<td nowrap style="padding-left: 10px;">
				行业名称：<input id="key" runat="server" type="text" style="width: 100px;" onkeydown="javascript:{if(event.keyCode==13)__doPostBack('btn_seach$btn','');}" />
			</td>
			<td nowrap style="padding-left: 10px;">
				<G:Button id="btn_seach" type="toolbar" mode="on" icon="tb08" text="查询" onclick="Click_Seach"
					runat="server">
				</G:Button>
			</td>
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			<td >行业名称</td>
			<td >属性</td>
			<td width="5%" align="center">操作</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td>*<a href="view_1200.aspx?aid=*&mid=*&id=*&navindex=*" title="查看明细">*&nbsp;</a></td>
			<td>*</td>
			<td align="center">*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_1200.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--动态生成html,结束-->
</form>
</body>
</html>
