<!--���ݹ���-�ֶι���-�����ŷ�Դ-->
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
	dtable = "gmis_Mo_34";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_34_1", "fld_34_2", "fld_34_3", "fld_34_4", "fld_34_5", "fld_34_6", "creatorcode" };
  
    types = "0110001";
    if (!IsPostBack) 
    {
        //�Ȱ��б�
        creatorcode.Value = GetUID();//������ID

        //��ϽȨ��
        BindListControl(fld_34_3,"mocode","fld_44_1","select mocode,fld_44_1 from gmis_mo_44","��ѡ��");
        SetFilter(fld_34_3,"0");
        //��������
        BindListControl(fld_34_2,"mocode","fld_1201_1","select mocode,fld_1201_1 from gmis_mo_1201","��ѡ��");
        SetFilter(fld_34_2, "0");
        
        
		if(id != "0"){//������ֵ
		    guangye.BindData(dtable,filter,flds);
		}
    }   
}

//����֮ǰ�����ݴ���
public override void BeforeSave()
{
    
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 		
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	<!--#include file="toolbarright.aspx"-->   
<!--����������-->
<input id="creatorcode" runat="server" type="hidden" />
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
	<tr>
	    <td align="right"  class="td_viewcontent_title">��ȾԴ���ƣ�</td>
	    <td class="td_viewcontent_content"><input id="fld_34_1" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">��������</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_34_2" runat="server" Width="150"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��ϽȨ����</td>
	    <td class="td_viewcontent_content"><asp:DropDownList id="fld_34_3" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">��Դ���ƣ�</td>
	    <td class="td_viewcontent_content"><input id="fld_34_4" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��Դ��ţ�</td>
	    <td class="td_viewcontent_content"><input id="fld_34_5" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">��Դλ�ã�</td>
	    <td class="td_viewcontent_content"><input id="fld_34_6" class="boxbline" type="text" runat="server" /></td>
    </tr>
</table>
<!--��̬���ɽ���-->
</form>
</body>
</html>