<!--污水排放口污染物月排放情况,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--主表：gmis_mo_19
关联表：gmis_mo_1208，关联条件：（gmis_mo_19.mocode=gmis_mo_1208.fld_1208_1）;）
-->
<script language="C#" runat="server">
DataTable p_wrwdt;
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//设置工具条,同时获取固定URL参数    
	string pfkcode = GetQueryString("pfkcode", "");  //排放口ID
	string dwcode = GetQueryString("dwcode", "");  //单位ID
	string yearstr = GetQueryString("yearstr", DateTime.Now.Year.ToString());  //年份
	string monthstr = GetQueryString("monthstr", DateTime.Now.Month.ToString());  //月份
	tb_save.Visible = false; //隐藏保存按钮
	

	/*模块编辑设置*/
	dtable = "gmis_mo_19";
	filter = " mocode=" + id;
	flds = new string[] { "fld_19_1", "fld_19_2", "fld_19_3","fld_19_4", "fld_19_5", "fld_19_6" };
	types = "001111";
	/*模块编辑设置*/
	
	if (!IsPostBack)
	{
        int h_yearstr = Convert.ToInt32(DateTime.Now.Year);

		//绑定年份下拉框
		for (int i=h_yearstr-10;i<h_yearstr+10;i++)
		{
			fld_19_3.Items.Add(new ListItem(i.ToString(),i.ToString()));
		}
		SetFilter(fld_19_3, yearstr);

		//绑定月份下拉框
		for (int i=1;i<13;i++)
		{
			fld_19_4.Items.Add(new ListItem(i.ToString().PadLeft(2,'0'),i.ToString()));
		}
		SetFilter(fld_19_4,monthstr );
        
		DataTable h_fromdt = db.GetDataTable(db.ConnStr,"select mocode,fld_1208_1 from gmis_mo_1208");//绑定数据来源

		//绑定数据来源
		BindListControl(fld_19_6, "mocode", "fld_1208_1",h_fromdt);
		SetFilter(fld_19_6,((h_fromdt.Rows.Count > 0) ? h_fromdt.Rows[0]["mocode"].ToString() : "0"));
		
		
		
		if(id!="0")
		{
			guangye.BindData(dtable, filter, flds);	
			guangye.SetControlValue(fld_19_1txt,guangye.GetControlValue(fld_19_1));
			guangye.SetControlValue(fld_19_2txt,guangye.GetControlValue(fld_19_2));
		}
		else
		{
			if(pfkcode!=""&&dwcode!="")
			{
				guangye.SetControlValue(fld_19_1,dwcode);
				guangye.SetControlValue(fld_19_2,pfkcode);
				guangye.SetControlValue(fld_19_1txt,guangye.GetControlValue(fld_19_1));
				guangye.SetControlValue(fld_19_2txt,guangye.GetControlValue(fld_19_2));
			}
			
			CheckForm();//检索当年当月是否已经有报表									
		}
		
	}
	//获取所有污染物
	DataTable h_wrwdt = db.GetDataTable(db.ConnStr,"select fld_53_11 from gmis_mo_53 where fld_53_1='"+guangye.GetControlValue(fld_19_2txt)+"'");
	if (h_wrwdt.Rows.Count>0&&h_wrwdt.Rows[0][0].ToString().Trim(';')!="")
	{
		guangye.SetControlValue(control_id,h_wrwdt.Rows[0][0].ToString().Trim(';').Replace(';',','));

		WriteEditList();//画污染物编辑框
	}
	
	
	BindExtData();//分析扩展数据	
	
	
	BindListForm();//绑定报表
		
	
}

