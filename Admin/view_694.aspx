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
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
	hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");


	view1.SqlStr="select  (select fld_658_2 from gmis_mo_658 where fld_658_1=fld_694_1),(select fld_658_4 from gmis_mo_658 where fld_658_1=fld_694_1) from gmis_mo_694 where fld_694_1='"+orgcode+"'";     
	view2.SqlStr="select fld_694_18,fld_694_2,fld_694_3,fld_694_4,fld_694_5,fld_694_6,fld_694_1  from gmis_mo_694 where fld_694_1='"+orgcode+"'";     
	list1.SqlStr="select '' as orgdata, fld_706_4, fld_706_5, fld_706_6, fld_706_7, fld_706_8, fld_706_9, fld_706_10,fld_706_2,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_706_2) as fld_706_2_1,fld_694_1 from gmis_mo_706  left outer join gmis_mo_694 a  on fld_706_1=fld_694_1 where fld_694_1='"+orgcode+"'";     
	list2.SqlStr="select ''as orgdata ,fld_707_4,fld_707_5,fld_707_6,fld_707_7,fld_707_8,fld_707_9,fld_707_10,fld_707_11,fld_707_12,fld_707_3,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_707_3) as fld_707_3_1 from gmis_mo_707  left outer join gmis_mo_694 a on fld_694_1=fld_707_1 where fld_694_1='"+orgcode+"'";
	DataTable dt=list1.DataTable;
	if(dt.Rows.Count>0)
	{
	  dt.Rows[0]["orgdata"]=dt.Rows[0]["fld_706_2"].ToString() + "=" + dt.Rows[0]["fld_706_2_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_706_2"].ToString() + "=" + dt.Rows[0]["fld_706_2_1"].ToString();
	}
	 DataTable dt2=list2.DataTable;
	if(dt2.Rows.Count>0)
	{
			dt2.Rows[0]["orgdata"]=dt2.Rows[0]["fld_707_3"].ToString() + "=" + dt2.Rows[0]["fld_707_3_1"].ToString() == "=" ? "" : dt2.Rows[0]["fld_707_3"].ToString() + "=" + dt2.Rows[0]["fld_707_3_1"].ToString();
	}
	list1.Rows=list1.DataTable.Rows.Count;
	list2.Rows=list2.DataTable.Rows.Count;


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

    <!--����-->
   
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">������Ⱦ����������ŷ����ղ��</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G109��</td>
      </tr>
      <tr>
        <td class="font1220_000000">�Ʊ���أ�����Ժ��һ��ȫ����Ⱦ��<br>
          �������������쵼С��칫��</td>
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
<G:content id="view1" runat="server">
<G:template id="templateview1" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">��λ���ƣ����£�</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
</G:template>
</G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">һ��ȼ�չ���</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="3"  align="center" class="td_viewcontent_title">1��������Դ</td>
      <td rowspan="3"  align="center" class="td_viewcontent_title">2�������ŷ������������ף�</td>
      <td colspan="6"  align="center" class="td_viewcontent_title">��Ҫ��Ⱦ��֣�</td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_title">�̳�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��������</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��������</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">3��������</td>
      <td align="center" class="td_viewcontent_title">4���ŷ���</td>
      <td align="center" class="td_viewcontent_title">5��������</td>
      <td align="center" class="td_viewcontent_title">6���ŷ���</td>
      <td align="center" class="td_viewcontent_title">7��������</td>
      <td align="center" class="td_viewcontent_title">8���ŷ���</td>
    </tr>
    <G:listbox id="list1" runat="server">
    <G:template id="templatelist1" runat="server">
    <tr>
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
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">�������չ���</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="3"  align="center" class="td_viewcontent_title">1��������Դ</td>
      <td rowspan="3"  align="center" class="td_viewcontent_title">2�������ŷ������������ף�</td>
      <td colspan="8"  align="center" class="td_viewcontent_title">��Ҫ��Ⱦ���<span class="font1225B_ffffff">������Ϊǧ��</span>�⣬�����Ϊ�֣�</td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_title">��ҵ�۳�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��������</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��������</td>
      <td colspan="2" align="center" class="td_viewcontent_title">������</td>
    </tr>
      <tr>
      <td align="center" class="td_viewcontent_title">3��������</td>
      <td align="center" class="td_viewcontent_title">4���ŷ���</td>
      <td align="center" class="td_viewcontent_title">5��������</td>
      <td align="center" class="td_viewcontent_title">6���ŷ���</td>
      <td align="center" class="td_viewcontent_title">7��������</td>
      <td align="center" class="td_viewcontent_title">8���ŷ���</td>
      <td align="center" class="td_viewcontent_title">9��������</td>
      <td align="center" class="td_viewcontent_title">10���ŷ���</td>
    </tr>
    <G:listbox id="list2" runat="server">
    <G:template id="templatelist2" runat="server">
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
    </tr>
    </G:template>
    </G:listbox>
  </table>
  <G:content id="view2" runat="server">
  <G:template id="templateview2" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  class="td_viewcontent_title" style="padding-right:5px; ">��λ������</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="122" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">����� </td>
      <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right"  class="td_viewcontent_title">����� </td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="122" align="right"  class="td_viewcontent_title">������� </td>
      <td width="210" align="left" class="td_viewcontent_content">200*��*��*��&nbsp;</td>
    </tr>

  </table>
  </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">ע����������Դ��1������ϵ����2ʵ�ʼ�⡢3���Ϻ��㣬�������������ڡ��ڷ�����Ĳ������ŷ�������һλС��������ָ�걣����λС����      </td>
    </tr></table>

  
</form> 
</body>
</html>
