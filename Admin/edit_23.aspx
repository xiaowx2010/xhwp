<!--�����ŷſڻ������,�༭ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--
����gmis_mo_23
������gmis_mo_17��������������gmis_mo_17.fld_17_1=gmis_mo_23.fld_23_3��;gmis_mo_21��������������gmis_mo_21.mocode in gmis_mo_23.fld_23_11��
-->
<script language="C#" runat="server">
string p_sonmua;
DataTable p_wrwdt ;
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
	pid = GetQueryString("pid", "0");//��ģ���mocode
	tb_2.Visible=false;//����ԭ��������ť
	tb_save.Visible=false;//����ԭ�б��水ť
	btn_clear.Visible=false;//����ԭ����հ�ť
	btn_backlist.Visible=false;//����ԭ�з����б�ť 
    
	p_sonmua = ";" + GetModuleActions("23").Trim(';') + ";";//��ģ��Ȩ��
	
	/*ģ��༭����*/
	dtable = "gmis_mo_23";
	filter = " mocode=" + pid;
	flds = new string[] { "fld_23_1", "fld_23_2", "fld_23_3", "fld_23_4", "fld_23_5", "fld_23_6", "fld_23_7", "fld_23_8", "fld_23_9" , "fld_23_10", "fld_23_11"};
	types = "00000110110";
	/*ģ��༭����*/	

	if(!IsPostBack)
	{
		BindListControl(fld_23_6, "mocode", "fld_54_1", "select mocode,fld_54_1 from gmis_mo_54", "-��ѡ��-");//�ŷſ�����
		SetFilter(fld_23_6,"0");

        BindListControl(fld_23_7, "mocode", "fld_1165_2", "select mocode,fld_1165_2 from gmis_mo_1165", "-��ѡ��-");//�ŷ�ȥ��
        SetFilter(fld_23_7,"0");

		BindListControl(fld_23_10, "mocode", "fld_1196_1", "select mocode,fld_1196_1 from gmis_mo_1196", "-��ѡ��-");//��������
		SetFilter(fld_23_10,"0");
		
		BindListControl(fld_23_11, "mocode", "fld_29_1", "select mocode,(select fld_1206_1 from gmis_mo_1206 where mocode = fld_29_2) as fld_29_1 from gmis_mo_29 where fld_29_3=(select fld_17_1 from gmis_mo_17 where mocode="+id+")");//��Ⱦ���б�

		if(pid != "0")
		{			
			guangye.BindData(dtable, filter, flds);		
			SetFilter(fld_23_9txt,(guangye.GetControlValue(fld_23_9).ToLower()=="true")?"1":"0");
		}
        if (guangye.GetControlValue(fld_23_10) == "")
        {
            SetFilter(fld_23_10, "0");
        }
	}
	if(pid!="0")
	{
		fld_23_1.Attributes["readonly"] = "true";
	}

    view.SqlStr = "select fld_17_1,fld_17_3,fld_17_4,(select top 1 featurecode from gmis_mo_1197 where orgcode=fld_17_1 and modulecode=17) as featurecode from gmis_mo_17 where mocode=" + id;
	DataTable dt = view.DataTable;
	if(dt.Rows.Count>0)
	{
        featurecode.Value = dt.Rows[0]["featurecode"].ToString();
		guangye.SetControlValue(fld_23_3,dt.Rows[0]["fld_17_1"].ToString()); 
		guangye.SetControlValue(fld_23_4,dt.Rows[0]["fld_17_3"].ToString()); 
	}
	BindDataList();
}


/***************************************************************
��������BindDataList()
��;�����б�
�����/����:������  2009-4-27
***************************************************************/
private void BindDataList()
{

	/*����ɸѡ����*/

	
	string h_tablename = "gmis_mo_23";//���ݱ�����
	string h_orderstr = " order by createdate desc";//��������;	

	//�����б�ؼ�����Դ
	list.SqlStr = "select fld_23_1,fld_23_2,(select fld_54_1 from gmis_mo_54 where mocode=fld_23_6),'' as btnstr,fld_23_5,(select fld_1165_2 from gmis_mo_1165 where mocode=fld_23_7),(select fld_1196_1 from gmis_mo_1196 where mocode=fld_23_10),fld_23_8,case fld_23_9 when 0 then '��' else '��' end,'' as wrw,fld_23_11,mocode from " + h_tablename + "  where fld_23_3=(select fld_17_1 from gmis_mo_17 where mocode="+id+") " + h_orderstr + " ";
	
	p_wrwdt = db.GetDataTable(db.ConnStr,"select mocode,(select fld_1206_1 from gmis_mo_1206 where mocode = fld_29_2) as wrwname from gmis_mo_29 where fld_29_3=(select fld_17_1 from gmis_mo_17 where mocode="+id+")");//��ȡ����ע���Ѵ�����Ⱦ��

	//�����б�ؼ���ʾ����
	list.Rows = (list.DataTable.Rows.Count < 8) ? 8 : list.DataTable.Rows.Count;

}

