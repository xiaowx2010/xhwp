<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender,System.EventArgs e)
{
 Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
    pid=GetQueryString("pid","0");//Ä£¿éºÅ
   WriteXml();
}
private void WriteXml()
{
    Response.Write("<?xml version=\"1.0\" encoding=\"gb2312\"?>\n"); 
    Response.Write("<root>\n");
    db.SqlString="select caption,fieldname,(select fieldtypename from gmis_fieldtype a where a.fieldtypecode=b.fieldtypecode) as fieldtypecode,datalength,(select moduleurl from gmis_module a where a.modulecode=b.modulecode) as moduleurl from gmis_field b where isvital=0 and caption not like '%Ô¤Áô%' and modulecode="+pid;
    DataTable h_dt=db.GetDataTable();//ÄÚ´æ±í
    if(h_dt.Rows.Count>0)
    {
        foreach(DataRow dr in h_dt.Rows)
        {
            Response.Write("<Item>");
            Response.Write("<caption>"+dr["caption"].ToString()+"</caption>");
            Response.Write("<filedname>"+dr["fieldname"].ToString()+"</filedname>");
            Response.Write("<fieldtypecode>"+dr["fieldtypecode"].ToString()+"</fieldtypecode>");
            Response.Write("<datalength>"+dr["datalength"].ToString()+"</datalength>");
            Response.Write("<moduleurl>"+dr["moduleurl"].ToString()+"</moduleurl>");
            Response.Write("</Item>");           
        }
    }
    Response.Write("</root>");
}
</script>