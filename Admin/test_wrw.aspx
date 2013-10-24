<!--G105-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>		
<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>	
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>

<!--#include file="func.aspx"-->

<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
    navindex = GetQueryString("navindex","0");
}
/*
 * 函数：Update_672()
 作用：更新gmis_mo_1235污染物排放表中数据位gmis_mo_672导入的单位
 * 
 */
private void Update_672(object sender,System.EventArgs e)
{
    string exeinfo = "";
    //产生量：     
    db.SqlString = "select fld_672_1,fld_672_11 as fld_672_11name,fld_672_15 as fld_672_15cs,fld_672_16 as fld_672_16pf,fld_672_14 as fld_672_14dw,(select fld_1236_1 from gmis_mo_1236 where mocode=fld_1235_1),fld_1235_3,fld_1235_4,fld_1235_5,fld_1235_6 from gmis_mo_1235 a left outer join gmis_mo_672 b on fld_672_1=fld_1235_2  where fld_672_15=fld_1235_3 and fld_672_14<>fld_1235_5 and fld_672_15<>0 and  (select fld_1236_1 from gmis_mo_1236 where mocode=fld_1235_1)=fld_672_11";
    DataTable dt1 = db.GetDataTable();
    StringBuilder sb1 = new StringBuilder();
    if (dt1.Rows.Count > 0)
    {
        foreach (DataRow dr in dt1.Rows)
        {
            //产生量：           
            sb1.Append("update gmis_mo_1235 set fld_1235_5='" + dr["fld_672_14dw"].ToString() + "' where   fld_1235_3='" + dr["fld_672_15cs"].ToString() + "' and fld_1235_5<>'" + dr["fld_672_14dw"].ToString() + "' and " + dr["fld_672_15cs"].ToString() + "<>0 and fld_1235_2='" + dr["fld_672_1"].ToString() + "' and (select fld_1236_1 from gmis_mo_1236 where mocode=fld_1235_1)='" + dr["fld_672_11name"].ToString() + "';");
        }
        db.SqlString = sb1.ToString();
        exeinfo+=db.UpdateTable();
    }  
    //排放量：
    db.SqlString = "select fld_672_1,fld_672_11 as fld_672_11name,fld_672_15 as fld_672_15cs,fld_672_16 as fld_672_16pf,fld_672_14 as fld_672_14dw,(select fld_1236_1 from gmis_mo_1236 where mocode=fld_1235_1),fld_1235_3,fld_1235_4,fld_1235_5,fld_1235_6 from gmis_mo_1235 a left outer join gmis_mo_672 b on fld_672_1=fld_1235_2  where fld_672_16=fld_1235_4 and fld_672_14<>fld_1235_6 and fld_672_16<>0 and  (select fld_1236_1 from gmis_mo_1236 where mocode=fld_1235_1)=fld_672_11";
    DataTable dt2 = db.GetDataTable();
    StringBuilder sb2 = new StringBuilder();
    if (dt2.Rows.Count > 0)
    {
        foreach (DataRow dr in dt2.Rows)
        {
             sb2.Append("update gmis_mo_1235 set fld_1235_6='" + dr["fld_672_14dw"].ToString() + "' where   fld_1235_4='" + dr["fld_672_16pf"].ToString() + "' and fld_1235_6<>'" + dr["fld_672_14dw"].ToString() + "' and " + dr["fld_672_16pf"].ToString() + "<>0 and fld_1235_2='" + dr["fld_672_1"].ToString() + "' and (select fld_1236_1 from gmis_mo_1236 where mocode=fld_1235_1)='" + dr["fld_672_11name"].ToString() + "';");
        }
        db.SqlString = sb2.ToString();        
        exeinfo+=db.UpdateTable();
    }
    if (exeinfo.IndexOf('未') == -1)
    {
        update_danwei.InnerHtml = "<span style=\"color:red\">操作成功！</span>";
    }
}
/*
 作用：更新gmis_mo_1235中字段fld_1235_8行业类别
 */
private void Update_1235_8(object sender,System.EventArgs e)
{
    string exeinfo="";
    for (int i = 0; i < 14; i++)
    {
        int fromcount = i * 200;
        db.SqlString = "select  mocode,fld_1202_2,(case when (select fld_1200_2 from gmis_mo_1200 where fld_1200_8=fld_1202_20) is not null then (select fld_1200_2 from gmis_mo_1200 where fld_1200_8=fld_1202_20) else 1 end) as fld_1200_2  from gmis_mo_1202  where mocode not in (select top "+fromcount+" mocode from gmis_mo_1202) and mocode in(select top "+(fromcount+200)+" mocode from gmis_mo_1202)";
        DataTable dt = db.GetDataTable();
        StringBuilder sb = new StringBuilder();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                sb.Append("update gmis_mo_1235 set fld_1235_8=" + dr["fld_1200_2"].ToString() + " where fld_1235_2='" + dr["fld_1202_2"].ToString() + "';");
            }
        }

        db.SqlString = "begin " + sb.ToString().Trim(';') + "end";
        exeinfo+=db.TransUpdate();
    }
    if (exeinfo.IndexOf('未') == -1)
    {
        update_hytype.InnerHtml = "<span style=\"color:red\">操作成功！</span>"; 
    }
}    
</script>

<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<table style="margin-top:100px"><tr><td align="center">操作说明：</td><td>点击左边，<span  style="color:Red">更新污染物单位</span> ，<span style="color:Red">更新行业类别</span>。两个连接进行更新数据库操作。等待右边的操作成功后结果反馈中会显示<span style="color:Red">操作成功！</span> </td></tr>
</table>
<table align="center"  width="50%" border="1" style="border-collapse:collapse;" >
<tr ><td align="center" style="font-size:large">操作名</td><td align="center" style="font-size:large">操作结果反馈</td></tr>
<tr>
<td align="center" >点击这里：-->
<asp:LinkButton ID="LinkButton1" runat="server" Text="更新污染物单位"  style="color:blue; font-size:medium"  OnClick="Update_672"></asp:LinkButton>
</td>
<td align="center"><div id="update_danwei" runat="server"></div></td>
</tr>
<tr>
<td width="50%" align="center">点击这里：-->
<asp:LinkButton ID="btn_type" runat="server" Text="更新行业类别" style="color:blue;font-size:medium"  OnClick="Update_1235_8"></asp:LinkButton>
</td><td align="center" ><div id="update_hytype" runat="server"></div></td>
</tr>
</table>
</form>
</body>
</html>