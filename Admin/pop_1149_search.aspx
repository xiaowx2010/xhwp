<!--查询编辑页,列表页-->

<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <base target="_self"></base>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->

<script language="C#" runat="server">
    private void Page_Load(object sender, System.EventArgs e)
    {
        string h_key = GetQueryString("keynumber", "");
        string h_year = GetQueryString("keyyear", "");
        mid = GetQueryString("mid", "0");
      //Response.Expires = -1;
        SetToolBar();//设置工具条,同时获取固定URL参数    
        list.SqlStr = "select fld_1149_2,min(fld_1149_4),min(fld_1149_1),'' as btnstr,min(mocode) as minmocode from " + GetModuleTableName("1149") + " where fld_1149_1='" + h_year + "' and fld_1149_2 like '%" + h_key + "%' group by fld_1149_2";
        //Response.Write(list.SqlStr);
               list.Rows = list.DataTable.Rows.Count;
        if (list.DataTable.Rows.Count == 1)
        {
            //bindmocode.Value = list.DataTable.Rows[0]["mocode"].ToString();
            //onlyone.Value="1";
            //Hidden1.Value=list.DataTable.Rows[0][0].ToString();
        }
		tb_2.Visible = false;
    }

    //处理当前页数据，处理操作列显示的操作
    public override void BeforeOutput(DataTable dt, int rowi)
    {
        DataRow dr = dt.Rows[rowi];
        //db.SqlString="select top 1 mocode from " + GetModuleTableName("1149") + " where fld_1149_2='"+dr["fld_1149_2"].ToString()+"'";

        dr["btnstr"] += "<a href=\"javascript:chooseOne('" + mid + "','" + dr["minmocode"].ToString() + "','" + StringUtility.StringToBase64("edit") + "');\"><img src=\"images/icons/selectall.gif\" title=\"确认\" align=\"absmiddle\" border=\"0\"></a>";

    }

</script>

<script type="text/javascript">
function chooseOne(arg1,arg2,arg3)
{     
opener.window.location.href="getpage.aspx?aid="+arg3+"&mid="+arg1+"&id="+arg2+"";
    closeThis();
}

function closeThis()
{
    opener=null;
    window.close();
}
function check1()
{
//    if(document.getElementById('onlyone').value=='1')
//    {
//    chooseOne(document.getElementById('Hidden1').value);
//    }
}
</script>

<body style="padding: 10px; text-align: center" onload="check1()">
    <form id="form1" runat="server">
    <!--选项卡-->
    <!--选项卡-->
    <!--动态生成html,开始-->
    <input type="hidden" id="onlyone" runat="server" value="0" />
    <input type="hidden" id="Hidden1" runat="server" value="0" />
    <G:ListTable ID="list" IsProPage="true" runat="server">
        <G:Template id="listtemphead" type="head" runat="server">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
                <tr class="tr_listtitle" align="left">
                   <%-- <td>
                        &nbsp;
                    </td>--%>
                    <td width="15%">
                        企业法人代码
                    </td>
                    <td width="10%">
                        填报单位详细名称
                    </td>
                    <td width="10%">
                        统计年份
                    </td>
                    <td align="center" width="10%">
                        操作
                    </td>
                </tr>
        </G:Template>
        <G:Template id="listtemp1" runat="server">
            <tr class="tr_listcontent">            
                <td>
                    *
                </td>
                <td>
                    *
                </td>
                <td>
                    *
                </td>
                <td align="center" style="padding-top: 3px;">
                    *
                </td>
            </tr>
        </G:Template>
        <G:Template id="listtemp2" runat="server">
            <tr class="tr_listcontent">
                
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </G:Template>
    </G:ListTable>
    <input id="bindmocode" value="0" type="hidden" runat="server" />

    <script type="text/javascript" defer>
	if(document.getElementById("bindmocode").value!="0")
	{
	    chooseOne(document.getElementById("bindmocode").value);
	}
	</script>

    <!--操作工具条-->
    <!--#include file="toolbarleft.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbar.aspx"-->
    <td style="padding-right: 5px;" nowrap>
        <G:Button Text="取 消" type="toolbar" mode="on" url="javascript:closeThis();" runat="server">
        </G:Button>
    </td>
    <!--右边固定按钮-->
    <!--#include file="toolbarright.aspx"-->
    <!--操作工具条-->
    </form>
</body>
</html>
