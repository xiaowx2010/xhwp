<!--���ݹ���-�ֶι���-������������봦����Ϣ����-->
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
	dtable = "gmis_Mo_30";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_30_1", "fld_30_2", "fld_30_3", "fld_30_4", "fld_30_5", "fld_30_6", "fld_30_7", "fld_30_8", "fld_30_9", "fld_30_10", "fld_30_11", "fld_30_12", "fld_30_13", "creatorcode" };
  
    types = "00000000010001";
    if (!IsPostBack) 
    {
        //�Ȱ��б�
        creatorcode.Value = GetUID();//������ID
        
        //��������
        BindListControl(fld_30_10,"mocode","fld_63_1","select mocode,fld_63_1 from gmis_mo_63","��ѡ��");
        SetFilter(fld_30_10,"0");
        
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
	    <td align="right"  class="td_viewcontent_title">��������ţ�</td>
	    <td class="td_viewcontent_content"><input id="fld_30_1" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">�������Դ��</td>
	    <td class="td_viewcontent_content"><input id="fld_30_2" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��̬��</td>
	    <td class="td_viewcontent_content"><input id="fld_30_3" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">������������</td>
	    <td class="td_viewcontent_content"><input id="fld_30_4" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��ˮ����</td>
	    <td class="td_viewcontent_content"><input id="fld_30_5" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">���������</td>
	    <td class="td_viewcontent_content"><input id="fld_30_6" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">����ȥ��</td>
	    <td class="td_viewcontent_content"><input id="fld_30_7" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">����λ���ƣ�</td>
	    <td class="td_viewcontent_content"><input id="fld_30_8" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��ַ��</td>
	    <td colspan="3" class="td_viewcontent_content"><input id="fld_30_9" style="width:95%" class="boxbline" type="text" runat="server" /></td>
	</tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">�������ͣ�</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_30_10" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">������</td>
	    <td class="td_viewcontent_content"><input id="fld_30_11" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">������ʩ���ƣ�</td>
	    <td class="td_viewcontent_content"><input id="fld_30_12" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">��������</td>
	    <td class="td_viewcontent_content"><input id="fld_30_13" class="boxbline" type="text" runat="server" /></td>
    </tr>
</table>
<!--��̬���ɽ���-->
</form>
</body>
</html>