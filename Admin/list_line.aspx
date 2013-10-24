<!--��·����,�б�ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{    
	mid = GetQueryString("mid","0");
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����

    string h_tstr ="",h_astr="" ;	
	string h_fstr="";
	
	if(!IsSystemDeveloper())
	{
		if(Session["listtype"] != null && Session["listtype"].ToString() != "")
		{
			h_tstr = " and typecode in ("+Session["listtype"].ToString()+")";						
		}
		if(Session["listtype"] != null && Session["listarea"].ToString() != "")
		{
			h_astr = " and areacode in ("+Session["listarea"].ToString()+")";				
		}
	}
	if(tid != "0")
	{
		h_tstr += " and t.typecode="+tid;
	}
	if (!IsPostBack) 
	{	
		BindListControl(selectarea,"areacode","areaname","select areacode,areaname from gmis_area where areastate='����'"+h_astr,"ȫ������");				
		if(Session["areafilter"] == null || Session["areafilter"].ToString() == "")
		{
			SetFilter(selectarea,"0");
			Session["areafilter"] = (selectarea.SelectedItem != null)?selectarea.SelectedItem.Value:"0";					
		}
		else
		{
			SetFilter(selectarea,Session["areafilter"].ToString());
		}
		BindListControl(selecttype,"typecode","typename","select typecode,typename from gmis_type where typestate='����' and typekind='��·'"+h_tstr,"����ͼ��");				
		if(Session["typefilter"] == null || Session["typefilter"].ToString() == "")
		{
			SetFilter(selecttype,"0");
			Session["typefilter"] = (selecttype.SelectedItem != null)?selecttype.SelectedItem.Value:"0";					
		}
		else
		{
			SetFilter(selecttype,Session["typefilter"].ToString());
		}
	}		
					
	if(selectarea.SelectedItem != null && selectarea.SelectedItem.Value != "" && selectarea.SelectedItem.Value != "0" )
		h_fstr += " And f.areacode="+selectarea.SelectedItem.Value;	
	if(selecttype.SelectedItem != null && selecttype.SelectedItem.Value != "" && selecttype.SelectedItem.Value != "0" )
		h_fstr += " And f.typecode="+selecttype.SelectedItem.Value;	
	if(keyword.Value.Trim()!="")
		h_fstr+=" And Featurename like '%"+keyword.Value.Trim()+"%'";
    int pagesize = GetListRows();//ÿҳ������
    int fromcount = Convert.ToInt32(navindex) * pagesize;//��ǰ��¼��
    string orderbystr = " order by Featurecode";//��ȡ�������������跽���Ѷ��壻
    string tablename = "gmis_Feature f Left Outer Join gmis_type t on f.typecode=t.typecode Left Outer Join gmis_area a on f.areacode=a.areacode";//��ȡ���ݱ����ƣ����跽���Ѷ��壻	
    list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + tablename + " where (featurekind=3 or typekind='��·') " + h_fstr + h_tstr + h_astr + ";select @allcount as allcount,'" + StringUtility.StringToBase64("view") + "'," + mid + "," + tid + ",Featurecode," + navindex + ",Featurename,Featurebrief,t.typename,a.areaname,case when Featurestate = 0 then '����' when Featurestate = -1 then '����' when Featurestate = 1 then '����' else '&nbsp;' end as Featurestate,'' as btnstr,f.typecode from " + tablename + " where (featurekind=3 or typekind='��·') " + h_fstr + h_tstr + h_astr + " and Featurecode not in (select top " + fromcount + " Featurecode from " + tablename + " where (featurekind=3 or typekind='��·') " + h_fstr + h_tstr + h_astr + orderbystr + ")  and Featurecode in (select top " + (fromcount + pagesize) + " Featurecode from " + tablename + " where (featurekind=3 or typekind='��·') " + h_fstr + h_tstr + h_astr + orderbystr + ")" + orderbystr;
    list.Rows = pagesize;
}
	public override void BeforeOutput(DataTable dt,int rowi)
	{	
		//����ǰҳ����
		DataRow dr=dt.Rows[rowi];
		if(mua.IndexOf(";3;") != -1 )
		{
			dr["btnstr"] += "<a href=\"getpage.aspx?aid="+StringUtility.StringToBase64("edit")+"&mid="+mid+"&tid="+tid+"&id="+dr["Featurecode"].ToString()+"&navindex="+navindex+"\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
		}
		if(mua.IndexOf(";4;") != -1)
		{
			dr["btnstr"] += "<a href=\"javascript:if(confirm('ȷ��Ҫɾ����')){document.location='getpage.aspx?aid="+StringUtility.StringToBase64("delete")+"&mid="+mid+"&tid="+tid+"&id="+dr["Featurecode"].ToString()+"&navindex="+navindex+"';}\"><img src=\"images/icons/tb03.gif\" title=\"ɾ��\" align=\"absmiddle\" border=\"0\"></a>";
		}
	}	
	
	private void Filter_Change(object sender, System.EventArgs e)
	{			
		Session["areafilter"] = (selectarea.SelectedItem != null)?selectarea.SelectedItem.Value:"0";
		Session["typefilter"] = (selecttype.SelectedItem != null)?selecttype.SelectedItem.Value:"0";
		list.Nav.PageIndex = 0;
		Response.Redirect("list_line.aspx?aid=list&mid="+mid);
	}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
<td>
	<table id="tb_8" visible="false" runat="server">
		<tr>
			<td class="textstrong-12px" nowrap>ͼ��:</td>
			<td>
				<asp:DropDownList id="selecttype" autopostback="true" OnSelectedIndexChanged="Filter_Change"  style="width:100px" runat="server"/>
			</td>
		</tr>
	</table>
</td>
<td>
	<table id="tb_9" visible="false" runat="server">
		<tr>
			<td class="textstrong-12px" nowrap>����:</td><td>
				<asp:DropDownList id="selectarea" autopostback="true" OnSelectedIndexChanged="Filter_Change"  style="width:100px" runat="server"/>
			</td>
		</tr>
	</table>
</td>
<td>
	<table id="tb_6" visible="false" runat="server">
		<tr>
			<td class="textstrong-12px" nowrap><input id="keyword" type="text" style="width:96px" maxlength="100" runat="server"></td>
			<td><G:Button id="search_btn" type="toolbar" mode="on" icon="" text="��ѯ" Style="padding-top:2px;" runat="server"></G:Button></td>
		</tr>
	</table>
</td>			
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			<td>&nbsp;</td> 
			<td width="38%" align="left">��·����</td>
			<td width="22%" align="left">���</td>
			<td width="15%" align="left">�������ݲ�</td>
			<td width="10%" align="left">��������</td>
			<td width="9%">״̬</td>
			<td width="7%">����</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td> 
			<td class="tdpadd-LR-3"><a title="�鿴��ϸ" href="getpage.aspx?aid=*&mid=*&tid=*&id=*&navindex=*">*</a></td>
			<td class="tdpadd-LR-3">&nbsp;*</td>
			<td class="tdpadd-center-3">&nbsp;*</td>
			<td class="tdpadd-center-3">&nbsp;*</td>
			<td class="tdpadd-icon">&nbsp;*</td>
			<td class="tdpadd-icon">&nbsp;*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_line.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--��̬����html,����-->
</form>
</body>
</html>
