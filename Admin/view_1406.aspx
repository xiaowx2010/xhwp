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


	view1.SqlStr="select  (select fld_1396_2 from gmis_mo_1396 where fld_1396_1=fld_"+mid+"_57) as c_name,(select fld_1396_4 from gmis_mo_1396 where fld_1396_1=fld_"+mid+"_57),fld_1406_62,fld_1406_21,fld_1406_22,fld_1406_58,fld_1406_59,fld_1406_3,fld_1406_4,fld_1406_1,fld_1406_2,fld_1406_60,fld_1406_61,fld_1406_5,fld_1406_6,fld_1406_7,fld_1406_8,fld_1406_9,fld_1406_10,fld_1406_11,fld_1406_12,fld_1406_13,fld_1406_14,fld_1406_15,fld_1406_16,fld_1406_17,fld_1406_18,fld_1406_19,fld_1406_20 from gmis_mo_1406 where fld_1406_57='"+orgcode+"'";
	view2.SqlStr="select fld_1406_24,fld_1406_26,fld_1406_27,fld_1406_28,fld_1406_25,fld_1406_23  from gmis_mo_1406 where fld_1406_57='"+orgcode+"'";
//    Response.Write(view1.SqlStr);

	iframe_1280.Attributes["src"]="iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;


}

</script>
<body>

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

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">������Ⱦ����������ŷ��������</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2010��</td>
      </tr>
    </table></td>
    <td><table>
                    <tr>
                        <td>
                            ��    �ţ�Gl09��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �Ʊ���أ�����������
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼���أ�����ͳ�ƾ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼�ĺţ���ͳ��[2009]113��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��Ч������2011��12��
                        </td>
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
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2"  align="center" class="td_viewcontent_title">ָ������</td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">1�������ŷ������������ף�</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">�̳����֣�</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��ҵ�۳����֣�</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">�������򣨶֣�</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">��������֣�</td>
      <td colspan="2"  align="center" class="td_viewcontent_title">������֣�</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">2��������</td>
      <td align="center" class="td_viewcontent_title">3���ŷ���</td>
      <td align="center" class="td_viewcontent_title">4��������</td>
      <td align="center" class="td_viewcontent_title">5���ŷ���</td>
      <td align="center" class="td_viewcontent_title">6��������</td>
      <td align="center" class="td_viewcontent_title">7���ŷ���</td>
      <td align="center" class="td_viewcontent_title">8��������</td>
      <td align="center" class="td_viewcontent_title">9���ŷ���</td>
      <td align="center" class="td_viewcontent_title">10��������</td>
      <td align="center" class="td_viewcontent_title">11���ŷ���</td>
    </tr>
 <tr>
      <td align="center" class="td_viewcontent_title">�ܼ�</td>
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
    <tr>
      <td align="center" class="td_viewcontent_title">���У�ȼ�չ���</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">���չ���</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
      <td align="center" class="td_viewcontent_content">--&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
</G:template>
</G:content>
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
      <td width="210" align="left" class="td_viewcontent_content">201*��*��*��&nbsp;</td>
    </tr>

  </table>
  </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000"><p>ע����������Դ��1������ϵ����2ʵ�ʼ�⡢3���Ϻ��㣬�������������ڡ��ڷ�����Ĳ������ŷ�������һλС��������ָ�걣����λС����</p>
          <p>�ڷ�����Ĳ������ŷ�������һλС��������ָ�걣����λС����ָ����ϵ�����������ŷ�����</p>
          <p>��һ����Ⱦ��Ĳ��������ŷ��������һ��������Դ��</p>
          </td>
    </tr></table>


</form>
</body>
</html>
