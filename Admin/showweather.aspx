<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
	<HEAD>
		<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<!--#include file="func.aspx"-->
	<!--#include file="shweather_func.aspx"-->
<script runat="server" language="C#">
    string weather = "";
private void Page_Load(object sender, System.EventArgs e)
{
    weather = GetWeather();
}
</script>

<body style="background-color:Transparent;; margin:0px 0px 0px 0px; height:25px;">
<form id="form1" runat="server">
<table width="100%" border="0" style="background-color:Transparent;" cellpadding="0" cellspacing="0">
<tr>
<td nowrap height="24px" width="510px;" style="background-color:Transparent;"><div id="divWeather" style="background-color:Transparent;"></div></td>
</tr>
</table>
<script language="javascript" src="js.aspx"></script>
<script language=javascript>
<!--
CreateControl("divWeather","NewsRoll","images/NewsRoll.swf?mode=0&dataroot=showweatherdata.aspx&color=#f2f2f2&hover=686868&line=1&head=&bg=images/grzm003.gif&width=500&height=20&speed=0", 500,20, "#f2f2f2");
//-->
</script>

</script>
<SCRIPT language=VBScript>
Function VBGetSwfVer(i)
 on error resume next
 Dim swControl, swVersion
 swVersion = 0

 set swControl = CreateObject("ShockwaveFlash.ShockwaveFlash." + CStr(i))
 if (IsObject(swControl)) then
      swVersion = swControl.GetVariable("$version")
 end if
     VBGetSwfVer = swVersion
End Function
</SCRIPT>
</form>
</body>
</html>