<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.Page" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="HtmlHead1" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->

<script runat="server" language="C#">
    private void Page_Load(object sender, System.EventArgs e)
    {

    }
    private void LogIn_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        string info_str = "";
        if (Request.Cookies["CheckCode"] == null)
        {
            info_str += "��������������ѱ����� Cookies���������������������ʹ�� Cookies ѡ������ʹ�ñ�ϵͳ��";

        }
        else if (System.String.Compare(Request.Cookies["CheckCode"].Value, checkcode.Value, true) != 0)
        {
            info_str += "��֤�������������ȷ����֤�롣";
        }

        if (uid.Value.Trim().Length == 0 || pwd.Value.Trim().Length == 0)
        {
            info_str += "�û��������벻��Ϊ�գ�";
        }
        if (info_str.Length == 0)
        {
            string LoginInfo = CheckLogin(uid.Value.Trim().Replace(" ", ""), pwd.Value.Trim().Replace(" ", ""));

            if (LoginInfo.Length > 1 && (LoginInfo[0] == '0' || LoginInfo[0] == '1' || LoginInfo[0] == '2'))
            {
                ClearSESSION();
                SetSESSION("uname", uid.Value);
                SetSESSION("SM", LoginInfo[0].ToString());
                SetSESSION("uid", LoginInfo.Substring(1));
                Session["screenwidth"] = screenwidth.Value;
                Session["screenheight"] = screenheight.Value;

                //�û���¼                    
                mid = GetFirstModule();
                if (mid == "")
                {
                    alert.InnerText = "����ʻ���δ����Ȩ�ޣ�����ϵ����Ա��";
                }
                else
                {
                    string p_denglujilu = "";//�޸ĵ�½����
                    string p_today = DateTime.Now.ToString();//����ʱ��
                    string p_username = GetSESSION("uname");//��½�û�
                    if (StringUtility.EscapeStr(p_username) == "--wcp12Z")//�û�GMIS
                    {
                        p_denglujilu = "declare @usermocode int;select @usermocode=0;";//��ΪGMIS�����ﶨ���û�����Ϊ0
                    }
                    else
                    {
                        p_denglujilu = "declare @usermocode int;select @usermocode=usercode from gmis_user where username='" + p_username + "';";
                    }
                    p_denglujilu += "if exists (select mocode from gmis_mo_1207 where fld_1207_1=@usermocode and DateDiff(day,fld_1207_2,'" + p_today + "')=0) begin update gmis_mo_1207 set fld_1207_3=fld_1207_3+1,fld_1207_2='" + p_today + "' where fld_1207_1=@usermocode and DateDiff(day,fld_1207_2,'" + p_today + "')=0 end else if exists (select mocode from gmis_mo_1207 where fld_1207_1=@usermocode) begin update gmis_mo_1207 set fld_1207_3=1,fld_1207_2='" + p_today + "' where fld_1207_1=@usermocode end else begin insert into gmis_mo_1207 (fld_1207_1,fld_1207_2,fld_1207_3) values (@usermocode,'" + p_today + "',1) end ";
                    string exeinfo = HtmlHead1.ExeBySql(p_denglujilu, 1);
                    //Response.Write(exeinfo);
                    if (exeinfo == "�����ɹ���")
                    {
                        //SetSESSION("MainUrl", "getpage.aspx?mid=" + mid + "&id=" + id + "&navindex=" + navindex);
                        SetSESSION("MainUrl", "Desktop.aspx");
                        Response.Redirect("default.aspx");
                    }
                }

            }
            else
                info_str=LoginInfo;
        }
        alert.InnerText = info_str;
    }
</script>

<script language="javascript">
	<!--
			function GetScreen()
			{
			    document.all.screenwidth.value = window.screen.width;
				document.all.screenheight.value =  window.screen.height;	
								
			}
			function KeySave(){			    
				if(event.keyCode == 13)
				{		
				    __doPostBack('btn_login','');
				    return;
				}
			}
	//-->
</script>

<body ms_positioning="GridLayout" onload="GetScreen();" onkeypress="KeySave();" bgcolor="#E2E2E2">
    <form id="form1" runat="server">
    <input id="screenwidth" type="hidden" runat="server" />
    <input id="screenheight" type="hidden" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%" height="100%">
        <tr valign="middle" align="center">
            <td style="text-align: center">
                <div class="welcome" align="left">
                    <div style="margin-left: 300px; margin-top: 240px;">
                        <table cellpadding="4" cellspacing="0">
                            <tr>
                                <td nowrap>
                                   �û���&nbsp;&nbsp;<input id="uid" type="text" style="width: 130px;" runat="server">
                                </td>
                            </tr>
                            <tr>
                                <td nowrap>
                                   ��&nbsp;&nbsp;��&nbsp;&nbsp;<input id="pwd" type="password" style="width: 130px;" runat="server">
                                </td>
                            </tr>
                            <tr>
                                <td nowrap>
                                    ��֤��&nbsp;&nbsp;<input id="checkcode" type="text" style="width: 80px;" runat="server">&nbsp;<img src="common/checkcode.aspx"
                                        align="absmiddle">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="left" style="padding-left: 54px">
                                    <input id="login" type="image" src="images/login.gif" onserverclick="LogIn_Click"
                                        runat="server">
                                </td>
                            </tr>
                        </table>
                        <span id="alert" style="margin-left: 10px; overflow: hidden; color: red; width: 200px;"
                            runat="server"></span>
                    </div>
                    </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
