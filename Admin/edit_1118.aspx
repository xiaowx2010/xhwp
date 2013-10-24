<!--各地区生活及其他污染情况  环年综6表,编辑页-->
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
     
    SetToolBar();//设置工具条,同时获取固定URL参数    

    dtable = "gmis_HZ6";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_1118_1", "fld_1118_2", "fld_1118_3", "fld_1118_4", "fld_1118_5", "fld_1118_6", "fld_1118_7", "fld_1118_8", "fld_1118_9", "fld_1118_10", "fld_1118_11", "fld_1118_12", "fld_1118_13", "fld_1118_14", "fld_1118_15", "fld_1118_16", "fld_1118_17", "fld_1118_18", "fld_1118_19", "fld_1118_20", "fld_1118_21", "fld_1118_22", "fld_1118_23", "fld_1118_24", "creatorcode" };
    types = "1111111111111111111111111";
    if (!IsPostBack)
    {
        fld_1118_24.Items.Clear();
        for (int i = 0; i < 20; i++)
        {
            fld_1118_24.Items.Add(new ListItem((2019 - i).ToString(), (2019 - i).ToString()));
            
        }
        SetFilter(fld_1118_24, DateTime.Now.Year.ToString());
        if (id != "0")
        {
            guangye.BindData(dtable, filter, flds);
        }
    }
 }
//保存之前的数据处理
public override void BeforeSave()
{
    if (fld_1118_24.SelectedItem != null)
    {
        db.SqlString = "select mocode from gmis_HZ6 where fld_1118_24='" + fld_1118_24.SelectedItem.Value + "'";
        DataTable dt = db.GetDataTable();
        if (dt != null && dt.Rows.Count > 0)
        {
            SetSESSION("alert", "该年份数据已录入，请选择其他年份！");
            SetSESSION("sql", ""); 
            Response.Redirect("execommand.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&tid="+tid+"&id="+id+"&pid="+pid);
        }
    }
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
            <td style="padding-left:5px;width:160px;" nowrap>年份:<asp:DropDownList ID="fld_1118_24" runat="server" Width="100px"></asp:DropDownList>
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
        <tr>
            <td width="70%">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
                    <tr>
                        <td width="70%" align="right">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td align="center" class="font_2635B_000">
                                        各地区生活及其他污染情况
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1225_000000">
                                <tr>
                                    <td align="left">
                                        综合机关名称：310118青浦区
                                    </td>
                                    <td align="right" style="padding-right: 10px;">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--操作工具条-->
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000"
        class="font1225_black">
        <tr class="font1225_black">
            <td align="center" bgcolor="#e1e1e1">
                指标名称
            </td>
            <td align="center" bgcolor="#e1e1e1">
                计量单位
            </td>
            <td align="center" bgcolor="#e1e1e1">
                代码
            </td>
            <td align="center" bgcolor="#e1e1e1">
                本年实际
            </td>
            <td align="center" bgcolor="#e1e1e1">
                指标名称
            </td>
            <td align="center" bgcolor="#e1e1e1">
                计量单位
            </td>
            <td align="center" bgcolor="#e1e1e1">
                代码
            </td>
            <td align="center" bgcolor="#e1e1e1">
                本年实际
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                基本情况
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                5、城镇生活污水中化学需氧量产生系数
            </td>
            <td align="center" bgcolor="#FFFFFF">
                克/人.日
            </td>
            <td align="center" bgcolor="#FFFFFF">
                12
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_12" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                人口总数
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万人
            </td>
            <td align="center" bgcolor="#FFFFFF">
                1
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_1" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                6、城镇生活污水中化学需氧量产生
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                13
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_13" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                其中：城镇常住人口数
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万人
            </td>
            <td align="center" bgcolor="#FFFFFF">
                2
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_2" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                7、污水处理厂去除生活污水中的COD量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                14
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_14" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                2、煤炭消费总量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                3
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_3" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                8、城镇生活污水中化学需氧量排放量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                15
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_15" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                其中：工业煤碳消费总量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                4
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_4" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                9、城镇生活污水中氮氧产生系数
            </td>
            <td align="center" bgcolor="#FFFFFF">
                克/人.日
            </td>
            <td align="center" bgcolor="#FFFFFF">
                16
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_16" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                生活及其他煤炭消费量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                5
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_5" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                10、城镇生活污水中氨氮产生量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                17
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_17" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                3、生活及其他煤碳含硫量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                %
            </td>
            <td align="center" bgcolor="#FFFFFF">
                6
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_6" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                11、污水处理厂去除生活污水中氨氮量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                18
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_18" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                4、生活及其他煤碳灰份
            </td>
            <td align="center" bgcolor="#FFFFFF">
                %
            </td>
            <td align="center" bgcolor="#FFFFFF">
                7
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_7" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                12、城镇生活污水中氨氮排放量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                19
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_19" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                二、污染排放情况
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                13、生活及其它二氧化硫排放量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                20
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_20" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                1、城镇生活污水排放系数
            </td>
            <td align="center" bgcolor="#FFFFFF">
                千克/人.日
            </td>
            <td align="center" bgcolor="#FFFFFF">
                8
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_8" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                14、生活及其他烟尘排放量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                21
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_21" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                2、城镇生活污水排放量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                9
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_9" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                15、生活及其它氮氧化物排放量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                22
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_22" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                3、城镇生活污水处理量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                10
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_10" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                其中：公路交通氮氧化物排放量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                23
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_23" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                4、城镇生活污水处理率
            </td>
            <td align="center" bgcolor="#FFFFFF">
                %
            </td>
            <td align="center" bgcolor="#FFFFFF">
                11
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_11" runat="server" style="width:40px" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                 &nbsp;
            </td>
        </tr>
    </table>
<!--动态生成html,结束-->
</form>
</body>
</html>
