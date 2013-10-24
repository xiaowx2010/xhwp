<%@ Page Language="c#" debug=true Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
	<script runat="server" language="C#">
		string[] bflds;
		DataTable mdt;
		private void Page_Load(object sender, System.EventArgs e)
		{
            usergroupcode.Value = GetQueryString("gid", "0"); 
			dtable = "gmis_moduleright";
            flds = new string[] { "usergroupcode", "modulecode", "rightcontent" };
			bflds= new string[]{"rightcontent"};
			types = "110";
			if (!IsPostBack) {//先绑定列表
				BindListControl(moduleuppercode,"modulecode","modulename","select modulecode,modulename from gmis_module where modulelevel=1 and modulestate=0");
				if(moduleuppercode.SelectedItem!=null)
				{
					BindListControl(modulecode,"modulecode","modulename","select modulecode,modulename from gmis_module where  modulestate=0 and moduleindex like '%'+(select moduleindex from gmis_module where modulecode="+moduleuppercode.SelectedItem.Value+")+'%' and modulename not in ('模块','操作','字段管理')");
                   			
				}
				string sfield = (modulecode.SelectedItem!=null)?modulecode.SelectedItem.Value:"0";
				filter = " usergroupcode="+usergroupcode.Value+" And modulecode="+sfield;
				SelectUsedAction();
				if(usergroupcode.Value != "0"){
					modulecode.AutoPostBack = true;
                    guangye.BindData(dtable, filter, bflds);
				}else{
					modulecode.AutoPostBack = false;
					btn_save.Visible = false;
				}
			}
		}
		private string GetMatchPK(){
			SqlDB db = new SqlDB();
			db.SqlString = "select modulerightcode from "+dtable+" where "+filter;
			if(db.GetDataTable().Rows.Count > 0){
				return "1";
			}else{
				return "0";
			}
		}
		private void SelectUsedAction(){			
            if (modulecode.SelectedItem!=null)
			db.SqlString = "select modulecode,useactions from gmis_module where modulecode="+modulecode.SelectedItem.Value;
			DataTable mdt = db.GetDataTable();
			if(mdt.Rows.Count>0){
				BindListControl(rightcontent,"actioncode","actionname","select actioncode,actionname from gmis_action where ';"+mdt.Rows[0]["useactions"].ToString()+";' like '%;'+CAST(actioncode AS varchar(20))+';%'");
			}
		}
		private void Index_Changed(object sender, System.EventArgs e){
			if(usergroupcode.Value != "0"){
				string sfield = (modulecode.SelectedItem!=null)?modulecode.SelectedItem.Value:"0";
				filter = " usergroupcode="+usergroupcode.Value+" And modulecode="+sfield;
				SelectUsedAction();
				if(usergroupcode.Value != "0"){
                    guangye.BindData(dtable, filter, bflds);
				}
			}
		}
		private void Save_Click(object sender, System.EventArgs e){
			string sfield = (modulecode.SelectedItem!=null)?modulecode.SelectedItem.Value:"0";
			filter = " usergroupcode="+usergroupcode.Value+" And modulecode="+sfield;
			if(GetMatchPK() == "0"){
                alert.InnerText = guangye.InsertData(dtable, flds, types);
			}else{
                alert.InnerText = guangye.UpdateData(dtable, filter, flds, types);
			}
		}
		private void Upper_Changed(object sender, System.EventArgs e){
			modulecode.Items.Clear();
			if(moduleuppercode.SelectedItem!=null)
			{
				BindListControl(modulecode,"modulecode","modulename","select modulecode,modulename from gmis_module where  modulestate=0 and moduleindex like '%'+(select moduleindex from gmis_module where modulecode="+moduleuppercode.SelectedItem.Value+")+'%' and modulename not in ('模块','操作','字段管理')");
				string sfield = (modulecode.SelectedItem!=null)?modulecode.SelectedItem.Value:"0";
				filter = " usergroupcode="+usergroupcode.Value+" And modulecode="+sfield;
				SelectUsedAction();
				if(modulecode.SelectedItem!=null && usergroupcode.Value != "0" && rightcontent.Items.Count>0){
                    guangye.BindData(dtable, filter, bflds);
				}
			}
		}
	</script>
	
<body border="0" style="margin:0px;padding:0px;background-color:#f2f2f2;">
<form id="form1" runat="server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td><img src="images/spacer.gif" width="0" height="1"><input id="usergroupcode" type="hidden" runat="server" /></td>
         <td>
			<asp:DropDownList id="moduleuppercode" style="width:160px" OnSelectedIndexChanged="Upper_Changed" autopostback=true runat="server"/>
		</td>
        <td>
			<asp:DropDownList id="modulecode" style="width:160px" OnSelectedIndexChanged="Index_Changed" runat="server"/>
		</td>
        <td width="100" align=right>
			<G:Button id="btn_save" type="toolbar" mode="on" text="保 存" onclick="Save_Click" runat="server"></G:Button>		
		</td>
		<td width="200"><div id="alert" style="padding-left:5px;color:red" runat="server"></div></td>
    </tr>
    <tr>
        <td colspan="5">
			<asp:CheckBoxList id="rightcontent" RepeatDirection="Horizontal" RepeatColumns="8" runat="server"/></td>
    </tr>
</table>
</form>
</body>
</html>