//����ǰҳ���ݣ������������ʾ�Ĳ���
public override void BeforeOutput(DataTable dt, int rowi)
{
	DataRow dr = dt.Rows[rowi];
	
	//��ȡ��Ⱦ������
	if(p_wrwdt != null && p_wrwdt.Rows.Count>0 && dr["fld_23_11"].ToString().Trim(';')!="")
	{
		string[] h_code = dr["fld_23_11"].ToString().Trim(';').Split(';');
		if (h_code.Length>0)
		{
			for (int i=0;i<h_code.Length;i++)
			{
				DataRow[] h_wrwdr = p_wrwdt.Select("mocode="+h_code[i]+"");
				if(h_wrwdr.Length>0)
				{					
					dr["wrw"] += h_wrwdr[0]["wrwname"].ToString()+",";								
				}
			}
			dr["wrw"] = dr["wrw"].ToString().Trim(',');
		}
	}

	//�ж϶Ա�ģ���Ƿ��б༭Ȩ�ޣ�3����༭������ID(�ɴӲ���ģ��鿴)
	if (p_sonmua.IndexOf(";3;") != -1)
	{
		dr["btnstr"] += "<a href=\"edit_23.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=" + dr["mocode"].ToString() + "&id=" + id + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
	}

	//�ж϶Ա�ģ���Ƿ��б༭Ȩ�ޣ�4����༭������ID(�ɴӲ���ģ��鿴)
	if (p_sonmua.IndexOf(";4;") != -1)
	{
		dr["btnstr"] += "<a href=\"javascript:if(confirm('ȷ��ɾ����')){deleteSon('" + dr["mocode"].ToString() + "');}\"><img src=\"images/icons/tb03.gif\" title=\"ɾ��\" align=\"absmiddle\" border=\"0\"></a>";
	}
}

