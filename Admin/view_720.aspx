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
string hycode;
string p_cname="",p_ccode="",p_cfzr="",p_cshr="",p_ctbr="",p_ctbrq="";
private void Page_Load(object sender, System.EventArgs e)
{
//G113 ������������ȾԴ�ղ��_����
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
        hycode = GetQueryString("hycode", ""); 
        string orgcode=GetQueryString("orgcode","0");
        StringBuilder h_viewstr=new StringBuilder();
        h_viewstr.Append("select top 1");
             h_viewstr.Append(" fld_723_5,fld_723_3,fld_723_9,fld_723_1718,fld_723_49,fld_723_65,fld_723_77,fld_723_89,fld_723_101,fld_723_109,fld_723_4,fld_723_1920,fld_723_57,fld_723_69,fld_723_81,fld_723_93,fld_723_102,fld_723_110");
        for(int i=0;i<3;i++)
        {
            h_viewstr.Append(",((case when fld_723_"+(i*4+21)+"<10 then '200'+cast(fld_723_"+(i*4+21)+" as char(4)) else cast(fld_723_"+(i*4+21)+" as char(4)) end)+'�� '+(case when fld_723_"+(i*4+22)+"<10 then '0'+cast(fld_723_"+(i*4+22)+" as char(1)) else cast(fld_723_"+(i*4+22)+" as char(2)) end)+' �� ')");
            h_viewstr.Append(",fld_723_"+(i+10));
            h_viewstr.Append(",((case when fld_723_"+(i*4+21)+"<10 then '200'+cast(fld_723_"+(i*4+21)+" as char(4)) else cast(fld_723_"+(i*4+21)+" as char(4)) end)+'�� '+(case when fld_723_"+(i*4+22)+"<10 then '0'+cast(fld_723_"+(i*4+22)+" as char(1)) else cast(fld_723_"+(i*4+22)+" as char(2)) end)+' �� ')");
            h_viewstr.Append(",fld_723_"+(i*2+58));
            h_viewstr.Append(",fld_723_"+(i*2+70));
            h_viewstr.Append(",fld_723_"+(i*2+82));
            h_viewstr.Append(",fld_723_"+(i*2+94));
            h_viewstr.Append(",fld_723_"+(i*2+103));
            h_viewstr.Append(",fld_723_"+(i*2+111));
            h_viewstr.Append(",((case when fld_723_"+(i*4+23)+"<10 then '200'+cast(fld_723_"+(i*4+23)+" as char(4)) else cast(fld_723_"+(i*4+23)+" as char(4)) end)+'�� '+(case when fld_723_"+(i*4+24)+"<10 then '0'+cast(fld_723_"+(i*4+24)+" as char(1)) else cast(fld_723_"+(i*4+24)+" as char(2)) end)+' �� ')");
            h_viewstr.Append(",fld_723_"+(i*2+59));
            h_viewstr.Append(",fld_723_"+(i*2+71));
            h_viewstr.Append(",fld_723_"+(i*2+83));
            h_viewstr.Append(",fld_723_"+(i*2+95));
            h_viewstr.Append(",fld_723_"+(i*2+104));
            h_viewstr.Append(",fld_723_"+(i*2+112));
        }
        h_viewstr.Append(",fld_723_8,fld_723_6,fld_723_13,fld_723_3334,fld_723_64,fld_723_76,fld_723_88,fld_723_100,'','',fld_723_7,fld_723_3536,fld_723_50,fld_723_66,fld_723_78,fld_723_90,'',''");
        h_viewstr.Append(",fld_723_14,fld_723_3738,fld_723_51,fld_723_67,fld_723_79,fld_723_91,'','',fld_723_3940,fld_723_52,fld_723_68,fld_723_80,fld_723_92,'',''");
        for(int i=0;i<2;i++)
        {
            h_viewstr.Append(",fld_723_"+(i+15));
            h_viewstr.Append(",((case when fld_723_"+(i*4+41)+"<10 then '200'+cast(fld_723_"+(i*4+41)+" as char(4)) else cast(fld_723_"+(i*4+41)+" as char(4)) end)+'�� '+(case when fld_723_"+(i*4+42)+"<10 then '0'+cast(fld_723_"+(i*4+42)+" as char(1)) else cast(fld_723_"+(i*4+42)+" as char(2)) end)+' �� ')");
            h_viewstr.Append(",fld_723_"+(i*2+53));
            h_viewstr.Append(",'-'");
            h_viewstr.Append(",'-'");
            h_viewstr.Append(",'-'");
            h_viewstr.Append(",'-'");
            h_viewstr.Append(",-'");
            h_viewstr.Append(",((case when fld_723_"+(i*4+43)+"<10 then '200'+cast(fld_723_"+(i*4+43)+" as char(4)) else cast(fld_723_"+(i*4+43)+" as char(4)) end)+'�� '+(case when fld_723_"+(i*4+44)+"<10 then '0'+cast(fld_723_"+(i*4+44)+" as char(1)) else cast(fld_723_"+(i*4+44)+" as char(2)) end)+' �� ')");
            h_viewstr.Append(",fld_723_"+(i*2+54));
            h_viewstr.Append(",'-'");
            h_viewstr.Append(",'-'");
            h_viewstr.Append(",'-'");
            h_viewstr.Append(",'-'");
            h_viewstr.Append(",'-'");
        }
        h_viewstr.Append(" from gmis_mo_723 a left join gmis_mo_" + mid + " b on fld_720_1=fld_723_1 where fld_7720_1='"+orgcode+"'");
        db.SqlString = h_viewstr.ToString();
        DataTable h_dt = db.GetDataTable();
        if(h_dt.Rows.Count>0)
        {
            view.DataTable=h_dt;
        }
        else
        {
            view_720.InnerHtml=view_720_alert.InnerHtml;
        } 
        db.SqlString="select (select top 1 fld_1202_1 from gmis_mo_1202 where fld_1202_2=fld_" + mid + "_1) as c_name,fld_" + mid + "_1,fld_"+mid+"_3,fld_"+mid+"_5,fld_"+mid+"_6,((case when fld_" + mid + "_7<10 then '200'+cast(fld_" + mid + "_7 as char(4)) else cast(fld_" + mid + "_7 as char(4)) end)+'�� '+(case when fld_" + mid + "_4<10 then '0'+cast(fld_" + mid + "_4 as char(1)) else cast(fld_" + mid + "_4 as char(2)) end)+' �� '+(case when fld_" + mid + "_2<10 then '0'+cast(fld_" + mid + "_2 as char(1)) else cast(fld_" + mid + "_2 as char(2)) end)+' ��') as ctbrq from gmis_mo_" + mid + " where 1=1 "+filter+"";
        h_dt = db.GetDataTable();
        if ( h_dt.Rows.Count > 0)
        {
            p_cname=h_dt.Rows[0]["c_name"].ToString();
            p_ccode=h_dt.Rows[0]["fld_"+mid+"_1"].ToString();
            p_cfzr=h_dt.Rows[0]["fld_"+mid+"_3"].ToString();
            p_cshr=h_dt.Rows[0]["fld_"+mid+"_5"].ToString();
            p_ctbr=h_dt.Rows[0]["fld_"+mid+"_6"].ToString();
            p_ctbrq=h_dt.Rows[0]["ctbrq"].ToString();
        }      
        iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode);
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
        <td align="right" class="font_2635B_000">������������ȾԴ����</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G113��</td>
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
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="25%" align="right"  class="td_viewcontent_title">��λ���ƣ����£�</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content"><%=p_cname%>&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��λ����</td>
      <td colspan="3" align="left" class="td_viewcontent_content"><%=p_ccode  %>&nbsp;</td>
    </tr>
