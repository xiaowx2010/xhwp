<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>

<script runat="server" language="C#">
    DataTable dtDept;
private void Page_Load(object sender, System.EventArgs e)
{
    Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);

    Response.Write("<base>");
    Response.Write(GetDeptStr("0"));
	Response.Write("<d n=\"所有类型\" c=\"0\">");
    Response.Write("</base>");

}



private DataTable GetDepts()
{
    if (dtDept == null)
    {
        SqlDB db = new SqlDB();
        db.SqlString = "select fld_1162_1 as deptcode,fld_1162_2 as deptname,0 as deptuppercode,0 as hassubdept from gmis_mo_1162 a order by mocode asc";
        dtDept = db.GetDataTable();
    }
    return dtDept;
}

private string GetDeptStr(string deptcode)
{
    StringBuilder sb = new StringBuilder();

    DataRow[] drs = GetDepts().Select("deptuppercode=" + deptcode);
    string c;
    foreach (DataRow dr in drs)
    {

        sb.Append("<d n=\"" + dr["deptname"].ToString() + "\" c=\"" + dr["deptcode"].ToString() + "\">");
      

        if (dr["hassubdept"].ToString() == "1")
        {
            sb.Append(GetDeptStr(dr["deptcode"].ToString()));
        }

        sb.Append("</d>");
    }

    return sb.ToString();
}
    
    
</script>