<!--��ѯ�༭ҳ,�б�ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    //string opennerurl = "";
	string p_yearstr="0";
    private void Page_Load(object sender, System.EventArgs e)
    {
        string h_key = GetQueryString("keynumber", "0");
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 
        p_yearstr = GetQueryString("year", "0");
		tb_2.Visible = false;
        Td1.Visible = false;
        Td2.Visible = false;
        list.SqlStr = "select fld_1202_2,fld_1202_1,'' as btnstr ,mocode from gmis_mo_1202 where fld_1202_2 like '%" + h_key + "%'";
        list.Rows = list.DataTable.Rows.Count;
        if (list.Rows == 0)
        {
            newadd.Visible = true;
        }
		opennerurl.Value = StringUtility.StringToBase64("getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid=");
        //Response.Write(opennerurl.Value);
    }

//����ǰҳ���ݣ������������ʾ�Ĳ���
public override void BeforeOutput(DataTable dt, int rowi)
{
    DataRow dr = dt.Rows[rowi];
    dr["btnstr"] += "<a href=\"javascript:chooseOne('" + mid + "','" + StringUtility.StringToBase64(dr["mocode"].ToString()) + "','" + StringUtility.StringToBase64("edit") + "','"+p_yearstr+"');\"><img src=\"images/icons/selectall.gif\" title=\"ȷ��\" align=\"absmiddle\" border=\"0\"></a>";
}
    
    
</script>
<script type="text/javascript">
function chooseOne(arg1,arg2,arg3,arg4)
{
 
   opener.window.location.href="edit_"+arg1+".aspx?aid="+arg3+"&mid="+arg1+"&pid="+arg2+"&year="+arg4;
 //  alert(arg4);
  closeThis();
}

function newadd()
{
    window.location.href="edit_1202_jibiaoweihu.aspx?aid=ZWRpdA==&mid=1202&id=0&navindex=0&openerurl="+document.getElementById("opennerurl").value;
}

function closeThis()
{
    opener=null;
    window.close();
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->


<!--��̬����html,��ʼ-->
<input id="opennerurl" runat="server" type="hidden" />
<div id="controlheight" runat="server" style=" height:550px; overflow-y:auto">
<G:ListTable ID="list" IsProPage=true runat="server" >
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			
                    <td width="15%">
                        ��ҵ����
                    </td>
                    <td width="10%">
                        ���λ��ϸ����
                    </td>
                    <td align="center" width="10%">
                        ����
                    </td>		
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td >*&nbsp;</td>
			<td >*&nbsp;</td>			
			<td align="center" style="padding-top:3px;">*&nbsp;</td>		
			</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	</G:ListTable> 	
	</div>
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<td id="Td1" align="left" runat="server" style="padding-right:5px;" nowrap><span id="alerttext_1202" runat="server"></span></td>
			<td id="Td2" width="100%" align="right" runat="server" style="padding-right:5px;" nowrap>
                <G:Button id="btn_save_jibiaoweihu" type="toolbar" mode="on" icon="tb05" text="����" runat="server"></G:Button><%-- onclick="Click_Save_jibiaoweihu"--%>
            </td>
			<td style="padding-right:5px;" id="newadd" visible="false" runat="server">
			<G:Button Text="����" type="toolbar" mode="on" url="javascript:newadd();" runat="server"></G:Button>
			</td>
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
</form>
</body>
</html>
