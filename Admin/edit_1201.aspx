<!--��������,�༭ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	<script>
function GetData(args)
{	
	if(args.length >0)
	{
		if(window.document.form1.Featuredata != null)
		{			
			window.document.form1.Featuredata.value=args;
		}
		
	}
	window.document.focus();	
}
</script>
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string upsonid = "";
    string dtablefeature, filterfeature, typesfeature;
    string[] fldsfeature;
private void Page_Load(object sender, System.EventArgs e)
{

    //SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 
    mid = GetQueryString("mid", "0");
    aid = GetQueryString("aid", "edit");
    id = GetQueryString("id", "0");
    upsonid = GetQueryString("upsonid", "0");  //�����ϼ�����
    tabid = GetQueryString("tabid", "0");

    dtable = "gmis_mo_1201";
    filter = "mocode=" + id;
    flds = new string[] { "fld_1201_1", "fld_1201_2", "fld_1201_3", "fld_1201_6", "fld_1201_7", "featurecode" };
    types = "011001";

    dtablefeature = "gmis_Feature";
    fldsfeature = new string[] { "Featurename", "Featurebrief", "typecode", "areacode", "Featuremode", "Featurex", "Featurey", "Featuredata", "Featuredepth", "Featurestate", "Featuredesc", "FeatureKind" };
    typesfeature = "001111101001";
  
    
    if (GetSESSION("alert") != "")
    {
        alertmiddle.InnerText = GetSESSION("alert");
        SetSESSION("alert", "");
    }

    if (!IsPostBack)
    {
        //fld_1200_3.Items.Clear();
        BindListControl(fld_1201_2, "fld_1201_2", "fld_1201_2_index", "select distinct fld_1201_2,('�� '+cast(fld_1201_2 as varchar(10))+' ��') as fld_1201_2_index from gmis_mo_1201");
        if (fld_1201_2.Items.Count == 0)
        {
            fld_1201_2.Items.Add(new ListItem("�� 1 ��", "1"));
        }
        else
        {
            fld_1201_2.Items.Add(new ListItem("�� " + (fld_1201_2.Items.Count + 1) + " ��", Convert.ToString(fld_1201_2.Items.Count + 1)));
        }

        if (id != "0")
        {
            guangye.BindData(dtable, filter, flds);
           
            BindListControl(fld_1201_3, "mocode", "fld_1201_1", "select mocode,fld_1201_1 from gmis_mo_1201 where fld_1201_2=" + (Convert.ToInt32(fld_1201_2.SelectedItem.Value) - 1));
            guangye.BindData(dtable, filter, flds);
            if (guangye.GetControlValue(featurecode) != "" && guangye.GetControlValue(featurecode) != "0")
            {
                filterfeature = "featurecode=" + featurecode.Value;
                guangye.BindData(dtablefeature, filterfeature, fldsfeature);
                
            }
            frmTree.Attributes.Add("src", "edit_1201managetree.aspx?id=" + id);
        }
        else
        {
            frmTree.Attributes.Add("src", "edit_1201managetree.aspx?id=" + upsonid);
            //frmTree.Attributes.Add("src", "edit_122managetree.aspx?id=" + upsonid);
        }
    }
    if (upsonid != "0")
    {
        SetFilter(fld_1201_2, GetSonLevel(upsonid));
        BindListControl(fld_1201_3, "mocode", "fld_1201_1", "select mocode,fld_1201_1 from gmis_mo_1201 where fld_1201_2=" + (Convert.ToInt32(fld_1201_2.SelectedItem.Value) - 1));
        SetFilter(fld_1201_3, upsonid);
    }
    if (guangye.GetControlValue(FeatureKind) == "" || guangye.GetControlValue(FeatureKind) == "0")
    {
        featurecode.Value = "0";
        FeatureKind.Value = "2";
    }  
}

