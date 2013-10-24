<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->

<script language="c#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
	if (!IsPostBack)
	{
		//绑定模块组下拉框
		select_modulegroup.Items.Add(new ListItem("污染源数据管理","17"));
		select_modulegroup.Items.Add(new ListItem("全国污染源普查","40"));	
		SetFilter(select_modulegroup, "17");
		
		if (guangye.GetControlValue(select_modulegroup) != "0" && guangye.GetControlValue(select_modulegroup) != "")
		{
			//绑定模块下拉框
			DataTable h_mdt = db.GetDataTable(db.ConnStr,"select modulecode,(REPLICATE('　',modulelevel-2)+modulename) as modulename from gmis_module where moduleindex like '%'+(select moduleindex from gmis_module where modulecode="+guangye.GetControlValue(select_modulegroup)+")+'%' and modulestate=0 and exists (SELECT 1 FROM sysobjects WHERE xtype = 'U' AND OBJECTPROPERTY (id, 'IsMSShipped') = 0 and id=object_id ('gmis_mo_'+Cast(modulecode as varchar(50)))) order by moduleindex");
			BindListControl(select_module, "modulecode", "modulename", h_mdt);
			if (h_mdt.Rows.Count>0)
			{
				SetFilter(select_module, h_mdt.Rows[0][0].ToString());

				//绑定字段名下拉框
				DataTable h_fdt = db.GetDataTable(db.ConnStr,"select caption,fieldcode from gmis_field where isvital=0 and fieldstatus=0 and modulecode="+guangye.GetControlValue(select_module)+" order by fieldindex");
				BindListControl(select_field, "fieldcode", "caption", h_fdt);
				if (h_fdt.Rows.Count>0)
				{
					SetFilter(select_field, h_fdt.Rows[0][1].ToString());
				}
			}
		}
	}
	

}

