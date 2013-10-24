<!--废气污染物排放许可管理状态,查看页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--
主表：gmis_mo_29
关联表：gmis_mo_1206，关联条件：（gmis_mo_1206.mocode=gmis_mo_29.fld_29_2）;gmis_mo_17，关联条件：（gmis_mo_17.fld_17_1=gmis_mo_29.fld_29_3）
-->
<script language="C#" runat="server">
    string hycode = "";//行业
private void Page_Load(object sender, System.EventArgs e)
{

    SetToolBar();//设置工具条,同时获取固定URL参数 
    string orgcode = GetQueryString("orgcode", "0"); //获取单位代码
    string h_fcode = GetQueryString("fcode", "0");
    if (h_fcode != "0"&&h_fcode !="")
    {
        tb_backlist.Visible = false;
    }
    if (orgcode != "0")
    {
        filter = " and fld_17_1='" + orgcode + "'";
        db.SqlString = "select mocode from gmis_mo_17 where 1=1 " + filter;

        if (db.GetDataTable().Rows.Count > 0)
        {
            id = db.GetDataTable().Rows[0][0].ToString();
        }
    }
    view.SqlStr = "select fld_17_1,fld_17_3 from gmis_mo_17 where mocode=" + id;
    DataTable dt = view.DataTable;
    if (id!="0"&&dt != null && dt.Rows.Count > 0)
    {
        iframe_17.Attributes["src"] = "iframe_658.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(dt.Rows[0]["fld_17_1"].ToString()) + "&fcode=" + h_fcode;
    }else
        iframe_17.Attributes["src"] = "iframe_658.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&fcode=" + h_fcode;
	
	BindDataList();	
}
//绑定数据
private void BindDataList()
{

	/*设置筛选条件*/

	
	string h_tablename = "gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2 = b.mocode";//数据表名称
	string h_orderstr = " order by fld_1206_2 asc";//排序条件;	

	//设置列表控件数据源
	list.SqlStr = "select fld_1206_2,fld_1206_1,fld_1206_4,fld_1206_5,'' as btnstr,fld_29_1,a.mocode from " + h_tablename + "  where fld_29_3=(select fld_17_1 from gmis_mo_17 where mocode="+id+") " + h_orderstr + " ";
	
	//Response.Write(list.SqlStr);

	//设置列表控件显示行数
	list.Rows = (list.DataTable.Rows.Count < 8) ? 8 : list.DataTable.Rows.Count;

}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td>
<iframe id="iframe_17"  runat="server" frameborder="0"  width="100%" height="30" scrolling="no"></iframe>
</td></tr></table>
 <div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar_17.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
	   </div>
<!--操作工具条-->
<!--动态生成html,开始-->
<!--污染源信息-->
	<G:Content id="view" runat="server">
    <G:Template id="tmpview" runat="server">
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="margin-top: 10px;">        
        <tr>
            <td width="100" align="right" class="td_viewcontent_title">单位代码:</td>
            <td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
            <td width="100" align="right" class="td_viewcontent_title">单位名称:</td>
            <td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
        </tr>        
    </table>
	</G:Template>
    </G:Content>
	<!--污染源信息-->
	<!--污染物列表-->
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top"
        style="margin-top: 3px;">
        <tr align="center">
            <td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">污染物列表</td>
        </tr>
    </table>   
	<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">
	<tr>
		<td valign="top"  style="width:100%" class="td_viewcontent_content" >
		<div style="width:99%; height:320px; overflow-y:auto;">
		<G:ListBox id="list" IsProPage="true" showallline=false runat="server">
		<G:Template id="templist" runat="server">
		 <table width="100%" border="0"  cellspacing="0" >
			<tr valign="middle" class="zy_bold_lineX" align="left" height="22">
				<td width="8%">
					污染物代码:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>
				 <td width="8%">
					污染物名称:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>
				 <td width="12%" >
					浓度执行标准:
				</td>
				<td width="11%" >
					*&nbsp;
				</td>
				<td width="12%" >
					速率执行标准:
				</td>
				<td width="11%" >
					*&nbsp;
				</td>
				 				
				 <td width="8%">
				   *
				</td>			   
			</tr>

			<tr valign="middle" align="left" height="22">
			<td width="8%" >
					许可排放量:
				</td>
				<td width="15%" >
					*&nbsp;
				</td>
			</tr>
			<tr >
			<td colspan="9"  height=1 style="background-color:#627C9D"></td>
			</tr>
			</table>
		</G:Template>
		</G:ListBox>
		</div>
	</td>
	</tr>
	</table>  
    <!--污染物列表-->
<!--动态生成html,结束-->
</form>
</body>
</html>
