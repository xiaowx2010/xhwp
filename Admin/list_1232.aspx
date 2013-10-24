<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" DEBUG=TRUE%>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">

    <script type="text/javascript">
        
    </script>

</head>
<!--#include file="func.aspx"-->
<!--#include file="func/func_1232.aspx"-->
<script runat="server" language="C#">
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  

	dtable = "gmis_mo_1232";
    flds = new string[] { "fld_1232_1", "fld_1232_2", "fld_1232_3", "fld_1232_4", "fld_1232_5", "fld_1232_6", "fld_1232_7"};
    types = "0000100";	
	
	if (!IsPostBack)
	{
		//��ѯģ��
		BindListControl(edition, "mocode", "fld_1232_1", "select mocode,fld_1232_1 from gmis_mo_1232 order by mocode", "��ģ��");
		SetFilter(edition, "0");

		//��Ŀģ��
		DataTable h_mdt = db.GetDataTable(db.ConnStr,"select modulecode,(REPLICATE('��',modulelevel-2)+modulename) as modulename from gmis_module where moduleindex like '%'+(select moduleindex from gmis_module where modulecode=40)+'%' and modulestate=0 and exists (SELECT 1 FROM sysobjects WHERE xtype = 'U' AND OBJECTPROPERTY (id, 'IsMSShipped') = 0 and id=object_id ('gmis_mo_'+Cast(modulecode as varchar(50)))) order by moduleindex");
		BindListControl(module, "modulecode", "modulename", h_mdt);
		if (h_mdt.Rows.Count>0)
		{
			SetFilter(module, h_mdt.Rows[0][0].ToString());

			//�ֶ���������������
			DataTable h_fdt = db.GetDataTable(db.ConnStr,"select caption,fieldcode,fieldname from gmis_field where isvital=0 and fieldstatus=0 and modulecode="+guangye.GetControlValue(module)+" order by fieldindex");
			BindListControl(s_field, "fieldcode", "caption", h_fdt);
			BindListControl(i_field, "fieldname", "caption", h_fdt);
			if (h_fdt.Rows.Count>0)
			{
				SetFilter(s_field, h_fdt.Rows[0][1].ToString());
				SetFilter(i_field, h_fdt.Rows[0][2].ToString());
			}
			GetDefaultField();//Ĭ����ʾ�ֶ�
		}
	} 
}
//Ĭ����ʾ�ֶ�
private void GetDefaultField()
{
	if (guangye.GetControlValue(module) != "")
	{
		string h_field = "";
		//�ֶ���
		DataTable h_fdt = db.GetDataTable(db.ConnStr,"select fieldname from gmis_field where fieldstatus=0 and modulecode="+guangye.GetControlValue(module)+" and oneditlist=1 order by fieldindex");
		foreach (DataRow dr in h_fdt.Rows)
		{
			h_field += dr["fieldname"].ToString()+",100|";
		}
		h_field = h_field.Trim('|');
		guangye.SetControlValue(fld_1232_4,h_field);
	}
	
}
//ģ��ɸѡ
private void Change_Module(object sender, System.EventArgs e)
{
	//�ֶ���������������
	DataTable h_fdt = db.GetDataTable(db.ConnStr,"select caption,fieldcode,fieldname from gmis_field where isvital=0 and modulecode="+guangye.GetControlValue(module)+" order by fieldindex");
	BindListControl(s_field, "fieldcode", "caption", h_fdt);
	BindListControl(i_field, "fieldname", "caption", h_fdt);
	if (h_fdt.Rows.Count>0)
	{
		SetFilter(s_field, h_fdt.Rows[0][1].ToString());
		SetFilter(i_field, h_fdt.Rows[0][2].ToString());
	}
	GetDefaultField();//Ĭ����ʾ�ֶ�
}

