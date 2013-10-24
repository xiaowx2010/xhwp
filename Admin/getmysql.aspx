<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<script runat=server language=C#>
        private SqlDB db = new SqlDB();
        DataTable dt = new DataTable();
		private void Page_Load(object sender, System.EventArgs e)
		{
            db.SqlString = "select mocode,fld_1202_1,fld_1202_2,fld_1202_4,fld_1202_20 from gmis_mo_1202 where fld_1202_20<>''";
            dt= db.GetDataTable();
            //Response.Write(dt.Rows.Count);
		}

        private void insert_Click(object sender, EventArgs e)
        {
            if (dt != null && dt.Rows.Count > 0)
            {
                string str = "";
                foreach (DataRow dr in dt.Rows)
                {
                    str += "insert into gmis_mo_1197 (modulecode,datamocode,orgname,orgcode,areacode,tradecode) values (1202," + dr["mocode"].ToString() + ",'" + dr["fld_1202_1"].ToString() + "','" + dr["fld_1202_2"].ToString() + "'," + dr["fld_1202_4"].ToString() + "," + dr["fld_1202_20"].ToString() + ");";
                    //Response.Write("insert into gmis_mo_1197 (mocdulecode,datamocode,orgname,orgcode,areacod,tradecode) values (1202," + dr["mocode"].ToString() + ",'" + dr["fld_1202_1"].ToString() + "','" + dr["fld_1202_2"].ToString() + "'," + dr["fld_1202_4"].ToString() + "," + dr["fld_1202_20"].ToString() + ");");
                }
                if (str.Trim() != "")
                {
                    db.SqlString ="begin " +str.Trim()+" end";
                    alert.InnerHtml= db.TransUpdate();
                    //Response.Write(db.SqlString);
                }
            }
        }
        

        
</script>
<body>
    <form runat="server">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" style="border-right: #8c9dbe 1px solid;border-top: #8c9dbe 1px solid;border-left: #8c9dbe 1px solid;border-bottom: #8c9dbe 1px solid;"> 
            <tr align="center">
                <td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:LinkButton ID="btn_table" runat="server" style="width:100px;" OnClick="insert_Click" Text="µ¼Èë"></asp:LinkButton>
                </td>
               
                
            </tr>
        </table>
        <div id="alert" runat="server"></div>
    </form>
</body>
</html>