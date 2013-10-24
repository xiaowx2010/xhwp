<!--�����ŷſ���Ⱦ�����ŷ����,�༭ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--����gmis_mo_58
������gmis_mo_1210��������������gmis_mo_58.mocode=gmis_mo_1210.fld_1210_1��;��
-->
<script language="C#" runat="server">
DataTable p_wrwdt;
string p_type;
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
	string pfkcode = GetQueryString("pfkcode", "");  //�ŷſ�ID
	string dwcode = GetQueryString("dwcode", "");  //��λID
	string yearstr = GetQueryString("yearstr", DateTime.Now.Year.ToString());  //���
	string monthstr = GetQueryString("monthstr", DateTime.Now.Month.ToString());  //�·�
	tb_save.Visible = false; //���ر��水ť
	

	/*ģ��༭����*/
	dtable = "gmis_mo_58";
	filter = " mocode=" + id;
	flds = new string[] { "fld_58_1", "fld_58_2", "fld_58_3","fld_58_4", "fld_58_5", "fld_58_6", "fld_58_7", "fld_58_8" };
	types = "00111111";
	/*ģ��༭����*/
	
	if (!IsPostBack)
	{
        int h_yearstr = Convert.ToInt32(DateTime.Now.Year);

		//�����������
		for (int i=h_yearstr-10;i<h_yearstr+10;i++)
		{
			fld_58_3.Items.Add(new ListItem(i.ToString(),i.ToString()));
		}
		SetFilter(fld_58_3, yearstr);

		//���·�������
		for (int i=1;i<13;i++)
		{
			fld_58_4.Items.Add(new ListItem(i.ToString().PadLeft(2,'0'),i.ToString()));
		}
		SetFilter(fld_58_4,monthstr );
        
		DataTable h_fromdt = db.GetDataTable(db.ConnStr,"select mocode,fld_1208_1 from gmis_mo_1208");//��������Դ

		if (h_fromdt.Rows.Count>0)
		{
			//��������Դ		
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
			
			CheckForm();//�������굱���Ƿ��Ѿ��б���					
		}

		
	}
	//��ȡ������Ⱦ��
	DataTable h_wrwdt = db.GetDataTable(db.ConnStr,"select fld_23_11,(select fld_54_1 from gmis_mo_54 where mocode=fld_23_6) as fld_23_6 from gmis_mo_23 where fld_23_1='"+guangye.GetControlValue(fld_58_2txt)+"'");

	
	if (h_wrwdt.Rows.Count>0&&h_wrwdt.Rows[0][0].ToString().Trim(';')!="")
	{
		guangye.SetControlValue(control_id,h_wrwdt.Rows[0][0].ToString().Trim(';').Replace(';',','));

		p_type = h_wrwdt.Rows[0]["fld_23_6"].ToString();	
		
		WriteEditList();//����Ⱦ��༭��
	}
	
	
	BindExtData();//������չ����	
	
	
	BindListForm();//�󶨱���
		
	
}

