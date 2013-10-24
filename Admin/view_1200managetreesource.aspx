<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>

<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
     Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
     Response.Write("<base>");
        
     DataTable dt = db.GetDataTable(db.ConnStr, "select mocode,fld_1200_1,fld_1200_4 from gmis_mo_1200 where 1=1 order by fld_1200_6");
     
     foreach (DataRow dr in dt.Rows)
     {
         Response.Write("<c c=\"" + dr["mocode"].ToString() + "\" n=\"" + dr["fld_1200_1"].ToString() + "\" u=\"" + dr["fld_1200_4"].ToString() + "\" />");
     }
     Response.Write("</base>");
}
</script>
