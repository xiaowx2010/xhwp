<!--ҽԺ��Ⱦ�ŷż��������  �����6��,�鿴ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{    
     
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����   
    view.SqlStr = "select fld_1156_1,fld_1202_2,fld_1202_6,fld_1202_7,fld_1202_8,fld_1202_1,fld_1156_4,fld_1202_9,fld_1202_10,fld_1202_11,fld_1202_3,fld_1202_5+'='+(select fld_1195_2 from gmis_mo_1195 where fld_1195_1=fld_1202_5),fld_1202_18,fld_1156_14+'='+(select fld_1179_2 from gmis_mo_1179 where fld_1179_1=fld_1156_14),fld_1156_15+'='+(select fld_1171_2 from gmis_mo_1171 where fld_1171_1=fld_1156_15),fld_1156_16,fld_1156_17,fld_1156_18,fld_1156_20,fld_1156_19+'='+(select fld_1164_2 from gmis_mo_1164 where fld_1164_1=fld_1156_19),fld_1156_21+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1156_21),fld_1156_22,fld_1156_30,fld_1156_38,fld_1156_23,fld_1156_31,fld_1156_39,fld_1156_24,fld_1156_32,fld_1156_40,fld_1156_25,fld_1156_33,fld_1156_41,fld_1156_26,fld_1156_34,fld_1156_42,fld_1156_27,fld_1156_35,fld_1156_43,fld_1156_28,fld_1156_36,fld_1156_44,fld_1156_29,fld_1156_37 from gmis_mo_1156 left outer join gmis_mo_1202 on fld_1202_2=fld_1156_2 where gmis_mo_1156.mocode=" + id; 
 }
</script>
<script>
    function click_hide(obj)
    {
        var a=document.getElementById(obj).style.display;
        if(a=="block")
        {
            document.getElementById(obj).style.display="none";
            document.getElementById('hide').title="չ��";
        }
        else
        {
            document.getElementById(obj).style.display="block";
            document.getElementById('hide').title="����";
        }
    }
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%"  ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" class="font_2635B_000">
          
ҽԺ��Ⱦ�ŷż�������������������6��</td>
      </tr>
    </table>
    </td>
  </tr>
</table>


  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td align="right" width="10%"  class="td_viewcontent_title">ͳ�����</td>
      <td align="left" width="10%" class="td_viewcontent_content">
        *&nbsp;
      </td>
      <td align="right" width="9%" class="td_viewcontent_title">��ҵ���˴���</td>
      <td align="left" width="10%" class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" width="9%" align="right"  class="td_viewcontent_title">��ҵ����λ��</td>
      <td width="11%" class="td_viewcontent_content" nowrap>���ľ���*��*��*��&nbsp;
      </td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��ҵ��ϸ����</td>
      <td align="left"  class="td_viewcontent_content">
        *&nbsp;
</td>
      <td align="right"  class="td_viewcontent_title">������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="left"  class="td_viewcontent_content" nowrap>����γ��*��*��*��&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��ҵ��ϸ��ַ</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">�����������</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��ҵʱ��</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">ҽԺ�ȼ�</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">��ˮ������</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��ˮ������1</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">��ˮ������2</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">��ˮ������3</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">����ˮ������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">����ˮ�����</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">ҽ�Ʒ��ﴦ�÷�ʽ</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">�����6��</td>
            <td width="21"><img id="hide" title="����" onclick="click_hide('div_hide')" src="images/fanhuiliebiao_007.gif" width="11" height="11"></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <div id="div_hide" style="display:block">
  <table width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
    <tr>
      <td align="center"  class="td_viewcontent_content">����</td>
      <td align="center"  class="td_viewcontent_title">ָ������</td>
      <td align="center"  class="td_viewcontent_content">������λ</td>
      <td align="center"  class="td_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td_viewcontent_content">����</td>
      <td align="center"  class="td_viewcontent_title">ָ������</td>
      <td align="center"  class="td_viewcontent_content">������λ</td>
      <td align="center"  class="td_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td_viewcontent_content">����</td>
      <td align="center"  class="td_viewcontent_title">ָ������</td>
      <td align="center"  class="td_viewcontent_content">������λ</td>
      <td align="center"  class="td_viewcontent_content">����ʵ��</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_title">��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">1</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_title">��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">1</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_title">��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">1</td>
      <td align="center"  class="td_viewcontent_title">1���ܴ���</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">9</td>
      <td align="center"  class="td_viewcontent_title">9����ˮ��</td>
      <td align="center"  class="td_viewcontent_content">����/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">17</td>
      <td align="center"  class="td_viewcontent_title">16����󳦾�Ⱥ���Ũ�����ֵ</td>
      <td align="center"  class="td_viewcontent_content">��/L</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">2</td>
      <td align="center"  class="td_viewcontent_title">2������ʹ����</td>
      <td align="center"  class="td_viewcontent_content">%</td>
      <td align="center"  class="td_viewcontent_content">
        *&nbsp;
      </td>
      <td align="center"  class="td_viewcontent_content">10</td>
      <td align="center"  class="td_viewcontent_title">10����ˮ������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">18</td>
      <td align="center"  class="td_viewcontent_title">17��ҽ�Ʒ��������</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">3</td>
      <td align="center"  class="td_viewcontent_title">3��������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">11</td>
      <td align="center"  class="td_viewcontent_title">11����ˮ�ŷ���</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">19</td>
      <td align="center"  class="td_viewcontent_title">18��ҽ�Ʒ��ﴦ����</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">4</td>
      <td align="center"  class="td_viewcontent_title">4����ˮ������ʩ��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">12</td>
      <td align="center"  class="td_viewcontent_title">���У�����ŷ���</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">20</td>
      <td align="center"  class="td_viewcontent_title">19������Σ�շ��Ｏ�д��ó�����</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">5</td>
      <td align="center"  class="td_viewcontent_title">5����ˮ������ʩ����</td>
      <td align="center"  class="td_viewcontent_content">��/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">13</td>
      <td align="center"  class="td_viewcontent_title">12�������ˮ����������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">21</td>
      <td align="center"  class="td_viewcontent_title">20������Դ��</td>
      <td align="center"  class="td_viewcontent_content">ö</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">6</td>
      <td align="center"  class="td_viewcontent_title">6����ˮ������ʩ���з���</td>
      <td align="center"  class="td_viewcontent_content">��Ԫ</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">14</td>
      <td align="center"  class="td_viewcontent_title">13����ѧ�������ŷ���</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">22</td>
      <td align="center"  class="td_viewcontent_title">���У����й����</td>
      <td align="center"  class="td_viewcontent_content">ö</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">7</td>
      <td align="center"  class="td_viewcontent_title">7��ҽ�Ʒ��ﴦ����ʩ��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">15</td>
      <td align="center"  class="td_viewcontent_title">14�������ŷ���</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">23</td>
      <td align="center"  class="td_viewcontent_title">21�����۷���Դ��</td>
      <td align="center"  class="td_viewcontent_content">ö</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">8</td>
      <td align="center"  class="td_viewcontent_title">8
      ��ҽ�Ʒ��ﴦ����ʩ���з���</td>
      <td align="center"  class="td_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">16</td>
      <td align="center"  class="td_viewcontent_title">��15�����ȼ��Ũ�����ֵ</td>
      <td align="center"  class="td_viewcontent_content">mg/L</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td_viewcontent_title">&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
    </tr>
</table>
</div>
</G:Template>
</G:Content>
<!--��̬����html,����-->
</form>
</body>
</html>
