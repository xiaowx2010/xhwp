<%@ Page language="c#" Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat=server language=C#>
		
		private void Page_Load(object sender, System.EventArgs e)
		{
			string rid=GetQueryString("rid","0");			
			this.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
			
			DataTable dt = db.GetDataTable(db.ConnStr,"select fld_1200_1 as hyname,fld_1200_8 as hycode,fld_1200_2 as hytype from gmis_mo_1200 where fld_1200_3=1 ");
		    
		    Response.Write("<base>");
		    Response.Write("<i n=\"工业源\" c=\"1199_1_1\" u=\"1199\" i=\"0\"/>");
		    
		    DataRow[] drs = dt.Select("hytype=1");
		    foreach(DataRow dr in drs)
		    {
		        Response.Write("<i n=\""+dr["hyname"].ToString().Trim()+"\" c=\"1199_1_"+StringUtility.StringToBase64(dr["hycode"].ToString())+"\" u=\"1199_1_1\" i=\"0\"/>");
		    }
		    
		    Response.Write("<i n=\"生活源\" c=\"1199_2_2\" u=\"1199\" i=\"0\"/>");
		    drs = dt.Select("hytype=2");
		    foreach(DataRow idr in drs)
		    {
		        Response.Write("<i n=\""+idr["hyname"].ToString().Trim()+"\" c=\"1199_2_"+StringUtility.StringToBase64(idr["hycode"].ToString())+"\" u=\"1199_2_2\" i=\"0\"/>");
		    }
		    
		    Response.Write("<i n=\"集中式污染治理设施\" c=\"1199_3_3\" u=\"1199\" i=\"0\"/>");
			drs = dt.Select("hytype=3");
		    foreach(DataRow idr in drs)
		    {
		        Response.Write("<i n=\""+idr["hyname"].ToString().Trim()+"\" c=\"1199_3_"+StringUtility.StringToBase64(idr["hycode"].ToString())+"\" u=\"1199_3_3\" i=\"0\"/>");
		    }
		    //Response.Write("<i n=\"高级搜索\" c=\"1232\" u=\"0\" i=\"0\"/>");
		    
		    
		    Response.Write("</base>");

		}
		
		
	
</script>