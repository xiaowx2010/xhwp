<!--������ˮ�����������  �����5��,�鿴ҳ-->
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
    view.SqlStr = "select fld_1155_1,fld_1202_2,fld_1202_12,fld_1202_6,fld_1202_7,fld_1202_8,fld_1202_9,fld_1202_10,fld_1202_11,fld_1202_1,fld_1202_3,fld_1202_5+'='+(select fld_1195_2 from gmis_mo_1195 where fld_1195_1=fld_1202_5),fld_1155_13+'='+(select fld_1171_2 from gmis_mo_1171 where fld_1171_1=fld_1155_13),fld_1155_14,fld_1155_15,fld_1155_16,fld_1155_17+'='+(select fld_1166_2 from gmis_mo_1166 where fld_1166_1=fld_1155_17),fld_1202_18,fld_1155_19,fld_1155_20+'='+(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1155_20),fld_1155_22,fld_1155_21+'='+(select fld_1164_2 from gmis_mo_1164 where fld_1164_1=fld_1155_21),fld_1155_23,fld_1155_32,fld_1155_24,fld_1155_33,fld_1155_25,fld_1155_34,fld_1155_26,fld_1155_35,fld_1155_27,fld_1155_36,fld_1155_28,fld_1155_37,fld_1155_29,fld_1155_38,fld_1155_30,fld_1155_39,fld_1155_31,fld_1155_40 from gmis_mo_1155 left outer join gmis_mo_1202 on fld_1202_2=fld_1155_2 where gmis_mo_1155.mocode=" + id; 
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
          
������ˮ������������������5��</td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<!--����������-->

  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td rowspan="2" width=9% align="right"  class="td_viewcontent_title">ͳ�����</td>
      <td rowspan="2" width=9% align="left"  class="td_viewcontent_content">
        *&nbsp;
      </td>
      <td  width=9% rowspan="2" align="right"  class="td_viewcontent_title">��ҵ���˴���</td>
      <td rowspan="2" width=11% align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" width=9% align="right"  class="td_viewcontent_title">��ϵ�绰</td>
      <td rowspan="2" width=9% align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" width=9% align="right"  class="td_viewcontent_title">��ҵ����λ��</td>
      <td width=12% class="td_viewcontent_content" nowrap>���ľ���
      *��*��*��&nbsp;
      </td>
    </tr>
    <tr>
      <td nowrap  class="td_viewcontent_content" >����γ��
        *��*��*��&nbsp;
        </td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��ҵ��ϸ����</td>
      <td colspan="7" align="left"  class="td_viewcontent_content">
        *&nbsp;
    </td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��ҵ��ϸ��ַ</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>�����������</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��ˮ������</td>
      <td  align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>��ˮ������1</td>
      <td align="left" colspan=2  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>��ˮ������2</td>
      <td colspan=2 class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title" nowrap>��ˮ������3</td>
      <td colspan="2" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>��ˮ������ʩ����</td>
      <td align="left" colspan=2  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">��ҵʱ��</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">������������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">��ˮȥ������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">����ˮ������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>����ˮ�����</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">�����5��</td>
            <td width="21"><img id="hide" onclick="click_hide('div_hide')" title="����" src="images/fanhuiliebiao_007.gif" width="11" height="11"></td>
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
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">1</td>
      <td align="center"  class="td_viewcontent_title">1����ˮ��ƴ�������</td>
      <td align="center"  class="td_viewcontent_content">��/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">10</td>
      <td align="center"  class="td_viewcontent_title">9���������ˮ������ƽ��Ũ��</td>
      <td align="center"  class="td_viewcontent_content">����/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">2</td>
      <td align="center"  class="td_viewcontent_title">2����ˮʵ�ʴ�������</td>
      <td align="center"  class="td_viewcontent_content">��/��</td>
      <td align="center"  class="td_viewcontent_content">
        *&nbsp;
      </td>
      <td align="center"  class="td_viewcontent_content">11</td>
      <td align="center"  class="td_viewcontent_title">10�����������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">3</td>
      <td align="center"  class="td_viewcontent_title">3����ˮ�괦����</td>
      <td align="center"  class="td_viewcontent_content">���</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">12</td>
      <td align="center"  class="td_viewcontent_title">11�����ദ����</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">4</td>
      <td align="center"  class="td_viewcontent_title">���У���ˮ����������</td>
      <td align="center"  class="td_viewcontent_content">���</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">13</td>
      <td align="center"  class="td_viewcontent_title">12������������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">5</td>
      <td align="center"  class="td_viewcontent_title">4������ǰ��ˮ�л�ѧ������ƽ��Ũ��</td>
      <td align="center"  class="td_viewcontent_content">����/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">14</td>
      <td align="center"  class="td_viewcontent_title">13�������ŷ���</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">6</td>
      <td align="center"  class="td_viewcontent_title">5���������ˮ�л�ѧ������ƽ��Ũ��</td>
      <td align="center"  class="td_viewcontent_content">����/��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">15</td>
      <td align="center"  class="td_viewcontent_title">14���������з���</td>
      <td align="center"  class="td_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">7</td>
      <td align="center"  class="td_viewcontent_title">6������ǰ��ˮ�а���ƽ��Ũ��</td>
      <td align="center"  class="td_viewcontent_content">����/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">16</td>
      <td align="center"  class="td_viewcontent_title">���У���������</td>
      <td align="center"  class="td_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">8</td>
      <td align="center"  class="td_viewcontent_title">7���������ˮ�а���ƽ��Ũ��</td>
      <td align="center"  class="td_viewcontent_content">����/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">17</td>
      <td align="center"  class="td_viewcontent_title">���շ�</td>
      <td align="center"  class="td_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">9</td>
      <td align="center"  class="td_viewcontent_title">8������ǰ��ˮ������ƽ��Ũ��</td>
      <td align="center"  class="td_viewcontent_content">����/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">18</td>
      <td align="center"  class="td_viewcontent_title">15���ĵ���</td>
      <td align="center"  class="td_viewcontent_content">���</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
</div>
</G:Template>
</G:Content>
<!--��̬����html,����-->
</form>
</body>
</html>
