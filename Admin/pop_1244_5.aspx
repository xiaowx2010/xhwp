<!--全行业自定义高级查询,模版列表页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="c#" runat="server">
private void Page_Load(object sender,System.EventArgs e)
{
    mid = "1244";
    list_1244.SqlStr = "select mocode,fld_1244_1, '' as btnstr from gmis_mo_1244";
    list_1244.Rows = list_1244.DataTable.Rows.Count;
}
public override void BeforeOutput(DataTable dt, int rowi)
{	//处理当前页数据
  DataRow dr = dt.Rows[rowi];
  dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
  //  dr["btnstr"] += "<a href=\"#\" onclick=\"editName()\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
}
/*
 * 函数：Delete_All(object sender, System.EventArgs e)
 * 作用：删除所有选项
 * 更改人/日期：YJ/2009年8月12日
 */
private void Delete_All(object sender, System.EventArgs e)
{
    string h_listmocode = guangye.GetControlValue(checkedlist).Trim(',');//选中状态的数据ID
    db.SqlString = "delete gmis_mo_1244 where mocode in("+h_listmocode+");delete gmis_mo_1255 where fld_1255_1 in("+h_listmocode+");delete gmis_mo_1256 where fld_1256_1 in("+h_listmocode+");delete gmis_mo_1257 where fld_1257_1 in("+h_listmocode+");delete gmis_mo_1258 where fld_1258_1 in("+h_listmocode+");delete gmis_mo_1259 where fld_1259_1 in("+h_listmocode+")";
    string exeinfo=db.UpdateTable();
    if (exeinfo == "操作成功！")
    {
        Response.Redirect("pop_1244_5.aspx"); 
    }
}    
</script>
<body >
<form id="form1" runat="server"><input id="checkedlist" runat="server" type="hidden"/>
    <!--选项卡-->
        <!--选项卡-->
        <!--操作工具条-->
        <!--#include file="toolbarleft.aspx"-->
        <!--右边固定按钮-->
        <!--#include file="toolbar.aspx"-->
                <td valign="bottom"  class="btn_text" style="padding-left:10px"> 
								  <!--取消条件-->
								  <G:Button id="btn_s_clear" type="toolbar" mode="on" icon="shanchuanniu" text="删除"  url="javascript:Delete_All()" runat=server></G:Button>
								  <!--取消条件-->
								  <asp:LinkButton ID="btn_delete" runat="server" OnClick="Delete_All"></asp:LinkButton>
								  </td>
        <!--右边固定按钮-->
        <!--#include file="toolbarright.aspx"-->
        <!--操作工具条-->
<G:listtable id="list_1244" runat="server" showallline="false" IsProPage="true">
<G:template id="temp_head" runat="server" type="head">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
    <tr class="tr_listtitle">
        <td width="10%" align="left">
           <input id="ch_all" name="checkbox" type="checkbox" onclick="__CheckAll(this)" value="checkbox"> &nbsp;</td>
        <td width="80%" align="left">
            模块名称</td>
        <td width="10%" align="center">
            操作</td>
    </tr>
</G:template>
<G:template id="temp_data" runat="server">
    <tr class="tr_listcontent">
        <td width="10%" align="left">
            <input id="chk_*" name="checkbox" type="checkbox" onclick="__CheckArticleList(this)" value="checkbox"></td>
        <td width="80%" align="left">
           * </td>
        <td width="10%" align="center">
           * </td>
    </tr>
</G:template>
<G:template id="temp_kong" runat="server">
    <tr class="tr_listcontent">
        <td width="10%" align="left">
            </td>
        <td width="80%" align="left">
            </td>
        <td width="10%" align="center">
            </td>
    </tr>
</G:template>
</G:listtable>
</form>
</body>
<script language="javascript">
function Delete_All()
{
    if(confirm("确定删除选中项！"))
    {
        __doPostBack('btn_delete','');
    }
}
function __CheckArticleList(obj){
			var fold = document.getElementById("checkedlist");
			fold.value = fold.value.replace(/\s+/,"");
			if(fold.value.length == 0){
				fold.value = ",";
			}
			if(obj.checked == true){
				fold.value = fold.value+obj.id.substr(4)+",";
			}else{
				fold.value = (fold.value).replace(","+obj.id.substr(4)+",",",");
			}
		}
		function __CheckAll(obj){
			var fold = document.getElementById("checkedlist");
			fold.value = ",";
            var kchks = document.body.getElementsByTagName("input");
            for(i=0;i<kchks.length;i++){
                if(kchks[i].id.indexOf("chk_")==0){
                    if(obj.checked){
                        kchks[i].checked = true;
                        fold.value += kchks[i].id.substr(4)+",";
                    }else{
                        kchks[i].checked = false;
                    }
                }
            }
            if(!obj.checked){
                fold.value = "";
            }
		}
</script>
</HTML>