<!--���ݹ���-�ֶ�ģ��-������ҵ-->
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
	dtable = "gmis_Mo_46";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_46_1", "fld_46_2", "fld_46_3", "fld_46_4", "fld_46_5", "creatorcode" };
    mflds = new string[] { "��ҵ����|fld_46_1" };
    types = "001111";
    if (!IsPostBack)
    {
        //fld_46_3.Items.Add(new ListItem("��ѡ��", "0"));
        
        BindListControl(fld_46_4, "mocode", "fld_45_1", "select mocode,fld_45_1 from gmis_mo_45 where fld_45_2=1", "��ѡ����ҵ����");
        SetFilter(fld_46_4,"0");

        if (id != "0")
        {
            fld_46_5.Value = "0";
            guangye.BindData(dtable, filter, flds);
        }

        if (fld_46_4.SelectedItem != null && fld_46_4.SelectedItem.Value != "0")
            BindListControl(fld_46_5_sel, "mocode", "fld_45_1", "select mocode,fld_45_1 from gmis_mo_45 where fld_45_3=" + fld_46_4.SelectedItem.Value, "��ѡ����ҵС��");
        else
            fld_46_5_sel.Items.Add(new ListItem("��ѡ����ҵС��","0"));

        SetFilter(fld_46_5_sel, fld_46_5.Value);
    }
}
      
//�ı�㼶
private void Change_Level(object sender, System.EventArgs e)
{
    fld_46_5_sel.Items.Clear();
    if (fld_46_4.SelectedItem != null && fld_46_4.SelectedItem.Value != "0")
    {
        BindListControl(fld_46_5_sel, "mocode", "fld_45_1", "select mocode,fld_45_1 from gmis_mo_45 where fld_45_3=" + fld_46_4.SelectedItem.Value, "��ѡ����ҵС��");
        SetFilter(fld_46_5_sel, "0");
    }
}
//����֮ǰ�����ݴ���
public override void BeforeSave()
{
    fld_46_5.Value = (fld_46_5_sel.SelectedItem != null) ? fld_46_5_sel.SelectedItem.Value : "0";

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
	    <td align="right"  class="td_viewcontent_title"><font color="#ff6600">*</font>��ҵ���ƣ�</td>
	    <td class="td_viewcontent_content"><input id="fld_46_1" class="boxbline" type="text" runat="server" /></td>
        <td align="right"  class="td_viewcontent_title">��ҵ���룺</td>
	    <td class="td_viewcontent_content"><input id="fld_46_2" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
		<td width="100" align="right"  class="td_viewcontent_title">��ҵ���ࣺ</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList id="fld_46_4" AutoPostBack=true OnSelectedIndexChanged="Change_Level"  style="width:95%;"  runat="server" /></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">��ҵС��:</td>
		<td class="td_viewcontent_content" style="width:35%"><input type="hidden" id="fld_46_5" runat="server" /><asp:DropDownList id="fld_46_5_sel" style="width:95%;"  runat="server" /></td>
	</tr>	
</table>
<!--��̬���ɽ���-->
</form>
</body>
</html>