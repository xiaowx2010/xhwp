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
    mid=Request.QueryString["mid"];//栏目组
    mid=mid.Trim(',');
    if(!IsPostBack)
    {
        BindListControl(lefttable,"modulecode","modulename","select modulecode,modulename from gmis_module where (modulelevel=4 and modulecode>657 and modulecode<1028 or  modulecode in(1093,683,828,907,1018,1021)) and modulecode in ("+mid+")","请选择左表");
        BindListControl(righttable,"modulecode","modulename","select modulecode,modulename from gmis_module where (modulelevel=4 and modulecode>657 and modulecode<1028 or modulecode in(1093,683,828,907,1018,1021)) and modulecode in("+mid+")","请选择右表");
        SetFilter(lefttable,"0");
        SetFilter(righttable,"0");
        BindControlData(rel);
        if(id!="0")
        {
            if(lefttable.SelectedItem!=null&&lefttable.SelectedItem.Value!="0")
            {
                BindListControl(leftfield,"fieldname","caption","select filedname,caption from gmis_field where caption not like '%预留%'and modulecode="+lefttable.SelectedItem.Value);
                SetFilter(leftfield,"fld_"+lefttable.SelectedItem.Value+"_1");
            }
            if(righttable.SelectedItem!=null&&righttable.SelectedItem.Value!="0")
            {
                BindListControl(rightfield,"fieldname","caption","select filedname,caption from gmis_field where caption not like '%预留%'and modulecode="+righttable.SelectedItem.Value);
                SetFilter(rightfield,"fld_"+righttable.SelectedItem.Value+"_1");
            }
        }
    }   
 }
 /*
 *函数：ChangeTable(object sender,System.EventArgs e)
 作用：切换下拉框时，绑定对应关联数据
 更改人/日期：YJ/2009年8月12日
 */
 private void ChangeTable(object sender,System.EventArgs e)
 {
    if(lefttable.SelectedItem!=null&&lefttable.SelectedItem.Value!="0")
    {
        BindListControl(leftfield,"fieldname","caption","select fieldname,caption from gmis_field where caption not like '%预留%'and modulecode="+lefttable.SelectedItem.Value);
        SetFilter(leftfield,"fld_"+lefttable.SelectedItem.Value+"_1");
    }
    if(righttable.SelectedItem!=null&&righttable.SelectedItem.Value!="0")
    {
        BindListControl(rightfield,"fieldname","caption","select fieldname,caption from gmis_field where caption not like '%预留%'and modulecode="+righttable.SelectedItem.Value);
         SetFilter(rightfield,"fld_"+righttable.SelectedItem.Value+"_1");
    }
 }
 /*
 * 函数:BindControlData()
 * 功能：绑定操作符的值
 更改人/日期：YJ/2009年8月10日
 */
private void BindControlData(ListControl _c)
{
    _c.Items.Add(new ListItem("等于", "="));
    _c.Items.Add(new ListItem("大于", ">"));
    _c.Items.Add(new ListItem("大于等于", ">="));
   _c.Items.Add(new ListItem("小于", "&#60"));
   _c.Items.Add(new ListItem("小于等于", "<="));
   _c.Items.Add(new ListItem("相似于", "like"));
}
</script>

<body>
    <form id="form1" runat="server">
    <!--操作工具条-->
        <!--#include file="toolbarleft.aspx"-->
        <!--右边固定按钮-->
        <!--#include file="toolbar.aspx"-->
        <td>
        <img src="images/gjcx_030.gif" width="55" height="22" border="0" style="cursor:hand" onclick="javascript:AddTable()"/>
        </td>
        <!--右边固定按钮-->
        <!--#include file="toolbarright.aspx"-->
        <!--操作工具条-->
    <div  style="height:550px; overflow-y:auto;padding-left:10px; padding-top:20px">
    <table border="0" align="center"  width="520px" cellpadding="3" cellspacing="1"  class="table_graybgcolor">
      <tr>
        <td style="padding-top:5px" width="100" align="center" class="td_viewcontent_title">左表名称：</td><td class="td_viewcontent_content" ><asp:DropDownList ID="lefttable" runat="server" style="width:95%" OnSelectedIndexChanged="ChangeTable" AutoPostBack="true"></asp:DropDownList></td>
      </tr>
      <tr>
        <td style="padding-top:5px" align="center" class="td_viewcontent_title">左表字段：</td><td class="td_viewcontent_content"><asp:DropDownList ID="leftfield"  style="width:95%" runat="server"></asp:DropDownList></td>
      </tr>
      <tr>
      <td  style="padding-top:5px" align="center" class="td_viewcontent_title">关联关系：</td><td class="td_viewcontent_content"><asp:DropDownList ID="rel"  style="width:95%"  runat="server"></asp:DropDownList></td>
      </tr>
      <tr>
      <td style="padding-top:5px" align="center" class="td_viewcontent_title">右表名称：</td><td class="td_viewcontent_content"><asp:DropDownList ID="righttable" runat="server" style="width:95%"    OnSelectedIndexChanged="ChangeTable" AutoPostBack="true" ></asp:DropDownList></td>
      </tr>
      <tr>
        <td style="padding-top:5px" align="center" class="td_viewcontent_title">右表字段：</td><td class="td_viewcontent_content"><asp:DropDownList ID="rightfield" style="width:95%"   runat="server"></asp:DropDownList></td>
      </tr>
       <tr>
        <td style="padding-top:5px" align="center" class="td_viewcontent_title">关联类型：</td><td class="td_viewcontent_content"><asp:DropDownList ID="reltype" style="width:95%"   runat="server"><asp:ListItem Value="0">内连接</asp:ListItem><asp:ListItem Value="1">左外连接</asp:ListItem><asp:ListItem Value="2">右外连接</asp:ListItem></asp:DropDownList></td>
      </tr>
    </table>
    </div>    
    </form>
</body>
<script language="javascript">
function AddTable()
{
    var str1=GetSelectedItem(document.getElementById("lefttable"));
    var str2=GetSelectedItem(document.getElementById("leftfield"));
    var str3=GetSelectedItem(document.getElementById("rel"));
    var str4=GetSelectedItem(document.getElementById("righttable"));
    var str5=GetSelectedItem(document.getElementById("rightfield"));
    var str6=GetSelectedItem(document.getElementById("reltype")); 
    if(str1!=null&&str2!=null&&str3!=null&&str4!=null&&str5!=null&&str6!=null&&str1.Value!=""&&str2.Value!=""&&str3.Value!=""&&str4.Value!=""&&str5.Value!=""&&str6.Value!="")
    {    
        opener.window.AddTableRel(str1.Text,str2.Text,str3.Value,str4.Text,str5.Text,str6.Text,str1.Value,str4.Value,str6.Value,str2.Value,str5.Value);
    }
    else
    { 
        alert("请选择完整信息！");
    }
    window.close();
}

//获得select标签选定值 返回一个对象或null
function GetSelectedItem(obj)
{
    for(var i=0;i<obj.options.length;i++)
    {
        if(obj.options[i].selected)
        {
            var objselect = new Object();
            objselect.Value = obj.options[i].value;
            objselect.Text = obj.options[i].text;
            return objselect;
        }
    }
    return null;
}
</script>
</html>
