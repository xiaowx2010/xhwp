<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
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
    StringBuilder sb = new StringBuilder();
    sb.Append("select top 1 fld_1146_1,fld_1202_2,fld_1146_5,fld_1202_6,fld_1202_7,fld_1202_8,fld_1202_9,fld_1202_10,fld_1202_11,fld_1202_1,''as companytag,fld_1202_15,fld_1202_16,fld_1202_3,(select fld_1157_2 from gmis_mo_1157 where fld_1157_1=fld_1146_21),fld_1202_12,fld_1146_17,fld_1202_13,fld_1146_18,(select fld_1200_1 from gmis_mo_1200 where gmis_mo_1200.mocode=fld_1146_22),fld_1202_14,fld_1202_5,(select fld_1162_2 from gmis_mo_1162 where fld_1162_1=fld_1202_19),fld_1202_18,(select fld_619_2 from gmis_mo_619 where fld_619_1=fld_1146_25),fld_1146_26,fld_1146_27,fld_1146_28,fld_1146_29,fld_1146_38,fld_1146_46,fld_1146_30,fld_1146_39,fld_1146_48,fld_1146_31,fld_1146_40,fld_1146_50,fld_1146_32,fld_1146_41,fld_1146_52,fld_1146_33,fld_1146_42,fld_1146_53,fld_1146_34,fld_1146_43,fld_1146_54,fld_1146_35,fld_1146_44,fld_1146_36,fld_1146_45,fld_1146_55,fld_1146_56,fld_1146_57,fld_1146_37,fld_1146_77,fld_1146_58,fld_1146_59,fld_1146_60,fld_1146_78,fld_1146_61,fld_1146_62,fld_1146_63,fld_1147_13,fld_1147_29,fld_1146_64,fld_1146_65,fld_1146_66,fld_1146_67,fld_1146_68,fld_1146_69,fld_1147_14,fld_1147_30,fld_1146_70,fld_1146_71,fld_1146_72,fld_1147_15,fld_1147_31,fld_1146_73,fld_1147_16,fld_1147_32,fld_1146_74,fld_1147_17,fld_1147_33,fld_1146_75,fld_1147_18,fld_1147_34,fld_1146_76,fld_1147_19,fld_1147_35,fld_1147_36");
    sb.Append(",fld_1147_4,fld_1147_20,fld_1147_37,fld_1147_5,fld_1147_21,fld_1147_38,fld_1147_6,fld_1147_22,fld_1147_39,fld_1147_7,fld_1147_23,fld_1147_40,fld_1147_8,fld_1147_24,fld_1147_41,fld_1147_9,fld_1147_25,fld_1147_42,fld_1147_10,fld_1147_26,fld_1147_43,fld_1147_11,fld_1147_27,fld_1147_44,fld_1147_12,fld_1147_28,fld_1147_45");
    sb.Append(",fld_1147_46,fld_1147_60,fld_1147_75,fld_1147_47,fld_1147_61,fld_1147_76,fld_1147_48,fld_1147_62,fld_1147_77,fld_1147_49,fld_1147_63,fld_1147_78,fld_1147_50,fld_1147_64,fld_1147_79,fld_1147_51,fld_1147_65,fld_1147_80,fld_1147_52,fld_1147_66,fld_1147_81,fld_1147_53,fld_1147_67,fld_1147_82,fld_1147_54,fld_1147_68,fld_1147_83,fld_1147_55,fld_1147_69,fld_1147_84,fld_1147_56,fld_1147_70,fld_1147_71,fld_1148_4,fld_1148_7,fld_1148_10,fld_1147_57,fld_1147_72,fld_1148_5,fld_1148_8,fld_1148_11,fld_1148_6,fld_1148_9,fld_1148_12,fld_1147_58,fld_1147_73,fld_1148_13,fld_1148_17,fld_1148_21,fld_1148_14,fld_1148_18,fld_1148_22,fld_1147_59,fld_1147_74,fld_1148_15,fld_1148_19,fld_1148_23,fld_1148_16,fld_1148_20,fld_1148_24");
    sb.Append(" from gmis_mo_1146 a left outer join gmis_mo_1147 b on a.mocode=b.mocode left outer join gmis_mo_1148 c on a.mocode=c.mocode left outer join gmis_mo_1202 on fld_1202_2=fld_1146_2 where a.mocode="+id);
    //Response.Write(sb.ToString());
    view.SqlStr = sb.ToString();
        db.SqlString="select fld_1146_3 from gmis_mo_1146 where mocode="+id;
        DataTable dt=db.GetDataTable();
        string str1146="";
        str1146=dt.Rows[0]["fld_1146_3"].ToString().Replace(';',',');
        db.SqlString="select fld_1161_2 from gmis_mo_1161 where fld_1161_1 in ("+str1146+")";
        DataTable dtt=db.GetDataTable();
        string strname="";
        foreach(DataRow drr in dtt.Rows)
        {
            strname+=drr["fld_1161_2"].ToString()+',';
        }
        view.DataTable.Rows[0]["companytag"]=strname.Trim(',');
}
</script>
<script language="javascript">
function Go_Hidden(str)
{
if(str=="1") 
{
document.getElementById("table1").style.display="none";
document.getElementById("td1").innerHTML="<img src=\"images/node_opened.gif\" onclick=\"Go_Show('1')\" onmouseover=\"this.style.cursor='hand';\"  width=\"17\" height=\"17\" >";
}
if(str=="2") 
{
document.getElementById("table2").style.display="none";
document.getElementById("td2").innerHTML="<img src=\"images/node_opened.gif\" onclick=\"Go_Show('2')\" onmouseover=\"this.style.cursor='hand';\"   width=\"17\" height=\"17\" >";
}
if(str=="3") 
{
document.getElementById("table3").style.display="none";
document.getElementById("td3").innerHTML="<img src=\"images/node_opened.gif\" onclick=\"Go_Show('3')\"  onmouseover=\"this.style.cursor='hand';\" width=\"17\" height=\"17\" >";
}
}
function Go_Show(str)
{
if(str=="1") 
{
document.getElementById("table1").style.display="block";
document.getElementById("td1").innerHTML="<img src=\"images/node_closed.gif\" onclick=\"Go_Hidden('1')\" onmouseover=\"this.style.cursor='hand';\"   width=\"17\" height=\"17\" >";
}
if(str=="2") 
{
document.getElementById("table2").style.display="block";
document.getElementById("td2").innerHTML="<img src=\"images/node_closed.gif\" onclick=\"Go_Hidden('2')\" onmouseover=\"this.style.cursor='hand';\" width=\"17\" height=\"17\" >";
}
if(str=="3") 
{
document.getElementById("table3").style.display="block";
document.getElementById("td3").innerHTML="<img src=\"images/node_closed.gif\" onclick=\"Go_Hidden('3')\" onmouseover=\"this.style.cursor='hand';\" width=\"17\" height=\"17\" >";
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%"  ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" class="font_2635B_000">��ҵ��ҵ��Ⱦ�ŷż������������</td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<G:Content ID="view" runat="server">
<G:Template id="templateview" runat="server">
 <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td rowspan="2" align="right" style="width:14%" class="td_viewcontent_title">ͳ�����</td>
      <td rowspan="2" align="left"  style="width:10%" class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="right"  style="width:10%" class="td_viewcontent_title">1����ҵ���˴���</td>
      <td rowspan="2" align="left"  style="width:10%" class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="right" style="width:12%"  class="td_viewcontent_title">3��������</td>
      <td rowspan="2" align="left"   style="width:10%" class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="right"  style="width:10%" style="width:15%"  class="td_viewcontent_title">4����ҵ����λ��</td>
      <td class="td_viewcontent_content"  style="width:15%" >���ľ���
      *��      *��      *��
      </td>
    </tr>
    <tr>
      <td class="td_viewcontent_content">����γ��
        *��        *��        *��</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">2����ҵ��ϸ����</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">�ص���ȾԴ��ʶ</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="4" align="right"  class="td_viewcontent_title">5�����˼���ϵ��</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">��&nbsp;&nbsp;&nbsp;&nbsp;����
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;</td>
      <td rowspan="3" align="right"  class="td_viewcontent_title">6����ҵ��ϸ��ַ����������</td>
      <td rowspan="3" align="left"  class="td_viewcontent_content">
*&nbsp;</td>
      <td rowspan="2" align="right"  class="td_viewcontent_title">7���Ǽ�ע������</td>
   <td rowspan="2" class="td_viewcontent_content">*&nbsp;</td>
  </tr>
    <tr>
      <td colspan="3" align="left"  class="td_viewcontent_content">��&nbsp;&nbsp;&nbsp;&nbsp;����
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" align="left"  class="td_viewcontent_content">��&nbsp;&nbsp;&nbsp;&nbsp;�棺
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">8����ҵ���</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" align="left"  class="td_viewcontent_content">�������룺   *&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">�����������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">9����ҵ��ģ</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">10����ҵʱ��</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td width="110" align="right"  class="td_viewcontent_title">11����ˮȥ������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">12������ˮ�����</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">����ˮ������</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">13��������ˮ��������</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">������ˮ��������</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content">��1-1��</td>
      <td width="21" class="td_viewcontent_content" id="td1" style="padding-right:5px"><img src="images/node_closed.gif" id="img1" onclick="Go_Hidden('1')" onmouseover="this.style.cursor='hand';" id="img1"  width="17" height="17" ></td>
    </tr>
  </table>
  <div id="table1" style="display:block" >
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
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_title">��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title">һ����ҵ�������</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">9</td>
      <td align="center"  class="td_viewcontent_title">���У�ȼ��ú������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">19</td>
      <td align="left"  class="td_viewcontent_title">13����ҵ��¯��</td>
      <td align="center"  class="td_viewcontent_content">̨/����</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">1</td>
      <td align="center"  class="td_viewcontent_title">1����ҵ�ܲ�ֵ���ּۣ�</td>
      <td align="center"  class="td_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">10</td>
      <td align="center"  class="td_viewcontent_title">����ԭ��ú������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">20</td>
      <td align="left"  class="td_viewcontent_title">���У��̳��ŷŴ���</td>
      <td align="center"  class="td_viewcontent_content">̨/����</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">2</td>
      <td align="center"  class="td_viewcontent_title">2�������ϡ��ۺ����ò�Ʒ��ֵ</td>
      <td align="center"  class="td_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">11</td>
      <td align="center"  class="td_viewcontent_title">7��ȼ��úƽ�����</td>
      <td align="center"  class="td_viewcontent_content">%</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">21</td>
      <td align="left"  class="td_viewcontent_title">���������ŷŴ���</td>
      <td align="center"  class="td_viewcontent_content">̨/����</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">3</td>
      <td align="center"  class="td_viewcontent_title">3����ҵרְ������Ա��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">12</td>
      <td align="center"  class="td_viewcontent_title">8��ȼ���������������������ã�</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">22</td>
      <td align="center"  class="td_viewcontent_title">14����ҵ¯Ҥ��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">4</td>
      <td align="center"  class="td_viewcontent_title">4������������ʱ��</td>
      <td align="center"  class="td_viewcontent_content">Сʱ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">13</td>
      <td align="center"  class="td_viewcontent_title">���У�����</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">23</td>
      <td align="center"  class="td_viewcontent_title">���У��̳��ŷŴ��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">5</td>
      <td align="center"  class="td_viewcontent_title">5����ҵ��ˮ��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">14</td>
      <td align="center"  class="td_viewcontent_title">��������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">24</td>
      <td align="center"  class="td_viewcontent_title">���У����������ŷŴ��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">6</td>
      <td align="center"  class="td_viewcontent_title">�����У�����ˮ��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">15</td>
      <td align="center"  class="td_viewcontent_title">9������ƽ�����</td>
      <td align="center"  class="td_viewcontent_content">%</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title">15����Ҫ��Ʒ���</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">7</td>
      <td align="center"  class="td_viewcontent_title">�ظ���ˮ��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">16</td>
      <td align="center"  class="td_viewcontent_title">10���ྻȼ��������</td>
      <td align="center"  class="td_viewcontent_content">��������</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">25</td>
      <td align="center"  class="td_viewcontent_title">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">8</td>
      <td align="center"  class="td_viewcontent_title">6����ҵú̼������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">17</td>
      <td align="center"  class="td_viewcontent_title">11����̿������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">26</td>
      <td align="center"  class="td_viewcontent_title">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td_viewcontent_title">&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">18</td>
      <td align="center"  class="td_viewcontent_title">12������ȼ��������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">27</td>
      <td align="center"  class="td_viewcontent_title">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" style=" margin-bottom:5px; ">
    <tr>
      <td class="font1220_000000">ָ����ϵ��5=6+7,8=9+10,12��13+14,17��18,17��19,20��21,20��22</td>
    </tr>
  </table>
  </div>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"> ��1-1������1</td>
      <td width="21" class="td_viewcontent_content" id="td2" style="padding-right:5px"><img src="images/node_closed.gif" onclick="Go_Hidden('2')" onmouseover="this.style.cursor='hand';" width="17" height="17"></td>
    </tr>
  </table>
   <div id="table2" visible="true" >
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
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_title">��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title"> 14.��Ҫ�ж��к�ԭ���������� </td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">42</td>
      <td align="center"  class="td_viewcontent_title"> 8.��ҵ��ˮ�ŷŴ���� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">58</td>
      <td align="center"  class="td_viewcontent_title"> ��10�����۸� </td>
      <td align="center"  class="td_viewcontent_content"> ǧ�� </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">26</td>
      <td align="center"  class="td_viewcontent_title"> (1)*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title">


9.��ҵ��ˮ����Ⱦ��ȥ����</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title"> ������ҵ���� </td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">27</td>
      <td align="center"  class="td_viewcontent_title"> (2)*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;
      <td align="center"  class="td_viewcontent_content">43</td>
      <td align="center"  class="td_viewcontent_title"> ��1����ѧ������ </td>
      <td align="center"  class="td_viewcontent_content">��ǧ�ˡ�</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">59</td>
      <td align="center"  class="td_viewcontent_title"> 1.��ҵ�����ŷ��� </td>
      <td align="center"  class="td_viewcontent_content"> ��������� </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">28</td>
      <td align="center"  class="td_viewcontent_title"> (3)*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;
      <td align="center"  class="td_viewcontent_content">44</td>
      <td align="center"  class="td_viewcontent_title"> ���У�����������ʩȥ���� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">60</td>
      <td align="center"  class="td_viewcontent_title"> ���У�ȼ��ȼ�������ŷ��� </td>
      <td align="center"  class="td_viewcontent_content"> ��������� </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">29</td>
      <td align="center"  class="td_viewcontent_title"> 15.��ˮ�ŷſ��� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">45</td>
      <td align="center"  class="td_viewcontent_title">��2������ </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">61</td>
      <td align="center"  class="td_viewcontent_title"> �������չ������ŷ��� </td>
      <td align="center"  class="td_viewcontent_content"> ��������� </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">30</td>
      <td align="center"  class="td_viewcontent_title"> 16.ֱ�ź�����ˮ�ŷſ��� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">46</td>
      <td align="center"  class="td_viewcontent_title">����3��ʯ����</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">62</td>
      <td align="center"  class="td_viewcontent_title"> 2.����������ʩ�� </td>
      <td align="center"  class="td_viewcontent_content"> �� </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">31</td>
      <td align="center"  class="td_viewcontent_title">17.��ˮ��Ⱦ�����߼����������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">47</td>
      <td align="center"  class="td_viewcontent_title"> ����4���ӷ��� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">63</td>
      <td align="center"  class="td_viewcontent_title"> ���У�������ʩ�� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">32</td>
      <td align="center"  class="td_viewcontent_title"> 18.������Ⱦ�����߼���������� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">48</td>
      <td align="center"  class="td_viewcontent_title"> ����5���軯�� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">64</td>
      <td align="center"  class="td_viewcontent_title"> 3.����������ʩ�������� </td>
      <td align="center"  class="td_viewcontent_content">��������/ʱ </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title"> ������ҵ��ˮ </td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title"> 10.��ҵ��ˮ����Ⱦ���ŷ��� </td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">65</td>
      <td align="center"  class="td_viewcontent_title"> ���У�������ʩ�������� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��/ʱ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">33</td>
      <td align="center"  class="td_viewcontent_title"> 1.��ˮ������ʩ�� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">49</td>
      <td align="center"  class="td_viewcontent_title"> ��1����ѧ������ </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">66</td>
      <td align="center"  class="td_viewcontent_title"> 4.����������ʩ���з��� </td>
      <td align="center"  class="td_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">34</td>
      <td align="center"  class="td_viewcontent_title"> 2.��ˮ������ʩ�������� </td>
      <td align="center"  class="td_viewcontent_content">��/��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">50</td>
      <td align="center"  class="td_viewcontent_title"> ��2������ </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">67</td>
      <td align="center"  class="td_viewcontent_title"> ���У�������ʩ���з��� </td>
      <td align="center"  class="td_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">35</td>
      <td align="center"  class="td_viewcontent_title"> 3.��ˮ������ʩ���з��� </td>
      <td align="center"  class="td_viewcontent_content"> ��Ԫ </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">51</td>
      <td align="center"  class="td_viewcontent_title"> ��3��ʯ���� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">68</td>
      <td align="center"  class="td_viewcontent_title"> 5.��������ȥ���� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">36</td>
      <td align="center"  class="td_viewcontent_title"> 4.��ҵ��ˮ������ </td>
      <td align="center"  class="td_viewcontent_content"> �� </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">52</td>
      <td align="center"  class="td_viewcontent_title"> ��4���ӷ��� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">69</td>
      <td align="center"  class="td_viewcontent_title"> ���У�ȼ��ȼ�չ�����ȥ���� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">37</td>
      <td align="center"  class="td_viewcontent_title"> 5.��ҵ��ˮ�ŷ��� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">53</td>
      <td align="center"  class="td_viewcontent_title">��5���軯��</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">70</td>
      <td align="center"  class="td_viewcontent_title"> �������չ�����ȥ���� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">38</td>
      <td align="center"  class="td_viewcontent_title"> ���У�ֱ�����뺣�� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">54</td>
      <td align="center"  class="td_viewcontent_title"> ��6���� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">71</td>
      <td align="center"  class="td_viewcontent_title"> ���У�����������ʩȥ���� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">39</td>
      <td align="center"  class="td_viewcontent_title"> ����������������ˮ������ </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">55</td>
      <td align="center"  class="td_viewcontent_title"> ��7��Ǧ </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">72</td>
      <td align="center"  class="td_viewcontent_title"> 6.���������ŷ��� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">40</td>
      <td align="center"  class="td_viewcontent_title"> 6.������ˮ������CODŨ�� </td>
      <td align="center"  class="td_viewcontent_content"> mg/L </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">56</td>
      <td align="center"  class="td_viewcontent_title"> ��8���� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">73</td>
      <td align="center"  class="td_viewcontent_title"> ���У�ȼ��ȼ�չ������ŷ��� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">41</td>
      <td align="center"  class="td_viewcontent_title"> 7.������ˮ�����İ���Ũ�� </td>
      <td align="center"  class="td_viewcontent_content">mg/L</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">57</td>
      <td align="center"  class="td_viewcontent_title"> ��9���� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">74</td>
      <td align="center"  class="td_viewcontent_title"> ���У��ŷŴ���� </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" style=" margin-bottom:5px; ">
    <tr>
      <td class="font1220_000000"> ָ����ϵ��6��37,37��38,37��39,37��42,43��44,59=60+61,62��63,66��67,68=69+70,68��71,72=73+75,73��74 </td>
    </tr>
  </table>
  </div>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"> ��1-1������2</td>
      <td width="21" class="td_viewcontent_content" id="td3" style="padding-right:5px"><img src="images/node_closed.gif" onclick="Go_Hidden('3')" onmouseover="this.style.cursor='hand';" width="17" height="17"></td>
    </tr>
  </table>
   <div id="table3" visible="true" >
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
      <td align="center"  class="td_viewcontent_content">����</td>
      <td align="center"  class="td_viewcontent_title">ָ������</td>
      <td align="center"  class="td_viewcontent_content">������λ</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">����ʵ��</td>
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
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_title">��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">75</td>
      <td align="center"  class="td_viewcontent_title">���У��������չ������ŷ���</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">89</td>
      <td align="center"  class="td_viewcontent_title">��3����ú��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">104</td>
      <td align="center"  class="td_viewcontent_title">��8����������</td>
      <td align="center"  class="td_viewcontent_content"> ��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">76</td>
      <td align="center"  class="td_viewcontent_title">���У��ŷŴ����</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
      <td align="center"  class="td_viewcontent_content">90</td>
      <td align="center"  class="td_viewcontent_title">��4��¯��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">105</td>
      <td align="center"  class="td_viewcontent_title">���У��ۺ���������������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">77</td>
      <td align="center"  class="td_viewcontent_title">7.��������ȥ����</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">91</td>
      <td align="center"  class="td_viewcontent_title">��5��ú�ʯ</td>
      <td align="center"  class="td_viewcontent_content">���֡�</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">106</td>
      <td align="center"  class="td_viewcontent_title">3.��ҵ�������������</td>
      <td align="center"  class="td_viewcontent_content"> ��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">78</td>
      <td align="center"  class="td_viewcontent_title">8.���������ŷ���</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">92</td>
      <td align="center"  class="td_viewcontent_title">��6��β��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">107</td>
      <td align="center"  class="td_viewcontent_title">���У�Σ�շ���������</td>
      <td align="center"  class="td_viewcontent_content"> ��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">79</td>
      <td align="center"  class="td_viewcontent_title">���У��ŷŴ����</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">93</td>
      <td align="center"  class="td_viewcontent_title"> ��7�������Է��� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">108</td>
      <td align="center"  class="td_viewcontent_title">4.��ҵ������ﴦ����</td>
      <td align="center"  class="td_viewcontent_content"> ��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">80</td>
      <td align="center"  class="td_viewcontent_title">9.�̳�ȥ����</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">94</td>
      <td align="center"  class="td_viewcontent_title">��8������ʯ��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">109</td>
      <td align="center"  class="td_viewcontent_title">���У�Σ�շ��ﴦ����</td>
      <td align="center"  class="td_viewcontent_content"> ��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">81</td>
      <td align="center"  class="td_viewcontent_title">10.�̳��ŷ���</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">95</td>
      <td align="center"  class="td_viewcontent_title"> ��9����������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">110</td>
      <td align="center"  class="td_viewcontent_title">���У��������д��ó�������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">82</td>
      <td align="center"  class="td_viewcontent_title">���У��ŷŴ����</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">96</td>
      <td align="center"  class="td_viewcontent_title"> 2.��ҵ��������ۺ�������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">111</td>
      <td align="center"  class="td_viewcontent_title">���У���������������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">83</td>
      <td align="center"  class="td_viewcontent_title">11.��ҵ�۳�ȥ����</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">97</td>
      <td align="center"  class="td_viewcontent_title">��1��Σ�շ���</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">112</td>
      <td align="center"  class="td_viewcontent_title">5.��ҵ��������ŷ���</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">84</td>
      <td align="center"  class="td_viewcontent_title">12.��ҵ�۳��ŷ���</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">98</td>
      <td align="center"  class="td_viewcontent_title">��2��ұ������</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">113</td>
      <td align="center"  class="td_viewcontent_title">���У�Σ�շ����ŷ���</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">85</td>
      <td align="center"  class="td_viewcontent_title">���У��ŷŴ����</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">99</td>
      <td align="center"  class="td_viewcontent_title">��3����ú��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="8" align="center"  class="td_viewcontent_content">��<br>
        ��<br>
        ��<br>
    �� </td>
      <td align="center"  class="td_viewcontent_title"> ��Ҫȼ�����  </td>
      <td align="center"  class="td_viewcontent_content"> ȼ��1 </td>
      <td align="center"  class="td_viewcontent_content">ȼ��2</td>
      <td align="center"  class="td_viewcontent_content">ȼ��3</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title">�ġ���ҵ�������</td>
      <td align="center"  class="td_viewcontent_content"> -- </td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">100</td>
      <td align="center"  class="td_viewcontent_title">��4��¯��</td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_title"> ȼ��ú����  </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="2" align="center"  class="td_viewcontent_content">86</td>
      <td rowspan="2" align="center"  class="td_viewcontent_title"> 
      <table cellspacing="0" cellpadding="0">
        <tr>
          <td align="center" ></td>
        </tr>
      </table>1.��ҵ������������ </td>
      <td rowspan="2" align="center"  class="td_viewcontent_content"> �� </td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">101</td>
      <td rowspan="2" align="center"  class="td_viewcontent_title">��5��ú�ʯ</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">��</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_title"> ȼ��ú������(��)  </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_title"> ȼ��ú���(%) </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="2" align="center"  class="td_viewcontent_content">87</td>
      <td rowspan="2" align="center"  class="td_viewcontent_title">��1��Σ�շ���</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">��</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">      102</td>
      <td rowspan="2" align="center"  class="td_viewcontent_title"> ��6��β�� </td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">��</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_title"> ȼ��������  </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_title"> ȼ���Ͳ��� </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="2" align="center"  class="td_viewcontent_content">88</td>
      <td rowspan="2" align="center"  class="td_viewcontent_title">��2��ұ������</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">��</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">103</td>
      <td rowspan="2" align="center"  class="td_viewcontent_title">��7������ʯ��</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">��</td>
      <td rowspan="2" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_title"> ȼ����������(��)  </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_title"> ȼ�������(%) </td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
    <tr>
      <td class="font1220_000000">ָ����ϵ��75��76,78��79,81��82,84��85,86=87+88+89+90+91+92+93+94+95,86=96+106+108+112-105-111,96=97+98+99+100+101+102+103+104,96��105,


106��107,108��109,109��110,
108��111,112��113,87��97+107+109+113 </td>
    </tr>
  </table>
  </div>
</G:Template>
</G:Content>
<!--��̬���ɽ���-->
</form>
</body>
</html>