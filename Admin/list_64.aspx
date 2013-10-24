<!--数据管理-字段管理-建设项目审批信息管理-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->

<script runat="server" language="C#">
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//设置工具条,同时获取固定URL参数  
        list.SqlStr = "select  '" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_64_1,(select fld_69_1 from gmis_mo_69 where gmis_mo_69.mocode=fld_64_2),(select fld_70_1 from gmis_mo_70 where gmis_mo_70.mocode=fld_64_4),'&nbsp;' btnstr from gmis_mo_64 order by mocode desc";
        list.Rows = GetListRows();
    }
    public override void BeforeOutput(DataTable dt, int rowi)
    {	//处理当前页数据

        DataRow dr = dt.Rows[rowi];
        if (mua.IndexOf(";3;") != -1)
        {
            dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
        }

        if (mua.IndexOf(";4;") != -1)
        {
            dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
        }

    }
</script>

<body style="padding: 10px; text-align: center">
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
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
                    <tr class="tr_listtitle">
                        <td width="40%" align="left">
                            项目名称</td>
                        <td width="25%" align="left">
                            审批类型</td>
                        <td width="25%" align="left">
                            审批状态</td>
                        <td width="9%" align="center">
                            操作</td>
                    </tr>
            </G:Template>
            <G:Template id="listtemp1" runat="server">
                <tr class="tr_listcontent">
                    <td class="tdpadd-LR-3">
                        <a href="view_64.aspx?aid=*&mid=*&id=*&navindex=*" title="查看明细">*&nbsp;</a></td>
                    <td class="tdpadd-icon">
                        *</td>
                    <td class="tdpadd-icon">
                        *</td>
                    <td class="tdpadd-icon" align="center">
                        *</td>
                </tr>
            </G:Template>
            <G:Template id="listtemp2" runat="server">
                <tr class="tr_listcontent">
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td> 
                    <td>
                        &nbsp;</td> 
                </tr>
            </G:Template>
             <G:NavStyle5 ID="NavStyle" PageUrl="getpage.aspx" runat="server"></G:NavStyle5>
        </G:ListTable>
        <!--动态生成结束-->
    </form>
</body>
</html>
