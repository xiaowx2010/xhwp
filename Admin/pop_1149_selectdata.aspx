<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.Page" %>
<%@ Import NameSpace="System.Data" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<script runat=server language=C#>
private void Page_Load(object sender, System.EventArgs e)
{
    this.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
    Response.Write("<base>");
    SqlDB db = new SqlDB();
    db.SqlString = "select fld_1160_1,replace(fld_1160_2,' ','') as fld_1160_2 from gmis_mo_1160";
    DataTable dt = db.GetDataTable();
        foreach (DataRow dr in dt.Rows)
        {
            Response.Write("<i n=\"" + dr["fld_1160_2"].ToString() + "\" c=\"" + dr["fld_1160_1"].ToString() + "\"/>");
        }
    Response.Write("</base>");
}
</script>