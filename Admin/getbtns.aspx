<%@ Page language="c#" Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat=server language=C#>
		
		private void Page_Load(object sender, System.EventArgs e)
		{
			string rid=GetQueryString("rid","0");			
			this.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            if (rid != "0")
            {                
                
               db.SqlString = "select modulecode,modulename as modulename,moduleuppercode,moduleicon,moduleindex from gmis_module where moduleuppercode<>0 and modulestate=0 and moduleindex like '%'+(select moduleindex from gmis_module where modulecode=" + rid + ")+'%'  order by moduleindex";
               
                DataTable dt = db.GetDataTable();
                Response.Write("<base>");
                foreach (DataRow dr in dt.Rows)
                {
                    if(Isshowthis(dr["moduleindex"].ToString()) || (IsSystemDeveloper()&& rid!="2" && rid!="3" && rid!="7" && rid!="9" && rid!="640") )
					{
						Response.Write("<i n=\"" + dr["modulename"].ToString() + "\" c=\"" + dr["modulecode"].ToString() + "\" u=\"" + dr["moduleuppercode"].ToString() + "\" i=\"" + ((dr["moduleicon"].ToString() == "-1") ? "" : dr["moduleicon"].ToString()) + "\"/>");
					}
                }
            }		
			Response.Write("</base>");
		}
		
		
</script>