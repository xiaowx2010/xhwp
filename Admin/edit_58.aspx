<!--废气排放口污染物月排放情况,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--主表：gmis_mo_58
关联表：gmis_mo_1210，关联条件：（gmis_mo_58.mocode=gmis_mo_1210.fld_1210_1）;）
-->
<script language="C#" runat="server">
DataTable p_wrwdt;
string p_type;
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//设置工具条,同时获取固定URL参数    
	string pfkcode = GetQueryString("pfkcode", "");  //排放口ID
	string dwcode = GetQueryString("dwcode", "");  //单位ID
	string yearstr = GetQueryString("yearstr", DateTime.Now.Year.ToString());  //年份
	string monthstr = GetQueryString("monthstr", DateTime.Now.Month.ToString());  //月份
	tb_save.Visible = false; //隐藏保存按钮
	

	/*模块编辑设置*/
	dtable = "gmis_mo_58";
	filter = " mocode=" + id;
	flds = new string[] { "fld_58_1", "fld_58_2", "fld_58_3","fld_58_4", "fld_58_5", "fld_58_6", "fld_58_7", "fld_58_8" };
	types = "00111111";
	/*模块编辑设置*/
	
	if (!IsPostBack)
	{
        int h_yearstr = Convert.ToInt32(DateTime.Now.Year);

		//绑定年份下拉框
		for (int i=h_yearstr-10;i<h_yearstr+10;i++)
		{
			fld_58_3.Items.Add(new ListItem(i.ToString(),i.ToString()));
		}
		SetFilter(fld_58_3, yearstr);

		//绑定月份下拉框
		for (int i=1;i<13;i++)
		{
			fld_58_4.Items.Add(new ListItem(i.ToString().PadLeft(2,'0'),i.ToString()));
		}
		SetFilter(fld_58_4,monthstr );
        
		DataTable h_fromdt = db.GetDataTable(db.ConnStr,"select mocode,fld_1208_1 from gmis_mo_1208");//绑定数据来源

		if (h_fromdt.Rows.Count>0)
		{
			//绑定数据来源		
			BindListControl(fld_58_6, "mocode", "fld_1208_1",h_fromdt);
			SetFilter(fld_58_6,((h_fromdt.Rows.Count > 0) ? h_fromdt.Rows[0]["mocode"].ToString() : "0"));
		}
		
		
		
		
		if(id!="0")
		{
			guangye.BindData(dtable, filter, flds);	
			guangye.SetControlValue(fld_58_1txt,guangye.GetControlValue(fld_58_1));
			guangye.SetControlValue(fld_58_2txt,guangye.GetControlValue(fld_58_2));
		}
		else
		{		
			if(pfkcode!=""&&dwcode!="")
			{
				guangye.SetControlValue(fld_58_1,dwcode);
				guangye.SetControlValue(fld_58_2,pfkcode);
				guangye.SetControlValue(fld_58_1txt,guangye.GetControlValue(fld_58_1));
				guangye.SetControlValue(fld_58_2txt,guangye.GetControlValue(fld_58_2));
			}
			
			CheckForm();//检索当年当月是否已经有报表					
		}

		
	}
	//获取所有污染物
	DataTable h_wrwdt = db.GetDataTable(db.ConnStr,"select fld_23_11,(select fld_54_1 from gmis_mo_54 where mocode=fld_23_6) as fld_23_6 from gmis_mo_23 where fld_23_1='"+guangye.GetControlValue(fld_58_2txt)+"'");

	
	if (h_wrwdt.Rows.Count>0&&h_wrwdt.Rows[0][0].ToString().Trim(';')!="")
	{
		guangye.SetControlValue(control_id,h_wrwdt.Rows[0][0].ToString().Trim(';').Replace(';',','));

		p_type = h_wrwdt.Rows[0]["fld_23_6"].ToString();	
		
		WriteEditList();//画污染物编辑框
	}
	
	
	BindExtData();//分析扩展数据	
	
	
	BindListForm();//绑定报表
		
	
}

