<!--S404_C ����ȼ����ʩ�ղ��_����-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    string hycode = "";
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
		string     orgcode = GetQueryString("orgcode", "0");
        hycode = GetQueryString("hycode","0");
        list.SqlStr="select fld_1018_2,fld_1018_20,fld_1018_21,fld_1018_17,fld_1018_18,fld_1018_14,fld_1018_15,fld_1018_11,fld_1018_12,fld_1018_9,fld_1018_10,fld_1018_3,fld_1018_4,fld_1018_5,fld_1018_6,fld_1018_7,fld_1018_8,fld_1018_13,fld_1018_16,fld_1018_19,fld_1018_22,fld_1018_23,fld_1018_24,fld_1018_25 from gmis_mo_1018 b left outer join gmis_mo_1017 a on a.fld_1017_1=b.fld_1018_1 where fld_1017_1='"+orgcode+"'";
        list.Rows = list.DataTable.Rows.Count;
        view.SqlStr="select (select fld_1016_4 from gmis_mo_1016 where fld_1016_1=fld_1017_1),(select fld_1016_2 from gmis_mo_1016 where fld_1016_1=fld_1017_1),fld_1017_4,fld_1017_8,fld_1017_2,fld_1017_5,fld_1017_9,fld_1017_3,fld_1017_16,fld_1017_6,fld_1017_14,fld_1017_17,fld_1017_7,fld_1017_15,fld_1017_10,fld_1017_12,fld_1017_11,fld_1017_13,fld_1017_1 from gmis_mo_1017 a where fld_1017_1='"+orgcode+"'";
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
    <!--����-->
<!--����������--> 
<!--����������--> 

<!--����������-->  
<!--����������-->
<G:content id="view" runat="server">
<G:template id="templateview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:10px">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">��λ����</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">һ����Ⱦ���������</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td align="center" class="td_viewcontent_title">�������������</td>
      <td align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center" class="td_viewcontent_title">��ҵ����������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��������</td>
      <td align="center"class="td_viewcontent_title">�������������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">���������ŷ���</td>
      <td align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">��ҵ�����ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*��������</td>
      <td align="center"class="td_viewcontent_title">���������ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�̳�������</td>
      <td align="center"class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">��ú�Ҳ�����</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">¯��������</td>
      <td colspan="2" align="center"class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">�̳��ŷ���</td>
      <td align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">��ú���ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">¯���ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">��ҵ��ˮ������</td>
      <td align="center" class="td_viewcontent_content">*��</td>
      <td align="center"class="td_viewcontent_title">��ѧ������������</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">��ҵ��ˮ�ŷ���</td>
      <td align="center" class="td_viewcontent_content">*��</td>
      <td align="center"class="td_viewcontent_title">��ѧ�������ŷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_content">*ǧ��</td>
      <td align="center"class="td_viewcontent_title">&nbsp;</td>
      <td colspan="2" align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
</table>
</G:template>
</G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">��������ҵ��Ⱦ�����</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">����</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�̳�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">¯��</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ѧ��������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ҵ��ˮ</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ҵ����</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��������</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��������</td>
        <td colspan="2"  align="center" class="td_viewcontent_title">��ú��</td>
           <td rowspan="2" align="center" class="td_viewcontent_title">�ҷ�</td>
             <td rowspan="2" align="center" class="td_viewcontent_title">���</td>
                 <td rowspan="2" align="center" class="td_viewcontent_title">ȼ�շ�ʽ</td>
                                  <td rowspan="2" align="center" class="td_viewcontent_title">��������</td>
           <td rowspan="2" align="center" class="td_viewcontent_title">ԭ�ϴ���</td>
            <td rowspan="2" align="center" class="td_viewcontent_title">ȼ������</td>
               <td rowspan="2" align="center" class="td_viewcontent_title">������</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td align="center" class="td_viewcontent_title">������</td>
      <td align="center" class="td_viewcontent_title">�ŷ���</td>
      <td  align="center" class="td_viewcontent_title">������</td>
      <td  align="center" class="td_viewcontent_title">�ŷ���</td>
      <td  align="center" class="td_viewcontent_title">������</td>
      <td  align="center" class="td_viewcontent_title">�ŷ���</td>
      <td  align="center" class="td_viewcontent_title">������</td>
      <td  align="center" class="td_viewcontent_title">�ŷ���</td>
      <td  align="center" class="td_viewcontent_title">������</td>
      <td  align="center" class="td_viewcontent_title">�ŷ���</td>
         <td  align="center" class="td_viewcontent_title">������</td>
      <td  align="center" class="td_viewcontent_title">�ŷ���</td>
      <td  align="center" class="td_viewcontent_title">������</td>
      <td  align="center" class="td_viewcontent_title">�ŷ���</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">��</td>
      <td align="center" class="td_viewcontent_title">1</td>
      <td align="center" class="td_viewcontent_title">2</td>
      <td align="center" class="td_viewcontent_title">3</td>
      <td align="center" class="td_viewcontent_title">4</td>
      <td align="center" class="td_viewcontent_title">5</td>
      <td align="center" class="td_viewcontent_title">6</td>
      <td align="center" class="td_viewcontent_title">7</td>
      <td align="center" class="td_viewcontent_title">8</td>
      <td align="center" class="td_viewcontent_title">9</td>
      <td align="center" class="td_viewcontent_title">10</td>
      <td align="center" class="td_viewcontent_title">11</td>
      <td align="center" class="td_viewcontent_title">12</td>
        <td align="center" class="td_viewcontent_title">13</td>
      <td align="center" class="td_viewcontent_title">14</td>
      <td align="center" class="td_viewcontent_title">15</td>
      <td align="center" class="td_viewcontent_title">16</td>
      <td align="center" class="td_viewcontent_title">17</td>
      <td align="center" class="td_viewcontent_title">18</td>
      <td align="center" class="td_viewcontent_title">19</td>
      <td align="center" class="td_viewcontent_title">20</td>
      <td align="center" class="td_viewcontent_title">21</td>
      <td align="center" class="td_viewcontent_title">22</td>
      <td align="center" class="td_viewcontent_title">23</td>
    </tr>
 <G:listbox id="list" runat="server">
    <G:template id="templatelist" runat="server">
    <tr>
     
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
        <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
        <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
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
  </form>
</body>
</html>