private void Click_Toolbar(object sender, System.EventArgs e)
{
	string idstr = ((Control)sender).ID.ToLower();
	string exeinfo = "";
	switch (idstr)
	{
		case "btn_saveson":
			guangye.SetControlValue(fld_23_9,guangye.GetControlValue(fld_23_9txt));
			//��֤�����ֶ�����
			CheckMustAndFieldType(flds,"23");
			if (guangye.GetControlValue(fld_23_1) != "")//�ж��ŷſڱ��Ψһ��
			{
				string h_fstr = (pid == "0")?"":" and mocode<>"+pid;
				DataTable h_cdt = db.GetDataTable(db.ConnStr,"select mocode from gmis_mo_23 where fld_23_1 = '"+guangye.GetControlValue(fld_23_1)+"' "+h_fstr+" ");
				if(h_cdt.Rows.Count>0)
				{
                    SetSESSION("alert", "���ŷſڱ���Ѵ��ڣ����������룡");
				}
			}
			if (GetSESSION("alert").Length > 0)//��֤δͨ��
			{
				exeinfo = GetSESSION("alert");
				SetSESSION("alert", "");
			}
			else
			{
				//������µ�ͬʱ������������gmis_mo_1197�����ݿ������
				if (pid == "0")
				{
                    exeinfo = db.TransUpdate(db.ConnStr, guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=23;select @name='" + guangye.GetControlValue(fld_23_4) + "';if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname,rivercode,featurecode) values (@mid,@mocode,'" + guangye.GetControlValue(fld_23_3) + "',@name,'" + guangye.GetControlValue(fld_23_10) + "','" + guangye.GetControlValue(featurecode) + "') end else begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_23_3) + "',orgname=@name,rivercode='" + guangye.GetControlValue(fld_23_10) + "',featurecode='" + guangye.GetControlValue(featurecode) + "' where datamocode=@mocode and modulecode=23 end");
				}
				else
				{
                    exeinfo = db.TransUpdate(db.ConnStr, guangye.GetUpdateSql(dtable, filter, flds, types) + ";declare @name as varchar(50);select @name='" + guangye.GetControlValue(fld_23_4) + "';if exists (select 1 from gmis_mo_1197 where ModuleCode=23 and DataMoCode=" + pid + ") begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_23_3) + "',orgname=@name,rivercode='" + guangye.GetControlValue(fld_23_10) + "',featurecode='" + guangye.GetControlValue(featurecode) + "' where datamocode=" + pid + " and modulecode=23 end else begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname,rivercode,featurecode) values (23," + pid + ",'" + guangye.GetControlValue(fld_23_3) + "',@name,'" + guangye.GetControlValue(fld_23_10) + "','" + guangye.GetControlValue(featurecode) + "') end");

				}

				if (exeinfo.IndexOf("�����ɹ���")>-1)
				{
					Response.Redirect("edit_23.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
				}
			}
			break;
		case "btn_deleteson":
			//ɾ����ǰ���ݣ�����Ӧ�ļ�����ݺ͹�¯¯Ҥ���ݣ�ͬʱɾ����Ӧ��gmis_mo_1197���е�����,�Լ���Ӧ���������±�������;
			string h_sqlstr = "declare @name as varchar(50);select @name=fld_23_1 from gmis_mo_23 where mocode="+sonid.Value+";delete gmis_mo_1197 where orgcode='"+guangye.GetControlValue(fld_23_3)+"' and datamocode in (select mocode from gmis_mo_24 where fld_24_1=@name and fld_24_8='"+guangye.GetControlValue(fld_23_3)+"');delete gmis_mo_24 where fld_24_1=@name and fld_24_8='"+guangye.GetControlValue(fld_23_3)+"';delete gmis_mo_1197 where orgcode='"+guangye.GetControlValue(fld_23_3)+"' and datamocode in (select mocode from gmis_mo_25 where fld_25_15=@name and fld_25_14='"+guangye.GetControlValue(fld_23_3)+"');delete gmis_mo_25 where fld_25_15=@name and fld_25_14='"+guangye.GetControlValue(fld_23_3)+"';delete gmis_mo_58 where fld_58_2=@name;delete gmis_mo_59 where fld_59_1=@name;delete gmis_mo_1210 where fld_1210_1 in (select mocode from gmis_mo_58 where fld_58_2=@name);delete gmis_mo_23 where mocode=" + sonid.Value + "; delete gmis_mo_1197 where datamocode=" + sonid.Value + " and modulecode=23";

			exeinfo = db.TransUpdate(db.ConnStr, h_sqlstr);

			if (exeinfo.IndexOf("�����ɹ���") > -1)
			{
				Response.Redirect("edit_23.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
			}
			break;	   
		case "btn_clearson":
			if(flds!=null)
			{				
				guangye.ClearData(flds);
			}
			break;
		case "btn_backlistson":
			Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("list")+"&mid="+mid+"&navindex="+navindex+"&tid="+tid+"&pid="+pid);
			break;
		case "btn_addson":
			Response.Redirect("edit_23.aspx?aid="+StringUtility.StringToBase64("edit")+"&mid="+mid+"&navindex="+navindex+"&id="+id+"&tid="+tid+"&pid=0");
			break;
	}

	alertmess.InnerText = exeinfo;
}

</script>

