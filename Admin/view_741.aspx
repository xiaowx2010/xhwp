<!--G204_1 ������Ⱦ������������ŷ�����ղ��-->

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
string hycode = "";//��ҵ
    string p_name="";//��λ����
    string p_code="";//��λ����
    
private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����   
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode","0");
        view.SqlStr = "select top 1 fld_741_18,fld_741_2,fld_741_3,fld_741_4,fld_741_5,fld_741_6,fld_741_1,(select fld_730_2 from gmis_mo_730 where fld_730_1=fld_741_1) as comname ,(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_741_1) as comcode from gmis_mo_741 where fld_741_1='"+orgcode+"'";
        DataTable dt = view.DataTable;
        if (dt.Rows.Count > 0)
        {
            p_name=dt.Rows[0]["comname"].ToString();
            p_code=dt.Rows[0]["comcode"].ToString();
        }
        list1.SqlStr="select top 2 (select fld_1035_2 from gmis_mo_1035 where fld_1035_1=fld_744_2),fld_744_4,fld_744_5,(case when fld_744_6!=0.0 then cast(fld_744_6 as nvarchar)+'��' else '' end),(case when fld_744_7!=0.0 then cast(fld_744_7 as nvarchar)+'��' else '' end),fld_744_8,fld_744_9,fld_744_10,fld_744_11,fld_744_12,fld_744_13,fld_744_14,fld_744_15,fld_744_16,fld_744_17,fld_744_18,fld_744_19 from gmis_mo_744  where fld_744_1='"+orgcode+"'";
        list2.SqlStr="select top 2 fld_744_20,fld_744_21,fld_744_22,fld_744_23,fld_744_24,fld_744_25,fld_744_26,fld_744_27,fld_744_28,fld_744_29,fld_744_30,fld_744_31,fld_744_32,fld_744_33,fld_744_34,fld_744_35,fld_744_36 from gmis_mo_744  where fld_744_1='"+orgcode+"'";
        iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
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
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">������Ⱦ�����</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G204-1��</td>
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
      <td width="562" colspan="3" align="left" class="td_viewcontent_content"><%=p_name.ToString() %></td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content"><%=p_code.ToString() %></td>
    </tr>
</table>

  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%" rowspan="4"  align="center" class="td_viewcontent_title">������Դ</td>
      <td width="15%" rowspan="4"  align="center" class="td_viewcontent_title">1��������ʩ���</td>
      <td width="13%" rowspan="4"  align="center" class="td_viewcontent_title">2����Ӧ���ŷŷſڱ��</td>
      <td width="13%" rowspan="4"  align="center" class="td_viewcontent_title">3�����ʱ�䣨���£�</td>
      <td colspan="2" rowspan="2"  align="center" class="td_viewcontent_title">����������������/ʱ��</td>
      <td colspan="3"  align="center" class="td_viewcontent_title">��Ⱦ��Ũ�ȣ�����/�����ף�</td>
    </tr>
    <tr>
      <td colspan="3"  align="center" class="td_viewcontent_title">�̣��ۣ���</td>
    </tr>
    <tr>
      <td width="13%" rowspan="2"  align="center" class="td_viewcontent_title">4��������ʩǰ</td>
      <td width="13%" rowspan="2"  align="center" class="td_viewcontent_title">5��������ʩ��</td>
      <td width="13%" rowspan="2"  align="center" class="td_viewcontent_title">6������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">�ſ�</td>
    </tr>
    <tr>
      <td width="13%"  align="center" class="td_viewcontent_title">7��ʵ��</td>
      <td width="13%"  align="center" class="td_viewcontent_title">8������</td>
    </tr>
<G:listbox id="list1" runat="server" rows="2" showallline="true">
    <G:template id="temp_0" runat="server">
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">QZ--*</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">FQ--*</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    </G:template>
</G:listbox>
</table>

  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">��Ⱦ��Ũ�ȣ�����/�����ף�</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="3"  align="center" class="td_viewcontent_title">1��������ʩ���</td>
      <td colspan="3"  align="center" class="td_viewcontent_title">��������</td>
      <td colspan="3"  align="center" class="td_viewcontent_title">��������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">������</td>
    </tr>
    <tr>
      <td rowspan="2"  align="center" class="td_viewcontent_title">9������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">�ſ�</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">12������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">�ſ�</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">15������</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">16���ſ�</td>
    </tr>
    <tr>
      <td  align="center" class="td_viewcontent_title">10��ʵ��</td>
      <td  align="center" class="td_viewcontent_title">11������</td>
      <td  align="center" class="td_viewcontent_title">13��ʵ��</td>
      <td  align="center" class="td_viewcontent_title">14������</td>
    </tr>
    <tr>

<G:listbox id="list2" runat="server" rows="2" showallline="true">
<G:template id="temp_2" runat="server" >
      <td width="13%" rowspan="2" align="center" valign="middle" class="td_viewcontent_content" >QZ--*</td>
      <td width="15%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td width="15%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="13%" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
  </G:template>
  </G:listbox>
  </table>

   <G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  width="100"  class="td_viewcontent_title" style="padding-right:5px; ">��λ������</td>
       <td width="230" align="left" class="td_viewcontent_content">*</td>
       <td width="100"  align="right"  class="td_viewcontent_title" style="padding-right:5px; ">����� </td>
       <td width="210" align="left" class="td_viewcontent_content">*</td>
    </tr>
   <tr>
      <td align="right" width="100"  class="td_viewcontent_title">�����</td>
      <td width="230" align="left" class="td_viewcontent_content">*</td>
      <td width="100" align="right"  class="td_viewcontent_title">�������</td>
      <td width="210" align="left" class="td_viewcontent_content">200*��*��*��</td>
    </tr>
  </table>
  </G:template>
  </G:Content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">ע�������񲻹���д,�����и�ӡ����������Դ��ָ��ȡ������ݵļ����ʽ����a���ղ��⡢b���ල��⡢c�����ռ�⡢d��ί�м�⡢e����ҵ�Բ⡢f�����߼�⣬�������������ڡ�<br>
&nbsp;&nbsp;&nbsp;&nbsp;�۷�ˮ����������������Ⱦ���ⷽ����Ӧ��Ч�������<br>
&nbsp;&nbsp;&nbsp;&nbsp;ָ���ϵ��6��7��9��10��12��13��15��16��</td>
    </tr>
  </table></form>
</body>
</html>
