<!--废气排放口年排放情况,查看页-->
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
    id = GetQueryString("id", "0");  
    
	WriteTable();//画报表
}
/***************************************************************
函数名：WriteTable()
用途：画报表
变更人/日期:孙振宇  2009-5-5
***************************************************************/
private void WriteTable()
{
	/*模块编辑设置*/
	dtable = "gmis_mo_59";
	filter = " mocode=" + id;
	flds = new string[] { "fld_59_1", "fld_59_2", "fld_59_3",};
	types = "011";
	/*模块编辑设置*/
	
	if(id!="0")
	{
		guangye.BindData(dtable, filter, flds);	
	}

	string h_formstr = "";//页面显示
	string h_wordstr = "";//导出WORD
	string h_temp = "";//转换用字符串
	
	string h_code58;
	double h_pfl,h_dbpfl,h_cbpfl;
	double h_rlxh= 0;//燃料消耗
	string h_23_5="",h_23_6="",h_sbname="",h_rlname="";
	
	DataTable h_dt25 = db.GetDataTable(db.ConnStr,"select fld_25_2 from gmis_mo_25 where fld_25_15='"+guangye.GetControlValue(fld_59_1)+"'");//获取锅炉炉窑数据
	if(h_dt25.Rows.Count>0)
	{
		foreach (DataRow h_dr25 in h_dt25.Rows)
		{
			h_sbname += h_dr25["fld_25_2"].ToString()+",";
		}
		h_sbname = h_sbname.Trim(',');
	}
	
	DataTable h_dt27 = db.GetDataTable(db.ConnStr,"select (select fld_62_1 from gmis_mo_62 where mocode=fld_27_1) as fld_27_1,fld_27_4,fld_27_2/10000 as fld_27_2 from gmis_mo_27");//获取所有燃料消耗数据

	DataTable h_dt23 = db.GetDataTable(db.ConnStr,"select fld_23_3,fld_23_5,(select fld_54_1 from gmis_mo_54 where mocode=fld_23_6) as fld_23_6 from gmis_mo_23 where fld_23_1='"+guangye.GetControlValue(fld_59_1)+"'");//获取排放口数据
	if(h_dt23.Rows.Count>0)
	{
		h_23_5 = h_dt23.Rows[0]["fld_23_5"].ToString();//排放口位置
		h_23_6 = h_dt23.Rows[0]["fld_23_6"].ToString();//排放口类型
		DataRow[] h_dr27 = h_dt27.Select("fld_27_4='"+h_dt23.Rows[0]["fld_23_3"].ToString()+"'");//筛选改排放口的燃料种类
		if(h_dr27.Length>0)
		{
			foreach (DataRow h_ddr27 in h_dr27)
			{
				h_rlname += h_ddr27["fld_27_1"].ToString()+",";
				h_rlxh += Convert.ToDouble(h_ddr27["fld_27_2"]);
			}
			h_rlname = h_rlname.Trim(',');
			h_rlxh = Math.Round(h_rlxh/h_dr27.Length,4);
		}			
	}
	

	DataTable h_dt58 = db.GetDataTable(db.ConnStr,"select a.mocode,fld_58_5,case when sum(fld_1210_6) is null then 0 else sum(fld_1210_6) end as fld_1210_6,case when sum(fld_1210_7) is null then 0 else sum(fld_1210_7) end as fld_1210_7 from gmis_mo_58 a left outer join gmis_mo_1210 b on a.mocode=b.fld_1210_1 where fld_58_2='"+guangye.GetControlValue(fld_59_1)+"' and fld_58_3="+guangye.GetControlValue(fld_59_2)+" group by a.mocode,fld_58_5");//获取所有月的主表数据。列数据“fld_1210_6”和“fld_1210_7”为关联扩展表对应字段的和，这里是1对多的关系，语句后用了GROUP BY。

	if (h_dt58.Rows.Count>0)
	{		
		h_code58 = "";//关联mocode号
		h_pfl = 0;//总排放量
		h_dbpfl = 0;//其中达标排放量
		h_cbpfl = 0;//其中超标排放量
		foreach (DataRow h_dr58 in h_dt58.Rows)
		{
			h_code58 += h_dr58["mocode"].ToString()+",";
			h_pfl += Convert.ToDouble(h_dr58["fld_58_5"]);
			if(h_dr58["fld_1210_6"].ToString()!="0")
			{
				h_dbpfl += Convert.ToDouble(h_dr58["fld_58_5"]);
			}
			else if(h_dr58["fld_1210_7"].ToString()!="0")
			{
				h_cbpfl += Convert.ToDouble(h_dr58["fld_58_5"]);
			}
		}
		h_code58 = h_code58.Trim(',');
		h_pfl = Math.Round(h_pfl/10000,6);
		h_dbpfl = Math.Round(h_dbpfl/10000,6);
		h_cbpfl = Math.Round(h_cbpfl/10000,6);
		

		DataTable h_dt1210 = db.GetDataTable(db.ConnStr,"select (select fld_1206_1 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1210_2,sum(fld_1210_5)/1000 as fld_1210_5,sum(fld_1210_6)/1000 as fld_1210_6,sum(fld_1210_7)/1000 as fld_1210_7 from gmis_mo_1210 where fld_1210_1 in ("+h_code58+") group by fld_1210_2");//获取所有月的扩展表数据各污染物的数值和

		h_formstr = "<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\">废气排放口年排放情况</td>\n</tr>\n</table>\n";

		h_wordstr = h_formstr;
		
		h_formstr += "<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n";
		h_wordstr += "<table width=\"100%\"  border=\"1\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n";
		
		h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"10%\"> 排放口编号 </td>\n<td colspan=\"2\">"+guangye.GetControlValue(fld_59_1)+"&nbsp;</td>\n<td>排放口位置 </td>\n<td width=\"30%\" colspan=\"4\">"+h_23_5+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> 排放口类型</td>\n<td colspan=\"2\">"+h_23_6+"&nbsp;</td>\n<td width=\"16%\">设备名称</td>\n<td colspan=\"4\">"+h_sbname+"&nbsp; </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> 排放天数 </td>\n<td align=\"left\" style=\"padding-left:180px\" colspan=\"7\">"+guangye.GetControlValue(fld_59_3)+"&nbsp; </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> 燃料名称 </td>\n<td colspan=\"2\">"+h_rlname+"&nbsp;</td>\n<td> 燃料耗量（万吨或万立方米） </td>\n<td colspan=\"4\">"+h_rlxh.ToString()+"&nbsp; </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"2\"> 废气排放量（万标立方米） </td>\n<td colspan=\"2\" rowspan=\"2\">"+h_pfl.ToString()+"&nbsp; </td>\n<td width=\"16%\"> 其中达标排放量（万标立方米） </td>\n<td colspan=\"4\">"+h_dbpfl.ToString()+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> 其中超标排放量(万标立方米) </td>\n<td colspan=\"4\">"+h_cbpfl.ToString()+"&nbsp;</td>\n</tr>\n";

		h_formstr += h_temp;
		
		h_wordstr += h_temp;
		
		h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"3\"> 污染物名称 </td>\n<td colspan=\"7\"> 污染物排放量（吨） </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"11%\" rowspan=\"2\"> 合计 </td>\n<td colspan=\"6\"> 其中 </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"33%\" colspan=\"3\"> 达标排放量  </td>\n<td colspan=\"3\">超标排放量 </td>\n</tr>\n";

		h_formstr += h_temp;
		
		h_wordstr += h_temp;


		if(h_dt1210.Rows.Count>0)
		{
			int i = 1;//序号
			foreach (DataRow h_dr1210 in h_dt1210.Rows)
			{
				h_temp = "<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td>（"+i.ToString()+"）"+h_dr1210["fld_1210_2"].ToString()+" </td>\n<td>"+h_dr1210["fld_1210_5"].ToString()+"&nbsp;</td>\n<td colspan=\"3\">"+h_dr1210["fld_1210_6"].ToString()+"&nbsp;</td>\n<td colspan=\"3\">"+h_dr1210["fld_1210_7"].ToString()+"&nbsp;</td>\n</tr>\n";

				h_formstr += h_temp;
		
				h_wordstr += h_temp;
				
				i++;
			}
			
		}
		
		h_temp ="</table>\n";

		h_formstr += h_temp;				
				
		h_wordstr += h_temp;
	


		guangye.SetControlValue(div_form,h_formstr);
		guangye.SetControlValue(div_word,h_wordstr);
	}
}
private void Click_Toolbar(object sender, System.EventArgs e)
{
    string idstr = ((Control)sender).ID.ToLower();

    switch (idstr)
    {
        case "btn_word":
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "GB2312";
            Response.AppendHeader("Content-Disposition", "attachment;filename="+guangye.GetControlValue(fld_59_2)+"年"+guangye.GetControlValue(fld_59_1)+"排放口年废气排放情况.doc");
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
            Response.ContentType = "application/ms-word";
            this.EnableViewState = false;
            System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
            System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
            System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
            oHtmlTextWriter.Write(div_word.InnerHtml);
            Response.Write(oStringWriter.ToString());
            Response.End();
            break;        
        case "btn_print":         
            SetSESSION("filter", div_form.InnerHtml);
            Page.RegisterStartupScript("print", "<scrip" + "t>window.open('pop_0.aspx', 'newwindow', 'height=600,width=800,top=30,left=30,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no')</" + "script>");
            break;
    }
}
</script>
<script>
function clickPrint()
{   
	__doPostBack("btn_print","");
}
function clickOutPutWord()
{
	__doPostBack("btn_word","");
}

</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<table width="100%">
<tr>
<!--打印预览-->
<td width="100%"></td>
<td style="padding-right:5px;" nowrap align="right">
	<G:Button id="btn_printtxt" type="toolbar" mode="on" text="打印预览" icon="print" Url="javascript:clickPrint();" runat="server"></G:Button>
</td> 
<!--打印预览-->
<!--导出Word-->
<td style="padding-right:5px;" nowrap align="right">
	<G:Button id="btn_wordtxt" type="toolbar" mode="on" text="导出Word" icon="word" Url="javascript:clickOutPutWord();" runat="server"></G:Button>
</td> 
<!--导出Word-->
</tr>
</table>
<!--动态生成html,开始-->
<asp:LinkButton ID="btn_print" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<asp:LinkButton ID="btn_word" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<input id="fld_59_1" type="hidden" runat="server" ></td>
<input id="fld_59_2" type="hidden" runat="server" ></td>
<input id="fld_59_3" type="hidden" runat="server" ></td>
<!--报表,开始-->
<div id="div_form" runat=server></div>
<!--报表,结束-->
<!--动态生成html,结束-->
<div id="div_word" runat=server style="display:none"></div>
</form>
</body>
</html>
