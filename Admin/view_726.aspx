<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
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
string choiceid,hycode;
private void Page_Load(object sender, System.EventArgs e)
{
        //G115 ��������������������ѹ�����ղ��_����
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
        hycode = GetQueryString("hycode", ""); 
        string  orgcode=GetQueryString("orgcode","0");
        StringBuilder h_viewstr=new StringBuilder();
        h_viewstr.Append("select (select top 1 fld_1202_1 from gmis_mo_1202 where fld_1202_2=fld_" + mid + "_1),fld_" + mid + "_1");
        for(int i=0;i<18;i++)
        {
            h_viewstr.Append(",fld_"+mid+"_"+(i+7));
            h_viewstr.Append(",fld_"+mid+"_"+(i+25));
            h_viewstr.Append(",fld_"+mid+"_"+(i+43));
            h_viewstr.Append(",fld_"+mid+"_"+(i+61));
            h_viewstr.Append(",(case when fld_" + mid + "_" + (i + 79) + "!=0 then cast(fld_" + mid + "_" + (i + 79) + " as char(4))+'��' else '' end)+(case when  fld_" + mid + "_" + (i + 97) + "!=0 then cast(fld_" + mid + "_" + (i + 97) + " as char(4))+'��' else '' end)");
            h_viewstr.Append(",(case when fld_" + mid + "_" + (i + 115) + "!=0 then cast(fld_" + mid + "_" + (i + 115) + " as char(4))+'��' else '' end)+(case when  fld_" + mid + "_" + (i + 115) + "!=0 then cast(fld_" + mid + "_" + (i + 115) + " as char(4))+'��' else '' end)");
            if(i<7)
            h_viewstr.Append(",''");
            else
                h_viewstr.Append(",(case when fld_" + mid + "_" + (i + 151) + "!=0 then cast(fld_" + mid + "_" + (i + 151) + " as char(4))+'��' else '' end)+(case when  fld_" + mid + "_" + (i + 151) + "!=0 then cast(fld_" + mid + "_" + (i + 151) + " as char(4))+'��' else '' end)");
        }
        h_viewstr.Append(",fld_"+mid+"_3,fld_"+mid+"_5,fld_"+mid+"_6,((case when fld_" + mid + "_175<10 then '200'+cast(fld_" + mid + "_175 as char(4)) else cast(fld_" + mid + "_175 as char(4)) end)+'�� '+(case when fld_" + mid + "_4<10 then '0'+cast(fld_" + mid + "_4 as char(1)) else cast(fld_" + mid + "_4 as char(2)) end)+' �� '+(case when fld_" + mid + "_2<10 then '0'+cast(fld_" + mid + "_2 as char(1)) else cast(fld_" + mid + "_2 as char(2)) end)+' ��') from gmis_mo_" + mid + " where 1=1 and fld_726_1='"+orgcode+"'");
        view.SqlStr = h_viewstr.ToString();
        iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
}  
</script>

<body style="width:97%;">
    <form id="form1" runat="server">
    <!--ѡ�-->
        <table width="100%">
            <tr>
                <td>
                    <iframe id="iframe_658" runat="server" frameborder="0" width="100%" height="25" scrolling="no">
                    </iframe>
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
    </div>
    <!--����������-->
    <!--����-->
    <!--��̬���ɽ���-->  
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">����������������(��ѹ��)�ղ��</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G115��</td>
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

    <G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="15%" align="right"  class="td_viewcontent_title">��λ���ƣ����£�</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td  align="center" class="new01_td_viewcontent_title">�豸���</td>
      <td  align="center" class="new01_td_viewcontent_title">��������(���ڵı�������)</td>
      <td  align="center" class="new01_td_viewcontent_title">�ͺ�</td>
      <td  align="center" class="new01_td_viewcontent_title">����(KVar)</td>
      <td  align="center" class="new01_td_viewcontent_title">����</td>
      <td  align="center" class="new01_td_viewcontent_title">�豸����ʱ��(����)</td>
      <td  align="center" class="new01_td_viewcontent_title">Ͷ��ʱ��(����)</td>
      <td  align="center" class="new01_td_viewcontent_title">����ʱ��(����)</td>
    </tr>
    <tr>
      <td width="8%" rowspan="6" align="center" class="new_td_viewcontent_content" >����</td>
      <td width="13%" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td width="13%" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td width="13%" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td width="13%" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td width="13%" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td width="13%" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td width="13%" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="6" align="center" class="new_td_viewcontent_content" >����</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="6" align="center" class="new_td_viewcontent_content" >����</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  class="td_viewcontent_title"  width="15%">��λ������</td>
       <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td align="right"  class="td_viewcontent_title"  width="15%">����� </td>
       <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right"  class="td_viewcontent_title">�����</td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">�������</td>
      <td width="210" align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>

  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">ע��ʹ�ú���������������(��ѹ��)�ĵ�λ��д�˱�</td>
    </tr>
  </table>
</G:Template>
</G:Content>
  </form>
</body>
</html>
