<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <OBJECT id=wb height=0 width=0 classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 name=wb></OBJECT>
    <script type="text/javascript">
　　    function printsetup(){ 
　　    // 打印页面设置 
　　    wb.execwb(8,1); 
　　    } 
　　    function printpreview(){ 
　　    // 打印页面预览 
    　　　　 
　　    wb.execwb(7,1); 
    　　　　　 
    　　　　 
　　    } 

　　    function printit() 
　　    { 
　　        if (confirm('确定打印吗？')) { 
　　            wb.execwb(6,6) 
　　        } 
　　    } 
　　</script>
</head>
<!--#include file="func.aspx"-->

<script runat="server" language="C#">
    private void Page_Load(object sender, System.EventArgs e)
    {
        if (Session["html"] != null&&Session["html"].ToString()!="")
        {
            divhtml.InnerHtml = Session["html"].ToString();
            Page.RegisterStartupScript("", "<script language='javascript'>printpreview();"+"window.close();</sc"+"ript>");
        }
    }
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <div id="go" visible="true" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
    
    <!--#include file="toolbar.aspx"-->
    <!--#include file="toolbarright.aspx"-->
    </div>
        <div id="divhtml" runat="server"></div>
    </form>
</body>
</html>
