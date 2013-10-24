<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" DEBUG=TRUE%>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">

    <script type="text/javascript">
        
    </script>

</head>
<!--#include file="func.aspx"-->
<!--#include file="func/func_1232.aspx"-->
<script runat="server" language="C#">
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//设置工具条,同时获取固定URL参数  

	dtable = "gmis_mo_1232";
    flds = new string[] { "fld_1232_1", "fld_1232_2", "fld_1232_3", "fld_1232_4", "fld_1232_5", "fld_1232_6", "fld_1232_7"};
    types = "0000100";	
	
	if (!IsPostBack)
	{
		//查询模板
		BindListControl(edition, "mocode", "fld_1232_1", "select mocode,fld_1232_1 from gmis_mo_1232 order by mocode", "无模版");
		SetFilter(edition, "0");

		//项目模块
		DataTable h_mdt = db.GetDataTable(db.ConnStr,"select modulecode,(REPLICATE('　',modulelevel-2)+modulename) as modulename from gmis_module where moduleindex like '%'+(select moduleindex from gmis_module where modulecode=40)+'%' and modulestate=0 and exists (SELECT 1 FROM sysobjects WHERE xtype = 'U' AND OBJECTPROPERTY (id, 'IsMSShipped') = 0 and id=object_id ('gmis_mo_'+Cast(modulecode as varchar(50)))) order by moduleindex");
		BindListControl(module, "modulecode", "modulename", h_mdt);
		if (h_mdt.Rows.Count>0)
		{
			SetFilter(module, h_mdt.Rows[0][0].ToString());

			//字段名（条件和排序）
			DataTable h_fdt = db.GetDataTable(db.ConnStr,"select caption,fieldcode,fieldname from gmis_field where isvital=0 and fieldstatus=0 and modulecode="+guangye.GetControlValue(module)+" order by fieldindex");
			BindListControl(s_field, "fieldcode", "caption", h_fdt);
			BindListControl(i_field, "fieldname", "caption", h_fdt);
			if (h_fdt.Rows.Count>0)
			{
				SetFilter(s_field, h_fdt.Rows[0][1].ToString());
				SetFilter(i_field, h_fdt.Rows[0][2].ToString());
			}
			GetDefaultField();//默认显示字段
		}
	} 
}
//默认显示字段
private void GetDefaultField()
{
	if (guangye.GetControlValue(module) != "")
	{
		string h_field = "";
		//字段名
		DataTable h_fdt = db.GetDataTable(db.ConnStr,"select fieldname from gmis_field where fieldstatus=0 and modulecode="+guangye.GetControlValue(module)+" and oneditlist=1 order by fieldindex");
		foreach (DataRow dr in h_fdt.Rows)
		{
			h_field += dr["fieldname"].ToString()+",100|";
		}
		h_field = h_field.Trim('|');
		guangye.SetControlValue(fld_1232_4,h_field);
	}
	
}
//模块筛选
private void Change_Module(object sender, System.EventArgs e)
{
	//字段名（条件和排序）
	DataTable h_fdt = db.GetDataTable(db.ConnStr,"select caption,fieldcode,fieldname from gmis_field where isvital=0 and modulecode="+guangye.GetControlValue(module)+" order by fieldindex");
	BindListControl(s_field, "fieldcode", "caption", h_fdt);
	BindListControl(i_field, "fieldname", "caption", h_fdt);
	if (h_fdt.Rows.Count>0)
	{
		SetFilter(s_field, h_fdt.Rows[0][1].ToString());
		SetFilter(i_field, h_fdt.Rows[0][2].ToString());
	}
	GetDefaultField();//默认显示字段
}

