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
    string orgcode; bool flag = true;
    private void Page_Load(object sender, System.EventArgs e)
    {
        //Response.Write(Request.QueryString["orgcode"].ToString());     
        orgcode = GetQueryString("orgcode", ""); //Response.Write(orgcode);
        mid = GetQueryString("mid", "0");
        //此栏目本身栏目
        //AddTab("17", "污染源基本情况管理","0");
        db.SqlString = "select modulename,modulecode from gmis_module where  modulecode in (select modulecode from gmis_mo_1197 where orgcode='" + orgcode + "')";
        //Response.Write(db.SqlString);
        DataTable dt = db.GetDataTable();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                AddTab(dr["modulecode"].ToString(), dr["modulename"].ToString().ToUpper(), Check_DataCount(dr["modulecode"].ToString()));
            }
        }
    }

    private void AddTab(string tabcode, string tabname,string judgestr)
    {

        mid = GetQueryString("mid", "0");        
        if (flag)
        {
            flag = false;
        }
        else
        {
            HtmlTableCell cell0 = new HtmlTableCell();
            cell0.InnerText = "|";
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
        string codestr = StringUtility.StringToBase64(orgcode);
        string viewstr = StringUtility.StringToBase64("view");
        string strcount = "1";
        if (judgestr == "1") strcount = "2";
         btn.Url = "javascript:Click_URL('" + tabcode + "','" + codestr + "','" + viewstr + "','"+strcount+"');"; //Response.Write(codestr);
        cell.Controls.Add(btn);
        tabs.Rows[0].Cells.Add(cell);
    }
    private string Check_DataCount(string midstr)
    {
        db.SqlString = "select orgcode from gmis_mo_1197 where orgcode='"+orgcode+"' and modulecode="+midstr+"";
        DataTable dt = db.GetDataTable();
        if (dt.Rows.Count > 1) return "1";
        else return "0";
    }
</script>

<script language="javascript" defer>

document.getElementById("demo").style.width=this.clientWidth-100;
function Click_URL(str1,str2,str4,str3)
{
if(str3=="1")
  parent.location.href ="view_"+str1+".aspx?aid="+str4+"&mid=" + str1 + "&orgcode=" +str2;//alert(parent.location.href);
 else parent.location.href ="list_0_17.aspx?aid="+str4+"&mid=" + str1 + "&orgcode=" +str2;//alert(parent.location.href);


}  
function srcollLeft()
{
    document.getElementById("demo").scrollLeft-=500;
}
function srcollRight()
{
    document.getElementById("demo").scrollLeft+=500;
}
</script>

<body>
    <form id="form1" runat="server">
    <table width="100%" cellpadding="0"cellspacing="0" border="0" class="td_graybgcolor">
        <tr>
            <td valign="middle" >
                    <table width="700" >
                        <tr>
                            <td valign="middle" align="center" width="2%" height="25"><img src="images/j_left.gif" width="5" height="9" style="cursor: hand;" onclick="srcollLeft();" /></td>
                            <td width="80%">
                                <div id="demo" style="height: 25px; width:690px; overflow: hidden; margin-left: 5px">
                                    <table id="tabs" runat="server" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                            <td valign="middle" align="center" width="2%" height="25"><img src="images/j_right.gif" width="5" height="9" style="cursor: hand;" onclick="srcollRight();" /></td>
                        </tr>
                    </table>
            </td>           
        </tr>
    </table>
    </form>
</body>
</html>
