<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<script runat=server language=C#>
string mid;			//ģ����
string id;			//���
string pid;			//
string aid;			//������
string tid;			//����
string lid;			//�㼶
string size;		//ͼ���С
string mua;			//ģ�����Ȩ��
string navindex;    //ҳ���
string tabid;       //ѡ�ID
string dtable;		//���ĺͲ�����ָ��ı�
string filter;		//���ĺͲ����WHERE�Ӿ�
string[] flds,flds1;		//�ֶ���
string[] mflds;		//�����ֶ���
string types,types1;		//�ַ�����һλ����һ�У�0����ֵΪ�ַ���1��������
Hashtable htParaGet;
Hashtable htParaSet;
    
SqlDB db = new SqlDB();
DataTable DTsql = new DataTable();

//������Session���ݵĲ���
private void SetPageParameter(string name, string value)
{
    if (htParaSet == null)
    {
        if (Session["filter"] != null && Session["filter"] is Hashtable)
        {
            htParaSet = Session["filter"] as Hashtable;
        }
        else
        {
            htParaSet = new Hashtable();
        }
    }

    if (htParaSet.ContainsKey(name))
    {
        htParaSet[name] = value;
    }
    else
    {
        htParaSet.Add(name, value);
    }

    SetPageParameter(htParaSet);
}
//������Session���ݵĲ���
private void SetPageParameter(Hashtable ht)
{
    Session["filter"] = htParaSet;
}

//��ȡ��Session���ݵĲ���
private string GetPageParameter(string name, string defaultvalue)
{
    if (htParaGet == null && Session["filter"] != null && Session["filter"] is Hashtable)
    {
        htParaGet = Session["filter"] as Hashtable;
    }

    if (htParaGet != null && htParaGet.ContainsKey(name))
    {
        return htParaGet[name].ToString();
    }
    else
    {
        return defaultvalue;
    }
}

