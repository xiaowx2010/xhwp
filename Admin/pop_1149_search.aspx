<!--��ѯ�༭ҳ,�б�ҳ-->

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
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
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

    //����ǰҳ���ݣ������������ʾ�Ĳ���
    public override void BeforeOutput(DataTable dt, int rowi)
    {
        DataRow dr = dt.Rows[rowi];
        //db.SqlString="select top 1 mocode from " + GetModuleTableName("1149") + " where fld_1149_2='"+dr["fld_1149_2"].ToString()+"'";

        dr["btnstr"] += "<a href=\"javascript:chooseOne('" + mid + "','" + dr["minmocode"].ToString() + "','" + StringUtility.StringToBase64("edit") + "');\"><img src=\"images/icons/selectall.gif\" title=\"ȷ��\" align=\"absmiddle\" border=\"0\"></a>";

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
    <!--ѡ�-->
    <!--ѡ�-->
    <!--��̬����html,��ʼ-->
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
                        ��ҵ���˴���
                    </td>
                    <td width="10%">
                        ���λ��ϸ����
                    </td>
                    <td width="10%">
                        ͳ�����
                    </td>
                    <td align="center" width="10%">
                        ����
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

    <!--����������-->
    <!--#include file="toolbarleft.aspx"-->
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbar.aspx"-->
    <td style="padding-right: 5px;" nowrap>
        <G:Button Text="ȡ ��" type="toolbar" mode="on" url="javascript:closeThis();" runat="server">
        </G:Button>
    </td>
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbarright.aspx"-->
    <!--����������-->
    </form>
</body>
</html>
