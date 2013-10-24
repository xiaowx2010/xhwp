<!--查询编辑页,列表页-->
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

    StringBuilder sb=new StringBuilder();
    string h_year = GetQueryString("year","");
    string h_name = GetQueryString("name","");
    SetToolBar();//设置工具条,同时获取固定URL参数  
    tb_2.Visible = false;  
    sb.Append("select 'td_'+cast(mocode as varchar(50))+'_1',fld_1156_1,'td_'+cast(mocode as varchar(50))+'_2',fld_1156_2,'td_'+cast(mocode as varchar(50))+'_3',fld_1156_3,'' as btnstr,'td_'+cast(mocode as varchar(50))+'_4',fld_1156_4,'td_'+cast(mocode as varchar(50))+'_5',fld_1156_5,'td_'+cast(mocode as varchar(50))+'_6',fld_1156_6,'td_'+cast(mocode as varchar(50))+'_7',fld_1156_7,'td_'+cast(mocode as varchar(50))+'_8',fld_1156_8,'td_'+cast(mocode as varchar(50))+'_9',fld_1156_9,'td_'+cast(mocode as varchar(50))+'_10',fld_1156_10,'td_'+cast(mocode as varchar(50))+'_11',fld_1156_11,'td_'+cast(mocode as varchar(50))+'_12',fld_1156_12,'td_'+cast(mocode as varchar(50))+'_13',fld_1156_13,'td_'+cast(mocode as varchar(50))+'_14',fld_1156_14,'td_'+cast(mocode as varchar(50))+'_15',fld_1156_15,'td_'+cast(mocode as varchar(50))+'_16',fld_1156_16,'td_'+cast(mocode as varchar(50))+'_17',fld_1156_17,'td_'+cast(mocode ");
    sb.Append("as varchar(50))+'_18',fld_1156_18,'td_'+cast(mocode as varchar(50))+'_19',fld_1156_19,'td_'+cast(mocode as varchar(50))+'_20',fld_1156_20,'td_'+cast(mocode as varchar(50))+'_21',fld_1156_21,'td_'+cast(mocode as varchar(50))+'_22',fld_1156_22,'td_'+cast(mocode as varchar(50))+'_23',fld_1156_23,'td_'+cast(mocode as varchar(50))+'_24',fld_1156_24,'td_'+cast(mocode as varchar(50))+'_25',fld_1156_25,'td_'+cast(mocode as varchar(50))+'_26',fld_1156_26,'td_'+cast(mocode as varchar(50))+'_27',fld_1156_27,'td_'+cast(mocode as varchar(50))+'_28',fld_1156_28,'td_'+cast(mocode as varchar(50))+'_29',fld_1156_29,'td_'+cast(mocode as varchar(50))+'_30',fld_1156_30,'td_'+cast(mocode as varchar(50))+'_31',fld_1156_31,'td_'+cast(mocode as varchar(50))+'_32',fld_1156_32,'td_'+cast(mocode as varchar(50))+'_33',fld_1156_33,'td_'+cast(mocode as varchar(50))+'_34',fld_1156_34,'td_'+cast(mocode as varchar(50))+'_35',fld_1156_35,'td_'+cast(mocode as varchar(50))+'_36',fld_1156_36,'td_'+cast(mocode as varchar(50))+'_37',fld_1156_37,'td_'+cast(mocode as varchar(50))+'_38',fld_1156_38,'td_'+cast(mocode as varchar(50))+'_39',fld_1156_39,'td_'+cast(mocode as varchar(50))+'_40',fld_1156_40,'td_'+cast(mocode as varchar(50))+'_41',fld_1156_41,'td_'+cast(mocode as varchar(50))+'_42',fld_1156_42,'td_'+cast(mocode as varchar(50))+'_43',fld_1156_43,'td_'+cast(mocode as varchar(50))+'_44',fld_1156_44,mocode from gmis_mo_1156 where fld_1156_1="+h_year+" and fld_1156_2 like '%"+h_name.Trim()+"%'");
    list.SqlStr=sb.ToString();
    list.Rows = list.DataTable.Rows.Count;
    
    if (list.DataTable.Rows.Count == 1)
    {
        bindmocode.Value = list.DataTable.Rows[0]["mocode"].ToString();
        bindmid.Value = mid;
        bindaid.Value = StringUtility.StringToBase64("edit");
    }
}


//处理当前页数据，处理操作列显示的操作
public override void BeforeOutput(DataTable dt, int rowi)
{
    DataRow dr = dt.Rows[rowi];

    dr["btnstr"] += "<a href=\"javascript:chooseOne('"+mid+"','"+dr["mocode"].ToString()+"','"+StringUtility.StringToBase64("edit")+"');\"><img src=\"images/icons/selectall.gif\" title=\"确认\" align=\"absmiddle\" border=\"0\"></a>";

}
    
    
</script>
<script type="text/javascript">
function chooseOne(arg1,arg2,arg3)
{
    opener.document.getElementById("alertmess").innerText="";
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
<!--选项卡-->
<!--选项卡-->


<!--动态生成html,开始-->
<G:ListTable ID="list" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			<td  width="15%" >统计年份</td>
			<td  width="25%" >企业法人代码</td>
			<td  width="35%" >企业名称</td>
			
			<td align="center" width="8%">操作</td>
			<td style="display:none">
			    <table>
			        <tr>
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
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td id="*">*&nbsp;</td>
			<td id="*">*&nbsp;</td>
			<td id="*">*&nbsp;</td>
			
			<td align="center" style="padding-top:3px;">*</td>
			<td style="display:none">
			    <table>
			        <tr>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
			            <td id="*">*</td>
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
			    <table>
			        <tr>
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
	
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<td style="padding-right:5px;" nowrap>
			<G:Button Text="取 消" type="toolbar" mode="on" url="javascript:closeThis();" runat="server"></G:Button>
			</td>
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
</form>
</body>
</html>
