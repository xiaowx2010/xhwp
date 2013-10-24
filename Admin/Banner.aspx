<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>

<!--#include file="func.aspx"-->

<script runat="server" language="C#">
    private void Page_Load(object sender, System.EventArgs e)
    {
        if (GetSESSION("uname") != "")
        {
            userinfo.InnerHtml = "»¶Ó­£¬<span style=\"color:#ff6600;\">" + GetSESSION("uname") + "</span>";
            if (!IsSystemDeveloper())
            {
                userinfo.InnerHtml += " | <a href=\"javascript:__doOpenView('pop_editpassword.aspx',390,260,10,50)\" style=\"color:White;\">ÐÞ¸ÄÃÜÂë</a>";
            }

        }

    }
    private void Click_Exit(object sender, System.EventArgs e)
    {
        ClearSESSION();
        Session.Clear();
        Response.Write("<s" + "cript>window.parent.location='login.aspx'" + "</s" + "cript>");
    }	
</script>

<script>

function returnDeskTop()
{
    window.parent.frames(1).location="Nav.aspx?closed=1";
    window.parent.frames(3).location="DeskTop.aspx?closed=1";
}
</script>

<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" background="images/top_001.gif">
        <tr valign="top">
           <td align="left"><img src="images/top_001.jpg" width="680" ></td>
          <td align="right" background="images/top_002.jpg" width="476"   class="top_font1225_000000" >
        
                <table width="100%">
                    <tr>
                        <td>
                            <div id="newsroll">
                            </div>
                        </td>
                        <td style="width: 260px;" nowrap align="right">
                        <a href="javascript:returnDeskTop();" style="color:White;">·µ»ØÊ×Ò³</a> 
                           <span style="color:White;">|</span>
                         <span id="userinfo" runat="server" style="color:White;"></span><span style="color:White;">|</span>
                            <asp:LinkButton ID="btn_exit" Text="ÍË ³ö" ForeColor="white" runat="server" OnClick="Click_Exit"></asp:LinkButton></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <script language="javascript">
<!--
CreateControl("newsroll","NewsRoll","images/NewsRoll.swf?mode=3&dataroot=news.aspx&color=000000&hover=EC0202&win=_blank&line=1&head=&width=160&height=40&bg=topbg.gif", 160, 44, "");

//-->
    </script>

    <script language="VBScript">
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
    </script>

    </form>
</body>
</html>
