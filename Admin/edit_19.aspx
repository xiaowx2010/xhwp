<!--��ˮ�ŷſ���Ⱦ�����ŷ����,�༭ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--����gmis_mo_19
������gmis_mo_1208��������������gmis_mo_19.mocode=gmis_mo_1208.fld_1208_1��;��
-->
<script language="C#" runat="server">
DataTable p_wrwdt;
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
	string pfkcode = GetQueryString("pfkcode", "");  //�ŷſ�ID
	string dwcode = GetQueryString("dwcode", "");  //��λID
	string yearstr = GetQueryString("yearstr", DateTime.Now.Year.ToString());  //���
	string monthstr = GetQueryString("monthstr", DateTime.Now.Month.ToString());  //�·�
	tb_save.Visible = false; //���ر��水ť
	

	/*ģ��༭����*/
	dtable = "gmis_mo_19";
	filter = " mocode=" + id;
	flds = new string[] { "fld_19_1", "fld_19_2", "fld_19_3","fld_19_4", "fld_19_5", "fld_19_6" };
	types = "001111";
	/*ģ��༭����*/
	
	if (!IsPostBack)
	{
        int h_yearstr = Convert.ToInt32(DateTime.Now.Year);

		//�����������
		for (int i=h_yearstr-10;i<h_yearstr+10;i++)
		{
			fld_19_3.Items.Add(new ListItem(i.ToString(),i.ToString()));
		}
		SetFilter(fld_19_3, yearstr);

		//���·�������
		for (int i=1;i<13;i++)
		{
			fld_19_4.Items.Add(new ListItem(i.ToString().PadLeft(2,'0'),i.ToString()));
		}
		SetFilter(fld_19_4,monthstr );
        
		DataTable h_fromdt = db.GetDataTable(db.ConnStr,"select mocode,fld_1208_1 from gmis_mo_1208");//��������Դ

		//��������Դ
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
			
			CheckForm();//�������굱���Ƿ��Ѿ��б���									
		}
		
	}
	//��ȡ������Ⱦ��
	DataTable h_wrwdt = db.GetDataTable(db.ConnStr,"select fld_53_11 from gmis_mo_53 where fld_53_1='"+guangye.GetControlValue(fld_19_2txt)+"'");
	if (h_wrwdt.Rows.Count>0&&h_wrwdt.Rows[0][0].ToString().Trim(';')!="")
	{
		guangye.SetControlValue(control_id,h_wrwdt.Rows[0][0].ToString().Trim(';').Replace(';',','));

		WriteEditList();//����Ⱦ��༭��
	}
	
	
	BindExtData();//������չ����	
	
	
	BindListForm();//�󶨱���
		
	
}

