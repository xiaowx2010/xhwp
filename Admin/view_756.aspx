<!--G207 ��������������������ѹ�����ղ��-->

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
        string orgcode = GetQueryString("orgcode","0");
        string h_sql1="";//�ֶ�
        for(int i=0;i<18;i++)
        {
            
            h_sql1+=" ,fld_756_"+(7+i);
            h_sql1+=" ,fld_756_"+(25+i);
            h_sql1+=" ,fld_756_"+(43+i);
            h_sql1+=" ,fld_756_"+(61+i);
            h_sql1+=" ,(case when fld_756_"+(79+i)+"!=0 then cast(fld_756_"+(79+i)+" as nvarchar)+'��' else '' end)";
            h_sql1+=" ,(case when fld_756_"+(97+i)+"!=0 then cast(fld_756_"+(97+i)+" as nvarchar)+'��' else '' end)";
            h_sql1+=" ,(case when fld_756_"+(115+i)+"!=0 then cast(fld_756_"+(115+i)+" as nvarchar)+'��' else '' end)";
            h_sql1+=" ,(case when fld_756_"+(133+i)+"!=0 then cast(fld_756_"+(133+i)+" as nvarchar)+'��' else '' end)";
            if(i<12)
            {
                h_sql1+=" ,(case when fld_756_"+(151+i)+"!=0 then cast(fld_756_"+(151+i)+" as nvarchar)+'��' else '' end)";
                h_sql1+=" ,(case when fld_756_"+(163+i)+"!=0 then cast(fld_756_"+(163+i)+" as nvarchar)+'��' else '' end)";
            }       
        }
        view.SqlStr ="select top 1 (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_756_1) as comname ,(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_756_1) as comcode "+h_sql1+" ,fld_756_3,fld_756_5,fld_756_6,fld_756_175,fld_756_4,fld_756_2,fld_756_1 from gmis_mo_756 where fld_756_1='"+orgcode+"'"; 
    iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
    }
</script>
<body>
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

    <!--��̬����html,��ʼ-->   
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">��������������������ѹ�����ղ��</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G207��</td>
      </tr>
      <tr>
        <td class="font1220_000000">�Ʊ���أ�����Ժ��һ��ȫ����Ⱦ�ղ��쵼С��칫��</td>
      </tr>
      <tr>
        <td class="font1220_000000">��׼���أ�����ͳ�ƾ�</td>
      </tr>
      <tr>
        <td class="font1220_000000">��׼�ĺţ���ͳ��[2007]124��</td>
      </tr>
      <tr>
        <td class="font1220_000000">��Ч������2008��6��30��</td>
      </tr>
    </table></td>
  </tr>
</table>
<!--����������-->
 <G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td  width="100" align="right"  class="td_viewcontent_title">��λ���ƣ����£�</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*</td>
    </tr>
    <tr>
      <td align="right" width="100"  class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%"  align="center" class="td_viewcontent_title">�豸���</td>
      <td width="15%"  align="center" class="td_viewcontent_title">�������ң����ڵı������ң�</td>
      <td width="13%"  align="center" class="td_viewcontent_title">�ͺ�</td>
      <td width="13%"  align="center" class="td_viewcontent_title">������KVar��</td>
      <td width="13%"  align="center" class="td_viewcontent_title">����</td>
      <td width="13%"  align="center" class="td_viewcontent_title">�豸����ʱ�䣨���£�</td>
      <td width="13%"  align="center" class="td_viewcontent_title">Ͷ��ʱ�䣨���£�</td>
      <td width="13%"  align="center" class="td_viewcontent_title">����ʱ�䣨���£�</td>
    </tr>
    <tr>
      <td rowspan="6" align="center" class="td_viewcontent_content" >����</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
  <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
    <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="6" align="center" class="td_viewcontent_content" >����</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
     <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
   <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="6" align="center" class="td_viewcontent_content" >����</td>
     <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
    <tr>
     <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
    <tr>
    <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  width="100"  class="td_viewcontent_title" style="padding-right:5px; ">��λ������</td>
       <td width="230" align="left" class="td_viewcontent_content">*</td>
       <td  width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">����� </td>
       <td width="210" align="left" class="td_viewcontent_content">*</td>
    </tr>
   <tr>
      <td align="right"  width="100"  class="td_viewcontent_title">�����</td>
      <td width="230" align="left" class="td_viewcontent_content">*</td>
      <td width="100" align="right"  class="td_viewcontent_title">�������</td>
      <td width="210" align="left" class="td_viewcontent_content">200*��*��*��</td>
    </tr>
  </table>
  </G:template>
</G:Content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">ע��ʹ�ú�������������������ѹ�����ĵ�λ��д�˱�</td>
    </tr>
  </table></form>
</body>
</html>