</table>

<div id="view_720" runat="server">
    <G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td colspan="4" rowspan="2"  align="center" class="new01_td_viewcontent_title">1��������</td>
      <td colspan="2" rowspan="2"  align="center" class="new01_td_viewcontent_title">2�������������������ʹ������</td>
      <td width="10%" rowspan="2"  align="center" class="new01_td_viewcontent_title">3�����ʱ�䣨���£�</td>
      <td width="8%" rowspan="2"  align="center" class="new01_td_viewcontent_title">4������������ռ����ʣ�nGY/h��</td>
      <td colspan="6"  align="center" class="new01_td_viewcontent_title">�����Ի��Ũ��</td>
    </tr>
    <tr>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">5��������λ</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">6������</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">7����-232</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">8\��-226</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">9���ܦ�</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">10���ܦ�</td>
    </tr>
    <tr>
      <td width="3%" rowspan="8" align="center" class="new_td_viewcontent_content" >������ҵ</td>
      <td width="6%" rowspan="2" align="center" class="new_td_viewcontent_content" >���Ʒ</td>
      <td width="3%" align="center" class="new_td_viewcontent_content" >����</td>
      <td width="12%" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td width="11%" rowspan="2" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td width="4%" rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >����</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >�������</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >��ҵ��ˮ</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >��ҵ����</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >������</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/������</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/������</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="8" align="center" class="new_td_viewcontent_content" >�����Դұ���ͼӹ���ҵ</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >ԭ�ϣ�ԭ�󡢾���</td>
      <td align="center" class="new_td_viewcontent_content" >����</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >����</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >�������</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >��ҵ��ˮ</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/��</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >��ҵ����</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >������</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/������</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/������</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
    </tr>