/***************************************************************
函数名：BindListForm()
用途：绑定报表
变更人/日期:孙振宇  2009-5-4
***************************************************************/
private void BindListForm()
{
	StringBuilder h_sb = new StringBuilder();//画表格
	
	p_type = (p_type!=null)?p_type:"";

	h_sb.Append("<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0 ;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\"><p>废气排放口污染物月排放情况</p></td>\n</tr>\n</table>\n");
	
	h_sb.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"8%\"> 排放口编号 </td>\n<td width=\"8%\">"+guangye.GetControlValue(fld_58_2txt)+"&nbsp;</td>\n<td width=\"8%\"> 排放口类型 </td>\n<td width=\"10%\">"+p_type+"&nbsp;</td>\n<td width=\"8%\">废气排放量（标立方米）</td>\n<td width=\"10%\">"+guangye.GetControlValue(fld_58_5)+"&nbsp;</td>\n<td width=\"8%\"> 废气排放数据来源 </td>\n<td width=\"9%\">"+fld_58_6.SelectedItem.Text+"&nbsp;</td>\n<td width=\"6%\"> 排放天数（天） </td>\n<td width=\"9%\">"+guangye.GetControlValue(fld_58_7)+"&nbsp;</td>\n<td width=\"8%\"> 林格曼黑度（级） </td>\n<td width=\"8%\">"+guangye.GetControlValue(fld_58_8)+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"2\"> 污染物名称 </td>\n<td colspan=\"2\"> 排放浓度（毫克/小时） </td>\n<td colspan=\"2\"> 排放速率（千克/小时） </td>\n<td rowspan=\"2\"> 数据来源 </td>\n<td colspan=\"6\"> 排放量（千克） </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> 执行标准值 </td>\n<td> 排放浓度 </td>\n<td> 执行标准值 </td>\n<td> 排放速率 </td>\n<td colspan=\"2\"> 合计  </td>\n<td colspan=\"2\">达标排放量 </td>\n<td colspan=\"2\"> 超标排放量 </td>\n</tr>\n");
	
	if(guangye.GetControlValue(control_id)!="")
	{
		DataTable h_fromdt = db.GetDataTable(db.ConnStr,"select mocode,fld_1208_1 from gmis_mo_1208");//绑定数据来源
		if (guangye.GetControlValue(control_value)!="") //判断是否已生成
		{
			string[] h_ccode = guangye.GetControlValue(control_value).Trim('|').Split('|');
			if(h_ccode.Length>0)
			{
				if(p_wrwdt!=null&&p_wrwdt.Rows.Count>0)
				{
					for (int i =0;i<h_ccode.Length ;i++ )
					{
						string[] h_cvalue = h_ccode[i].Trim(',').Split(',');
						if(h_cvalue.Length>6)
						{
							DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_cvalue[1]);
							DataRow[] h_fromdr = h_fromdt.Select("mocode="+h_cvalue[7]);
							if(h_wrwdr.Length>0 && h_fromdr.Length>0)
							{
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td>"+(i+1).ToString()+"）"+h_wrwdr[0]["fld_1206_1"].ToString()+"</td>\n<td>"+h_wrwdr[0]["fld_1206_4"].ToString()+"&nbsp;</td>\n<td>"+h_cvalue[2]+"&nbsp;</td>\n<td>"+h_wrwdr[0]["fld_1206_5"].ToString()+"&nbsp;</td>\n<td>"+h_cvalue[3]+"&nbsp;</td>\n<td>"+h_fromdr[0]["fld_1208_1"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_cvalue[4]+"&nbsp;</td>\n<td colspan=\"2\">"+h_cvalue[5]+"&nbsp;</td>\n<td colspan=\"2\">"+h_cvalue[6]+"&nbsp;</td>\n</tr>\n");
							}
						}
						
					}
				}
			}
		}
		else
		{
			string[] h_ccode = guangye.GetControlValue(control_id).Trim(',').Split(',');
			if(h_ccode.Length>0)
			{
				if (id!="0")
				{				
					DataTable h_bbdt = db.GetDataTable(db.ConnStr,"select fld_1210_1,fld_1210_2,(select fld_1206_1 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_1,(select fld_1206_4 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_4,fld_1210_3,(select fld_1206_5 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_5,fld_1210_4,fld_1210_5,fld_1210_6,fld_1210_7,fld_1210_8,(select fld_1208_1 from gmis_mo_1208 where mocode=fld_1210_8) as fld_1208_1 from gmis_mo_1210 where fld_1210_1="+id); //绑定报表扩展表

					if(h_bbdt.Rows.Count>0)
					{
						
						for (int i =0;i<h_ccode.Length ;i++ )
						{
							DataRow[] h_bbdr = h_bbdt.Select("fld_1210_2="+h_ccode[i]);
							if(h_bbdr.Length>0)
							{
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td>"+(i+1).ToString()+"）"+h_bbdr[0]["fld_1206_1"].ToString()+"</td>\n<td>"+h_bbdr[0]["fld_1206_4"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1210_3"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1206_5"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1210_4"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1208_1"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_bbdr[0]["fld_1210_5"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_bbdr[0]["fld_1210_6"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_bbdr[0]["fld_1210_7"].ToString()+"&nbsp;</td>\n</tr>\n");
							}
						}
					}
				}
				else
				{
					if(p_wrwdt!=null&&p_wrwdt.Rows.Count>0)
					{
						for (int i =0;i<h_ccode.Length ;i++ )
						{
							DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_ccode[i]);
							if(h_wrwdr.Length>0)
							{
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td>"+(i+1).ToString()+"）"+h_wrwdr[0]["fld_1206_1"].ToString()+"</td>\n<td>"+h_wrwdr[0]["fld_1206_4"].ToString()+"&nbsp;</td>\n<td>&nbsp;</td>\n<td>"+h_wrwdr[0]["fld_1206_5"].ToString()+"&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td colspan=\"2\">&nbsp;</td>\n<td colspan=\"2\">&nbsp;</td>\n<td colspan=\"2\">&nbsp;</td>\n</tr>\n");	
							}
						}
					}
				}
			}
		}
	}	
	h_sb.Append("</table>\n");
	
	div_form.InnerHtml = h_sb.ToString();
}

