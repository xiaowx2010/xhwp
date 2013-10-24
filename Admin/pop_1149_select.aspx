<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
		<script language="javascript" src="js.aspx"></script>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>

<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string p_slist="";
private void Page_Load(object sender, System.EventArgs e)
{
	 p_slist=GetQueryString("slist","0");
}
</script>
<script type="text/javascript">
function ClickConfirm()
{
    opener.form1.fld_1149_92.value=document.getElementById("codestr").value;
    opener.form1.fld_1149_92_txt.value=document.getElementById("namestr").value;
}

</script>

<body style="margin:0px;padding:0px;text-align:center" onunload="ClickConfirm">
<div id="divselectfold"></div>
<input id="codestr" type="hidden" runat="server" value="" />   
<input id="namestr" type="hidden" runat="server" value="" />
<script language=javascript>
<!--
CreateControl("divselectfold","swfselectfold","images/MultiSelect.swf?app=swfselectfold&mode=1&icon=user&dataroot=pop_1149_selectdata.aspx&fold=0&sellist=<%=p_slist%>", 390, 260, "");

function swfselectfold_DoFSCommand(command, args){       
	if(command == "resize")
	{
	}
	else if(command == "showmenu")
	{
	}
	else if (command == "status")
	{
		window.status = args;
	}
	else if(command == "data")
	{
	   var arr_args=args.split("|");
	    opener.form1.fld_1149_92.value="";
		opener.form1.fld_1149_92_txt.value="";
//		alert(args);
	    if(arr_args.length>1)
	    {
	        document.getElementById("namestr").value=arr_args[0];
	        document.getElementById("codestr").value=arr_args[1];
	        opener.form1.fld_1149_92.value=arr_args[1];
		    opener.form1.fld_1149_92_txt.value=arr_args[0];
		}
		//window.status = args;
//		alert(document.getElementById("namestr").value);
	}
	else
	{
		alert(command+":"+args);
	}
}
//-->
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
</body>
</html>