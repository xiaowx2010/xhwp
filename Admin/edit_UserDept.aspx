<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" debug="true"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
	<script runat="server" language="C#">
		private void Page_Load(object sender, System.EventArgs e)
		{
			SetToolBar();//设置工具条,同时获取固定URL参数
			
			dtable = "gmis_Dept";
			filter = "DeptCode="+id;
			flds = new string[]{"DeptName"};
			mflds = new string[]{"部门名称|DeptName"};
			types = "0";
			
			if (!IsPostBack) {//先绑定列表
				if(id != "0"){//绑定所有值
					guangye.BindData(dtable,filter,flds);		
				}
				
			}
		}
		public override void BeforeSave(){
			if(id == "0" && deptname.Value.Trim() != ""){
				SqlDB db = new SqlDB();
				db.SqlString = "select * from gmis_dept where username='"+deptname.Value.Trim()+"'";
				if(db.GetDataTable().Rows.Count>0){
					SetSESSION("alert","已有重名部门！");
					Response.Redirect("execommand.aspx?mid="+mid+"&pid="+pid+"&id="+id);
				}
			}
		}
	</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--内容-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr> 
        <td align="right" class="td_viewcontent_title">部门名称：</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="deptname" type="text" style="width:160px" maxlength="100" runat="server" /></td>
    </tr>
</table>         
</form>
</body>
</html>
