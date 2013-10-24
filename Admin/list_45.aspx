<!--数据管理-字段模块-行业类别-->
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
        if (!IsPostBack)
        {
            BindListControl(selectlevel, "level", "leveltxt", "select distinct fld_45_2 as level,'第 '+cast(fld_45_2 as varchar(10))+' 级' as leveltxt from gmis_mo_45", "全部层级");
            if (GetSESSION("filter") != "")
            {
                //使用正则表达式取出Session里的条件     
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
        BindListData();//绑定列表控件数据源

    }
    public override void BeforeOutput(DataTable dt, int rowi)
    {	//处理当前页数据

        DataRow dr = dt.Rows[rowi];
        if (mua.IndexOf(";3;") != -1)
        {
            dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";

        if (mua.IndexOf(";4;") != -1)
        {
            dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
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

        int pagesize = GetListRows();//获取列表每页显示的记录数
        int fromcount = Convert.ToInt32(navindex) * pagesize;//计算已翻过页数的记录数
        string tablename = "gmis_mo_45";//数据表名称
        string orderstr = " order by fld_45_5";//排序条件;
        //设置列表控件显示行数
        list.Rows = pagesize;
        //设置列表控件数据源
        list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount,'' as preTopic,'" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode,"+navindex+",fld_45_1 as 分类名称,case when fld_45_3=0 then '&nbsp;' else (select fld_45_1 from " + tablename + " t1 where t1.mocode=t2.fld_45_3 ) end as 直属上级 ,'' as btnstr,mocode,fld_45_2 as level from " + tablename + " t2 where mocode in (select top " + (fromcount + pagesize) + " mocode from " + tablename + " where 1=1 " + h_fstr + " " + orderstr + ") and mocode not in (select top " + fromcount + " mocode from " + tablename + " where 1=1 " + h_fstr + "" + orderstr + " ) " + h_fstr + " " + orderstr + " ";

    }
    //筛选层级
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
        <!--选项卡-->
        <!--选项卡-->
        <!--操作工具条-->
        <!--#include file="toolbarleft.aspx"-->
        <!--左边自定义按钮-->
        <td><asp:DropDownList ID="selectlevel" runat="server" style="width:120px;" AutoPostBack="true" OnSelectedIndexChanged="Change_Level"></asp:DropDownList></td>
        <!--左边自定义按钮-->
        <!--右边固定按钮-->
        <!--#include file="toolbar.aspx"-->
        <!--右边固定按钮-->
        <!--#include file="toolbarright.aspx"-->
        <!--操作工具条-->
        <G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
            <G:Template id="listtemphead" type="head" runat="server">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
                    <tr class="tr_listtitle">
                        <td>
                            &nbsp;</td>
                        <td  width=50%>分类名称</td>
			            <td width="40%">直属上级</td>
                        <td width="8%" align="center">
                            操作</td>
                    </tr>
            </G:Template>
            <G:Template id="listtemp1" runat="server">
                <tr class="tr_listcontent">
                    <td>
                        &nbsp;</td>
                    <td class="tdpadd-LR-3">
                        *<a href="view_45.aspx?aid=*&mid=*&id=*&navindex=*" title="查看明细">*&nbsp;</a></td>
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
        <!--动态生成结束-->
    </form>
</body>
</html>
