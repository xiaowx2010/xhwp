<!--��ˮ�ŷ���ɱ༭ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--
����gmis_mo_21
������gmis_mo_1205��������������gmis_mo_1205.mocode=gmis_mo_21.fld_21_2��;gmis_mo_17��������������gmis_mo_17.fld_17_1=gmis_mo_21.fld_21_3��
-->
<script language="C#" runat="server">
string p_sonmua;

private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
	pid = GetQueryString("pid", "0");//��ģ���mocode
	tb_2.Visible=false;//����ԭ��������ť
	tb_save.Visible=false;//����ԭ�б��水ť
	btn_clear.Visible=false;//����ԭ����հ�ť
	btn_backlist.Visible=false;//����ԭ�з����б�ť
	
	p_sonmua = ";" + GetModuleActions("21").Trim(';') + ";";//��ģ��Ȩ��
	
	/*ģ��༭����*/
	dtable = "gmis_mo_21";
	filter = " mocode=" + pid;
	flds = new string[] { "fld_21_1", "fld_21_2", "fld_21_3" };
	types = "110";
	/*ģ��༭����*/	

	if(!IsPostBack)
	{
		BindListControl(select_type, "mocode", "fld_55_1", "select mocode,fld_55_1 from gmis_mo_55","-��ѡ��-"); //����Ⱦ�����
		SetFilter(select_type, "0");

		BindListControl(fld_21_2, "mocode", "fld_1205_1", "select mocode,fld_1205_1 from gmis_mo_1205 order by fld_1205_3,fld_1205_1","-��ѡ��-");//����Ⱦ������ 
		SetFilter(fld_21_2, "0");

		if(pid != "0")
		{			
			guangye.BindData(dtable, filter, flds);			
		}
		if (guangye.GetControlValue(fld_21_2) != "" && guangye.GetControlValue(fld_21_2) != "0")
		{
			DataTable h_tdt = db.GetDataTable(db.ConnStr,"select fld_1205_2,fld_1205_4 from gmis_mo_1205 where mocode = "+guangye.GetControlValue(fld_21_2)); 
			if (h_tdt.Rows.Count>0)
			{
				wrw_code.InnerText = h_tdt.Rows[0]["fld_1205_2"].ToString();
				wrw_bz.InnerText = h_tdt.Rows[0]["fld_1205_4"].ToString();
			}
		}
	}

	view.SqlStr = "select fld_17_1,fld_17_3 from gmis_mo_17 where mocode=" + id;
	DataTable dt = view.DataTable;
	if(dt.Rows.Count>0)
	{
		guangye.SetControlValue(fld_21_3,dt.Rows[0]["fld_17_1"].ToString()); 
	}
	BindDataList();	
}

//������
private void BindDataList()
{

	/*����ɸѡ����*/

	
	string h_tablename = "gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2 = b.mocode";//���ݱ�����
	string h_orderstr = " order by fld_1205_2 asc";//��������;	

	//�����б�ؼ�����Դ
	list.SqlStr = "select fld_1205_2,fld_1205_1,fld_1205_4,fld_21_1,'' as btnstr,a.mocode from " + h_tablename + "  where fld_21_3=(select fld_17_1 from gmis_mo_17 where mocode="+id+") " + h_orderstr + " ";
	

	//�����б�ؼ���ʾ����
	list.Rows = (list.DataTable.Rows.Count < 8) ? 8 : list.DataTable.Rows.Count;

}


