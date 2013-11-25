<!--企业信息,查看页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"   %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string hycode = "";
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();//设置工具条,同时获取固定URL参数
	string orgcode = GetQueryString("orgcode","");
	hycode = GetQueryString("hycode","");
//    Response.Write(orgcode);
    string sql = " isnull(fld_1396_22,'')+isnull(fld_1396_23,'')+isnull(fld_1396_40,'')+isnull(fld_1396_41,'')+isnull(fld_1396_9,''),fld_1396_1,fld_1396_14,fld_1396_41,fld_1396_6,fld_1396_30,fld_1396_31,(select fld_1157_1+'|'+fld_1157_2 as name from gmis_mo_1157 where fld_1157_1=fld_1396_32),(select fld_1162_1+'|'+fld_1162_2 as name from gmis_mo_1162 where fld_1162_1=fld_1396_33),cast(fld_1396_16 as varchar)+'°'+cast(fld_1396_17 as varchar)+''''+cast(fld_1396_18 as varchar)+'\"'";
	db.SqlString = "select fld_1396_2,"+sql+" ,cast(fld_1396_26 as varchar)+'°'+cast(fld_1396_27 as varchar)+''''+cast(fld_1396_28 as varchar)+'\"',fld_1396_19,fld_1396_12,fld_1396_10,fld_1396_42,cast(fld_1396_34 as varchar)+'年'+cast(fld_1396_35 as varchar)+'月' from gmis_mo_1396 where fld_1396_1='"+orgcode+"'";
    DataTable dt = db.GetDataTable();
    if (dt.Rows.Count==0)
    {
        string newcode = GetFieldData("select newcode from gmis_old_new_code where oldcode='"+orgcode+"'");
        if (newcode != "" && newcode != null){
            orgcode = newcode;
            view.SqlStr = "select fld_1396_2,"+sql+" ,cast(fld_1396_26 as varchar)+'°'+cast(fld_1396_27 as varchar)+''''+cast(fld_1396_28 as varchar)+'\"',fld_1396_19,fld_1396_12,fld_1396_10,fld_1396_42,cast(fld_1396_34 as varchar)+'年'+cast(fld_1396_35 as varchar)+'月' from gmis_mo_1396 where fld_1396_1='"+orgcode+"'";
        }
    }
    else{
         view.DataTable = dt;
    }
	iframe_1199.Attributes["src"] = "iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;

}

</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
     <table width="100%">
         <tr>
             <td>
                 <iframe id="iframe_1199" runat="server" frameborder="0" width="100%" height="25"
                     scrolling="no"></iframe>
             </td>
         </tr>
     </table>
<!--选项卡-->
<!--操作工具条-->
<div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"-->
			<!--右边固定按钮-->
			<!--#include file="toolbar_17.aspx"-->

			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"-->
</div>
<!--操作工具条-->
<!--动态生成html,开始-->
<G:Content id="view" runat="server" Alert="<font size=8 color=red>本年度该企业无数据</font>">
<G:Template id="Template1" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:10px;">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">企业名称:</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">企业详细地址:</td>
		<td colspan="3" class="td_viewcontent_content" >*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">企业代码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title">法定代表人:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">行政区域:</td>
		<td class="td_viewcontent_content">
			*&nbsp;
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">行政区划代码:</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">行业类别:</td>
		<td class="td_viewcontent_content">
			*&nbsp;
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">行业代码:</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">登记注册类型:</td>
		<td class="td_viewcontent_content" style="width:35%">
		*&nbsp;
		</td>

		<td width="100" align="right"  class="td_viewcontent_title">企业规模:</td>
		<td class="td_viewcontent_content" style="width:35%">
		*&nbsp;
		</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">中心经度:</td>
		<td class="td_viewcontent_content" style="width:35%">
		*&nbsp;
		</td>

		<td width="100" align="right"  class="td_viewcontent_title">中心纬度:</td>
		<td class="td_viewcontent_content" style="width:35%">
		*&nbsp;
		</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">联系人姓名:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>

		<td width="100" align="right"  class="td_viewcontent_title">联系人电话:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">传真号码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>

		<td width="100" align="right"  class="td_viewcontent_title">邮政编码:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">开业时间:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>

		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
	</tr>
</table>
</G:Template>
</G:Content>
<!--动态生成html,结束-->
</form>
</body>
</html>
