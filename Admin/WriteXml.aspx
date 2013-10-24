<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender,System.EventArgs e)
{
    Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
    pid = GetQueryString("pid","0");
    GetSubData();
}
private void GetSubData()
{    
    Response.Write("<?xml version=\"1.0\" encoding=\"gb2312\"?>\n"); 
    Response.Write("<root>\n");
        db.SqlString = "select modulecode,modulename from gmis_module where  moduleindex like '%0.00240000%' and modulestate=0 and modulelevel=4  ";
        DataTable h_dt = db.GetDataTable();//ÄÚ´æ±í1
        if (h_dt.Rows.Count > 0)
        {
            string h_str="",h_str2="";
            foreach (DataRow dr in h_dt.Rows)
            {
                h_str += " <tabname Text=\"" + dr["modulename"] + "\" Value=\"" + dr["modulecode"] + "\" ></tabname>";
                DataRow[] idr = GetFields(dr["modulecode"].ToString()).Select(" isvital=0 and caption not like '%Ô¤Áô%'");
                if (idr.Length > 0)
                {
                     if (pid == dr["modulecode"].ToString())
                    {                    
                    h_str2 += "<tabname>";
                    foreach (DataRow drr in idr)
                    {
                        h_str2 += "<field3 Text=\"" + drr["caption"] + "\" Value=\"" + drr["fieldname"] + "\"  ></field3>";
                    }
                    h_str2 += "</tabname>";
                  
                        Response.Write(h_str2);
                    }
                }
            }
            if(pid=="1125") 
            {
                Response.Write("<type3>"+h_str+"</type3>");
            }
        }
    
    db.SqlString = "select modulecode,modulename from gmis_module where moduleindex like '%0.002401%' and modulelevel=4  ";

    DataTable h_dt2 = db.GetDataTable();//ÄÚ´æ±í2
    if (h_dt2.Rows.Count > 0)
    {
       string h_str="",h_str2="";
            foreach (DataRow dr in h_dt2.Rows)
            {
                h_str += " <tabname Text=\"" + dr["modulename"] + "\" Value=\"" + dr["modulecode"] + "\" ></tabname>";
                DataRow[] idr = GetFields(dr["modulecode"].ToString()).Select(" isvital=0 and caption not like '%Ô¤Áô%'");
                if (idr.Length > 0)
                {
                     if (pid == dr["modulecode"].ToString())
                    {                   
                    h_str2 += "<tabname>";
                    foreach (DataRow drr in idr)
                    {
                        h_str2 += "<field3 Text=\"" + drr["caption"] + "\" Value=\"" + drr["fieldname"] + "\" ></field3>";
                    }
                    h_str2 += "</tabname>";
                   
                        Response.Write(h_str2);
                    }
                }
            }
            if(pid=="1127")
            {
                 Response.Write("<type3>"+h_str+"</type3>");
            }
    }
   db.SqlString = "select modulecode,modulename from gmis_module where moduleindex like '%0.002402%' and modulelevel=4  ";

    DataTable h_dt3 = db.GetDataTable();//ÄÚ´æ±í3
    if (h_dt3.Rows.Count > 0)
    {
    string h_str="",h_str2="";
            foreach (DataRow dr in h_dt3.Rows)
            {
                h_str += " <tabname Text=\"" + dr["modulename"] + "\" Value=\"" + dr["modulecode"] + "\" ></tabname>";
                DataRow[] idr = GetFields(dr["modulecode"].ToString()).Select(" isvital=0 and caption not like '%Ô¤Áô%'");
                if (idr.Length > 0)
                {
                    if (pid == dr["modulecode"].ToString())
                    {                  
                    h_str2 += "<tabname>";
                    foreach (DataRow drr in idr)
                    {
                        h_str2 += "<field3 Text=\"" + drr["caption"] + "\" Value=\"" + drr["fieldname"] + "\" ></field3>";
                    }
                    h_str2 += "</tabname>";                    
                    Response.Write(h_str2);
                    }
                }
            }
            if(pid=="1128") Response.Write("<type3>"+h_str+"</type3>");
   }
 DataRow[] oidr=GetFields(pid).Select(" isvital=0 and caption not like '%Ô¤Áô%'");
 string h_str3="";//×Ö¶Î
 if(oidr.Length>0)
 {
    h_str3+="<tabname>";
    foreach(DataRow dr in oidr)
    {
         h_str3 += "<field3 Text=\"" + dr["caption"] + "\" Value=\"" + dr["fieldname"] + "\" ></field3>";
    }
    h_str3+="</tabname>";
 }
 if((",1093,683,828,907,1018,1021,").IndexOf(","+pid+",")>-1) Response.Write(h_str3);

   Response.Write("</root>");
}
</script>