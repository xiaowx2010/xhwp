<!--行业代码（统一）,左边树-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
		<script src="images/tree.js" language="JScript"></script>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
    id = GetQueryString("id", "0");
    SetSESSION("guangye", "1");

    //以后分配目录权限用
    //SetSESSION("filter", "");  
}
</script>
<body style="text-align:center" scroll="no">
<div id="treearea"></div>
	<script>CreateControl("treearea","tree","images/tree.swf?tid=view_1201&cid=<%=id%>", 550, 400, "#FFFFFF");</script>

    <script language="javascript">
    <!--

    function tree_DoFSCommand(command, args)
    {
	    if(command == "data"){
		    window.parent.location = "view_1201.aspx?aid=dmlldw==&mid=1201&id="+args;	//
	    }
    }
    //-->
    </script>
    <SCRIPT LANGUAGE="VBScript">
    Sub tree_FSCommand(ByVal cmd, ByVal args)
	    call tree_DoFSCommand(cmd, args)
    end sub
    </SCRIPT>
</body>
</html>