<script type="text/javascript">
function deleteSon(code)
{
    form1.sonid.value=code;
    __doPostBack('btn_deleteson','')
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
			<!--����-->
			<td align=right style="padding-right: 5px;" nowrap>
				<G:Button id="btn_addson" type="toolbar" mode="on" icon="tb01" text="����" onclick="Click_Toolbar" runat="server">
				</G:Button>
			</td>
			<!--����-->
			<!--����-->
			<td align=right style="padding-right: 5px;" nowrap>
				<G:Button id="btn_saveson" type="toolbar" mode="on" icon="tb05" text="����" onclick="Click_Toolbar" runat="server">
				</G:Button>
			</td>	
			<!--����-->
			<!--���-->
			<td align=right style="padding-right: 5px;" nowrap>
			<G:Button id="btn_clearson" type="toolbar" mode="on" icon="tb06" text="���" onclick="Click_Toolbar" runat="server"></G:Button>
			</td>
			<!--���-->
			<!--�����б�-->
			<td align=right style="padding-right: 5px;" nowrap>
			<G:Button id="btn_backlistson" type="toolbar" mode="on" icon="tb13" text="�����б�" onclick="Click_Toolbar" runat="server"></G:Button>
			</td>
			<!--�����б�-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<input id="sonid" type="hidden" runat="server" />
<asp:LinkButton ID="btn_deleteson" runat="server" OnClick="Click_Toolbar"></asp:LinkButton>
<!--��ȾԴ��Ϣ-->
<G:Content id="view" runat="server">
<G:Template id="tmpview" runat="server">
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="margin-top: 10px;">    
<tr align="center">
	<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">��ȾԴ�������</td>
</tr>
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">��λ����:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
		<td width="100" align="right" class="td_viewcontent_title">��λ����:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr> 
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">��λ��ַ:</td>
		<td colspan="3" class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr>
</table>
</G:Template>
</G:Content>
<!--��ȾԴ��Ϣ-->
<!--�������༭��Ⱦ���ŷſ�-->
<input id="fld_23_3" type="hidden" runat="server" />
<input id="fld_23_4" type="hidden" runat="server" />
<input id="featurecode" type="hidden" runat="server" />
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
<tr align="center">
	<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">�����ŷſ�</td>
</tr>
<tr>
	<td width="100" align="right"  class="td_viewcontent_title"><font color="#ff6600">*</font>�ŷſڱ��:</td>
	<td class="td_viewcontent_content" style="width:35%" ><input id="fld_23_1" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
	
	<td width="100" align="right"  class="td_viewcontent_title">�ŷſ�����:</td>
	<td class="td_viewcontent_content" style="width:35%"><input id="fld_23_2" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
</tr>
<tr>
	<td width="100" align="right"  class="td_viewcontent_title">�ŷſ�λ��:</td>
	<td class="td_viewcontent_content" ><input id="fld_23_5" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
	
	<td width="100" align="right"  class="td_viewcontent_title">�ŷſ�����:</td>
	<td class="td_viewcontent_content" ><asp:DropDownList id="fld_23_6" style="width:95%;" runat="server" /></td>
</tr>
<tr>
	<td width="100" align="right"  class="td_viewcontent_title">�ŷ�ȥ��:</td>
	<td class="td_viewcontent_content" ><asp:DropDownList ID="fld_23_7" runat="server" style="width:95%;"></asp:DropDownList></td>
	
	<td width="100" align="right"  class="td_viewcontent_title">��������:</td>
	<td class="td_viewcontent_content" ><asp:DropDownList ID="fld_23_10" runat="server" style="width:95%;"></asp:DropDownList></td>
</tr>
<tr>
	<td width="100" align="right"  class="td_viewcontent_title">�ŷŹ���:</td>
	<td class="td_viewcontent_content" ><input id="fld_23_8" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
	<td width="100" align="right"  class="td_viewcontent_title">�Ƿ����߼��:</td>
	<td class="td_viewcontent_content" >
	<input id="fld_23_9" type="hidden" runat="server" />
	<asp:DropDownList id="fld_23_9txt" style="width:95%;" runat="server">
	<asp:ListItem Value="0">��</asp:ListItem>
	<asp:ListItem Value="1">��</asp:ListItem>
	</asp:DropDownList>
	</td>	
</tr>
<tr>
	<td width="100" align="right"  class="td_viewcontent_title">��Ⱦ���嵥:</td>
	
	<td colspan="3" class="td_viewcontent_content" >
	<asp:CheckBoxList id="fld_23_11" RepeatDirection="Horizontal" RepeatColumns="4" runat="server"/>
	</td>
	
</tr>
</table>
<!--�������༭��Ⱦ���ŷſ�-->

<!--�ŷſ��б�-->
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">
<tr>
	<td valign="top"  style="width:100%" class="td_viewcontent_content" >
	<div style="width:99%; height:320px; overflow-y:auto;">
	<G:ListBox id="list" IsProPage="true" showallline=false runat="server">
	<G:Template id="templist" runat="server">
	<table width="100%" border="0"  cellspacing="0" >
	<tr valign="top" class="zy_bold_lineX" align="left" height="22">
		<td width="8%">
			�ŷſڱ��:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%">
			�ŷſ�����:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%" >
			�ŷſ�����:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>				 				
		<td width="8%">
		   *
		</td>			   
	</tr>

	<tr valign="top" class="zy_bold_lineX" align="left" height="22">
	<td width="8%" >
			�ŷſ�λ��:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		<td width="8%" >
			�ŷ�ȥ��:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%" >
			��������:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>				 				
		<td width="8%">
		   &nbsp;
		</td>
	</tr>
	<tr valign="top" align="left" height="22">
	<td width="8%" >
			�ŷŹ���:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		<td width="8%">
			�Ƿ����߼��:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		<td width="8%">
			��Ⱦ���嵥:
		</td>
		<td width="15%">
			<img src="images/icons/TB07.gif" title="*" style="cursor:hand">&nbsp;
		</td>				 				
		<td width="8%">
		   &nbsp;
		</td>
	</tr>
	<tr >
	<td colspan="7"  height=1 style="background-color:#627C9D"></td>
	</tr>
	</table>
	</G:Template>
	</G:ListBox>
	</div>
</td>
</tr>
</table>  
<!--�ŷſ��б�-->

<!--��̬����html,����-->
</form>
</body>
</html>
