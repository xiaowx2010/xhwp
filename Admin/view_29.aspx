<!--������Ⱦ���ŷ���ɹ���״̬,�鿴ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--
����gmis_mo_29
������gmis_mo_1206��������������gmis_mo_1206.mocode=gmis_mo_29.fld_29_2��;gmis_mo_17��������������gmis_mo_17.fld_17_1=gmis_mo_29.fld_29_3��
-->
<script language="C#" runat="server">
    string hycode = "";//��ҵ
private void Page_Load(object sender, System.EventArgs e)
{

    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 
    string orgcode = GetQueryString("orgcode", "0"); //��ȡ��λ����
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
//������
private void BindDataList()
{

	/*����ɸѡ����*/

	
	string h_tablename = "gmis_mo_29 a left outer join gmis_mo_1206 b on a.fld_29_2 = b.mocode";//���ݱ�����
	string h_orderstr = " order by fld_1206_2 asc";//��������;	

	//�����б�ؼ�����Դ
	list.SqlStr = "select fld_1206_2,fld_1206_1,fld_1206_4,fld_1206_5,'' as btnstr,fld_29_1,a.mocode from " + h_tablename + "  where fld_29_3=(select fld_17_1 from gmis_mo_17 where mocode="+id+") " + h_orderstr + " ";
	
	//Response.Write(list.SqlStr);

	//�����б�ؼ���ʾ����
	list.Rows = (list.DataTable.Rows.Count < 8) ? 8 : list.DataTable.Rows.Count;

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
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
	   </div>
<!--����������-->
<!--��̬����html,��ʼ-->
<!--��ȾԴ��Ϣ-->
	<G:Content id="view" runat="server">
    <G:Template id="tmpview" runat="server">
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top" style="margin-top: 10px;">        
        <tr>
            <td width="100" align="right" class="td_viewcontent_title">��λ����:</td>
            <td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
            <td width="100" align="right" class="td_viewcontent_title">��λ����:</td>
            <td class="td_viewcontent_content" style="width: 35%">*&nbsp;</td>
        </tr>        
    </table>
	</G:Template>
    </G:Content>
	<!--��ȾԴ��Ϣ-->
	<!--��Ⱦ���б�-->
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_graybgcolor_Top"
        style="margin-top: 3px;">
        <tr align="center">
            <td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">��Ⱦ���б�</td>
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
				 <td width="12%" >
					Ũ��ִ�б�׼:
				</td>
				<td width="11%" >
					*&nbsp;
				</td>
				<td width="12%" >
					����ִ�б�׼:
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
					����ŷ���:
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
    <!--��Ⱦ���б�-->
<!--��̬����html,����-->
</form>
</body>
</html>
