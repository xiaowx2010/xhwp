<!--J503_3 Σ�շ��ﴦ�ó����շ�������_����-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<body>
<script language="C#" runat="server">
string hycode = "";//��ҵ
private void Page_Load(object sender,System.EventArgs e)
{
     SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
     hycode = GetQueryString("hycode", "");
     string str1="",orgcode="";
     orgcode = GetQueryString("orgcode", "0");
     for(int i=7;i<32;i++)
     {
     str1+=",fld_876_"+i+"";
     if(i==17)
     {
     str1+=",''as watchdate2,''as orgdata2";
      i=20;
      }
     }
     list.SqlStr="select fld_876_3,''as watchdate1,''as orgdata1 "+str1+",fld_876_4, fld_876_5,fld_876_18,fld_876_19,fld_876_6,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_876_6) as fld_876_6_1,fld_876_20,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_876_20) as fld_876_20_1,fld_873_1 from gmis_mo_876 b left outer join gmis_mo_873 a on a.fld_873_1=b.fld_876_1 where fld_873_1='"+orgcode+"'";
    DataTable dt=list.DataTable;
    if(dt.Rows.Count>0)
        {            
            dt.Rows[0]["watchdate1"]=dt.Rows[0]["fld_876_4"].ToString()+"��"+dt.Rows[0]["fld_876_5"].ToString()+"��"=="0��0��"?"":dt.Rows[0]["fld_876_4"].ToString()+"��"+dt.Rows[0]["fld_876_5"].ToString()+"��";
            dt.Rows[0]["watchdate2"]=dt.Rows[0]["fld_876_18"].ToString()+"��"+dt.Rows[0]["fld_876_19"].ToString()+"��"=="0��0��"?"":dt.Rows[0]["fld_876_18"].ToString()+"��"+dt.Rows[0]["fld_876_19"].ToString()+"��";
           dt.Rows[0]["orgdata1"] = dt.Rows[0]["fld_876_6"].ToString() + "=" + dt.Rows[0]["fld_876_6_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_876_6"].ToString() + "=" + dt.Rows[0]["fld_876_6_1"].ToString();
           dt.Rows[0]["orgdata2"] = dt.Rows[0]["fld_876_20"].ToString() + "=" + dt.Rows[0]["fld_876_20_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_876_20"].ToString() + "=" + dt.Rows[0]["fld_876_20_1"].ToString();
        }
    list.Rows=list.DataTable.Rows.Count;
    view1.SqlStr="select (select fld_866_2 from gmis_mo_866 where fld_866_1=fld_873_1),(select fld_866_4 from gmis_mo_866 where fld_866_1=fld_873_1) from gmis_mo_873 where fld_873_1='"+orgcode+"'";
    view2.SqlStr = "select fld_873_18 ,fld_873_2,fld_873_3,fld_873_4,fld_873_5,fld_873_6,fld_873_1 from gmis_mo_873 where  fld_873_1='" + orgcode + "'";
    iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
}

</script>
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
  
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">Σ�շ��ﴦ�ó����շ�������</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�J503-3��</td>
      </tr>
      <tr>
        <td class="font1220_000000">�Ʊ���أ�����Ժ��һ��ȫ����Ⱦ��<br>
          �������������쵼С��칫��</td>
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
</G:template>
</G:content>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="font1225_000000">�����Ⱦ��������Ϊδ���������¼��ʱ�ڼ����ǰ�Ӹ��ţ���������������д��0.003��0.003l,��¼��-0.003</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="100" rowspan="4" align="center" class="td_viewcontent_title">1�����շ���������ʩ��š�</td>
      <td width="100" rowspan="4" align="center" class="td_viewcontent_title">2�����ʱ�䣨���£�</td>
      <td width="100" rowspan="4" align="center" class="td_viewcontent_title">3��������Դ</td>
      <td colspan="2" rowspan="2" align="center" class="td_viewcontent_title">����������������/ʱ��</td>
      <td colspan="9" align="center" class="td_viewcontent_title">��Ҫ��Ⱦ��Ũ�ȣ�����/�����ף�</td>
    </tr>
    <tr>
      <td colspan="3" align="center" class="td_viewcontent_title" >�̳�</td>
      <td colspan="3" align="center" class="td_viewcontent_title" >��������</td>
      <td colspan="3" align="center" class="td_viewcontent_title" >��������</td>
    </tr>
    <tr>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title" >4��������ʩǰ</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title" >5����ʩ�����</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title" >6������</td>
      <td colspan="2" align="center" class="td_viewcontent_title" >�ſ�</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title" >9������</td>
      <td colspan="2" align="center" class="td_viewcontent_title" >�ſ�</td>
      <td width="100" rowspan="2" align="center" class="td_viewcontent_title" >12������</td>
      <td colspan="2" align="center" class="td_viewcontent_title" >�ſ�</td>
    </tr>
    <tr>
      <td width="100" align="center" class="td_viewcontent_title" >7��ʵ��</td>
      <td width="100" align="center" class="td_viewcontent_title" >8������</td>
      <td width="100" align="center" class="td_viewcontent_title" ><p>10��ʵ��</p>
      </td>
      <td width="100" align="center" class="td_viewcontent_title" >11������</td>
      <td width="100" align="center" class="td_viewcontent_title" >13��ʵ��</td>
      <td width="100" align="center" class="td_viewcontent_title" >14������</td>
    </tr>
<G:listbox id="list" runat="server">
<G:template id="template1" runat="server">
    <tr>
      <td rowspan="2" align="center" class="td_viewcontent_content" >QZ--*</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
    </G:template>
    </G:listbox>
</table>
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
      <td width="210" align="left" class="td_viewcontent_content">200*��*��*��</td>
    </tr>

  </table>
  </G:template>
  </G:content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">ע���ٷ�������������������Ⱦ��Ũ�Ȱ���ⷽ����Ӧ����Ч�������<br>
        ��
        &nbsp;�����񲻹���д�������и�ӡ��<br>��
        &nbsp;��������Դ��ָ��ȡ������ݵļ����ʽ����a���ղ��⡢b���ල��⡢c�����ռ�⡢d��ί�м�⡢e����ҵ�Բ⡢f�����߼�⣬�������������ڡ�</td>
    </tr>
    </table>

 </form> 
 
</body>
</html>
