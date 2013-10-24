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
    string pid2,lstr,fcode;
    private void Page_Load(object sender, System.EventArgs e)
    {
        pid2 = GetQueryString("pid2","0");
        //Response.Write(pid2+"<br>");
        mid = GetQueryString("mid","0");
        fcode = GetQueryString("fcode", "");
        //企业基本信息按钮
        id = GetQueryString("id", "0");
        string hycode = GetQueryString("hycode", "");
        HtmlTableCell cell = new HtmlTableCell();
        Guangye.WebApplication.Controls.Button btn = new Guangye.WebApplication.Controls.Button();
        btn.ID = "btn_bs_1199";
        btn.Text = "企业基本信息";
        btn.Type = "tab";
        btn.Mode = (mid == "1199") ? "on" : "off";
        lstr = StringUtility.StringToBase64(pid2);
        string viewstr = StringUtility.StringToBase64("view");
        btn.Url = "javascript:Click_URL_qiyejibenxinxi('view_1199.aspx?aid=dmlldw==&mid=1199&id="+id+"&pid2="+StringUtility.StringToBase64(pid2)+"&hycode="+hycode+"&fcode="+fcode+"');";
        cell.Controls.Add(btn);
        tabs.Rows[0].Cells.Add(cell);
        //企业基本信息按钮
        
        mid=GetModuleUpper(mid);
        if (GetQueryString("mid", "0") == GetFirstRightModule(mid)) td_map.Visible = true;
        db.SqlString = "select moduleurl,modulecode from gmis_module where modulecode not in (17,1202) and moduleurl<>'' and modulecode in(select modulecode from gmis_mo_1197 where orgcode='" + pid2 + "')";
        
        DataTable dt = db.GetDataTable();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                AddTab(dr["modulecode"].ToString(), dr["moduleurl"].ToString().ToUpper());
                //Response.Write(dr["modulecode"].ToString());
            } 
        }
             if(fcode!="")
                 td_map.Visible =false;
    }
    private void AddTab(string tabcode, string tabname)
    {
        mid = GetQueryString("mid","0");
            HtmlTableCell cell0 = new HtmlTableCell();
            cell0.InnerText =  "|";
            cell0.Width = "11";
            cell0.Align = "center";
            tabs.Rows[0].Cells.Add(cell0);
        
        HtmlTableCell cell = new HtmlTableCell();
        Guangye.WebApplication.Controls.Button btn = new Guangye.WebApplication.Controls.Button();
        btn.ID = "btn_bs_" + tabcode;
        btn.Text = tabname;
        btn.Type = "tab";
        btn.Mode = (tabcode == mid) ? "on" : "off";
        lstr = StringUtility.StringToBase64(pid2);
        string viewstr = StringUtility.StringToBase64("view");
        btn.Url = "javascript:Click_URL('"+tabcode+"','"+lstr+"','"+viewstr+"','"+fcode+"');";
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
        strscript="<scri"+"pt>javascript:__doOpenView('pop_dopmap.aspx?mid="+GetQueryString("mid","0")+"&pid2="+lstr+"',600,300,10,10);</scri"+"pt>";
        Page.RegisterStartupScript("popwin",strscript);
    }
</script>
<script language="javascript">
function Click_URL(str1,str2,str4,str3)
{
    parent.location.href ="view_"+str1+".aspx?aid="+str4+"&mid=" + str1 + "&pid2=" +str2+ "&fcode="+str3;
    form1.submit();
}
function Click_URL_qiyejibenxinxi(str1)
{
    parent.location.href =str1;
    form1.submit();
}
</script>
<body>
    <form id="form1" runat="server">
        <table width="100%" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
    <td width="85%">
        <div id="demo" style="height:25px;overflow:hidden; margin-left:5px">
        <table id="tabs" runat="server"  cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    
                </td>
            </tr>
        </table>
        </div>
    </td>
    <td width="15%" align="right" id="td_map" runat="server" visible="false"><G:Button  id="btn_map"   mode="on" type="toolbar" text="录入地图数据按钮" onclick="Click_Map" runat="server"></G:Button></td>
</tr>
</table>
    </form>
</body>
</html>
