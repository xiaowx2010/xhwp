<!--污水排放口年排放情况,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->

<!--主表：gmis_mo_20
关联表：gmis_mo_19，关联条件：（gmis_mo_19.fld_19_3=gmis_mo_20.fld_20_2）;）
-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{    
     
    SetToolBar();//设置工具条,同时获取固定URL参数    
	tb_save.Visible = false; //隐藏保存按钮


	/*模块编辑设置*/
	dtable = "gmis_mo_20";
	filter = " mocode=" + id;
	flds = new string[] { "fld_20_1", "fld_20_2", "fld_20_3", "fld_20_4", "fld_20_5"};
	types = "01110";
	/*模块编辑设置*/	

	if(!IsPostBack)
	{
		if(id!="0")
		{
			guangye.BindData(dtable, filter, flds);	

			SetFilter(fld_20_4txt,(guangye.GetControlValue(fld_20_4).ToLower()=="true")?"1":"0");
			guangye.SetControlValue(fld_20_1txt,guangye.GetControlValue(fld_20_1));
			guangye.SetControlValue(fld_20_2txt,guangye.GetControlValue(fld_20_2));
		}
		BindListForm();//绑定报表
	}
}
/***************************************************************
函数名：BindListForm()
用途：绑定报表
变更人/日期:孙振宇  2009-4-30
***************************************************************/
private void BindListForm()
{
	StringBuilder h_sb;
	
	string h_code19;
	double h_pfl,h_dbpfl,h_cbpfl;
	string h_53_5="",h_53_7="",h_53_8="",h_53_10="";
	
	DataTable h_dt53 = db.GetDataTable(db.ConnStr,"select fld_53_5,(select fld_1165_2 from gmis_mo_1165 where mocode=fld_53_7) as fld_53_7,fld_53_8,(select fld_1196_1 from gmis_mo_1196 where mocode=fld_53_10) as fld_53_10 from gmis_mo_53 where fld_53_1='"+guangye.GetControlValue(fld_20_1txt)+"'");//获取排放口数据
	if(h_dt53.Rows.Count>0)
	{
		h_53_5 = h_dt53.Rows[0]["fld_53_5"].ToString();//排放口位置
		h_53_7 = h_dt53.Rows[0]["fld_53_7"].ToString();//排放去向
		h_53_8 = h_dt53.Rows[0]["fld_53_8"].ToString();//污水排放规律
		h_53_10 = h_dt53.Rows[0]["fld_53_10"].ToString();//水体名称
	}
	

	DataTable h_dt19 = db.GetDataTable(db.ConnStr,"select a.mocode,fld_19_5,case when sum(fld_1209_5) is null then 0 else sum(fld_1209_5) end as fld_1209_5,case when sum(fld_1209_6) is null then 0 else sum(fld_1209_6) end as fld_1209_6 from gmis_mo_19 a left outer join gmis_mo_1209 b on a.mocode=b.fld_1209_1 where fld_19_2='"+guangye.GetControlValue(fld_20_1txt)+"' and fld_19_3="+guangye.GetControlValue(fld_20_2txt)+" group by a.mocode,fld_19_5");//获取所有月的主表数据。列数据“fld_1209_5”和“fld_1209_6”为关联扩展表对应字段的和，这里是1对多的关系，语句后用了GROUP BY。

	if (h_dt19.Rows.Count>0)
	{
		
		h_code19 = "";//关联mocode号
		h_pfl = 0;//总排放量
		h_dbpfl = 0;//其中达标排放量
		h_cbpfl = 0;//其中超标排放量
		foreach (DataRow h_dr19 in h_dt19.Rows)
		{
			h_code19 += h_dr19["mocode"].ToString()+",";
			h_pfl += Convert.ToDouble(h_dr19["fld_19_5"]);
			if(h_dr19["fld_1209_5"].ToString()!="0")
			{
				h_dbpfl += Convert.ToDouble(h_dr19["fld_19_5"]);
			}
			else if(h_dr19["fld_1209_6"].ToString()!="0")
			{
				h_cbpfl += Convert.ToDouble(h_dr19["fld_19_5"]);
			}
		}
		h_code19 = h_code19.Trim(',');
		h_pfl = Math.Round(h_pfl/10000,6);
		h_dbpfl = Math.Round(h_dbpfl/10000,6);
		h_cbpfl = Math.Round(h_cbpfl/10000,6);
		

		DataTable h_dt1209 = db.GetDataTable(db.ConnStr,"select (select fld_1205_1 from gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2=b.mocode where a.mocode=fld_1209_2) as fld_1209_2,sum(fld_1209_4)/1000 as fld_1209_4,sum(fld_1209_5)/1000 as fld_1209_5,sum(fld_1209_6)/1000 as fld_1209_6 from gmis_mo_1209 where fld_1209_1 in ("+h_code19+") group by fld_1209_2");//获取所有月的扩展表数据各污染物的数值和

		h_sb = new StringBuilder();//画表格用stringbuilder

		h_sb.Append("<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\">污水排放口年排放情况</td>\n</tr>\n</table>\n");

		h_sb.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> 排放口编号</td>\n<td colspan=\"2\">"+guangye.GetControlValue(fld_20_1txt)+"&nbsp; </td>\n<td> 排放口位置 </td>\n<td colspan=\"5\">"+h_53_5+"&nbsp; </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> 排放天数</td>\n<td colspan=\"2\">"+guangye.GetControlValue(fld_20_3)+"&nbsp; </td>\n<td> 排放去向 </td>\n<td width=\"15%\">"+h_53_7+"&nbsp;</td>\n<td rowspan=\"2\"> 污水排放量<br>（万吨） </td>\n<td width=\"100\" rowspan=\"2\">"+h_pfl.ToString()+"&nbsp;</td>\n<td> 其中达标排放量（万吨） </td>\n<td width=\"9%\">"+h_dbpfl.ToString()+"&nbsp;</td>\n</tr>\n  <tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> 污水排放规律 </td>\n<td colspan=\"2\">"+h_53_8+"&nbsp; </td>\n <td> 水体名称 </td>\n<td>"+h_53_10+"&nbsp;</td>\n<td> 其中超标排放量（万吨） </td>\n <td>"+h_cbpfl.ToString()+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> 废水处理是否委托<br>专业化运行单位管理 </td>\n<td colspan=\"3\">"+fld_20_4txt.SelectedItem.Text+"&nbsp;</td>\n<td> 专业话运行单位名称 </td>\n<td colspan=\"4\">"+guangye.GetControlValue(fld_20_5)+"&nbsp;</td>\n</tr>\n");

		h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"3\">污染物名称</td>\n<td colspan=\"8\"> 污染物排放量（吨）</td>\n</tr>\n<tr align=\"center\" valign=\"middle\">\n<td width=\"10%\" rowspan=\"2\" bgcolor=\"#FFFFFF\"> 合计 </td>\n<td colspan=\"7\" bgcolor=\"#FFFFFF\"> 其中 </td>\n</tr>\n<tr align=\"center\" valign=\"middle\">\n<td colspan=\"3\" bgcolor=\"#FFFFFF\"> 达标排放量  </td>\n<td colspan=\"4\" bgcolor=\"#FFFFFF\">超标排放量 </td>\n</tr>\n");

		if(h_dt1209.Rows.Count>0)
		{
			int i = 1;//序号
			foreach (DataRow h_dr1209 in h_dt1209.Rows)
			{
				h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> （"+i.ToString()+"）"+h_dr1209["fld_1209_2"].ToString()+" </td>\n<td>"+h_dr1209["fld_1209_4"].ToString()+"&nbsp;</td>\n<td colspan=\"3\">"+h_dr1209["fld_1209_5"].ToString()+"&nbsp;</td>\n<td colspan=\"4\">"+h_dr1209["fld_1209_6"].ToString()+"&nbsp;</td>\n</tr>\n");
				i++;
			}
			
		}
		
		h_sb.Append("</table>\n");

		guangye.SetControlValue(div_form,h_sb.ToString());
	}	
}
private void Click_Toolbar(object sender, System.EventArgs e)
{
	string idstr = ((Control)sender).ID.ToLower();
	switch (idstr)
	{
		//生成报表
		case "btn_putdata":
			guangye.SetControlValue(fld_20_1,guangye.GetControlValue(fld_20_1txt));//排放口代码
			guangye.SetControlValue(fld_20_2,guangye.GetControlValue(fld_20_2txt));//年份
			guangye.SetControlValue(fld_20_4,guangye.GetControlValue(fld_20_4txt));//废水处理是否委托专业化运行单位管理
			tb_save.Visible = true;
			BindListForm();//绑定报表
			break;
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
			<!--#include file="toolbar.aspx"-->
			<td align=left style="padding-left: 5px;" nowrap>
				<G:Button id="btn_putdata" type="toolbar" mode="on" icon="TB24" text="生成报表" onclick="Click_Toolbar" runat="server">
				</G:Button>
			</td>
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<!--基本信息,开始-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="150" align="right"  class="td_viewcontent_title">排放口代码:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<span id="fld_20_1txt" runat=server></span>
		<input id="fld_20_1" type="hidden" runat="server" ></td>
		
		<td width="150" align="right"  class="td_viewcontent_title">年份:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<span id="fld_20_2txt" runat=server></span>&nbsp;年
		<input id="fld_20_2" type="hidden" runat="server" >
		</td>
	</tr>
	<tr>
		<td width="150" align="right"  class="td_viewcontent_title">排放天数:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_20_3" type="text" class="boxbline" style="width:95%;"  maxlength="4" runat="server" ></td>		
		<td width="150" align="right"  class="td_viewcontent_title">废水处理是否委托专业化运行单位管理:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_20_4" type="hidden" runat="server" >
		<asp:DropDownList id="fld_20_4txt" style="width:95%;" runat="server">
		<asp:ListItem Value="0">否</asp:ListItem>
		<asp:ListItem Value="1">是</asp:ListItem>
		</asp:DropDownList></td>
	</tr>
	<tr>
		<td width="150" align="right"  class="td_viewcontent_title">专业化运行单位名称:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_20_5" type="text" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>		
		<td width="150" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
	</tr>
</table>
<!--基本信息,结束-->
<!--报表,开始-->
<div id="div_form" runat=server></div>
<!--报表,结束-->
<!--动态生成html,结束-->
</form>
</body>
</html>
