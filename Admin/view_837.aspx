<!--J501_2 ��ˮ������ˮ����_����-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<body>
<script language="c#" runat="server">
string hycode = "";//��ҵ
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();
    hycode = GetQueryString("hycode", "");
    string    orgcode = GetQueryString("orgcode", "0");
    string str1=",fld_840_3,''as watchdate1,'' as orgdata1";
    for(int i=7;i<132;i++)
    {
        str1+=",fld_840_"+i+"";
        if(i==17)
        {
            str1+=",''as watchdate2,'' as orgdata2";
            i=38;
        }
          if(i==49)
        {
            str1+=",''as watchdate3,'' as orgdata3";
            i=70;
        }
         if(i==81)
        {
            str1+=",''as watchdate4,'' as orgdata4";
            i=102;
        }
         if(i==113)
        {
           i=17;
        }
         if(i==35)
        {
           i=49;
        }
         if(i==67)
        {
           i=81;
        }
          if(i==99)
        {
           i=113;
        }
    }
   view.SqlStr="select (select fld_834_2 from gmis_mo_834 where fld_834_1=fld_837_1),(select fld_834_4 from gmis_mo_834 where fld_834_1=fld_837_1) "+str1+",fld_837_19,fld_837_2,fld_837_3,fld_837_4,fld_837_5,fld_837_6,fld_840_4,fld_840_5,fld_840_36,fld_840_37,fld_840_68,fld_840_69,fld_840_100,fld_840_101,fld_840_6,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_840_6) as fld_840_6_1,fld_840_38,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_840_38) as fld_840_38_1,fld_840_70,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_840_70) as fld_840_70_1,fld_840_102,(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_840_102) as fld_840_102_1,fld_837_1 from gmis_mo_837 a left outer join gmis_mo_840 b on a.fld_837_1=b.fld_840_1 where fld_837_1='"+orgcode+"'";
   DataTable dt=view.DataTable;
   if (dt.Rows.Count > 0)
   {
       dt.Rows[0]["watchdate1"] = dt.Rows[0]["fld_840_4"].ToString() + "��" + dt.Rows[0]["fld_840_5"].ToString() + "��" == "0��0��" ? "" : dt.Rows[0]["fld_840_4"].ToString() + "��" + dt.Rows[0]["fld_840_5"].ToString() + "��";
       dt.Rows[0]["watchdate2"] = dt.Rows[0]["fld_840_36"].ToString() + "��" + dt.Rows[0]["fld_840_37"].ToString() + "��" == "0��0��" ? "" : dt.Rows[0]["fld_840_36"].ToString() + "��" + dt.Rows[0]["fld_840_37"].ToString() + "��";
       dt.Rows[0]["watchdate3"] = dt.Rows[0]["fld_840_68"].ToString() + "��" + dt.Rows[0]["fld_840_69"].ToString() + "��" == "0��0��" ? "" : dt.Rows[0]["fld_840_68"].ToString() + "��" + dt.Rows[0]["fld_840_69"].ToString() + "��";
       dt.Rows[0]["watchdate4"] = dt.Rows[0]["fld_840_100"].ToString() + "��" + dt.Rows[0]["fld_840_101"].ToString() + "��" == "0��0��" ? "" : dt.Rows[0]["fld_840_100"].ToString() + "��" + dt.Rows[0]["fld_840_101"].ToString() + "��";
       dt.Rows[0]["orgdata1"] = dt.Rows[0]["fld_840_6"].ToString() + "=" + dt.Rows[0]["fld_840_6_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_840_6"].ToString() + "=" + dt.Rows[0]["fld_840_6_1"].ToString();
       dt.Rows[0]["orgdata2"] = dt.Rows[0]["fld_840_38"].ToString() + "=" + dt.Rows[0]["fld_840_38_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_840_38"].ToString() + "=" + dt.Rows[0]["fld_840_38_1"].ToString();
       dt.Rows[0]["orgdata3"] = dt.Rows[0]["fld_840_70"].ToString() + "=" + dt.Rows[0]["fld_840_70_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_840_70"].ToString() + "=" + dt.Rows[0]["fld_840_70_1"].ToString();
       dt.Rows[0]["orgdata4"] = dt.Rows[0]["fld_840_102"].ToString() + "=" + dt.Rows[0]["fld_840_102_1"].ToString() == "=" ? "" : dt.Rows[0]["fld_840_102"].ToString() + "=" + dt.Rows[0]["fld_840_102_1"].ToString();
   }
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
        <td align="right" class="font_2635B_000">��ˮ������ˮ����</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�J501-2��</td>
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
<G:content id="view" runat="server">
<G:template id="template1" runat="server">
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
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="font1225_000000">�����Ⱦ��������Ϊδ���������¼��ʱ�ڼ����ǰ�Ӹ��ţ���������������д��0.003��0.003l,��¼��-0.003</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="100" rowspan="3" align="center" class="td_viewcontent_title">1���ŷſڱ��&nbsp;</td>
      <td width="100" rowspan="3" align="center" class="td_viewcontent_title">2�����ʱ�䣨���£�</td>
      <td width="100" rowspan="3" align="center" class="td_viewcontent_title">3��������Դ</td>
      <td width="100" rowspan="3" align="center" class="td_viewcontent_title">4����ˮ�ŷ�����������/ʱ��</td>
      <td colspan="10" align="center" class="td_viewcontent_title">��Ҫ��Ⱦ��Ũ�ȣ���λ������/������Ϊ<span class="font1225B_ffffff">΢��/��</span>��</td>
    </tr>
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_title">��ѧ������</td>
      <td colspan="2" align="center" class="td_viewcontent_title">����</td>
      <td colspan="2" align="center" class="td_viewcontent_title">ʯ����</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�ܵ�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">����</td>
    </tr>
    <tr>
      <td width="100" align="center" class="td_viewcontent_title">5������</td>
      <td width="100" align="center" class="td_viewcontent_title">6���ſ�</td>
      <td width="100" align="center" class="td_viewcontent_title">7������</td>
      <td width="100" align="center" class="td_viewcontent_title">8���ſ�</td>
      <td width="100" align="center" class="td_viewcontent_title">9������</td>
      <td width="100" align="center" class="td_viewcontent_title">10���ſ�</td>
      <td width="100" align="center" class="td_viewcontent_title">11������</td>
      <td width="100" align="center" class="td_viewcontent_title">12���ſ�</td>
      <td width="100" align="center" class="td_viewcontent_title">13������</td>
      <td width="100" align="center" class="td_viewcontent_title">14���ſ�</td>
    </tr>
    <tr>
      <td rowspan="4" align="center" class="td_viewcontent_content" >FS�������֣�WS*</td>
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
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">��Ҫ��Ⱦ��Ũ�ȣ���λ������/������Ϊ<span class="font1225B_ffffff">΢��/��</span>��</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td colspan="2" align="center" class="td_viewcontent_title">����������</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�ӷ���</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�軯��</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�ܸ�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">���۸�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">Ǧ</td>
      <td colspan="2" align="center" class="td_viewcontent_title">�ӡ�</td>
      <td colspan="2" align="center" class="td_viewcontent_title">��</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title">15������</td>
      <td align="center" class="td_viewcontent_title">16���ſ�</td>
      <td align="center" class="td_viewcontent_title">17������</td>
      <td align="center" class="td_viewcontent_title">18���ſ�</td>
      <td align="center" class="td_viewcontent_title">19������</td>
      <td align="center" class="td_viewcontent_title">20���ſ�</td>
      <td align="center" class="td_viewcontent_title">21������</td>
      <td align="center" class="td_viewcontent_title">22���ſ�</td>
      <td align="center" class="td_viewcontent_title">23������</td>
      <td align="center" class="td_viewcontent_title">24���ſ�</td>
      <td align="center" class="td_viewcontent_title">25������</td>
      <td align="center" class="td_viewcontent_title">26���ſ�</td>
      <td align="center" class="td_viewcontent_title">27������</td>
      <td align="center" class="td_viewcontent_title">28���ſ�</td>
      <td align="center" class="td_viewcontent_title">29������</td>
      <td align="center" class="td_viewcontent_title">30���ſ�</td>
      <td align="center" class="td_viewcontent_title">31������</td>
      <td align="center" class="td_viewcontent_title">32���ſ�</td>
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
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
    </tr>
  </table>
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
      <td align="left" class="font1220_000000">ע������ˮ�ŷ�����������������Ⱦ��Ũ�Ȱ���ⷽ����Ӧ����Ч�������<br>
        ��
        &nbsp;�ڰ��ŷſ�����ж���ŷſڵķֱ���������и�ӡ��<br>��
        &nbsp;��������Դ��ָ��ȡ������ݵļ����ʽ����a���ղ��⡢b���ල��⡢c�����ռ�⡢d��ί�м�⡢e����ҵ�Բ⡢f�����߼�⣬�������������ڡ�</td>
    </tr>
    </table>

  
 </form>
</body>
</html>
