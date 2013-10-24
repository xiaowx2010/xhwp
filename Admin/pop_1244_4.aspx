<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<script language="c#" runat="server">
 private void Page_Load(object sender, System.EventArgs e)
 {
   
 }
</script>

<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1"  class="table_graybgcolor">
        <tr>
        <td  class="td_viewcontent_title" width="100" align="center">模块名</td>
            <td class="td_viewcontent_content" style="padding-left:2px"><input id="fld_1244_1" runat="server" type="text" style="width:95%" /></td>
        </tr>
        <tr>
        <td  class="td_viewcontent_title" width="100" align="center">操作</td>       
            <td class="td_viewcontent_content" align="right" style="padding-right:10px" ><table border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td class="btn_L_pic"></td>
                                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="bottom" class="btn_text">
									  <!--应用模板-->
									  <G:Button id="btn_loadedition" type="toolbar" mode="on" icon="tb11" url="javascript:saveThis()" text="保存" runat="server"></G:Button>
									  <!--应用模板-->
									  </td>
                                    </tr>
                                </table></td>
                                <td class="btn_R_pic"></td>
                              </tr>
                            </table></td>
        </tr>
    </table>
    </form>
</body>
<script language="javascript">
function saveThis()
{
    opener.form1.fld_1244_1.value=document.getElementById("fld_1244_1").value;
    opener.window.saveThis();
    window.close();
}
</script>
</html>
