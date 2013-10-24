<%@ Page language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat=server language=C#>
		private void Page_Load(object sender, System.EventArgs e)
		{
		    string h_id=GetQueryString("id","0");	 
			this.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
			Response.Write("<base n=\"ÐÐÒµ\" t=\"1\">");
            SqlDB db = new SqlDB();
            db.SqlString = "select mocode,fld_45_1,fld_45_2,fld_45_3 from gmis_mo_45 order by mocode";
            DataTable ddt = db.GetDataTable();  
            db.SqlString = "select mocode,fld_46_1,fld_46_4,fld_46_5 from gmis_mo_46 where mocode<>"+h_id+" order by mocode";
            DataTable dt = db.GetDataTable();
            
            
            DataRow[] drs = ddt.Select(" fld_45_2=1");
            foreach(DataRow ddr in drs)
            {
                Response.Write("<d n=\"" + ddr["fld_45_1"].ToString() + "\" c=\"" + ddr["mocode"].ToString() + "\">");
                DataRow[] ddrs = ddt.Select(" fld_45_3="+ddr["mocode"].ToString());
                if(ddrs.Length>0)
                {
                    foreach (DataRow dr in ddrs)
                    {
                        
                        DataRow[] drss = dt.Select(" fld_46_4="+ddr["mocode"].ToString()+" and fld_46_5="+dr["mocode"].ToString());
                        if(drss.Length>0)
                        {
                            Response.Write("<d n=\"" + dr["fld_45_1"].ToString() + "\" c=\"" + dr["mocode"].ToString() + "\">");  
                            foreach (DataRow row in drss)
                            {
                                Response.Write("<i n=\"" + row["fld_46_1"].ToString() + "\" c=\"" + row["mocode"].ToString() + "\"/>");
                            }            
                            Response.Write("</d>");  
                        }     
                    }
                }
                else
                {
                    DataRow[] drss1 = dt.Select(" fld_46_4="+ddr["mocode"].ToString());
                    foreach (DataRow row1 in drss1)
                    {
                        Response.Write("<i n=\"" + row1["fld_46_1"].ToString() + "\" c=\"" + row1["mocode"].ToString() + "\"/>");
                    }   
                }
                Response.Write("</d>");
            }
			
			Response.Write("</base>");
			//Response.Write("<base n=\"²Ù×÷\"><i n=\"\" c=\"1\"/></base>");
		}
</script>