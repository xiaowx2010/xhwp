<!--废气排放口污染物清单,列表页-->
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
    if (!IsPostBack)
    {
        BindListData();
    }
    tb_2.Visible = false;
 }

private void BindListData()
{
    BindListControl(select_year, "fld_1155_1", "fld_1155_1", "select  DISTINCT fld_1155_1 from gmis_mo_1155 order by fld_1155_1 desc");
    
    
}

private void select_year_SelectedIndexChanged(object sender, EventArgs e)
{
    
}
//统计
private string GetCount(string _module,string _field,double _t)
{
    string value="0";
    if(_module=="1118")
        db.SqlString = "select " + _field + " from gmis_HZ6 where fld_" + _module + "_24='" + select_year.SelectedItem.Value + "'";
    else
        db.SqlString = "select " + _field + " from gmis_mo_"+_module+" where fld_"+_module+"_1='"+select_year.SelectedItem.Value+"'";
    //Response.Write( db.SqlString);
    DataTable dt = db.GetDataTable();
    if (dt != null && dt.Rows.Count > 0)
    {
        if (dt.Rows[0][0].ToString() != "")
        {
            if (_t == 0)
                value = dt.Rows[0][0].ToString();
            else
                value = (Convert.ToInt32(dt.Rows[0][0].ToString()) * _t).ToString();
        }
    }
    if (value.IndexOf("E-") != -1)
    {
        int n = Convert.ToInt32(value.Trim().Substring(value.IndexOf("E-")).Replace("E-", ""));
        int m = value.IndexOf(".");
        string h_temp = "";
        for (int i = 0; i < m + n - 1; i++)
        {
            h_temp += "0";
        }
        value = "0." + h_temp + value.Substring(0, value.IndexOf("E")).Replace(".", "");
    }
    return value;
}
//获取当前日期
private string getDateNow()
{
    return DateTime.Now.Year + "年" + DateTime.Now.Month + "月" + DateTime.Now.Day + "日";
}

private void Click_Toolbar(object sender, System.EventArgs e)
{
    string idstr = ((Control)sender).ID.ToLower();

    switch (idstr)
    {
        case "btn_word":
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "GB2312";
            Response.AppendHeader("Content-Disposition", "attachment;filename=FileName.doc");
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
            Response.ContentType = "application/ms-word";
            this.EnableViewState = false;
            System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
            System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
            System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
            oHtmlTextWriter.Write(hiddenHtml.Value);
            Response.Write(oStringWriter.ToString());
            Response.End();
            break;
        case "btn_print":
            Session["html"] = hiddenHtml.Value;
            Page.RegisterStartupScript("print", "<scrip" + "t>window.open('tempview.aspx', 'newwindow', 'height=600,width=800,top=30,left=30,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no')</" + "script>");
            break;
    }
}
</script>
<script type="text/javascript">

　　function printsetup(){ 
　　// 打印页面设置 
　　wb.execwb(8,1); 
　　} 
　　function printpreview(){ 
　　// 打印页面预览 
　　　　 
　　wb.execwb(7,1); 
　　　　　 
　　　　 
　　} 

