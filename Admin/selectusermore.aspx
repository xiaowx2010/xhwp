<!-- ѡ���û� [��������] -->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
	<script runat=server language=C#>
    string uidstr = "", p_fstr = "";
	private void Page_Load(object sender, System.EventArgs e)
	{
        uidstr = GetQueryString("uidstr", "");
        uidstr.Replace(';', ',');
        uidstr=uidstr.ToString().Trim(',');
        
        if (!IsPostBack)
        {
            BindListControl(usergroupcode, "UserGroupcode","UserGroupName","select UserGroupcode,UserGroupName from gmis_UserGroup where UserGroupState='����'","������Ա");
            SetFilter(usergroupcode,"0");
            if (uidstr.Trim(',') != "")
            {
                p_fstr = " and usercode not in (" + uidstr.Trim(',') + ")";
                BindListControl(oSelect, "usercode", "username", "select usercode,username from gmis_user where  UserState='����' and usercode in (" + uidstr.Trim(',') + ") order by username");
                BindOselectedUser();
            }

            BindListControl(selectuser, "usercode", "username", "select usercode,username from gmis_user where  UserState='����' " + p_fstr + " order by username");
            //typestate.Value = type;	
        }
	}

        private void Change_group(object sender, System.EventArgs e)
    {
        selectuser.Items.Clear();
        BindOselectedUser();
        if (usergroupcode.SelectedItem != null && usergroupcode.SelectedItem.Value != "0")
        {
            BindListControl(oSelect, "usercode", "username", "select usercode,username from gmis_user where UserState='����' and usercode not in (" + oselectpycode.Value + "0) and usergroupcode=" + usergroupcode.SelectedItem.Value);
        }
        else
        {
            BindListControl(oSelect, "usercode", "username", "select usercode,username from gmis_user where UserState='����' and usercode not in (" + oselectpycode.Value + "0) ");
        }
    }

	 //��ѡ���û�   
    private void BindOselectedUser()
    {
        string pycodestr = "", pytxtstr = "";
        for (int i = 0; i < oSelect.Items.Count; i++)
        {
            pycodestr += oSelect.Items[i].Value + ";";
            pytxtstr += oSelect.Items[i].Text + ",";

        }
        oselectpycode.Value = pycodestr;
        oselectpytxt.Value = pytxtstr.Trim(',');
    }

	//��ӵ���   
    private void Add_Select(object sender, System.EventArgs e)
    {
        for (int i = 0; i < selectuser.Items.Count; i++)
        {
            if (selectuser.Items[i].Selected == true)
            {
                //��ѡ��
                oSelect.Items.Add(new ListItem(selectuser.SelectedItem.Text, selectuser.SelectedValue));
                //δѡ��
                selectuser.Items.Remove(new ListItem(selectuser.SelectedItem.Text, selectuser.SelectedValue));
                BindOselectedUser();
                break;
            }
        }

    }   
    //�������
    private void Add_AllSelect(object sender, System.EventArgs e)
    {
        ////��δѡ���б������ѡ���б�
        for (int i = 0; i < selectuser.Items.Count; i++)
        {
            oSelect.Items.Add(new ListItem(selectuser.Items[i].Text, selectuser.Items[i].Value));
        }
        //�Ƴ�
        for (int i = 0; i < oSelect.Items.Count; i++)
        {
            selectuser.Items.Remove(new ListItem(oSelect.Items[i].Text, oSelect.Items[i].Value));
        }
        BindOselectedUser();

    }
    //�Ƴ�����
    private void Remove_Select(object sender, System.EventArgs e)
    {
        for (int i = 0; i < oSelect.Items.Count; i++)
        {
            if (oSelect.Items[i].Selected == true)
            {
                selectuser.Items.Add(new ListItem(oSelect.SelectedItem.Text, oSelect.SelectedValue));
                oSelect.Items.Remove(new ListItem(oSelect.SelectedItem.Text, oSelect.SelectedValue));
                BindOselectedUser();
                break;
            }
        }


    }
    //�Ƴ�����
    private void Remove_AllSelect(object sender, System.EventArgs e)
    {
        //����ѡ���б��Ƶ�δѡ���б�
        for (int i = 0; i < oSelect.Items.Count; i++)
        {
            selectuser.Items.Add(new ListItem(oSelect.Items[i].Text, oSelect.Items[i].Value));
        }
        //�Ƴ���ѡ�����
        for (int i = 0; i < selectuser.Items.Count; i++)
        {

            oSelect.Items.Remove(new ListItem(selectuser.Items[i].Text, selectuser.Items[i].Value));
        }
        BindOselectedUser();

    }             
	</script>
	
	<body bgcolor="#E2E2E2" leftmargin="0" topmargin="0">
		<form id="form1" runat="server">
		    <input id="oselectpycode" type="hidden" runat="server">
		    <input id="oselectpytxt" type="hidden" runat="server">
		    <input id="typestate" type="hidden" runat="server">
			<table align="center">
				<tr>
					<td>
						<table>
							<tr>
								<td>
								    <asp:DropDownList ID="usergroupcode" Width="130px" runat="server" OnSelectedIndexChanged="Change_group" AutoPostBack="true"></asp:DropDownList>
							    </td>									 
							</tr>
							<tr>
								<td>		
								    <asp:ListBox ID="selectuser" runat="server" Width="130"  Height="200"></asp:ListBox>
								</td>
							</tr>
						</table>
						
					</td>
					<td>
						<table>
							<tr>
                                <td align="center">
                                    <asp:LinkButton ID="btn_right1" OnClick="Add_Select" runat="server"><img src="images/but_right1.gif" style="cursor:hand;" value=">" title="�������" border=0></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:LinkButton ID="btn_right2" OnClick="Add_AllSelect" runat="server"><img src="images/but_right2.gif" style="cursor:hand;" value=">>" title="�������" border=0></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:LinkButton ID="btn_left1" OnClick="Remove_Select" runat="server"><img src="images/but_left1.gif" style="cursor:hand;" value=">" title="�����Ƴ�" border=0></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:LinkButton ID="btn_left2" OnClick="Remove_AllSelect" runat="server"><img src="images/but_left2.gif" style="cursor:hand;" value=">>" title="�Ƴ�����" border=0></asp:LinkButton>
                                </td>
                            </tr>
							<tr>
								<td><img src="images/but_submit.gif" value="ȷ��" onclick="javascript:SaveSelected();" style="cursor:hand;">
								</td>
							</tr>
						</table>
					</td>
					<td><table>
							<tr>
								<td>��ѡ���û�</td>
							</tr>
							<tr>
								<td><asp:ListBox ID="oSelect" runat="server" Width="150"  Height="200"></asp:ListBox></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<script language="javascript">
            <!--
                function SaveSelected(){
                opener.form1.fld_13_2_text.value=window.form1.oselectpytxt.value;
		        opener.form1.voteitemcount.value=window.form1.oselectpycode.value;
                
                window.close();
                }
            -->
			</script>
		</form>
	</body>
</html>
