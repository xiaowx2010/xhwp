<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
	<script runat="server" language="C#">
        private void Page_Load(object sender, System.EventArgs e)
        {
            SetToolBar();//设置工具条,同时获取固定URL参数
           
            list.Rows = GetListRows();

            list.SqlStr = GetListSQL(Convert.ToInt32(navindex) * list.Rows, list.Rows);
        }
        private string GetListSQL(int fromcount, int pagerows)
        {
            return "declare @allcount int;select @allcount=count(1) from gmis_dept;select @allcount as allcount,'" + StringUtility.StringToBase64("view") + "'," + mid + ",deptcode," + navindex + ",deptname,'&nbsp;' as btnstr from gmis_dept where deptcode not in (select top " + fromcount + " deptcode from gmis_dept order by deptname) and deptcode in (select top " + (fromcount + pagerows) + " deptcode from gmis_dept order by deptname) order by deptname";
        }
        public override void BeforeOutput(DataTable dt, int rowi)
        {	//处理当前页数据
            DataRow dr = dt.Rows[rowi];
            if (mua.IndexOf(";3;") != -1)
            {
                dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["deptcode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
            }
 
            if (mua.IndexOf(";4;") != -1)
            {
                dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["deptcode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
            }

        }
	</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 	
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	<!--#include file="toolbarright.aspx"-->   
<!--操作工具条-->
<G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
<G:Template id="listtemphead" type="head" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
    <tr class="tr_listtitle">
        <td>&nbsp;</td>
		<td width="91%" align="left">部门名称：</td>
		<td width="8%" align="center">操作</td>
    </tr>
</G:Template>
<G:Template id="listtemp1" runat="server">
    <tr class="tr_listcontent">
        <td>&nbsp;</td>
        <td align="left"><a href="view_dept.aspx?aid=*&mid=*&id=*&navindex=*" title="查看明细">*</a></td>
        <td align="center">*</td>
    </tr>
</G:Template>
<G:Template id="listtemp2" runat="server">
    <tr  class="tr_listcontent">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr> 
 </G:Template>
<G:NavStyle5 id="Navstyle2" class="tdbgground_nav" runat="server" prevtext="上一页" nexttext="下一页"></G:NavStyle5>
</G:ListTable>
</form>
</body>
</html>
