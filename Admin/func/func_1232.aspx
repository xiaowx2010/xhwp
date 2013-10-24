<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<script runat=server language=C#>
/***************************************************************
函数名：CheckSearchFilter(string h_title)
用途：分析查询的条件，组合成条件
变更人/日期:孙振宇  2009-6-19
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

					h_value += (h_t1[1]=="相似于")?" '%"+ h_t1[2] +"%' ":" '"+ h_t1[2] +"' ";
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
函数名：CheckSearchField(string h_title)
用途：分析查询的条件，组合成条件
变更人/日期:孙振宇  2009-6-19
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
函数名：GetCompareValue(string key)
用途：替换中文为符号
参数：key：中文
变更人/日期:孙振宇  2009-6-19
***************************************************************/
public string GetCompareValue(string key)
{
	string h_value = "";
	switch (key)
	{
		case "等于":
			h_value = "=";
			break;		
		case "不等于":
			h_value = "<>";
			break;
		case "大于":
			h_value = ">";
			break;
		case "大于等于":
			h_value = ">=";
			break;
		case "小于":
			h_value = "<";
			break;
		case "小于等于":
			h_value = "<=";
			break;
		case "相似于":
			h_value = " like ";
			break;
		case "并且":
			h_value = " and ";
			break;
		case "或者":
			h_value = " or ";
			break;		
	}
	return h_value;
}
/***************************************************************
函数名：GetOneFieldValue(string sqlstr)
用途：获取一个字段的内容
参数：sqlstr：SQL语句
变更人/日期:孙振宇  2009-6-19
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
函数名：ChangeToFieldnam(string caption,string mid)
用途：替换中文名为字段名
参数：caption：中文名;mid：模块编号
变更人/日期:孙振宇  2009-6-22
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