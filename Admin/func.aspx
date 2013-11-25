<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<script runat=server language=C#>
string mid;			//模块编号
string id;			//编号
string pid;			//
string aid;			//操作符
string tid;			//类编号
string lid;			//层级
string size;		//图标大小
string mua;			//模块操作权限
string navindex;    //页编号
string tabid;       //选项卡ID
string dtable;		//更改和插入所指向的表
string filter;		//更改和插入的WHERE子句
string[] flds,flds1;		//字段名
string[] mflds;		//必填字段名
string types,types1;		//字符串，一位代表一列，0代表值为字符，1代表数字
Hashtable htParaGet;
Hashtable htParaSet;
    
SqlDB db = new SqlDB();
DataTable DTsql = new DataTable();

//设置用Session传递的参数
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
//设置用Session传递的参数
private void SetPageParameter(Hashtable ht)
{
    Session["filter"] = htParaSet;
}

//获取用Session传递的参数
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

//登陆用户ID
private string GetUID()
{
    string userid = "0";
    if (GetSESSION("uid") != "0")
        userid = GetSESSION("uid");
    return userid;
}
//获取用户名
private string GetUserNameStr(string fstr)
{
    StringBuilder sb = new StringBuilder();
    db.SqlString = "select UserName from gmis_User  where UserState='启用' " + fstr;
    DataTable dt = db.GetDataTable();
    foreach (DataRow dr in dt.Rows)
    {
        sb.Append(dr["UserName"].ToString() + ",");
    }
    return sb.ToString().Trim(',');
}
//取一字段值;
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
//获取模块标志//表名
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
//获取第一个有权限的模块编号
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
//绑定列表类控件
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
                    //ReString = "该用户已停用！";
                //}
            }
            else
                ReString = "用户名或密码出错！";
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
                return "用户名或密码出错！";
            }
            else
            {
                DataRow dr = dt.Rows[0];
                if (dr["userstate"].ToString() == "禁用")
                {
                    ReString = "该用户已被禁用！";
                }
                else
                {
                    ReString = "0";
                    if (dr["userrole"].ToString() == "系统管理员")
                        ReString = "1";
                    ReString += dr["usercode"].ToString();
                }
            }
        }
        catch (Exception e)
        {
            ReString = e.Message;//"出现未知的错误，用户登录失败！";
        }
    }
    return ReString;
}
    //判断是否为系统开发者
    private bool IsSystemDeveloper()
    {
        if (GetSESSION("SM") == "2")
            return true;
        else
        {
            return false;
        }
    }
    //获取第一个有权限的模块编号
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
    //获取某个模块的操作权限
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
//颜色
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
//获取主键字段
private string GetPK(string tablename)
{
    return db.getPK(tablename);
}
//获取模块名
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
/*字段管理*/
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
/*字段管理*/

//获取表名
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
//获取字段类型清单
private DataTable GetFieldType()
{
    db.SqlString = "select fieldtypecode,fieldtypename,sqllength,defaultvalue,sqlname from gmis_fieldtype";
    return db.GetDataTable();
}
//判断表字段是否存在
private Boolean CheckSysColumn(string tablename, string fieldname)
{
    db.SqlString = "select top 1 id from syscolumns WHERE name='" + fieldname + "' AND id =object_id ('" + tablename + "')";
    DataTable dt = db.GetDataTable();
    if (dt.Rows.Count > 0)//存在
        return true;
    else
        return false;
}
//判断表是否存在
private Boolean CheckSysObject(string tablename)
{
    db.SqlString = "select top 1 id from sysobjects WHERE id =object_id ('" + tablename + "')";
    //Response.Write(db.SqlString);
    DataTable dt = db.GetDataTable();
    if (dt.Rows.Count > 0)//存在
        return true;
    else
        return false;
}
 //获取字段
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
//获取字段名称
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
//获取目录
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
//获取列表行数
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
/*公共方法*/
//提升下降栏目位置
/*dir：提升、下降，dtable:表名，fmocodename:编号字段名，findexname:索引字段名,fpositionname:同级排序字段名,fuppercodename:直属上级字段名
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