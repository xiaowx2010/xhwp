

<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat=server language=C#>
private void Page_Load(object sender, System.EventArgs e)
{
    //通知公告数据源
    this.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
   
    SqlDB db = new SqlDB();
    db.SqlString = "select top 6 '10' as mid,mocode as id,fld_10_1 as motopic from gmis_mo_10 order by createdate desc";
    
    Response.Write("<base>");
    
    DataTable dt = db.GetDataTable();
    if (dt.Rows.Count > 0)
    {
        for(int i=0;i<=6/dt.Rows.Count;i++)
        {
            foreach (DataRow drm in dt.Rows)
            {
                Response.Write("<i n=\"" + drm["motopic"].ToString().Replace("\"", "").Replace("<", "").Replace(">", "") + "\"  u=\"/admin/view_10.aspx?mid=" + drm["mid"].ToString() + "&id=" + drm["id"].ToString() + "\"/>");
                //Response.Write(drm["motopic"].ToString().Replace("\"", "").Replace("<", "").Replace(">", ""));
            }
        }
    }
    else
    {
        Response.Write("<i n=\"暂无相关内容\" u=\"\"/>"); 
    }
    
    
    Response.Write("</base>");
}
</script>