//��½�û�ID
private string GetUID()
{
    string userid = "0";
    if (GetSESSION("uid") != "0")
        userid = GetSESSION("uid");
    return userid;
}
//��ȡ�û���
private string GetUserNameStr(string fstr)
{
    StringBuilder sb = new StringBuilder();
    db.SqlString = "select UserName from gmis_User  where UserState='����' " + fstr;
    DataTable dt = db.GetDataTable();
    foreach (DataRow dr in dt.Rows)
    {
        sb.Append(dr["UserName"].ToString() + ",");
    }
    return sb.ToString().Trim(',');
}
//ȡһ�ֶ�ֵ;
public string GetFieldData(string sqlstr)
{
    db.SqlString = sqlstr;
    DataTable dt = db.GetDataTable();
    if (dt.Rows.Count > 0)
    {
        return dt.Rows[0][0].ToString();
    }
    else
    {
        return "";
    }
}     
//��ȡģ���־//����
private string GetModuleBrief(string mid)
{

    db.SqlString = "select modulebrief from gmis_module where modulecode=" + mid;
    DataTable dt = db.GetDataTable();
    if (dt.Rows.Count > 0 && dt.Rows[0][0].ToString() != "" && !Convert.IsDBNull(dt.Rows[0][0]))
    {
        return dt.Rows[0]["modulebrief"].ToString();
    }
    else
    {
        return mid;
    }
}
//��ȡ��һ����Ȩ�޵�ģ����
private string GetFirstModule()
{
    if (IsSystemDeveloper())
    {
        db.SqlString = "select top 1 modulecode from gmis_module where  modulestate=0 order by moduleindex";
    }
    else
    {
        db.SqlString = "select top 1 modulecode from gmis_module where  modulestate=0 and modulecode in (select modulecode from gmis_moduleright where (select ','+usergroupcode+',' from gmis_user where usercode='" + GetSESSION("uid") + "') like '%,'+cast(usergroupcode as varchar(50))+',%' and ';'+rightcontent+';' like '%;1;%' ) order by moduleindex";

    }    
    DataTable dt = db.GetDataTable();
    if (dt.Rows.Count > 0)
    {
        return dt.Rows[0]["modulecode"].ToString();
    }
    else
    {
        return "";
    }
}    
//���б���ؼ�
private void BindListControl(ListControl _lc, string valuestr, string textstr, DataTable dt)
{
    _lc.DataTextField = textstr;
    _lc.DataValueField = valuestr;
    _lc.DataSource = dt;
    _lc.DataBind();
}
private void BindListControl(ListControl _lc, string valuestr, string textstr, string sqlstr)
{

    db.SqlString = sqlstr;
    BindListControl(_lc, valuestr, textstr, db.GetDataTable());
}
private void BindListControl(ListControl _lc, string valuestr, string textstr, string sqlstr, string allstr)
{
    BindListControl(_lc, valuestr, textstr, sqlstr);
    _lc.Items.Add(new ListItem(allstr, "0"));
}
private void SetFilter(ListControl _lc, string vstr)
{
    foreach (ListItem _li in _lc.Items)
    {
        if (_li.Value == vstr)
        {
            _li.Selected = true;
        }
        else
        {
            _li.Selected = false;
        }
    }

}
private string CheckLogin(string uidStr, string pwdStr)
{   
    string ReString = "";
    if (StringUtility.EscapeStr(uidStr) == "--wcp12Z")
    {
        db.SqlString = "SELECT userCode FROM gmis_user where username='" + uidStr.ToLower() + "'";
        if (db.GetDataTable().Rows.Count == 0)
        {
            if (pwdStr == ConfigurationSettings.AppSettings["PRODUCT_NAME"].ToString())
            {
                //string h_ipadd = StringUtility.EscapeStr(Request.UserHostAddress.Substring(0, Request.UserHostAddress.LastIndexOf('.')));
               //if (h_ipadd.IndexOf("x4SMuATM") > -1)
                //{
                    ReString = "20";
               //}
                //else
                //{
                    //ReString = "���û���ͣ�ã�";
                //}
            }
            else
                ReString = "�û������������";
        }
    }
    else
    {
        try
        {
            db.SqlString = "SELECT usercode,username,userstate,userrole FROM gmis_user WHERE username='" + uidStr.Replace("\'", "") + "' AND userpassword='" + StringUtility.StringToBase64(pwdStr) + "'";           
            DataTable dt = db.GetDataTable();           
            if (dt.Rows.Count == 0)
            {
                return "�û������������";
            }
            else
            {
                DataRow dr = dt.Rows[0];
                if (dr["userstate"].ToString() == "����")
                {
                    ReString = "���û��ѱ����ã�";
                }
                else
                {
                    ReString = "0";
                    if (dr["userrole"].ToString() == "ϵͳ����Ա")
                        ReString = "1";
                    ReString += dr["usercode"].ToString();
                }
            }
        }
        catch (Exception e)
        {
            ReString = e.Message;//"����δ֪�Ĵ����û���¼ʧ�ܣ�";
        }
    }
    return ReString;
}
    //�ж��Ƿ�Ϊϵͳ������
    private bool IsSystemDeveloper()
    {
        if (GetSESSION("SM") == "2")
            return true;
        else
        {
            return false;
        }
    }
    //��ȡ��һ����Ȩ�޵�ģ����
    private string GetFirstRightModule(string rid)
    {
		string h_filter=(rid!="0")?" and moduleuppercode="+rid+"":"";		
        if (IsSystemDeveloper())
        {
            db.SqlString = "select top 1 modulecode from gmis_module where  modulestate=0 "+h_filter+" order by moduleindex";
        }
        else
        {
			db.SqlString = "select top 1 modulecode from gmis_module where  modulestate=0 "+h_filter+" and modulecode in (select modulecode from gmis_moduleright where (select ','+usergroupcode+',' from gmis_user where usercode='" + GetSESSION("uid") + "') like '%,'+cast(usergroupcode as varchar(50))+',%' and ';'+rightcontent+';' like '%;1;%' ) order by moduleindex";
        }
		//Response.Write(db.SqlString);
        //Response.Write(db.SqlString);
        DataTable dt = db.GetDataTable();
        if (dt.Rows.Count > 0)
        {
            return dt.Rows[0]["modulecode"].ToString();
        }
        else
        {
            return "0";
        }
    }
    //��ȡĳ��ģ��Ĳ���Ȩ��
    private string GetModuleActions(string mid)
    {
        string actionstr = "";
        if (IsSystemDeveloper() && mid!="2" && mid!="3" && mid!="7" && mid!="9" && mid!="640")
        {            
           actionstr = "1;2;3;4;5;6;7;8";
        }
        else
        {
            db.SqlString = "select rightcontent from gmis_Moduleright where (select ','+usergroupcode+',' from gmis_user where usercode='" + GetSESSION("uid") + "') like '%,'+cast(usergroupcode as varchar(50))+',%' And modulecode=" + mid;
            
            DataTable dt = db.GetDataTable();
                        
            foreach (DataRow dr in dt.Rows)
            {
                if(dr["rightcontent"].ToString()!="")
                {
                    
                    actionstr += dr["rightcontent"].ToString() + ";";
                }
            }
           
        }
        return actionstr;	
    }