//模块组筛选
private void Change_Group(object sender, System.EventArgs e)
{
	if (guangye.GetControlValue(select_modulegroup) != "0" && guangye.GetControlValue(select_modulegroup) != "")
	{
		//绑定模块下拉框
		DataTable h_mdt = db.GetDataTable(db.ConnStr,"select modulecode,(REPLICATE('　',modulelevel-2)+modulename) as modulename from gmis_module where moduleindex like '%'+(select moduleindex from gmis_module where modulecode="+guangye.GetControlValue(select_modulegroup)+")+'%' and modulestate=0 and exists (SELECT 1 FROM sysobjects WHERE xtype = 'U' AND OBJECTPROPERTY (id, 'IsMSShipped') = 0 and id=object_id ('gmis_mo_'+Cast(modulecode as varchar(50)))) order by moduleindex");
		BindListControl(select_module, "modulecode", "modulename", h_mdt);
		if (h_mdt.Rows.Count>0)
		{
			SetFilter(select_module, h_mdt.Rows[0][0].ToString());

			//绑定字段名下拉框
			DataTable h_fdt = db.GetDataTable(db.ConnStr,"select caption,fieldcode from gmis_field where isvital=0 and fieldstatus=0 and modulecode="+guangye.GetControlValue(select_module)+" order by fieldindex");
			BindListControl(select_field, "fieldcode", "caption", h_fdt);
			if (h_fdt.Rows.Count>0)
			{
				SetFilter(select_field, h_fdt.Rows[0][1].ToString());
			}
		}
	}	
} 
//模块筛选
private void Change_Module(object sender, System.EventArgs e)
{
	if (guangye.GetControlValue(select_module) != "0" && guangye.GetControlValue(select_module) != "")
	{
		//绑定字段名下拉框
		DataTable h_fdt = db.GetDataTable(db.ConnStr,"select caption,fieldcode from gmis_field where isvital=0 and fieldstatus=0 and modulecode="+guangye.GetControlValue(select_module)+" order by fieldindex");
		BindListControl(select_field, "fieldcode", "caption", h_fdt);
		if (h_fdt.Rows.Count>0)
		{
			SetFilter(select_field, h_fdt.Rows[0][1].ToString());
		}	
	}	
}
//按钮事件
private void Click_Toolbar(object sender, System.EventArgs e)
{
	string exeinfo = "";
	string h_data = ((Guangye.WebApplication.Controls.Button)sender).Data;
	if (h_data == "0")
	{
		string h_fstr = "",h_module = "",h_field = "";
		if (guangye.GetControlValue(select_field) != "" && guangye.GetControlValue(key) != "")
		{
			DataTable h_fdt = db.GetDataTable(db.ConnStr,"select fieldname from gmis_field where fieldcode="+guangye.GetControlValue(select_field));
			if (h_fdt.Rows.Count>0)
			{
				
				h_fstr = h_fdt.Rows[0][0].ToString()+" like '%"+guangye.GetControlValue(key)+"%'";
			}
			h_fdt = db.GetDataTable(db.ConnStr,"select fieldname from gmis_field where modulecode="+guangye.GetControlValue(select_module)+" and fieldstatus=0 and oneditlist=1");
			foreach (DataRow dr in h_fdt.Rows)
			{
				h_field += dr["fieldname"].ToString()+",100|";
			}
			h_field = h_field.Trim('|');
			h_module = guangye.GetControlValue(select_module);
			
			if (guangye.GetControlValue(select_modulegroup)=="17" )
			{
				SetSESSION("filter",StringUtility.StringToBase64(h_fstr)+"##"+h_field+"#"+h_module+"#");
				Page.RegisterStartupScript("","<s"+"cript>window.open('pop_1228_1.aspx');</s"+"cript>");
			}
			else
			{
				SetSESSION("filter",StringUtility.StringToBase64(h_fstr)+"##"+h_field+"#"+h_module+"##");
				Page.RegisterStartupScript("","<s"+"cript>window.open('pop_1232_1.aspx');</s"+"cript>");
			}						
		}
	}
	else
	{
		if (guangye.GetControlValue(select_modulegroup)=="17" )
		{
			Page.RegisterStartupScript("","<s"+"cript>parent.location.href='list_1228.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=1228';</s"+"cript>");
		}
		else
		{
			Page.RegisterStartupScript("","<s"+"cript>parent.location.href='list_1232.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=1232';</s"+"cript>");
		}	
	}
}  
</script>                


<body >
<form id="form1" runat="server">    
<table  border="0" cellspacing="0" cellpadding="3">
<tr>
  <td class="font1225_000000" style="padding-left:5px; ">模块组</td>
  <td style="padding-left:5px; ">
  <asp:DropDownList ID="select_modulegroup" AutoPostBack="true" OnSelectedIndexChanged="Change_Group" runat="server" ></asp:DropDownList>
  </td>
  <td class="font1225_000000" style="padding-left:5px; ">模块</td>
  <td style="padding-left:5px; "> 
  <asp:DropDownList ID="select_module" style="width:180px" AutoPostBack="true" OnSelectedIndexChanged="Change_Module" runat="server" ></asp:DropDownList>
  </td>
  <td style="padding-left:5px; ">字段</td>
  <td style="padding-left:5px; ">
  <asp:DropDownList style="width:200px" ID="select_field" runat="server" ></asp:DropDownList>
  </td>
  <td style="padding-left:5px; "><input id="key" runat=server maxlength="50" type="text" name="textfield" style="width:100px; "></td>
  <td style="padding-left:5px; "><G:Button id="btn_search" type="toolbar" mode="on" icon="tb08" text="检索" onclick="Click_Toolbar" data="0" runat="server"></G:Button></td>
  <td style="padding-left:5px; "><G:Button id="btn_gosearch" type="toolbar" mode="on" text="高级检索" onclick="Click_Toolbar" data="1" runat="server"></G:Button></td>
</tr>
</table>
</form>
</body>
</html>
