<!-- �ڲ��ʼ����û�ѡ�� [��������] -->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
	<script runat=server language=C#>
	string p_fstr="";
	private void Page_Load(object sender, System.EventArgs e)
	{
        string uidstr = GetQueryString("uidstr",""); 
        string type = GetQueryString("type","0");
        if (!IsPostBack)
        {
            BindListControl(selecttype, "usergroupcode", "usergroupname", "select usergroupcode,usergroupname from gmis_usergroup where  UsergroupState='����' ", "--�����û�--");
            SetFilter(selecttype, "0");
            if(uidstr.Trim(',')!="")
            {
				p_fstr=" and usercode not in ("+uidstr.Trim(',')+")";
				BindListControl(oselectuser, "usercode", "username", "select usercode,username from gmis_user where  UserState='����' and usercode in ("+uidstr.Trim(',')+") order by username");
				BindOselectedUser();
			}
			
			BindListControl(selectuser, "usercode", "username", "select usercode,username from gmis_user where  UserState='����' "+p_fstr+" order by username");
		    typestate.Value=type;			
        }
	        
			
		}
        private void Change_Type(object sender, System.EventArgs e)
        {
            selectuser.Items.Clear();
            BindOselectedUser();
            if (selecttype.SelectedItem != null && selecttype.SelectedItem.Value != "0")
            {
                
                BindListControl(selectuser, "usercode", "username", "select usercode,username from gmis_user where UserState='����' and usercode not in (" + oselectpycode.Value + "0) and usergroupcode=" + selecttype.SelectedItem.Value);
            }
            else
            {
                BindListControl(selectuser, "usercode", "username", "select usercode,username from gmis_user where UserState='����' and usercode not in (" + oselectpycode.Value + "0) " );
            }           
        }
  
        private void Add_Select(object sender, System.EventArgs e)
        {
            for (int i = 0; i < selectuser.Items.Count; i++)
            {
                if(selectuser.Items[i].Selected == true)
                {
                    //��ѡ��
                    oselectuser.Items.Add(new ListItem(selectuser.SelectedItem.Text, selectuser.SelectedValue));
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
			for(int i=0;i<selectuser.Items.Count;i++)
			{
				oselectuser.Items.Add(new ListItem(selectuser.Items[i].Text,selectuser.Items[i].Value));
			}	
            //�Ƴ�
			for(int i=0;i<oselectuser.Items.Count;i++)
			{
				selectuser.Items.Remove(new ListItem(oselectuser.Items[i].Text,oselectuser.Items[i].Value));
            }	 
			BindOselectedUser();
          
        }
	    //�Ƴ�����
        private void Remove_Select(object sender, System.EventArgs e)
        {
            for (int i = 0; i < oselectuser.Items.Count; i++)
            {
                if (oselectuser.Items[i].Selected == true)
                { 
                    selectuser.Items.Add(new ListItem(oselectuser.SelectedItem.Text, oselectuser.SelectedValue));
                    oselectuser.Items.Remove(new ListItem(oselectuser.SelectedItem.Text, oselectuser.SelectedValue));            
			        BindOselectedUser();
                    break;
                }
            }
                
         
        }
	    //�Ƴ�����
         private void Remove_AllSelect(object sender, System.EventArgs e)
        {
			//����ѡ���б��Ƶ�δѡ���б�
			for(int i=0;i<oselectuser.Items.Count;i++)
			{
				selectuser.Items.Add(new ListItem(oselectuser.Items[i].Text,oselectuser.Items[i].Value));
			}	
            //�Ƴ���ѡ�����
			for(int i=0;i<selectuser.Items.Count;i++)
			{
				
				oselectuser.Items.Remove(new ListItem(selectuser.Items[i].Text,selectuser.Items[i].Value));
			}	 
			BindOselectedUser();
          
        }
        private void BindOselectedUser()
        {                  
            string pycodestr = "",pytxtstr="";
            for (int i = 0; i < oselectuser.Items.Count; i++)
            {
                pycodestr += oselectuser.Items[i].Value + ",";
                pytxtstr += oselectuser.Items[i].Text + ",";

            }
            oselectpycode.Value = pycodestr;
            oselectpytxt.Value = pytxtstr.Trim(',');
        }         	
	</script>
	
	<body bgcolor="#E2E2E2" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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
								<asp:DropDownList ID="selecttype" OnSelectedIndexChanged="Change_Type"  Width="150" runat="server" AutoPostBack="true"></asp:DropDownList>
								</td>									 
							</tr>
							<tr>
								<td>								
									<asp:ListBox ID="selectuser" runat="server" Width="150"  Height="200"></asp:ListBox>								
								</td>
							</tr>
						</table>
						
					</td>
					<td>
						<table>	
														<tr>
							<td align="center">
								<asp:LinkButton id="btn_right1" onclick="Add_Select" runat="server"><img src="images/but_right1.gif" style="cursor:hand;" value=">" title="�������" border=0></asp:LinkButton>
							</td>
							</tr>	
							<tr>
							<td align="center">
								<asp:LinkButton id="btn_right2" onclick="Add_AllSelect" runat="server"><img src="images/but_right2.gif" style="cursor:hand;" value=">>" title="�������" border=0></asp:LinkButton>
							</td>
							</tr>
							<tr>
							<td align="center">
								<asp:LinkButton id="btn_left1" onclick="Remove_Select" runat="server"><img src="images/but_left1.gif" style="cursor:hand;" value=">" title="�����Ƴ�" border=0></asp:LinkButton>
							</td>
							</tr>	
							<tr>
							<td align="center">
								<asp:LinkButton id="btn_left2" onclick="Remove_AllSelect" runat="server"><img src="images/but_left2.gif" style="cursor:hand;" value=">>" title="�Ƴ�����" border=0></asp:LinkButton>
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
								<td>��ѡ����</td>
							</tr>
							<tr>
								<td><asp:ListBox ID="oselectuser" runat="server" Width="150"  Height="200"></asp:ListBox></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<script language="javascript">
<!--

function SaveSelected()
{
	
	if(window.form1.typestate.value=="1")
	{
		
		opener.form1.fld_28_2_text.value=window.form1.oselectpytxt.value;
		opener.form1.fld_28_2.value=window.form1.oselectpycode.value;
	}

	if(window.form1.typestate.value=="2")
	{
		opener.form1.fld_28_3_text.value=window.form1.oselectpytxt.value;
		opener.form1.fld_28_3.value=window.form1.oselectpycode.value;
	}
	if(window.form1.typestate.value=="3")
	{
		opener.form1.fld_28_4_text.value=window.form1.oselectpytxt.value;
		opener.form1.fld_28_4.value=window.form1.oselectpycode.value;
	}
	window.close();
	//alert(window.form1.oselectpytxt.value+"    "+window.form1.oselectpycode.value);
}

-->
			</script>
		</form>
	</body>
</html>