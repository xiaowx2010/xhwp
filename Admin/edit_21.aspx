<!--污水排放许可编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--
主表：gmis_mo_21
关联表：gmis_mo_1205，关联条件：（gmis_mo_1205.mocode=gmis_mo_21.fld_21_2）;gmis_mo_17，关联条件：（gmis_mo_17.fld_17_1=gmis_mo_21.fld_21_3）
-->
<script language="C#" runat="server">
string p_sonmua;

private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//设置工具条,同时获取固定URL参数  
	pid = GetQueryString("pid", "0");//子模块的mocode
	tb_2.Visible=false;//隐藏原有新增按钮
	tb_save.Visible=false;//隐藏原有保存按钮
	btn_clear.Visible=false;//隐藏原有清空按钮
	btn_backlist.Visible=false;//隐藏原有返回列表按钮
	
	p_sonmua = ";" + GetModuleActions("21").Trim(';') + ";";//子模块权限
	
	/*模块编辑设置*/
	dtable = "gmis_mo_21";
	filter = " mocode=" + pid;
	flds = new string[] { "fld_21_1", "fld_21_2", "fld_21_3" };
	types = "110";
	/*模块编辑设置*/	

	if(!IsPostBack)
	{
		BindListControl(select_type, "mocode", "fld_55_1", "select mocode,fld_55_1 from gmis_mo_55","-请选择-"); //绑定污染物类别
		SetFilter(select_type, "0");

		BindListControl(fld_21_2, "mocode", "fld_1205_1", "select mocode,fld_1205_1 from gmis_mo_1205 order by fld_1205_3,fld_1205_1","-请选择-");//绑定污染物名称 
		SetFilter(fld_21_2, "0");

		if(pid != "0")
		{			
			guangye.BindData(dtable, filter, flds);			
		}
		if (guangye.GetControlValue(fld_21_2) != "" && guangye.GetControlValue(fld_21_2) != "0")
		{
			DataTable h_tdt = db.GetDataTable(db.ConnStr,"select fld_1205_2,fld_1205_4 from gmis_mo_1205 where mocode = "+guangye.GetControlValue(fld_21_2)); 
			if (h_tdt.Rows.Count>0)
			{
				wrw_code.InnerText = h_tdt.Rows[0]["fld_1205_2"].ToString();
				wrw_bz.InnerText = h_tdt.Rows[0]["fld_1205_4"].ToString();
			}
		}
	}

	view.SqlStr = "select fld_17_1,fld_17_3 from gmis_mo_17 where mocode=" + id;
	DataTable dt = view.DataTable;
	if(dt.Rows.Count>0)
	{
		guangye.SetControlValue(fld_21_3,dt.Rows[0]["fld_17_1"].ToString()); 
	}
	BindDataList();	
}

