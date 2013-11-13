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
    string str1 = "",str2="",str3="";
    str1 = ",fld_1398_26,fld_1398_16,fld_1398_21,fld_1398_27,fld_1398_17,fld_1398_22,fld_1398_28,fld_1398_18,fld_1398_23,fld_1398_29,fld_1398_19,fld_1398_24,fld_1398_30,fld_1398_20,fld_1398_25,fld_1398_31";
    str2 = ",fld_1398_37,''classcode32,fld_1398_38,fld_1398_43,fld_1398_48,''as classcode33,fld_1398_39,fld_1398_44,fld_1398_49,''as classcode34,fld_1398_40,fld_1398_45,fld_1398_50,''as classcode35,fld_1398_41,fld_1398_46,fld_1398_51,''as classcode36,fld_1398_42,fld_1398_47,fld_1398_52,fld_1398_300,fld_1398_800,fld_1398_113,fld_1398_118,fld_1398_123,fld_1398_400,fld_1398_900,fld_1398_114,fld_1398_119,fld_1398_124,fld_1398_500,fld_1398_110,fld_1398_115,fld_1398_120,fld_1398_125,fld_1398_600,fld_1398_111,fld_1398_116,fld_1398_121,fld_1398_126,fld_1398_700,fld_1398_112,fld_1398_117,fld_1398_122,fld_1398_127";
    str3 = ",fld_1398_3,fld_1398_5,fld_1398_6,''as createdate,fld_1398_54,fld_1398_4,fld_1398_2";

	string sql = "select (select fld_1396_2 from gmis_mo_1396 where fld_1396_1=fld_1398_1),(select fld_1396_4 from gmis_mo_1396 where fld_1396_1=fld_1398_1),fld_1398_7,fld_1398_8,fld_1398_9,fld_1398_10,fld_1398_11,fld_1398_12,fld_1398_13,fld_1398_14,fld_1398_15 " + str1 + " " + str2 + " " + str3 + ",fld_1398_32,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1398_32) as fld_1398_32_1,fld_1398_33,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1398_33) as fld_1398_33_1,fld_1398_34,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1398_34) as fld_1398_34_1,fld_1398_35,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1398_35) as fld_1398_35_1,fld_1398_36,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1398_36) as fld_1398_36_1,fld_1398_1 from gmis_mo_1398 where fld_1398_1='"+orgcode+"'" ;
//	Response.Write(sql);
	view.SqlStr = sql;
    DataTable dt = view.DataTable;
    if (dt.Rows.Count > 0)
    {
        dt.Rows[0]["createdate"] = "201" + dt.Rows[0]["fld_" + mid + "_54"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "��";
        for (int i = 32; i < 37; i++)
        {
            dt.Rows[0]["classcode" + i + ""] = dt.Rows[0]["fld_1398_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_1398_" + i + "_1"].ToString()=="="?"":dt.Rows[0]["fld_1398_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_1398_" + i + "_1"].ToString();
        }
    }

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
<!--����������-->
<!--����-->
<!--��̬���ɽ���-->
<table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
         <td style="width: 25%" rowspan="2">&nbsp;</td>
            <td style="width: 45%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
              ��ҵ��ˮ����ˮ����ղ��
            </td>
            <td style="width: 30%" rowspan="2">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="top_font1220_000000">�����ţ�G103��</td>
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
        <tr><td style="font-size:small; font-weight:normal; width:45%" align="center" >2010��</td></tr>
    </table>
<G:Content ID="view" runat="server">
<G:Template id="tempview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">

    <tr>
        <td align="right"  class="td_viewcontent_title_top">1.��λ���ƣ�</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	     <td align="right"  class="td_viewcontent_title_top">2.��λ���룺</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
    </tr>

</table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">

    <tr>
        <td align="center"  class="td_viewcontent_title_top" colspan="4">һ����ˮ���</td>
    </tr>
    <tr>
        <td align="center"  class="td_viewcontent_title" style="width:10%">���</td>
        <td align="center"  class="td_viewcontent_title" style="width:40%">ָ������</td>
        <td align="center"  class="td_viewcontent_title" style="width:10%">������λ</td>
        <td align="center"  class="td_viewcontent_title" style="width:40%">��ʵ��</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">1</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">��ˮ����</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">��</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">2</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">���У�1.ȡˮ����</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">��</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">3</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">(1)��������ˮ</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">��</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">4</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">(2)�Ա�ˮ</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">��</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">5</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">���У��ٵر�ˮ</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">��</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">6</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">�ڵ���ˮ</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">��</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">7</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">������</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">��</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>
    </tr>
    <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">8</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">���У������ܱ߹�ҵ��ҵ��ˮ</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">��</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" style="width:10%">9</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">���У�2.�ظ���ˮ��</td>
        <td align="center"  class="td_viewcontent_content" style="width:10%">��</td>
        <td align="center"  class="td_viewcontent_content" style="width:40%">*&nbsp;</td>
    </tr>

</table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">

    <tr>
        <td align="center"  class="td_viewcontent_title_top" colspan="3">������ˮ�������</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_title" style="width:50%">��ˮ��������</td>
        <td align="center"  class="td_viewcontent_title" style="width:25%">��ˮ���ʹ���</td>
        <td align="center"  class="td_viewcontent_title" style="width:25%">��ˮ���������֣�</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" >����</td>
        <td align="center"  class="td_viewcontent_content" >����</td>
        <td align="center"  class="td_viewcontent_content" >�ܼƣ�*</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>

</table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">

    <tr>
        <td align="center"  class="td_viewcontent_title_top" colspan="4">������ˮ�ŷ����</td>
    </tr>
      <tr>
        <td align="center"  class="td_viewcontent_title" style="width:25%">1.��ˮȥ�����ʹ���</td>
        <td align="center"  class="td_viewcontent_title" style="width:25%">2.��ˮ�ŷ������֣�</td>
        <td align="center"  class="td_viewcontent_title" style="width:25%">3.����ˮ������</td>
        <td align="center"  class="td_viewcontent_title" style="width:25%">4.����ˮ�����</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" >����</td>
        <td align="center"  class="td_viewcontent_content" >�ܼƣ�*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >����</td>
         <td align="center"  class="td_viewcontent_content" >����</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    </table>
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
     <tr>
        <td align="center"  class="td_viewcontent_title" style="width:20%">5.�������ˮ��������</td>
        <td align="center"  class="td_viewcontent_title" style="width:20%">6.�������ˮ��������</td>
        <td align="center"  class="td_viewcontent_title" style="width:20%">7.�������ˮ������CODŨ��(mg/L)</td>
        <td align="center"  class="td_viewcontent_title" style="width:20%">8.�������ˮ�����İ���Ũ��(mg/L)</td>
        <td align="center"  class="td_viewcontent_title" style="width:20%">8.�������ˮ������ʯ����Ũ��(mg/L)</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
         <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
         <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
     <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
      <tr>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
        <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
           <td align="center"  class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
</table>
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
                        *&nbsp;
                    </td>
                </tr>
            </table>
</G:Template>
</G:Content>
</form>
</body>
</html>