<!--污水排放许可,查看页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->

<!--
主表：gmis_mo_21
关联表：gmis_mo_1205，关联条件：（gmis_mo_1205.mocode=gmis_mo_21.fld_21_2）;gmis_mo_17，关联条件：（gmis_mo_17.fld_17_1=gmis_mo_21.fld_21_3）
-->
<script language="C#" runat="server">
DataTable p_wrwdt ;
string hycode = "";//行业
private void Page_Load(object sender, System.EventArgs e)
{

    SetToolBar();//设置工具条,同时获取固定URL参数    
	tb_2.Visible=false;
	if(aid=="list")
	{
		tb_backlist.Visible=false;
	}
	string orgcode = GetQueryString("orgcode", "0");
    hycode = GetQueryString("hycode", "");
    string fcode = GetQueryString("fcode", "");
    if (orgcode != "0")
    {
        list.SqlStr = "select fld_1205_2,fld_1205_1,fld_1205_4,fld_21_1,a.mocode from gmis_mo_21 a left outer join gmis_mo_1205 b on a.fld_21_2 = b.mocode where fld_21_3='"+orgcode+"' order by fld_1205_2 asc";
		
		//设置列表控件显示行数
		list.Rows = (list.DataTable.Rows.Count < 8) ? 8 : list.DataTable.Rows.Count;
    }

    if (hycode != "")
    {
        tb_backlist.Visible = false;
        tb_backlist_1199.Visible = true;
        iframe_17.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&navindex=" + navindex + "&fcode=" + fcode + "&hycode=" + hycode;
    }
    else
    {
        iframe_17.Attributes["src"] = "iframe_658.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&navindex=" + navindex + "&fcode=" + fcode;
    }
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
			<td id="tb_backlist_1199" visible="false" runat="server" style="padding-left:5px;width:75px;" nowrap>
        <G:Button id="btn_backlist_1199" type="toolbar" mode="on" icon="tb13" text="返回列表" onclick="Click_BackList_1199" runat="server"></G:Button>
        </td>
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--操作工具条-->

<!--动态生成html,开始-->
<!--污染物列表-->  

<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">
<tr>
	<td valign="top"  style="width:100%" class="td_viewcontent_content" >
	<G:ListBox id="list" IsProPage="true" showallline=false runat="server">
	<G:Template id="templist" runat="server">
	 <table width="100%" border="0"  cellspacing="0" >
		<tr valign="middle" align="left" height="22">
			<td width="8%" >
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
			 <td width="8%" >
				执行标准:
			</td>
			<td width="15%" >
				*&nbsp;
			</td>
			 <td width="8%" >
				许可排放量:
			</td>
			<td width="15%" >
				*&nbsp;
			</td>						   
		</tr>
		<tr >
		<td colspan="8"  height=1 style="background-color:#627C9D"></td>
		</tr>
		</table>
	</G:Template>
	</G:ListBox>
</td>
</tr>
</table>  
<!--污染物列表-->
<!--动态生成html,结束-->
</form>
</body>
</html>
