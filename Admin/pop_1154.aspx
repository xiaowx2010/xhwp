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
private void Page_Load(object sender, System.EventArgs e)
{    
    string h_year = GetQueryString("year","");
    string h_name = GetQueryString("name","");
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
    tb_2.Visible = false;  
    list.SqlStr = "select 'td_'+cast(mocode as varchar(50))+'_1',fld_1154_1,'td_'+cast(mocode as varchar(50))+'_2',fld_1154_2,'td_'+cast(mocode as varchar(50))+'_3',fld_1154_3,'' as btnstr,'td_'+cast(mocode as varchar(50))+'_4',fld_1154_4,'td_'+cast(mocode as varchar(50))+'_5',fld_1154_5,'td_'+cast(mocode as varchar(50))+'_6',fld_1154_6,'td_'+cast(mocode as varchar(50))+'_7',fld_1154_7,'td_'+cast(mocode as varchar(50))+'_8',fld_1154_8,'td_'+cast(mocode as varchar(50))+'_9',fld_1154_9,'td_'+cast(mocode as varchar(50))+'_10',fld_1154_10,'td_'+cast(mocode as varchar(50))+'_11',fld_1154_11,'td_'+cast(mocode as varchar(50))+'_12',fld_1154_12,'td_'+cast(mocode as varchar(50))+'_13',fld_1154_13,'td_'+cast(mocode as varchar(50))+'_14',fld_1154_14,'td_'+cast(mocode as varchar(50))+'_15',fld_1154_15,'td_'+cast(mocode as varchar(50))+'_16',fld_1154_16,'td_'+cast(mocode as varchar(50))+'_17',fld_1154_17,'td_'+cast(mocode as varchar(50))+'_18',fld_1154_18,'td_'+cast(mocode as varchar(50))+'_19',fld_1154_19,'td_'+cast(mocode as varchar(50))+'_20',fld_1154_20,'td_'+cast(mocode as varchar(50))+'_21',fld_1154_21,'td_'+cast(mocode as varchar(50))+'_22',fld_1154_22,'td_'+cast(mocode as varchar(50))+'_23',fld_1154_23,'td_'+cast(mocode as varchar(50))+'_24',fld_1154_24,'td_'+cast(mocode as varchar(50))+'_25',fld_1154_25,'td_'+cast(mocode as varchar(50))+'_26',fld_1154_26,'td_'+cast(mocode as varchar(50))+'_27',fld_1154_27,'td_'+cast(mocode as varchar(50))+'_28',fld_1154_28,'td_'+cast(mocode as varchar(50))+'_29',fld_1154_29,'td_'+cast(mocode as varchar(50))+'_30',fld_1154_30,'td_'+cast(mocode as varchar(50))+'_31',fld_1154_31,'td_'+cast(mocode as varchar(50))+'_32',fld_1154_32,'td_'+cast(mocode as varchar(50))+'_33',fld_1154_33,'td_'+cast(mocode as varchar(50))+'_34',fld_1154_34,'td_'+cast(mocode as varchar(50))+'_35',fld_1154_35,mocode from gmis_mo_1154 where fld_1154_1="+h_year+" and fld_1154_2 like '%"+h_name.Trim()+"%'";
    list.Rows = list.DataTable.Rows.Count;
    //Response.Write(list.SqlStr);
    if (list.DataTable.Rows.Count == 1)
    {
        bindmocode.Value = list.DataTable.Rows[0]["mocode"].ToString();
        bindmid.Value = mid;
        bindaid.Value = StringUtility.StringToBase64("edit");
    } 
}

//����ǰҳ���ݣ������������ʾ�Ĳ���
public override void BeforeOutput(DataTable dt, int rowi)
{
    DataRow dr = dt.Rows[rowi];

    dr["btnstr"] += "<a href=\"javascript:chooseOne('"+mid+"','"+dr["mocode"].ToString()+"','"+StringUtility.StringToBase64("edit")+"');\"><img src=\"images/icons/selectall.gif\" title=\"ȷ��\" align=\"absmiddle\" border=\"0\"></a>";

}
    
    
</script>
<script type="text/javascript">
function chooseOne(arg1,arg2,arg3)
{
    opener.document.getElementById("alertmess").innerText="";
    //alert("getpage.aspx?aid="+arg3+"&mid="+arg1+"&id="+arg2+"");
    opener.window.location.href="getpage.aspx?aid="+arg3+"&mid="+arg1+"&id="+arg2+"";
    closeThis();
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

<G:ListTable ID="list" IsProPage=true runat="server" >
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left" width="100%">
			<td  width="15%" >ͳ�����</td>
			<td  width="25%" >��ҵ���˴���</td>
			<td  width="35%" >��ҵ����</td>
			
			<td align="center" width="8%">����</td>
			<td style="display:none">
			    <table >
			        <tr class="tr_listtitle">
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td>&nbsp;</td>
			            <td >&nbsp;</td>
			            <td>&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td>&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td>&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td>&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			        </tr>
			    </table>
			</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td id="*">*&nbsp;</td>
			<td id="*">*&nbsp;</td>
			<td id="*">*&nbsp;</td>
			
			<td align="center" style="padding-top:3px;">*</td>
			<td style="display:none">
			    <table class="righttableline">
			        <tr class="tr_listcontent">
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            <td id="*">*&nbsp;</td>
			            
			        </tr>
			    </table>
			</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td style="display:none">
			    <table class="righttableline">
			        <tr class="tr_listcontent">
			            <td >&nbsp;</td>
			            <td>&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            <td >&nbsp;</td>
			            
			        </tr>
			    </table>
			</td>
		</tr>
	</G:Template>
	</G:ListTable> 
	<span id="mess" runat=server style="color:Red"></span>
	<input id="bindmocode" value="0" type="hidden" runat="server" />
	<input id="bindmid" value="0" type="hidden" runat="server" />
	<input id="bindaid" value="0" type="hidden" runat="server" />
	<script type="text/javascript" defer>
	if(document.getElementById("bindmocode").value!="0")
	{
	    chooseOne(document.getElementById("bindmid").value,document.getElementById("bindmocode").value,document.getElementById("bindaid").value);
	}
	</script>
	
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<td style="padding-right:5px;" nowrap>
			<G:Button Text="ȡ ��" type="toolbar" mode="on" url="javascript:closeThis();" runat="server"></G:Button>
			</td>
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
</form>
</body>
</html>
