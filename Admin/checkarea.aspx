<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script runat="server" language="C#">
    string[] bflds;
    SqlDB DBsql = new SqlDB();
    private void Page_Load(object sender, System.EventArgs e)
    {
        usergroupcode.Value = GetQueryString("gid", "0");
        dtable = "gmis_arearight";
        flds = new string[] { "usergroupcode", "areacode", "rightcontent" };
        bflds = new string[] { "rightcontent" };
        types = "110";
        if (!IsPostBack)
        {
            //先绑定列表
            SqlDB DBsql = new SqlDB();
            DBsql.SqlString = "select areaindex,areaname,arealevel from gmis_area where areastate='启用' and arealevel<2 order by areaindex asc";
            DataTable dt = DBsql.GetDataTable();
            string spacestr = "";
            foreach (DataRow dr in dt.Rows)
            {
                spacestr = "";
                for (int i = 0; i < Convert.ToInt32(dr["arealevel"]); i++)
                {
                    spacestr += ">>";
                }
                dr["areaname"] = spacestr + dr["areaname"].ToString();
            }
            BindListControl(areaindex, "areaindex", "areaname", dt);
            string sfield = (areaindex.SelectedItem != null) ? areaindex.SelectedItem.Value : "";

            SelectUsedAction();
            if (usergroupcode.Value != "0" && sfield != "")
            {
                areaindex.AutoPostBack = true;
                BindAreaRight();
            }
            else
            {
                areaindex.AutoPostBack = false;
                savebtn.Visible = false;
            }
        }
    }

    private string GetMatchPK()
    {
        SqlDB db = new SqlDB();
        db.SqlString = "select arearightcode from gmis_arearight " + filter;
        if (db.GetDataTable().Rows.Count > 0)
        {
            return "1";
        }
        else
        {
            return "0";
        }
    }

    private void SelectUsedAction()
    {
        if (areaindex.SelectedItem != null)
        {
            iscover.Checked = false;
            BindListControl(areacontent, "areacode", "areaname", "select areacode,areaname from gmis_area where arealevel=(select arealevel from gmis_area where areaindex='" + areaindex.SelectedValue + "')+1 and  areaindex like '%" + areaindex.SelectedValue + "%' order by areaindex");
        }
    }

    private void Index_Changed(object sender, System.EventArgs e)
    {
        if (usergroupcode.Value != "0")
        {
            string sfield = (areaindex.SelectedItem != null) ? areaindex.SelectedItem.Value : "";
            SelectUsedAction();
            if (usergroupcode.Value != "0" && sfield != "")
            {
                BindAreaRight();
            }
        }
    }
    private void BindAreaRight()
    {
        DBsql.SqlString = "select a.areacode from gmis_arearight a left outer join gmis_area b on a.areacode=b.areacode where a.usergroupcode=" + usergroupcode.Value + " and b.areaindex like '%" + areaindex.SelectedItem.Value + "%' and ';'+a.rightcontent+';' like ';1;'";
        DataTable DTsql = new DataTable();
        DTsql = DBsql.GetDataTable();
        string areastr = "";
        foreach (DataRow dr in DTsql.Rows)
        {
            areastr += dr["areacode"].ToString() + ",";
        }
        if (areastr != "") areastr = "," + areastr;
        for (int i = 0; i < areacontent.Items.Count; i++)
        {
            if (areastr.IndexOf("," + areacontent.Items[i].Value + ",") != -1)
                areacontent.Items[i].Selected = true;
        }
    }
    private void Save_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        string sfield = (areaindex.SelectedItem != null) ? areaindex.SelectedItem.Value : "0";
        StringBuilder sb = new StringBuilder();
        if (usergroupcode.Value != "" && usergroupcode.Value != "0")
        {
            sb.Append("Update gmis_arearight set rightcontent='' where usergroupcode=" + usergroupcode.Value + ";");

            for (int i = 0; i < areacontent.Items.Count; i++)
            {
                if (areacontent.Items[i].Selected)
                {
                    filter = " where usergroupcode=" + usergroupcode.Value + " and areacode=" + areacontent.Items[i].Value;
                    if (GetMatchPK() == "1")
                        sb.Append("Update gmis_arearight set rightcontent='1' " + filter + ";");
                    else
                    {
                        sb.Append("Insert Into gmis_arearight(areacode,usergroupcode,rightcontent) Values(" + areacontent.Items[i].Value + "," + usergroupcode.Value + ",'1');");
                    }
                }
            }
            if (sb.Length > 0)
            {
                DBsql.SqlString = "begin " + sb.ToString() + " End";
                alert.InnerText = DBsql.TransUpdate();
                CreatAreaControl();
            }
        }

    }
    //选中所有区域
    private void Check_AllArea(object sender, System.EventArgs e)
    {

        if (iscover.Checked)
        {
            for (int i = 0; i < areacontent.Items.Count; i++)
            {
                areacontent.Items[i].Selected = true;
            }
        }
        else
        {
            for (int i = 0; i < areacontent.Items.Count; i++)
            {
                areacontent.Items[i].Selected = false;
            }
        }
    }
</script>
	
<body border="0" style="margin:0px;padding:0px;background-color:#f2f2f2;">
<form id="form1" runat="server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td><img alt="" src="images/spacer.gif" width="0" height="1" /><input id="usergroupcode" type="hidden" runat="server" /></td>
        <td><asp:DropDownList id="areaindex" style="width:200px" OnSelectedIndexChanged="Index_Changed" runat="server"/></td>
        <td><input id="savebtn" type="image" src="images/save.gif" style="width:60px; height:24px; border:0px;" onserverclick="Save_Click" runat="server"/></td>
		<td style="width:132px;"><asp:CheckBox  id="iscover" OnCheckedChanged="Check_AllArea" AutoPostBack="true" text="同时选中所有" runat="server"/></td>
		<td nowrap><div id="alert" style="padding-left:5px;color:red" runat="server"></div></td>
    </tr>
    <tr>
        <td colspan="5" style="width:100%"><asp:CheckBoxList id="areacontent" RepeatDirection="Horizontal" RepeatColumns="5" runat="server"/></td>        
    </tr>
</table>
</form>
</body>
</html>