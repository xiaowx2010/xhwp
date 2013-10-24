<!--�߽��������ŷ����,�༭ҳ-->
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

    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 
    mid = GetQueryString("mid", "0");
    tid = GetQueryString("tid", "0");
    id = GetQueryString("id", "0");

    if (fld_35_4.Items.Count == 0)
    {
        int thisyear = Convert.ToInt32(DateTime.Now.Year)+10;
        for (int i = 20; i > 0; i--)
        {
            fld_35_4.Items.Add(new ListItem(thisyear.ToString()+"��",thisyear.ToString()));
            thisyear--;
        }
    }
    if(fld_35_5.Items.Count==0)
    {
        for(int i=1;i<13;i++)
        {
            fld_35_5.Items.Add(new ListItem(i.ToString()+"��",i.ToString()));
        }
    }

    dtable = "gmis_mo_35";
    filter = "mocode=" + id;
    flds = new string[] { "fld_35_1", "fld_35_2", "fld_35_3", "fld_35_4", "fld_35_5", "fld_35_6", "fld_35_7" };
    types = "0111100";

    if (!IsPostBack)
    {
        if (id != "0")
        {
            guangye.BindData(dtable, filter, flds);
        }
        else
        {
            SetFilter(fld_35_4, DateTime.Now.Year.ToString());
            SetFilter(fld_35_5, DateTime.Now.Month.ToString());
        }
    }
}
    public override void BeforeSave()
    {
        CheckMustAndFieldType();

        db.SqlString = "select 1 from " + dtable + " where fld_35_1='" + guangye.GetControlValue(fld_35_1) + "' and mocode!=" + id;
        if (db.GetDataTable().Rows.Count > 0)
        {
            SetSESSION("alert", "������������Դ��");
            Response.Redirect("execommand.aspx?mid=" + mid + "&pid=" + pid + "&id=" + id);
        }
        //SetSESSION("alert", "select 1 from " + dtable + " where fld_35_1=" + guangye.GetControlValue(fld_35_1) + " and mocode!=" + id);
        if (id == "0")
        {
            SetSESSION("sql", guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=" + mid + ";select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_35_7) + "';if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname) values (@mid,@mocode,'" + guangye.GetControlValue(fld_35_7) + "',@name) end else begin update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_35_7) + "',orgname=@name where datamocode=" + id + " and modulecode=" + mid + " end");
        }
        else
        {
            SetSESSION("sql", guangye.GetUpdateSql(dtable, filter, flds, types) + ";declare @name as varchar(50);select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_35_7) + "';update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_35_7) + "',orgname=@name where datamocode=" + id + " and modulecode=" + mid + "");
        }

        //SetSESSION("alert", GetSESSION("sql"));

        Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
   
	}
	private void Click_Search(object sender, System.EventArgs e)
	{
		string scriptstr = "";
		if (guangye.GetControlValue(fld_35_7).Length > 0)
		{
			DataTable dtt = db.GetDataTable(db.ConnStr,"select fld_17_1 from gmis_mo_17 where fld_17_1 like '%"+fld_35_7.Value.Trim()+"%'");
			if (dtt.Rows.Count > 0)
			{
				alertmess.InnerText = "";
				scriptstr = "<scrip" + "t>__doOpenView('pop_27.aspx?mid=" + mid + "&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_35_7).Trim()) + "',800,600,10,50);</scrip" + "t>";
				Page.RegisterStartupScript("popwin", scriptstr);
			}
			else alertmess.InnerText = "�Ҳ�����λ���룺"+fld_35_7.Value.Trim();
		}
		else alertmess.InnerText = "�������ѯ���ݣ�";
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
		
		<td  align="right"  class="td_viewcontent_title"><font color="#ff6600">*</font>����Դ����:</td>
		
		<td colspan="3" class="td_viewcontent_content"><input id="fld_35_1" class="boxbline" style="width:98%;" maxlength="50" runat="server" ></td>

		</tr>
		
		<tr>
		
		<td align="right"  class="td_viewcontent_title">��ҹ��Ч����:</td>
		
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_35_2" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		<td align="right"  class="td_viewcontent_title">ҹ���ֵ����:</td>
		
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_35_3" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
</tr>
		
		<tr>
		
		<td align="right"  class="td_viewcontent_title">���:</td>
		
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList ID="fld_35_4" Width="160px" runat="server"></asp:DropDownList></td>

	
	<td align="right"  class="td_viewcontent_title">�·�:</td>
		
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList ID="fld_35_5" Width="160px" runat="server"></asp:DropDownList></td>
	
		</tr>
		
		<tr>
		
		<td align="right"  class="td_viewcontent_title">��λ����:</td>
		
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_35_7" class="boxbline" style="width:80%" type="text" runat="server" />&nbsp;&nbsp;
		<asp:LinkButton ID="btn_search" runat="server" OnClick="Click_Search"><img src="images/icons/search.gif" style="cursor:hand" title="��ѯ" border="0" /></asp:LinkButton>
		</td>
		
		<td align="right"  class="td_viewcontent_title">��ȾԴ����:</td>
		
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_35_6" class="boxbline" style="width:95%;" readonly maxlength="50" runat="server" ></td>
	
		</tr>
	
		</table>
<!--��̬����html,����-->
</form>
</body>
</html>
