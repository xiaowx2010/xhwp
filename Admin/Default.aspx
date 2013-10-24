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
        pid = GetQueryString("pid", "0");//左边目录树选项卡模块编号
        mid = GetQueryString("mid", "0");//模块编号
        /**/  string cid = GetQueryString("cid", "0");//栏目编号
           string closed = GetQueryString("closed", "1");//左边目录权展开状态
           
           if (pid != "0")
           {
               nav.Attributes.Add("src", "nav.aspx?pid=" + pid + "&mid=" + mid + "&cid=" + cid + "&closed=" + closed);
           }
           else
           {
               nav.Attributes.Add("src", "nav.aspx?closed=" + closed);
           }
        if (GetSESSION("MainUrl") != "")
        {
            main.Attributes.Add("src", GetSESSION("MainUrl"));
        }
        else
        {
            main.Attributes.Add("src", "getpage.aspx?mid=0&aid=" + StringUtility.StringToBase64("list") + "");
        }


    }	
</script>

<frameset id="allset" rows="44,*" border="0">
    <frame name="banner" scrolling="no" src="Banner.aspx" frameborder="0" noresize>
    <frameset id="mainset" cols="257,*" border="0">
        <frame name="nav" id="nav" src="Nav.aspx" scrolling="no" frameborder="0" runat="server"/>
        <frameset id="conset" rows="5,*" border="0">
            <frame name="bar" src="Shadow.html" scrolling="no" frameborder="0" noresize>
            <frame id="main" name="main" src="" frameborder="0" runat="server" />
        </frameset>
    </frameset>
    <noframes>
        <p>
            正常运行本项目要求浏览器支持框架，请使用IE6或以上版本的浏览器。</p>
    </noframes>
</frameset>
</html>
