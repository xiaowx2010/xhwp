<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
	<script runat="server" language="C#">
		string ss = "";
		private void Page_Load(object sender, System.EventArgs e)
		{
			SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 
			
			dtable = "gmis_usergroup";
			filter = " usergroupcode="+id;
			flds = new string[]{"usergroupname","usergroupstate","usergroupdesc"};
			mflds = new string[]{"�û�����|usergroupname"};
			types = "000";
			
			if (!IsPostBack) {
				if(id != "0"){//������ֵ
					guangye.BindData(dtable,filter,flds);
				}else{
					ss = "none";
				}
			}
		}
		public override void BeforeSave(){
			if(usergroupname.Value.Trim() != ""){	
				string h_fstr=(id=="0")?"":" and usergroupcode<>"+id+"";							
				db.SqlString = "select usergroupcode from gmis_usergroup where usergroupname='"+usergroupname.Value.Trim()+"'"+h_fstr;
				if(db.GetDataTable().Rows.Count>0){
					SetSESSION("alert", "���������û��飡");
					Response.Redirect("execommand.aspx?mid="+mid+"");
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
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr> 
        <td class="td_viewcontent_title" align="right">�û���ɫ</td>
        <td class="td_viewcontent_content">
        <input id="usergroupname" type="text" style="width:160px" maxlength="100" runat="server" /></td>
        <td class="td_viewcontent_title" align="right">״̬</td>
        <td class="td_viewcontent_content">
        <select id="usergroupstate" style="width:160px" runat="server">
            <option>����</option>
            <option>����</option>
            <option>����</option>
        </select></td>
    </tr>
    <tr style="display:<%=ss%>"> 
        <td class="td_viewcontent_title" align="right">ģ��Ȩ��</td>
        <td class="td_viewcontent_content" colspan="3">
        <iframe style="width:100%;height:80px;background-color:#f2f2f2;" frameborder="0" scrolling="auto" src="checkmodule.aspx?gid=<%=id%>"></iframe></td>
    </tr>   
    <tr> 
        <td class="td_viewcontent_title" align="right">��ע</td>
        <td class="td_viewcontent_content" colspan="3">
        <textarea id="usergroupdesc" rows="4" style="width:523px" runat="server"></textarea></td>
    </tr>
</table>     
</form>
</body>
</html>