/***************************************************************
��������Click_LoadEdition()
��;����ȡģ��
�����/����:������  2009-6-19
***************************************************************/
private void Click_LoadEdition(object sender, System.EventArgs e)
{	
	if (guangye.GetControlValue(edition) != "0")
	{		
		string h_modulecode =  GetOneFieldValue("select fld_1232_5 from gmis_mo_1232 where mocode = "+guangye.GetControlValue(edition));//ģ��ID
		if (h_modulecode != "")
		{
			SetFilter(module, h_modulecode);
			//�ֶ���������������
			DataTable h_fdt = db.GetDataTable(db.ConnStr,"select caption,fieldcode,fieldname from gmis_field where isvital=0 and fieldstatus=0 and modulecode="+guangye.GetControlValue(module)+" order by fieldindex");
			BindListControl(s_field, "fieldcode", "caption", h_fdt);
			BindListControl(i_field, "fieldname", "caption", h_fdt);
			if (h_fdt.Rows.Count>0)
			{
				SetFilter(s_field, h_fdt.Rows[0][1].ToString());
				SetFilter(i_field, h_fdt.Rows[0][2].ToString());
			}
		}
		
		filter = " mocode=" + guangye.GetControlValue(edition);

		guangye.BindData(dtable, filter, flds);//������

		BindEdition();	
	} 
	else
	{
		Response.Redirect("list_1232.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&navindex=" + navindex + "");
	}
}
/***************************************************************
��������BindEdition()
��;����ģ��
�����/����:������  2009-6-19
***************************************************************/
private void BindEdition()
{
	//���������뵽��ʾ����
    s_fstr.InnerHtml = "";
    i_fstr.InnerHtml = "";
	string[] h_sfield = guangye.GetControlValue(fld_1232_6).Trim('|').Split('|');
	if (h_sfield.Length>0)
	{
		for (int i=0;i<h_sfield.Length;i++)
		{
			string[]  h_sstr = h_sfield[i].Trim(';').Split(';');
			if (h_sstr.Length > 2)
			{
				string h_caption = GetOneFieldValue("select caption from gmis_field where fieldcode = "+h_sstr[0]+"");
				s_fstr.InnerHtml += " [ "+h_caption+" "+h_sstr[1]+" "+h_sstr[2]+" ] ";
			}
			else if (h_sstr.Length == 1)
			{
				s_fstr.InnerHtml += " <b>"+h_sstr[0]+"</b> ";
			}
		}
	}

	//��������뵽��ʾ����
	string[] h_ifield = guangye.GetControlValue(fld_1232_3).Trim('|').Split('|');
	if (h_ifield.Length>0)
	{
		for (int i=0;i<h_ifield.Length;i++)
		{
			string[]  h_istr = h_ifield[i].Trim(';').Split(';');
			if (h_istr.Length > 1)
			{
				string h_caption = GetOneFieldValue("select caption from gmis_field where fieldname = '"+h_istr[0]+"'");
				string h_updown = (h_istr[1]=="asc")?"����":"����";
				i_fstr.InnerHtml += " "+h_caption+" "+h_updown+" <b>��</b> ";
			}				
		}
		if (i_fstr.InnerHtml.LastIndexOf("<b>")>-1)
		{
			i_fstr.InnerHtml = i_fstr.InnerHtml.Substring(0,i_fstr.InnerHtml.LastIndexOf("<b>"));
		}	
	}	
}
/***************************************************************
��������Click_Save()
��;������ģ��
�����/����:������  2009-6-19
***************************************************************/
private void Click_Save(object sender, System.EventArgs e)
{	
	string h_mcode = "";
	if (guangye.GetControlValue(fld_1232_4) == "")
	{
		alertmess.InnerHtml = "����ѡ��Ҫ��ʾ���ֶΣ�";
	}
	else 
	{
		if (guangye.GetControlValue(newname) != "")
		{
			
			DataTable h_checkdt = db.GetDataTable(db.ConnStr,"select mocode from gmis_mo_1232 where fld_1232_1='"+guangye.GetControlValue(newname)+"'");
			if (h_checkdt.Rows.Count>0)
			{
				alertmess.InnerHtml = "ģ������������";
			}
			else
			{
				guangye.SetControlValue(fld_1232_6,guangye.GetControlValue(fld_1232_6).Trim('|'));//ȥ��ǰ��|��
			
				fld_1232_2.Value=StringUtility.StringToBase64(CheckSearchFilter(guangye.GetControlValue(fld_1232_6)));//��ȡ��ѯ����

				guangye.SetControlValue(fld_1232_1,guangye.GetControlValue(newname));

				guangye.SetControlValue(fld_1232_5,guangye.GetControlValue(module));

				alertmess.InnerHtml = guangye.ExeBySql(guangye.GetInsertSql(dtable,flds,types), 0);
			}
		}
		else
		{
			if (guangye.GetControlValue(edition)!="0")
			{
				guangye.SetControlValue(fld_1232_6,guangye.GetControlValue(fld_1232_6).Trim('|'));//ȥ��ǰ��|��

				fld_1232_2.Value=StringUtility.StringToBase64(CheckSearchFilter(guangye.GetControlValue(fld_1232_6)));//��ȡ��ѯ����

				guangye.SetControlValue(fld_1232_5,guangye.GetControlValue(module));

				alertmess.InnerHtml = guangye.ExeBySql(guangye.GetUpdateSql(dtable,filter,flds,types), 0);
			}
			else
			{
				alertmess.InnerHtml = "������һ���µ�ģ�����ƣ�";
			}
		}
	}

	//��ѯģ��
	DataTable h_edt = db.GetDataTable(db.ConnStr,"select top 1 mocode from gmis_mo_1232 order by mocode desc");	
	BindListControl(edition, "mocode", "fld_1232_1", "select mocode,fld_1232_1 from gmis_mo_1232 order by mocode", "��ģ��");
	if (h_edt.Rows.Count>0)
	{
		SetFilter(edition, h_edt.Rows[0][0].ToString());
	}
	
	BindEdition();
}

