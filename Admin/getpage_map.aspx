<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script runat="server" language="C#">
	private void Page_Load(object sender, System.EventArgs e)
	{	
        string fcode=GetQueryString("fcode", "0");
        mid = GetQueryString("mid", "0");//所属模块
        

       //SetSESSION("fmid", mid);
        //从关联表获取数据编号
	    db.SqlString="select datamocode,orgcode,tradecode,modulecode from gmis_mo_1197 where featurecode="+fcode+" and modulecode="+mid+"";

        SetSESSION("frommap", "1");

        DataTable dt=db.GetDataTable();
        if(dt!=null&&dt.Rows.Count>0)
        {
            switch (dt.Rows[0]["modulecode"].ToString())
            {
                case "17"://污染源基本情况
                    Response.Redirect("view_17.aspx?mid=" + dt.Rows[0]["modulecode"].ToString() + "&orgcode=" + StringUtility.StringToBase64(dt.Rows[0]["orgcode"].ToString()) + "&fcode=" + fcode+"&mapv=1");
                    break;
                case "37"://水监测数据管理
                    Response.Redirect("view_37.aspx?mid=" + dt.Rows[0]["modulecode"].ToString() + "&orgcode=" + StringUtility.StringToBase64(dt.Rows[0]["orgcode"].ToString()) + "&fcode=" + fcode + "&mapv=1");
                    break;
                case "1201"://区域
                    iframe.Attributes.Add("src", "pop_map_1201.aspx?mid=" + dt.Rows[0]["modulecode"].ToString() + "&orgcode=" + StringUtility.StringToBase64(dt.Rows[0]["orgcode"].ToString()) + "&fcode=" + fcode + "&mapv=1");
                    break;
                default://全国污染源普查
                    Response.Redirect("view_1199.aspx?mid=1199&orgcode=" + StringUtility.StringToBase64(dt.Rows[0]["orgcode"].ToString()) + "&hycode=" + dt.Rows[0]["tradecode"].ToString() + "&fcode=" + fcode + "&mapv=1");
                    break;
            }
	    }
	}
</script>
<body>
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--动态生成html,开始-->

    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <img src="images/tcy_001.jpg" width="600" height="100">
            </td>
        </tr>
    </table>
    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="424" valign="top" background="images/tcy_002.jpg" style="padding: 40px 30px 0px 30px;">
                <iframe id="iframe" runat="server" frameborder="0" width="100%" height="400"></iframe>
            </td>
        </tr>
    </table>
    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="36" bgcolor="#2ee3db">
                &nbsp;
            </td>
        </tr>
    </table>


</form>
</body>
</html>