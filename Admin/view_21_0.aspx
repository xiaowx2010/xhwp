<!--��ˮ�ŷ����,�鿴ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->

<!--
����gmis_mo_21
������gmis_mo_1205��������������gmis_mo_1205.mocode=gmis_mo_21.fld_21_2��;gmis_mo_17��������������gmis_mo_17.fld_17_1=gmis_mo_21.fld_21_3��
-->
<script language="C#" runat="server">
DataTable p_wrwdt ;
string hycode = "";//��ҵ
private void Page_Load(object sender, System.EventArgs e)
{

    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
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
		
		//�����б�ؼ���ʾ����
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
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td>
<iframe id="iframe_17"  runat="server" frameborder="0"  width="100%" height="30" scrolling="no"></iframe>
</td></tr></table>
<div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar_17.aspx"-->
			<td id="tb_backlist_1199" visible="false" runat="server" style="padding-left:5px;width:75px;" nowrap>
        <G:Button id="btn_backlist_1199" type="toolbar" mode="on" icon="tb13" text="�����б�" onclick="Click_BackList_1199" runat="server"></G:Button>
        </td>
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--����������-->

<!--��̬����html,��ʼ-->
<!--��Ⱦ���б�-->  

<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="border-top:none; margin-top:-1px;">
<tr>
	<td valign="top"  style="width:100%" class="td_viewcontent_content" >
	<G:ListBox id="list" IsProPage="true" showallline=false runat="server">
	<G:Template id="templist" runat="server">
	 <table width="100%" border="0"  cellspacing="0" >
		<tr valign="middle" align="left" height="22">
			<td width="8%" >
				��Ⱦ�����:
			</td>
			<td width="15%" >
				*&nbsp;
			</td>
			 <td width="8%">
				��Ⱦ������:
			</td>
			<td width="15%" >
				*&nbsp;
			</td>
			 <td width="8%" >
				ִ�б�׼:
			</td>
			<td width="15%" >
				*&nbsp;
			</td>
			 <td width="8%" >
				����ŷ���:
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
<!--��Ⱦ���б�-->
<!--��̬����html,����-->
</form>
</body>
</html>
