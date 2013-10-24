<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>

<script runat="server" language="C#">

private void Page_Load(object sender, System.EventArgs e)
{
	
}
//数据导入
private void insert_Click(object sender, EventArgs e)
{
	SqlDB db = new SqlDB();
	string sqlstr = "",sqlcode = "";
	DataTable dt = db.GetDataTable(db.ConnStr,"select modulecode from gmis_module where modulestate=0 and moduleurl<>'' and moduleindex like '%0.002%'");
	DataTable dt1 = db.GetDataTable(db.ConnStr,"select fld_1202_2 from gmis_mo_1202 where fld_1202_25=''");
	foreach (DataRow dr1 in dt1.Rows)
	{
		sqlstr = "";
		sqlcode = "";
		foreach (DataRow dr in dt.Rows)
		{
			DataTable idt = db.GetDataTable(db.ConnStr,"select fld_"+dr[0].ToString()+"_1 as qycode from gmis_mo_"+dr[0].ToString()+"");
			if (idt.Rows.Count>0)
			{
				DataRow[] idr  = idt.Select("qycode = '"+dr1[0].ToString()+"'");
				if (idr.Length>0)
				{
					sqlcode += dr[0].ToString()+",";
				}
			}
		}
		sqlcode = sqlcode.Trim(',');
		if (sqlcode != "")
		{
			sqlstr = "update gmis_mo_1202 set fld_1202_25 = '"+sqlcode+"' where fld_1202_2 = '"+dr1[0].ToString()+"' ";
		}
		Response.Write(sqlstr+"<br>");
	}

}

      
       
</script>
<body>
    <form runat="server">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" style="border-right: #8c9dbe 1px solid;border-top: #8c9dbe 1px solid;border-left: #8c9dbe 1px solid;border-bottom: #8c9dbe 1px solid;"> 
            <tr align="center">

               
                <td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:LinkButton ID="btn_insert" runat="server" style="width:100px;" OnClick="insert_Click" Text="导入数据"></asp:LinkButton>
                </td>
                
            </tr>
        </table>
        <div id="alert" runat="server"></div>
    </form>
</body>
</html>