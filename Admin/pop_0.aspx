<!--µØ≥ˆ¥Ú”°‘§¿¿-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<object classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" id="wb" width="0" name="wb"></object>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>

<script language="C#" runat="server">
    private void Page_Load(object sender, System.EventArgs e)
    {
        fold.InnerHtml = GetSESSION("filter");
        Page.RegisterStartupScript("print", "<scrip" + "t>printpreview();</" + "script>");

    }


</script>
<script type="text/javascript">
    function printsetup(){ 
°°°°    // ¥Ú”°“≥√Ê…Ë÷√ 
°°°°    wb.execwb(8,1); 
°°°°} 
°°°°function printpreview(){ 
°°°°    wb.ExecWB(7,1);// ¥Ú”°“≥√Ê‘§¿¿ 
°°°°} 

°°°°function printit() 
°°°°{ 
°°°°    wb.execwb(6,6); 
°°°°}

</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<div id="fold" runat="server"></div>
</form>
</body>
</html>
