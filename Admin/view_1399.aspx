<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>

<HTML>
<HEAD>

<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>

<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">

</HEAD>

<!--#include file="func.aspx"-->

<script language="C#" runat="server">

string hycode;

private void Page_Load(object sender, System.EventArgs e)
{

    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
    hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");
    string str2 = "";
    str2 = "fld_1412_12,fld_1412_13,fld_1412_14,fld_1412_19,fld_1412_20,fld_1412_21,fld_1412_22,fld_1412_23,fld_1412_24,fld_1412_25,fld_1412_26,fld_1412_27,fld_1412_28,fld_1412_29,fld_1412_15,fld_1412_16,fld_1412_17,fld_1412_18";

	view1.SqlStr = "select (select fld_1396_2 from gmis_mo_1396 where fld_1396_1=fld_1399_1),(select fld_1396_4 from gmis_mo_1396 where fld_1396_1=fld_1399_1), fld_1399_1 from gmis_mo_1399 b where fld_1399_1='"+orgcode+"'";
    list1.SqlStr = "select fld_1412_3,fld_1412_4,fld_1412_5,fld_1412_6,fld_1412_7,fld_1412_8,fld_1412_9,fld_1412_10,fld_1412_11 from gmis_mo_1412 a left outer join gmis_mo_1399 b on a.fld_1412_1=b.fld_1399_1 where fld_1399_1='"+orgcode+"'";
    list2.SqlStr = "select " + str2 + " from gmis_mo_1412 a left outer join gmis_mo_1399 b on a.fld_1412_1=b.fld_1399_1 where fld_1399_1='"+orgcode+"'";
    view2.SqlStr = "select fld_1399_18,fld_1399_2,fld_1399_3,fld_1399_4,fld_1399_5,fld_1399_6 from gmis_mo_1399 b  where fld_1399_1='"+orgcode+"'";
    list1.Rows = list1.DataTable.Rows.Count;
    list2.Rows = list2.DataTable.Rows.Count;

	iframe_1396.Attributes["src"]="iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;

}

</script>

<body style="padding:10px;text-align:center">
<form id="form1" runat="server">

<!--ѡ�-->
        <table width="100%">
            <tr>
                <td>
<iframe id="iframe_1396"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
<!--��̬���ɽ���-->
    <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
         <td style="width: 30%" rowspan="2">&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
                ��ˮ������ʩ�ղ��
            </td>
            <td style="width: 30%" rowspan="2">
             <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="top_font1220_000000">�����ţ�G104��</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">�Ʊ���أ�����������</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">��׼���أ�����ͳ�ƾ�</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">��׼�ĺţ���ͳ��[2009]113��</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">��Ч������2011��12��</td>
      </tr>
    </table>

            </td>
        </tr>
        <tr><td style="font-size:small; font-weight:normal; width:40%" align="center" >2010��</td></tr>
    </table>
<G:content id="view1" runat="server">
<G:template id="templateview1" runat="server">
	<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="right"  class="td_viewcontent_title_top">��λ���ƣ�</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	     <td align="right"  class="td_viewcontent_title_top">��λ���룺</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
    </tr>
</table>
</G:template>
</G:content>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="center"  class="td_viewcontent_title_top" colspan="9">������ʩ�������</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_title" colspan="2">��ˮ������ʩ</td>
        <td align="center"  class="td_viewcontent_title" rowspan="2" >3.��Ͷ�ʶ��Ԫ��</td>
        <td align="center"  class="td_viewcontent_title"  rowspan="2"  >4.��ƴ�����������/�գ�</td>
        <td align="center"  class="td_viewcontent_title"  rowspan="2" >5.���з��ã���Ԫ��</td>
         <td align="center"  class="td_viewcontent_title"  rowspan="2" >6.����Сʱ</td>
          <td align="center"  class="td_viewcontent_title"  rowspan="2" >7.�ĵ�������ǧ��ʱ��</td>
           <td align="center"  class="td_viewcontent_title"  colspan="2" >��ˮʵ�ʴ�����</td>
    </tr>
    <tr>
       <td align="center"  class="td_viewcontent_title"  >1.���</td>
        <td align="center"  class="td_viewcontent_title"   >2.����</td>
          <td align="center"  class="td_viewcontent_title"  >8.������λ��</td>
        <td align="center"  class="td_viewcontent_title"   >9.�����ⵥλ��</td>

        </tr>
        <G:listbox ID="list1" runat="server">
<G:Template id="tempview" runat="server">
            <tr>
                    <td align="center" class="td_viewcontent_content">
                        SZ--*&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                </G:Template>
</G:listbox>
</table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="center"  class="td_viewcontent_title_top" colspan="14">����������Ҫ��Ⱦ��</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_title" rowspan="2" style="width:8%">1.��ˮ������ʩ���</td>
        <td align="center"  class="td_viewcontent_title"  colspan="2"style="width:16%" >����ķ�ˮ����</td>
        <td align="center"  class="td_viewcontent_title"  colspan="2" style="width:16%" >������</td>
        <td align="center"  class="td_viewcontent_title"   colspan="9" style="width:60%" >�������Ҫ��Ⱦ��</td>
    </tr>
      <tr>
                    <td align="center" style="width:8%" class="td_viewcontent_title">
                        10.����
                    </td>
                    <td align="center" style="width:8%" class="td_viewcontent_title">
                      11.����
                    </td>
                    <td align="center"  style="width:8%" class="td_viewcontent_title">
                       12.����
                    </td>
                    <td align="center" style="width:8%" class="td_viewcontent_title">
                       13.����
                    </td>
                    <td align="center" style="width:7%"   class="td_viewcontent_title">
                       14.����
                    </td>
                    <td align="center" style="width:5%"  class="td_viewcontent_title">
                      15.����
                    </td>
                     <td align="center" style="width:8%"  class="td_viewcontent_title">
                      16.����Ч�ʣ�%��
                    </td>
                     <td align="center"  style="width:7%"  class="td_viewcontent_title">
                     17.����
                    </td>
                     <td align="center" style="width:5%"  class="td_viewcontent_title">
                      18.����
                    </td>
                     <td align="center" style="width:8%"  class="td_viewcontent_title">
                      19.����Ч�ʣ�%��
                    </td>
                     <td align="center" style="width:7%"  class="td_viewcontent_title">
                      20.����
                    </td>
                     <td align="center" style="width:5%"  class="td_viewcontent_title">
                      21.����
                    </td>
                     <td align="center" style="width:8%"  class="td_viewcontent_title">
                      22.����Ч�ʣ�%��
                    </td>
                </tr>
                <G:listbox id="list2" runat="server">
                <G:template id="template2" runat="server">
                     <tr>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        SZ--*&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>

                </tr>
                <tr>
                    <td align="center"  class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center"  class="td_viewcontent_content" >
                        *&nbsp
                    </td>

                </tr>
                      <tr>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>

                </tr>
                </G:template>
                </G:listbox>
    </table>
    <G:content id="view2" runat="server">
    <G:template id="templateview2" runat="server">
    <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        ��λ�����ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ����ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                </tr>
                 <tr>
                    <td align="right" class="td_viewcontent_title">
                        ����ˣ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ������ڣ�
                    </td>
                    <td class="td_viewcontent_content">
                        201*��*��*��&nbsp;
                    </td>
                </tr>
            </table>
            </G:template>
            </G:content>

</form>
</body>
</html>