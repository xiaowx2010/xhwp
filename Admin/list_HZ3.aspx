<!--�����ŷſ���Ⱦ���嵥,�б�ҳ-->
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
     
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
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
//ͳ��
private string GetCount(string _field)
{
    string value="0";
    db.SqlString = "select " + _field + " from gmis_mo_1154 where fld_1154_1='"+select_year.SelectedItem.Value+"'";
    DataTable dt = db.GetDataTable();
    if (dt != null&&dt.Rows.Count>0)
        value = dt.Rows[0][0].ToString();
    return value;
}
    //��ȡ��ǰ����
private string getDateNow()
{
    return DateTime.Now.Year + "��" + DateTime.Now.Month + "��" + DateTime.Now.Day + "��";
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

����function printsetup(){ 
����// ��ӡҳ������ 
����wb.execwb(8,1); 
����} 
����function printpreview(){ 
����// ��ӡҳ��Ԥ�� 
�������� 
����wb.execwb(7,1); 
���������� 
�������� 
����} 

����function printit() 
����{ 
����if (confirm('ȷ����ӡ��')) { 
����wb.execwb(6,6) 
����} 
����} 

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
<!--ѡ�-->
<!--ѡ�-->
<!--����������--> <div id="go" visible="true" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
   
            <td style="padding-left:5px;width:160px;" nowrap>
                ���:<asp:DropDownList ID="select_year" runat="server" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="select_year_SelectedIndexChanged"></asp:DropDownList>
            </td>
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<td style="padding-left:5px;width:55px;" nowrap>
                <G:Button id="btn_wordtxt" type="toolbar" mode="on" icon="word" text="����" Url="javascript:clickOutPutWord();"  runat="server"></G:Button>
            </td>
            <td style="padding-left:5px;width:55px;" nowrap>
                <G:Button id="btn_printtxt" type="toolbar" mode="on" icon="print" text="��ӡ" Url="javascript:clickPrint();" runat="server"></G:Button>
            </td>
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--></div>
<!--����������-->
<!--��̬����html,��ʼ-->
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
                                    ������Σ�շ��Ｏ�д������
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="80%" align="right" valign="top" style="padding-top: 25px; padding-right: 250px;">
                                    <%=select_year.SelectedItem.Value %>��
                                </td>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td class="font1220_000000">
                                                �� �ţ�������3��
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="font1220_000000">
                                                �Ʊ���أ�����������
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="font1220_000000">
                                                ��׼���أ�����ͳ�ƾ�
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="font1220_000000">
                                                ��׼�ĺţ���ͳ��[2008]��
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="font1220_000000">
                                                ��Ч��ֹʱ�䣺<span id="s_dt" contenteditable="true" style="width: 80px; background-color:#ffffff;"></span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1225_000000">
                            <tr>
                                <td align="left">
                                    �ۺϻ������ƣ�310118������
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
            ָ������
        </td>
        <td align="center" bgcolor="#e1e1e1">
            ������λ
        </td>
        <td align="center" bgcolor="#e1e1e1">
            ����
        </td>
        <td align="center" bgcolor="#e1e1e1">
            ����ʵ��
        </td>
        <td align="center" bgcolor="#e1e1e1">
            ָ������
        </td>
        <td align="center" bgcolor="#e1e1e1">
            ������λ
        </td>
        <td align="center" bgcolor="#e1e1e1">
            ����
        </td>
        <td align="center" bgcolor="#e1e1e1">
            ����ʵ��
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            1��Σ�շ��Ｏ�д��ó���
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            1
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--Σ�շ��Ｏ�д��ó���ͳ��--><%=GetCount("count(mocode)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ���У����ù�ҵΣ�շ�����
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            11
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--���ù�ҵΣ�շ�����ͳ��--><%=GetCount("sum(fld_1154_28)")%>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            ���У�����������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            2
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--����������ҵ¼��--><span id="input1" contenteditable="true" type="text" style="width:40px; background-color:#ffffff;" />
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ����ҽ�Ʒ�����
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            12
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--����ҽ�Ʒ�����ͳ��--><%=GetCount("sum(fld_1154_29)")%>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            2��Σ�շ���ʵ�ʴ�������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��/��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            3
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--Σ�շ���ʵ�ʴ�������ͳ��--><%=GetCount("sum(fld_1154_20)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��������Σ�շ�����
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            13
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--��������Σ�շ�����ͳ��--><%=GetCount("sum(fld_1154_30)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            ���У����մ�������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��/��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            4
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--���մ�������ͳ��--><%=GetCount("sum(fld_1154_21)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            4��Σ�շ����ۺ�������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            14
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--Σ�շ����ۺ�������ͳ��--><%=GetCount("sum(fld_1154_31)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            ����������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��/��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            5
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--����������ͳ��--><%=GetCount("sum(fld_1154_22)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            5�����ղ�������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            ���У������������մ�������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��/��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            6
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--�����������մ�������ͳ��--><%=GetCount("sum(fld_1154_23)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��1�����ղ�����
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            15
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--���ղ�����ͳ��--><%=GetCount("sum(fld_1154_32)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            ������������������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��/��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            7
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--������������������ͳ��--><%=GetCount("sum(fld_1154_24)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��2�����ղ���������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            16
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--���ղ���������ͳ��--><%=GetCount("sum(fld_1154_33)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            3��Σ�շ��ﴦ����
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            8
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--Σ�շ��ﴦ����ͳ��--><%=GetCount("sum(fld_1154_25)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��3�����ղ���������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            17
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--���ղ���������ͳ��--><%=GetCount("sum(fld_1154_34)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            ���У�������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            9
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--Σ�շ��ﴦ�÷�����ͳ��--><%=GetCount("sum(fld_1154_26)") %>
        </td>
        <td align="center" bgcolor="#FFFFFF">
            6���������з���
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��Ԫ
        </td>
        <td align="center" bgcolor="#FFFFFF">
            18
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--�������з���ͳ��--><%=GetCount("sum(fld_1154_35)") %>
        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="#FFFFFF">
            ������
        </td>
        <td align="center" bgcolor="#FFFFFF">
            ��
        </td>
        <td align="center" bgcolor="#FFFFFF">
            10
        </td>
        <td align="center" bgcolor="#FFFFFF">
            <!--Σ�շ��ﴦ��������ͳ��--><%=GetCount("sum(fld_1154_27)") %>
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
                        ��λ�����ˣ�
                    </td>
                    <td width="140" align="left">
                        <span type="text" contenteditable="true" style="width:100px; background-color:#ffffff;" />
                    </td>
                    <td width="130" align="right">
                        ͳ�Ƹ����ˣ�
                    </td>
                    <td width="140" align="left">
                        <span type="text" contenteditable="true" style="width:100px; background-color:#ffffff;" />
                    </td>
                    <td width="120" align="right">
                        ����ˣ�
                    </td>
                    <td width="140" align="left">
                        <span type="text" contenteditable="true" style="width:100px; background-color:#ffffff;" />
                    </td>
                    <td width="100" align="right">
                        �������ڣ�
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
<!--��̬����html,����-->
</form>
</body>
</html>