/***************************************************************
函数名：Click_LoadEdition()
用途：读取模板
变更人/日期:孙振宇  2009-6-19
***************************************************************/
private void Click_LoadEdition(object sender, System.EventArgs e)
{	
	if (guangye.GetControlValue(edition) != "0")
	{		
		string h_modulecode =  GetOneFieldValue("select fld_1232_5 from gmis_mo_1232 where mocode = "+guangye.GetControlValue(edition));//模块ID
		if (h_modulecode != "")
		{
			SetFilter(module, h_modulecode);
			//字段名（条件和排序）
			DataTable h_fdt = db.GetDataTable(db.ConnStr,"select caption,fieldcode,fieldname from gmis_field where isvital=0 and fieldstatus=0 and modulecode="+guangye.GetControlValue(module)+" order by fieldindex");
			BindListControl(s_field, "fieldcode", "caption", h_fdt);
			BindListControl(i_field, "fieldname", "caption", h_fdt);
			if (h_fdt.Rows.Count>0)
			{
				SetFilter(s_field, h_fdt.Rows[0][1].ToString());
				SetFilter(i_field, h_fdt.Rows[0][2].ToString());
			}
		}
		
		filter = " mocode=" + guangye.GetControlValue(edition);

		guangye.BindData(dtable, filter, flds);//绑定数据

		BindEdition();	
	} 
	else
	{
		Response.Redirect("list_1232.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&navindex=" + navindex + "");
	}
}
/***************************************************************
函数名：BindEdition()
用途：绑定模板
变更人/日期:孙振宇  2009-6-19
***************************************************************/
private void BindEdition()
{
	//将条件加入到显示框中
    s_fstr.InnerHtml = "";
    i_fstr.InnerHtml = "";
	string[] h_sfield = guangye.GetControlValue(fld_1232_6).Trim('|').Split('|');
	if (h_sfield.Length>0)
	{
		for (int i=0;i<h_sfield.Length;i++)
		{
			string[]  h_sstr = h_sfield[i].Trim(';').Split(';');
			if (h_sstr.Length > 2)
			{
				string h_caption = GetOneFieldValue("select caption from gmis_field where fieldcode = "+h_sstr[0]+"");
				s_fstr.InnerHtml += " [ "+h_caption+" "+h_sstr[1]+" "+h_sstr[2]+" ] ";
			}
			else if (h_sstr.Length == 1)
			{
				s_fstr.InnerHtml += " <b>"+h_sstr[0]+"</b> ";
			}
		}
	}

	//将排序加入到显示框中
	string[] h_ifield = guangye.GetControlValue(fld_1232_3).Trim('|').Split('|');
	if (h_ifield.Length>0)
	{
		for (int i=0;i<h_ifield.Length;i++)
		{
			string[]  h_istr = h_ifield[i].Trim(';').Split(';');
			if (h_istr.Length > 1)
			{
				string h_caption = GetOneFieldValue("select caption from gmis_field where fieldname = '"+h_istr[0]+"'");
				string h_updown = (h_istr[1]=="asc")?"升序":"降序";
				i_fstr.InnerHtml += " "+h_caption+" "+h_updown+" <b>和</b> ";
			}				
		}
		if (i_fstr.InnerHtml.LastIndexOf("<b>")>-1)
		{
			i_fstr.InnerHtml = i_fstr.InnerHtml.Substring(0,i_fstr.InnerHtml.LastIndexOf("<b>"));
		}	
	}	
}
/***************************************************************
函数名：Click_Save()
用途：保存模板
变更人/日期:孙振宇  2009-6-19
***************************************************************/
private void Click_Save(object sender, System.EventArgs e)
{	
	string h_mcode = "";
	if (guangye.GetControlValue(fld_1232_4) == "")
	{
		alertmess.InnerHtml = "请先选择要显示的字段！";
	}
	else 
	{
		if (guangye.GetControlValue(newname) != "")
		{
			
			DataTable h_checkdt = db.GetDataTable(db.ConnStr,"select mocode from gmis_mo_1232 where fld_1232_1='"+guangye.GetControlValue(newname)+"'");
			if (h_checkdt.Rows.Count>0)
			{
				alertmess.InnerHtml = "模板名称重名！";
			}
			else
			{
				guangye.SetControlValue(fld_1232_6,guangye.GetControlValue(fld_1232_6).Trim('|'));//去掉前后“|”
			
				fld_1232_2.Value=StringUtility.StringToBase64(CheckSearchFilter(guangye.GetControlValue(fld_1232_6)));//获取查询条件

				guangye.SetControlValue(fld_1232_1,guangye.GetControlValue(newname));

				guangye.SetControlValue(fld_1232_5,guangye.GetControlValue(module));

				alertmess.InnerHtml = guangye.ExeBySql(guangye.GetInsertSql(dtable,flds,types), 0);
			}
		}
		else
		{
			if (guangye.GetControlValue(edition)!="0")
			{
				guangye.SetControlValue(fld_1232_6,guangye.GetControlValue(fld_1232_6).Trim('|'));//去掉前后“|”

				fld_1232_2.Value=StringUtility.StringToBase64(CheckSearchFilter(guangye.GetControlValue(fld_1232_6)));//获取查询条件

				guangye.SetControlValue(fld_1232_5,guangye.GetControlValue(module));

				alertmess.InnerHtml = guangye.ExeBySql(guangye.GetUpdateSql(dtable,filter,flds,types), 0);
			}
			else
			{
				alertmess.InnerHtml = "请输入一个新的模板名称！";
			}
		}
	}

	//查询模板
	DataTable h_edt = db.GetDataTable(db.ConnStr,"select top 1 mocode from gmis_mo_1232 order by mocode desc");	
	BindListControl(edition, "mocode", "fld_1232_1", "select mocode,fld_1232_1 from gmis_mo_1232 order by mocode", "无模版");
	if (h_edt.Rows.Count>0)
	{
		SetFilter(edition, h_edt.Rows[0][0].ToString());
	}
	
	BindEdition();
}

