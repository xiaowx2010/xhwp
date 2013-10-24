<!--污水口监测数据,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->

<!--
主表：gmis_mo_18
关联表：gmis_mo_53，关联条件：（gmis_mo_53.fld_53_1=gmis_mo_18.fld_18_1；gmis_mo_53.fld_53_2=gmis_mo_18.fld_18_2；gmis_mo_53.fld_53_3=gmis_mo_18.fld_18_8）
-->
<script language="C#" runat="server">
string p_sonmua;
string p_companyname;
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//设置工具条,同时获取固定URL参数  
	pid = GetQueryString("pid", "0");//子模块的mocode
	tb_2.Visible=false;//隐藏原有新增按钮
	tb_save.Visible=false;//隐藏原有保存按钮
	btn_clear.Visible=false;//隐藏原有清空按钮
	btn_backlist.Visible=false;//隐藏原有返回列表按钮 
    
	p_sonmua = ";" + GetModuleActions("18").Trim(';') + ";";//子模块权限
   
	/*模块编辑设置*/
	dtable = "gmis_mo_18";
	filter = " mocode=" + pid;
	flds = new string[] { "fld_18_1", "fld_18_2", "fld_18_3", "fld_18_4", "fld_18_7", "fld_18_8"};
	types = "000000";
	/*模块编辑设置*/	
	if(!IsPostBack)
	{
		for (int i = 0; i < 24; i++)
        {
            hour_18_4.Items.Add(new ListItem(i.ToString().PadLeft(2, '0'), i.ToString()));
		}
        for (int i = 0; i < 60; i++)
        {
            minute_18_4.Items.Add(new ListItem(i.ToString().PadLeft(2, '0'), i.ToString()));
        }
		guangye.SetControlValue(fld_18_3, DateTime.Today.ToShortDateString());
		if(pid != "0")
		{			
			guangye.BindData(dtable, filter, flds);		
			if (guangye.GetControlValue(fld_18_3)!="")
			{	
				guangye.SetControlValue(fld_18_3,Convert.ToDateTime(guangye.GetControlValue(fld_18_3)).ToShortDateString());
			}
			if (guangye.GetControlValue(fld_18_4)!="")
			{
				guangye.SetControlValue(day_18_4,Convert.ToDateTime(guangye.GetControlValue(fld_18_4)).ToShortDateString());
				SetFilter(hour_18_4, Convert.ToDateTime(guangye.GetControlValue(fld_18_4)).Hour.ToString());
				SetFilter(minute_18_4, Convert.ToDateTime(guangye.GetControlValue(fld_18_4)).Minute.ToString());
			}			
		}		
	}
	view.SqlStr = "select fld_53_3,fld_53_4,fld_53_1,fld_53_2,'' as wrw,fld_53_11 from gmis_mo_53 where mocode=" + id;
	DataTable dt = view.DataTable;
	if(dt.Rows.Count>0)
	{
		p_companyname = dt.Rows[0]["fld_53_4"].ToString();//获取单位名称
		guangye.SetControlValue(fld_18_1,dt.Rows[0]["fld_53_1"].ToString()); 
		guangye.SetControlValue(fld_18_2,dt.Rows[0]["fld_53_2"].ToString()); 
		guangye.SetControlValue(fld_18_8,dt.Rows[0]["fld_53_3"].ToString()); 
		DataTable h_wrwdt = db.GetDataTable(db.ConnStr,"select mocode,(select fld_1205_1 from gmis_mo_1205 where mocode = fld_21_2) as wrwname from gmis_mo_21 where fld_21_3="+dt.Rows[0]["fld_53_3"].ToString()+"");//获取污染物
		//获取污染物名称
		if(h_wrwdt.Rows.Count>0 && dt.Rows[0]["fld_53_11"].ToString().Trim(';')!="")
		{
			string[] h_code = dt.Rows[0]["fld_53_11"].ToString().Trim(';').Split(';');
			if (h_code.Length>0)
			{
				for (int i=0;i<h_code.Length;i++)
				{
					DataRow[] h_wrwdr = h_wrwdt.Select("mocode="+h_code[i]+"");
					if(h_wrwdr.Length>0)
					{					
						dt.Rows[0]["wrw"] += h_wrwdr[0]["wrwname"].ToString()+",";								
					}
				}
				dt.Rows[0]["wrw"] = dt.Rows[0]["wrw"].ToString().Trim(',');
			}
		}
	}
	BindDataList();	
}

