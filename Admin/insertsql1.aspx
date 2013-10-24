<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>

<script runat="server" language="C#">
        private SqlDB db = new SqlDB();

		private void Page_Load(object sender, System.EventArgs e)
		{
            if (!IsPostBack)
            {
                //��������˵�
                select_table.Items.Clear();
                //��������˵�
                db.SqlString = "select modulecode,modulename from gmis_module where moduleurl<>'' and modulestate=0 and modulecode in (select distinct modulecode from gmis_field where caption in ('����'))";
                DataTable dt_module = db.GetDataTable();
                if (dt_module != null && dt_module.Rows.Count > 0)
                {
                    foreach (DataRow row in dt_module.Rows)
                    {                       
						select_table.Items.Add(new ListItem(row["modulename"].ToString(), row["modulecode"].ToString()));
                    }
                }
            }
		}

		//����������
        private void Area_Click(object sender, EventArgs e)
        {
			string sqlstr = "truncate table gmis_mo_1201;delete gmis_mo_1197 where modulecode=1201";
			db.SqlString = "begin " + sqlstr  + " end";
			db.TransUpdate();
			sqlstr = "insert into gmis_mo_1201 (fld_1201_1,fld_1201_2,fld_1201_3,fld_1201_4,fld_1201_5,fld_1201_6) values ('�����','1','0','1','1.001','310104');insert into gmis_mo_1197 (datamocode,modulecode,orgname) values (1,1201,'�����');";
			
			db.SqlString = "begin " + sqlstr  + " end";
			db.TransUpdate();

			DataTable h_adt = db.GetDataTable(db.ConnStr,"select fieldname,modulecode from gmis_field where modulecode in (658,730,834,848,866,884,988,995,1002,1016) and caption in ('��(��)','��') order by fieldname");

			
			string exeinfo = "";
			if (h_adt.Rows.Count>0)
			{
				string[] h_mcode = new string[] {"658","730","834","848","866","884","988","995","1002","1016"};
				int j = 1;
				
				for (int i=0;i<h_mcode.Length;i++)
				{
					DataRow[] h_adr = h_adt.Select("modulecode ="+h_mcode[i]+"");
					if (h_adr.Length>0)
					{
						DataTable h_dt = db.GetDataTable(db.ConnStr,"select distinct "+h_adr[0]["fieldname"].ToString()+",substring(fld_"+h_mcode[i]+"_6,0,10) as dept from gmis_mo_"+h_mcode[i]+" order by dept");
						sqlstr = "";
						foreach (DataRow dr in h_dt.Rows)
						{
							DataTable h_cdt = db.GetDataTable(db.ConnStr,"select mocode from gmis_mo_1201 where fld_1201_6='"+dr[1].ToString()+"'");
							
							if (h_cdt.Rows.Count==0)
							{
								sqlstr += "insert into gmis_mo_1201 (fld_1201_1,fld_1201_2,fld_1201_3,fld_1201_4,fld_1201_5,fld_1201_6) values ('"+dr[0].ToString()+"','2','1','"+j.ToString()+"','1.001"+j.ToString().PadLeft(3,'0')+"','"+dr[1].ToString()+"');insert into gmis_mo_1197 (datamocode,modulecode,orgname) values ("+(j+1).ToString()+",1201,'"+dr[0].ToString()+"');";
								j++;
							}
						}
						if (sqlstr!="")
						{
							db.SqlString = "begin " + sqlstr  + " end";
							exeinfo = db.TransUpdate();
						}						
					}
				}
				
                alert.InnerHtml = "�����������ݵ���" + exeinfo;
			}	

			
		}
		//��ҵ����
        private void Dept_Click(object sender, EventArgs e)
        {
			string sqlstr = "";
			DataTable dt = db.GetDataTable(db.ConnStr,"select fld_1202_2,substring(fld_1202_5,0,10) as fld_1202_5,fld_1202_20,fld_1202_25 from gmis_mo_1202");
			string key = "",exeinfo = "";
			foreach (DataRow dr in dt.Rows)
			{
				key = "";
				if (dr["fld_1202_5"].ToString()!="")
				{
					if (dr["fld_1202_5"].ToString().Substring(6)=="000")
					{
						key += "fld_1202_4 = (select mocode from gmis_mo_1201 where fld_1201_6='"+dr["fld_1202_5"].ToString().Substring(0,6)+"'),";
					}
					else
					{
						key += "fld_1202_4 = (select mocode from gmis_mo_1201 where fld_1201_6='"+dr["fld_1202_5"].ToString()+"'),";
					}
					
				}
				if (dr["fld_1202_20"].ToString()!="")
				{
					if (dr["fld_1202_20"].ToString().Substring(2,2)=="00")
					{
						key += "fld_1202_21=(select mocode from gmis_mo_1200 where fld_1200_8='"+dr["fld_1202_20"].ToString().Substring(0,2)+"')";
					}
					else
					{
						key += "fld_1202_21=(select mocode from gmis_mo_1200 where fld_1200_8='"+dr["fld_1202_20"].ToString()+"')";
					}
					
				}
				else if (dr["fld_1202_25"].ToString()=="834,835,837")
				{
					key += "fld_1202_21=(select mocode from gmis_mo_1200 where fld_1200_1='��ˮ����')";
				}
				else if (dr["fld_1202_25"].ToString()=="1016,1017")
				{
					key += "fld_1202_21=(select mocode from gmis_mo_1200 where fld_1200_1='����ȼ����ʩ')";
				}
				else if (dr["fld_1202_25"].ToString()=="1022,1023")
				{
					key += "fld_1202_21=(select mocode from gmis_mo_1200 where fld_1200_1='���������Ⱦ��')";
				}
				if (key !="")
				{
					sqlstr = "update gmis_mo_1202 set "+key.Trim(',')+" where fld_1202_2='"+dr["fld_1202_2"].ToString()+"'";
				}
				db.SqlString = sqlstr;
				exeinfo = db.UpdateTable();
			}			
			alert.InnerHtml = "��ҵ���ݵ���" + exeinfo;
		}
        //���ݵ���
        private void insert_Click(object sender, EventArgs e)
        {
			if (select_table.SelectedItem.Value!="")
			{
				string sqlstr = "";

				string[] fc = new string[] {"��ҵ����","��ҵ����","��ҵ��ϸ��ַ","������������","���ľ���(��)","���ľ���(��)","���ľ���(��)","����γ��(��)","����γ��(��)","����γ��(��)","�绰����","�������","��������","����������","��ϵ������","�Ǽ�ע������","��ҵʱ��","��ҵ��ģ","��ҵ����"};
				string[] fn = new string[] {"fld_1202_1","fld_1202_2","fld_1202_3","fld_1202_5","fld_1202_6","fld_1202_7","fld_1202_8","fld_1202_9","fld_1202_10","fld_1202_11","fld_1202_12","fld_1202_13","fld_1202_14","fld_1202_15","fld_1202_16","fld_1202_17","fld_1202_18","fld_1202_19","fld_1202_20"};
				
				DataTable h_fdt = db.GetDataTable(db.ConnStr,"select fieldname,caption from gmis_field where modulecode = "+select_table.SelectedItem.Value+" order by fieldname ");

				string keystr = "",valuestr = "",tempstr = "";

				for (int i=0;i<fc.Length;i++)
				{
					
					switch (fc[i])
					{
						case "��ҵ����":
							DataRow[] fdr = h_fdt.Select("caption='����'");
							if (fdr.Length>0)
							{
								keystr += fn[i] + ",";
								valuestr += fdr[0]["fieldname"].ToString() + ",";
							}
							break;
						case "��ҵ����":
							fdr = h_fdt.Select("caption='����'");
							if (fdr.Length>0)
							{
								keystr += fn[i] + ",";
								tempstr = fdr[0]["fieldname"].ToString();
								valuestr += fdr[0]["fieldname"].ToString() + ",";
							}
							break;
						case "��ҵ��ϸ��ַ":
							fdr = h_fdt.Select("caption like '%ʡ%'");
							if (fdr.Length>0)
							{								
								valuestr += "("+fdr[0]["fieldname"].ToString() + "+";
							}
							fdr = h_fdt.Select("caption in ('����(�С��ݡ���)','��')");
							if (fdr.Length>0)
							{								
								valuestr += fdr[0]["fieldname"].ToString() + "+";
							}
							fdr = h_fdt.Select("caption in ('��(�����С���)','��')");
							if (fdr.Length>0)
							{								
								valuestr += fdr[0]["fieldname"].ToString() + "+";
							}
							fdr = h_fdt.Select("caption in ('��(��)','��')");
							if (fdr.Length>0)
							{								
								valuestr += fdr[0]["fieldname"].ToString() + "+";
							}
							fdr = h_fdt.Select("caption in ('�ֵ�','��(��)�����ƺ�','�֡����ƺ�')");
							if (fdr.Length>0)
							{								
								valuestr += fdr[0]["fieldname"].ToString() + "+";
							}
							valuestr = valuestr.Trim('+')+"),";
							keystr += fn[i] + ",";
							break;
						case "�绰����":
						case "�������":
							fdr = h_fdt.Select("caption='"+fc[i]+"'");
							if (fdr.Length>0)
							{
								keystr += fn[i] + ",";
								valuestr += "cast(cast("+fdr[0]["fieldname"].ToString()+" as bigint) as varchar(50)),";
							}
							break;
						case "��ҵʱ��":
							fdr = h_fdt.Select("caption like '%��ҵʱ��%' and (caption like '%��%' or caption like '%��%')");
							if (fdr.Length>1)
							{
								keystr += fn[i] + ",";
								valuestr += "(cast(cast("+fdr[0]["fieldname"].ToString()+" as smallint) as varchar(8))+'��'+cast(cast("+fdr[1]["fieldname"].ToString()+" as smallint) as varchar(8))+'��'),";
							}
							break;
						case "��ҵ����":
							fdr = h_fdt.Select("caption like '%��ҵ���_����%' or caption like '%��ҵ����%'");
							if (fdr.Length>0)
							{
								keystr += fn[i] + ",";
								valuestr += fdr[0]["fieldname"].ToString()+",";
							}
							break;
						case "�Ǽ�ע������":
							fdr = h_fdt.Select("caption like '%�Ǽ�ע������%'");
							if (fdr.Length>0)
							{
								keystr += fn[i] + ",";
								valuestr += fdr[0]["fieldname"].ToString()+",";
							}
							break;
						default:
							fdr = h_fdt.Select("caption='"+fc[i]+"'");
							if (fdr.Length>0)
							{
								keystr += fn[i] + ",";
								valuestr += fdr[0]["fieldname"].ToString() + ",";
							}
							break;					
					}
				}
				sqlstr = "insert into gmis_mo_1202 ("+keystr.Trim(',')+") select "+valuestr.Trim(',')+" from  gmis_mo_"+select_table.SelectedItem.Value+" where "+tempstr+" not in (select fld_1202_2 from gmis_mo_1202)";
				Response.Write(sqlstr);
				db.SqlString = sqlstr;
				string exeinfo = db.UpdateTable();
				if (exeinfo == "�����ɹ���")
				{
					sqlstr = "delete gmis_mo_1197 where modulecode=1202;insert into gmis_mo_1197 (datamocode,modulecode,orgcode,orgname,tradecode) select mocode,1202,fld_1202_2,fld_1202_1,fld_1202_20 from gmis_mo_1202;";
				}
				db.SqlString = "begin "+sqlstr+" end";
				exeinfo = db.TransUpdate();
				alert.InnerHtml = select_table.SelectedItem.Text+"���ݵ���" + exeinfo;
			}      
                

        }

        
    

       
</script>
<body>
    <form runat="server">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" style="border-right: #8c9dbe 1px solid;border-top: #8c9dbe 1px solid;border-left: #8c9dbe 1px solid;border-bottom: #8c9dbe 1px solid;"> 
            <tr align="center">
                <td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:DropDownList ID="select_table" runat="server" ></asp:DropDownList>
                </td>               
				<td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:LinkButton ID="btn_area" runat="server" style="width:100px;" OnClick="Area_Click" Text="��������"></asp:LinkButton>
                </td>
				<td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:LinkButton ID="btn_dept" runat="server" style="width:100px;" OnClick="Dept_Click" Text="������ҵ"></asp:LinkButton>
                </td>
                <td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:LinkButton ID="btn_insert" runat="server" style="width:100px;" OnClick="insert_Click" Text="��������"></asp:LinkButton>
                </td>
                
            </tr>
        </table>
        <div id="alert" runat="server"></div>
    </form>
</body>
</html>