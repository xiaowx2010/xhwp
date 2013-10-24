<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--#include file="restructmodule.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
    mid = GetQueryString("mid", "0");
    aid = GetQueryString("aid", "list");
    id = GetQueryString("id", "0");
    pid=GetQueryString("pid", "0");
    navindex = GetQueryString("navindex", "0");
    if (GetSESSION("alert") != "")
    {
        alert.Style.Add("color", "red");
        alert.InnerHtml = GetSESSION("alert");
        SetSESSION("alert", "");
        btn_back.Visible = true;
        btn_backlist.Visible = false;
    }
    else
    {
        if (GetSESSION("sql") != "")
        {
            string h_sql = GetSESSION("sql");
            if (GetSESSION("extsql") != "")
            {
                h_sql = "Begin " + h_sql +";"+ GetSESSION("extsql") + "; End";
                SetSESSION("extsql", "");
            }
		    Response.Write(h_sql);
            string Exeinfo = "";
            Exeinfo = guangye.ExeBySql(h_sql.Trim(';'), 1);
            //Exeinfo += h_sql;          
            SetSESSION("sql", "");
            if (Exeinfo.IndexOf("操作成功！") > -1)
            {
                if (mid == "45")
                {
                    alert.InnerHtml = guangye.ExeBySql(UpdateTypeIndex("gmis_mo_45", "mocode", "fld_45_2", "fld_45_5", "fld_45_4", "fld_45_3"), 1);
                  
                }
                if (GetModuleName(mid) == "模块")//模块              
                    alert.InnerHtml = ReStructIndex("module");
                if (GetModuleName(mid) == "图层管理")//图层管理              
                    alert.InnerHtml = ReStructIndex("Type");
                if (GetModuleName(mid) == "知识库主题")//知识库主题              
                    alert.InnerHtml = ReStructIndex("Fold");
                if (id == "0")//新增
                {
                    if(mid!="53"&&mid!="23")
					{
						btn_newadd.Visible = true;//继续新增                    
						//btn_back.Visible = true;
						btn_newadd.Url = "getpage.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&pid=" + pid;
					}
                }
                if (aid == "delete")
                {
                    btn_back.Visible = false;
                }         
               
            }
            alert.InnerHtml = Exeinfo;
        }
    }
    //btn_backlist.Visible = (mid!="10");
    //字段管理
    if(mid=="3")
    {
		btn_backlist.Url = "getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id + "&navindex=" + navindex+"&pid="+pid;
    }
    else if(mid=="1241")
    {
        btn_backlist.Url = "pop_1241_3.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&id=" + id + "&navindex=" + navindex+"&pid="+pid;
    }
    else if (mid == "1244")
    {
        btn_backlist.Url="pop_1244_5.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&id=" + id + "&navindex=" + navindex+"&pid="+pid;
    }
    else
    {
        btn_backlist.Url = "getpage.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&id=" + id + "&navindex=" + navindex + "&pid=" + pid;
    }
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