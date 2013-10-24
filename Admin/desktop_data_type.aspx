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
	Response.Write("<d n=\"所有行业\" c=\"0\">");
    Response.Write("</base>");

}



private DataTable GetDepts()
{
    if (dtDept == null)
    {
        SqlDB db = new SqlDB();
        db.SqlString = "select fld_1200_8 as deptcode,fld_1200_1 as deptname,fld_1200_4 as deptuppercode,(case when exists (select 1 from gmis_mo_1200 b where b.fld_1200_4=a.mocode) then 1 else 0 end) as hassubdept from gmis_mo_1200 a where fld_1200_3=1 order by fld_1200_6 asc";
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

    //sb.Append("<d n=\"污水处理厂\" c=\"f834\">");
    //sb.Append("<d n=\"垃圾处理厂\" c=\"f848\">");
    //sb.Append("<d n=\"危险废物处置厂\" c=\"f866\">");
    //sb.Append("<d n=\"医疗废物处置厂\" c=\"f884\">");
    return sb.ToString();
}
    
    
</script>