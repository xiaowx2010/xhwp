<!--���ݹ���-�ֶι���-������Ŀ������Ϣ����-->
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
	dtable = "gmis_Mo_64";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_64_1", "fld_64_2", "fld_64_3", "fld_64_4", "fld_64_5", "creatorcode" };
  
    types = "010101";
    if (!IsPostBack) 
    {
        //�Ȱ��б�
        creatorcode.Value = GetUID();//������ID

        //��������
        BindListControl(fld_64_2,"mocode","fld_69_1","select mocode,fld_69_1 from gmis_mo_69","��ѡ��");
        SetFilter(fld_64_2,"0");
        //����״̬
        BindListControl(fld_64_4,"mocode","fld_70_1","select mocode,fld_70_1 from gmis_mo_70","��ѡ��");
        SetFilter(fld_64_4, "0");
        
        
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
	    <td align="right"  class="td_viewcontent_title">��Ŀ���ƣ�</td>
	    <td class="td_viewcontent_content"  width="35%"><input id="fld_64_1" class="boxbline" type="text"  style="width:95%" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">�������ͣ�</td>
	    <td class="td_viewcontent_content" width="35%"><asp:DropDownList ID="fld_64_2" runat="server" Width="95%"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">�������ۣ�</td>
	    <td class="td_viewcontent_content"><input id="fld_64_3" class="boxbline" type="text" style="width:95%" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">����״̬��</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_64_4" runat="server" Width="95%"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">������</td>
	    <td colspan="3" class="td_viewcontent_content"><g:editor id="fld_64_5" height="100" toolbarset="UpLoad" width="100%" basepath="Common/Editor/" runat="server" /></td>
	</tr>
</table>
<!--��̬���ɽ���-->
</form>
</body>
</html>