/***************************************************************
函数名：BindDataList()
用途：绑定列表
变更人/日期:孙振宇  2009-4-27
***************************************************************/
private void BindDataList()
{	
	string h_tablename = "gmis_mo_18";//数据表名称
	string h_orderstr = " order by fld_18_3 desc";//排序条件;	

	//设置列表控件数据源
	list.SqlStr = "select Convert(nvarchar(10),fld_18_3,120),fld_18_4,fld_18_7,'' as btnstr,mocode from " + h_tablename + "  where fld_18_1=(select fld_53_1 from gmis_mo_53 where mocode="+id+") " + h_orderstr + " ";


	//设置列表控件显示行数
	list.Rows = (list.DataTable.Rows.Count < 8) ? 8 : list.DataTable.Rows.Count;

}
//处理当前页数据，处理操作列显示的操作
public override void BeforeOutput(DataTable dt, int rowi)
{
	DataRow dr = dt.Rows[rowi];

	//判断对本模块是否有编辑权限，3代表编辑操作的ID(可从操作模块查看)
	if (p_sonmua.IndexOf(";3;") != -1)
	{
		dr["btnstr"] += "<a href=\"edit_18.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=" + dr["mocode"].ToString() + "&id=" + id + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
	}

	//判断对本模块是否有编辑权限，4代表编辑操作的ID(可从操作模块查看)
	if (p_sonmua.IndexOf(";4;") != -1)
	{
		dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){deleteSon('" + dr["mocode"].ToString() + "');}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
	}
}
private void Click_Toolbar(object sender, System.EventArgs e)
{
	string idstr = ((Control)sender).ID.ToLower();
	string exeinfo = "";
	if (guangye.GetControlValue(day_18_4)!="")
	{
		guangye.SetControlValue(fld_18_4,guangye.GetControlValue(day_18_4)+" "+guangye.GetControlValue(hour_18_4)+":"+guangye.GetControlValue(minute_18_4)+":00");
	}
	switch (idstr)
	{
		case "btn_saveson":
			//验证输入字段类型
			CheckMustAndFieldType(flds,"18");
			if (GetSESSION("alert").Length > 0)//验证未通过
			{
				exeinfo = GetSESSION("alert");
				SetSESSION("alert", "");
			}
			else
			{
				//插入更新的同时，插入数据至gmis_mo_1197表（数据库关联表）
				if (pid == "0")
				{
					exeinfo = db.TransUpdate(db.ConnStr, guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=18;select @name='"+p_companyname+"';if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (@mid,@mocode,'" + guangye.GetControlValue(fld_18_8) + "',@name) end else begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_18_8) + "',orgname=@name where datamocode=@mocode and modulecode=18 end ");
					
				}
				else
				{
					exeinfo = db.TransUpdate(db.ConnStr, guangye.GetUpdateSql(dtable, filter, flds, types) + ";declare @name as varchar(50);select @name='"+p_companyname+"';if exists (select 1 from gmis_mo_1197 where ModuleCode=18 and DataMoCode="+pid+") begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_18_8) + "',orgname=@name where datamocode=" + pid + " and modulecode=18 end else begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (18," + pid + ",'" + guangye.GetControlValue(fld_18_8) + "',@name) end");
				}

				if (exeinfo.IndexOf("操作成功！")>-1)
				{
					Response.Redirect("edit_18.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
				}
			}
			break;
		case "btn_deleteson":
			//删除的同时，一并删除gmis_mo_1197表（数据库关联表）
			exeinfo = db.TransUpdate(db.ConnStr, "delete gmis_mo_18 where mocode=" + sonid.Value + "; delete gmis_mo_1197 where datamocode=" + sonid.Value + " and modulecode=18");

			if (exeinfo.IndexOf("操作成功！") > -1)
			{
				Response.Redirect("edit_18.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
			}
			break;	   
		case "btn_clearson":
			if(flds!=null)
			{				
				guangye.ClearData(flds);
			}
			break;
		case "btn_backlistson":
			Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("list")+"&mid="+mid+"&navindex="+navindex+"&tid="+tid+"&pid="+pid);
			break;
		case "btn_addson":
			Response.Redirect("edit_18.aspx?aid="+StringUtility.StringToBase64("edit")+"&mid="+mid+"&navindex="+navindex+"&id="+id+"&tid="+tid+"&pid=0");
			break;
	}

	alertmess.InnerText = exeinfo;
}

</script>

<script type="text/javascript">
function deleteSon(code)
{
    form1.sonid.value=code;
    __doPostBack('btn_deleteson','')
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
			<!--新增-->
			<td align=right style="padding-right: 5px;" nowrap>
				<G:Button id="btn_addson" type="toolbar" mode="on" icon="tb01" text="新增" onclick="Click_Toolbar" runat="server">
				</G:Button>
			</td>
			<!--新增-->
			<!--保存-->
			<td align=right style="padding-right: 5px;" nowrap>
				<G:Button id="btn_saveson" type="toolbar" mode="on" icon="tb05" text="保存" onclick="Click_Toolbar" runat="server">
				</G:Button>
			</td>	
			<!--保存-->
			<!--清空-->
			<td align=right style="padding-right: 5px;" nowrap>
			<G:Button id="btn_clearson" type="toolbar" mode="on" icon="tb06" text="清空" onclick="Click_Toolbar" runat="server"></G:Button>
			</td>
			<!--清空-->
			<!--返回列表-->
			<td align=right style="padding-right: 5px;" nowrap>
			<G:Button id="btn_backlistson" type="toolbar" mode="on" icon="tb13" text="返回列表" onclick="Click_Toolbar" runat="server"></G:Button>
			</td>
			<!--返回列表-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<input id="sonid" type="hidden" runat="server" />
<asp:LinkButton ID="btn_deleteson" runat="server" OnClick="Click_Toolbar"></asp:LinkButton>
<!--污染源信息-->
<G:Content id="view" runat="server">
<G:Template id="tmpview" runat="server">
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="margin-top: 10px;">     

	<tr>
		<td width="100" align="right" class="td_viewcontent_title">单位代码:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
		<td width="100" align="right" class="td_viewcontent_title">单位名称:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr> 
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">排放口代码:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
		<td width="100" align="right" class="td_viewcontent_title">排放口名称:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">污染物名称:</td>
		<td colspan="3" class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr>
</table>
</G:Template>
</G:Content>
<!--污染源信息-->
<!--排放口监测列表--> 

<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="margin-top: 3px;">
	<tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">污水排放口监测</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">
<tr>
	<td valign="top"  style="width:100%" class="td_viewcontent_content" >
	<div style="width:99%; height:260px; overflow-y:auto;">
	<G:ListBox id="list" IsProPage="true" showallline=false runat="server">
	<G:Template id="templist" runat="server">
	<table width="100%" border="0"  cellspacing="0" >
	<tr valign="top"  align="left" height="22">
		<td width="8%">
			监测日期:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%">
			采样时间:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="10%" >
			污水监测浓度:
		</td>
		<td width="13%" >
			*&nbsp;
		</td>				 				
		<td width="8%">
		   *
		</td>			   
	</tr>
	<tr >
	<td colspan="7"  height=1 style="background-color:#627C9D"></td>
	</tr>
	</table>
	</G:Template>
	</G:ListBox>
	</div>
</td>
</tr>
</table>  
<!--排放口监测列表-->


<!--新增，编辑污水排放口监测-->
<input id="fld_18_8" type="hidden" runat="server" /><!--单位代码-->
<input id="fld_18_1" type="hidden" runat="server" /><!--排放口编号-->
<input id="fld_18_2" type="hidden" runat="server" /><!--排放口名称-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
<tr>		
	<td width="100" align="right"  class="td_viewcontent_title">监测日期:</td>
	<td class="td_viewcontent_content" style="width:35%"><input id="fld_18_3" class="boxbline" style="width:160px;" type="text" runat="server" >&nbsp;&nbsp;<G:GetDate id="get_fld_18_3" return="fld_18_3" runat="server"  align=bottom/>
	</td>	
	<td width="100" align="right"  class="td_viewcontent_title">采样时间:</td>
	<td class="td_viewcontent_content" style="width:35%"><input id="fld_18_4" type="hidden" class="boxbline" style="width:95%;"  maxlength="50" runat="server" >
	<input id="day_18_4" class="boxbline" style="width:160px;" type="text" runat="server" >&nbsp;&nbsp;<G:GetDate id="get_day_18_4" return="day_18_4" runat="server" align=bottom/>&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="hour_18_4" style="width:40px;" runat="server"></asp:DropDownList>：<asp:DropDownList ID="minute_18_4" style="width:40px;" runat="server"></asp:DropDownList>
	</td>
</tr>		
<tr>	
	<td width="100" align="right"  class="td_viewcontent_title">污水监测浓度:</td>
	<td class="td_viewcontent_content" style="width:35%"><input id="fld_18_7" class="boxbline" style="width:95%;"  maxlength="50" runat="server" >
	</td>	
	<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
	<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
</tr>
</table>
<!--新增，编辑污水排放口监测-->

<!--动态生成html,结束-->
</form>
</body>
</html>