/***************************************************************
函数名：BindExtData()
用途：分析扩展表数据
变更人/日期:孙振宇  2009-5-4
***************************************************************/
private void BindExtData()
{
	DataTable h_extdt = new DataTable();

	if(id != "0")
	{
		h_extdt = db.GetDataTable(db.ConnStr,"select fld_1210_1,fld_1210_2,fld_1210_3,fld_1210_4,fld_1210_5,fld_1210_6,fld_1210_7,fld_1210_8 from gmis_mo_1210 where fld_1210_1="+id);
	}
	
	DataTable h_jcdt = db.GetDataTable(db.ConnStr,"select case when avg(fld_24_7) is null then 0 else avg(fld_24_7) end as avgstr,case when avg(fld_24_10) is null then 0 else avg(fld_24_10) end as avgstr1,case when avg(fld_24_9) is null then 0 else avg(fld_24_9) end as avgstr2 from gmis_mo_24 where fld_24_1='"+guangye.GetControlValue(fld_58_2txt)+"' and fld_24_8='"+guangye.GetControlValue(fld_58_1txt)+"' and datepart(year,fld_24_3) = "+guangye.GetControlValue(fld_58_3)+" and datepart(month,fld_24_3) = "+guangye.GetControlValue(fld_58_4)+"");

	if(h_jcdt.Rows.Count>0 && guangye.GetControlValue(control_id)!="")
	{			
		if(h_jcdt.Rows[0][2].ToString()!="0")
		{			
			guangye.SetControlValue(fld_58_8,h_jcdt.Rows[0][2].ToString());//绑定格林黑度	
			
			fld_58_8.Attributes["readonly"] = "true";
		}
		
		string[] h_ccode = guangye.GetControlValue(control_id).Split(',');
		
		if(h_ccode.Length>0)
		{				
			for (int i=0;i<h_ccode.Length;i++)
			{
				if (id!="0" && h_extdt.Rows.Count>0)
				{
					DataRow[] h_drextdr = h_extdt.Select("fld_1210_2="+h_ccode[i].ToString());
					if(h_drextdr.Length>0)
					{
						guangye.SetControlValue(div_list.FindControl("input_" + h_drextdr[0][1].ToString()),h_drextdr[0][2].ToString());//绑定浓度
						guangye.SetControlValue(div_list.FindControl("input1_" + h_drextdr[0][1].ToString()),h_drextdr[0][2].ToString());//绑定速率			
						SetFilter((DropDownList)div_list.FindControl("select_" + h_drextdr[0][1].ToString()), h_drextdr[0][7].ToString());//绑定数据来源
					}
					else
					{
						if(h_jcdt.Rows[0][0].ToString()!="0")
						{
							guangye.SetControlValue(div_list.FindControl("input_" + h_ccode[i].ToString()),h_jcdt.Rows[0][0].ToString());//绑定浓度
							
							HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input_" + h_ccode[i].ToString());//强转为HtmlInputText
							
							h_input.Attributes["readonly"] = "true";	
						}	
						if(h_jcdt.Rows[0][1].ToString()!="0")
						{						
							guangye.SetControlValue(div_list.FindControl("input1_" + h_ccode[i].ToString()),h_jcdt.Rows[0][1].ToString());//绑定速率
							
							HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input1_" + h_ccode[i].ToString());//强转为HtmlInputText
							
							h_input.Attributes["readonly"] = "true";	
						}	
					}
				}
				else
				{
					if(h_jcdt.Rows[0][0].ToString()!="0")
					{
						guangye.SetControlValue(div_list.FindControl("input_" + h_ccode[i].ToString()),h_jcdt.Rows[0][0].ToString());//绑定浓度
						
						HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input_" + h_ccode[i].ToString());//强转为HtmlInputText
						
						h_input.Attributes["readonly"] = "true";	
					}	
					if(h_jcdt.Rows[0][1].ToString()!="0")
					{						
						guangye.SetControlValue(div_list.FindControl("input1_" + h_ccode[i].ToString()),h_jcdt.Rows[0][1].ToString());//绑定速率
						
						HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input1_" + h_ccode[i].ToString());//强转为HtmlInputText
						
						h_input.Attributes["readonly"] = "true";	
					}	
				}				
			}	
		}
	}	
}

