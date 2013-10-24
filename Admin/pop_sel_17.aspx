<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"  %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string p_id="";
private void Page_Load(object sender, System.EventArgs e)
{
	 p_id=GetQueryString("id","0");	 
}
</script>
<script type="text/javascript" defer>
function ClickConfirm()
{
    opener.form1.fld_17_8.value=document.getElementById("code").value;
    opener.form1.fld_17_8_txt.value=document.getElementById("name").value;
    
    opener=null;
    window.close();
}
</script>
<body style="margin:0px;padding:0px;text-align:center">
<form id="form1" runat="server">
<!--操作工具条-->
        <!--#include file="toolbarleft.aspx"-->
        <!--左边自定义操作-->        
        <td style="padding-left:5px;" nowrap>
          
       <G:Button ID="Button1" Type="toolbar" Mode="on" icon="complate" Text="确认选择" Url="javascript:ClickConfirm();" runat="server"></G:Button>
        </td>
        <!--左边自定义操作-->
        <!--右边固定按钮-->
        <!--#include file="toolbar.aspx"-->
        <!--右边固定按钮-->
        <!--#include file="toolbarright.aspx"-->
        <!--操作工具条-->
<div id="divselectfold" style="margin-top:8px;"></div>
<input id="code" type="hidden" runat="server" />   
<input id="name" type="hidden" runat="server" />
<script language=javascript>
<!--
//CreateControl("divselectfold","swfselectfold","images/MultiSelect.swf?app=swfselectfold&mode=0&icon=user&dataroot=pop_sel_17data.aspx&fold=0&sellist=<%=p_id%>", 390, 260, "");
CreateControl("divselectfold","swfselectfold","images/MultiSelect.swf?app=swfselectfold&mode=3&cols=5&width=400&height=200&dataroot=pop_sel_17data.aspx&fold=2&id=<%=p_id%>", 420, 260, "");

function swfselectfold_DoFSCommand(command, args){       
	if(command == "resize"){
	}else if(command == "showmenu"){
	}else if (command == "status"){
		window.status = args;
	}else if(command == "data"){
	   var arr_args=args.split("|");
	    //opener.form1.usercodestr.value="";
		//opener.form1.usernamestr.value="";
		
	    if(arr_args.length>1)
	    {
	        window.form1.code.value=arr_args[1];
            window.form1.name.value=arr_args[0];
	    }
		//window.status = args;
	}else{
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
</form>
</body>
</html>
