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
string p_cname="",p_ccode="",p_cfzr="",p_cshr="",p_ctbr="",p_ctbrq="";
private void Page_Load(object sender, System.EventArgs e)
{
	//G105_2 ��ˮ��Ⱦ�����_����
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
    hycode = GetQueryString("hycode", ""); 
	string orgcode = GetQueryString("orgcode","");

	StringBuilder h_viewstr=new StringBuilder();
	h_viewstr.Append("select ");
	for(int i=3;i<123;)
	{
		if(i!=6)
		{
			h_viewstr.Append("fld_676_"+i+",");
		}
		else if(i==7||i==20||i==36||i==49||i==65||i==78||i==94||i==107||i==13)
		{
			h_viewstr.Append("cast(fld_676_"+i+" as char(8))+'��'+cast(fld_676_"+(i+1)+" as char(2))+'��',");
			i++;
		}
		switch(i)
		{
			case 19:
				i=36;
				break; 
				
			case 48:
				i=65;
				break;
				
			case 77:
				i=94;
				break;
				
			case 106:
				i=20;
				break;
				
			case 35:
				i=49;
				break;
				
			case 64:
				i=78;
				break;
				
			case 93:
				i=107;
				break;
				
			default:
				i++;
				break;
		}
	}
	h_viewstr.Append(" '' as kong from gmis_mo_676 where fld_676_1='"+orgcode+"'");
	db.SqlString = h_viewstr.ToString();
	DataTable h_dt = db.GetDataTable();
	if(h_dt.Rows.Count>0)
	{
		view.DataTable=h_dt;
	}
	else
	{
		view_673.InnerHtml=view_673_alert.InnerHtml;
	}
	
	
	db.SqlString="select (select top 1 fld_1202_1 from gmis_mo_1202 where fld_1202_2=fld_" + mid + "_1) as c_name,fld_" + mid + "_1,fld_"+mid+"_18,fld_"+mid+"_2,fld_"+mid+"_3,((case when fld_" + mid + "_4<10 then '200'+cast(fld_" + mid + "_4 as char(4)) else cast(fld_" + mid + "_4 as char(4)) end)+'�� '+(case when fld_" + mid + "_5<10 then '0'+cast(fld_" + mid + "_5 as char(1)) else cast(fld_" + mid + "_5 as char(2)) end)+' �� '+(case when fld_" + mid + "_6<10 then '0'+cast(fld_" + mid + "_6 as char(1)) else cast(fld_" + mid + "_6 as char(2)) end)+' ��') as ctbrq from gmis_mo_" + mid + " where fld_"+mid+"_1='"+orgcode+"'";     
	h_dt = db.GetDataTable();
	if ( h_dt.Rows.Count > 0)
	{
		p_cname=h_dt.Rows[0]["c_name"].ToString();
		p_ccode=h_dt.Rows[0]["fld_"+mid+"_1"].ToString();
		p_cfzr=h_dt.Rows[0]["fld_"+mid+"_18"].ToString();
		p_cshr=h_dt.Rows[0]["fld_"+mid+"_2"].ToString();
		p_ctbr=h_dt.Rows[0]["fld_"+mid+"_3"].ToString();
		p_ctbrq=h_dt.Rows[0]["ctbrq"].ToString();
	}
         
       
	iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
    
}  

</script>