/***************************************************************
��������Click_Search()
��;����ʼ����
�����/����:������  2009-6-19
***************************************************************/
private void Click_Search(object sender, System.EventArgs e)
{	
	if (guangye.GetControlValue(fld_1232_4) == "")
	{
		alertmess.InnerHtml = "����ѡ��Ҫ��ʾ���ֶΣ�";
	}
	else
	{
		guangye.SetControlValue(fld_1232_5,guangye.GetControlValue(module));
		SetSESSION("filter",fld_1232_2.Value+"#"+guangye.GetControlValue(fld_1232_3)+"#"+guangye.GetControlValue(fld_1232_4)+"#"+guangye.GetControlValue(fld_1232_5)+"#"+guangye.GetControlValue(fld_1232_6)+"#"+guangye.GetControlValue(fld_1232_7));
		Page.RegisterStartupScript("","<s"+"cript>window.open('pop_1232_1.aspx');</s"+"cript>");
	}
	BindEdition();
}

/***************************************************************
��������Click_Clear()
��;�������������
�����/����:������  2009-6-19
***************************************************************/
private void Click_Clear(object sender, System.EventArgs e)
{	
	Response.Redirect("list_1232.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&navindex=" + navindex + "");
}

private void SetToolBar()
{
	mid = GetQueryString("mid", "0");
	id = GetQueryString("id", "0");
	navindex = GetQueryString("navindex", "0");
	//�ж��Ƿ�Ϊ�����û�
	if (",2,3,7,".IndexOf("," + mid + ",") > -1 && !IsSystemDeveloper())
	{

		Response.Redirect("getpage.aspx?mid=0");
	}

	mua = ";" + GetModuleActions(mid) + ";";//ģ��Ȩ��    
	CheckToolBar(mua.Trim(';').Split(';'));
	
	SetSESSION("MainUrl", Request.Url.ToString());
}
</script>
<script>