/***************************************************************
函数名：BindListForm()
用途：绑定报表
变更人/日期:孙振宇  2009-4-29
***************************************************************/
private void BindListForm()
{
	StringBuilder h_sb = new StringBuilder();//画表格
    string h_sjly = "";//数据来源
    if (fld_19_6.SelectedItem == null)
    {
        h_sjly = "";
    }
    else h_sjly = fld_19_6.SelectedItem.Text;

	h_sb.Append("<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0 ;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\"><p>污水排放口污染物月排放情况</p></td>\n</tr>\n</table>\n");

	h_sb.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"12%\">排放口编号</td>\n<td colspan=\"2\">"+guangye.GetControlValue(fld_19_2txt)+"&nbsp;</td>\n<td width=\"11%\"> 污水排放量（吨）</td>\n<td width=\"13%\">"+guangye.GetControlValue(fld_19_5)+"&nbsp;</td>\n<td width=\"12%\">污水排放量数据来源</td>\n<td width=\"14%\">"+h_sjly+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n <td rowspan=\"2\"> 污染物名称 </td>\n<td colspan=\"2\"> 排放浓度（毫克/升） </td>\n<td> 数据来源 </td>\n<td colspan=\"3\"> 排放量（千克） </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"12%\"> 执行标准值  </td>\n<td width=\"13%\">排放浓度 </td>\n<td>&nbsp; </td>\n<td>合计 </td>\n<td> 达标排放量 </td>\n<td> 超标排放量 </td>\n</tr>\n");
	
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
							DataRow[] h_fromdr = h_fromdt.Select("mocode="+h_cvalue[6]);
							if(h_wrwdr.Length>0 && h_fromdr.Length>0)
							{
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> （"+(i+1).ToString()+"）"+h_wrwdr[0]["fld_1205_1"].ToString()+" </td>\n<td>"+h_wrwdr[0]["fld_1205_4"].ToString()+"&nbsp;</td>\n<td>"+h_cvalue[2]+"&nbsp;</td>\n<td>"+h_fromdr[0]["fld_1208_1"].ToString()+"&nbsp;</td>\n<td>"+h_cvalue[3]+"&nbsp;</td>\n<td>"+h_cvalue[4]+"&nbsp;</td>\n<td>"+h_cvalue[5]+"&nbsp;</td>\n</tr>\n");
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
					
					DataTable h_bbdt = db.GetDataTable(db.ConnStr,"select fld_1209_1,fld_1209_2,(select fld_1205_1 from gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2=b.mocode where a.mocode=fld_1209_2) as fld_1205_1,(select fld_1205_4 from gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2=b.mocode where a.mocode=fld_1209_2) as fld_1205_4,fld_1209_3,fld_1209_4,fld_1209_5,fld_1209_6,fld_1209_7,(select fld_1208_1 from gmis_mo_1208 where mocode=fld_1209_7) as fld_1208_1 from gmis_mo_1209 where fld_1209_1="+id); //绑定报表扩展表

					if(h_bbdt.Rows.Count>0)
					{
						
						for (int i =0;i<h_ccode.Length ;i++ )
						{
							DataRow[] h_bbdr = h_bbdt.Select("fld_1209_2="+h_ccode[i]);
							if(h_bbdr.Length>0)
							{
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> （"+(i+1).ToString()+"）"+h_bbdr[0]["fld_1205_1"].ToString()+" </td>\n<td>"+h_bbdr[0]["fld_1205_4"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1209_3"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1208_1"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1209_4"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1209_5"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1209_6"].ToString()+"&nbsp;</td>\n</tr>\n");
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
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> （"+(i+1).ToString()+"）"+h_wrwdr[0]["fld_1205_1"].ToString()+" </td>\n<td>"+h_wrwdr[0]["fld_1205_4"].ToString()+"&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n");
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
变更人/日期:孙振宇  2009-4-29
***************************************************************/
private void BindExtData()
{	
	DataTable h_extdt = new DataTable();
	
	if(id != "0")
	{
		h_extdt = db.GetDataTable(db.ConnStr,"select fld_1209_1,fld_1209_2,fld_1209_3,fld_1209_4,fld_1209_5,fld_1209_6,fld_1209_7 from gmis_mo_1209 where fld_1209_1="+id);
	}
	
	DataTable h_jcdt = db.GetDataTable(db.ConnStr,"select case when avg(fld_18_7) is null then 0 else avg(fld_18_7) end as avgstr from gmis_mo_18 where fld_18_1='"+guangye.GetControlValue(fld_19_2txt)+"' and fld_18_8='"+guangye.GetControlValue(fld_19_1txt)+"' and datepart(year,fld_18_3) = "+guangye.GetControlValue(fld_19_3)+" and datepart(month,fld_18_3) = "+guangye.GetControlValue(fld_19_4)+"");

	if(h_jcdt.Rows.Count>0 && guangye.GetControlValue(control_id)!="")
	{			
		string[] h_ccode = guangye.GetControlValue(control_id).Split(',');
		
		if(h_ccode.Length>0)
		{				
			for (int i=0;i<h_ccode.Length;i++)
			{
				if (id!="0" && h_extdt.Rows.Count>0)
				{
					DataRow[] h_drextdr = h_extdt.Select("fld_1209_2="+h_ccode[i].ToString());
					if(h_drextdr.Length>0)
					{
						guangye.SetControlValue(div_list.FindControl("input_" + h_drextdr[0][1].ToString()),h_drextdr[0][2].ToString());//绑定排放量
						SetFilter((DropDownList)div_list.FindControl("select_" + h_drextdr[0][1].ToString()), h_drextdr[0][6].ToString());//绑定数据来源
					}
					else
					{
						if(h_jcdt.Rows[0][0].ToString()!="0")
						{
							guangye.SetControlValue(div_list.FindControl("input_" + h_ccode[i].ToString()),h_jcdt.Rows[0][0].ToString());//绑定排放量
							
							HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input_" + h_ccode[i].ToString());//强转为HtmlInputText
							
							h_input.Attributes["readonly"] = "true";						
						}
					}
				}
				else
				{
					if(h_jcdt.Rows[0][0].ToString()!="0")
					{
						guangye.SetControlValue(div_list.FindControl("input_" + h_ccode[i].ToString()),h_jcdt.Rows[0][0].ToString());//绑定排放量
						
						HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input_" + h_ccode[i].ToString());//强转为HtmlInputText
						
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
变更人/日期:孙振宇  2009-4-29
***************************************************************/
private void WriteEditList()
{
	if (guangye.GetControlValue(control_id)!="")
	{		
		
		p_wrwdt = db.GetDataTable(db.ConnStr,"select a.mocode,fld_1205_1,fld_1205_4 from gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2=b.mocode where a.mocode in ("+guangye.GetControlValue(control_id)+")"); //绑定该排放口污染物
		
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
				if(h_wrwdr.Length>0)
				{
					
					h_html_2.Text = "<tr>\n<td width=\"100\" align=\"right\"  class=\"td_viewcontent_title\">("+(i+1).ToString()+")"+h_wrwdr[0]["fld_1205_1"].ToString()+":</td>\n<td class=\"td_viewcontent_content\">\n执行标准:&nbsp;"+h_wrwdr[0]["fld_1205_4"].ToString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排放浓度:&nbsp;";
					
					div_list.Controls.Add(h_html_2);					

					div_list.Controls.Add(GetFieldControls("input_"+h_ccode[i], null,"0"));
					
					h_html_3.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数据来源:";

					div_list.Controls.Add(h_html_3);

					
					div_list.Controls.Add(GetFieldControls("select_"+h_ccode[i], h_fromdt,"1")); 
					

					h_html_4.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</td>\n</tr>\n";

					div_list.Controls.Add(h_html_4);

				}
			}
		}
		Literal h_html_5 = new Literal(); //生成DIV内容用Literal
		h_html_5.Text = "</table>\n";
		
		div_list.Controls.Add(h_html_5);
	}
}

/***************************************************************
函数名：CheckForm()
用途：检索当年当月是否已经有报表
变更人/日期:孙振宇  2009-4-29
***************************************************************/
private void CheckForm()
{	
	if(guangye.GetControlValue(fld_19_3) != "0" && guangye.GetControlValue(fld_19_4) != "0")
	{
		DataTable h_modt = db.GetDataTable(db.ConnStr,"select mocode from gmis_mo_19 where fld_19_1='"+guangye.GetControlValue(fld_19_1txt)+"' and fld_19_2='"+guangye.GetControlValue(fld_19_2txt)+"' and fld_19_3="+guangye.GetControlValue(fld_19_3)+" and fld_19_4="+guangye.GetControlValue(fld_19_4)+"");

		if (h_modt.Rows.Count>0)
		{
			id = h_modt.Rows[0][0].ToString();
			
			Response.Redirect("edit_19.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id + "&navindex=" + navindex + "");
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
变更人/日期:孙振宇  2009-4-29
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
	Response.Redirect("edit_19.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pfkcode=" + StringUtility.StringToBase64( guangye.GetControlValue(fld_19_2txt)) + "&dwcode=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_19_1txt)) + "&yearstr=" + guangye.GetControlValue(fld_19_3) + "&monthstr=" + guangye.GetControlValue(fld_19_4) + "&navindex=" + navindex + "");
	
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
				string h_1209_1="",h_1209_2="",h_1209_3="",h_1209_4="",h_1209_5="",h_1209_6="",h_1209_7="";
				string[] h_ccode = guangye.GetControlValue(control_id).Split(',');
				double pfl = 0;//声明排放量
				if(h_ccode.Length>0 && p_wrwdt !=null &&p_wrwdt.Rows.Count>0)
				{
					//判断排放浓度输入正确性
					try
					{
						pfl = Convert.ToDouble(guangye.GetControlValue(fld_19_5));
						guangye.SetControlValue(control_value,"");
						if(id!="0")
						{
							h_sqlstr += "delete gmis_mo_1209 where fld_1209_1="+id+";";
						}
						for (int i=0; i<h_ccode.Length; i++)
						{
							h_1209_1 = (id!="0")?id:"@mocode";//报表mocode
							h_1209_2 = h_ccode[i];//污染物许可mocode
							h_1209_7 = guangye.GetControlValue(div_list.FindControl("select_" + h_ccode[i]));//数据来源
							DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_ccode[i]);
							if(h_wrwdr.Length>0)
							{
								double pfnd = 0 , bznd = Convert.ToDouble(h_wrwdr[0]["fld_1205_4"]);//声明排放浓度，标准浓度
								//判断排放浓度输入正确性
								try
								{
									pfnd = Convert.ToDouble(guangye.GetControlValue(div_list.FindControl("input_" + h_ccode[i])));						
									h_1209_3 = pfnd.ToString();
									if(pfnd<bznd)
									{
										h_1209_4 = Math.Round(pfl*pfnd/1000,2).ToString();
										h_1209_5 = h_1209_4;
										h_1209_6 = "0";
									}
									else if(pfnd>bznd)
									{
										h_1209_4 = Math.Round(pfl*pfnd/1000,2).ToString();
										h_1209_6 = h_1209_4;
										h_1209_5 = "0";
									}
									else
									{
										h_1209_4 = "0";
										h_1209_5 = "0";
										h_1209_6 = "0";
									}								
									
									h_sqlstr += "insert into gmis_mo_1209 (fld_1209_1,fld_1209_2,fld_1209_3,fld_1209_4,fld_1209_5,fld_1209_6,fld_1209_7) values ("+h_1209_1+","+h_1209_2+","+h_1209_3+","+h_1209_4+","+h_1209_5+","+h_1209_6+","+h_1209_7+");";
									control_value.Value += h_1209_1+","+h_1209_2+","+h_1209_3+","+h_1209_4+","+h_1209_5+","+h_1209_6+","+h_1209_7+"|";//生成画表格用数据
								}
								catch (Exception ex)
								{
									exeinfo = "请输入正确的排放浓度！";
								}								
								if(exeinfo != "")
								{
									break;								
								}
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
				h_sqlstr += "declare @year as int;select @year="+guangye.GetControlValue(fld_19_3)+";if not exists (select mocode from gmis_mo_20 where fld_20_1='"+guangye.GetControlValue(fld_19_2txt)+"' and fld_20_2=@year) begin insert into gmis_mo_20 (fld_20_1,fld_20_2) values ('"+guangye.GetControlValue(fld_19_2txt)+"',@year) end";
									
				guangye.SetControlValue(control_sql,h_sqlstr);//生成SQL语句
				tb_save.Visible = true;
				BindListForm();						
			}			
			break;
	}
}

public override void BeforeSave()
{

	if(guangye.GetControlValue(fld_19_1)=="")
	{
		guangye.SetControlValue(fld_19_1,guangye.GetControlValue(fld_19_1txt));
	}
	if(guangye.GetControlValue(fld_19_2)=="")
	{
		guangye.SetControlValue(fld_19_2,guangye.GetControlValue(fld_19_2txt));
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
		<td width="100" align="right"  class="td_viewcontent_title">单位代码:</td>
		<td class="td_viewcontent_content">
		<div id="fld_19_1txt" runat=server></div>
		<input id="fld_19_1" type="hidden" class="boxbline" style="width:98%;" maxlength="200" runat="server" readonly>
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">排放口代码:</td>
		<td class="td_viewcontent_content">
		<div id="fld_19_2txt" runat=server></div>
		<input id="fld_19_2" type="hidden" class="boxbline" style="width:98%;" maxlength="200" runat="server" readonly>
		</td>
	</tr>	
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">年份:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_19_3" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server">
		</asp:DropDownList>&nbsp;年
	    </td>
		
		<td width="100" align="right"  class="td_viewcontent_title">月份:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_19_4" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server">
		</asp:DropDownList>&nbsp;月
		</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">污水排放量(吨):</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_19_5" class="boxbline" style="width:98%;" maxlength="200" runat="server" >
	    </td>
		
		<td width="100" align="right"  class="td_viewcontent_title">排放量数据来源:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_19_6" runat="server">
		</asp:DropDownList>
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
