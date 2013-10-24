<!--���ݹ���-�ֶ�ģ��-��ҵ���-->
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
	dtable = "gmis_Mo_45";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_45_1", "fld_45_2", "fld_45_3", "creatorcode" };
    mflds = new string[] { "��ҵ���|fld_45_1" };
    types = "011101";
    if (!IsPostBack)
    {
        BindListControl(fld_45_2, "level", "leveltxt", "select distinct fld_45_2 as level,'�� '+cast(fld_45_2 as varchar(10))+' ��' as leveltxt from " + dtable + "");

        if (fld_45_2.Items.Count == 0)
        {
            fld_45_2.Items.Add(new ListItem("�� 1 ��", "1"));
        }
        else
        {
            fld_45_2.Items.Add(new ListItem("�� " + (fld_45_2.Items.Count + 1) + " ��", (fld_45_2.Items.Count + 1).ToString()));
        }

        if (id != "0")
        {
            guangye.BindData(dtable, filter, flds);
        }

        if (fld_45_2.SelectedItem != null && fld_45_2.SelectedItem.Value != "1")
        {
            BindListControl(fld_45_3txt, "uppercode", "uppertxt", "select mocode as uppercode,fld_45_1 as uppertxt from " + dtable + " where fld_45_2=" + (Convert.ToInt32(fld_45_2.SelectedItem.Value) - 1) + "");
        }
        SetFilter(fld_45_3txt, fld_45_3.Value);
    }
}
//����֮ǰ�����ݴ���
public override void BeforeSave()
{
    if (fld_45_2.SelectedItem != null && fld_45_2.SelectedValue != "1" && fld_45_3txt.SelectedItem == null)
    {
        SetSESSION("alert", "ֱ���ϼ�����Ϊ�գ�");
    }

    fld_45_3.Value = (fld_45_3txt.SelectedItem != null) ? fld_45_3txt.SelectedItem.Value : "0";
    if (fld_45_1.Value != "")
    {
        string h_fstr = "";
        if (id != "0")
        {
            h_fstr = " and mocode<>" + id + "";
        }
        DataTable dt = db.GetDataTable(db.ConnStr, "select top 1 mocode from " + dtable + " where fld_45_1='" + fld_45_1.Value + "' and fld_45_3=" + fld_45_3.Value + "" + h_fstr);
        if (dt.Rows.Count > 0)
        {
            SetSESSION("alert", "�Ѵ���ͬ����ҵ���" + fld_45_1.Value);
        }
    }
    if (GetSESSION("alert") != "")
    {
        Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
    }
}    
//�ı�㼶
private void Change_Level(object sender, System.EventArgs e)
{
    fld_45_3txt.Items.Clear();
    if (fld_45_2.SelectedItem != null && fld_45_2.SelectedItem.Value != "1")
    {
        BindListControl(fld_45_3txt, "uppercode", "uppertxt", "select mocode as uppercode,fld_45_1 as uppertxt from " + dtable + " where fld_45_2=" + (Convert.ToInt32(fld_45_2.SelectedItem.Value) - 1) + " and mocode<>" + id);
    }
   
}

//����/����
private void Click_ChangeIndex(object sender, System.EventArgs e)
{
    string idstr = ((Control)sender).ID;
    alertmess.InnerText = ChangeOneTypeIndex(idstr, dtable, "mocode", "fld_45_5", "fld_45_4", "fld_45_3");
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 	
        <td id="tb_6" visible="false" runat="server" style="padding-left: 5px; width: 55px; "
            nowrap>
            <G:Button ID="btn_up" Type="toolbar" Mode="on" Text="ͬ��������" OnClick="Click_ChangeIndex"
                runat="server">
            </G:Button>
        </td>
        <td id="tb_7" visible="false" runat="server" style="padding-left: 5px; width: 55px;"
            nowrap>
            <G:Button ID="btn_down" Type="toolbar" Mode="on" Text="ͬ��������" OnClick="Click_ChangeIndex"
                runat="server">
            </G:Button>
        </td>
	
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	<!--#include file="toolbarright.aspx"-->   
<!--����������-->
<input id="creatorcode" runat="server" type="hidden" />
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
	<tr>
	    <td align="right"  class="td_viewcontent_title">��ҵ���</td>
	    <td colspan="3" class="td_viewcontent_content"><input id="fld_45_1" style="width:95%;" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
		<td width="100" align="right"  class="td_viewcontent_title">�㼶:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList id="fld_45_2" AutoPostBack=true OnSelectedIndexChanged="Change_Level"  style="width:95%;"  runat="server" /></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">ֱ���ϼ�:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_45_3" type="hidden" runat="server">
		<asp:DropDownList id="fld_45_3txt" style="width:95%;"  runat="server" />
		</td>
	</tr>	
</table>
<!--��̬���ɽ���-->
</form>
</body>
</html>