<!--���������������Ⱦ���  ������6��,�༭ҳ-->
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
//����֮ǰ�����ݴ���
public override void BeforeSave()
{
    if (fld_1118_24.SelectedItem != null)
    {
        db.SqlString = "select mocode from gmis_HZ6 where fld_1118_24='" + fld_1118_24.SelectedItem.Value + "'";
        DataTable dt = db.GetDataTable();
        if (dt != null && dt.Rows.Count > 0)
        {
            SetSESSION("alert", "�����������¼�룬��ѡ��������ݣ�");
            SetSESSION("sql", ""); 
            Response.Redirect("execommand.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&tid="+tid+"&id="+id+"&pid="+pid);
        }
    }
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
            <td style="padding-left:5px;width:160px;" nowrap>���:<asp:DropDownList ID="fld_1118_24" runat="server" Width="100px"></asp:DropDownList>
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
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
    <!--����������-->
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
        <tr>
            <td align="center" bgcolor="#FFFFFF">
                �������
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
                5������������ˮ�л�ѧ����������ϵ��
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ��/��.��
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
                �˿�����
            </td>
            <td align="center" bgcolor="#FFFFFF">
                ����
            </td>
            <td align="center" bgcolor="#FFFFFF">
                1
            </td>
            <td align="center" bgcolor="#FFFFFF">
                <input id="fld_1118_1" runat="server" style="width:40px" />
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
                <input id="fld_1118_13" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
                <input id="fld_1118_2" runat="server" style="width:40px" />
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
                <input id="fld_1118_14" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
                <input id="fld_1118_3" runat="server" style="width:40px" />
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
                <input id="fld_1118_15" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
                <input id="fld_1118_4" runat="server" style="width:40px" />
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
                <input id="fld_1118_16" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
                <input id="fld_1118_5" runat="server" style="width:40px" />
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
                <input id="fld_1118_17" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
                <input id="fld_1118_6" runat="server" style="width:40px" />
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
                <input id="fld_1118_18" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
                <input id="fld_1118_7" runat="server" style="width:40px" />
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
                <input id="fld_1118_19" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
                <input id="fld_1118_20" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
                <input id="fld_1118_8" runat="server" style="width:40px" />
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
                <input id="fld_1118_21" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
                <input id="fld_1118_9" runat="server" style="width:40px" />
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
                <input id="fld_1118_22" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
                <input id="fld_1118_10" runat="server" style="width:40px" />
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
                <input id="fld_1118_23" runat="server" style="width:40px" />
            </td>
        </tr>
        <tr>
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
<!--��̬����html,����-->
</form>
</body>
</html>