/***************************************************************
函数名：Click_Search()
用途：开始查找
变更人/日期:孙振宇  2009-6-19
***************************************************************/
private void Click_Search(object sender, System.EventArgs e)
{	
	if (guangye.GetControlValue(fld_1232_4) == "")
	{
		alertmess.InnerHtml = "请先选择要显示的字段！";
	}
	else
	{
		guangye.SetControlValue(fld_1232_5,guangye.GetControlValue(module));
		SetSESSION("filter",fld_1232_2.Value+"#"+guangye.GetControlValue(fld_1232_3)+"#"+guangye.GetControlValue(fld_1232_4)+"#"+guangye.GetControlValue(fld_1232_5)+"#"+guangye.GetControlValue(fld_1232_6)+"#"+guangye.GetControlValue(fld_1232_7));
		Page.RegisterStartupScript("","<s"+"cript>window.open('pop_1232_1.aspx');</s"+"cript>");
	}
	BindEdition();
}

/***************************************************************
函数名：Click_Clear()
用途：清空所有条件
变更人/日期:孙振宇  2009-6-19
***************************************************************/
private void Click_Clear(object sender, System.EventArgs e)
{	
	Response.Redirect("list_1232.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&navindex=" + navindex + "");
}

private void SetToolBar()
{
	mid = GetQueryString("mid", "0");
	id = GetQueryString("id", "0");
	navindex = GetQueryString("navindex", "0");
	//判断是否为开发用户
	if (",2,3,7,".IndexOf("," + mid + ",") > -1 && !IsSystemDeveloper())
	{

		Response.Redirect("getpage.aspx?mid=0");
	}

	mua = ";" + GetModuleActions(mid) + ";";//模块权限    
	CheckToolBar(mua.Trim(';').Split(';'));
	
	SetSESSION("MainUrl", Request.Url.ToString());
}
</script>
<script>