/***************************************************************
��������BindListForm()
��;���󶨱���
�����/����:������  2009-4-29
***************************************************************/
private void BindListForm()
{
	StringBuilder h_sb = new StringBuilder();//�����
    string h_sjly = "";//������Դ
    if (fld_19_6.SelectedItem == null)
    {
        h_sjly = "";
    }
    else h_sjly = fld_19_6.SelectedItem.Text;

	h_sb.Append("<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0 ;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\"><p>��ˮ�ŷſ���Ⱦ�����ŷ����</p></td>\n</tr>\n</table>\n");

	h_sb.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"12%\">�ŷſڱ��</td>\n<td colspan=\"2\">"+guangye.GetControlValue(fld_19_2txt)+"&nbsp;</td>\n<td width=\"11%\"> ��ˮ�ŷ������֣�</td>\n<td width=\"13%\">"+guangye.GetControlValue(fld_19_5)+"&nbsp;</td>\n<td width=\"12%\">��ˮ�ŷ���������Դ</td>\n<td width=\"14%\">"+h_sjly+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n <td rowspan=\"2\"> ��Ⱦ������ </td>\n<td colspan=\"2\"> �ŷ�Ũ�ȣ�����/���� </td>\n<td> ������Դ </td>\n<td colspan=\"3\"> �ŷ�����ǧ�ˣ� </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"12%\"> ִ�б�׼ֵ  </td>\n<td width=\"13%\">�ŷ�Ũ�� </td>\n<td>&nbsp; </td>\n<td>�ϼ� </td>\n<td> ����ŷ��� </td>\n<td> �����ŷ��� </td>\n</tr>\n");
	
	if(guangye.GetControlValue(control_id)!="")
	{
		DataTable h_fromdt = db.GetDataTable(db.ConnStr,"select mocode,fld_1208_1 from gmis_mo_1208");//��������Դ
		if (guangye.GetControlValue(control_value)!="") //�ж��Ƿ�������
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
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ��"+(i+1).ToString()+"��"+h_wrwdr[0]["fld_1205_1"].ToString()+" </td>\n<td>"+h_wrwdr[0]["fld_1205_4"].ToString()+"&nbsp;</td>\n<td>"+h_cvalue[2]+"&nbsp;</td>\n<td>"+h_fromdr[0]["fld_1208_1"].ToString()+"&nbsp;</td>\n<td>"+h_cvalue[3]+"&nbsp;</td>\n<td>"+h_cvalue[4]+"&nbsp;</td>\n<td>"+h_cvalue[5]+"&nbsp;</td>\n</tr>\n");
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
					
					DataTable h_bbdt = db.GetDataTable(db.ConnStr,"select fld_1209_1,fld_1209_2,(select fld_1205_1 from gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2=b.mocode where a.mocode=fld_1209_2) as fld_1205_1,(select fld_1205_4 from gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2=b.mocode where a.mocode=fld_1209_2) as fld_1205_4,fld_1209_3,fld_1209_4,fld_1209_5,fld_1209_6,fld_1209_7,(select fld_1208_1 from gmis_mo_1208 where mocode=fld_1209_7) as fld_1208_1 from gmis_mo_1209 where fld_1209_1="+id); //�󶨱�����չ��

					if(h_bbdt.Rows.Count>0)
					{
						
						for (int i =0;i<h_ccode.Length ;i++ )
						{
							DataRow[] h_bbdr = h_bbdt.Select("fld_1209_2="+h_ccode[i]);
							if(h_bbdr.Length>0)
							{
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ��"+(i+1).ToString()+"��"+h_bbdr[0]["fld_1205_1"].ToString()+" </td>\n<td>"+h_bbdr[0]["fld_1205_4"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1209_3"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1208_1"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1209_4"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1209_5"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1209_6"].ToString()+"&nbsp;</td>\n</tr>\n");
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
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ��"+(i+1).ToString()+"��"+h_wrwdr[0]["fld_1205_1"].ToString()+" </td>\n<td>"+h_wrwdr[0]["fld_1205_4"].ToString()+"&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n");
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
��������BindExtData()
��;��������չ������
�����/����:������  2009-4-29
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
						guangye.SetControlValue(div_list.FindControl("input_" + h_drextdr[0][1].ToString()),h_drextdr[0][2].ToString());//���ŷ���
						SetFilter((DropDownList)div_list.FindControl("select_" + h_drextdr[0][1].ToString()), h_drextdr[0][6].ToString());//��������Դ
					}
					else
					{
						if(h_jcdt.Rows[0][0].ToString()!="0")
						{
							guangye.SetControlValue(div_list.FindControl("input_" + h_ccode[i].ToString()),h_jcdt.Rows[0][0].ToString());//���ŷ���
							
							HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input_" + h_ccode[i].ToString());//ǿתΪHtmlInputText
							
							h_input.Attributes["readonly"] = "true";						
						}
					}
				}
				else
				{
					if(h_jcdt.Rows[0][0].ToString()!="0")
					{
						guangye.SetControlValue(div_list.FindControl("input_" + h_ccode[i].ToString()),h_jcdt.Rows[0][0].ToString());//���ŷ���
						
						HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input_" + h_ccode[i].ToString());//ǿתΪHtmlInputText
						
						h_input.Attributes["readonly"] = "true";						
					}
				}
			}	
		}
	}	
}

