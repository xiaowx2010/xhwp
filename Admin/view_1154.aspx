<!--Σ�շ��Ｏ�д��ó��������  �����4��,�鿴ҳ-->
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
    //view.SqlStr = "select fld_1154_1,fld_1154_2,fld_1154_4,fld_1154_5,fld_1154_6,fld_1154_7,fld_1154_8,fld_1154_9,fld_1154_10,fld_1154_3,fld_1154_11,fld_1154_12+'='+(select fld_1195_2 from gmis_mo_1195 where fld_1195_1=fld_1154_12),fld_1154_13,fld_1154_14,fld_1154_15+'='+(select fld_1167_2 from gmis_mo_1167 where fld_1167_1=fld_1154_15),fld_1154_16+'='+(select fld_1167_2 from gmis_mo_1167 where fld_1167_1=fld_1154_16),fld_1154_17+'='+(select fld_1167_2 from gmis_mo_1167 where fld_1167_1=fld_1154_17),fld_1154_18+'='+(select fld_1167_2 from gmis_mo_1167 where fld_1167_1=fld_1154_18),fld_1154_19+'='+(select fld_1167_2 from gmis_mo_1167 where fld_1167_1=fld_1154_19),fld_1154_20,fld_1154_29,fld_1154_21,fld_1154_30,fld_1154_22,fld_1154_31,fld_1154_23,fld_1154_24,fld_1154_32,fld_1154_25,fld_1154_33,fld_1154_26,fld_1154_34,fld_1154_27,fld_1154_35,fld_1154_28 from gmis_mo_1154 where mocode=" + id;
    view.SqlStr = "select fld_1154_1,fld_1202_2,fld_1202_12,fld_1202_6,fld_1202_7,fld_1202_8,fld_1202_9,fld_1202_10,fld_1202_11,fld_1202_1,fld_1202_3,fld_1202_5+'='+(select fld_1195_2 from gmis_mo_1195 where fld_1195_1=fld_1202_5),fld_1202_18,fld_1154_14,fld_1154_15+'='+(select fld_1167_2 from gmis_mo_1167 where fld_1167_1=fld_1154_15),fld_1154_16+'='+(select fld_1167_2 from gmis_mo_1167  where fld_1167_1=fld_1154_16),fld_1154_17+'='+(select fld_1167_2 from gmis_mo_1167 where fld_1167_1=fld_1154_17),fld_1154_18+'='+(select fld_1167_2 from gmis_mo_1167 where fld_1167_1=fld_1154_18),fld_1154_19+'='+(select fld_1167_2 from gmis_mo_1167 where fld_1167_1=fld_1154_19),fld_1154_20,fld_1154_29,fld_1154_21,fld_1154_30,fld_1154_22,fld_1154_31,fld_1154_23,fld_1154_24,fld_1154_32,fld_1154_25,fld_1154_33,fld_1154_26,fld_1154_34,fld_1154_27,fld_1154_35,fld_1154_28 from gmis_mo_1154 left outer join gmis_mo_1202 on fld_1202_2=fld_1154_2 where gmis_mo_1154.mocode=" + id;
   // Response.Write(view.SqlStr);
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
Σ�շ��Ｏ�д��ó���������������4��</td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="2" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td rowspan="2" width="7%" align="right"  class="td_viewcontent_title">ͳ�����</td>
      <td rowspan="2" width="5%" align="left"  class="td_viewcontent_content" >
        *&nbsp;
      </td>
      <td width="6%" rowspan="2" align="right"  class="td_viewcontent_title">��ҵ���˴���</td>
      <td width="7%" rowspan="2" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td width="4%" rowspan="2" align="right"  class="td_viewcontent_title" nowrap>��ϵ�绰</td>
      <td width="5%" rowspan="2" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td width="7%" rowspan="2" align="right"  class="td_viewcontent_title">��ҵ����λ��</td>
      <td width="11%" class="td_viewcontent_content" nowrap>���ľ���
      *��*��*��&nbsp;
      </td>
    </tr>
    <tr>
      <td class="td_viewcontent_content" nowrap>����γ��
        *��*��*��&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��ҵ��ϸ����</td>
      <td colspan="7" align="left"  class="td_viewcontent_content">
        *&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��ҵ��ϸ��ַ</td>
      <td colspan="2" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">�����������</td>
      <td align="left" colspan=2  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">��ҵʱ��</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">������������</td>
      <td colspan="2" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>��������Ҫ����1</td>
      <td align="left"  colspan=2 class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>��������Ҫ����2</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title" nowrap>��������Ҫ����3</td>
      <td colspan="2" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>��������Ҫ����4</td>
      <td align="left"  colspan=2 class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>��������Ҫ����5</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">�����4��</td>
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
      <td align="center"  class="td_viewcontent_title">1��������ʵ�ʴ�������</td>
      <td align="center"  class="td_viewcontent_content">��/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">10</td>
      <td align="center"  class="td_viewcontent_title">����ҽ�Ʒ�����</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">2</td>
      <td align="center"  class="td_viewcontent_title">���У����մ�������</td>
      <td align="center"  class="td_viewcontent_content">��/��</td>
      <td align="center"  class="td_viewcontent_content">
        *&nbsp;
      </td>
      <td align="center"  class="td_viewcontent_content">11</td>
      <td align="center"  class="td_viewcontent_title">������������Σ�շ�����</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">3</td>
      <td align="center"  class="td_viewcontent_title">����������������</td>
      <td align="center"  class="td_viewcontent_content">��/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">12</td>
      <td align="center"  class="td_viewcontent_title">3��Σ�շ����ۺ�������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">4</td>
      <td align="center"  class="td_viewcontent_title">���У������������մ�������</td>
      <td align="center"  class="td_viewcontent_content">��/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title">4�����ղ�������</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">5</td>
      <td align="center"  class="td_viewcontent_title">����������������������������</td>
      <td align="center"  class="td_viewcontent_content">��/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">13</td>
      <td align="center"  class="td_viewcontent_title">��1�����ղ�����</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">6</td>
      <td align="center"  class="td_viewcontent_title">2��Σ�շ��ﴦ����</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">14</td>
      <td align="center"  class="td_viewcontent_title">��2�����ղ���������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">7</td>
      <td align="center"  class="td_viewcontent_title">�����У�������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">15</td>
      <td align="center"  class="td_viewcontent_title">��3�����ղ���������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">8</td>
      <td align="center"  class="td_viewcontent_title">��������������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">16</td>
      <td align="center"  class="td_viewcontent_title">5���������з���</td>
      <td align="center"  class="td_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">9</td>
      <td align="center"  class="td_viewcontent_title">���У����ù�ҵΣ�շ�����</td>
      <td align="center"  class="td_viewcontent_content">��</td>
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