　　function printit() 
　　{ 
　　if (confirm('确定打印吗？')) { 
　　wb.execwb(6,6) 
　　} 
　　} 

    function clickOutPutWord()
    {
       document.getElementById("hiddenHtml").value=document.getElementById("divhtml").innerHTML;
       __doPostBack("btn_word","");
    }
    function clickPrint()
    {
        document.getElementById("hiddenHtml").value=document.getElementById("divhtml").innerHTML;
       __doPostBack("btn_print","");
    }
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条--> <div id="go" visible="true" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
   
            <td style="padding-left:5px;width:160px;" nowrap>
                年份:<asp:DropDownList ID="select_year" runat="server" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="select_year_SelectedIndexChanged"></asp:DropDownList>
            </td>
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<td style="padding-left:5px;width:55px;" nowrap>
                <G:Button id="btn_wordtxt" type="toolbar" mode="on" icon="word" text="导出" Url="javascript:clickOutPutWord();"  runat="server"></G:Button>
            </td>
            <td style="padding-left:5px;width:55px;" nowrap>
                <G:Button id="btn_printtxt" type="toolbar" mode="on" icon="print" text="打印" Url="javascript:clickPrint();" runat="server"></G:Button>
            </td>
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--></div>
<!--操作工具条-->
<!--动态生成html,开始-->
<input id="hiddenHtml" type="hidden" runat="server" />
<asp:LinkButton ID="btn_word" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<asp:LinkButton ID="btn_print" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<div id="divhtml" >
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
        <tr>
            <td width="70%">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
                    <tr>
                        <td width="70%" align="right">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td align="center" class="font_2635B_000">
                                        各地区城市污水处理情况
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="80%" align="right" valign="top" style="padding-top: 25px; padding-right: 250px;">
                                        <%=select_year.SelectedItem.Value %>年
                                    </td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="font1220_000000">
                                                    表 号：环年综4表
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font1220_000000">
                                                    制表机关：环境保护部
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font1220_000000">
                                                    批准机关：国家统计局
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font1220_000000">
                                                    批准文号：国统制[2008]号
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="font1220_000000">
                                                    有效截止时间：<span id="s_dt" contenteditable="true" style="width: 80px; background-color:#ffffff;"></span>
                                                </td>
                                            </tr>
                                        </table>
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
        style="font-size: 12px;line-height: 25px;" >
        <tr style="font-size: 12px;line-height: 25px;" >
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
                1、污水处理厂数
            </td>
            <td align="center" bgcolor="#FFFFFF">
                座
            </td>
            <td align="center" bgcolor="#FFFFFF">
                1
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--污水处理厂数统计--><%=GetCount("1155","count(mocode)",0) %>
            </td>
            <td align="center" bgcolor="#FFFFFF">
                其中：处置工业废水量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                14
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--处置工业废水量统计--><%=GetCount("1147", "sum(fld_1147_10)", 0.0001)%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                其中：当年新增的
            </td>
            <td align="center" bgcolor="#FFFFFF">
                座
            </td>
            <td align="center" bgcolor="#FFFFFF">
                2
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--当年新增录入--><span id="input1" contenteditable="true" type="text" style="width:40px; background-color:#ffffff;" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                污水再生利用量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                15
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--污水再生利用量统计--><%=GetCount("1155", "sum(fld_1155_26)", 0)%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                2、污水处理厂设计处理能力
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万吨/日
            </td>
            <td align="center" bgcolor="#FFFFFF">
                3
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--污水处理厂设计处理能力统计--><%=GetCount("1155", "sum(fld_1155_23)", 0.0001)%>
            </td>
            <td align="center" bgcolor="#FFFFFF">
                8、化学需氧量去除量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                16
            </td>
            <td align="center" bgcolor="#FFFFFF">
               <!--化学需氧量去除量统计--><%=Convert.ToDouble(GetCount("1118", "sum(fld_1118_14)", 0)) + Convert.ToDouble(GetCount("1147", "sum(fld_1147_15)", 0.001))%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                其中：当年新增的
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万吨/日
            </td>
            <td align="center" bgcolor="#FFFFFF">
                4
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--当年新增录入--><span id="Span1" contenteditable="true" type="text" style="width:40px; background-color:#ffffff;" />
            </td>
            <td align="center" bgcolor="#FFFFFF">
                9、氨氮去除量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                17
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--化学需氧量去除量统计--><%=Convert.ToDouble(GetCount("1118", "sum(fld_1118_18)", 0)) + Convert.ToDouble(GetCount("1147", "sum(fld_1147_16)", 0.001))%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                3、工业废[污]水集中处理装置数
            </td>
            <td align="center" bgcolor="#FFFFFF">
                座
            </td>
            <td align="center" bgcolor="#FFFFFF">
                5
            </td>
            <td align="center" bgcolor="#FFFFFF">
                0
            </td>
            <td align="center" bgcolor="#FFFFFF">
                10、总磷去除量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                18
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--总磷去除量统计--><%=GetCount("1155", "sum((fld_1155_31-fld_1155_32)*(fld_1155_25*10000000000000)/100000000000)", 0)%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                其中：当年新增的
            </td>
            <td align="center" bgcolor="#FFFFFF">
                座
            </td>
            <td align="center" bgcolor="#FFFFFF">
                6
            </td>
            <td align="center" bgcolor="#FFFFFF">
                0
            </td>
            <td align="center" bgcolor="#FFFFFF">
                11、污泥产生量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                19
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--污泥产生量统计--><%=GetCount("1155", "sum(fld_1155_33)", 0)%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                4、集中处理装置废水处理能力
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨/日
            </td>
            <td align="center" bgcolor="#FFFFFF">
                7
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                12、污泥处置量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                20
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--污泥处置量统计--><%=GetCount("1155", "sum(fld_1155_34)", 0)%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                其中：当年新增的
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨/日
            </td>
            <td align="center" bgcolor="#FFFFFF">
                8
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                13、污泥利用量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                21
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--污泥利用量统计--><%=GetCount("1155", "sum(fld_1155_35)", 0)%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                5、其他污水集中处理装置数
            </td>
            <td align="center" bgcolor="#FFFFFF">
                座
            </td>
            <td align="center" bgcolor="#FFFFFF">
                9
            </td>
            <td align="center" bgcolor="#FFFFFF">
                0
            </td>
            <td align="center" bgcolor="#FFFFFF">
                14、污泥排放量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                22
            </td>
            <td align="center" bgcolor="#FFFFFF">
                 <!--污泥排放量统计--><%=GetCount("1155", "sum(fld_1155_36)", 0)%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                其中：当年新增的
            </td>
            <td align="center" bgcolor="#FFFFFF">
                座
            </td>
            <td align="center" bgcolor="#FFFFFF">
                10
            </td>
            <td align="center" bgcolor="#FFFFFF">
                0
            </td>
            <td align="center" bgcolor="#FFFFFF">
                15、本年运行费用
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万元
            </td>
            <td align="center" bgcolor="#FFFFFF">
                23
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--本年运行费用统计--><%=GetCount("1155", "sum(fld_1155_37)", 0)%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                6、其他集中处理装置处理能力
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨/日
            </td>
            <td align="center" bgcolor="#FFFFFF">
                11
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                其中：政府补贴
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万元
            </td>
            <td align="center" bgcolor="#FFFFFF">
                24
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--政府补贴统计--><%=GetCount("1155", "sum(fld_1155_38)", 0)%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                其中：当年新增的
            </td>
            <td align="center" bgcolor="#FFFFFF">
                吨/日
            </td>
            <td align="center" bgcolor="#FFFFFF">
                12
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                收费
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万元
            </td>
            <td align="center" bgcolor="#FFFFFF">
                25
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--收费统计--><%=GetCount("1155", "sum(fld_1155_39)", 0)%>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                7、污水年处理量
            </td>
            <td align="center" bgcolor="#FFFFFF">
                万吨
            </td>
            <td align="center" bgcolor="#FFFFFF">
                13
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <!--污水年处理量统计--><%=GetCount("1155", "sum(fld_1155_25)", 0)%>
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
        <tr>
            <td colspan="8" align="center" bgcolor="#FFFFFF">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px;line-height: 25px;" >
                    <tr style="font-size: 12px;line-height: 25px;" >
                        <td width="100" align="right">
                            单位负责人：
                        </td>
                        <td width="140" align="left">
                            <span type="text" contenteditable="true" style="width:100px; background-color:#ffffff;" />
                        </td>
                        <td width="130" align="right">
                            统计负责人：
                        </td>
                        <td width="140" align="left">
                            <span type="text" contenteditable="true" style="width:100px; background-color:#ffffff;" />
                        </td>
                        <td width="120" align="right">
                            填表人：
                        </td>
                        <td width="140" align="left">
                            <span type="text" contenteditable="true" style="width:100px; background-color:#ffffff;" />
                        </td>
                        <td width="100" align="right">
                            报出日期：
                        </td>
                        <td width="140" align="left">
                            <%=getDateNow() %>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<!--动态生成html,结束-->
</form>
</body>
</html>