/***************************************************************
��������S_Add_Click()
��;���������
�����/����:������  2009-6-19
***************************************************************/
function S_Add_Click()
{
	document.getElementById("s_alert").innerHTML ="";

	if (document.getElementById("s_fstr").innerHTML != "" && (window.form1.and.checked || window.form1.or.checked))
	{
		if(window.form1.and.checked)
		{
			window.form1.fld_1232_6.value += "|����";
			document.getElementById("s_fstr").innerHTML += " <b>����</b> ";
		}
		else
		{
			window.form1.fld_1232_6.value += "|����";
			document.getElementById("s_fstr").innerHTML += " <b>����</b> ";
		}
	}

	if(window.form1.s_field.value == "0")
	{
		document.getElementById("s_alert").innerHTML = "��ѡ���ֶ�����";
	}
	else if (window.form1.comparekey.value == "")
	{
		document.getElementById("s_alert").innerHTML = "����������ֵ��";
	}
	else if (document.getElementById("s_fstr").innerHTML != "" && !window.form1.and.checked && !window.form1.or.checked)
	{
		document.getElementById("s_alert").innerHTML = "��ѡ������һ������ϵ��";
	}	
	else
	{
		window.form1.fld_1232_6.value += "|"+window.form1.s_field.value+";"+window.form1.compare.options[window.form1.compare.selectedIndex].innerHTML+";"+window.form1.comparekey.value.replace("\'","").replace(",","��");

		document.getElementById("s_fstr").innerHTML += ' [ '+ window.form1.s_field.options[window.form1.s_field.selectedIndex].innerHTML+" "+window.form1.compare.options[window.form1.compare.selectedIndex].innerHTML+" "+ window.form1.comparekey.value.replace("\'","").replace(",","��") +' ] ';
	}
}

/***************************************************************
��������S_Cancel_Click()
��;��ȡ������
�����/����:������  2009-6-19
***************************************************************/
function S_Cancel_Click()
{
	if(document.getElementById("s_fstr").innerHTML.indexOf("[")>-1)
	{
		document.getElementById("s_fstr").innerHTML = document.getElementById("s_fstr").innerHTML.substring(0,document.getElementById("s_fstr").innerHTML.lastIndexOf("[")-9);
		window.form1.fld_1232_6.value = window.form1.fld_1232_6.value.substring(0,window.form1.fld_1232_6.value.lastIndexOf("|")-3);
	}
	else
	{
		document.getElementById("s_fstr").innerHTML = "";
		window.form1.fld_1232_6.value = "";
	}
}
/***************************************************************
��������S_Clear_Click()
��;���������
�����/����:������  2009-6-19
***************************************************************/
function S_Clear_Click()
{
	document.getElementById("s_fstr").innerHTML = "";
	window.form1.fld_1232_6.value = "";	
}

/***************************************************************
��������I_Add_Click()
��;���������
�����/����:������  2009-6-19
***************************************************************/
function I_Add_Click()
{
	document.getElementById("i_alert").innerHTML ="";

	if (document.getElementById("i_fstr").innerHTML != "" )
	{		
		window.form1.fld_1232_3.value += "|";
		document.getElementById("i_fstr").innerHTML += " <b>��</b> ";		
	}

	if(window.form1.i_field.value == "0")
	{
		document.getElementById("i_alert").innerHTML = "��ѡ���ֶ�����";
	}
	else if (window.form1.updown.value == "")
	{
		document.getElementById("i_alert").innerHTML = "��ѡ��������";
	}
	else
	{
		window.form1.fld_1232_3.value += window.form1.i_field.value+";"+window.form1.updown.value;

		document.getElementById("i_fstr").innerHTML += ' [ '+ window.form1.i_field.options[window.form1.i_field.selectedIndex].innerHTML+" "+window.form1.updown.options[window.form1.updown.selectedIndex].innerHTML+' ] ';
	}
}

