<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<script runat=server language=C#>
/***************************************************************
��������CheckSearchFilter(string h_title)
��;��������ѯ����������ϳ�����
�����/����:������  2009-6-19
***************************************************************/
public string CheckSearchFilter(string h_title)
{
	string h_value = "";

	if (h_title!="")
	{
		string[] h_t0 = h_title.Trim('|').Split('|');
		if (h_t0.Length>0)
		{
			for (int i=0;i<h_t0.Length;i++)
			{
				string[] h_t1 = h_t0[i].Split(';');
				if (h_t1.Length>2)
				{
					string h_cm = GetOneFieldValue("select connectmodulecode from gmis_field where fieldcode="+h_t1[0]);
					if (h_cm != "" && h_cm != "0")
					{
						string h_table = "gmis_mo_"+h_cm;
						string h_ffstr = GetOneFieldValue("select fieldname from gmis_field where fieldcode="+h_t1[0])+"="+h_table+"."+GetOneFieldValue("select connectmodulefield from gmis_field where fieldcode="+h_t1[0]);
						string h_view = GetOneFieldValue("select fieldname from gmis_field where fieldcode="+GetOneFieldValue("select connectview from gmis_field where fieldcode="+h_t1[0]));

						h_value += " (select "+h_view+" from "+h_table+" where "+h_ffstr+") ";
					}
					else
					{
						h_value += " "+GetOneFieldValue("select fieldname from gmis_field where fieldcode="+h_t1[0])+" ";
					}
					
					h_value += GetCompareValue(h_t1[1]);

					h_value += (h_t1[1]=="������")?" '%"+ h_t1[2] +"%' ":" '"+ h_t1[2] +"' ";
				}
				else if (h_t1.Length == 1)
				{
					h_value += GetCompareValue(h_t1[0]);
				}
			}			
		}
	}

	return h_value;
}

/***************************************************************
��������CheckSearchField(string h_title)
��;��������ѯ����������ϳ�����
�����/����:������  2009-6-19
***************************************************************/
public string CheckSearchField(string h_title)
{
	string h_value = "";

	if (h_title!="")
	{
		string h_cm = GetOneFieldValue("select connectmodulecode from gmis_field where fieldname='"+h_title+"'");
		if (h_cm != "" && h_cm != "0")
		{
			string h_table = "gmis_mo_"+h_cm;
			h_value = GetOneFieldValue("select fieldname from gmis_field where fieldname='"+h_title+"'");
			string h_ffstr = h_value+"="+h_table+"."+GetOneFieldValue("select connectmodulefield from gmis_field where fieldname='"+h_title+"'");
			string h_view = GetOneFieldValue("select fieldname from gmis_field where fieldcode="+GetOneFieldValue("select connectview from gmis_field where fieldname='"+h_title+"'"));
			h_value = " (select "+h_view+" from "+h_table+" where "+h_ffstr+") as "+h_value;
		}
		else
		{
			h_value = GetOneFieldValue("select fieldname from gmis_field where fieldname='"+h_title+"'");
		}
	}	
	return h_value;
}

/***************************************************************
��������GetCompareValue(string key)
��;���滻����Ϊ����
������key������
�����/����:������  2009-6-19
***************************************************************/
public string GetCompareValue(string key)
{
	string h_value = "";
	switch (key)
	{
		case "����":
			h_value = "=";
			break;		
		case "������":
			h_value = "<>";
			break;
		case "����":
			h_value = ">";
			break;
		case "���ڵ���":
			h_value = ">=";
			break;
		case "С��":
			h_value = "<";
			break;
		case "С�ڵ���":
			h_value = "<=";
			break;
		case "������":
			h_value = " like ";
			break;
		case "����":
			h_value = " and ";
			break;
		case "����":
			h_value = " or ";
			break;		
	}
	return h_value;
}
/***************************************************************
��������GetOneFieldValue(string sqlstr)
��;����ȡһ���ֶε�����
������sqlstr��SQL���
�����/����:������  2009-6-19
***************************************************************/
public string GetOneFieldValue(string sqlstr)
{	
	DataTable h_dt = db.GetDataTable(db.ConnStr,sqlstr);
	if (h_dt.Rows.Count>0)
	{
		return h_dt.Rows[0][0].ToString();
	}
	return "";
}

/***************************************************************
��������ChangeToFieldnam(string caption,string mid)
��;���滻������Ϊ�ֶ���
������caption��������;mid��ģ����
�����/����:������  2009-6-22
***************************************************************/
public string ChangeToFieldnam(string caption,string mid)
{
	Regex r = new Regex(@"\[(?<content>[^\[\]]*)\]", RegexOptions.IgnoreCase);
	Match m = r.Match(caption);
	if(m.Success)
	{
		string cstr = m.Result("${content}");
		string fieldstr = GetOneFieldValue("select fieldname from gmis_field where connectmodulecode=0 and fieldstatus=0 and isvital=0 and modulecode="+mid+" and caption = '"+cstr+"' order by fieldindex");

		caption = caption.Replace("["+cstr+"]",fieldstr);
	}
	return caption;
}

</script>