<!--��¯¯Ҥ����,�༭ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->

<!--
����gmis_mo_25
������gmis_mo_23��������������gmis_mo_23.fld_23_3=gmis_mo_25.fld_25_14,gmis_mo_23.fld_23_1=gmis_mo_25.fld_25_15��
-->
<script language="C#" runat="server">
string p_sonmua;
string p_companyname;
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
	pid = GetQueryString("pid", "0");//��ģ���mocode
	tb_2.Visible=false;//����ԭ��������ť
	tb_save.Visible=false;//����ԭ�б��水ť
	btn_clear.Visible=false;//����ԭ����հ�ť
	btn_backlist.Visible=false;//����ԭ�з����б�ť 
    
	p_sonmua = ";" + GetModuleActions("25").Trim(';') + ";";//��ģ��Ȩ��
	
	/*ģ��༭����*/
	dtable = "gmis_mo_25";
	filter = " mocode=" + pid;
	flds = new string[] { "fld_25_1", "fld_25_2", "fld_25_3", "fld_25_4", "fld_25_5", "fld_25_6", "fld_25_7", "fld_25_8", "fld_25_9", "fld_25_10",  "fld_25_12", "fld_25_13", "fld_25_14", "fld_25_15"};
	types = "00001110100000";
	/*ģ��༭����*/	

	if(!IsPostBack)
	{	

		//ȼ������
        BindListControl(fld_25_7,"mocode","fld_62_1","select mocode,fld_62_1 from gmis_mo_62","-��ѡ��-");
        SetFilter(fld_25_7,"0");

		if(pid != "0")
		{			
			guangye.BindData(dtable, filter, flds);							
		}		
	}

	view.SqlStr = "select fld_23_3,fld_23_4,fld_23_1,fld_23_2,'' as wrw,fld_23_11 from gmis_mo_23 where mocode=" + id;
	DataTable dt = view.DataTable;
	if(dt.Rows.Count>0)
	{
		p_companyname = dt.Rows[0]["fld_23_4"].ToString();//��ȡ��λ����
		guangye.SetControlValue(fld_25_14,dt.Rows[0]["fld_23_3"].ToString()); 
		guangye.SetControlValue(fld_25_15,dt.Rows[0]["fld_23_1"].ToString()); 
		DataTable h_wrwdt = db.GetDataTable(db.ConnStr,"select mocode,(select fld_1206_1 from gmis_mo_1206 where mocode = fld_29_2) as wrwname from gmis_mo_29 where fld_29_3="+dt.Rows[0]["fld_23_3"].ToString()+"");//��ȡ��Ⱦ��
		//��ȡ��Ⱦ������
		if(h_wrwdt.Rows.Count>0 && dt.Rows[0]["fld_23_11"].ToString()!="")
		{
			string[] h_code = dt.Rows[0]["fld_23_11"].ToString().Trim(';').Split(';');
			if (h_code.Length>0)
			{
				for (int i=0;i<h_code.Length;i++)
				{
					DataRow[] h_wrwdr = h_wrwdt.Select("mocode="+h_code[i]+"");
					if(h_wrwdr.Length>0)
					{					
						dt.Rows[0]["wrw"] += h_wrwdr[0]["wrwname"].ToString()+",";								
					}
				}
				dt.Rows[0]["wrw"] = dt.Rows[0]["wrw"].ToString().Trim(',');
			}
		}
	}
	BindDataList();	
}

