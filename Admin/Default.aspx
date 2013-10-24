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
        pid = GetQueryString("pid", "0");//���Ŀ¼��ѡ�ģ����
        mid = GetQueryString("mid", "0");//ģ����
        /**/  string cid = GetQueryString("cid", "0");//��Ŀ���
           string closed = GetQueryString("closed", "1");//���Ŀ¼Ȩչ��״̬
           
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
            �������б���ĿҪ�������֧�ֿ�ܣ���ʹ��IE6�����ϰ汾���������</p>
    </noframes>
</frameset>
</html>