/***************************************************************
函数名：S_Add_Click()
用途：添加条件
变更人/日期:孙振宇  2009-6-19
***************************************************************/
function S_Add_Click()
{
	document.getElementById("s_alert").innerHTML ="";

	if (document.getElementById("s_fstr").innerHTML != "" && (window.form1.and.checked || window.form1.or.checked))
	{
		if(window.form1.and.checked)
		{
			window.form1.fld_1232_6.value += "|并且";
			document.getElementById("s_fstr").innerHTML += " <b>并且</b> ";
		}
		else
		{
			window.form1.fld_1232_6.value += "|或者";
			document.getElementById("s_fstr").innerHTML += " <b>或者</b> ";
		}
	}

	if(window.form1.s_field.value == "0")
	{
		document.getElementById("s_alert").innerHTML = "请选择字段名！";
	}
	else if (window.form1.comparekey.value == "")
	{
		document.getElementById("s_alert").innerHTML = "请输入条件值！";
	}
	else if (document.getElementById("s_fstr").innerHTML != "" && !window.form1.and.checked && !window.form1.or.checked)
	{
		document.getElementById("s_alert").innerHTML = "请选择与上一条件关系！";
	}	
	else
	{
		window.form1.fld_1232_6.value += "|"+window.form1.s_field.value+";"+window.form1.compare.options[window.form1.compare.selectedIndex].innerHTML+";"+window.form1.comparekey.value.replace("\'","").replace(",","，");

		document.getElementById("s_fstr").innerHTML += ' [ '+ window.form1.s_field.options[window.form1.s_field.selectedIndex].innerHTML+" "+window.form1.compare.options[window.form1.compare.selectedIndex].innerHTML+" "+ window.form1.comparekey.value.replace("\'","").replace(",","，") +' ] ';
	}
}

/***************************************************************
函数名：S_Cancel_Click()
用途：取消条件
变更人/日期:孙振宇  2009-6-19
***************************************************************/
function S_Cancel_Click()
{
	if(document.getElementById("s_fstr").innerHTML.indexOf("[")>-1)
	{
		document.getElementById("s_fstr").innerHTML = document.getElementById("s_fstr").innerHTML.substring(0,document.getElementById("s_fstr").innerHTML.lastIndexOf("[")-9);
		window.form1.fld_1232_6.value = window.form1.fld_1232_6.value.substring(0,window.form1.fld_1232_6.value.lastIndexOf("|")-3);
	}
	else
	{
		document.getElementById("s_fstr").innerHTML = "";
		window.form1.fld_1232_6.value = "";
	}
}
/***************************************************************
函数名：S_Clear_Click()
用途：清空条件
变更人/日期:孙振宇  2009-6-19
***************************************************************/
function S_Clear_Click()
{
	document.getElementById("s_fstr").innerHTML = "";
	window.form1.fld_1232_6.value = "";	
}

/***************************************************************
函数名：I_Add_Click()
用途：添加排序
变更人/日期:孙振宇  2009-6-19
***************************************************************/
function I_Add_Click()
{
	document.getElementById("i_alert").innerHTML ="";

	if (document.getElementById("i_fstr").innerHTML != "" )
	{		
		window.form1.fld_1232_3.value += "|";
		document.getElementById("i_fstr").innerHTML += " <b>和</b> ";		
	}

	if(window.form1.i_field.value == "0")
	{
		document.getElementById("i_alert").innerHTML = "请选择字段名！";
	}
	else if (window.form1.updown.value == "")
	{
		document.getElementById("i_alert").innerHTML = "请选择升降序！";
	}
	else
	{
		window.form1.fld_1232_3.value += window.form1.i_field.value+";"+window.form1.updown.value;

		document.getElementById("i_fstr").innerHTML += ' [ '+ window.form1.i_field.options[window.form1.i_field.selectedIndex].innerHTML+" "+window.form1.updown.options[window.form1.updown.selectedIndex].innerHTML+' ] ';
	}
}

