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
    //list.SqlStr="select modulecode,modulecode,modulename,modulecode,modulename from gmis_module where modulelevel=4 and modulecode>657 and modulecode<1028";  
   //list.Rows=list.DataTable.Rows.Count;
   if(!IsPostBack)
   {
    BindListControl(tabname,"modulecode","modulename","select modulecode,modulename from gmis_module where modulelevel=4 and modulecode>657 and modulecode<1028 or modulecode in(1093,683,828,907,1018,1021)","ÇëÑ¡Ôñ±í");
    SetFilter(tabname,"0");
   }
 }
</script>

<body>
    <form id="form1" runat="server">
    <div  style="height:600px; overflow-y:auto;padding-left:10px; padding-top:20px">
   <%-- <G:listbox id="list" runat="server" >
        <G:template id="temp" runat="server">
            <table  width="600" border="0"  cellpadding="0" cellspacing="0">
                <tr>
                    <td width="8%"><input id="ch_*" type="checkbox" onclick="Add_Tab('*','*')" /></td>
                    <td width="90%" align="left" id="td_*">*</td>
                </tr>
            </table>
        </G:template>
    </G:listbox>--%>
    <asp:DropDownList ID="tabname" runat="server" onchange="if(this.value != '') Add_Tab(this.options[this.selectedIndex].value,this.options[this.selectedIndex].text,'0');"></asp:DropDownList>
    </div>    
    </form>
</body>
<script language="javascript">
function Add_Tab(str1,str2,str3)
{
   opener.window.AddTable(str1,str2,str3);
}
</script>
</html>
