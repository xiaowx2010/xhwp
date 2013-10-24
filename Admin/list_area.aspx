<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->

<script runat="server" language="C#">
    private void Page_Load(object sender, System.EventArgs e)
    {
        string h_mlevel = GetQueryString("mlevel", "0");
        SetToolBar();//设置工具条,同时获取固定URL参数 
        string h_where = "";
        if (!IsPostBack)
        {
            BindListControl(select_area, "AreaCode", "AreaName", "select areacode,areaname,areaindex from gmis_area where areastate='启用' and arealevel=1 order by areaindex", "所有区域");
            if (h_mlevel != "0")
            {
                SetFilter(select_area, h_mlevel);
                BindListControl(select_street, "AreaCode", "AreaName", "select areacode,areaname,areaindex from gmis_area where areastate='启用' and areauppercode=" + h_mlevel + " order by areaindex", "所有街道");
                SetFilter(select_street, "0");
            }
            else
            {
                SetFilter(select_area, "0");
                select_street.Items.Add(new ListItem("所有街道", "0"));
            }
        }
        if (select_area.SelectedItem != null && select_area.SelectedItem.Value != "" && select_area.SelectedItem.Value != "0")
        {
            if (select_street.SelectedItem != null && select_street.SelectedItem.Value != "0" && select_street.SelectedItem.Value != "")
                h_where = " where a.areauppercode = " + select_street.SelectedItem.Value + "";
            else
                h_where = " where a.areauppercode = " + select_area.SelectedItem.Value + "";
        }
        list.SqlStr = "select '' as spanlength,'" + StringUtility.StringToBase64("view") + "'," + mid + ",a.areacode," + navindex + ",a.areaname,'" + StringUtility.StringToBase64("view") + "'," + mid + ",a.areauppercode," + navindex + ",case when u.areaname is null then '&nbsp;' else u.areaname end,a.arealevel,a.areastate,'&nbsp;' as btnstr,a.arealevel from gmis_area a Left Outer Join gmis_area u on a.areauppercode=u.areacode" + h_where + " order by a.areacode asc";
        list.Rows = GetListRows();
    }
    public override void BeforeOutput(DataTable dt, int rowi)
    {
        //处理当前页数据		
        DataRow dr = dt.Rows[rowi];
        if (mua.IndexOf(";3;") != -1)
        {
            dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["areacode"].ToString() + "&navindex=" + navindex + "&pid="+pid+"\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
        }

        if (mua.IndexOf(";4;") != -1)
        {
            dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["areacode"].ToString() + "&navindex=" + navindex + "&pid="+pid+"';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
        }

    }

    private void Area_Change(object sender, System.EventArgs e)
    {
        string h_mlevel = (select_area.SelectedItem != null) ? select_area.SelectedValue : "0";
        Response.Redirect("list_area.aspx?mid=" + mid + "&mlevel=" + h_mlevel);
    }

    private void Street_Change(object sender, System.EventArgs e)
    {
    }
</script>

<body style="padding:10px;text-align:center">
    <form id="form1" runat="server">
        <!--选项卡-->
        <!--选项卡-->
        <!--操作工具条-->
        <!--#include file="toolbarleft.aspx"-->
        <td style="padding-left:5px;">
			<table  border="0" cellspacing="0" cellpadding="0" align="left">
				<tr>
					<td class="font_blackcolor_B" nowrap>选择区县：</td>
					<td>
						<asp:DropDownList ID="select_area" OnSelectedIndexChanged="Area_Change"  AutoPostBack="true" Style="width: 120px;" runat="server" />
					</td>
				</tr>
			</table>
		</td>
		<td style="padding-left:5px;">
			<table  border="0" cellspacing="0" cellpadding="0" align="left">
				<tr>
					<td class="font_blackcolor_B" nowrap>选择街道：</td>
					<td><asp:DropDownList ID="select_street" AutoPostBack="true" OnSelectedIndexChanged="Street_Change" Style="width: 100px" runat="server" /></td>
					
				</tr>
			</table>
		</td>
        <!--右边固定按钮-->
        <!--#include file="toolbar.aspx"-->
        <!--右边固定按钮-->
        <!--#include file="toolbarright.aspx"-->
        <!--操作工具条-->
        <G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
            <G:Template id="listtemphead" type="head" runat="server">
                <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
                    <tr class="tr_listtitle">
                        <td>&nbsp;</td>
                        <td width="55%" align="left">
                            区域名称</td>
                        <td width="20%" align="left">
                            直属上级</td>
                        <td width="8%" align="left">
                            级别</td>
                        <td width="8%" align="left">
                            状态</td>
                        <td width="8%" align="center">
                            操作</td>
                            
                    </tr>
            </G:Template>
            <G:Template id="listtemp1" runat="server">
                <tr class="tr_listcontent">
                    <td>
                        &nbsp;</td>
                    <td align="left">
                        *<a title="查看明细" href="view_area.aspx?aid=*&mid=*&id=*&navindex=*">*</a></td>
                    <td align="left">
                        <a title="查看明细" href="view_area.aspx?aid=*&mid=*&id=*&navindex=*">*</a></td>
                    <td align="left">
                        *</td>
                    <td align="left">
                        *</td>
                    <td align="center">
                        *</td>
                </tr>
            </G:Template>
            <G:Template id="listtemp2" runat="server">
                <tr class="tr_listcontent">
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </G:Template>
                <G:NavStyle5 ID="NavStyle" PageUrl="getpage.aspx" runat="server"></G:NavStyle5>
            </table>
        </G:ListTable>
    </form>
</body>
</html>
