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
    str1 = ",fld_662_26,fld_662_16,fld_662_21,fld_662_27,fld_662_17,fld_662_22,fld_662_28,fld_662_18,fld_662_23,fld_662_29,fld_662_19,fld_662_24,fld_662_30,fld_662_20,fld_662_25,fld_662_31";
    str2 = ",fld_662_37,''classcode32,fld_662_38,fld_662_43,fld_662_48,''as classcode33,fld_662_39,fld_662_44,fld_662_49,''as classcode34,fld_662_40,fld_662_45,fld_662_50,''as classcode35,fld_662_41,fld_662_46,fld_662_51,''as classcode36,fld_662_42,fld_662_47,fld_662_52,fld_662_53";
    str3 = ",fld_662_3,fld_662_5,fld_662_6,''as createdate,fld_662_54,fld_662_4,fld_662_2";

	view.SqlStr = "select (select fld_658_2 from gmis_mo_658 where fld_658_1=fld_662_1),(select fld_658_4 from gmis_mo_658 where fld_658_1=fld_662_1),fld_662_7,fld_662_8,fld_662_9,fld_662_10,fld_662_11,fld_662_12,fld_662_13,fld_662_14,fld_662_15 " + str1 + " " + str2 + " " + str3 + ",fld_662_32,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_662_32) as fld_662_32_1,fld_662_33,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_662_33) as fld_662_33_1,fld_662_34,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_662_34) as fld_662_34_1,fld_662_35,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_662_35) as fld_662_35_1,fld_662_36,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_662_36) as fld_662_36_1,fld_662_1 from gmis_mo_662 where fld_662_1='"+orgcode+"'" ;
    DataTable dt = view.DataTable;
    if (dt.Rows.Count > 0)
    {         
        dt.Rows[0]["createdate"] = "200" + dt.Rows[0]["fld_" + mid + "_54"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "��";
        for (int i = 32; i < 37; i++)
        {
            dt.Rows[0]["classcode" + i + ""] = dt.Rows[0]["fld_662_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_662_" + i + "_1"].ToString()=="="?"":dt.Rows[0]["fld_662_" + i + ""].ToString() + "=" + dt.Rows[0]["fld_662_" + i + "_1"].ToString();
        }
    }

	iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;


}
    
</script>
<body style="padding:10px;text-align:center">
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
               <table>
                    <tr>
                        <td>
                            �Ʊ���أ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼���أ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �ĺţ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��Ч������
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr><td style="font-size:small; font-weight:normal; width:45%" align="center" >2007��</td></tr>
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