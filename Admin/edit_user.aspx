<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
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

            dtable = "gmis_user";
            filter = "usercode=" + id;
            flds = new string[] { "username", "userpassword", "deptcode", "userstate", "usertel", "useremail", "userdesc","usergroupcode" };
            mflds = new string[] { "�û���|username", "����|userpassword" };
            types = "00100000";

            if (!IsPostBack)
            {//�Ȱ��б�
                BindListControl(deptcode, "deptcode", "deptname", "select deptcode,deptname from gmis_dept");
                if (id != "0")
                {//������ֵ
                    guangye.BindData(dtable, filter, flds);
                    userpassword.Value = StringUtility.Base64ToString(userpassword.Value);
					db.SqlString="select usergroupcode,usergroupname from gmis_usergroup where usergroupcode in ("+usergroupcode.Value+")";
			        DataTable gdt=db.GetDataTable();                   
					string h_name="";
					foreach(DataRow idr in gdt.Rows)
					{
						h_name+=idr["usergroupname"].ToString()+",";
					}
					usergroupcode_txt.Value=h_name.Trim(',');
                }
                
            }
        }
        public override void BeforeSave()
        {
            //�����ʼ���ʽ��֤
            if(useremail.Value.Length > 0)
            {
                Regex rEmail = new Regex("^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$");
                Match mEmail = rEmail.Match(useremail.Value.ToString());
                if (!mEmail.Success)
                {
                    SetSESSION("alert", "�����ʼ���ʽ����");
                    Response.Redirect("execommand.aspx?mid=" + mid + "&pid=" + pid + "&id=" + id);
                }
            }
            
            userpassword.Value = StringUtility.StringToBase64(userpassword.Value);
            //��֤�Ƿ�������
            if (id == "0" && username.Value.Trim() != "")
            {
                SqlDB db = new SqlDB();
                db.SqlString = "select usercode from gmis_user where username='" + username.Value.Trim() + "'";
                if (db.GetDataTable().Rows.Count > 0)
                {
                    SetSESSION("alert", "���������û���");
                    Response.Redirect("execommand.aspx?mid=" + mid + "&pid=" + pid + "&id=" + id);
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
            <td style="width:100%"><div id="alert" runat="server"></div></td>
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--����-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr> 
        <td align="right"  class="td_viewcontent_title">�û�����</td>
        <td class="td_viewcontent_content">
        <input id="username" type="text" style="width:160px" maxlength="100" runat="server" /></td>
        <td align="right"  class="td_viewcontent_title">���룺</td>
        <td class="td_viewcontent_content">
        <input id="userpassword" type="text" style="width:160px" maxlength="100" runat="server" /></td>
    </tr>
    <tr> 
        <td align="right"  class="td_viewcontent_title">�������ţ�</td>
        <td class="td_viewcontent_content">
		<asp:DropDownList id="deptcode" style="width:160px" runat="server"/></td>
        <td align="right"  class="td_viewcontent_title">״̬��</td>
        <td class="td_viewcontent_content">
        <select id="userstate" style="width:160px" runat="server">
            <option>����</option>
            <option>����</option>
            <option>����</option>
        </select></td>
    </tr>
    <tr> 
        <td align="right"  class="td_viewcontent_title">�û���ɫ��</td>
        <td class="td_viewcontent_content" colspan="3">
        <table><tr><td><input id="usergroupcode" runat="server" type="hidden" /><input id="usergroupcode_txt" style="width:450px;" class="boxbline" type="text" runat="server" readonly/></td><td style="padding-left:5px;width:120px;"><G:Button ID="btn_selectfold" Type="toolbar" Mode="on" Url="javascript:__doOpenView('pop_user_select.aspx?slist='+base64encode(form1.usergroupcode.value),390,260,10,50)" runat="server" Text="ѡ���ɫ"></G:Button></td></tr></table></td>
    </tr>
    <tr> 
        <td align="right"  class="td_viewcontent_title">�绰��</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="usertel" type="text" style="width:450px" maxlength="200" runat="server"></td>
    </tr>
    <tr> 
        <td align="right"  class="td_viewcontent_title">�����ʼ���</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="useremail" type="text" style="width:450px" maxlength="200" runat="server"></td>
    </tr>
    <tr> 
        <td align="right"  class="td_viewcontent_title">��ע��</td>
        <td class="td_viewcontent_content" colspan="3">
        <textarea id="userdesc" rows="4" style="width:450px" runat="server"></textarea></td>
    </tr>
</table>         
</form>
</body>
</html>