</table>
  </G:Template>
  </G:Content>
    </div>
    <div id="view_720_alert" runat="server" style="display:none;">
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td colspan="4" rowspan="2"  align="center" class="new01_td_viewcontent_title">1��������</td>
      <td colspan="2" rowspan="2"  align="center" class="new01_td_viewcontent_title">2�������������������ʹ������</td>
      <td width="10%" rowspan="2"  align="center" class="new01_td_viewcontent_title">3�����ʱ�䣨���£�</td>
      <td width="8%" rowspan="2"  align="center" class="new01_td_viewcontent_title">4������������ռ����ʣ�nGY/h��</td>
      <td colspan="6"  align="center" class="new01_td_viewcontent_title">�����Ի��Ũ��</td>
    </tr>
    <tr>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">5��������λ</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">6������</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">7����-232</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">8\��-226</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">9���ܦ�</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">10���ܦ�</td>
    </tr>
    <tr>
      <td width="3%" rowspan="8" align="center" class="new_td_viewcontent_content" >������ҵ</td>
      <td width="6%" rowspan="2" align="center" class="new_td_viewcontent_content" >���Ʒ</td>
      <td width="3%" align="center" class="new_td_viewcontent_content" >����</td>
      <td width="12%" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td width="11%" rowspan="2" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td width="4%" rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >����</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >�������</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >��ҵ��ˮ</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >��ҵ����</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >������</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/������</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/������</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="8" align="center" class="new_td_viewcontent_content" >�����Դұ���ͼӹ���ҵ</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >ԭ�ϣ�ԭ�󡢾���</td>
      <td align="center" class="new_td_viewcontent_content" >����</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >����</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >�������</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/ǧ��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >��ҵ��ˮ</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/��</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" rowspan="2" align="center" class="new_td_viewcontent_content" >��ҵ����</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >������</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/������</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >����/������</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
</table>
    </div>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  class="td_viewcontent_title"  width="15%">��λ������</td>
       <td width="230" align="left" class="td_viewcontent_content"><%=p_cfzr %>&nbsp;</td>
       <td align="right"  class="td_viewcontent_title"  width="15%">����� </td>
       <td width="210" align="left" class="td_viewcontent_content"><%=p_cshr %>&nbsp;</td>
    </tr>
   <tr>
      <td align="right"  class="td_viewcontent_title">�����</td>
      <td width="230" align="left" class="td_viewcontent_content"><%=p_ctbr %>&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">�������</td>
      <td width="210" align="left" class="td_viewcontent_content"><%=p_ctbrq %>&nbsp;</td>
    </tr>

  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">ע���پ����������Ϊ���������ԵĲɿ���ҵ�������Դұ���ͼӹ���ҵ��д�˱������˵��񲻹���д�������и�ӡ���۶��ڲ�ѡ��ҵ�����ƷӦ��д�����������ڿ����Դұ���ͼӹ���ҵ��ԭ��Ӧ��дʵ��ʹ��������������ҵ��ˮ����ҵ����Ӧ��дʵ�ʲ������ܷ����Ի��Ũ�Ȱ���ⷽ����Ӧ����Ч�����.<br>
&nbsp;&nbsp;&nbsp;&nbsp;ָ���ϵ��6��7��9��10��12��13��15��16��</td>
    </tr>
  </table>
  </form>
</body>
</html>