/***************************************************************
函数名：WriteEditList()
用途：生成污染物编辑框
变更人/日期:孙振宇  2009-5-4
***************************************************************/
private void WriteEditList()
{
	if (guangye.GetControlValue(control_id)!="")
	{		
		
		p_wrwdt = db.GetDataTable(db.ConnStr,"select a.mocode,fld_1206_1,fld_1206_4,fld_1206_5 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode in ("+guangye.GetControlValue(control_id)+")"); //绑定该排放口污染物
		
		DataTable h_fromdt = db.GetDataTable(db.ConnStr,"select mocode,fld_1208_1 from gmis_mo_1208");//绑定数据来源

		Literal h_html_1 = new Literal(); //生成DIV内容用Literal
		
		h_html_1.Text = "<table width=\"100%\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" class=\"table_graybgcolor_Top\" style=\"margin-top: 10px;\">\n<tr align=\"center\">\n<td colspan=\"4\" align=\"center\" class=\"td_viewcontent_title_top\" width=\"100%\">编辑污染物</td>\n</tr>\n";
		
		div_list.Controls.Add(h_html_1);
			
		string[] h_ccode = guangye.GetControlValue(control_id).Split(',');
		if(h_ccode.Length>0 && p_wrwdt.Rows.Count>0)
		{			
			for (int i=0;i<h_ccode.Length;i++)
			{
				DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_ccode[i]);
				Literal h_html_2 = new Literal(); //生成DIV内容用Literal
				Literal h_html_3 = new Literal(); //生成DIV内容用Literal
				Literal h_html_4 = new Literal(); //生成DIV内容用Literal
				Literal h_html_5 = new Literal(); //生成DIV内容用Literal
				if(h_wrwdr.Length>0)
				{
					
					h_html_2.Text = "<tr>\n<td width=\"100\" align=\"right\"  class=\"td_viewcontent_title\">("+(i+1).ToString()+")"+h_wrwdr[0]["fld_1206_1"].ToString()+":</td>\n<td class=\"td_viewcontent_content\">\n浓度执行标准:"+h_wrwdr[0]["fld_1206_4"].ToString()+"&nbsp;&nbsp;排放浓度:";
					
					div_list.Controls.Add(h_html_2);					

					div_list.Controls.Add(GetFieldControls("input_"+h_ccode[i], null,"0"));

					h_html_3.Text = "&nbsp;&nbsp;速率执行标准:"+h_wrwdr[0]["fld_1206_5"].ToString()+"&nbsp;&nbsp;排放速率:";

					div_list.Controls.Add(h_html_3);

					div_list.Controls.Add(GetFieldControls("input1_"+h_ccode[i], null,"0"));
					
					h_html_4.Text = "&nbsp;&nbsp;数据来源:";

					div_list.Controls.Add(h_html_4);
					
					div_list.Controls.Add(GetFieldControls("select_"+h_ccode[i], h_fromdt,"1")); 
					

					h_html_5.Text = "\n</td>\n</tr>\n";

					div_list.Controls.Add(h_html_5);

				}
			}
		}
		Literal h_html_6 = new Literal(); //生成DIV内容用Literal
		h_html_6.Text = "</table>\n";
		
		div_list.Controls.Add(h_html_6);
	}
}