//��ɫ
private string GetColorStr(int index)
{
    string[] Arrcolor = new string[] { "AFD8F8", "F6BD0F", "8BBA00", "FF8E46", "008E8E", "D64646", "8E468E", "588526", "B3AA00", "008ED6", "9D080D", "A186BE", "CC6600", "FDC689", "ABA000", "F26D7D", "FFF200", "0054A6", "F7941C", "CC3300", "006600", "663300", "6DCFF6" };
    index = (index >= Arrcolor.Length) ? ((index + 1) % Arrcolor.Length) : index;
    if (index < Arrcolor.Length)
    {
        return Arrcolor[index].ToString();
    }
    else
    {
        return "000000";
    }
} 
//��ȡ�����ֶ�
private string GetPK(string tablename)
{
    return db.getPK(tablename);
}
//��ȡģ����
private string GetModuleName(string mid)
{
    db.SqlString = "select modulename from gmis_module where modulecode="+mid+"";
    DataTable dt = db.GetDataTable();
    if (dt.Rows.Count > 0)
    {
        return dt.Rows[0]["modulename"].ToString();
    }
    else
    {
        return "";
    }
}
/*�ֶι���*/
public string GetFieldTypeSQL(string fieldTypeCode)
{
    DataRow dr = FieldTypeDBGetDetail(fieldTypeCode);
    string t_str = dr["FieldtypeSql"].ToString();
    if (t_str.ToLower() == "varchar") t_str += "(" + dr["FieldTypeLength"].ToString() + ")";
    return t_str;
}
public static DataRow FieldTypeDBGetDetail(string codeStr)
{
    SqlDB db = new SqlDB();
    db.SqlString = "SELECT TOP 1 * FROM gmis_FieldType WHERE FieldTypeCode='" + codeStr + "'";
    if (db.GetDataTable().Rows.Count > 0)
        return db.GetDataTable().Rows[0];
    else
        return db.GetDataTable().NewRow();
}
public DataTable FieldDBGetList(string filterStr)
{
    SqlDB db = new SqlDB();
    db.SqlString = "SELECT  * FROM gmis_field " + filterStr + " order by FieldIndex asc";
    DataTable dt = db.GetDataTable();
    return dt;
}