//����ǰҳ���ݣ������������ʾ�Ĳ���
public override void BeforeOutput(DataTable dt, int rowi)
{
	DataRow dr = dt.Rows[rowi];

	//�ж϶Ա�ģ���Ƿ��б༭Ȩ�ޣ�3����༭������ID(�ɴӲ���ģ��鿴)
	if (p_sonmua.IndexOf(";3;") != -1)
	{
		dr["btnstr"] += "<a href=\"edit_21.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=" + dr["mocode"].ToString() + "&id=" + id + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
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
			CheckMustAndFieldType(flds,"21");
			if (guangye.GetControlValue(fld_21_2) == ""||guangye.GetControlValue(fld_21_2) == "0")
			{
				SetSESSION("alert", "��ѡ����Ⱦ�����ƣ�");
			}
			else
			{
				//��ͬ��ȾԴ�������ظ���ͬ����Ⱦ��
				string h_fstr = (pid == "0")?"":" and mocode<>"+pid;
				DataTable h_wrwdt = db.GetDataTable(db.ConnStr,"select mocode from gmis_mo_21 where fld_21_3='"+guangye.GetControlValue(fld_21_3)+"' and fld_21_2="+guangye.GetControlValue(fld_21_2)+""+h_fstr);
				if (h_wrwdt.Rows.Count>0)
				{
                    SetSESSION("alert", "����Ⱦ���Ѵ��ڣ����������룡");
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
					exeinfo = db.TransUpdate(db.ConnStr, guangye.GetInsertSql(dtable, flds, types)+";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=21;select @name=fld_17_3 from gmis_mo_17 where mocode="+id+";if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (@mid,@mocode,'" + guangye.GetControlValue(fld_21_3) + "',@name) end else begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_21_3) + "',orgname=@name where datamocode=@mocode and modulecode=21 end");
				}
				else
				{
					exeinfo = db.TransUpdate(db.ConnStr, guangye.GetUpdateSql(dtable, filter, flds, types)+";declare @name as varchar(50);select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_21_3) + "';if exists (select 1 from gmis_mo_1197 where ModuleCode=21 and DataMoCode="+pid+") begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_21_3) + "',orgname=@name where datamocode=" + pid + " and modulecode=21 end else begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (21,"+pid+",'" + guangye.GetControlValue(fld_21_3) + "',@name) end");
				}

				if (exeinfo.IndexOf("�����ɹ���")>-1)
				{
					Response.Redirect("edit_21.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
				}
			}
			break;
		case "btn_deleteson":
			//ɾ����ͬʱ��һ��ɾ��gmis_mo_1197�����ݿ������������gmis_mo_53(�ŷſڱ�)���ݱ��У����и���Ⱦ��ļ�¼�����и���
			exeinfo = db.TransUpdate(db.ConnStr, "delete gmis_mo_21 where mocode=" + sonid.Value + "; delete gmis_mo_1197 where datamocode=" + sonid.Value + " and modulecode=21;update gmis_mo_53 set fld_53_11 = replace(';'+fld_53_11+';',';"+sonid.Value+";','') where ';'+fld_53_11+';' like '%;"+sonid.Value+";%'");
			if (exeinfo.IndexOf("�����ɹ���") > -1)
			{
				Response.Redirect("edit_21.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=0&id=" +id+ "");
			}
			break;	   
		case "btn_clearson":
			if(flds!=null)
			{				
				guangye.ClearData(flds);

				BindListControl(select_type, "mocode", "fld_55_1", "select mocode,fld_55_1 from gmis_mo_55","-��ѡ��-"); //����Ⱦ�����
				SetFilter(select_type, "0");

				BindListControl(fld_21_2, "mocode", "fld_1205_1", "select mocode,fld_1205_1 from gmis_mo_1205 order by fld_1205_3,fld_1205_1","-��ѡ��-");//����Ⱦ������
				SetFilter(fld_21_2, "0");

				wrw_code.InnerText = "";
				wrw_bz.InnerText = "";
			}
			break;
		case "btn_backlistson":
			Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("list")+"&mid="+mid+"&navindex="+navindex+"&tid="+tid+"&pid="+pid);
			break;
		case "btn_addson":
			Response.Redirect("edit_21.aspx?aid="+StringUtility.StringToBase64("edit")+"&mid="+mid+"&navindex="+navindex+"&id="+id+"&tid="+tid+"&pid=0");
			break;
	}

	alertmess.InnerText = exeinfo;
}
   
//���ɸѡ
private void Change_Type(object sender, System.EventArgs e)
{
	string h_fstr="";
	if (guangye.GetControlValue(select_type) != "" && guangye.GetControlValue(select_type) != "0")
	{
		h_fstr = " and fld_1205_3="+guangye.GetControlValue(select_type)+"";
	}	
	BindListControl(fld_21_2, "mocode", "fld_1205_1", "select mocode,fld_1205_1 from gmis_mo_1205 where 1=1 "+h_fstr+" order by fld_1205_3,fld_1205_1","-��ѡ��-");//����Ⱦ������ 
	SetFilter(fld_21_2, "0");
}
//����ɸѡ
private void Change_Name(object sender, System.EventArgs e)
{
	if (guangye.GetControlValue(fld_21_2) != "" && guangye.GetControlValue(fld_21_2) != "0")
	{
		DataTable h_tdt = db.GetDataTable(db.ConnStr,"select fld_1205_2,fld_1205_4 from gmis_mo_1205 where mocode = "+guangye.GetControlValue(fld_21_2)); 
		if (h_tdt.Rows.Count>0)
		{
			wrw_code.InnerText = h_tdt.Rows[0]["fld_1205_2"].ToString();
			wrw_bz.InnerText = h_tdt.Rows[0]["fld_1205_4"].ToString();
		}
	}
}
</script>
<script type="text/javascript">
function deleteSon(code)
{
    form1.sonid.value=code;
    __doPostBack('btn_deleteson','')
}
</script>

<body style="padding: 10px; text-align: center">
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
    </table>
	</G:Template>
    </G:Content>
	<!--��ȾԴ��Ϣ-->
	<!--��Ⱦ���б�-->
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top"
        style="margin-top: 3px;">
        <tr align="center">
            <td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">��Ⱦ���б�</td>
        </tr>
    </table>   
	<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">
	<tr>
		<td valign="top"  style="width:100%" class="td_viewcontent_content" >
		<div style="width:99%; height:320px; overflow-y:auto;">
		<G:ListBox id="list" IsProPage="true" showallline=false runat="server">
		<G:Template id="templist" runat="server">
		 <table width="100%" border="0"  cellspacing="0" >
			<tr valign="top" align="left" height="22">
				<td width="8%" >
					��Ⱦ�����:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>
				 <td width="8%">
					��Ⱦ������:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>
				 <td width="8%" >
					ִ�б�׼:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>
				 <td width="8%" >
					����ŷ���:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>				
				 <td width="8%">
				   *
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
    <!--��Ⱦ���б�-->
	<!--�������༭��Ⱦ��-->
	<input id="fld_21_3" type="hidden" runat="server" />
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��Ⱦ�����:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList ID="select_type" AutoPostBack="true" OnSelectedIndexChanged="Change_Type" Style="width:95%;" runat="server"></asp:DropDownList></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">��Ⱦ������:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList ID="fld_21_2" AutoPostBack="true" OnSelectedIndexChanged="Change_Name" Style="width:95%;" runat="server"></asp:DropDownList></td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">��Ⱦ�����:</td>
		<td class="td_viewcontent_content" style="width:35%"><lable id="wrw_code" runat=server></lable>&nbsp;</td>
		 
		<td width="100" align="right"  class="td_viewcontent_title">ִ�б�׼:</td>
		<td class="td_viewcontent_content" style="width:35%"><lable id="wrw_bz" runat=server></lable>&nbsp;</td>
	</tr>	
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">����ŷ���:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_21_1" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
	</tr>
	</table>
    <!--�������༭��Ⱦ��-->
    <!--��̬����html,����-->
    </form>
</body>
</html>

