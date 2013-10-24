<!--���ݹ���-�ֶ�ģ��-��ҵ���-->
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
        if (!IsPostBack)
        {
            BindListControl(selectlevel, "level", "leveltxt", "select distinct fld_45_2 as level,'�� '+cast(fld_45_2 as varchar(10))+' ��' as leveltxt from gmis_mo_45", "ȫ���㼶");
            if (GetSESSION("filter") != "")
            {
                //ʹ��������ʽȡ��Session�������     
                Regex r;
                Match m;
                r = new Regex(".*?fld_45_2=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
                m = r.Match(GetSESSION("filter"));
                if (m.Success)
                {
                    SetFilter(selectlevel, m.Result("${txt}"));
                }

            }
            else
            {
                SetFilter(selectlevel, "0");
            }
        }
        BindListData();//���б�ؼ�����Դ

    }
    public override void BeforeOutput(DataTable dt, int rowi)
    {	//����ǰҳ����

        DataRow dr = dt.Rows[rowi];
        if (mua.IndexOf(";3;") != -1)
        {
            dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";

        if (mua.IndexOf(";4;") != -1)
        {
            dr["btnstr"] += "<a href=\"javascript:if(confirm('ȷ��ɾ����')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"ɾ��\" align=\"absmiddle\" border=\"0\"></a>";
        }

        for (int i = 1; i < Convert.ToInt32(dr["level"].ToString()); i++)
        {
            dr["preTopic"] = "&nbsp;&nbsp;&nbsp;&nbsp;" + dr["preTopic"].ToString();
        }

    }
    private void BindListData()
    {
        string h_fstr = "";
        if (selectlevel.SelectedItem != null && selectlevel.SelectedItem.Value != "0")
        {
            h_fstr = " and fld_45_2=" + selectlevel.SelectedItem.Value + "";
        }

        int pagesize = GetListRows();//��ȡ�б�ÿҳ��ʾ�ļ�¼��
        int fromcount = Convert.ToInt32(navindex) * pagesize;//�����ѷ���ҳ���ļ�¼��
        string tablename = "gmis_mo_45";//���ݱ�����
        string orderstr = " order by fld_45_5";//��������;
        //�����б�ؼ���ʾ����
        list.Rows = pagesize;
        //�����б�ؼ�����Դ
        list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount,'' as preTopic,'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode,"+navindex+",fld_45_1 as ��������,case when fld_45_3=0 then '&nbsp;' else (select fld_45_1 from " + tablename + " t1 where t1.mocode=t2.fld_45_3 ) end as ֱ���ϼ� ,'' as btnstr,mocode,fld_45_2 as level from " + tablename + " t2 where mocode in (select top " + (fromcount + pagesize) + " mocode from " + tablename + " where 1=1 " + h_fstr + " " + orderstr + ") and mocode not in (select top " + fromcount + " mocode from " + tablename + " where 1=1 " + h_fstr + "" + orderstr + " ) " + h_fstr + " " + orderstr + " ";

    }
    //ɸѡ�㼶
    private void Change_Level(object sender, System.EventArgs e)
    {
        string h_fstr = "";
        if (selectlevel.SelectedItem != null && selectlevel.SelectedValue != "0")
        {
            h_fstr = " and fld_45_2='" + selectlevel.SelectedValue + "'";
        }
        SetSESSION("filter", h_fstr);
    }

</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
        <!--ѡ�-->
        <!--ѡ�-->
        <!--����������-->
        <!--#include file="toolbarleft.aspx"-->
        <!--����Զ��尴ť-->
        <td><asp:DropDownList ID="selectlevel" runat="server" style="width:120px;" AutoPostBack="true" OnSelectedIndexChanged="Change_Level"></asp:DropDownList></td>
        <!--����Զ��尴ť-->
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbar.aspx"-->
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbarright.aspx"-->
        <!--����������-->
        <G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
            <G:Template id="listtemphead" type="head" runat="server">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
                    <tr class="tr_listtitle">
                        <td>
                            &nbsp;</td>
                        <td  width=50%>��������</td>
			            <td width="40%">ֱ���ϼ�</td>
                        <td width="8%" align="center">
                            ����</td>
                    </tr>
            </G:Template>
            <G:Template id="listtemp1" runat="server">
                <tr class="tr_listcontent">
                    <td>
                        &nbsp;</td>
                    <td class="tdpadd-LR-3">
                        *<a href="view_45.aspx?aid=*&mid=*&id=*&navindex=*" title="�鿴��ϸ">*&nbsp;</a></td>
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