/***************************************************************
��������BindListForm()
��;���󶨱���
�����/����:������  2009-5-4
***************************************************************/
private void BindListForm()
{
	StringBuilder h_sb = new StringBuilder();//�����
	
	p_type = (p_type!=null)?p_type:"";

	h_sb.Append("<table width=\"100%\"  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:20px 0 ;\">\n<tr>\n<td align=\"center\" class=\"font_2635B_000\"><p>�����ŷſ���Ⱦ�����ŷ����</p></td>\n</tr>\n</table>\n");
	
	h_sb.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\" class=\"font1225_000000\">\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td width=\"8%\"> �ŷſڱ�� </td>\n<td width=\"8%\">"+guangye.GetControlValue(fld_58_2txt)+"&nbsp;</td>\n<td width=\"8%\"> �ŷſ����� </td>\n<td width=\"10%\">"+p_type+"&nbsp;</td>\n<td width=\"8%\">�����ŷ������������ף�</td>\n<td width=\"10%\">"+guangye.GetControlValue(fld_58_5)+"&nbsp;</td>\n<td width=\"8%\"> �����ŷ�������Դ </td>\n<td width=\"9%\">"+fld_58_6.SelectedItem.Text+"&nbsp;</td>\n<td width=\"6%\"> �ŷ��������죩 </td>\n<td width=\"9%\">"+guangye.GetControlValue(fld_58_7)+"&nbsp;</td>\n<td width=\"8%\"> �ָ����ڶȣ����� </td>\n<td width=\"8%\">"+guangye.GetControlValue(fld_58_8)+"&nbsp;</td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td rowspan=\"2\"> ��Ⱦ������ </td>\n<td colspan=\"2\"> �ŷ�Ũ�ȣ�����/Сʱ�� </td>\n<td colspan=\"2\"> �ŷ����ʣ�ǧ��/Сʱ�� </td>\n<td rowspan=\"2\"> ������Դ </td>\n<td colspan=\"6\"> �ŷ�����ǧ�ˣ� </td>\n</tr>\n<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td> ִ�б�׼ֵ </td>\n<td> �ŷ�Ũ�� </td>\n<td> ִ�б�׼ֵ </td>\n<td> �ŷ����� </td>\n<td colspan=\"2\"> �ϼ�  </td>\n<td colspan=\"2\">����ŷ��� </td>\n<td colspan=\"2\"> �����ŷ��� </td>\n</tr>\n");
	
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
							DataRow[] h_fromdr = h_fromdt.Select("mocode="+h_cvalue[7]);
							if(h_wrwdr.Length>0 && h_fromdr.Length>0)
							{
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td>"+(i+1).ToString()+"��"+h_wrwdr[0]["fld_1206_1"].ToString()+"</td>\n<td>"+h_wrwdr[0]["fld_1206_4"].ToString()+"&nbsp;</td>\n<td>"+h_cvalue[2]+"&nbsp;</td>\n<td>"+h_wrwdr[0]["fld_1206_5"].ToString()+"&nbsp;</td>\n<td>"+h_cvalue[3]+"&nbsp;</td>\n<td>"+h_fromdr[0]["fld_1208_1"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_cvalue[4]+"&nbsp;</td>\n<td colspan=\"2\">"+h_cvalue[5]+"&nbsp;</td>\n<td colspan=\"2\">"+h_cvalue[6]+"&nbsp;</td>\n</tr>\n");
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
					DataTable h_bbdt = db.GetDataTable(db.ConnStr,"select fld_1210_1,fld_1210_2,(select fld_1206_1 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_1,(select fld_1206_4 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_4,fld_1210_3,(select fld_1206_5 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode=fld_1210_2) as fld_1206_5,fld_1210_4,fld_1210_5,fld_1210_6,fld_1210_7,fld_1210_8,(select fld_1208_1 from gmis_mo_1208 where mocode=fld_1210_8) as fld_1208_1 from gmis_mo_1210 where fld_1210_1="+id); //�󶨱�����չ��

					if(h_bbdt.Rows.Count>0)
					{
						
						for (int i =0;i<h_ccode.Length ;i++ )
						{
							DataRow[] h_bbdr = h_bbdt.Select("fld_1210_2="+h_ccode[i]);
							if(h_bbdr.Length>0)
							{
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td>"+(i+1).ToString()+"��"+h_bbdr[0]["fld_1206_1"].ToString()+"</td>\n<td>"+h_bbdr[0]["fld_1206_4"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1210_3"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1206_5"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1210_4"].ToString()+"&nbsp;</td>\n<td>"+h_bbdr[0]["fld_1208_1"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_bbdr[0]["fld_1210_5"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_bbdr[0]["fld_1210_6"].ToString()+"&nbsp;</td>\n<td colspan=\"2\">"+h_bbdr[0]["fld_1210_7"].ToString()+"&nbsp;</td>\n</tr>\n");
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
								h_sb.Append("<tr align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\">\n<td>"+(i+1).ToString()+"��"+h_wrwdr[0]["fld_1206_1"].ToString()+"</td>\n<td>"+h_wrwdr[0]["fld_1206_4"].ToString()+"&nbsp;</td>\n<td>&nbsp;</td>\n<td>"+h_wrwdr[0]["fld_1206_5"].ToString()+"&nbsp;</td>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td colspan=\"2\">&nbsp;</td>\n<td colspan=\"2\">&nbsp;</td>\n<td colspan=\"2\">&nbsp;</td>\n</tr>\n");	
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
�����/����:������  2009-5-4
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
			guangye.SetControlValue(fld_58_8,h_jcdt.Rows[0][2].ToString());//�󶨸��ֺڶ�	
			
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
						guangye.SetControlValue(div_list.FindControl("input_" + h_drextdr[0][1].ToString()),h_drextdr[0][2].ToString());//��Ũ��
						guangye.SetControlValue(div_list.FindControl("input1_" + h_drextdr[0][1].ToString()),h_drextdr[0][2].ToString());//������			
						SetFilter((DropDownList)div_list.FindControl("select_" + h_drextdr[0][1].ToString()), h_drextdr[0][7].ToString());//��������Դ
					}
					else
					{
						if(h_jcdt.Rows[0][0].ToString()!="0")
						{
							guangye.SetControlValue(div_list.FindControl("input_" + h_ccode[i].ToString()),h_jcdt.Rows[0][0].ToString());//��Ũ��
							
							HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input_" + h_ccode[i].ToString());//ǿתΪHtmlInputText
							
							h_input.Attributes["readonly"] = "true";	
						}	
						if(h_jcdt.Rows[0][1].ToString()!="0")
						{						
							guangye.SetControlValue(div_list.FindControl("input1_" + h_ccode[i].ToString()),h_jcdt.Rows[0][1].ToString());//������
							
							HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input1_" + h_ccode[i].ToString());//ǿתΪHtmlInputText
							
							h_input.Attributes["readonly"] = "true";	
						}	
					}
				}
				else
				{
					if(h_jcdt.Rows[0][0].ToString()!="0")
					{
						guangye.SetControlValue(div_list.FindControl("input_" + h_ccode[i].ToString()),h_jcdt.Rows[0][0].ToString());//��Ũ��
						
						HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input_" + h_ccode[i].ToString());//ǿתΪHtmlInputText
						
						h_input.Attributes["readonly"] = "true";	
					}	
					if(h_jcdt.Rows[0][1].ToString()!="0")
					{						
						guangye.SetControlValue(div_list.FindControl("input1_" + h_ccode[i].ToString()),h_jcdt.Rows[0][1].ToString());//������
						
						HtmlInputText h_input = (HtmlInputText)div_list.FindControl("input1_" + h_ccode[i].ToString());//ǿתΪHtmlInputText
						
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
�����/����:������  2009-5-4
***************************************************************/
private void WriteEditList()
{
	if (guangye.GetControlValue(control_id)!="")
	{		
		
		p_wrwdt = db.GetDataTable(db.ConnStr,"select a.mocode,fld_1206_1,fld_1206_4,fld_1206_5 from gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2=b.mocode where a.mocode in ("+guangye.GetControlValue(control_id)+")"); //�󶨸��ŷſ���Ⱦ��
		
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
				Literal h_html_5 = new Literal(); //����DIV������Literal
				if(h_wrwdr.Length>0)
				{
					
					h_html_2.Text = "<tr>\n<td width=\"100\" align=\"right\"  class=\"td_viewcontent_title\">("+(i+1).ToString()+")"+h_wrwdr[0]["fld_1206_1"].ToString()+":</td>\n<td class=\"td_viewcontent_content\">\nŨ��ִ�б�׼:"+h_wrwdr[0]["fld_1206_4"].ToString()+"&nbsp;&nbsp;�ŷ�Ũ��:";
					
					div_list.Controls.Add(h_html_2);					

					div_list.Controls.Add(GetFieldControls("input_"+h_ccode[i], null,"0"));

					h_html_3.Text = "&nbsp;&nbsp;����ִ�б�׼:"+h_wrwdr[0]["fld_1206_5"].ToString()+"&nbsp;&nbsp;�ŷ�����:";

					div_list.Controls.Add(h_html_3);

					div_list.Controls.Add(GetFieldControls("input1_"+h_ccode[i], null,"0"));
					
					h_html_4.Text = "&nbsp;&nbsp;������Դ:";

					div_list.Controls.Add(h_html_4);
					
					div_list.Controls.Add(GetFieldControls("select_"+h_ccode[i], h_fromdt,"1")); 
					

					h_html_5.Text = "\n</td>\n</tr>\n";

					div_list.Controls.Add(h_html_5);

				}
			}
		}
		Literal h_html_6 = new Literal(); //����DIV������Literal
		h_html_6.Text = "</table>\n";
		
		div_list.Controls.Add(h_html_6);
	}
}

/***************************************************************
��������CheckForm()
��;���������굱���Ƿ��Ѿ��б���
�����/����:������  2009-5-4
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
			

			BindExtData();//������չ����	

			BindListForm();//�󶨱���
		}
	}
}


/***************************************************************
��������GetFieldControls(string cname,  DataTable cdt,string type)
��;�������ж�̬�������������Դ
������cname:��̬������ID��cdt:��������Դģ���dt;type:���ͣ�"0"Ϊinput;"1"Ϊdaopdownlist��
�����/����:������  2009-5-4
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
	Response.Redirect("edit_58.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pfkcode=" + StringUtility.StringToBase64( guangye.GetControlValue(fld_58_2txt)) + "&dwcode=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_58_1txt)) + "&yearstr=" + guangye.GetControlValue(fld_58_3) + "&monthstr=" + guangye.GetControlValue(fld_58_4) + "&navindex=" + navindex + "");
	
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
				string h_1210_1="",h_1210_2="",h_1210_3="",h_1210_4="",h_1210_5="",h_1210_6="",h_1210_7="",h_1210_8="";
				string[] h_ccode = guangye.GetControlValue(control_id).Split(',');
				double pft = 0;//�����ŷ�ʱ��
				if(h_ccode.Length>0 && p_wrwdt !=null &&p_wrwdt.Rows.Count>0)
				{
					//�ж��ŷ�Ũ��������ȷ��
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
							h_1210_1 = (id!="0")?id:"@mocode";//����mocode
							h_1210_2 = h_ccode[i];//��Ⱦ�����mocode
							h_1210_8 = guangye.GetControlValue(div_list.FindControl("select_" + h_ccode[i]));//������Դ
							DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_ccode[i]);
							if(h_wrwdr.Length>0)
							{
								double pfnd = 0 , bznd = Convert.ToDouble(h_wrwdr[0]["fld_1206_4"]);//�����ŷ�Ũ�ȣ���׼Ũ��
								double pfsl = 0 , bzsl = Convert.ToDouble(h_wrwdr[0]["fld_1206_5"]);//�����ŷ����ʣ���׼����
								//�ж��ŷ�Ũ��������ȷ��
								try
								{
									pfnd = Convert.ToDouble(guangye.GetControlValue(div_list.FindControl("input_" + h_ccode[i])));						
									h_1210_3 = pfnd.ToString();																	
								}
								catch (Exception ex)
								{
									exeinfo = "��������ȷ���ŷ�Ũ�ȣ�";
								}
								//�ж��ŷ�����������ȷ��
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
									exeinfo = "��������ȷ���ŷ����ʣ�";
								}

								if(exeinfo != "")
								{
									break;								
								}

								
								h_sqlstr += "insert into gmis_mo_1210 (fld_1210_1,fld_1210_2,fld_1210_3,fld_1210_4,fld_1210_5,fld_1210_6,fld_1210_7,fld_1210_8) values ("+h_1210_1+","+h_1210_2+","+h_1210_3+","+h_1210_4+","+h_1210_5+","+h_1210_6+","+h_1210_7+","+h_1210_8+");";
								

								control_value.Value += h_1210_1+","+h_1210_2+","+h_1210_3+","+h_1210_4+","+h_1210_5+","+h_1210_6+","+h_1210_7+","+h_1210_8+"|";//���ɻ����������
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
				h_sqlstr += "declare @year as int;select @year="+guangye.GetControlValue(fld_58_3)+";if not exists (select mocode from gmis_mo_59 where fld_59_1='"+guangye.GetControlValue(fld_58_2txt)+"' and fld_59_2=@year) begin insert into gmis_mo_59 (fld_59_1,fld_59_2) values ('"+guangye.GetControlValue(fld_58_2txt)+"',@year) end";
									
				guangye.SetControlValue(control_sql,h_sqlstr);//����SQL���
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
		<td width="140" align="right"  class="td_viewcontent_title">��λ����:</td>
		<td class="td_viewcontent_content">
		<div id="fld_58_1txt" runat=server></div>
		<input id="fld_58_1" type="hidden" runat="server" >
		</td>
		<td width="140" align="right"  class="td_viewcontent_title">�ŷſڴ���:</td>
		<td class="td_viewcontent_content">
		<div id="fld_58_2txt" runat=server></div>
		<input id="fld_58_2" type="hidden" runat="server" >
		</td>
	</tr>	
	<tr>
		<td width="140" align="right"  class="td_viewcontent_title">���:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_58_3" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server">
		</asp:DropDownList>&nbsp;��
	    </td>
		
		<td width="140" align="right"  class="td_viewcontent_title">�·�:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_58_4" AutoPostBack="true" OnSelectedIndexChanged="Change_Date" runat="server">
		</asp:DropDownList>&nbsp;��
		</td>
	</tr>
	<tr>
		<td width="140" align="right"  class="td_viewcontent_title">�����ŷ���(��������):</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_58_5" class="boxbline" style="width:98%;" maxlength="200" runat="server" >
	    </td>
		
		<td width="140" align="right"  class="td_viewcontent_title">�ŷ�����:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_58_7" class="boxbline" style="width:98%;" maxlength="200" runat="server" >
		</td>
	</tr>
	<tr>	
		<td width="140" align="right"  class="td_viewcontent_title">�����ŷ�������Դ:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:DropDownList ID="fld_58_6" runat="server">
		</asp:DropDownList>
		</td>
		<td width="140" align="right"  class="td_viewcontent_title">�ָ����ڶ�(��):</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_58_8" class="boxbline" style="width:98%;" maxlength="200" runat="server" >
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
