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
			SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
			
			dtable = "gmis_Dept";
			filter = "DeptCode="+id;
			flds = new string[]{"DeptName"};
			mflds = new string[]{"��������|DeptName"};
			types = "0";
			
			if (!IsPostBack) {//�Ȱ��б�
				if(id != "0"){//������ֵ
					guangye.BindData(dtable,filter,flds);		
				}
				
			}
		}
		public override void BeforeSave(){
			if(id == "0" && deptname.Value.Trim() != ""){
				SqlDB db = new SqlDB();
				db.SqlString = "select * from gmis_dept where username='"+deptname.Value.Trim()+"'";
				if(db.GetDataTable().Rows.Count>0){
					SetSESSION("alert","�����������ţ�");
					Response.Redirect("execommand.aspx?mid="+mid+"&pid="+pid+"&id="+id);
				}
			}
		}
	</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--����-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr> 
        <td align="right" class="td_viewcontent_title">�������ƣ�</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="deptname" type="text" style="width:160px" maxlength="100" runat="server" /></td>
    </tr>
</table>         
</form>
</body>
</html>
