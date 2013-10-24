<%@ Page language="c#" Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat=server language=C#>
		private void Page_Load(object sender, System.EventArgs e)
		{
			this.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
			Response.Write("<base>");
			db.SqlString = "select modulecode,modulename,moduleindex from gmis_module where moduleuppercode=0 and modulestate=0 order by moduleindex";
           
			DataTable dt=db.GetDataTable();			
			string _t="1",h_link="";
			foreach(DataRow dr in dt.Rows)
			{
				if(IsSystemDeveloper()|| Isshowthis(dr["moduleindex"].ToString()))
				{			
					_t=((";1;").IndexOf(";"+dr["modulecode"].ToString()+";")>-1)?"1":"0";
					h_link=(dr["modulecode"].ToString()=="1199")?"gethy.aspx":"getbtns.aspx"	;
										
					Response.Write("<i n=\""+dr["modulename"].ToString()+"\" c=\""+dr["modulecode"].ToString()+"\" d=\""+h_link+"?rid="+dr["modulecode"].ToString()+"\" t=\""+_t+"\"/>");
				}
				
			}			
			
			Response.Write("</base>");
		}
</script>