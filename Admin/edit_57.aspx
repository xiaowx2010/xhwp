<!--���ݹ���-�ֶι���-�ŷſ���Ⱦ���嵥-->
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
	dtable = "gmis_Mo_57";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_57_1", "fld_57_2", "fld_57_3", "fld_57_4", "fld_57_5", "creatorcode","fld_57_6" };
    mflds = new string[] { "��Ⱦ������|fld_57_4" };
    types = "0100010";
    if (!IsPostBack) 
    {
        //�Ȱ��б�
        creatorcode.Value = GetUID();//������ID
        //��Ⱦ�����
        BindListControl(fld_57_2, "mocode", "fld_55_1", "select mocode,fld_55_1 from gmis_mo_55", "��ѡ��");
        BindListControl(fld_57_4, "mocode", "fld_1205_1", "select mocode,fld_1205_1 from gmis_mo_1205");
        //fld_57_3.Value = fld_57_4.SelectedItem.Value;
        SetFilter(fld_57_2,"0");
        BindListControl(fld_57_6, "fld_17_1", "fld_17_1", "select distinct fld_17_1 from gmis_mo_17");
		if(id != "0")
        {//������ֵ
		    guangye.BindData(dtable,filter,flds);
		}
        
    } 
    if (fld_57_4.SelectedItem != null)
    {
        db.SqlString = "select fld_1205_2 from gmis_mo_1205 where mocode=" + fld_57_4.SelectedItem.Value;

        DTsql = db.GetDataTable();
        if (DTsql != null && DTsql.Rows.Count > 0)
            fld_57_3.Value = DTsql.Rows[0][0].ToString();
    }  
}

//����֮ǰ�����ݴ���
public override void BeforeSave()
{
    CheckMustAndFieldType();
    string h_sql = "",h_typecode="0";
    db.SqlString = "select top 1 typecode from gmis_type where modulecode=" + mid + " order by typeindex desc";
    DataTable dt_temp = db.GetDataTable();
    if (dt_temp != null && dt_temp.Rows.Count > 0)
    {
        if (dt_temp.Rows[0][0].ToString() != "")
            h_typecode = dt_temp.Rows[0][0].ToString();
    }
    if (id == "0")
    {
        h_sql += guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int,@mid as int,@name as varchar(50);select @mocode=@@IDENTITY;select @mid=" + mid + ";select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_57_6) + "';if not exists (select 1 from gmis_mo_1197 where ModuleCode=@mid and DataMoCode=@mocode) begin insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname,typecode,areacode,rivercode) values (@mid,@mocode,'" + guangye.GetControlValue(fld_57_6) + "',@name,"+h_typecode+",0,0) end";
        //Response.Write(h_sql);
        SetSESSION("sql", h_sql);
    }
    else
    {
        SetSESSION("sql", guangye.GetUpdateSql(dtable, filter, flds, types) + ";declare @name as varchar(50);select @name=fld_17_3 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_57_6) + "';update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_57_6) + "',orgname=@name,typecode="+h_typecode+",areacode=0,rivercode=0 where datamocode=" + id + " and modulecode=" + mid + "");
    }
    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
}

    private void selectchanged(object sender, System.EventArgs e)
    {
        
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
<input id="creatorcode" runat="server" type="hidden" />
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
	<tr>
	    <td align="right"  class="td_viewcontent_title">�ŷſڱ�ţ�</td>
	    <td class="td_viewcontent_content"><input id="fld_57_1" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">��Ⱦ�����</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_57_2" runat="server" Width="160"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��Ⱦ����룺</td>
	    <td class="td_viewcontent_content"><input id="fld_57_3" class="boxbline" type="text" runat="server" readonly /></td>
	    <td align="right"  class="td_viewcontent_title"><span style="color:Red;">*</span>��Ⱦ�����ƣ�</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_57_4" Width="160px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="selectchanged"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��Ⱦ���ŷű�׼��</td>
	    <td class="td_viewcontent_content"><input id="fld_57_5" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">��λ����:</td>
	    <td class="td_viewcontent_content"><asp:DropDownList id="fld_57_6" class="boxbline"  runat="server" /></td>
    </tr>
</table>
<!--��̬���ɽ���-->
</form>
</body>
</html>