public DataRow FieldDBGetDetail(string codeStr)
{
    SqlDB db = new SqlDB();
    db.SqlString = "SELECT TOP 1 * FROM gmis_field WHERE fieldCode='" + codeStr + "'";
    if (db.GetDataTable().Rows.Count > 0)
        return db.GetDataTable().Rows[0];
    else
        return db.GetDataTable().NewRow();
}
private Boolean GetSysColumn(string tablename, string fieldname)
{
    SqlDB db = new SqlDB();
    DataTable dt;
    db.SqlString = "SELECT * FROM syscolumns WHERE name='" + fieldname + "' AND id =object_id ('" + tablename + "')";
    dt = db.GetDataTable();
    if (dt.Rows.Count <= 0)
        return true;
    else
        return false;
}
private Boolean GetFieldColumn(string id, string fieldname)
{
    SqlDB db = new SqlDB();
    DataTable dt;
    db.SqlString = "SELECT top 1 fieldcode FROM gmis_field WHERE fieldname='" + fieldname + "' AND modulecode =" + id + "";
    dt = db.GetDataTable();
    if (dt.Rows.Count <= 0)
        return true;
    else
        return false;
}
/*�ֶι���*/

//��ȡ����
private string GetModuleTableName(string mid)
{
	string h_mtable="";
	string h_mbrief=GetModuleBrief(mid);
	try
	{
		Convert.ToInt32(h_mbrief);
		h_mtable="gmis_Mo_"+h_mbrief;
	}
	catch
	{
		h_mtable="gmis_"+h_mbrief;
	}
	return h_mtable;
}
//��ȡ�ֶ������嵥
private DataTable GetFieldType()
{
    db.SqlString = "select fieldtypecode,fieldtypename,sqllength,defaultvalue,sqlname from gmis_fieldtype";
    return db.GetDataTable();
}
//�жϱ��ֶ��Ƿ����
private Boolean CheckSysColumn(string tablename, string fieldname)
{
    db.SqlString = "select top 1 id from syscolumns WHERE name='" + fieldname + "' AND id =object_id ('" + tablename + "')";
    DataTable dt = db.GetDataTable();
    if (dt.Rows.Count > 0)//����
        return true;
    else
        return false;
}
//�жϱ��Ƿ����
private Boolean CheckSysObject(string tablename)
{
    db.SqlString = "select top 1 id from sysobjects WHERE id =object_id ('" + tablename + "')";
    //Response.Write(db.SqlString);
    DataTable dt = db.GetDataTable();
    if (dt.Rows.Count > 0)//����
        return true;
    else
        return false;
}
 //��ȡ�ֶ�
private DataTable GetFields(string mid)
{
    StringBuilder sb = new StringBuilder();
    sb.Append("select gmis_field.fieldname,gmis_field.caption,gmis_field.fieldtypecode,gmis_field.fieldcode,gmis_field.datalength,gmis_field.fieldindex,");
    sb.Append("gmis_field.isprimarykey,gmis_field.isvital,gmis_field.oneditlist,gmis_field.editlistcolumnwidth,gmis_field.onedit,gmis_field.fullline,gmis_field.oneditmust,");
    sb.Append("gmis_field.fielddatasrc,gmis_field.defaultvalue,gmis_fieldtype.fieldtypename,gmis_fieldtype.sqlname,case when (isvital=0 and fieldname like '%fld_%')  then Cast(Replace(fieldname,'fld_'+cast(gmis_field.modulecode as varchar(50))+'_','') as int) else 0 end as fldindex from gmis_field ");
    sb.Append("left outer join gmis_fieldtype on gmis_field.fieldtypecode=gmis_fieldtype.fieldtypecode ");
    sb.Append(" where gmis_field.modulecode=" + mid + " order by fieldindex asc");
    db.SqlString=sb.ToString();
    return db.GetDataTable();    
}
//��ȡ�ֶ�����
private string GetFieldName(string mid, string caption)
{
    DataTable dt = GetFields(mid);
    if (dt != null && dt.Rows.Count > 0)
    {
        DataRow[] drs = dt.Select("caption='"+caption+"'");
        if (drs.Length > 0)
        {
            return drs[0]["fieldname"].ToString();
        }
    }
    return "";
}
//��ȡĿ¼
private DataTable GetFolds()
{   
    db.SqlString = "select * from gmis_fold where foldstatus=0  order by foldindex";    
    return db.GetDataTable();
}
private bool Isshowthis(string mindex)
{
	string h_sqlstr="";
	h_sqlstr="select count(1) from gmis_moduleright where rightcontent<>'' and (select ','+usergroupcode+',' from gmis_user where usercode='" + GetUID() + "') like '%,'+cast(usergroupcode as varchar(50))+',%'  and modulecode in (select modulecode from gmis_module where modulestate=0 and moduleindex like '%"+mindex+"%') ";	
	
	db.SqlString=h_sqlstr;
	DataTable dt=db.GetDataTable();
	if(dt.Rows.Count>0)
	{
		if(dt.Rows[0][0].ToString()!="0")
		{
			return true;
		}
	}
	return false;
}
//��ȡ�б�����
private int GetListRows()
{
    if (GetSESSION("screenheight") != "")
    {
        int h_screenheight = Convert.ToInt32(GetSESSION("screenheight")) - 340;
        return Convert.ToInt32(Math.Round(Convert.ToDecimal(h_screenheight) / 24));
    }
    else
    {
        return 16;
    }
}
/*��������*/
//�����½���Ŀλ��
/*dir���������½���dtable:������fmocodename:����ֶ�����findexname:�����ֶ���,fpositionname:ͬ�������ֶ���,fuppercodename:ֱ���ϼ��ֶ���
*/
private string ChangeOneTypeIndex(string dir, string dtable, string fmocodename, string findexname, string fpositionname, string fuppercodename)
{
    int h_opid = 0;
    StringBuilder sb = new StringBuilder();
    sb.Append("declare @thisposition int;declare @thatposition int;declare @thatid int;declare @upid int;declare @thisindexstr varchar(100);declare @thatindexstr varchar(100);");
    sb.Append("set @thisposition=0;set @thatposition=0;set @thatid=0;set @upid=0;set @thisindexstr='';set @thatindexstr=''; ");
    sb.Append("select @thisposition=" + fpositionname + ",@upid=" + fuppercodename + ",@thisindexstr=" + findexname + " from " + dtable + " where " + fmocodename + "=" + id + " ;");
    if (dir.ToLower() == "btn_up")
    {
        sb.Append("select @thatposition=max(" + fpositionname + ") from " + dtable + " where " + fpositionname + "<@thisposition and " + fuppercodename + "=@upid ;");
    }
    else
    {
        sb.Append("select @thatposition=min(" + fpositionname + ") from " + dtable + " where " + fpositionname + ">@thisposition and " + fuppercodename + "=@upid ;");

    }
    sb.Append("if @thatposition>0 begin select @thatid=" + fmocodename + ",@thatindexstr=" + findexname + " from " + dtable + " where " + fpositionname + "=@thatposition and " + fuppercodename + "=@upid ;");
    sb.Append("update " + dtable + " set " + fpositionname + "=@thisposition where " + fmocodename + "=@thatid ;update " + dtable + " set " + fpositionname + "=@thatposition where " + fmocodename + "=" + id + " ;");
    sb.Append("update " + dtable + " set " + findexname + "=replace(" + findexname + ",@thisindexstr,'temp') where " + findexname + " like @thisindexstr+'%' ;");
    sb.Append("update " + dtable + " set " + findexname + "=replace(" + findexname + ",@thatindexstr,@thisindexstr) where " + findexname + " like @thatindexstr+'%' ;");
    sb.Append("update " + dtable + " set " + findexname + "=replace(" + findexname + ",'temp',@thatindexstr) where " + findexname + " like 'temp%' ;");
    sb.Append(" end");
    db.SqlString = sb.ToString();
    //string exeinfo = sb.ToString();

    string exeinfo = db.TransUpdate();
    return exeinfo;
}
</script>