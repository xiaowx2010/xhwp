<!--G112 ��ҵ��ˮ����ˮ�����ŷ�����ղ��-->

<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    
string p_name="",p_code="",hycode = "";//��ҵ
private void Page_Load(object sender,System.EventArgs e)
{
	SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����   
	hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");
	view.SqlStr="select top 1 fld_712_2,fld_712_3,fld_712_4,fld_712_5,fld_712_6,fld_712_7 ,fld_712_1,(select fld_658_4 from gmis_mo_658 where fld_658_1=fld_712_1) as comcode,(select fld_658_2 from gmis_mo_658 where fld_658_1=fld_712_1) as comname from gmis_mo_712 where fld_712_1='"+orgcode+"'";     
	string choiceid="";
	DataTable dt = view.DataTable;
	if (dt.Rows.Count > 0)
	{
		p_code=dt.Rows[0]["comcode"].ToString();
		p_name=dt.Rows[0]["comname"].ToString();            
	}
    list_714.SqlStr = "select top 5 fld_714_2,fld_714_3,fld_714_4,fld_714_5,fld_714_6,(case when fld_714_7!=0.0 then cast(fld_714_7 as nvarchar)+'��' else '' end),(case when fld_714_8!=0.0 then cast(fld_714_8 as nvarchar) +'��' else '' end ),(case fld_714_9 when '1' then '1=����' else '2=��ֹʹ��' end) from gmis_mo_714 where fld_714_1='" + orgcode + "'";
    list_715.SqlStr = "select top 5 fld_715_2,fld_715_3,fld_715_4,fld_715_5,(case when fld_715_6!=0.0 then cast(fld_715_6 as nvarchar)+'��' else '' end),(case when fld_715_7!=0.0 then cast(fld_715_7 as nvarchar) +'��' else '' end ),(case fld_715_8 when '1' then '1=����' else '2=��ֹʹ��' end) from gmis_mo_715 where fld_715_1='" + orgcode + "'";
	list_716.SqlStr="select top 5 fld_716_2,fld_716_3,fld_716_4,fld_716_5+'='+(select fld_1049_2 from gmis_mo_1049 where fld_1049_1=fld_716_5),(case when fld_716_6!=0.0 then cast(fld_716_6 as nvarchar)+'��' else '' end),(case when fld_716_7!=0.0 then cast(fld_716_7 as nvarchar) +'��' else '' end ),(case fld_716_8 when '1' then '1=����' else '2=��ֹʹ��' end) from gmis_mo_716 where fld_716_1='"+orgcode+"'";
        
	iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;

}
</script>
<body>

    <form id="form1" runat="server">
    <!--ѡ�-->
        <table width="100%">
            <tr>
                <td>
    <iframe id="iframe_658"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
                </td>
            </tr>
        </table>
    <!--ѡ�-->
    <!--����������-->
    <div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"-->
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbar_17.aspx"-->
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbarright.aspx"-->
    <!--����������-->
    </div>

    <!--��̬����html,��ʼ-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="60%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" class="font_2635B_000">��ŷ����豸�ͷ�����ͬλ��������װ��</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G112��</td>
      </tr>
      <tr>
        <td class="font1220_000000">�Ʊ���أ�����Ժ��һ��ȫ����Ⱦ�ղ��쵼С��칫��</td>
      </tr>
      <tr>
        <td class="font1220_000000">��׼���أ�����ͳ�ƾ�</td>
      </tr>
      <tr>
        <td class="font1220_000000">��׼�ĺţ���ͳ��[2007]124��</td>
      </tr>
      <tr>
        <td class="font1220_000000">��Ч������2008��6��30��</td>
      </tr>
    </table></td>
  </tr>
</table>
<!--����������-->

  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">��λ���ƣ����£�</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content"><%=p_name.ToString() %>&nbsp;</td>
    </tr>
    <tr>
      <td  width="126" align="right"  class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content"><%=p_code.ToString() %>&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title"">һ����ҵ�õ�ŷ����豸��Ƶ�ʴ���500�����ҹ��ʴ���5ǧ�ߣ�</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="20%"  align="center" class="td_viewcontent_title"">1�豸���</td>
      <td width="13%"  align="center" class="td_viewcontent_title"">2�豸����</td>
      <td width="13%"  align="center" class="td_viewcontent_title"">3�豸�ͺ�</td>
      <td width="13%"  align="center" class="td_viewcontent_title"">4��ƹ��ʣ�ǧ�ߣ�</td>
      <td width="13%"  align="center" class="td_viewcontent_title"">5����Ƶ�ʣ�ǧ�գ�</td>
      <td width="13%"  align="center" class="td_viewcontent_title"">6����ʱ�䣨���£�</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">7�豸ʹ��״̬</td>
    </tr>
   <G:listbox id="list_714" runat="server" rows="5" showallline="true">
   <G:template id="temp_714" runat="server">
    <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    </G:template>
    </G:listbox>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">������ҵ�ú�����Դ�豸</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="20%"  align="center" class="td_viewcontent_title"">8.������Դ�豸���</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">9.�豸����</td>
      <td width="20%"  align="center" class="td_viewcontent_title"">10.�豸�ͺ�</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">11.����Դ����</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">12.����ʱ��</td>
      <td width="18%"  align="center" class="td_viewcontent_title"">13.�豸ʹ��״̬</td>
    </tr>
       <G:listbox id="list_715" runat="server" rows="5" showallline="true">
   <G:template id="temp_715" runat="server">
       <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>  
    </G:template>
    </G:listbox>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">������ҵ������װ��</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="20%"  align="center" class="td_viewcontent_title"">14.����װ������</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">15.�豸����</td>
      <td width="20%"  align="center" class="td_viewcontent_title"">16.װ���ͺ�</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">17.����װ������</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">18.����ʱ�䣨���£�</td>
      <td width="18%"  align="center" class="td_viewcontent_title"">13.װ��ʹ��״̬</td>
    </tr>
       <G:listbox id="list_716" runat="server" rows="5" showallline="true">
   <G:template id="temp_716" runat="server">
       <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>  
    </G:template>
    </G:listbox>
  </table>
     <G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right" width="100"  class="td_viewcontent_title" style="padding-right:5px; ">��λ������</td>
       <td align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">����� </td>
       <td  align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td  width="100" align="right"  class="td_viewcontent_title">�����</td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="right"  class="td_viewcontent_title">�������</td>
      <td width="210" align="left" class="td_viewcontent_content">200*��*��*��</td>
    </tr>
  </table>
  </G:template>
  </G:Content>
</form>
</body>
</html>
