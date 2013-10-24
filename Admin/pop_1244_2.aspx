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
    mid=Request.QueryString["mid"];//��Ŀ��
    mid=mid.Trim(',');
    if(!IsPostBack)
    {
        BindListControl(lefttable,"modulecode","modulename","select modulecode,modulename from gmis_module where (modulelevel=4 and modulecode>657 and modulecode<1028 or  modulecode in(1093,683,828,907,1018,1021)) and modulecode in ("+mid+")","��ѡ�����");
        BindListControl(righttable,"modulecode","modulename","select modulecode,modulename from gmis_module where (modulelevel=4 and modulecode>657 and modulecode<1028 or modulecode in(1093,683,828,907,1018,1021)) and modulecode in("+mid+")","��ѡ���ұ�");
        SetFilter(lefttable,"0");
        SetFilter(righttable,"0");
        BindControlData(rel);
        if(id!="0")
        {
            if(lefttable.SelectedItem!=null&&lefttable.SelectedItem.Value!="0")
            {
                BindListControl(leftfield,"fieldname","caption","select filedname,caption from gmis_field where caption not like '%Ԥ��%'and modulecode="+lefttable.SelectedItem.Value);
                SetFilter(leftfield,"fld_"+lefttable.SelectedItem.Value+"_1");
            }
            if(righttable.SelectedItem!=null&&righttable.SelectedItem.Value!="0")
            {
                BindListControl(rightfield,"fieldname","caption","select filedname,caption from gmis_field where caption not like '%Ԥ��%'and modulecode="+righttable.SelectedItem.Value);
                SetFilter(rightfield,"fld_"+righttable.SelectedItem.Value+"_1");
            }
        }
    }   
 }
 /*
 *������ChangeTable(object sender,System.EventArgs e)
 ���ã��л�������ʱ���󶨶�Ӧ��������
 ������/���ڣ�YJ/2009��8��12��
 */
 private void ChangeTable(object sender,System.EventArgs e)
 {
    if(lefttable.SelectedItem!=null&&lefttable.SelectedItem.Value!="0")
    {
        BindListControl(leftfield,"fieldname","caption","select fieldname,caption from gmis_field where caption not like '%Ԥ��%'and modulecode="+lefttable.SelectedItem.Value);
        SetFilter(leftfield,"fld_"+lefttable.SelectedItem.Value+"_1");
    }
    if(righttable.SelectedItem!=null&&righttable.SelectedItem.Value!="0")
    {
        BindListControl(rightfield,"fieldname","caption","select fieldname,caption from gmis_field where caption not like '%Ԥ��%'and modulecode="+righttable.SelectedItem.Value);
         SetFilter(rightfield,"fld_"+righttable.SelectedItem.Value+"_1");
    }
 }
 /*
 * ����:BindControlData()
 * ���ܣ��󶨲�������ֵ
 ������/���ڣ�YJ/2009��8��10��
 */
private void BindControlData(ListControl _c)
{
    _c.Items.Add(new ListItem("����", "="));
    _c.Items.Add(new ListItem("����", ">"));
    _c.Items.Add(new ListItem("���ڵ���", ">="));
   _c.Items.Add(new ListItem("С��", "&#60"));
   _c.Items.Add(new ListItem("С�ڵ���", "<="));
   _c.Items.Add(new ListItem("������", "like"));
}
</script>

<body>
    <form id="form1" runat="server">
    <!--����������-->
        <!--#include file="toolbarleft.aspx"-->
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbar.aspx"-->
        <td>
        <img src="images/gjcx_030.gif" width="55" height="22" border="0" style="cursor:hand" onclick="javascript:AddTable()"/>
        </td>
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbarright.aspx"-->
        <!--����������-->
    <div  style="height:550px; overflow-y:auto;padding-left:10px; padding-top:20px">
    <table border="0" align="center"  width="520px" cellpadding="3" cellspacing="1"  class="table_graybgcolor">
      <tr>
        <td style="padding-top:5px" width="100" align="center" class="td_viewcontent_title">������ƣ�</td><td class="td_viewcontent_content" ><asp:DropDownList ID="lefttable" runat="server" style="width:95%" OnSelectedIndexChanged="ChangeTable" AutoPostBack="true"></asp:DropDownList></td>
      </tr>
      <tr>
        <td style="padding-top:5px" align="center" class="td_viewcontent_title">����ֶΣ�</td><td class="td_viewcontent_content"><asp:DropDownList ID="leftfield"  style="width:95%" runat="server"></asp:DropDownList></td>
      </tr>
      <tr>
      <td  style="padding-top:5px" align="center" class="td_viewcontent_title">������ϵ��</td><td class="td_viewcontent_content"><asp:DropDownList ID="rel"  style="width:95%"  runat="server"></asp:DropDownList></td>
      </tr>
      <tr>
      <td style="padding-top:5px" align="center" class="td_viewcontent_title">�ұ����ƣ�</td><td class="td_viewcontent_content"><asp:DropDownList ID="righttable" runat="server" style="width:95%"    OnSelectedIndexChanged="ChangeTable" AutoPostBack="true" ></asp:DropDownList></td>
      </tr>
      <tr>
        <td style="padding-top:5px" align="center" class="td_viewcontent_title">�ұ��ֶΣ�</td><td class="td_viewcontent_content"><asp:DropDownList ID="rightfield" style="width:95%"   runat="server"></asp:DropDownList></td>
      </tr>
       <tr>
        <td style="padding-top:5px" align="center" class="td_viewcontent_title">�������ͣ�</td><td class="td_viewcontent_content"><asp:DropDownList ID="reltype" style="width:95%"   runat="server"><asp:ListItem Value="0">������</asp:ListItem><asp:ListItem Value="1">��������</asp:ListItem><asp:ListItem Value="2">��������</asp:ListItem></asp:DropDownList></td>
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
        alert("��ѡ��������Ϣ��");
    }
    window.close();
}

//���select��ǩѡ��ֵ ����һ�������null
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
