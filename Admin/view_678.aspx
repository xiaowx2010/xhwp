<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string hycode = "";//��ҵ
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
	hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");
	string str2 = "",str3="";  

	str2="fld_682_3,fld_682_4,fld_682_5,fld_682_6,fld_682_7,fld_682_8,fld_682_9,(select fld_975_2 from gmis_mo_975 where fld_975_1=fld_682_9),fld_682_10,fld_682_11,fld_682_12,fld_682_13,fld_682_14";
	str3="fld_683_3,fld_683_4,fld_683_5,fld_683_6,fld_683_7,''as wayname,fld_683_9,fld_683_10,fld_683_11,fld_683_12,fld_683_13,fld_683_14";

	view1.SqlStr = "select  (select fld_658_2 from gmis_mo_658 where fld_658_1=fld_678_1),(select fld_658_4 from gmis_mo_658 where fld_658_1=fld_678_1),fld_678_1 from gmis_mo_678 a where fld_678_1='"+orgcode+"'";     
	list.SqlStr = "select " + str2 + "  from gmis_mo_678 a left outer join gmis_mo_682 b on a.fld_678_1=b.fld_682_1  where fld_678_1='"+orgcode+"'";     
	list2.SqlStr = "select " + str3 + ",fld_683_8,(select fld_624_2 from gmis_mo_624 where fld_624_1=fld_683_8) as fld_683_8_1,fld_678_1 from gmis_mo_678 a left outer join gmis_mo_683 c on a.fld_678_1=c.fld_683_1 where fld_678_1='"+orgcode+"'";     
	view2.SqlStr = "select fld_678_18,fld_678_2,fld_678_3,fld_678_4,fld_678_5,fld_678_6  from gmis_mo_678 a where fld_678_1='"+orgcode+"'";     
	DataTable dt = list2.DataTable;
	if (dt.Rows.Count > 0)
	{ 
		dt.Rows[0]["wayname"] = dt.Rows[0]["fld_683_8"].ToString()+"="+dt.Rows[0]["fld_683_8_1"].ToString()=="="?"":dt.Rows[0]["fld_683_8"].ToString()+"="+dt.Rows[0]["fld_683_8_1"].ToString();
	}
    list.Rows= list.DataTable.Rows.Count;
    list2.Rows= list.DataTable.Rows.Count;

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
    <div id="fold" runat="server" style="">
    </div> 
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">��¯������������ʩ�ղ��</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G106��</td>
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
<G:content  id="view1" runat="server">
<G:template id="template1" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="126" align="right"  class="td_viewcontent_title">��λ���ƣ����£�</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table></G:template>
</G:content>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title">һ����¯�������</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">1����¯���</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">2����¯�ͺ�</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">3����¯�������</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">4��Ͷ��ʹ��ʱ�䣨�꣩</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">5������������ߣ�</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">6������Сʱ</td>
      <td colspan="3" align="center" class="td_viewcontent_title">��Դ</td>
      <td colspan="2" align="center" class="td_viewcontent_title">ȼ�շ�ʽ</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">12����Ӧ����ʩ������</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">7������</td>
      <td align="center" class="td_viewcontent_title">8��������λ</td>
      <td align="center" class="td_viewcontent_title">9��������</td>
      <td align="center" class="td_viewcontent_title">10������</td>
      <td align="center" class="td_viewcontent_title">11������</td>
    </tr>
<G:listbox id="list" runat="server">
<G:template id="templatelist" runat="server">
    <tr>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*=*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">QZ-*&nbsp;</td>
    </tr>

</G:template>
</G:listbox>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">����������ʩ�������</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_title">1��������ʩ���</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">2����Ͷ�ʶ��Ԫ��</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">3����ƴ���������������/ʱ��</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">4�����з��ã���Ԫ��</td>
      <td width="90" rowspan="2" align="center" class="td_viewcontent_title">5���ĵ�������ǧ��ʱ��</td>
      <td colspan="3" align="center" class="td_viewcontent_title">����װ��</td>
      <td colspan="3" align="center" class="td_viewcontent_title">����װ��</td>
      <td rowspan="2" align="center" class="td_viewcontent_title">����ʵ�ʴ�����
      �������ף�</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">6��������������</td>
      <td align="center" class="td_viewcontent_title">7������Ч�ʣ�%��</td>
      <td align="center" class="td_viewcontent_title">8������Сʱ</td>
      <td align="center" class="td_viewcontent_title">9�����򷽷�����</td>
      <td align="center" class="td_viewcontent_title">10������Ч�ʡ���%��</td>
      <td align="center" class="td_viewcontent_title">11������Сʱ</td>
    </tr>
    <G:listbox id="list2" runat="server">
<G:template id="templatelist2" runat="server">
    <tr>
      <td width="100" align="center" class="td_viewcontent_content" >QZ-*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td width="100" align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
</G:template>
</G:listbox>
  </table>

    <G:content id="view2" runat="server">
    <G:template id="template3" runat="server">
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
      <td align="left" class="font1220_000000"><p>ע���������񲻹���д�������и�ӡ��������Сʱ���ԡ�������/ʱ��Ϊ������λ��ָ�걣���������ԡ����ߡ���Ԫ��%��Ϊ������λ��ָ��������һλС��������ָ����������λС����<br>
        </p>
        </td>
    </tr>
    <tr>
      <td align="left" class="font1220_000000">&nbsp;</td>
    </tr>
  </table>

  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; "><tr></tr>
  </table>
 </form>
</body>
</html>
