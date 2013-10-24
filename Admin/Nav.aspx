<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
<title></title>
<meta http-equiv=content-type content="text/html; charset=gb2312">
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
<script language=javascript src="js.aspx"></script>
</head>

<!--#include file="func.aspx"-->
	<script runat="server" language="C#">
    string closed;
        string hyid = "";      
    private void Page_Load(object sender, System.EventArgs e)
    {
        closed = GetQueryString("closed", "0");//左边目录权展开状态 
        pid = GetQueryString("pid", "0");//左边目录树选项卡模块编号
        mid = GetQueryString("mid", "0");//模块编号(选择中项编号)
        hyid = GetQueryString("hyid", "0");//行业编号(选择行业编号)
		//Response.Write(mid);
        if (hyid != "0")
        {
            if (hyid == "1" || hyid == "2" || hyid == "3")
                mid = pid + "_" + mid + "_" + hyid;
            else
            mid = pid + "_" + mid + "_" + StringUtility.StringToBase64(hyid);
        }
        
    }	
</script>

<body style="border:0px;margin:0px;" bgcolor="#ffffff" scroll="no"  onmousedown="xise_cn()">
<div id="controlarea"></div>
<script language=javascript>
<!--
function xise_cn()
{
 if (event.button==2)1=1;
}
CreateControl("controlarea","Nav","images/Nav.swf?pid=<%=pid%>&mid=<%=mid%>&closed=<%=closed %>", 550, 400, "#FFFFFF");
/*
if(yfla.version()>7){

}else{
	window.parent.location.href= "player/upgrade.htm";
}*/
function Nav_DoFSCommand(command, args){

//    alert(command+":"+args);
	if(command=="data")
	{
	    var arrdata=args.split('_');
//		alert(args);
	    if(arrdata.length==1)
	    {		
		    window.parent.frames[3].location="getpage.aspx?mid="+args;	
		}
		else
		{
		    if(arrdata[0]="1199")
		    {
		        var _hcode=arrdata[2];
		        if(arrdata[2]=="1" || arrdata[2]=="2" || arrdata[2]=="3")
		        {
		            _hcode=arrdata[2];
		        }    
		       
		        window.parent.frames[3].location="list_1199.aspx?mid="+arrdata[0]+"&hycode="+_hcode+"&t=1";
		    }
		}
	}
	else if(command == "resize"){
		
	}else if (command == "status"){
		window.status = args;
	}else if(command == "hide"){
		if(args == "0"){
			window.parent.document.getElementById("mainset").cols = "7,*";
		}else{
			window.parent.document.getElementById("mainset").cols = "257,*";
		}
	}else if(command != "showmenu"){
		//alert(command+":"+args);
	}
}
//-->
</script>

<SCRIPT language=VBScript>
Sub Nav_FSCommand(ByVal cmd, ByVal args)
	call Nav_DoFSCommand(cmd, args)
end Sub

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

</BODY></HTML>

