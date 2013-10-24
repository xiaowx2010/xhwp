<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender,System.EventArgs e)
{
 Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
   // pid=GetQueryString("pid","0");//模块号
   pid=Request.QueryString["pid"];
   string h_field=Request.QueryString["field"];//字段
   //Response.Write(h_sort);
   WriteXml(h_field);
}
/*
函数：WriteXml(string _field)
作用：输出xml数据
参数：_field，字段组
更改人/日期：YJ/2009年12日
*/
private void WriteXml(string _field)
{
    Response.Write("<?xml version=\"1.0\" encoding=\"gb2312\"?>\n"); 
    Response.Write("<root>\n");  
    string[] pidarr=pid.ToString().Trim(',').Split(',');
    string[] fldarr=_field.ToString().Trim(',').Split(',');
    if(pidarr.Length>0)
    { 
        int h_i=0;//索引 
        for(int i=0;i<pidarr.Length;i++)
        {
            db.SqlString="select (select moduleurl from gmis_module a where a.modulecode=b.modulecode) as moduleurl,(select modulename from gmis_module a where a.modulecode=b.modulecode) as modulename,caption,fieldname,modulecode from gmis_field b where modulecode="+pidarr[i];
            DataTable h_dt=db.GetDataTable();//内存表
            if(h_dt.Rows.Count>0)
            {
                DataRow[] drr=h_dt.Select("fieldname='"+fldarr[i]+"'");
                if(drr.Length>0)
                {
                    Response.Write("<Item>");
                    Response.Write("<moduleurl>"+drr[0]["moduleurl"].ToString()+"</moduleurl>");
                    Response.Write("<modulename>"+drr[0]["modulename"].ToString()+"</modulename>");
                    Response.Write("<caption>"+drr[0]["caption"].ToString()+"</caption>");
                    Response.Write("<fieldname>"+drr[0]["fieldname"].ToString()+"</fieldname>");   
                    Response.Write("<modulecode>"+drr[0]["modulecode"].ToString()+"</modulecode>");   
                    Response.Write("<sort>"+h_i+"</sort>");                        
                    Response.Write("</Item>");
                    h_i++;
                }
            }
            
        }
    }
    Response.Write("</root>");
}
</script>