<!--污染源基本信息选项卡-->
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
string hycode="";
    private void Page_Load(object sender, System.EventArgs e)
    {
        mid = GetQueryString("mid", "0");
        string orgcode = GetQueryString("orgcode", "");
		hycode = GetQueryString("hycode", "");


		DataTable h_dt = db.GetDataTable(db.ConnStr,"select fld_1202_25 from gmis_mo_1202 where fld_1202_2='"+orgcode+"'");
		
		DataTable h_dtindex = db.GetDataTable(db.ConnStr,"select moduleIndex from gmis_module where modulecode=40");
		String h_index = h_dtindex.Rows[0][0].ToString();
		//Response.Write(h_index);
//
			//===========
			
			HtmlTableCell cell1 = new HtmlTableCell();
			Guangye.WebApplication.Controls.Button btn1 = new Guangye.WebApplication.Controls.Button();
			btn1.ID = "btn_bs_1199";
			btn1.Text = "09年数据";
			btn1.Type = "tab";
			btn1.Mode = (mid == "11919") ? "on" : "off";

			btn1.Url = "javascript:Click_URL('view_1199.aspx?aid=dmlldw==&isNew=1&is10=1&mid=1199&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode="+StringUtility.StringToBase64(hycode)+"');";
			cell1.Controls.Add(btn1);
			tabs.Rows[0].Cells.Add(cell1);


			HtmlTableCell cell0 = new HtmlTableCell();
			cell0.InnerText = "|";
			cell0.Width = "11";
			cell0.Align = "center";
			tabs.Rows[0].Cells.Add(cell0);

			HtmlTableCell cell10 = new HtmlTableCell();
			Guangye.WebApplication.Controls.Button btn10 = new Guangye.WebApplication.Controls.Button();
			btn10.ID = "btn_bs_1199_10";
			btn10.Text = "10年数据";
			btn10.Type = "tab";
			btn10.Mode = (mid == "11919") ? "on" : "off";

			btn10.Url = "javascript:Click_URL('view_1199_10.aspx?aid=dmlldw==&isNew=1&is10=1&mid=1199&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode="+StringUtility.StringToBase64(hycode)+"');";
			cell10.Controls.Add(btn10);
			tabs.Rows[0].Cells.Add(cell10);

			HtmlTableCell cell01 = new HtmlTableCell();
			cell01.InnerText = "|";
			cell01.Width = "11";
			cell01.Align = "center";
			tabs.Rows[0].Cells.Add(cell01);
			
			HtmlTableCell cell = new HtmlTableCell();
			Guangye.WebApplication.Controls.Button btn = new Guangye.WebApplication.Controls.Button();
			btn.ID = "btn_bs_1199";
			btn.Text = "企业基本信息";
			btn.Type = "tab";
			btn.Mode = (mid == "1199") ? "on" : "off";

			btn.Url = "javascript:Click_URL('view_1199.aspx?aid=dmlldw==&mid=1199&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode="+StringUtility.StringToBase64(hycode)+"');";
			cell.Controls.Add(btn);
			tabs.Rows[0].Cells.Add(cell);
			//=============
			//此栏目本身栏目
        if (h_dt.Rows.Count>0)
		{
			if (h_dt.Rows[0]["fld_1202_25"].ToString()!="")
			{
				DataTable h_zdt = db.GetDataTable(db.ConnStr,"select modulecode,moduleurl from gmis_module where moduleurl<>'' and moduleindex like '"+h_index+"%' and modulecode in ("+h_dt.Rows[0]["fld_1202_25"].ToString()+")");
				foreach (DataRow zdr in h_zdt.Rows)
				{

					AddTab(zdr["modulecode"].ToString(),zdr["moduleurl"].ToString(),orgcode);
				}
			}
		}
		
		
    }


    private void AddTab(string modulecode,string moduleurl,string orgcode)
    {   

		HtmlTableCell cell0 = new HtmlTableCell();
		cell0.InnerText = "|";
		cell0.Width = "11";
		cell0.Align = "center";
		tabs.Rows[0].Cells.Add(cell0);
       
        HtmlTableCell cell = new HtmlTableCell();
        Guangye.WebApplication.Controls.Button btn = new Guangye.WebApplication.Controls.Button();
        btn.ID = "btn_bs_" + modulecode;
        btn.Text = moduleurl.ToUpper();
        btn.Type = "tab";
        btn.Mode = (modulecode == mid) ? "on" : "off";
        string viewstr =StringUtility.StringToBase64("view");
		
		btn.Url = "javascript:Click_URL('view_"+ modulecode + ".aspx?aid=dmlldw==&mid=" + modulecode + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode="+StringUtility.StringToBase64(hycode)+"');";	    

        cell.Controls.Add(btn);
        tabs.Rows[0].Cells.Add(cell);
    }

</script>
                    
<script language="javascript">

function Click_URL(str1)
{

	parent.location.href = str1;
}
function _resize()
{
	document.getElementById("demo").style.width=document.body.clientWidth-30;
	parent.document.getElementById("companyname").innerText=document.getElementById("namevalue").value;   
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

<body onload="_resize()" onresize="_resize()" >
<input id="namevalue"  runat="server" type="hidden" />
    <form id="form1" runat="server">
    <table width="100%" cellpadding="0"cellspacing="0" border="0">
        <tr>
            <td valign="middle" >
                    <table id="tbContaner" width="100%">
                        <tr>
                            <td valign="middle" align="center" width="2%" height="25"><img src="images/j_left.gif" width="5" height="9" style="cursor: hand;" onclick="srcollLeft();" /></td>
                            <td>
                                <div id="demo" style="height: 25px; width:690px; overflow: hidden; margin-left: 5px">
                                    <table id="tabs" runat="server" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td >
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