/***************************************************************
函数名：CheckForm()
用途：检索当年当月是否已经有报表
变更人/日期:孙振宇  2009-5-4
***************************************************************/
private void CheckForm()
{	
	if(guangye.GetControlValue(fld_58_3) != "0" && guangye.GetControlValue(fld_58_4) != "0")
	{
		DataTable h_modt = db.GetDataTable(db.ConnStr,"select mocode from gmis_mo_58 where fld_58_1='"+guangye.GetControlValue(fld_58_1txt)+"' and fld_58_2='"+guangye.GetControlValue(fld_58_2txt)+"' and fld_58_3="+guangye.GetControlValue(fld_58_3)+" and fld_58_4="+guangye.GetControlValue(fld_58_4)+"");

		if (h_modt.Rows.Count>0)
		{
			id = h_modt.Rows[0][0].ToString();
			
			Response.Redirect("edit_58.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id + "&navindex=" + navindex + "");
		}	
		else
		{
			guangye.SetControlValue(control_sql,"");
			guangye.SetControlValue(control_value,"");			
			tb_save.Visible = false;
			

			BindExtData();//分析扩展数据	

			BindListForm();//绑定报表
		}
	}
}


/***************************************************************
函数名：GetFieldControls(string cname,  DataTable cdt,string type)
用途：绑定所有动态下拉框的数据来源
参数：cname:动态下拉框ID；cdt:绑定数据来源模块的dt;type:类型（"0"为input;"1"为daopdownlist）
变更人/日期:孙振宇  2009-5-4
***************************************************************/
public Control GetFieldControls(string cname,  DataTable cdt , string type)
{
	if(type=="1")
	{
		DropDownList c = new DropDownList();

		c.ID = cname;
		foreach (DataRow cdr in cdt.Rows)
		{
			c.Items.Add(new ListItem(cdr["fld_1208_1"].ToString(),cdr["mocode"].ToString()));
		}
		return c;
	}
	else
	{
		HtmlInputText c = new HtmlInputText();
        c.ID = cname;

		return c;
	}
}

//年份月份筛选
private void Change_Date(object sender, System.EventArgs e)
{	
	Response.Redirect("edit_58.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pfkcode=" + StringUtility.StringToBase64( guangye.GetControlValue(fld_58_2txt)) + "&dwcode=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_58_1txt)) + "&yearstr=" + guangye.GetControlValue(fld_58_3) + "&monthstr=" + guangye.GetControlValue(fld_58_4) + "&navindex=" + navindex + "");
	
}

private void Click_Toolbar(object sender, System.EventArgs e)
{
	string idstr = ((Control)sender).ID.ToLower();
	string exeinfo = "";
	alertmess.InnerText = "";//清空
	switch (idstr)
	{
		//生成报表
		case "btn_putdata":
			string h_sqlstr = (id!="0")?"":"SELECT @@IDENTITY AS 'MoCode';declare @mocode as int;select @mocode=@@IDENTITY;";
			if(guangye.GetControlValue(control_id)!="")
			{
				string h_1210_1="",h_1210_2="",h_1210_3="",h_1210_4="",h_1210_5="",h_1210_6="",h_1210_7="",h_1210_8="";
				string[] h_ccode = guangye.GetControlValue(control_id).Split(',');
				double pft = 0;//声明排放时间
				if(h_ccode.Length>0 && p_wrwdt !=null &&p_wrwdt.Rows.Count>0)
				{
					//判断排放浓度输入正确性
					try
					{
						pft = Convert.ToDouble(guangye.GetControlValue(fld_58_7))*24;
						guangye.SetControlValue(control_value,"");
						if(id!="0")
						{
							h_sqlstr += "delete gmis_mo_1210 where fld_1210_1="+id+";";
						}
						for (int i=0; i<h_ccode.Length; i++)
						{
							h_1210_1 = (id!="0")?id:"@mocode";//报表mocode
							h_1210_2 = h_ccode[i];//污染物许可mocode
							h_1210_8 = guangye.GetControlValue(div_list.FindControl("select_" + h_ccode[i]));//数据来源
							DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_ccode[i]);
							if(h_wrwdr.Length>0)
							{
								double pfnd = 0 , bznd = Convert.ToDouble(h_wrwdr[0]["fld_1206_4"]);//声明排放浓度，标准浓度
								double pfsl = 0 , bzsl = Convert.ToDouble(h_wrwdr[0]["fld_1206_5"]);//声明排放速率，标准速率
								//判断排放浓度输入正确性
								try
								{
									pfnd = Convert.ToDouble(guangye.GetControlValue(div_list.FindControl("input_" + h_ccode[i])));						
									h_1210_3 = pfnd.ToString();																	
								}
								catch (Exception ex)
								{
									exeinfo = "请输入正确的排放浓度！";
								}
								//判断排放速率输入正确性
								try
								{
									pfsl = Convert.ToDouble(guangye.GetControlValue(div_list.FindControl("input1_" + h_ccode[i])));						
									h_1210_4 = pfsl.ToString();
									if(pfsl<bzsl)
									{
										h_1210_5 = (pft*pfsl).ToString();
										h_1210_6 = h_1210_5;
										h_1210_7 = "0";
									}
									else if(pfsl>bzsl)
									{
										h_1210_5 = (pft*pfsl).ToString();
										h_1210_7 = h_1210_5;
										h_1210_6 = "0";
									}
									else
									{
										h_1210_5 = "0";
										h_1210_6 = "0";
										h_1210_7 = "0";
									}									
								}
								catch (Exception ex)
								{
									exeinfo = "请输入正确的排放速率！";
								}

								if(exeinfo != "")
								{
									break;								
								}

								
								h_sqlstr += "insert into gmis_mo_1210 (fld_1210_1,fld_1210_2,fld_1210_3,fld_1210_4,fld_1210_5,fld_1210_6,fld_1210_7,fld_1210_8) values ("+h_1210_1+","+h_1210_2+","+h_1210_3+","+h_1210_4+","+h_1210_5+","+h_1210_6+","+h_1210_7+","+h_1210_8+");";
								

								control_value.Value += h_1210_1+","+h_1210_2+","+h_1210_3+","+h_1210_4+","+h_1210_5+","+h_1210_6+","+h_1210_7+","+h_1210_8+"|";//生成画表格用数据
							}
						}
						guangye.SetControlValue(control_value,guangye.GetControlValue(control_value).Trim('|'));						
						
					}
					catch (Exception exc)
					{
						exeinfo = "请输入正确的污水排放量！";
					}					
				}			
			}
			if(exeinfo != "")
			{
				alertmess.InnerText = exeinfo;
			}
			else
			{
				h_sqlstr += "declare @year as int;select @year="+guangye.GetControlValue(fld_58_3)+";if not exists (select mocode from gmis_mo_59 where fld_59_1='"+guangye.GetControlValue(fld_58_2txt)+"' and fld_59_2=@year) begin insert into gmis_mo_59 (fld_59_1,fld_59_2) values ('"+guangye.GetControlValue(fld_58_2txt)+"',@year) end";
									
				guangye.SetControlValue(control_sql,h_sqlstr);//生成SQL语句
				tb_save.Visible = true;
				BindListForm();						
			}			
			break;
	}
}

public override void BeforeSave()
{

	if(guangye.GetControlValue(fld_58_1)=="")
	{
		guangye.SetControlValue(fld_58_1,guangye.GetControlValue(fld_58_1txt));
	}
	if(guangye.GetControlValue(fld_58_2)=="")
	{
		guangye.SetControlValue(fld_58_2,guangye.GetControlValue(fld_58_2txt));
	}
	SetSESSION("extsql",(guangye.GetControlValue(control_sql)!="")?control_sql.Value.Trim(';'):"");
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
			<!--生成数据表-->
			<td align=left style="padding-left: 5px;" nowrap>
				<G:Button id="btn_putdata" type="toolbar" mode="on" icon="TB24" text="生成报表" onclick="Click_Toolbar" runat="server">
				</G:Button>
			</td>
			<!--生成数据表-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<!--基本信息,开始-->
<input id="control_id" type="hidden" runat=server><!--存放污染物ID-->
<input id="control_sql" type="hidden" runat=server><!--存放扩展表sql语句-->
<input id="control_value" type="hidden" runat=server><!--存放扩展表数据-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="140" align="right"  class="td_viewcontent_title">单位代码:</td>
		<td class="td_viewcontent_content">
		<div id="fld_58_1txt" runat=server></div>
		<input id="fld_58_1" type="hidden" runat="server" >
		</td>
		<td width="140" align="right"  class="td_viewcontent_title">排放口代码:</td>
		<td class="td_viewcontent_content">
		<div id="fld_58_2txt" runat=server></div>
		<input id="fld_58_2" type="hidden" runat="server" >
		</td>
	</tr>	
	<tr>
		<td width="140" align="right"  class="td_viewcontent_title">年份:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_58_3" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server">
		</asp:DropDownList>&nbsp;年
	    </td>
		
		<td width="140" align="right"  class="td_viewcontent_title">月份:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_58_4" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server">
		</asp:DropDownList>&nbsp;月
		</td>
	</tr>
	<tr>
		<td width="140" align="right"  class="td_viewcontent_title">废气排放量(标立方米):</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_58_5" class="boxbline" style="width:98%;" maxlength="200" runat="server" >
	    </td>
		
		<td width="140" align="right"  class="td_viewcontent_title">排放天数:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_58_7" class="boxbline" style="width:98%;" maxlength="200" runat="server" >
		</td>
	</tr>
	<tr>	
		<td width="140" align="right"  class="td_viewcontent_title">废气排放数据来源:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_58_6" runat="server">
		</asp:DropDownList>
		</td>
		<td width="140" align="right"  class="td_viewcontent_title">林格曼黑度(级):</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_58_8" class="boxbline" style="width:98%;" maxlength="200" runat="server" >
	    </td>
	</tr>		
</table>	
<!--基本信息,结束-->
<!--扩展信息编辑,开始-->
<div id ="div_list" runat="server">
</div>
<!--扩展信息编辑,结束-->
<!--报表,开始-->
<div id ="div_form" runat="server">
</div>
<!--报表,结束-->
<!--动态生成html,结束-->
</form>
</body>
</html>
