<!--���ݹ���-�ֶι���-�ŷſ���Ⱦ���嵥-->
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
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
        list.SqlStr = "select  '" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",(select fld_1205_1 from gmis_mo_1205 where gmis_mo_1205.mocode=fld_57_4),fld_57_3,(select fld_55_1 from gmis_mo_55 where gmis_mo_55.mocode=fld_57_2),'&nbsp;' btnstr from gmis_mo_57 order by mocode desc";
        list.Rows = GetListRows();
        SetSESSION("extinfo", "57");
    }
    public override void BeforeOutput(DataTable dt, int rowi)
    {	//����ǰҳ����

        DataRow dr = dt.Rows[rowi];
        if (mua.IndexOf(";3;") != -1)
        {
            dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
        }

        if (mua.IndexOf(";4;") != -1)
        {
            dr["btnstr"] += "<a href=\"javascript:if(confirm('ȷ��ɾ����')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"ɾ��\" align=\"absmiddle\" border=\"0\"></a>";
        }

    }
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
        <!--ѡ�-->
        <!--ѡ�-->
        <!--����������-->
        <!--#include file="toolbarleft.aspx"-->
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbar.aspx"-->
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbarright.aspx"-->
        <!--����������-->
        <G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
            <G:Template id="listtemphead" type="head" runat="server">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
                    <tr class="tr_listtitle">
                          <td width="35%" align="left">
                            ��Ⱦ������</td>
                        <td width="20%" align="left">
                            ��Ⱦ�����</td>                    
                        <td width="35%" align="left">
                            ��Ⱦ�����</td>
                        <td width="10%" align="center">
                            ����</td>
                    </tr>
            </G:Template>
            <G:Template id="listtemp1" runat="server">
                <tr class="tr_listcontent">
                    <td class="tdpadd-LR-3">
                        <a href="view_57.aspx?aid=*&mid=*&id=*&navindex=*" title="�鿴��ϸ">*&nbsp;</a></td>
                    <td class="tdpadd-icon">
                        *</td>
                    <td class="tdpadd-icon">
                        *</td>
                    <td class="tdpadd-icon">
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
        <!--��̬���ɽ���-->
    </form>
</body>
</html>
