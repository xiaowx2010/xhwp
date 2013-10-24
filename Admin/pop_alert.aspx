<!--查询编辑页,列表页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string filter_1202;
    private void Page_Load(object sender, System.EventArgs e)
    {
        mid = GetQueryString("mid","0");
        id = GetQueryString("id","0");
        pid = GetQueryString("pid", "0");
        tid = GetQueryString("tid", "0");       
    }
    private void Click_Fugai(object sender, System.EventArgs e)
    {
        //Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id);
        filter_1202 = GetSESSION("filter");
        SetSESSION("sql", GetSESSION("extsql"));
        SetSESSION("extsql", "");
        
        Response.Write("<scr"+"ipt>opener.window.location.href='execommand.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id+"&pid="+pid+"&tid="+tid+"';</scri"+"pt>");
        Response.Write("<scr" + "ipt>window.close();</scri" + "pt>");
    }

    private void Click_Fanhui(object sender, System.EventArgs e)
    {
        //Response.Redirect("getpage.aspx?aid=" + StringUtility.StringToBase64("add") + "&mid=" + mid + "");
        Response.Write("<scr" + "ipt>opener.window.location.href='getpage.aspx?aid=" + StringUtility.StringToBase64("add") + "&mid=" + mid + "';</scri" + "pt>");
        Response.Write("<scr" + "ipt>window.close();</scri" + "pt>");
    }
    
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<div id="div_output" runat="server" style="padding-top:20px">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%"  ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" class="font_2635B_000">
          
该企业代码已存在!</td>
      </tr>
    </table>
    <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-top:50px;">
      <tr>
        <td align="right" style="margin-right:10px; padding-right:10px;"><G:Button id="fugai" type="toolbar" mode="on" text="更新原有企业数据" runat=server OnClick="Click_Fugai"></G:Button></td>
        <td align="left" style="margin-left:10px; padding-left:10px;"><G:Button id="fanhui" type="toolbar" mode="on" text="重新新增企业数据" runat=server OnClick="Click_Fanhui"></G:Button></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</div>
</form>
</body>
</html>