//绑定数据
private void BindDataList()
{

	/*设置筛选条件*/

	
	string h_tablename = "gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2 = b.mocode";//数据表名称
	string h_orderstr = " order by fld_1205_2 asc";//排序条件;	

	//设置列表控件数据源
	list.SqlStr = "select fld_1205_2,fld_1205_1,fld_1205_4,fld_21_1,'' as btnstr,a.mocode from " + h_tablename + "  where fld_21_3=(select fld_17_1 from gmis_mo_17 where mocode="+id+") " + h_orderstr + " ";
	

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
		dr["btnstr"] += "<a href=\"edit_21.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=" + dr["mocode"].ToString() + "&id=" + id + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
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
	switch (idstr)
	{
		case "btn_saveson":
			//验证输入字段类型
			CheckMustAndFieldType(flds,"21");
			if (guangye.GetControlValue(fld_21_2) == ""||guangye.GetControlValue(fld_21_2) == "0")
			{
				SetSESSION("alert", "请选择污染物名称！");
			}
			else
			{
				//相同污染源，不可重复相同的污染物
				string h_fstr = (pid == "0")?"":" and mocode<>"+pid;
				DataTable h_wrwdt = db.GetDataTable(db.ConnStr,"select mocode from gmis_mo_21 where fld_21_3='"+guangye.GetControlValue(fld_21_3)+"' and fld_21_2="+guangye.GetControlValue(fld_21_2)+""+h_fstr);
				if (h_wrwdt.Rows.Count>0)
				{
                    SetSESSION("alert", "该污染物已存在，请重新输入！");
				}
			}
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
					exeinfo = db.TransUpdate(db.ConnStr, guangye.GetInsertSql(dtable, flds, types)+";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=21;select @name=fld_17_3 from gmis_mo_17 where mocode="+id+";if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (@mid,@mocode,'" + guangye.GetControlValue(fld_21_3) + "',@name) end else begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_21_3) + "',orgname=@name where datamocode=@mocode and modulecode=21 end");
				}
				else
				{
					exeinfo = db.TransUpdate(db.ConnStr, guangye.GetUpdateSql(dtable, filter, flds, types)+";declare @name as varchar(50);select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_21_3) + "';if exists (select 1 from gmis_mo_1197 where ModuleCode=21 and DataMoCode="+pid+") begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_21_3) + "',orgname=@name where datamocode=" + pid + " and modulecode=21 end else begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (21,"+pid+",'" + guangye.GetControlValue(fld_21_3) + "',@name) end");
				}

				if (exeinfo.IndexOf("操作成功！")>-1)
				{
					Response.Redirect("edit_21.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
				}
			}
			break;
		case "btn_deleteson":
			//删除的同时，一并删除gmis_mo_1197表（数据库关联表），并将gmis_mo_53(排放口表)数据表中，含有该污染物的记录，进行更新
			exeinfo = db.TransUpdate(db.ConnStr, "delete gmis_mo_21 where mocode=" + sonid.Value + "; delete gmis_mo_1197 where datamocode=" + sonid.Value + " and modulecode=21;update gmis_mo_53 set fld_53_11 = replace(';'+fld_53_11+';',';"+sonid.Value+";','') where ';'+fld_53_11+';' like '%;"+sonid.Value+";%'");
			if (exeinfo.IndexOf("操作成功！") > -1)
			{
				Response.Redirect("edit_21.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
			}
			break;	   
		case "btn_clearson":
			if(flds!=null)
			{				
				guangye.ClearData(flds);

				BindListControl(select_type, "mocode", "fld_55_1", "select mocode,fld_55_1 from gmis_mo_55","-请选择-"); //绑定污染物类别
				SetFilter(select_type, "0");

				BindListControl(fld_21_2, "mocode", "fld_1205_1", "select mocode,fld_1205_1 from gmis_mo_1205 order by fld_1205_3,fld_1205_1","-请选择-");//绑定污染物名称
				SetFilter(fld_21_2, "0");

				wrw_code.InnerText = "";
				wrw_bz.InnerText = "";
			}
			break;
		case "btn_backlistson":
			Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("list")+"&mid="+mid+"&navindex="+navindex+"&tid="+tid+"&pid="+pid);
			break;
		case "btn_addson":
			Response.Redirect("edit_21.aspx?aid="+StringUtility.StringToBase64("edit")+"&mid="+mid+"&navindex="+navindex+"&id="+id+"&tid="+tid+"&pid=0");
			break;
	}

	alertmess.InnerText = exeinfo;
}
   
//类别筛选
private void Change_Type(object sender, System.EventArgs e)
{
	string h_fstr="";
	if (guangye.GetControlValue(select_type) != "" && guangye.GetControlValue(select_type) != "0")
	{
		h_fstr = " and fld_1205_3="+guangye.GetControlValue(select_type)+"";
	}	
	BindListControl(fld_21_2, "mocode", "fld_1205_1", "select mocode,fld_1205_1 from gmis_mo_1205 where 1=1 "+h_fstr+" order by fld_1205_3,fld_1205_1","-请选择-");//绑定污染物名称 
	SetFilter(fld_21_2, "0");
}
//名称筛选
private void Change_Name(object sender, System.EventArgs e)
{
	if (guangye.GetControlValue(fld_21_2) != "" && guangye.GetControlValue(fld_21_2) != "0")
	{
		DataTable h_tdt = db.GetDataTable(db.ConnStr,"select fld_1205_2,fld_1205_4 from gmis_mo_1205 where mocode = "+guangye.GetControlValue(fld_21_2)); 
		if (h_tdt.Rows.Count>0)
		{
			wrw_code.InnerText = h_tdt.Rows[0]["fld_1205_2"].ToString();
			wrw_bz.InnerText = h_tdt.Rows[0]["fld_1205_4"].ToString();
		}
	}
}
</script>
<script type="text/javascript">
function deleteSon(code)
{
    form1.sonid.value=code;
    __doPostBack('btn_deleteson','')
}
</script>

<body style="padding: 10px; text-align: center">
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
    </table>
	</G:Template>
    </G:Content>
	<!--污染源信息-->
	<!--污染物列表-->
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top"
        style="margin-top: 3px;">
        <tr align="center">
            <td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">污染物列表</td>
        </tr>
    </table>   
	<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">
	<tr>
		<td valign="top"  style="width:100%" class="td_viewcontent_content" >
		<div style="width:99%; height:320px; overflow-y:auto;">
		<G:ListBox id="list" IsProPage="true" showallline=false runat="server">
		<G:Template id="templist" runat="server">
		 <table width="100%" border="0"  cellspacing="0" >
			<tr valign="top" align="left" height="22">
				<td width="8%" >
					污染物代码:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>
				 <td width="8%">
					污染物名称:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>
				 <td width="8%" >
					执行标准:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>
				 <td width="8%" >
					许可排放量:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>				
				 <td width="8%">
				   *
				</td>			   
			</tr>
			<tr >
			<td colspan="9"  height=1 style="background-color:#627C9D"></td>
			</tr>
			</table>
		</G:Template>
		</G:ListBox>
		</div>
	</td>
	</tr>
	</table>  
    <!--污染物列表-->
	<!--新增，编辑污染物-->
	<input id="fld_21_3" type="hidden" runat="server" />
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">污染物类别:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList ID="select_type" AutoPostBack="true" OnSelectedIndexChanged="Change_Type" Style="width:95%;" runat="server"></asp:DropDownList></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">污染物名称:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList ID="fld_21_2" AutoPostBack="true" OnSelectedIndexChanged="Change_Name" Style="width:95%;" runat="server"></asp:DropDownList></td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">污染物代码:</td>
		<td class="td_viewcontent_content" style="width:35%"><lable id="wrw_code" runat=server></lable>&nbsp;</td>
		 
		<td width="100" align="right"  class="td_viewcontent_title">执行标准:</td>
		<td class="td_viewcontent_content" style="width:35%"><lable id="wrw_bz" runat=server></lable>&nbsp;</td>
	</tr>	
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">许可排放量:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_21_1" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
	</tr>
	</table>
    <!--新增，编辑污染物-->
    <!--动态生成html,结束-->
    </form>
</body>
</html>

