<!--��ˮ��Ⱦ��,�༭ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--
����gmis_mo_1205
������gmis_mo_55��������������gmis_mo_1205.fld_1205_3=gmis_mo_55.mocode��
-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 
    mid = GetQueryString("mid", "0");
    tid = GetQueryString("tid", "0");
    id = GetQueryString("id", "0");

    dtable = "gmis_mo_1205";
    filter = "mocode=" + id;
    flds = new string[] { "fld_1205_1", "fld_1205_2" ,"fld_1205_3", "fld_1205_4" };
    types = "0011";

    if (!IsPostBack)
    {
        BindListControl(fld_1205_3, "mocode", "fld_55_1", "select mocode,fld_55_1 from gmis_mo_55");//����Ⱦ�����
		if (id != "0")
        {
            guangye.BindData(dtable, filter, flds);
        }
    }
 }
    public override void BeforeSave()
    {
        db.SqlString = "select top 1 1 from gmis_mo_1205 where mocode!=" + id + " and (fld_1205_1='" + guangye.GetControlValue(fld_1205_1) + "' or fld_1205_2='" + guangye.GetControlValue(fld_1205_2) + "')";
        if (db.GetDataTable().Rows.Count > 0)
        {
            SetSESSION("alert", "����Ⱦ�����ƻ�����Ѵ��ڣ��뷵���޸ģ�");
        }
            if(GetSESSION("alert")==""&&id!="0")
                SetSESSION("extsql", "if exists (select mocode from gmis_mo_57 where fld_57_4="+id+") update gmis_mo_57 set fld_57_3='"+fld_1205_2.Value+"' where fld_57_4="+id+"");
        
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
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="120" align="right"  class="td_viewcontent_title" nowrap><font color="#ff6600">*</font>��ˮ��Ⱦ������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1205_1" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="120" align="right"  class="td_viewcontent_title" nowrap>��Ⱦ�����:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1205_2" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		</tr>
		<td width="120" align="right"  class="td_viewcontent_title" nowrap>��Ⱦ�����:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList ID="fld_1205_3" Style="width:95%;" runat="server"></asp:DropDownList></td>
		
		<td width="120" align="right"  class="td_viewcontent_title" nowrap>ִ�б�׼(����/��):</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1205_4" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		</tr>
	</table>
<!--��̬����html,����-->
</form>
</body>
</html>