<body style="width:97%;" >
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
        <td align="right" class="font_2635B_000">��ˮ��Ⱦ�����</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007��</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">�����ţ�G105-2��</td>
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
<div id="view_673" runat="server">
    <G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td width="216" align="right"  class="td01_viewcontent_title">������ʩ��ţ�</td>
      <td width="195" align="left"  class="td_viewcontent_content">SZ--* </td>
      <td width="200" align="right"  class="td01_viewcontent_title">��Ӧ���ŷſڱ�ţ�</td>
      <td width="195" align="left"  class="td_viewcontent_content">FS--*</td>
      <td width="200" align="right"  class="td01_viewcontent_title">��ˮȥ������</td>
      <td width="195" class="td_viewcontent_content">*</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="7%" rowspan="3"  align="center" class="new01_td_viewcontent_title">������Դ</td>
      <td width="10%" rowspan="3"  align="center" class="new01_td_viewcontent_title">1�����ʱ�䣨���£�</td>
      <td width="7%" rowspan="3"  align="center" class="new01_td_viewcontent_title">2����ˮ������������/ʱ��</td>
      <td colspan="10"  align="center" class="new01_td_viewcontent_title">��Ⱦ��Ũ�ȣ�����/�ˣ�</td>
    </tr>
    <tr>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">��ѧ������</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">����</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">ʯ����</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">�ӷ���</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">����������</td>
    </tr>
    <tr>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">3������</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">4���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">5������</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">6���ſ�</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">7������</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">8���ſ�</td>
      <td width="8%"  align="center" class="new01_td_viewcontent_title">9������</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">10���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">11������</td>
      <td width="8%"  align="center" class="new01_td_viewcontent_title">12���ſ�</td>
    </tr>
    <tr>
      <td rowspan="4" align="center" class="new_td_viewcontent_content" >A=���ղ���</td>
      <td align="center" class="new_td_viewcontent_content" >*��*��</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*��*��</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*��*��</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*��*��</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="new_td_viewcontent_title">��Ⱦ��Ũ�ȣ�����Ϊ΢��/���⣬�����Ϊ����/����</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%" rowspan="2"  align="center" class="new01_td_viewcontent_title">1�����ʱ�䣨���£�</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">�軯��</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">��</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">����</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">������</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">Ǧ</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">��</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">��</td>
    </tr>
    <tr>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">13������</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">14���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">15������</td>
      <td width="5%"  align="center" class="new01_td_viewcontent_title">16���ſ�</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">17������</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">18���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">19������</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">20���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">20������</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">22���ſ�</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">23������</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">24���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">25������</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">26���ſ�</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*��*��</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*��*��</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*��*��</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*��*��</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
  </table>
        </G:Template>
    </G:Content>
    </div>
    <div id="view_673_alert" runat="server" style="display:none;">
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td width="216" align="right"  class="td01_viewcontent_title">������ʩ��ţ�</td>
      <td width="195" align="left"  class="td_viewcontent_content">&nbsp;</td>
      <td width="200" align="right"  class="td01_viewcontent_title">��Ӧ���ŷſڱ�ţ�</td>
      <td width="195" align="left"  class="td_viewcontent_content">&nbsp;</td>
      <td width="200" align="right"  class="td01_viewcontent_title">��ˮȥ������</td>
      <td width="195" class="td_viewcontent_content">&nbsp;</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="7%" rowspan="3"  align="center" class="new01_td_viewcontent_title">������Դ</td>
      <td width="10%" rowspan="3"  align="center" class="new01_td_viewcontent_title">1�����ʱ�䣨���£�</td>
      <td width="7%" rowspan="3"  align="center" class="new01_td_viewcontent_title">2����ˮ������������/ʱ��</td>
      <td colspan="10"  align="center" class="new01_td_viewcontent_title">��Ⱦ��Ũ�ȣ�����/�ˣ�</td>
    </tr>
    <tr>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">��ѧ������</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">����</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">ʯ����</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">�ӷ���</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">����������</td>
    </tr>
    <tr>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">3������</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">4���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">5������</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">6���ſ�</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">7������</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">8���ſ�</td>
      <td width="8%"  align="center" class="new01_td_viewcontent_title">9������</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">10���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">11������</td>
      <td width="8%"  align="center" class="new01_td_viewcontent_title">12���ſ�</td>
    </tr>
    <tr>
      <td rowspan="4" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="new_td_viewcontent_title">��Ⱦ��Ũ�ȣ�����Ϊ΢��/���⣬�����Ϊ����/����</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%" rowspan="2"  align="center" class="new01_td_viewcontent_title">1�����ʱ�䣨���£�</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">�軯��</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">��</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">����</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">������</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">Ǧ</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">��</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">��</td>
    </tr>
    <tr>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">13������</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">14���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">15������</td>
      <td width="5%"  align="center" class="new01_td_viewcontent_title">16���ſ�</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">17������</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">18���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">19������</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">20���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">20������</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">22���ſ�</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">23������</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">24���ſ�</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">25������</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">26���ſ�</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
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
      <td align="left" class="font1220_000000">ע�������񲻹���д,�����и�ӡ����������Դ��ָ��ȡ������ݵļ����ʽ����a���ղ��⡢b���ල��⡢c�����ռ�⡢d��ί�м�⡢e����ҵ�Բ⡢f�����߼�⣬�������������ڡ�<br>
&nbsp;&nbsp;&nbsp;&nbsp;�۷�ˮ����������������Ⱦ���ⷽ����Ӧ��Ч�������<br>
&nbsp;&nbsp;&nbsp;&nbsp;ָ���ϵ������Ũ�ȡ��ſ�Ũ��</td>
    </tr>
  </table>
</form>
</body>
</html>
