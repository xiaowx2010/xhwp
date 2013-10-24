<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"  %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender,System.EventArgs e)
{
 Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
    //pid=GetQueryString("pid","0");//Ä£¿éºÅ
    pid=Request.QueryString["pid"];
   if(pid!="") pid=pid.ToString().Trim(',');
   WriteXml();
}
private void WriteXml()
{
    Response.Write("<?xml version=\"1.0\" encoding=\"gb2312\"?>\n"); 
    Response.Write("<root>\n");
    db.SqlString="select modulename,modulecode from gmis_module where modulecode in ("+pid+")";
     DataTable h_dt=db.GetDataTable();//ÄÚ´æ±í
    if(h_dt.Rows.Count>0)
    {
        foreach(DataRow dr in h_dt.Rows)
        {
            Response.Write("<Item>");
            Response.Write("<tabname Text=\""+dr["modulename"].ToString()+"\" Value=\""+dr["modulecode"].ToString()+"\"></tabname>");
            Response.Write("</Item>");           
        }
    }
    Response.Write("</root>");
}
</script>