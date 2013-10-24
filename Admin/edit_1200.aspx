<!--行业代码（统一）,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string upsonid = "";
private void Page_Load(object sender, System.EventArgs e)
{

    //SetToolBar();//设置工具条,同时获取固定URL参数 
    mid = GetQueryString("mid", "0");
    aid = GetQueryString("aid", "edit");
    id = GetQueryString("id", "0");
    upsonid = GetQueryString("upsonid", "0");  //所属上级子项
    tabid = GetQueryString("tabid", "0");

    td_btn_newsubson.Visible = false;
    td_btn_deleteson.Visible = false;
    td_btn_newson.Visible = false;
    tb_btn_clear.Visible = true;

    dtable = "gmis_mo_1200";
    filter = "mocode=" + id;
    flds = new string[] { "fld_1200_1", "fld_1200_2", "fld_1200_3", "fld_1200_4", "fld_1200_7", "fld_1200_8" };
    string[] vflds = new string[] { "fld_1200_1", "fld_1200_2", "fld_1200_3", "fld_1200_4", "fld_1200_7", "fld_1200_8" };
    types = "011100";
    
    if (GetSESSION("alert") != "")
    {
        alertmiddle.InnerText = GetSESSION("alert");
        SetSESSION("alert", "");
    }

    if (!IsPostBack)
    {
        //fld_1200_3.Items.Clear();
        BindListControl(fld_1200_3, "fld_1200_3", "fld_1200_3_index", "select distinct fld_1200_3,('第 '+cast(fld_1200_3 as varchar(10))+' 级') as fld_1200_3_index from gmis_mo_1200");
        if (fld_1200_3.Items.Count == 0)
        {
            fld_1200_3.Items.Add(new ListItem("第 1 级", "1"));
        }
        else
        {
            fld_1200_3.Items.Add(new ListItem("第 " + (fld_1200_3.Items.Count + 1) + " 级", Convert.ToString(fld_1200_3.Items.Count + 1)));
        }

        if (id != "0")
        {
            guangye.BindData(dtable, filter, flds, vflds);
            BindListControl(fld_1200_4, "mocode", "fld_1200_1", "select mocode,fld_1200_1 from gmis_mo_1200 where fld_1200_3=" + (Convert.ToInt32(fld_1200_3.SelectedItem.Value) - 1));
            guangye.BindData(dtable, filter, flds, vflds);
        }
        if (upsonid != "0")
        {
            SetFilter(fld_1200_3, GetSonLevel(upsonid));
            BindListControl(fld_1200_4, "mocode", "fld_1200_1", "select mocode,fld_1200_1 from gmis_mo_1200 where fld_1200_3=" + (Convert.ToInt32(fld_1200_3.SelectedItem.Value) - 1));
            SetFilter(fld_1200_4, upsonid);
        }
    }
 }

    public void CheckSave()
    {
        if (GetSESSION("alert").Length == 0)
        {
            db.SqlString = "select mocode from gmis_mo_1200 where mocode!="+id+" and (fld_1200_1=='"+fld_1200_1.Value+"' or fld_1200_8='"+fld_1200_8.Value+"')";
            if (db.GetDataTable().Rows.Count > 0)
            {
                SetSESSION("alert", GetSESSION("alert") + "行业名称和行业代码不能重复；");
            }
        }
         
    }

    private void change_level(object sender,System.EventArgs e)
    {
        BindListControl(fld_1200_4, "mocode", "fld_1200_1", "select mocode,fld_1200_1 from gmis_mo_1200 where fld_1200_3=" + (Convert.ToInt32(fld_1200_3.SelectedItem.Value) - 1)+" and mocode<>"+id);
    }
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar_1200.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->

<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:10px;">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title"><font color="#ff6600">*</font>行业名称:</td>
		<td colspan="3" class="td_viewcontent_content"><input id="fld_1200_1" class="boxbline" style="width:98%;" maxlength="50" runat="server" ></td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title"><font color="#ff6600">*</font>行业代码:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1200_8" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		<td width="100" align="right"  class="td_viewcontent_title">属性:</td>
		<td class="td_viewcontent_content" style="width:35%">
		    <asp:DropDownList runat="server" ID="fld_1200_2" Width="160">
		        <%--<asp:ListItem Value="0">全部</asp:ListItem>--%>
		        <asp:ListItem Value="1">工业源</asp:ListItem>
		        <asp:ListItem Value="2">生活源</asp:ListItem>
				<asp:ListItem Value="3">集中式污染治理设施</asp:ListItem>
		    </asp:DropDownList>
		</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">层级:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList runat="server" ID="fld_1200_3" Width="160" AutoPostBack="true" OnSelectedIndexChanged="change_level"></asp:DropDownList></td>
		<td width="100" align="right"  class="td_viewcontent_title">直属上级:</td>
		<td class="td_viewcontent_content" style="width:35%"><asp:DropDownList runat="server" ID="fld_1200_4" Width="160"></asp:DropDownList></td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">分类说明:</td>
		<td colspan="3" class="td_viewcontent_content" ><TextArea id="fld_1200_7" class="boxbline" style="width:98%;height:293px;" runat="server" ></TextArea></td>
		</tr>
	</table>
<!--动态生成html,结束-->
</form>
</body>
</html>
