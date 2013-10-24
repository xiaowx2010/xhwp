<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"  Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender,System.EventArgs e)
{
    pid=Request.QueryString["pid"];
    pid = pid.ToString().Trim(',');
    if (!IsPostBack)
    {
        BindControlData(opration);
        BindListControl(fieldname,"fieldname","caption","select fieldname,caption from gmis_field where caption not like '%预留%' and modulecode in("+pid+")");
    }  
}
/*
* 函数:BindControlData()
* 功能：绑定操作符的值
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
 <table width="100%"  border="0" cellpadding="3" cellspacing="1" bgcolor="#999999" class="table_graybgcolor" style="margin-top:5px; ">
          <tr>
            <td width="12%" align="right"  class="td01_viewcontent_title" style="padding-right:5px; ">字段名</td>
            <td width="38%" align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><asp:DropDownList ID="fieldname" runat="server" style="width:90%"></asp:DropDownList></td>
            <td width="12%" align="right" bgcolor="#FFFFFF"  class="td01_viewcontent_title" style="padding-right:5px; "> 操作符</td>
            <td width="38%" align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><asp:DropDownList ID="opration" runat="server" style="width:90%"></asp:DropDownList></td>
          </tr>
          <tr>
            <td align="right"  class="td01_viewcontent_title">值</td>
            <td align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><input type="text" id="keyword" name="textfield" style="width:90%;"></td>
            <td width="10%" align="right" bgcolor="#FFFFFF"  class="td01_viewcontent_title"> 与上一条件关系 </td>
            <td align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="35%"><input type="radio" id="and" name="radiobutton" value="radiobutton">
                  并且 
                  <input type="radio" name="radiobutton" id="or" value="radiobutton">
                  或者</td>
                <td width="65%" align="left"><%--<img src="images/gjcx_020.gif" width="58" height="22">--%><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--添加条件-->
								  <G:Button id="btn_s_add3" type="toolbar" mode="on" icon="" text="添加" Url="javascript:AddCondition();"   runat=server></G:Button>
								  <!--添加条件-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--取消条件-->
								  <G:Button id="btn_s_cancel3" type="toolbar" mode="on" icon="" text="取消"  url="javascript:CancelCondition()" runat=server></G:Button>
								  <!--取消条件-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--取消条件-->
								  <G:Button id="btn_s_clear3" type="toolbar" mode="on" icon="" text="清空"  url="javascript:ClearCondition()" runat=server></G:Button>
								  <!--取消条件-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td><td id="alertinfo" style="color:Red"></td>
                          </tr>
                        </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td align="right" valign="middle"  class="td01_viewcontent_title">查询条件汇总</td>
            <td colspan="3" align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; padding-right:20px;"><textarea id="s_txt" name="textarea" style="width:98%; height:100px;"></textarea></td>
          </tr>
        </table>
        </form>
</body>
<script language="javascript">
function AddCondition()
{
    parent.window.AddCondition();
}
function CancelCondition()
{
    parent.window.CancelCondition();
}
function ClearCondition()
{
    parent.window.ClearCondition();
}
</script>
</html>