/***************************************************************
函数名：I_Cancel_Click()
用途：取消排序
变更人/日期:孙振宇  2009-6-19
***************************************************************/
function I_Cancel_Click()
{
	if(document.getElementById("i_fstr").innerHTML.indexOf("[")>-1)
	{
		document.getElementById("i_fstr").innerHTML = document.getElementById("i_fstr").innerHTML.substring(0,document.getElementById("i_fstr").innerHTML.lastIndexOf("[")-7);
		window.form1.fld_1232_3.value = window.form1.fld_1232_3.value.substring(0,window.form1.fld_1232_3.value.lastIndexOf(","));
	}
	else
	{
		document.getElementById("i_fstr").innerHTML = "";
		window.form1.fld_1232_3.value = "";
	}
}
/***************************************************************
函数名：I_Clear_Click()
用途：清空排序
变更人/日期:孙振宇  2009-6-19
***************************************************************/
function I_Clear_Click()
{
	document.getElementById("i_fstr").innerHTML = "";
	window.form1.fld_1232_3.value = "";	
}

</script>


<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--选项卡-->
    <!--选项卡-->
	<!--模版名称-->
	<input id="fld_1232_1" runat="server" type="hidden" />
	<!--模版名称-->
	<!--查询条件-->
	<input id="fld_1232_2" runat="server" type="hidden" />
	<!--查询条件-->
	<!--排序条件-->
	<input id="fld_1232_3" runat="server" type="hidden" />
	<!--排序条件-->
	<!--显示字段-->
	<input id="fld_1232_4" runat="server" type="hidden" />
	<input id="fld_1232_7" runat="server" type="hidden" />
	<!--显示字段-->
	<!--模块ID-->
	<input id="fld_1232_5" runat="server" type="hidden" />
	<!--模块ID-->
	<!--查询条件字段-->
	<input id="fld_1232_6" runat="server" type="hidden" />
	<!--查询条件字段-->
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1"  class="table_graybgcolor">
		<tr >
			<td colspan="1" align="right" style="pading-right:5px;" class="td_viewcontent_title">查询模板&nbsp;</td>			
			<td colspan="3" class="td_viewcontent_content" align="left">
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="88%"  style="padding-left:0px" >
						<!--查询模板-->
						    <asp:DropDownList ID="edition" runat="server" Width="90%"></asp:DropDownList>
						<!--查询模板-->	
						</td>
						<td width="12%" align="center" >
							<table border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td class="btn_L_pic"></td>
                                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="bottom" class="btn_text">
									  <!--应用模板-->
									  <G:Button id="btn_loadedition" type="toolbar" mode="on" icon="" text="应用模板" onclick="Click_LoadEdition" runat="server"></G:Button>
									  <!--应用模板-->
									  </td>
                                    </tr>
                                </table></td>
                                <td class="btn_R_pic"></td>
                              </tr>
                            </table>
					  </td>
					</tr>
				</table>
			</td>	
		</tr>

		<tr >
			<td colspan="1"  align="right"  class="td_viewcontent_title">查询条件&nbsp;</td>
			<td colspan="3" class="td_viewcontent_content" align="left" style="padding-left:10px;padding-bottom:5px;"  >
			    <table width="565"  border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;margin-bottom:10px">
				    <tr>
				       <td width="40" >模块名</td>
				       <td colspan="5">
					   <!--项目模块-->
						<asp:DropDownList ID="module" Width="90%" AutoPostBack="true" OnSelectedIndexChanged="Change_Module" runat="server"></asp:DropDownList>
					   <!--项目模块-->
					   </td> 
				    </tr>
				</table>    
				<table width="565"  border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;margin-bottom:10px">
					<tr>
						<td width="40" >字段名</td>
						<td>
						<!--条件字段-->
						<asp:DropDownList ID="s_field" Style="height:20px;width:160px" runat="server">
						</asp:DropDownList>
						<!--条件字段-->
						</td>
						<td>操作符</td>
						<td width="96">
						<!--比较条件-->
						<asp:DropDownList ID="compare" Style="width: 80px" runat="server">
							<asp:ListItem Value="等于">等于</asp:ListItem>
							<asp:ListItem Value="不等于">不等于</asp:ListItem>
							<asp:ListItem Value="大于">大于</asp:ListItem>
							<asp:ListItem Value="大于等于">大于等于</asp:ListItem>
							<asp:ListItem Value="小于">小于</asp:ListItem>
							<asp:ListItem Value="小于等于">小于等于</asp:ListItem>
							<asp:ListItem Value="相似于">相似于</asp:ListItem>		
						</asp:DropDownList>
						<!--比较条件-->
						</td>
						<td>值</td>
						<td>
						<!--比较值-->
						<input id="comparekey" maxlength="50" runat=server type="text" style="width:200px">
						<!--比较值-->
						</td>
					</tr>
				</table>
				<table  border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;margin-bottom:10px">
					<tr>
						<td width="90" style="padding-top:5px">与上一条件关系</td>
						<td width="140">
						<!--关系-->
							<input type="radio" name="connection" id="and" runat=server>          
							并且
							<input type="radio" name="connection" id="or" runat=server> 
							或者
						<!--关系-->
						</td>
						<td  style="padding-left:5px" align="left" ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--添加条件-->
								  <G:Button id="btn_s_add" type="toolbar" mode="on" icon="" text="添加" Url="javascript:S_Add_Click();"  runat=server></G:Button>
								  <!--添加条件-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td  style="padding-left:5px" align="left" ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--取消条件-->
								  <G:Button id="btn_s_cancel" type="toolbar" mode="on" icon="" text="取消" Url="javascript:S_Cancel_Click();"  runat=server></G:Button>
								  <!--取消条件-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td  align="left" style="padding-left:5px" ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--清空条件-->
								  <G:Button id="btn_s_clear" type="toolbar" mode="on" icon="" text="清空" Url="javascript:S_Clear_Click();"  runat=server></G:Button>
								  <!--清空条件-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td><span id="s_alert" runat="server" style="color:Red;"></span></td>
					</tr>
				</table>
				<!--条件显示框-->
				<div id="s_fstr"  style="height:111px;width:90%; background-color:#FFFFFF;border:0.2mm groove white; overflow:auto; padding-top:5px; padding-left:5px;" runat=server></div>
				<!--条件显示框-->
			</td>
		</tr>
		<tr >
			<td colspan="1"  align="right" class="td_viewcontent_title" style="pading-right:5px;">排序条件&nbsp;</td>			
			<td colspan="3"  align="left" class="td_viewcontent_content"  style="padding-left:10px;padding-bottom:5px;" >
				<table border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;margin-bottom:5px">
					<tr>
						<td width="40"  class="font1225_000000" nowrap >字段名</td>
						<td width="170" style="padding-left:0px">
						<!--排序字段-->
						<asp:DropDownList ID="i_field" Style="height:20px;width:160px" runat="server">
						</asp:DropDownList>
						<!--排序字段-->
						</td>
						<td width="90" style="padding-left:5px">
						<!--排序方式-->
							<asp:DropDownList ID="updown" Style="width: 80px" runat="server">
								<asp:ListItem Value="asc">升序</asp:ListItem>
								<asp:ListItem Value="desc">降序</asp:ListItem>
							</asp:DropDownList>
						<!--排序方式-->				
						</td>
						<td align="left" style="padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
									<td valign="bottom" class="btn_text" >
									<!--添加排序-->
									  <G:Button id="btn_i_add" type="toolbar" mode="on" icon="" text="添加" Url="javascript:I_Add_Click();"  runat=server></G:Button>
									<!--添加排序-->	
									</td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td align="left" style="padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text">
								  <!--取消排序-->
								  <G:Button id="btn_i_cancel" type="toolbar" mode="on" icon="" text="取消" Url="javascript:I_Cancel_Click();"  runat=server></G:Button>
								  <!--取消排序-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td  align="left"  style="padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text">
								  <!--清空排序-->
								  <G:Button id="btn_i_clear" type="toolbar" mode="on" icon="" text="清空" Url="javascript:I_Clear_Click();"  runat=server></G:Button>
								  <!--清空排序-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td><span id="i_alert" runat="server" style="color:Red;"></span></td>
					</tr>
			  </table>
				<!--排序显示框-->
				<div id="i_fstr"  style="height:80px;width:90% ; background-color:#FFFFFF;border:0.2mm groove white; overflow:auto;padding-top:5px; padding-left:5px;" runat=server></div>
				<!--排序显示框-->
			</td>		
		</tr>
		<tr>
			<td width="18%" align="right" class="td_viewcontent_title" style="pading-right:5px;">显示字段&nbsp;</td>			
			<td width="30%"  align="left" class="td_viewcontent_content"  style="padding-left:10px;padding-bottom:5px;padding-top:5px;" >
				<table  border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text" >
								  <!--设置显示字段-->
								  <G:Button id="btn_selectfield" type="toolbar" mode="on" icon="" text="设置显示字段" Url="javascript:var v_open = open('pop_1232_0.aspx?mid='+form1.module.value+'&field1='+form1.fld_1232_4.value+'&field2='+form1.fld_1232_7.value)"  runat=server></G:Button>
								  <!--设置显示字段-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td  style="padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text">
								  <!--预览表头-->
								  <G:Button id="btn_showfield" type="toolbar" mode="on" icon="" text="预览表头" Url="javascript:if(form1.fld_1232_4.value!=''){var v_open = open('pop_1232_2.aspx?field1='+form1.fld_1232_4.value+'&field2='+form1.fld_1232_7.value);}else{alert('请先设置显示字段！')}" runat=server ></G:Button>
								  <!--预览表头-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td width="" >&nbsp;</td>
					</tr>
			  </table>
			</td>	
			<td  width="18%" align="right" class="td_viewcontent_title">模板管理&nbsp;</td>
			<td width="30%" class="td_viewcontent_content">
				<table  border="0" cellspacing="0" cellpadding="0">
					<tr>
					  <td width="45" ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text">
								  <!--保存-->
								  <G:Button id="btn_save" type="toolbar" mode="on" icon="" text="保存" onclick="Click_Save" runat=server></G:Button>
								  <!--保存-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td width="124" ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text" nowrap>
								  <!--新模板名-->
								  模板名<input id="newname" maxlength="50" runat=server type="text" style="width:150px">
								  <!--新模板名-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>					
						<td width="" >&nbsp;</td>
					</tr>
			  </table>
			</td>		
		</tr>
		<tr >
			<td colspan="1" align="right" class="td_viewcontent_title" style="pading-right:5px;">操作&nbsp;</td>		
			<td colspan="3" class="td_viewcontent_content">
				<table width="100%"  border="0" cellspacing="0" cellpadding="0"  >
					<tr>
						<td align="left" style="padding-left:15px"><span id="alertmess" runat="server" style="color:Red;"></span></td>
						<td align="right"><table border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><table border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td class="btn_L_pic"></td>
                                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="bottom" class="btn_text">
									  <!--开始查找-->
									  <G:Button id="btn_gosearch" type="toolbar" mode="on" icon="" text="开始查找" onclick="Click_Search" runat=server></G:Button>
									  <!--开始查找-->
									  </td>
                                    </tr>
                                </table></td>
                                <td class="btn_R_pic"></td>
                              </tr>
                            </table></td>
                            <td  style="padding-left:5px; "><table border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td class="btn_L_pic"></td>
                                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="bottom" class="btn_text">
									   <!--清空-->
									  <G:Button id="btn_clear" type="toolbar" mode="on" icon="" text="清空" onclick="Click_Clear" runat=server></G:Button>
									  <!--清空-->
									  </td>
                                    </tr>
                                </table></td>
                                <td class="btn_R_pic"></td>
                              </tr>
                            </table></td>
                          </tr>
                        </table>
					  </td>
					</tr>
				</table>
			</td>		
		</tr>
	</table>
    </form>
</body>
</html>
