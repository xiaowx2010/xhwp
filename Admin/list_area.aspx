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
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 
        string h_where = "";
        if (!IsPostBack)
        {
            BindListControl(select_area, "AreaCode", "AreaName", "select areacode,areaname,areaindex from gmis_area where areastate='����' and arealevel=1 order by areaindex", "��������");
            if (h_mlevel != "0")
            {
                SetFilter(select_area, h_mlevel);
                BindListControl(select_street, "AreaCode", "AreaName", "select areacode,areaname,areaindex from gmis_area where areastate='����' and areauppercode=" + h_mlevel + " order by areaindex", "���нֵ�");
                SetFilter(select_street, "0");
            }
            else
            {
                SetFilter(select_area, "0");
                select_street.Items.Add(new ListItem("���нֵ�", "0"));
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
        //����ǰҳ����		
        DataRow dr = dt.Rows[rowi];
        if (mua.IndexOf(";3;") != -1)
        {
            dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["areacode"].ToString() + "&navindex=" + navindex + "&pid="+pid+"\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
        }

        if (mua.IndexOf(";4;") != -1)
        {
            dr["btnstr"] += "<a href=\"javascript:if(confirm('ȷ��ɾ����')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["areacode"].ToString() + "&navindex=" + navindex + "&pid="+pid+"';}\"><img src=\"images/icons/tb03.gif\" title=\"ɾ��\" align=\"absmiddle\" border=\"0\"></a>";
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
        <!--ѡ�-->
        <!--ѡ�-->
        <!--����������-->
        <!--#include file="toolbarleft.aspx"-->
        <td style="padding-left:5px;">
			<table  border="0" cellspacing="0" cellpadding="0" align="left">
				<tr>
					<td class="font_blackcolor_B" nowrap>ѡ�����أ�</td>
					<td>
						<asp:DropDownList ID="select_area" OnSelectedIndexChanged="Area_Change"  AutoPostBack="true" Style="width: 120px;" runat="server" />
					</td>
				</tr>
			</table>
		</td>
		<td style="padding-left:5px;">
			<table  border="0" cellspacing="0" cellpadding="0" align="left">
				<tr>
					<td class="font_blackcolor_B" nowrap>ѡ��ֵ���</td>
					<td><asp:DropDownList ID="select_street" AutoPostBack="true" OnSelectedIndexChanged="Street_Change" Style="width: 100px" runat="server" /></td>
					
				</tr>
			</table>
		</td>
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbar.aspx"-->
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbarright.aspx"-->
        <!--����������-->
        <G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
            <G:Template id="listtemphead" type="head" runat="server">
                <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
                    <tr class="tr_listtitle">
                        <td>&nbsp;</td>
                        <td width="55%" align="left">
                            ��������</td>
                        <td width="20%" align="left">
                            ֱ���ϼ�</td>
                        <td width="8%" align="left">
                            ����</td>
                        <td width="8%" align="left">
                            ״̬</td>
                        <td width="8%" align="center">
                            ����</td>
                            
                    </tr>
            </G:Template>
            <G:Template id="listtemp1" runat="server">
                <tr class="tr_listcontent">
                    <td>
                        &nbsp;</td>
                    <td align="left">
                        *<a title="�鿴��ϸ" href="view_area.aspx?aid=*&mid=*&id=*&navindex=*">*</a></td>
                    <td align="left">
                        <a title="�鿴��ϸ" href="view_area.aspx?aid=*&mid=*&id=*&navindex=*">*</a></td>
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
