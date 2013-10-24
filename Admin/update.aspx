<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat="server" language="C#">
	private void Update_Click(object sender, System.EventArgs e)
	{	
	    db.SqlString="select fld_11_3,mocode from gmis_mo_11 order by mocode";
	    DataTable dt=db.GetDataTable();
	    StringBuilder sb=new StringBuilder();
	    foreach(DataRow dr in dt.Rows)
	    {
			sb.Append("Update gmis_mo_11 set fld_11_3='"+StringUtility.StringToBase64(StringUtility.Base64ToString(dr["fld_11_3"].ToString()).Replace("＇","'").Replace("‘","'").Replace("’","'"))+"' where mocode="+dr["mocode"].ToString()+";");			
	    }
	    if(sb.Length>0)
	    {
			db.SqlString="Begin "+sb.ToString()+" End";
			//Response.Write(db.SqlString);
			//Response.Write(db.TransUpdate());
	    }
	}
</script>
<form id="form1" runat="server">
<asp:LinkButton id="update" onclick="Update_Click" runat="server">更新数据</asp:LinkButton>
</form>
