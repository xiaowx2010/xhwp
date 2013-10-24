<!--线路数据,列表页-->
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
	mid = GetQueryString("mid","0");
    SetToolBar();//设置工具条,同时获取固定URL参数

    string h_tstr ="",h_astr="" ;	
	string h_fstr="";
	
	if(!IsSystemDeveloper())
	{
		if(Session["listtype"] != null && Session["listtype"].ToString() != "")
		{
			h_tstr = " and typecode in ("+Session["listtype"].ToString()+")";						
		}
		if(Session["listtype"] != null && Session["listarea"].ToString() != "")
		{
			h_astr = " and areacode in ("+Session["listarea"].ToString()+")";				
		}
	}
	if(tid != "0")
	{
		h_tstr += " and t.typecode="+tid;
	}
	if (!IsPostBack) 
	{	
		BindListControl(selectarea,"areacode","areaname","select areacode,areaname from gmis_area where areastate='启用'"+h_astr,"全部区域");				
		if(Session["areafilter"] == null || Session["areafilter"].ToString() == "")
		{
			SetFilter(selectarea,"0");
			Session["areafilter"] = (selectarea.SelectedItem != null)?selectarea.SelectedItem.Value:"0";					
		}
		else
		{
			SetFilter(selectarea,Session["areafilter"].ToString());
		}
		BindListControl(selecttype,"typecode","typename","select typecode,typename from gmis_type where typestate='启用' and typekind='线路'"+h_tstr,"所有图层");				
		if(Session["typefilter"] == null || Session["typefilter"].ToString() == "")
		{
			SetFilter(selecttype,"0");
			Session["typefilter"] = (selecttype.SelectedItem != null)?selecttype.SelectedItem.Value:"0";					
		}
		else
		{
			SetFilter(selecttype,Session["typefilter"].ToString());
		}
	}		
					
	if(selectarea.SelectedItem != null && selectarea.SelectedItem.Value != "" && selectarea.SelectedItem.Value != "0" )
		h_fstr += " And f.areacode="+selectarea.SelectedItem.Value;	
	if(selecttype.SelectedItem != null && selecttype.SelectedItem.Value != "" && selecttype.SelectedItem.Value != "0" )
		h_fstr += " And f.typecode="+selecttype.SelectedItem.Value;	
	if(keyword.Value.Trim()!="")
		h_fstr+=" And Featurename like '%"+keyword.Value.Trim()+"%'";
    int pagesize = GetListRows();//每页行数；
    int fromcount = Convert.ToInt32(navindex) * pagesize;//当前记录数
    string orderbystr = " order by Featurecode";//获取排序条件，假设方法已定义；
    string tablename = "gmis_Feature f Left Outer Join gmis_type t on f.typecode=t.typecode Left Outer Join gmis_area a on f.areacode=a.areacode";//获取数据表名称，假设方法已定义；	
    list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + tablename + " where (featurekind=3 or typekind='线路') " + h_fstr + h_tstr + h_astr + ";select @allcount as allcount,'" + StringUtility.StringToBase64("view") + "'," + mid + "," + tid + ",Featurecode," + navindex + ",Featurename,Featurebrief,t.typename,a.areaname,case when Featurestate = 0 then '启用' when Featurestate = -1 then '禁用' when Featurestate = 1 then '隐藏' else '&nbsp;' end as Featurestate,'' as btnstr,f.typecode from " + tablename + " where (featurekind=3 or typekind='线路') " + h_fstr + h_tstr + h_astr + " and Featurecode not in (select top " + fromcount + " Featurecode from " + tablename + " where (featurekind=3 or typekind='线路') " + h_fstr + h_tstr + h_astr + orderbystr + ")  and Featurecode in (select top " + (fromcount + pagesize) + " Featurecode from " + tablename + " where (featurekind=3 or typekind='线路') " + h_fstr + h_tstr + h_astr + orderbystr + ")" + orderbystr;
    list.Rows = pagesize;
}
	public override void BeforeOutput(DataTable dt,int rowi)
	{	
		//处理当前页数据
		DataRow dr=dt.Rows[rowi];
		if(mua.IndexOf(";3;") != -1 )
		{
			dr["btnstr"] += "<a href=\"getpage.aspx?aid="+StringUtility.StringToBase64("edit")+"&mid="+mid+"&tid="+tid+"&id="+dr["Featurecode"].ToString()+"&navindex="+navindex+"\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
		}
		if(mua.IndexOf(";4;") != -1)
		{
			dr["btnstr"] += "<a href=\"javascript:if(confirm('确认要删除吗！')){document.location='getpage.aspx?aid="+StringUtility.StringToBase64("delete")+"&mid="+mid+"&tid="+tid+"&id="+dr["Featurecode"].ToString()+"&navindex="+navindex+"';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
		}
	}	
	
	private void Filter_Change(object sender, System.EventArgs e)
	{			
		Session["areafilter"] = (selectarea.SelectedItem != null)?selectarea.SelectedItem.Value:"0";
		Session["typefilter"] = (selecttype.SelectedItem != null)?selecttype.SelectedItem.Value:"0";
		list.Nav.PageIndex = 0;
		Response.Redirect("list_line.aspx?aid=list&mid="+mid);
	}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
<td>
	<table id="tb_8" visible="false" runat="server">
		<tr>
			<td class="textstrong-12px" nowrap>图层:</td>
			<td>
				<asp:DropDownList id="selecttype" autopostback="true" OnSelectedIndexChanged="Filter_Change"  style="width:100px" runat="server"/>
			</td>
		</tr>
	</table>
</td>
<td>
	<table id="tb_9" visible="false" runat="server">
		<tr>
			<td class="textstrong-12px" nowrap>区域:</td><td>
				<asp:DropDownList id="selectarea" autopostback="true" OnSelectedIndexChanged="Filter_Change"  style="width:100px" runat="server"/>
			</td>
		</tr>
	</table>
</td>
<td>
	<table id="tb_6" visible="false" runat="server">
		<tr>
			<td class="textstrong-12px" nowrap><input id="keyword" type="text" style="width:96px" maxlength="100" runat="server"></td>
			<td><G:Button id="search_btn" type="toolbar" mode="on" icon="" text="查询" Style="padding-top:2px;" runat="server"></G:Button></td>
		</tr>
	</table>
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
			<td>&nbsp;</td> 
			<td width="38%" align="left">线路名称</td>
			<td width="22%" align="left">简称</td>
			<td width="15%" align="left">所属数据层</td>
			<td width="10%" align="left">所属区域</td>
			<td width="9%">状态</td>
			<td width="7%">操作</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td> 
			<td class="tdpadd-LR-3"><a title="查看明细" href="getpage.aspx?aid=*&mid=*&tid=*&id=*&navindex=*">*</a></td>
			<td class="tdpadd-LR-3">&nbsp;*</td>
			<td class="tdpadd-center-3">&nbsp;*</td>
			<td class="tdpadd-center-3">&nbsp;*</td>
			<td class="tdpadd-icon">&nbsp;*</td>
			<td class="tdpadd-icon">&nbsp;*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_line.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--动态生成html,结束-->
</form>
</body>
</html>
