<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    StringBuilder sb;
private void Page_Load(object sender, System.EventArgs e)
{
 
    Response.Write(guangye.ExeBySql(UpdateTypeIndex("gmis_mo_1201", "mocode", "fld_1201_2", "fld_1201_5", "fld_1201_4", "fld_1201_3"),1));
}
 /*更新排序结构,dtable:表名，fmocodename:编号字段名，findexname:索引字段名,fpositionname:同级排序,fuppercodename:直属上级字段名
  */
 private string UpdateTypeIndex(string dtable,string fmocodename,string flevelname,string findexname, string fpositionname, string fuppercodename)
{
    sb = new StringBuilder();
    
    if (db.UpdateTable(db.ConnStr, "update " + dtable + " set " + findexname + "=" + fmocodename + " where " + flevelname + "=1 ") == "操作成功！")
    {
        DataTable dt = db.GetDataTable(db.ConnStr, "select " + fmocodename + "," + flevelname + " as level," + fuppercodename + " as uppercode from " + dtable + "  order by " + findexname + " ");
		GetTypeIndexSQl("1.", "Level=1", dt,dtable,fmocodename,findexname,fpositionname);
	}
    return  "Begin "+sb.ToString()+" End";
}
 private void GetTypeIndexSQl(string pindex, string filter, DataTable dt, string dtable, string fmocodename, string findexname, string fpositionname)
 {
     DataRow[] drs = dt.Select(filter, "");
     for (int i = 0; i < drs.Length; i++)
     {
         string tindex = pindex + (i + 1).ToString().PadLeft(3, '0');
         sb.Append("update " + dtable + " set " + findexname + "='" + tindex + "'," + fpositionname + "=" + Convert.ToString(i + 1) + " where " + fmocodename + "='" + drs[i][fmocodename].ToString() + "';");
         if (dt.Select("UpperCode='" + drs[i][fmocodename].ToString() + "'", "").Length > 0)
         {
             GetTypeIndexSQl(tindex, "UpperCode='" + drs[i][fmocodename].ToString() + "'", dt, dtable, fmocodename, findexname, fpositionname);
         }
     }
 }
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->

<!--操作工具条-->
<!--内容-->

<table width="100%" style="height:400px" border="0" cellpadding="3" cellspacing="1" >
    <tr valign="top"> 
        <td align="center" style="padding-top:100px;">
			<table width="600" style="height:100px" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center"><div id="alert" runat="server"></div></td>
				</tr>
				<tr>
					<td align="center">
					<G:Button id="btn_back" type="toolbar" mode="on"  icon="tb21" text="返回" Url="javascript:window.history.back()" runat="server"></G:Button>	
					</td>
				</tr>				
				<tr>
					<td align="center">
						<G:Button id="btn_backlist" type="toolbar" mode="on" icon="tb13"  text="返回列表"  Url="javascript:window.history.back()" runat="server"></G:Button>

					</td>
				</tr>
				<tr>
					<td align="center">
						<G:Button id="btn_newadd" type="toolbar" mode="on" icon="tb01"  text="继续新增" Visible="false"  runat="server"></G:Button>

					</td>
				</tr>
			</table>
        </td>
    </tr>
</table>

<!--内容-->
</form>
</body>
</html>