<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat="server" language="C#">
private void Page_Load(object sender, System.EventArgs e)
{
	string username = GetSESSION("uname");//当前登陆的用户名
	string logintimes;
	if (StringUtility.EscapeStr(username) == "--wcp12Z")//若用户为GMIS，这里定义用户代码为0
    {
        logintimes = GetFieldData("select fld_1207_3 from gmis_mo_1207 where fld_1207_1=0");
    }
    else
    {
        logintimes = GetFieldData("select fld_1207_3 from gmis_mo_1207 where fld_1207_1 in (select usercode from gmis_user where username='" + GetSESSION("uname") + "')");
    }    
	Response.Write("<base>");
	Response.Write("<i n=\"欢迎"+GetSESSION("uname")+"来到青浦环境信息管理系统，您今天是第"+logintimes+"次登陆本系统\" u=\"\"/>");
	Response.Write("</base>");
    
}
</script>