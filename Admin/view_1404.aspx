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

	content_0.SqlStr = "select fld_1396_2,fld_1396_4 from gmis_Mo_1396 where fld_1396_1='"+orgcode+"'";
	list.SqlStr="select (case fld_1417_3 when '' then '' else 'YL-'+fld_1417_3 end) , fld_1417_4, fld_1417_5, fld_1417_6, fld_1417_7, fld_1417_8, fld_1417_9,(fld_1417_10+'='+(select fld_975_2 from gmis_mo_975 where fld_975_1=fld_1417_10)), fld_1417_11, fld_1417_12, fld_1417_13, fld_1417_14, fld_1417_15, (case fld_1417_22 when '' then '' else 'QZ-'+fld_1417_22 end), (case fld_1417_23 when '' then '' else 'QZ-'+fld_1417_23 end), fld_1417_16, fld_1417_17, fld_1417_18, fld_1417_19, fld_1417_20, fld_1417_21 from gmis_mo_1417 where fld_1417_1='"+orgcode+"'";
	list_1.SqlStr="select (case fld_1418_3 when '' then '' else 'QZ-'+fld_1418_3 end), fld_1418_4, fld_1418_5, fld_1418_6, fld_1418_7, fld_1418_8, fld_1418_9, fld_1418_10, fld_1418_11, fld_1418_12, fld_1418_13, fld_1418_14, fld_1418_15, fld_1418_16, fld_1418_17, fld_1418_18, fld_1418_19, fld_1418_21, fld_1418_22, fld_1418_23, fld_1418_24, fld_1418_25 from gmis_mo_1418 where fld_1418_1='"+orgcode+"'";
    content_1.SqlStr="select fld_1404_19,fld_1404_2,fld_1404_3,fld_1404_4,fld_1404_5,fld_1404_6,fld_1404_1 from gmis_mo_1404 where fld_1404_1='"+orgcode+"'";
	list.Rows = list.DataTable.Rows.Count;
	list_1.Rows = list_1.DataTable.Rows.Count;
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
<table width="100%"><tr><td>
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><!--��ͷ-->
            <table width="100%">
                <tr>
                    <td width="30%">&nbsp;</td>
                    <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">Ҥ¯������������ʩ�ղ��<br><span style="font-size:small; font-weight:normal;">2010��</span></td>
                    <td width="30%">
                       <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="top_font1220_000000">�����ţ�G107��</td>
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
            </table>
        </td>
    </tr>
    <tr>
        <td><!--����-->
            <G:Content ID="content_0" runat="server" Alert="...">
            <G:Template id="template_0" runat="server">
                <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
                    <tr>
                        <td   class="td_viewcontent_title" width="15%" align="right">
                            ��λ���ƣ�</td>
                        <td class="td_viewcontent_content" width="35%">*&nbsp;
                        </td>
                        <td     class="td_viewcontent_title" width="15%" align="right">
                            ��λ���룺</td>
                        <td class="td_viewcontent_content" width="35%">*&nbsp;
                        </td>
                    </tr>
                </table>
            </G:Template></G:Content>
            <G:ListTable id="list" runat="server" >
    <G:Template id="listtemphead" type="head" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
                <tr>
                    <td   class="td_viewcontent_title" align="center" colspan="14">
                        һ��Ҥ¯�������</td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        1.Ҥ¯���</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        2.Ҥ¯���</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        3.Ҥ¯������</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        4.Ͷ��ʹ��ʱ��</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        5.������λ</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        6.�����������</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        7.����Сʱ</td>
                    <td   class="td_viewcontent_title" align="center" colspan="3">
                        ��Դ</td>
                    <td   class="td_viewcontent_title" align="center" colspan="3">
                        ԭ������</td>
                    <td   class="td_viewcontent_title" align="center" rowspan="2">
                        14.��Ӧ�Ĵ�����ʩ���</td>
                </tr>
                <tr>
                    <td   class="td_viewcontent_title" align="center">
                        8.����</td>
                    <td   class="td_viewcontent_title" align="center">
                        9.������λ</td>
                    <td   class="td_viewcontent_title" align="center">
                        10.������</td>
                    <td   class="td_viewcontent_title" align="center">
                        11.����</td>
                    <td   class="td_viewcontent_title" align="center">
                        12.������λ</td>
                    <td   class="td_viewcontent_title" align="center">
                        13.ʹ����</td>
                </tr>
        </G:Template>
            <G:Template id="templist"  runat="server">
            <tr>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        *&nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        *&nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                       *&nbsp;<br>*</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                    <td class="td_viewcontent_content">*&nbsp;</td>
                </tr>
              </G:Template>
        </table>
   </G:ListTable>
            <G:ListTable ID="list_1" runat="server">
            <G:Template id="listtemphead_1" type="head" runat="server">
            <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
                <tr>
                    <td   class="td_viewcontent_title" align="center" colspan="14">
                        ����������ʩ�������</td>
                </tr>
                <tr>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        1.������ʩ���</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        2.��Ͷ�ʶ�(��Ԫ)</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        3.��ƴ�������(������/ʱ)</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        4.���з���(��Ԫ)</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        5.����Сʱ</td>
                    <td align="center" class="td_viewcontent_title" rowspan="2">
                        6.�ĵ���(��ǧ��ʱ)</td>
                    <td   class="td_viewcontent_title" align="center" colspan="2">
                        ������</td>
                    <td   class="td_viewcontent_title" align="center" colspan="3">
                        �������Ҫ��Ⱦ��</td>
                    <td   class="td_viewcontent_title" align="center" rowspan="2">
                        12.����ʵ�ʴ�����(��������)</td>
                </tr>
                <tr>
                    <td   class="td_viewcontent_title" align="center">
                        7.����</td>
                    <td   class="td_viewcontent_title" align="center">
                        8.����</td>
                    <td   class="td_viewcontent_title" align="center">
                        9.����</td>
                    <td   class="td_viewcontent_title" align="center">
                        10.����</td>
                    <td   class="td_viewcontent_title" align="center">
                        11.����Ч��(%)</td>
                </tr>
	            </G:Template>
                <G:Template id="template_1" runat="server">
                <tr>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                        * &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                </tr>
            </G:Template>
            <G:Template id="template_1_e" runat="server">
                <tr>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content" rowspan="3">
                         &nbsp; &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                    <td class="td_viewcontent_content"> &nbsp;</td>
                </tr>

            </G:Template></table></G:ListTable>
            <G:Content ID="content_1" runat="server" Alert="...">
<G:Template id="template_01" runat="server">
            <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
                <tr>
                    <td class="td_viewcontent_title" width="15%" align="right">��λ������:</td>
                    <td class="td_viewcontent_content" width="35%">*&nbsp;</td>
                    <td class="td_viewcontent_title" width="15%" align="right">�����:</td>
                    <td class="td_viewcontent_content" width="35%">*&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_title" width="15%" align="right">�����:</td>
                    <td class="td_viewcontent_content" width="35%">*&nbsp;</td>
                    <td class="td_viewcontent_title" width="15%" align="right">�������</td>
                    <td class="td_viewcontent_content" width="35%">201*��*��*��</td>
                </tr>
            </table>
            </G:Template></G:Content>
        </td>
    </tr>
    <tr>
        <td class="td_viewcontent_content"><!--���-->
            
        </td>
    </tr>
</table>
</td></tr></table>
<!--��̬���ɽ���-->
</form>
</body>
</html>