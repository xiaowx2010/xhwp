<!--废气排放口,查看页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->

<!--
主表：gmis_mo_23
关联表：gmis_mo_17，关联条件：（gmis_mo_17.fld_17_1=gmis_mo_23.fld_23_3）;gmis_mo_21，关联条件：（gmis_mo_21.mocode in gmis_mo_23.fld_23_11）
-->
<script language="C#" runat="server">
DataTable p_wrwdt ;
string hycode = "";//行业
private void Page_Load(object sender, System.EventArgs e)
{

    SetToolBar();//设置工具条,同时获取固定URL参数    
    hycode = GetQueryString("hycode", "");
    string fcode = GetQueryString("fcode", "");
	tb_2.Visible=false;
	if(aid=="list")
	{
		tb_backlist.Visible=false;
	}
	string orgcode = GetQueryString("orgcode", "0");

    if (orgcode != "0")
    {
        list.SqlStr = "select fld_23_1,fld_23_2,(select fld_54_1 from gmis_mo_54 where mocode=fld_23_6),fld_23_5,(select fld_1165_2 from gmis_mo_1165 where mocode=fld_23_7),(select fld_1196_1 from gmis_mo_1196 where mocode=fld_23_10),fld_23_8,case fld_23_9 when 0 then '否' else '是' end,'' as wrw,fld_23_11,mocode from gmis_mo_23  where fld_23_3='"+orgcode+"' order by fld_23_1 asc";

		//设置列表控件显示行数
		list.Rows = (list.DataTable.Rows.Count < 8) ? 8 : list.DataTable.Rows.Count;

		DataTable h_wrwdt = db.GetDataTable(db.ConnStr,"select mocode,(select fld_1206_1 from gmis_mo_1206 where mocode = fld_29_2) as wrwname from gmis_mo_29 where fld_29_3='"+orgcode+"'");//获取所有注册已处理污染物

		DataTable dt = list.DataTable;
		if (h_wrwdt != null && dt.Rows.Count>0 && h_wrwdt.Rows.Count>0)
		{
			foreach (DataRow dr in dt.Rows)
			{
				if(dr["fld_23_11"].ToString().Trim(';')!= "")
				{
					string[] h_code = dr["fld_23_11"].ToString().Trim(';').Split(';');
					if (h_code.Length>0)
					{
						for (int i=0;i<h_code.Length;i++)
						{
							DataRow[] h_wrwdr = h_wrwdt.Select("mocode="+h_code[i]+"");
							if(h_wrwdr.Length>0)
							{					
								dr["wrw"] += h_wrwdr[0]["wrwname"].ToString()+",";								
							}
						}
						dr["wrw"] = dr["wrw"].ToString().Trim(',');
					}
				}
			}
		}
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
<!--排放口列表-->  

<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">

<tr>
	<td valign="top"  style="width:100%" class="td_viewcontent_content" >
	<G:ListBox id="list" IsProPage="true" showallline=false runat="server">
	<G:Template id="templist" runat="server">
	<table width="100%" border="0"  cellspacing="0" >
	<tr valign="middle" class="zy_bold_lineX" align="left" height="22">
		<td width="8%">
			排放口编号:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%">
			排放口名称:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%" >
			排放口类型:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>		   
	</tr>

	<tr valign="middle" class="zy_bold_lineX" align="left" height="22">
	<td width="8%" >
			排放口位置:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		<td width="8%">
			排放去向:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		 <td width="8%" >
			河体名称:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>				 				
	</tr>
	<tr valign="middle" align="left" height="22">
	<td width="8%" >
			排放规律:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		<td width="8%">
			是否在线监测:
		</td>
		<td width="15%" >
			*&nbsp;
		</td>
		<td width="8%">
			污染物清单:
		</td>
		<td width="15%">
			<img src="images/icons/TB07.gif" title="*" style="cursor:hand">&nbsp;
		</td>				 				
	</tr>
	<tr >
	<td colspan="6"  height=1 style="background-color:#627C9D"></td>
	</tr>
	</table>
	</G:Template>
	</G:ListBox>
</td>
</tr>
</table>  
<!--排放口列表-->
<!--动态生成html,结束-->
</form>
</body>
</html>
