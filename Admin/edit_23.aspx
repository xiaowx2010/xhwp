<!--废气排放口基本情况,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--
主表：gmis_mo_23
关联表：gmis_mo_17，关联条件：（gmis_mo_17.fld_17_1=gmis_mo_23.fld_23_3）;gmis_mo_21，关联条件：（gmis_mo_21.mocode in gmis_mo_23.fld_23_11）
-->
<script language="C#" runat="server">
string p_sonmua;
DataTable p_wrwdt ;
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//设置工具条,同时获取固定URL参数  
	pid = GetQueryString("pid", "0");//子模块的mocode
	tb_2.Visible=false;//隐藏原有新增按钮
	tb_save.Visible=false;//隐藏原有保存按钮
	btn_clear.Visible=false;//隐藏原有清空按钮
	btn_backlist.Visible=false;//隐藏原有返回列表按钮 
    
	p_sonmua = ";" + GetModuleActions("23").Trim(';') + ";";//子模块权限
	
	/*模块编辑设置*/
	dtable = "gmis_mo_23";
	filter = " mocode=" + pid;
	flds = new string[] { "fld_23_1", "fld_23_2", "fld_23_3", "fld_23_4", "fld_23_5", "fld_23_6", "fld_23_7", "fld_23_8", "fld_23_9" , "fld_23_10", "fld_23_11"};
	types = "00000110110";
	/*模块编辑设置*/	

	if(!IsPostBack)
	{
		BindListControl(fld_23_6, "mocode", "fld_54_1", "select mocode,fld_54_1 from gmis_mo_54", "-请选择-");//排放口类型
		SetFilter(fld_23_6,"0");

        BindListControl(fld_23_7, "mocode", "fld_1165_2", "select mocode,fld_1165_2 from gmis_mo_1165", "-请选择-");//排放去向
        SetFilter(fld_23_7,"0");

		BindListControl(fld_23_10, "mocode", "fld_1196_1", "select mocode,fld_1196_1 from gmis_mo_1196", "-请选择-");//河体名称
		SetFilter(fld_23_10,"0");
		
		BindListControl(fld_23_11, "mocode", "fld_29_1", "select mocode,(select fld_1206_1 from gmis_mo_1206 where mocode = fld_29_2) as fld_29_1 from gmis_mo_29 where fld_29_3=(select fld_17_1 from gmis_mo_17 where mocode="+id+")");//污染物列表

		if(pid != "0")
		{			
			guangye.BindData(dtable, filter, flds);		
			SetFilter(fld_23_9txt,(guangye.GetControlValue(fld_23_9).ToLower()=="true")?"1":"0");
		}
        if (guangye.GetControlValue(fld_23_10) == "")
        {
            SetFilter(fld_23_10, "0");
        }
	}
	if(pid!="0")
	{
		fld_23_1.Attributes["readonly"] = "true";
	}

    view.SqlStr = "select fld_17_1,fld_17_3,fld_17_4,(select top 1 featurecode from gmis_mo_1197 where orgcode=fld_17_1 and modulecode=17) as featurecode from gmis_mo_17 where mocode=" + id;
	DataTable dt = view.DataTable;
	if(dt.Rows.Count>0)
	{
        featurecode.Value = dt.Rows[0]["featurecode"].ToString();
		guangye.SetControlValue(fld_23_3,dt.Rows[0]["fld_17_1"].ToString()); 
		guangye.SetControlValue(fld_23_4,dt.Rows[0]["fld_17_3"].ToString()); 
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

	/*设置筛选条件*/

	
	string h_tablename = "gmis_mo_23";//数据表名称
	string h_orderstr = " order by createdate desc";//排序条件;	

	//设置列表控件数据源
	list.SqlStr = "select fld_23_1,fld_23_2,(select fld_54_1 from gmis_mo_54 where mocode=fld_23_6),'' as btnstr,fld_23_5,(select fld_1165_2 from gmis_mo_1165 where mocode=fld_23_7),(select fld_1196_1 from gmis_mo_1196 where mocode=fld_23_10),fld_23_8,case fld_23_9 when 0 then '否' else '是' end,'' as wrw,fld_23_11,mocode from " + h_tablename + "  where fld_23_3=(select fld_17_1 from gmis_mo_17 where mocode="+id+") " + h_orderstr + " ";
	
	p_wrwdt = db.GetDataTable(db.ConnStr,"select mocode,(select fld_1206_1 from gmis_mo_1206 where mocode = fld_29_2) as wrwname from gmis_mo_29 where fld_29_3=(select fld_17_1 from gmis_mo_17 where mocode="+id+")");//获取所有注册已处理污染物

	//设置列表控件显示行数
	list.Rows = (list.DataTable.Rows.Count < 8) ? 8 : list.DataTable.Rows.Count;

}