/***************************************************************
��������I_Cancel_Click()
��;��ȡ������
�����/����:������  2009-6-19
***************************************************************/
function I_Cancel_Click()
{
	if(document.getElementById("i_fstr").innerHTML.indexOf("[")>-1)
	{
		document.getElementById("i_fstr").innerHTML = document.getElementById("i_fstr").innerHTML.substring(0,document.getElementById("i_fstr").innerHTML.lastIndexOf("[")-7);
		window.form1.fld_1232_3.value = window.form1.fld_1232_3.value.substring(0,window.form1.fld_1232_3.value.lastIndexOf(","));
	}
	else
	{
		document.getElementById("i_fstr").innerHTML = "";
		window.form1.fld_1232_3.value = "";
	}
}
/***************************************************************
��������I_Clear_Click()
��;���������
�����/����:������  2009-6-19
***************************************************************/
function I_Clear_Click()
{
	document.getElementById("i_fstr").innerHTML = "";
	window.form1.fld_1232_3.value = "";	
}

</script>


<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--ѡ�-->
    <!--ѡ�-->
	<!--ģ������-->
	<input id="fld_1232_1" runat="server" type="hidden" />
	<!--ģ������-->
	<!--��ѯ����-->
	<input id="fld_1232_2" runat="server" type="hidden" />
	<!--��ѯ����-->
	<!--��������-->
	<input id="fld_1232_3" runat="server" type="hidden" />
	<!--��������-->
	<!--��ʾ�ֶ�-->
	<input id="fld_1232_4" runat="server" type="hidden" />
	<input id="fld_1232_7" runat="server" type="hidden" />
	<!--��ʾ�ֶ�-->
	<!--ģ��ID-->
	<input id="fld_1232_5" runat="server" type="hidden" />
	<!--ģ��ID-->
	<!--��ѯ�����ֶ�-->
	<input id="fld_1232_6" runat="server" type="hidden" />
	<!--��ѯ�����ֶ�-->
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1"  class="table_graybgcolor">
		<tr >
			<td colspan="1" align="right" style="pading-right:5px;" class="td_viewcontent_title">��ѯģ��&nbsp;</td>			
			<td colspan="3" class="td_viewcontent_content" align="left">
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="88%"  style="padding-left:0px" >
						<!--��ѯģ��-->
						    <asp:DropDownList ID="edition" runat="server" Width="90%"></asp:DropDownList>
						<!--��ѯģ��-->	
						</td>
						<td width="12%" align="center" >
							<table border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td class="btn_L_pic"></td>
                                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="bottom" class="btn_text">
									  <!--Ӧ��ģ��-->
									  <G:Button id="btn_loadedition" type="toolbar" mode="on" icon="" text="Ӧ��ģ��" onclick="Click_LoadEdition" runat="server"></G:Button>
									  <!--Ӧ��ģ��-->
									  </td>
                                    </tr>
                                </table></td>
                                <td class="btn_R_pic"></td>
                              </tr>
                            </table>
					  </td>
					</tr>
				</table>
			</td>	
		</tr>

		<tr >
			<td colspan="1"  align="right"  class="td_viewcontent_title">��ѯ����&nbsp;</td>
			<td colspan="3" class="td_viewcontent_content" align="left" style="padding-left:10px;padding-bottom:5px;"  >
			    <table width="565"  border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;margin-bottom:10px">
				    <tr>
				       <td width="40" >ģ����</td>
				       <td colspan="5">
					   <!--��Ŀģ��-->
						<asp:DropDownList ID="module" Width="90%" AutoPostBack="true" OnSelectedIndexChanged="Change_Module" runat="server"></asp:DropDownList>
					   <!--��Ŀģ��-->
					   </td> 
				    </tr>
				</table>    
				<table width="565"  border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;margin-bottom:10px">
					<tr>
						<td width="40" >�ֶ���</td>
						<td>
						<!--�����ֶ�-->
						<asp:DropDownList ID="s_field" Style="height:20px;width:160px" runat="server">
						</asp:DropDownList>
						<!--�����ֶ�-->
						</td>
						<td>������</td>
						<td width="96">
						<!--�Ƚ�����-->
						<asp:DropDownList ID="compare" Style="width: 80px" runat="server">
							<asp:ListItem Value="����">����</asp:ListItem>
							<asp:ListItem Value="������">������</asp:ListItem>
							<asp:ListItem Value="����">����</asp:ListItem>
							<asp:ListItem Value="���ڵ���">���ڵ���</asp:ListItem>
							<asp:ListItem Value="С��">С��</asp:ListItem>
							<asp:ListItem Value="С�ڵ���">С�ڵ���</asp:ListItem>
							<asp:ListItem Value="������">������</asp:ListItem>		
						</asp:DropDownList>
						<!--�Ƚ�����-->
						</td>
						<td>ֵ</td>
						<td>
						<!--�Ƚ�ֵ-->
						<input id="comparekey" maxlength="50" runat=server type="text" style="width:200px">
						<!--�Ƚ�ֵ-->
						</td>
					</tr>
				</table>
				<table  border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;margin-bottom:10px">
					<tr>
						<td width="90" style="padding-top:5px">����һ������ϵ</td>
						<td width="140">
						<!--��ϵ-->
							<input type="radio" name="connection" id="and" runat=server>          
							����
							<input type="radio" name="connection" id="or" runat=server> 
							����
						<!--��ϵ-->
						</td>
						<td  style="padding-left:5px" align="left" ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--�������-->
								  <G:Button id="btn_s_add" type="toolbar" mode="on" icon="" text="���" Url="javascript:S_Add_Click();"  runat=server></G:Button>
								  <!--�������-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td  style="padding-left:5px" align="left" ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--ȡ������-->
								  <G:Button id="btn_s_cancel" type="toolbar" mode="on" icon="" text="ȡ��" Url="javascript:S_Cancel_Click();"  runat=server></G:Button>
								  <!--ȡ������-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td  align="left" style="padding-left:5px" ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--�������-->
								  <G:Button id="btn_s_clear" type="toolbar" mode="on" icon="" text="���" Url="javascript:S_Clear_Click();"  runat=server></G:Button>
								  <!--�������-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td><span id="s_alert" runat="server" style="color:Red;"></span></td>
					</tr>
				</table>
				<!--������ʾ��-->
				<div id="s_fstr"  style="height:111px;width:90%; background-color:#FFFFFF;border:0.2mm groove white; overflow:auto; padding-top:5px; padding-left:5px;" runat=server></div>
				<!--������ʾ��-->
			</td>
		</tr>
		<tr >
			<td colspan="1"  align="right" class="td_viewcontent_title" style="pading-right:5px;">��������&nbsp;</td>			
			<td colspan="3"  align="left" class="td_viewcontent_content"  style="padding-left:10px;padding-bottom:5px;" >
				<table border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;margin-bottom:5px">
					<tr>
						<td width="40"  class="font1225_000000" nowrap >�ֶ���</td>
						<td width="170" style="padding-left:0px">
						<!--�����ֶ�-->
						<asp:DropDownList ID="i_field" Style="height:20px;width:160px" runat="server">
						</asp:DropDownList>
						<!--�����ֶ�-->
						</td>
						<td width="90" style="padding-left:5px">
						<!--����ʽ-->
							<asp:DropDownList ID="updown" Style="width: 80px" runat="server">
								<asp:ListItem Value="asc">����</asp:ListItem>
								<asp:ListItem Value="desc">����</asp:ListItem>
							</asp:DropDownList>
						<!--����ʽ-->				
						</td>
						<td align="left" style="padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
									<td valign="bottom" class="btn_text" >
									<!--�������-->
									  <G:Button id="btn_i_add" type="toolbar" mode="on" icon="" text="���" Url="javascript:I_Add_Click();"  runat=server></G:Button>
									<!--�������-->	
									</td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td align="left" style="padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text">
								  <!--ȡ������-->
								  <G:Button id="btn_i_cancel" type="toolbar" mode="on" icon="" text="ȡ��" Url="javascript:I_Cancel_Click();"  runat=server></G:Button>
								  <!--ȡ������-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td  align="left"  style="padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text">
								  <!--�������-->
								  <G:Button id="btn_i_clear" type="toolbar" mode="on" icon="" text="���" Url="javascript:I_Clear_Click();"  runat=server></G:Button>
								  <!--�������-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td><span id="i_alert" runat="server" style="color:Red;"></span></td>
					</tr>
			  </table>
				<!--������ʾ��-->
				<div id="i_fstr"  style="height:80px;width:90% ; background-color:#FFFFFF;border:0.2mm groove white; overflow:auto;padding-top:5px; padding-left:5px;" runat=server></div>
				<!--������ʾ��-->
			</td>		
		</tr>
		<tr>
			<td width="18%" align="right" class="td_viewcontent_title" style="pading-right:5px;">��ʾ�ֶ�&nbsp;</td>			
			<td width="30%"  align="left" class="td_viewcontent_content"  style="padding-left:10px;padding-bottom:5px;padding-top:5px;" >
				<table  border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text" >
								  <!--������ʾ�ֶ�-->
								  <G:Button id="btn_selectfield" type="toolbar" mode="on" icon="" text="������ʾ�ֶ�" Url="javascript:var v_open = open('pop_1232_0.aspx?mid='+form1.module.value+'&field1='+form1.fld_1232_4.value+'&field2='+form1.fld_1232_7.value)"  runat=server></G:Button>
								  <!--������ʾ�ֶ�-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td  style="padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text">
								  <!--Ԥ����ͷ-->
								  <G:Button id="btn_showfield" type="toolbar" mode="on" icon="" text="Ԥ����ͷ" Url="javascript:if(form1.fld_1232_4.value!=''){var v_open = open('pop_1232_2.aspx?field1='+form1.fld_1232_4.value+'&field2='+form1.fld_1232_7.value);}else{alert('����������ʾ�ֶΣ�')}" runat=server ></G:Button>
								  <!--Ԥ����ͷ-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td width="" >&nbsp;</td>
					</tr>
			  </table>
			</td>	
			<td  width="18%" align="right" class="td_viewcontent_title">ģ�����&nbsp;</td>
			<td width="30%" class="td_viewcontent_content">
				<table  border="0" cellspacing="0" cellpadding="0">
					<tr>
					  <td width="45" ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text">
								  <!--����-->
								  <G:Button id="btn_save" type="toolbar" mode="on" icon="" text="����" onclick="Click_Save" runat=server></G:Button>
								  <!--����-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>
						<td width="124" ><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text" nowrap>
								  <!--��ģ����-->
								  ģ����<input id="newname" maxlength="50" runat=server type="text" style="width:150px">
								  <!--��ģ����-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table>
					    </td>					
						<td width="" >&nbsp;</td>
					</tr>
			  </table>
			</td>		
		</tr>
		<tr >
			<td colspan="1" align="right" class="td_viewcontent_title" style="pading-right:5px;">����&nbsp;</td>		
			<td colspan="3" class="td_viewcontent_content">
				<table width="100%"  border="0" cellspacing="0" cellpadding="0"  >
					<tr>
						<td align="left" style="padding-left:15px"><span id="alertmess" runat="server" style="color:Red;"></span></td>
						<td align="right"><table border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><table border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td class="btn_L_pic"></td>
                                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="bottom" class="btn_text">
									  <!--��ʼ����-->
									  <G:Button id="btn_gosearch" type="toolbar" mode="on" icon="" text="��ʼ����" onclick="Click_Search" runat=server></G:Button>
									  <!--��ʼ����-->
									  </td>
                                    </tr>
                                </table></td>
                                <td class="btn_R_pic"></td>
                              </tr>
                            </table></td>
                            <td  style="padding-left:5px; "><table border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td class="btn_L_pic"></td>
                                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="bottom" class="btn_text">
									   <!--���-->
									  <G:Button id="btn_clear" type="toolbar" mode="on" icon="" text="���" onclick="Click_Clear" runat=server></G:Button>
									  <!--���-->
									  </td>
                                    </tr>
                                </table></td>
                                <td class="btn_R_pic"></td>
                              </tr>
                            </table></td>
                          </tr>
                        </table>
					  </td>
					</tr>
				</table>
			</td>		
		</tr>
	</table>
    </form>
</body>
</html>
