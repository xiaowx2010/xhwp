<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<script language="c#" runat="server">
    string pid2, lstr, fcode, orgcode;
    private void Page_Load(object sender, System.EventArgs e)
    {
        string doback = GetQueryString("doback", "0");
        fcode = GetQueryString("fcode", "");
        if (doback == "1")
        {
            Page.RegisterStartupScript("popwin", "<scrip" + "t>parent.window.__doPostBack('btn_backlist$btn','');opener=null;window.close();</s" + "cript>");//parent.location.href=parent.location.href+\"&doback=1\";
        }
        else
        {
            orgcode = GetQueryString("orgcode", ""); //单位代码
            mid = GetQueryString("mid", "0");
            navindex = GetQueryString("navindex", "0");
            //企业基本信息按钮
            id = GetQueryString("id", "0");
            //string hycode = GetQueryString("hycode", "0");
            string hycode = GetSESSION("hycode");
            HtmlTableCell cell = new HtmlTableCell();
            Guangye.WebApplication.Controls.Button btn = new Guangye.WebApplication.Controls.Button();
            btn.ID = "btn_bs_1199";
            btn.Text = "企业基本信息";
            btn.Type = "tab";
            btn.Mode = (mid == "1199") ? "on" : "off";
            lstr = StringUtility.StringToBase64(orgcode);
            string viewstr = StringUtility.StringToBase64("view");
            btn.Url = "javascript:Click_URL_qiyejibenxinxi('view_1199.aspx?aid=dmlldw==&mid=1199&id=" + id + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + hycode + "&navindex=" + navindex + "&fcode=" + fcode + "');";
            cell.Controls.Add(btn);
            tabs.Rows[0].Cells.Add(cell);
            
            //企业基本信息按钮
           
            
            if (GetQueryString("mid", "0") == GetFirstRightModule(mid)) td_map.Visible = true;
            db.SqlString = "select modulename,modulecode from gmis_module where moduleindex like '0.001001%' and modulestate=0 and modulecode in (select modulecode from gmis_field where caption='单位代码') and modulecode not in (19,58) order by moduleindex";
      
            DataTable dt = db.GetDataTable();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    
                    AddTab(dr["modulecode"].ToString(), dr["modulename"].ToString().ToUpper());
                }
            }
            //AddTab("1199", "企业基本信息");
        }
        if (fcode != "")
            td_map.Visible = false;
    }
    private void AddTab(string tabcode, string tabname)
    {
        mid = GetQueryString("mid","0");
        if (tabcode != "658")
        {
            HtmlTableCell cell0 = new HtmlTableCell();
            cell0.InnerText = (tabcode == "658" || tabcode == "730" || tabcode == "988" || tabcode == "995" || tabcode == "1002" || tabcode == "1022" || tabcode == "834" || tabcode == "848" || tabcode == "866" || tabcode == "1016") ? "" : "|";
            cell0.Width = "11";
            cell0.Align = "center";
            tabs.Rows[0].Cells.Add(cell0);
        }
        HtmlTableCell cell = new HtmlTableCell();
        Guangye.WebApplication.Controls.Button btn = new Guangye.WebApplication.Controls.Button();
        btn.ID = "btn_bs_" + tabcode;
        btn.Text = tabname;
        btn.Type = "tab";
        btn.Mode = (tabcode == mid) ? "on" : "off";
        lstr = StringUtility.StringToBase64(orgcode);
        string viewstr = StringUtility.StringToBase64("view");
        btn.Url = "javascript:Click_URL('" + tabcode + "','" + lstr + "','" + viewstr + "','" + navindex + "','"+fcode+"');";
        cell.Controls.Add(btn);
        tabs.Rows[0].Cells.Add(cell);
    }
    private string GetModuleUpper(string mid)
    {
        db.SqlString = "select modulecode,moduleuppercode,modulelevel from gmis_module where modulecode=" + mid;

        DataTable dt = db.GetDataTable();
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["modulelevel"].ToString() == "3")
            {
                return mid;
            }
            else
            {
                mid = dt.Rows[0]["moduleuppercode"].ToString();
                return GetModuleUpper(mid);
            }

        }
        else  return "";
    }
    private void Click_Map(object sender, System.EventArgs e)
    {
        string strscript;
        strscript = "<scri" + "pt>javascript:__doOpenView('pop_dopmap_658.aspx?mid=" + GetQueryString("mid", "0") + "&orgcode=" + lstr + "&fcode=" + fcode + "',600,300,10,10);</scri" + "pt>";
        Page.RegisterStartupScript("popwin",strscript);
    }
</script>
<script language="javascript">
function Click_URL(str1,str2,str3,str4,str5)
{
    parent.location.href ="view_"+str1+".aspx?aid="+str3+"&mid=" + str1 + "&orgcode=" +str2+ "&navindex="+str4+"&fcode="+str5;
    form1.submit();
}
function Click_URL_qiyejibenxinxi(str1)
{
    parent.location.href =str1;
    form1.submit();
}
function srcollLeft()
{
    document.getElementById("demo").scrollLeft-=500;
}
function srcollRight()
{
    document.getElementById("demo").scrollLeft+=500;
}
function _resize()
{
	document.getElementById("demo").style.width=document.body.clientWidth-30;
	parent.document.getElementById("companyname").innerText=document.getElementById("namevalue").value;   
}
</script>
<body onload="_resize()" onresize="_resize()" >
    <form id="form1" runat="server">
    <table width="100%" width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td width="85%" valign="middle">
                <table id="tbContaner" width="100%">
                    <tr>
                        <td valign="middle" align="center" width="2%" height="25">
                            <img src="images/j_left.gif" width="5" height="9" style="cursor: hand;" onclick="srcollLeft();" />
                        </td>
                        <td>
                            <div id="demo" style="height: 25px; width: 690px; overflow: hidden; margin-left: 5px">
                                <table id="tabs" runat="server" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td valign="middle" align="center" width="2%" height="25">
                            <img src="images/j_right.gif" width="5" height="9" style="cursor: hand;" onclick="srcollRight();" />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="15%" align="right" id="td_map" runat="server" visible="false">
                <G:Button id="btn_map" mode="on" type="toolbar" text="录入地图数据按钮" onclick="Click_Map"
                    runat="server">
                </G:Button>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
