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

	content_0.SqlStr = "select fld_1280_2,fld_1280_4,(case fld_1306_3 when '' then '' else 'YL-'+fld_1306_3 end), fld_1306_4, fld_1306_5, fld_1306_6, fld_1306_7, fld_1306_8, fld_1306_9,(fld_1306_10+'='+(select fld_975_2 from gmis_mo_975 where fld_975_1=fld_1306_10)), fld_1306_11, fld_1306_12, fld_1306_13, fld_1306_14, fld_1306_15, (case fld_1306_22 when '' then '' else 'QZ-'+fld_1306_22 end), (case fld_1306_23 when '' then '' else 'QZ-'+fld_1306_23 end), fld_1306_16, fld_1306_17, fld_1306_18, fld_1306_19, fld_1306_20, fld_1306_21, (case fld_1307_3 when '' then '' else 'QZ-'+fld_1307_3 end), fld_1307_4, fld_1307_5, fld_1307_6, fld_1307_7, fld_1307_8, fld_1307_9, fld_1307_10, fld_1307_11, fld_1307_12, fld_1307_13, fld_1307_14, fld_1307_15, fld_1307_16, fld_1307_17, fld_1307_18, fld_1307_19, fld_1307_20, fld_1307_21, fld_1307_22, fld_1307_23, fld_1307_24, fld_1307_25, fld_1307_26,fld_1288_19,fld_1288_2,fld_1288_3,fld_1288_4,fld_1288_5,fld_1288_6,fld_1288_1 from " + GetModuleTableName(mid) + " a left join " + GetModuleTableName("1306") + " b on fld_1306_1=fld_1288_1 left join " + GetModuleTableName("1307") + " c on fld_1307_1=fld_1288_1 left join " + GetModuleTableName("1280") + " d on fld_1280_1=fld_1288_1 where fld_1288_1='"+orgcode+"'";     

	iframe_1280.Attributes["src"]="iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
}

</script>

<body style="padding:10px;text-align:center">
<form id="form1" runat="server">

<!--ѡ�-->
        <table width="100%">
            <tr>
                <td>
   <iframe id="iframe_1280"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
<G:Content ID="content_0" runat="server" Alert="...">
<G:Template id="template_0" runat="server">
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><!--��ͷ-->
            <table width="100%">
                <tr>
                    <td width="30%">&nbsp;</td>
                    <td width="40%" align="center" valign="middle" style="font-size:large; font-weight:bolder;">Ҥ¯������������ʩ�ղ��<br><span style="font-size:small; font-weight:normal;">2009��</span></td>
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
                    
            </table>
            <%--</G:Template></G:Content>
            <G:Content ID="content_1" runat="server" Alert="...">
            <G:Template id="template_1" runat="server">--%>
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
                    <td class="td_viewcontent_content">* &nbsp;</td>
                </tr>
                <tr>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                    <td class="td_viewcontent_content">* &nbsp;</td>
                </tr>
            </table>
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
        </td>
    </tr>
    <tr>
        <td class="td_viewcontent_content"><!--���-->
            
        </td>
    </tr>
</table>
</G:Template></G:Content></td></tr></table>
<!--��̬���ɽ���-->
</form>
</body>
</html>