/***************************************************************
��������BindDataList()
��;�����б�
�����/����:������  2009-4-28
***************************************************************/
private void BindDataList()
{	
	string h_tablename = "gmis_mo_25";//���ݱ�����
	string h_orderstr = " order by fld_25_1 desc";//��������;	

	//�����б�ؼ�����Դ
	list.SqlStr = "select fld_25_1,fld_25_2,fld_25_3,fld_25_4,'' as btnstr,fld_25_5,fld_25_6,(select fld_62_1 from gmis_mo_62 where mocode =fld_25_7),fld_25_8,fld_25_9,fld_25_10,fld_25_12,fld_25_13,mocode from " + h_tablename + "  where fld_25_15=(select fld_23_1 from gmis_mo_23 where mocode="+id+") " + h_orderstr + " ";


	//�����б�ؼ���ʾ����
	list.Rows = (list.DataTable.Rows.Count < 4) ? 4 : list.DataTable.Rows.Count;

}
//����ǰҳ���ݣ������������ʾ�Ĳ���
public override void BeforeOutput(DataTable dt, int rowi)
{
	DataRow dr = dt.Rows[rowi];

	//�ж϶Ա�ģ���Ƿ��б༭Ȩ�ޣ�3����༭������ID(�ɴӲ���ģ��鿴)
	if (p_sonmua.IndexOf(";3;") != -1)
	{
		dr["btnstr"] += "<a href=\"edit_25.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=" + dr["mocode"].ToString() + "&id=" + id + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
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
			//��֤�����ֶ�����
			CheckMustAndFieldType(flds,"25");
			if (guangye.GetControlValue(fld_25_1) != "")//�жϹ�¯���Ψһ��
			{
				string h_fstr = (pid == "0")?"":" and mocode<>"+pid;
				DataTable h_cdt = db.GetDataTable(db.ConnStr,"select mocode from gmis_mo_25 where fld_25_15=(select fld_23_1 from gmis_mo_23 where mocode="+id+") and fld_25_1 = '"+guangye.GetControlValue(fld_25_1)+"' "+h_fstr+" ");
				if(h_cdt.Rows.Count>0)
				{
					SetSESSION("alert", "��¯������ظ���");
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
					exeinfo = db.TransUpdate(db.ConnStr, guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=25;select @name='"+p_companyname+"';if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (@mid,@mocode,'" + guangye.GetControlValue(fld_25_14) + "',@name) end else begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_25_14) + "',orgname=@name where datamocode=@mocode and modulecode=25 end ");
					
				}
				else
				{
					exeinfo = db.TransUpdate(db.ConnStr, guangye.GetUpdateSql(dtable, filter, flds, types) + ";declare @name as varchar(50);select @name='"+p_companyname+"';if exists (select 1 from gmis_mo_1197 where ModuleCode=25 and DataMoCode="+pid+") begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_25_14) + "',orgname=@name where datamocode=" + pid + " and modulecode=25 end else begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (25," + pid + ",'" + guangye.GetControlValue(fld_25_14) + "',@name) end");
				}

				if (exeinfo.IndexOf("�����ɹ���")>-1)
				{
					Response.Redirect("edit_25.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
				}
			}
			break;
		case "btn_deleteson":
			//ɾ����ͬʱ��һ��ɾ��gmis_mo_1197�����ݿ������
			exeinfo = db.TransUpdate(db.ConnStr, "delete gmis_mo_25 where mocode=" + sonid.Value + "; delete gmis_mo_1197 where datamocode=" + sonid.Value + " and modulecode=25");

			if (exeinfo.IndexOf("�����ɹ���") > -1)
			{
				Response.Redirect("edit_25.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
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
			Response.Redirect("edit_25.aspx?aid="+StringUtility.StringToBase64("edit")+"&mid="+mid+"&navindex="+navindex+"&id="+id+"&tid="+tid+"&pid=0");
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

	<tr>
		<td width="100" align="right" class="td_viewcontent_title">��λ����:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
		<td width="100" align="right" class="td_viewcontent_title">��λ����:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr> 
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">�ŷſڴ���:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
		<td width="100" align="right" class="td_viewcontent_title">�ŷſ�����:</td>
		<td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right" class="td_viewcontent_title">��Ⱦ������:</td>
		<td colspan="3" class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
	</tr>
</table>
</G:Template>
</G:Content>
<!--��ȾԴ��Ϣ-->
<!--��¯¯Ҥ�б�--> 

<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="margin-top: 3px;">
	<tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">��¯¯Ҥ</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">
<tr>
	<td valign="top"  style="width:100%" class="td_viewcontent_content" >
	<div style="width:99%; height:260px; overflow-y:auto;">
	<G:ListBox id="list" IsProPage="true" showallline=false runat="server">
	<G:Template id="templist" runat="server">
	<table width="100%" border="0"  cellspacing="0" >
	<tr valign="top" class="zy_bold_lineX" align="left" height="22">
		<td width="8%">
			¯Ҥ���:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%">
			¯Ҥ����:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%" >
			�豸�ͺ�:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>	
		<td width="8%">
			��������:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		<td width="8%">
		   *
		</td>			   
	</tr>
	<tr valign="top" class="zy_bold_lineX" align="left" height="22">
		<td width="8%">
			�չ���Сʱ:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%">
			�깤������:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%" >
			ȼ������:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>	
		<td width="8%">
			������:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>		
		<td width="8%">
		   &nbsp;
		</td>
	</tr>
	<tr valign="top" align="left" height="22">
		<td width="8%">
			��������:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%">
			ԭ������:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%" >
			������ʩ:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>	
		<td width="8%">
			Ч��:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>	
		<td width="8%">
		   &nbsp;
		</td>
	</tr>
	<tr >
	<td colspan="9"  height=1 style="background-color:#627C9D"></td>
	</tr>
	</table>
	</G:Template>
	</G:ListBox>
	</div>
</td>
</tr>
</table>  
<!--��¯¯Ҥ�б�-->


<!--�������༭��¯¯Ҥ-->
<input id="fld_25_14" type="hidden" runat="server" /><!--��λ����-->
<input id="fld_25_15" type="hidden" runat="server" /><!--�ŷſڱ��-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
	    <td align="right" width="100" class="td_viewcontent_title">¯Ҥ��ţ�</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_1" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
	    <td align="right" width="100" class="td_viewcontent_title"><span style="color:red">*</span>¯Ҥ���ƣ�</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_2" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right" width="100" class="td_viewcontent_title">�豸�ͺţ�</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_3" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
	    <td align="right" width="100" class="td_viewcontent_title">����������</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_4" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right" width="100" class="td_viewcontent_title">�չ���Сʱ��</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_5" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
	    <td align="right" width="100" class="td_viewcontent_title">�깤��������</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_6" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right" width="100" class="td_viewcontent_title">ȼ�����ࣺ</td>
	    <td class="td_viewcontent_content" style="width:35%"><asp:DropDownList ID="fld_25_7" style="width:95%;" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right" width="100" class="td_viewcontent_title">�����ʣ�</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_8" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right" width="100" class="td_viewcontent_title">����������</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_9" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
	    <td align="right" width="100" class="td_viewcontent_title">ԭ�����ࣺ</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_10" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
    </tr>
    <tr>	   
	    <td align="right" width="100" class="td_viewcontent_title">������ʩ��</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_12" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
		<td align="right" width="100" class="td_viewcontent_title">Ч�ʣ�</td>
	    <td class="td_viewcontent_content" style="width:35%"><input id="fld_25_13" class="boxbline" style="width:95%;" type="text" runat="server" /></td>
    </tr>   
</table>
<!--�������༭��¯¯Ҥ-->

<!--��̬����html,����-->
</form>
</body>
</html>
