<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat="server" language="C#">
private void Page_Load(object sender, System.EventArgs e)
{
	string username = GetSESSION("uname");//��ǰ��½���û���
	string logintimes;
	if (StringUtility.EscapeStr(username) == "--wcp12Z")//���û�ΪGMIS�����ﶨ���û�����Ϊ0
    {
        logintimes = GetFieldData("select fld_1207_3 from gmis_mo_1207 where fld_1207_1=0");
    }
    else
    {
        logintimes = GetFieldData("select fld_1207_3 from gmis_mo_1207 where fld_1207_1 in (select usercode from gmis_user where username='" + GetSESSION("uname") + "')");
    }    
	Response.Write("<base>");
	Response.Write("<i n=\"��ӭ"+GetSESSION("uname")+"�������ֻ�����Ϣ����ϵͳ���������ǵ�"+logintimes+"�ε�½��ϵͳ\" u=\"\"/>");
	Response.Write("</base>");
    
}
</script>