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
	if(!IsSystemDeveloper())
	{
		Response.Redirect("getpage.aspx");
	}
 
    SetToolBar();//设置工具条,同时获取固定URL参数   
    
     
    
    if(id!="0")
    {
        SetPageParameter(null);
        SetPageParameter("id",id);
    }
    
    string h_fstr = "";
    
    if(GetPageParameter("id","0")!="0")
    {
        tb_selectlevel.Visible=false;
        tb_searchkey.Visible=false;
        tb_viewall.Visible=true;
        h_fstr = " and moduleindex like '%'+(select moduleindex from gmis_module where modulecode ="+GetPageParameter("id","0")+")+'%'";
    }
    else
    {
        if (!IsPostBack)
        {        
            BindListControl(selectlevel, "modulelevel", "levelname", "select distinct modulelevel,'第'+Cast(modulelevel as varchar(50))+'级' as levelname from gmis_module where modulestate=0 and modulelevel<>0","全部模块");
            SetFilter(selectlevel,GetPageParameter("level","0"));
            searchkey.Value=GetPageParameter("key","");
        }
        
        string h_level=guangye.GetControlValue(selectlevel);
        string h_key=guangye.GetControlValue(searchkey);
        if (h_level != "" && h_level!="0" && id=="0")
        {
            h_fstr = " and modulelevel="+h_level+"";
        }
        if(h_key.Length>0 && id=="0")
        {
            h_fstr += " and modulename like '%"+searchkey.Value+"%'";
        } 
    
    }
      
    list.Rows = GetListRows();
   
    list.SqlStr = GetListSQL(Convert.ToInt32(navindex) * list.Rows, list.Rows,h_fstr);
}
private string GetListSQL(int fromcount,int pagerows,string fstr)
{
    return "declare @allcount int;select @allcount=count(1) from gmis_module where 1=1 "+fstr+";select @allcount as allcount,'"+StringUtility.StringToBase64("view")+"',"+mid+",modulecode,"+navindex+",modulename,(select t1.modulename from gmis_module t1 where t1.modulecode=t2.moduleuppercode) as moduleuppername,modulebrief,case modulestate when 0 then '启用'  when 1 then '禁用' else '禁用' end ,moduleurl,'&nbsp;' as btnstr,modulelevel from gmis_module t2  where 1=1 "+fstr+" and modulecode not in (select top " + fromcount + " modulecode from gmis_module where 1=1 "+fstr+" order by moduleindex) and modulecode in (select top " + (fromcount+pagerows) + " modulecode from gmis_module where 1=1 "+fstr+" order by moduleindex) order by moduleindex";
}

private void Click_ViewAll(object sender, System.EventArgs e)
{
    Response.Redirect("getpage.aspx?mid="+mid);
}

private void Filter_Change(object sender, System.EventArgs e)
{
    SetPageParameter("level",guangye.GetControlValue(selectlevel));
    SetPageParameter("key",guangye.GetControlValue(searchkey));
    Response.Redirect("list_module.aspx?mid="+mid);
}
public override void BeforeOutput(DataTable dt, int rowi)
{
    DataRow dr = dt.Rows[rowi]; 
    if(!Convert.IsDBNull(dr["modulelevel"]))
    {
        for(int i=1;i<Convert.ToInt32(dr["modulelevel"]);i++)
        {
            dr["modulename"]="&nbsp;&nbsp;&nbsp;&nbsp;"+dr["modulename"].ToString();
        }  
    }
    
    dr["btnstr"]+= "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&id=" + dr["modulecode"].ToString() + "\"><img src=\"images/icons/tb16.gif\" title=\"显示本级及所有下级模块\" align=\"absmiddle\" border=\"0\"></a>";
    
    if (mua.IndexOf(";3;") != -1)
    {
        dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["modulecode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
    }

    if (mua.IndexOf(";4;") != -1)
    {
        dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["modulecode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
    }

    string h_name=GetModuleTableName(dr["modulecode"].ToString());
    if(CheckSysObject(h_name))
    {
        dr["moduleurl"]=dr["moduleurl"].ToString()+" ["+GetFieldData("select count(1) from "+h_name+"")+"]";
    }
    
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<td id="tb_selectlevel" style="padding-left:5px;" runat="server">
				<table  border="0" cellspacing="0" cellpadding="0" ID="Table1" align=left>
				<tr>
					<td >
						<asp:DropDownList ID="selectlevel" style="width:150px;" AutoPostBack="true" OnSelectedIndexChanged="Filter_Change" runat="server">
						</asp:DropDownList>
					</td>
				</tr>
				</table>
			</td>
			<td id="tb_searchkey" style="padding-left:5px;" runat="server">
				<table  border="0" cellspacing="0" cellpadding="0" ID="Table2" align=left>
				<tr>
					<td  nowrap><input type="text" id="searchkey" runat="server" style="width:150px;" /></td>
					<td  nowrap style="padding-left:5px;"><G:Button id="btn_search" type="toolbar" mode="on" icon="tb08" text="查询" onclick="Filter_Change" runat="server"></G:Button> </td>
				</tr>
				</table>
			</td>
			<td id="tb_viewall" visible="false" style="padding-left:5px;" runat="server">
				<table  border="0" cellspacing="0" cellpadding="0" ID="Table3" align=left>
				<tr>
					<td  nowrap style="padding-left:5px;"><G:Button id="btn_viewall" type="toolbar" mode="on" icon="up" text="列出所有模块" onclick="Click_ViewAll" runat="server"></G:Button> </td>
				</tr>
				</table>
			</td>
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	<!--#include file="toolbarright.aspx"-->   
<!--操作工具条-->
<G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
<G:Template id="listtemphead" type="head" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
  <tr class="tr_listtitle">
    <td>&nbsp;</td>
    <td width="30%" align="left" >模块名</td>
    <td width="25%" align="left" >直属上级</td>
    <td width="10%" align="left" >标识</td>
    <td width="10%" align="left" >状态</td>
    <td width="15%" align="left" >原始表名[记录数]</td>
    <td width="10%" align="center" >操作</td>
  </tr>
  </G:Template>
  <G:Template id="listtemp1" runat="server">
  <tr class="tr_listcontent">
    <td>&nbsp;</td>
    <td align="left" ><a href="view_module.aspx?aid=*&mid=*&id=*&navindex=*" title="查看明细">*</a></td>
    <td align="left" >*&nbsp;</td>    
    <td align="left" >*&nbsp;</td>  
    <td align="left" >*</td>    
    <td align="left" >*&nbsp;</td>  
    <td align="center" >*</td> 
  </tr>
  </G:Template>
  <G:Template id="listtemp2" runat="server">
  <tr  class="tr_listcontent">
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr> 
 </G:Template>
 <G:NavStyle5 ID="NavStyle" PageUrl="list_module.aspx" runat="server"></G:NavStyle5>
</G:ListTable>
</form>
</body>
</html>