//处理当前页数据，处理操作列显示的操作
public override void BeforeOutput(DataTable dt, int rowi)
{
	DataRow dr = dt.Rows[rowi];
	
	//获取污染物名称
	if(p_wrwdt != null && p_wrwdt.Rows.Count>0 && dr["fld_23_11"].ToString().Trim(';')!="")
	{
		string[] h_code = dr["fld_23_11"].ToString().Trim(';').Split(';');
		if (h_code.Length>0)
		{
			for (int i=0;i<h_code.Length;i++)
			{
				DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_code[i]+"");
				if(h_wrwdr.Length>0)
				{					
					dr["wrw"] += h_wrwdr[0]["wrwname"].ToString()+",";								
				}
			}
			dr["wrw"] = dr["wrw"].ToString().Trim(',');
		}
	}

	//判断对本模块是否有编辑权限，3代表编辑操作的ID(可从操作模块查看)
	if (p_sonmua.IndexOf(";3;") != -1)
	{
		dr["btnstr"] += "<a href=\"edit_23.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=" + dr["mocode"].ToString() + "&id=" + id + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
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
			guangye.SetControlValue(fld_23_9,guangye.GetControlValue(fld_23_9txt));
			//验证输入字段类型
			CheckMustAndFieldType(flds,"23");
			if (guangye.GetControlValue(fld_23_1) != "")//判断排放口编号唯一性
			{
				string h_fstr = (pid == "0")?"":" and mocode<>"+pid;
				DataTable h_cdt = db.GetDataTable(db.ConnStr,"select mocode from gmis_mo_23 where fld_23_1 = '"+guangye.GetControlValue(fld_23_1)+"' "+h_fstr+" ");
				if(h_cdt.Rows.Count>0)
				{
                    SetSESSION("alert", "该排放口编号已存在，请重新输入！");
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
                    exeinfo = db.TransUpdate(db.ConnStr, guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=23;select @name='" + guangye.GetControlValue(fld_23_4) + "';if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname,rivercode,featurecode) values (@mid,@mocode,'" + guangye.GetControlValue(fld_23_3) + "',@name,'" + guangye.GetControlValue(fld_23_10) + "','" + guangye.GetControlValue(featurecode) + "') end else begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_23_3) + "',orgname=@name,rivercode='" + guangye.GetControlValue(fld_23_10) + "',featurecode='" + guangye.GetControlValue(featurecode) + "' where datamocode=@mocode and modulecode=23 end");
				}
				else
				{
                    exeinfo = db.TransUpdate(db.ConnStr, guangye.GetUpdateSql(dtable, filter, flds, types) + ";declare @name as varchar(50);select @name='" + guangye.GetControlValue(fld_23_4) + "';if exists (select 1 from gmis_mo_1197 where ModuleCode=23 and DataMoCode=" + pid + ") begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_23_3) + "',orgname=@name,rivercode='" + guangye.GetControlValue(fld_23_10) + "',featurecode='" + guangye.GetControlValue(featurecode) + "' where datamocode=" + pid + " and modulecode=23 end else begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname,rivercode,featurecode) values (23," + pid + ",'" + guangye.GetControlValue(fld_23_3) + "',@name,'" + guangye.GetControlValue(fld_23_10) + "','" + guangye.GetControlValue(featurecode) + "') end");

				}

				if (exeinfo.IndexOf("操作成功！")>-1)
				{
					Response.Redirect("edit_23.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
				}
			}
			break;
		case "btn_deleteson":
			//删除当前数据，及对应的监测数据和锅炉炉窑数据，同时删除对应于gmis_mo_1197表中的数据,以及对应的所有年月报表数据;
			string h_sqlstr = "declare @name as varchar(50);select @name=fld_23_1 from gmis_mo_23 where mocode="+sonid.Value+";delete gmis_mo_1197 where orgcode='"+guangye.GetControlValue(fld_23_3)+"' and datamocode in (select mocode from gmis_mo_24 where fld_24_1=@name and fld_24_8='"+guangye.GetControlValue(fld_23_3)+"');delete gmis_mo_24 where fld_24_1=@name and fld_24_8='"+guangye.GetControlValue(fld_23_3)+"';delete gmis_mo_1197 where orgcode='"+guangye.GetControlValue(fld_23_3)+"' and datamocode in (select mocode from gmis_mo_25 where fld_25_15=@name and fld_25_14='"+guangye.GetControlValue(fld_23_3)+"');delete gmis_mo_25 where fld_25_15=@name and fld_25_14='"+guangye.GetControlValue(fld_23_3)+"';delete gmis_mo_58 where fld_58_2=@name;delete gmis_mo_59 where fld_59_1=@name;delete gmis_mo_1210 where fld_1210_1 in (select mocode from gmis_mo_58 where fld_58_2=@name);delete gmis_mo_23 where mocode=" + sonid.Value + "; delete gmis_mo_1197 where datamocode=" + sonid.Value + " and modulecode=23";

			exeinfo = db.TransUpdate(db.ConnStr, h_sqlstr);

			if (exeinfo.IndexOf("操作成功！") > -1)
			{
				Response.Redirect("edit_23.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
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
			Response.Redirect("edit_23.aspx?aid="+StringUtility.StringToBase64("edit")+"&mid="+mid+"&navindex="+navindex+"&id="+id+"&tid="+tid+"&pid=0");
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
<tr align="center">
	<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">污染源基本情况</td>
</tr>
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">单位代码:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
		<td width="100" align="right" class="td_viewcontent_title">单位名称:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr> 
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">单位地址:</td>
		<td colspan="3" class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr>
</table>
</G:Template>
</G:Content>
<!--污染源信息-->
<!--新增，编辑污染物排放口-->
<input id="fld_23_3" type="hidden" runat="server" />
<input id="fld_23_4" type="hidden" runat="server" />
<input id="featurecode" type="hidden" runat="server" />
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
<tr align="center">
	<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">废气排放口</td>
</tr>
<tr>
	<td width="100" align="right"  class="td_viewcontent_title"><font color="#ff6600">*</font>排放口编号:</td>
	<td class="td_viewcontent_content" style="width:35%" ><input id="fld_23_1" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
	
	<td width="100" align="right"  class="td_viewcontent_title">排放口名称:</td>
	<td class="td_viewcontent_content" style="width:35%"><input id="fld_23_2" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
</tr>
<tr>
	<td width="100" align="right"  class="td_viewcontent_title">排放口位置:</td>
	<td class="td_viewcontent_content" ><input id="fld_23_5" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
	
	<td width="100" align="right"  class="td_viewcontent_title">排放口类型:</td>
	<td class="td_viewcontent_content" ><asp:DropDownList id="fld_23_6" style="width:95%;" runat="server" /></td>
</tr>
<tr>
	<td width="100" align="right"  class="td_viewcontent_title">排放去向:</td>
	<td class="td_viewcontent_content" ><asp:DropDownList ID="fld_23_7" runat="server" style="width:95%;"></asp:DropDownList></td>
	
	<td width="100" align="right"  class="td_viewcontent_title">河体名称:</td>
	<td class="td_viewcontent_content" ><asp:DropDownList ID="fld_23_10" runat="server" style="width:95%;"></asp:DropDownList></td>
</tr>
<tr>
	<td width="100" align="right"  class="td_viewcontent_title">排放规律:</td>
	<td class="td_viewcontent_content" ><input id="fld_23_8" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
	<td width="100" align="right"  class="td_viewcontent_title">是否在线监测:</td>
	<td class="td_viewcontent_content" >
	<input id="fld_23_9" type="hidden" runat="server" />
	<asp:DropDownList id="fld_23_9txt" style="width:95%;" runat="server">
	<asp:ListItem Value="0">否</asp:ListItem>
	<asp:ListItem Value="1">是</asp:ListItem>
	</asp:DropDownList>
	</td>	
</tr>
<tr>
	<td width="100" align="right"  class="td_viewcontent_title">污染物清单:</td>
	
	<td colspan="3" class="td_viewcontent_content" >
	<asp:CheckBoxList id="fld_23_11" RepeatDirection="Horizontal" RepeatColumns="4" runat="server"/>
	</td>
	
</tr>
</table>
<!--新增，编辑污染物排放口-->

<!--排放口列表-->
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">
<tr>
	<td valign="top"  style="width:100%" class="td_viewcontent_content" >
	<div style="width:99%; height:320px; overflow-y:auto;">
	<G:ListBox id="list" IsProPage="true" showallline=false runat="server">
	<G:Template id="templist" runat="server">
	<table width="100%" border="0"  cellspacing="0" >
	<tr valign="top" class="zy_bold_lineX" align="left" height="22">
		<td width="8%">
			排放口编号:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%">
			排放口名称:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%" >
			排放口类型:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>				 				
		<td width="8%">
		   *
		</td>			   
	</tr>

	<tr valign="top" class="zy_bold_lineX" align="left" height="22">
	<td width="8%" >
			排放口位置:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		<td width="8%" >
			排放去向:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%" >
			河体名称:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>				 				
		<td width="8%">
		   &nbsp;
		</td>
	</tr>
	<tr valign="top" align="left" height="22">
	<td width="8%" >
			排放规律:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		<td width="8%">
			是否在线监测:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		<td width="8%">
			污染物清单:
		</td>
		<td width="15%">
			<img src="images/icons/TB07.gif" title="*" style="cursor:hand">&nbsp;
		</td>				 				
		<td width="8%">
		   &nbsp;
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
<!--排放口列表-->

<!--动态生成html,结束-->
</form>
</body>
</html>
