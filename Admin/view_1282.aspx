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
    str1 = ",fld_1282_26,fld_1282_16,fld_1282_21,fld_1282_27,fld_1282_17,fld_1282_22,fld_1282_28,fld_1282_18,fld_1282_23,fld_1282_29,fld_1282_19,fld_1282_24,fld_1282_30,fld_1282_20,fld_1282_25,fld_1282_31";
    str2 = ",fld_1282_37,''classcode32,fld_1282_38,fld_1282_43,fld_1282_48,''as classcode33,fld_1282_39,fld_1282_44,fld_1282_49,''as classcode34,fld_1282_40,fld_1282_45,fld_1282_50,''as classcode35,fld_1282_41,fld_1282_46,fld_1282_51,''as classcode36,fld_1282_42,fld_1282_47,fld_1282_52,fld_1282_53";
    str3 = ",fld_1282_3,fld_1282_5,fld_1282_6,''as createdate,fld_1282_54,fld_1282_4,fld_1282_2";

	view.SqlStr = "select (select fld_1280_2 from gmis_mo_1280 where fld_1280_1=fld_1282_1),(select fld_1280_4 from gmis_mo_1280 where fld_1280_1=fld_1282_1),fld_1282_7,fld_1282_8,fld_1282_9,fld_1282_10,fld_1282_11,fld_1282_12,fld_1282_13,fld_1282_14,fld_1282_15 " + str1 + " " + str2 + " " + str3 + ",fld_1282_32,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1282_32) as fld_1282_32_1,fld_1282_33,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1282_33) as fld_1282_33_1,fld_1282_34,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1282_34) as fld_1282_34_1,fld_1282_35,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1282_35) as fld_1282_35_1,fld_1282_36,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1282_36) as fld_1282_36_1,fld_1282_1 from gmis_mo_1282 where fld_1282_1='"+orgcode+"'" ;
    DataTable dt = view.DataTable;
    if (dt.Rows.Count > 0)
    {         
        dt.Rows[0]["createdate"] = "201" + dt.Rows[0]["fld_" + mid + "_54"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "��";
        for (int i = 32; i < 37; i++)
        {
            dt.Rows[0]["classcode" + i + ""] = dt.Rows[0]["fld_1282_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_1282_" + i + "_1"].ToString()=="="?"":dt.Rows[0]["fld_1282_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_1282_" + i + "_1"].ToString();
        }
    }

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
        <tr><td style="font-size:small; font-weight:normal; width:45%" align="center" >2009��</td></tr>
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
    <tr>
        <td align="right"  class="td_viewcontent_title" >5.��ί�д���λ����</td>
        <td align="center"  class="td_viewcontent_content" colspan="3" >*&nbsp;</td> 
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