public void CheckSave()
{
    
    if (GetSESSION("alert").Length == 0)
    {
        Featurename.Value = fld_1201_1.Value;
        Featurestate.Value="����";
        db.SqlString = "select mocode from gmis_mo_1201 where mocode!=" + id + " and (fld_1201_1=='" + fld_1201_1.Value + "' or fld_1201_6='" + fld_1201_6.Value + "')";
        if (db.GetDataTable().Rows.Count > 0)
        {
            SetSESSION("alert", GetSESSION("alert") + "�������ƺ�������벻���ظ���");
        }
        else
        {            
            if (featurecode.Value != "0" && featurecode.Value!="")
            {
                filterfeature = "featurecode=" + guangye.GetControlValue(featurecode);
                db.SqlString = guangye.GetUpdateSql(dtablefeature, filterfeature, fldsfeature, typesfeature);
                db.TransUpdate();
            }
            else
            {
                DataTable dt_temp = db.GetDataTable(db.ConnStr, guangye.GetInsertSql(dtablefeature, fldsfeature, typesfeature) + ";SELECT @@IDENTITY AS 'featurecode';");
                if (dt_temp != null && dt_temp.Rows.Count > 0)
                {
                    featurecode.Value = dt_temp.Rows[0]["featurecode"].ToString();
                }
            }
        }
    }
    
}

private void change_level(object sender, System.EventArgs e)
{

    BindListControl(fld_1201_3, "mocode", "fld_1201_1", "select mocode,fld_1201_1 from gmis_mo_1201 where fld_1201_2=" + (Convert.ToInt32(fld_1201_2.SelectedItem.Value) - 1) + " and mocode<>" + id);
}

</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<input id="featurecode" runat="server" type="hidden" />
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar_1201.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->

<table>
    <tr>
        <td width="150px">
            <iframe id="frmTree" runat="server" src="edit_1201managetree.aspx?id=<%=id%>" width="150" height="435" frameborder="0" scrolling="no"></iframe>
        </td>
        <td width="100%">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:10px;">
	<tr>
		<td align="right" nowrap class="td_viewcontent_title"><font color="#ff6600">*</font>��������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1201_1" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		<td align="right" nowrap class="td_viewcontent_title">�����������:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1201_6" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		</tr>
		<tr>
		<td align="right" nowrap class="td_viewcontent_title">�㼶:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList runat="server" ID="fld_1201_2" Width="160" AutoPostBack="true" OnSelectedIndexChanged="change_level"></asp:DropDownList></td>
		<td align="right" nowrap class="td_viewcontent_title">ֱ���ϼ�:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList runat="server" ID="fld_1201_3" Width="160"></asp:DropDownList></td>
	</tr>
	<tr> 
        <td class="td_viewcontent_title" align="right">��ͼ���ݣ�</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="Featurename" type="hidden" runat="server">
        <input id="Featurestate" type="hidden" runat="server">
        <input id="Featuredata" type="hidden" runat="server">
        <input id="Featurex" type="hidden" runat="server">
        <input id="Featurey" type="hidden" runat="server"><input id="FeatureKind" type="hidden" runat="server" value="2">
        <table><tr><td>
		<input id="dataface" type="password" style="width:200px" title="��ӵ�ͼ��ȡ����" value="1111111111111111111111111111" readonly="true">
        </td><td >&nbsp;��ȣ�</td><td >
        <input id="tmpdepth" type="hidden" value="0" runat="server">
		<input id="Featuredepth" type="text" style="width:60px" value="0" onmousedown="this.value=''" onmouseout="if(this.value=='') {this.value=tmpdepth.value}"  title="ֻ����������"  runat="server">
        </td><td>&nbsp;<a href="javascript:__doOpenMap('2',form1.featurecode.value+'|2|0')"><img src="images/getdata_.gif" border="0"></a>
        </td></tr></table>
        </td>
    </tr>
	<tr>
		<td align="right" nowrap class="td_viewcontent_title">˵��:</td>
		<td colspan="3" class="td_viewcontent_content" ><TextArea id="fld_1201_7" class="boxbline" style="width:98%;height:326px;" runat="server" ></TextArea></td>
		</tr>
	</table>
	</td></tr></table>
<!--��̬����html,����-->
</form>
</body>
</html>