/***************************************************************
��������WriteEditList()
��;��������Ⱦ��༭��
�����/����:������  2009-4-29
***************************************************************/
private void WriteEditList()
{
	if (guangye.GetControlValue(control_id)!="")
	{		
		
		p_wrwdt = db.GetDataTable(db.ConnStr,"select a.mocode,fld_1205_1,fld_1205_4 from gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2=b.mocode where a.mocode in ("+guangye.GetControlValue(control_id)+")"); //�󶨸��ŷſ���Ⱦ��
		
		DataTable h_fromdt = db.GetDataTable(db.ConnStr,"select mocode,fld_1208_1 from gmis_mo_1208");//��������Դ

		Literal h_html_1 = new Literal(); //����DIV������Literal
		
		h_html_1.Text = "<table width=\"100%\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" class=\"table_graybgcolor_Top\" style=\"margin-top: 10px;\">\n<tr align=\"center\">\n<td colspan=\"4\" align=\"center\" class=\"td_viewcontent_title_top\" width=\"100%\">�༭��Ⱦ��</td>\n</tr>\n";
		
		div_list.Controls.Add(h_html_1);
			
		string[] h_ccode = guangye.GetControlValue(control_id).Split(',');
		if(h_ccode.Length>0 && p_wrwdt.Rows.Count>0)
		{			
			for (int i=0;i<h_ccode.Length;i++)
			{
				DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_ccode[i]);
				Literal h_html_2 = new Literal(); //����DIV������Literal
				Literal h_html_3 = new Literal(); //����DIV������Literal
				Literal h_html_4 = new Literal(); //����DIV������Literal
				if(h_wrwdr.Length>0)
				{
					
					h_html_2.Text = "<tr>\n<td width=\"100\" align=\"right\"  class=\"td_viewcontent_title\">("+(i+1).ToString()+")"+h_wrwdr[0]["fld_1205_1"].ToString()+":</td>\n<td class=\"td_viewcontent_content\">\nִ�б�׼:&nbsp;"+h_wrwdr[0]["fld_1205_4"].ToString()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ŷ�Ũ��:&nbsp;";
					
					div_list.Controls.Add(h_html_2);					

					div_list.Controls.Add(GetFieldControls("input_"+h_ccode[i], null,"0"));
					
					h_html_3.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������Դ:";

					div_list.Controls.Add(h_html_3);

					
					div_list.Controls.Add(GetFieldControls("select_"+h_ccode[i], h_fromdt,"1")); 
					

					h_html_4.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</td>\n</tr>\n";

					div_list.Controls.Add(h_html_4);

				}
			}
		}
		Literal h_html_5 = new Literal(); //����DIV������Literal
		h_html_5.Text = "</table>\n";
		
		div_list.Controls.Add(h_html_5);
	}
}

