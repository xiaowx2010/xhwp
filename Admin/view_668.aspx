<!--G105-->
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

    string str1 = "", str2 = "",str3="";
    str1 = ",''as goclass7,'' as orgdata17,fld_668_22,fld_668_28,fld_668_34,fld_668_40,fld_668_46,fld_668_52,fld_668_58,fld_668_64,fld_668_70,fld_668_76,''as goclass9,''as orgdata18,fld_668_23,fld_668_29,fld_668_35,fld_668_41,fld_668_47,fld_668_53,fld_668_59,fld_668_65,fld_668_71,fld_668_77,''as goclass10,'' as orgdata19,fld_668_24,fld_668_30,fld_668_36,fld_668_42,fld_668_48,fld_668_54,fld_668_60,fld_668_66,fld_668_72,fld_668_78,''as goclass11,''as orgdata20,fld_668_25,fld_668_31,fld_668_37,fld_668_43,fld_668_49,fld_668_55,fld_668_61,fld_668_67,fld_668_73,fld_668_79,''as goclass12,''as orgdata21,fld_668_26,fld_668_32,fld_668_38,fld_668_44,fld_668_50,fld_668_56,fld_668_62,fld_668_68,fld_668_74,fld_668_80,fld_668_27,fld_668_33,fld_668_39,fld_668_45,fld_668_51,fld_668_57,fld_668_63,fld_668_69,fld_668_75,fld_668_81";
    str2 = ",''as goclass13,fld_668_82,fld_668_88,fld_668_94,fld_668_100,fld_668_106,fld_668_112,fld_668_118,fld_668_124,fld_668_130,fld_668_136,fld_668_142,fld_668_148,fld_668_154,fld_668_160,''as goclass14,fld_668_83,fld_668_89,fld_668_95,fld_668_101,fld_668_107,fld_668_113,fld_668_119,fld_668_125,fld_668_131,fld_668_137,fld_668_143,fld_668_149,fld_668_155,fld_668_161,''as goclass15,fld_668_84,fld_668_90,fld_668_96,fld_668_102,fld_668_108,fld_668_114,fld_668_120,fld_668_126,fld_668_132,fld_668_138,fld_668_144,fld_668_150,fld_668_156,fld_668_162,''as goclass16,fld_668_85,fld_668_91,fld_668_97,fld_668_103,fld_668_109,fld_668_115,fld_668_121,fld_668_127,fld_668_133,fld_668_139,fld_668_145,fld_668_151,fld_668_157,fld_668_163,''as goclass8,fld_668_86,fld_668_92,fld_668_98,fld_668_104,fld_668_110,fld_668_116,fld_668_122,fld_668_128,fld_668_134,fld_668_140,fld_668_146,fld_668_152,fld_668_158,fld_668_164,fld_668_87,fld_668_93,fld_668_99,fld_668_105,fld_668_111,fld_668_117,fld_668_123,fld_668_129,fld_668_135,fld_668_141,fld_668_147,fld_668_153,fld_668_159,fld_668_165";
    str3=",fld_668_3,fld_668_5,fld_668_6,''as createdate,fld_668_166,fld_668_4,fld_668_2";

	view.SqlStr = "select (select fld_658_2 from gmis_mo_658 where fld_658_1=fld_668_1),(select fld_658_4 from gmis_mo_658 where fld_658_1=fld_668_1) "+str1+" "+str2+" "+str3+",fld_668_7,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_7) as fld_668_7_1,fld_668_9,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_9) as fld_668_9_1,fld_668_10,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_10) as fld_668_10_1,fld_668_11,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_11) as fld_668_11_1,fld_668_12,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_12) as fld_668_12_1, fld_668_13,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_13) as fld_668_13_1,fld_668_14,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_14) as fld_668_14_1,fld_668_15,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_15) as fld_668_15_1,fld_668_16,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_16) as fld_668_16_1, fld_668_8,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_8) as fld_668_8_1,fld_668_17,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_668_17) as fld_668_17_1,fld_668_18,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_668_18) as fld_668_18_1,fld_668_19,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_668_19) as fld_668_19_1,fld_668_20,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_668_20) as fld_668_20_1,fld_668_21,(select fld_1039_2 from gmis_mo_1039 where fld_1039_1=fld_668_21) as fld_668_21_1 ,fld_668_1 from gmis_mo_668 where fld_668_1='"+orgcode+"'";
    DataTable dt = view.DataTable;
    if (dt.Rows.Count > 0)
    {
       
        dt.Rows[0]["createdate"] = "200" + dt.Rows[0]["fld_" + mid + "_166"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_4"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_2"].ToString() + "��";
        for(int i=7;i<17;i++)
        {
            dt.Rows[0]["goclass"+i+""]=dt.Rows[0]["fld_668_"+i+""].ToString()+"="+dt.Rows[0]["fld_668_"+i+"_1"].ToString()=="="?"":dt.Rows[0]["fld_668_"+i+""].ToString()+"="+dt.Rows[0]["fld_668_"+i+"_1"].ToString();
        }
        for(int i=17;i<22;i++)
        {
            dt.Rows[0]["orgdata"+i+""]=dt.Rows[0]["fld_668_"+i+""].ToString()+"="+dt.Rows[0]["fld_668_"+i+"_1"].ToString()=="="?"":dt.Rows[0]["fld_668_"+i+""].ToString()+"="+dt.Rows[0]["fld_668_"+i+"_1"].ToString();
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
<!--����-->

<!--��̬���ɽ���-->
   <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
         <td style="width: 30%" rowspan="2">&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               ��ˮ��Ⱦ����������ŷ����ղ��
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
        <tr><td style="font-size:small; font-weight:normal; width:40%" align="center" >2007��</td></tr>
    </table>
<G:content ID="view" runat="server">
<G:Template id="tempview" runat="server">
	<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="right"  class="td_viewcontent_title_top">��λ���ƣ�</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	     <td align="right"  class="td_viewcontent_title_top">��λ���룺</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
    </tr>  
</table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    
     <tr>
        <td align="center"  class="td_viewcontent_title" style="width:25%" rowspan="3" >1.��ˮȥ������</td>
        <td align="center"  class="td_viewcontent_title" style="width:15%" rowspan="3" >2.������Դ</td>
        <td align="center"  class="td_viewcontent_title"  style="width:60%" colspan="10">��Ҫ��Ⱦ��֣�</td>
        
    </tr>  
    <tr>
       <td align="center"  class="td_viewcontent_title" colspan="2" >��ѧ������</td>
        <td align="center"  class="td_viewcontent_title"  colspan="2" >����</td>
          <td align="center"  class="td_viewcontent_title" colspan="2" >ʯ����</td>
        <td align="center"  class="td_viewcontent_title"  colspan="2" >�ӷ���</td>
          <td align="center"  class="td_viewcontent_title" colspan="2"  >����������</td>        
        </tr>
        <tr>
       <td align="center"  class="td_viewcontent_title"  >3.������</td>
        <td align="center"  class="td_viewcontent_title"   >4.�ŷ���</td>
          <td align="center"  class="td_viewcontent_title"  >5.������</td>
        <td align="center"  class="td_viewcontent_title"   >6.�ŷ���</td>
          <td align="center"  class="td_viewcontent_title"   >7.������</td>       
           <td align="center"  class="td_viewcontent_title"  >8.�ŷ���</td>
        <td align="center"  class="td_viewcontent_title"   >9.������</td>
          <td align="center"  class="td_viewcontent_title"  >10.�ŷ���</td>
        <td align="center"  class="td_viewcontent_title"   >11.������</td>
          <td align="center"  class="td_viewcontent_title"   >12.�ŷ���</td>    
        </tr>
            <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>
               <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>
                  <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>
                  <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>
                  <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>
                  <tr>              
                    <td align="center" class="td_viewcontent_title" colspan="2">
                        �ܼ�
                    </td>
                   
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>              
</table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
   <tr>
        <td align="center"  class="td_viewcontent_title" colspan="15" style="width:100%" >��Ҫ��Ⱦ�ǧ�ˣ�</td>             
   </tr>  
   <tr>
        <td align="center"  class="td_viewcontent_title" style="width:16%" rowspan="2"  >��ˮȥ������</td>     
         <td align="center"  class="td_viewcontent_title"  colspan="2" >�⻯��</td>  
          <td align="center"  class="td_viewcontent_title" colspan="2"  >��</td>  
           <td align="center"  class="td_viewcontent_title" colspan="2"  >�ܸ�</td>  
            <td align="center"  class="td_viewcontent_title"  colspan="2" >���۸�</td>  
             <td align="center"  class="td_viewcontent_title" colspan="2" >Ǧ</td>  
              <td align="center"  class="td_viewcontent_title"  colspan="2"  >��</td>  
               <td align="center"  class="td_viewcontent_title"colspan="2" >��</td>          
   </tr> 
    <tr>
        
         <td align="center"  class="td_viewcontent_title"  >13.������</td>  
          <td align="center"  class="td_viewcontent_title"   >14.�ŷ���</td>
           <td align="center"  class="td_viewcontent_title" >15.������</td>  
           <td align="center"  class="td_viewcontent_title"   >16.�ŷ���</td>
             <td align="center"  class="td_viewcontent_title" >17.������</td>  
             <td align="center"  class="td_viewcontent_title"   >18.�ŷ���</td>
               <td align="center"  class="td_viewcontent_title">19.������</td> 
               <td align="center"  class="td_viewcontent_title"   >20.�ŷ���</td>   
                <td align="center"  class="td_viewcontent_title">21.������</td>   
                <td align="center"  class="td_viewcontent_title"   >22.�ŷ���</td>   
                 <td align="center"  class="td_viewcontent_title">23.������</td>  
                 <td align="center"  class="td_viewcontent_title"   >24.�ŷ���</td> 
                  <td align="center"  class="td_viewcontent_title">25.������</td>      
                   <td align="center"  class="td_viewcontent_title"   >26.�ŷ���</td>       
   </tr> 
       <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>  
           <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>  
                 <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>  
                 <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>  
                 <tr>              
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
                </tr>  
                    <tr>              
                    <td align="center" class="td_viewcontent_content" >
                        �ܼ�
                    </td>
                    
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                      <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    
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
</G:content>
</form>
</body>
</html>