<!--���������������Ⱦ���  ������6��,�鿴ҳ-->
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
     
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
    view.SqlStr = "select fld_1118_12,fld_1118_1,fld_1118_13,fld_1118_2,fld_1118_14,fld_1118_3,fld_1118_15,fld_1118_4,fld_1118_16,fld_1118_5,fld_1118_17,fld_1118_6,fld_1118_18,fld_1118_7,fld_1118_19,fld_1118_8,fld_1118_20,fld_1118_9,fld_1118_21,fld_1118_10,fld_1118_22,fld_1118_11,fld_1118_23 from gmis_HZ6 where mocode="+id;
    //Response.Write(view.SqlStr);
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
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<td style="width:100%;" nowrap>
                &nbsp;
            </td>
			<td style="padding-left:5px;width:55px;" nowrap>
                <G:Button id="btn_wordtxt" type="toolbar" mode="on" icon="word" text="����" Url="javascript:clickOutPutWord();"  runat="server"></G:Button>
            </td>
            <td style="padding-left:5px;width:55px;" nowrap>
                <G:Button id="btn_printtxt" type="toolbar" mode="on" icon="print" text="��ӡ" Url="javascript:clickPrint();" runat="server"></G:Button>
            </td>
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<input id="hiddenHtml" type="hidden" runat="server" />
<asp:LinkButton ID="btn_word" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<asp:LinkButton ID="btn_print" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<div id="divhtml" >
    <G:Content id="view" runat="server">
    <G:Template id="Template1" runat="server">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
        <tr>
            <td width="70%">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
                    <tr>
                        <td width="70%" align="right">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td align="center" class="font_2635B_000">
                                        ���������������Ⱦ���
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
        class="font1225_black">
        <tr class="font1225_black">
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
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                �������
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF" >
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                &nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                5������������ˮ�л�ѧ����������ϵ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��/��.��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                12
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                �˿�����
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ����
            </td>
            <td align="center" bgcolor="#FFFFFF">
                1
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                6������������ˮ�л�ѧ����������
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                13
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                ���У�����ס�˿���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ����
            </td>
            <td align="center" bgcolor="#FFFFFF">
                2
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                7����ˮ����ȥ��������ˮ�е�COD��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                14
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                2��ú̿��������
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                3
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                8������������ˮ�л�ѧ�������ŷ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                15
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                ���У���ҵú̼��������
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                4
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                9������������ˮ�е�������ϵ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��/��.��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                16
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                �������ú̿������
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                5
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                10������������ˮ�а���������
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                17
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                3���������ú̼������
            </td>
            <td align="center" bgcolor="#FFFFFF">
                %
            </td>
            <td align="center" bgcolor="#FFFFFF">
                6
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                11����ˮ����ȥ��������ˮ�а�����
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                18
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                4���������ú̼�ҷ�
            </td>
            <td align="center" bgcolor="#FFFFFF">
                %
            </td>
            <td align="center" bgcolor="#FFFFFF">
                7
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                12������������ˮ�а����ŷ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                19
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                ������Ⱦ�ŷ����
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
                13������������������ŷ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                20
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                1������������ˮ�ŷ�ϵ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ǧ��/��.��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                8
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                14����������̳��ŷ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                21
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                2������������ˮ�ŷ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                9
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                15������������������ŷ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                22
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                3������������ˮ������
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                10
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ���У���·��ͨ���������ŷ���
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                23
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
            </td>
        </tr>
        <tr height="23">
            <td align="center" bgcolor="#FFFFFF">
                4������������ˮ������
            </td>
            <td align="center" bgcolor="#FFFFFF">
                %
            </td>
            <td align="center" bgcolor="#FFFFFF">
                11
            </td>
            <td align="center" bgcolor="#FFFFFF">
                *&nbsp;
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
    </G:Template>
    </G:Content>
</div>
<!--��̬����html,����-->
</form>
</body>
</html>
