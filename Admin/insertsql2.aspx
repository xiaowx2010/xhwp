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
	string sqlstr = "";
	int s=0,f=0;
	string failedstr = "";
	DataTable dt = db.GetDataTable(db.ConnStr,"select fld_1239_1,fld_1239_2,fld_1239_5 from gmis_mo_1239 where fld_1239_4=1237");
	int i =1;
	foreach (DataRow dr in dt.Rows)
	{
		sqlstr = "insert into gmis_mo_1237 (fld_1237_1,fld_1237_2,fld_1237_3,fld_1237_4,fld_1237_5) select '"+dr[0].ToString()+"',"+dr[1].ToString()+",fld_"+dr[2].ToString()+"_1,"+dr[2].ToString()+",mocode from gmis_mo_"+dr[2].ToString()+" where "+dr[1].ToString()+" <>'' and "+dr[1].ToString()+" is not null";
		
		db.SqlString = sqlstr;
		string exeinfo = db.UpdateTable();
		if (exeinfo == "操作成功！")
		{
			s++;
		}
		else 
		{
			f++;
			failedstr += i.ToString()+",";
		}
		i++;
	}
	
	alert.InnerHtml = "成功"+s.ToString()+"条，失败"+f.ToString()+" 条，<BR>"+failedstr.Trim(',');
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