/***************************************************************
��������CheckForm()
��;���������굱���Ƿ��Ѿ��б���
�����/����:������  2009-4-29
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
			

			BindExtData();//������չ����	

			BindListForm();//�󶨱���
		}
	}
}


/***************************************************************
��������GetFieldControls(string cname,  DataTable cdt,string type)
��;�������ж�̬�������������Դ
������cname:��̬������ID��cdt:��������Դģ���dt;type:���ͣ�"0"Ϊinput;"1"Ϊdaopdownlist��
�����/����:������  2009-4-29
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

//����·�ɸѡ
private void Change_Date(object sender, System.EventArgs e)
{	
	Response.Redirect("edit_19.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pfkcode=" + StringUtility.StringToBase64( guangye.GetControlValue(fld_19_2txt)) + "&dwcode=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_19_1txt)) + "&yearstr=" + guangye.GetControlValue(fld_19_3) + "&monthstr=" + guangye.GetControlValue(fld_19_4) + "&navindex=" + navindex + "");
	
}

private void Click_Toolbar(object sender, System.EventArgs e)
{
	string idstr = ((Control)sender).ID.ToLower();
	string exeinfo = "";
	alertmess.InnerText = "";//���
	switch (idstr)
	{
		//���ɱ���
		case "btn_putdata":
			string h_sqlstr = (id!="0")?"":"SELECT @@IDENTITY AS 'MoCode';declare @mocode as int;select @mocode=@@IDENTITY;";
			if(guangye.GetControlValue(control_id)!="")
			{
				string h_1209_1="",h_1209_2="",h_1209_3="",h_1209_4="",h_1209_5="",h_1209_6="",h_1209_7="";
				string[] h_ccode = guangye.GetControlValue(control_id).Split(',');
				double pfl = 0;//�����ŷ���
				if(h_ccode.Length>0 && p_wrwdt !=null &&p_wrwdt.Rows.Count>0)
				{
					//�ж��ŷ�Ũ��������ȷ��
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
							h_1209_1 = (id!="0")?id:"@mocode";//����mocode
							h_1209_2 = h_ccode[i];//��Ⱦ�����mocode
							h_1209_7 = guangye.GetControlValue(div_list.FindControl("select_" + h_ccode[i]));//������Դ
							DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_ccode[i]);
							if(h_wrwdr.Length>0)
							{
								double pfnd = 0 , bznd = Convert.ToDouble(h_wrwdr[0]["fld_1205_4"]);//�����ŷ�Ũ�ȣ���׼Ũ��
								//�ж��ŷ�Ũ��������ȷ��
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
									control_value.Value += h_1209_1+","+h_1209_2+","+h_1209_3+","+h_1209_4+","+h_1209_5+","+h_1209_6+","+h_1209_7+"|";//���ɻ����������
								}
								catch (Exception ex)
								{
									exeinfo = "��������ȷ���ŷ�Ũ�ȣ�";
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
						exeinfo = "��������ȷ����ˮ�ŷ�����";
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
									
				guangye.SetControlValue(control_sql,h_sqlstr);//����SQL���
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
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�������ݱ�-->
			<td align=left style="padding-left: 5px;" nowrap>
				<G:Button id="btn_putdata" type="toolbar" mode="on" icon="TB24" text="���ɱ���" onclick="Click_Toolbar" runat="server">
				</G:Button>
			</td>
			<!--�������ݱ�-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<!--������Ϣ,��ʼ-->
<input id="control_id" type="hidden" runat=server><!--�����Ⱦ��ID-->
<input id="control_sql" type="hidden" runat=server><!--�����չ��sql���-->
<input id="control_value" type="hidden" runat=server><!--�����չ������-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��λ����:</td>
		<td class="td_viewcontent_content">
		<div id="fld_19_1txt" runat=server></div>
		<input id="fld_19_1" type="hidden" class="boxbline" style="width:98%;" maxlength="200" runat="server" readonly>
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">�ŷſڴ���:</td>
		<td class="td_viewcontent_content">
		<div id="fld_19_2txt" runat=server></div>
		<input id="fld_19_2" type="hidden" class="boxbline" style="width:98%;" maxlength="200" runat="server" readonly>
		</td>
	</tr>	
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">���:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_19_3" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server">
		</asp:DropDownList>&nbsp;��
	    </td>
		
		<td width="100" align="right"  class="td_viewcontent_title">�·�:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_19_4" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server">
		</asp:DropDownList>&nbsp;��
		</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ˮ�ŷ���(��):</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_19_5" class="boxbline" style="width:98%;" maxlength="200" runat="server" >
	    </td>
		
		<td width="100" align="right"  class="td_viewcontent_title">�ŷ���������Դ:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_19_6" runat="server">
		</asp:DropDownList>
		</td>
	</tr>		
</table>	
<!--������Ϣ,����-->
<!--��չ��Ϣ�༭,��ʼ-->
<div id ="div_list" runat="server">
</div>
<!--��չ��Ϣ�༭,����-->
<!--����,��ʼ-->
<div id ="div_form" runat="server">
</div>
<!--����,����-->
<!--��̬����html,����-->
</form>
</body>
</html>
