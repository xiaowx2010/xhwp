<!--废气排放口污染物清单,列表页-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
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
    BindListControl(select_year, "fld_1154_1", "fld_1154_1", "select  DISTINCT fld_1154_1 from gmis_mo_1154 order by fld_1154_1 desc");
    
    
}

private void select_year_SelectedIndexChanged(object sender, EventArgs e)
{
    
}
//统计
private string GetCount(string _field)
{
    string value="0";
    db.SqlString = "select " + _field + " from gmis_mo_1154 where fld_1154_1='"+select_year.SelectedItem.Value+"'";
    DataTable dt = db.GetDataTable();
    if (dt != null&&dt.Rows.Count>0)
        value = dt.Rows[0][0].ToString();
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
                                    各地区危险废物集中处置情况
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
                                                表 号：环年综3表
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
            1、危险废物集中处置厂数
        </td>
        <td align="center" bgcolor="#FFFFFF">
            座
        </td>
        <td align="center" bgcolor="#FFFFFF">
            1
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--危险废物集中处置厂数统计--><%=GetCount("count(mocode)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            其中：处置工业危险废物量
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨
        </td>
        <td align="center" bgcolor="#FFFFFF">
            11
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--处置工业危险废物量统计--><%=GetCount("sum(fld_1154_28)")%>
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
            <!--当年新增企业录入--><span id="input1" contenteditable="true" type="text" style="width:40px; background-color:#ffffff;" />
        </td>
        <td align="center" bgcolor="#FFFFFF">
            处置医疗废物量
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨
        </td>
        <td align="center" bgcolor="#FFFFFF">
            12
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--处置医疗废物量统计--><%=GetCount("sum(fld_1154_29)")%>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            2、危险废物实际处置能力
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨/日
        </td>
        <td align="center" bgcolor="#FFFFFF">
            3
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--危险废物实际处置能力统计--><%=GetCount("sum(fld_1154_20)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            处置其他危险废物量
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨
        </td>
        <td align="center" bgcolor="#FFFFFF">
            13
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--处置其他危险废物量统计--><%=GetCount("sum(fld_1154_30)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            其中：焚烧处置能力
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨/日
        </td>
        <td align="center" bgcolor="#FFFFFF">
            4
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--焚烧处置能力统计--><%=GetCount("sum(fld_1154_21)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            4、危险废物综合利用量
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨
        </td>
        <td align="center" bgcolor="#FFFFFF">
            14
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--危险废物综合利用量统计--><%=GetCount("sum(fld_1154_31)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            填埋处置能力
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨/日
        </td>
        <td align="center" bgcolor="#FFFFFF">
            5
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--填埋处置能力统计--><%=GetCount("sum(fld_1154_22)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            5、焚烧残渣流向
        </td>
        <td align="center" bgcolor="#FFFFFF">
            －
        </td>
        <td align="center" bgcolor="#FFFFFF">
            －
        </td>
        <td align="center" bgcolor="#FFFFFF">
            －
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            其中：当年新增焚烧处置能力
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨/日
        </td>
        <td align="center" bgcolor="#FFFFFF">
            6
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--当年新增焚烧处置能力统计--><%=GetCount("sum(fld_1154_23)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            （1）焚烧残渣量
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨
        </td>
        <td align="center" bgcolor="#FFFFFF">
            15
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--焚烧残渣量统计--><%=GetCount("sum(fld_1154_32)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            当年新增填埋处置能力
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨/日
        </td>
        <td align="center" bgcolor="#FFFFFF">
            7
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--当年新增填埋处置能力统计--><%=GetCount("sum(fld_1154_24)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            （2）焚烧残渣利用量
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨
        </td>
        <td align="center" bgcolor="#FFFFFF">
            16
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--焚烧残渣利用量统计--><%=GetCount("sum(fld_1154_33)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            3、危险废物处置量
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨
        </td>
        <td align="center" bgcolor="#FFFFFF">
            8
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--危险废物处置量统计--><%=GetCount("sum(fld_1154_25)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            （3）焚烧残渣填埋量
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨
        </td>
        <td align="center" bgcolor="#FFFFFF">
            17
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--焚烧残渣填埋量统计--><%=GetCount("sum(fld_1154_34)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            其中：焚烧量
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨
        </td>
        <td align="center" bgcolor="#FFFFFF">
            9
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--危险废物处置焚烧量统计--><%=GetCount("sum(fld_1154_26)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            6、本年运行费用
        </td>
        <td align="center" bgcolor="#FFFFFF">
            万元
        </td>
        <td align="center" bgcolor="#FFFFFF">
            18
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--本年运行费用统计--><%=GetCount("sum(fld_1154_35)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            填埋量
        </td>
        <td align="center" bgcolor="#FFFFFF">
            吨
        </td>
        <td align="center" bgcolor="#FFFFFF">
            10
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--危险废物处置填埋量统计--><%=GetCount("sum(fld_1154_27)") %>
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
