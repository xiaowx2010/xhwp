<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
	<!--#include file="func.aspx"-->
<!-- #include file="shweather_func.aspx" -->
<script runat="server" language="C#">
private void Page_Load(object sender, System.EventArgs e)
{
    //天气预报数据源
        Response.Write("<base>");
        Response.Write("<i n=\"" + ShowWeather() + "\" u=\"\"/>");
        Response.Write("</base>");
    
}
</script>
