<!--����Դ-S403-->

<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<SCRIPT language=javascript>

function setzlkzstar(strzl){

	
	if(strzl=="show"){

		

		document.all.hiddzl.style.display = "";

		document.all.zlkzdiv.style.display = "";

		
		document.all.showzl.style.display = "none";

	}else{		

		
		document.all.showzl.style.display = "";

		document.all.hiddzl.style.display = "none";

		document.all.zlkzdiv.style.display = "none";

	}

}
</SCRIPT>

<script language="C#" runat="server">
    string hycode = "";//��ҵ
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode", "0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select case fld_1260_81 when '' then '����������ֽ�����Ŀ������ʩ�������ռ�Ҫ��' else fld_1260_81 end,fld_1260_2,fld_1260_3,fld_1260_4,fld_1260_5,fld_1260_1,fld_1260_6,fld_1260_7,fld_1260_8,fld_1260_9,fld_1260_10,fld_1260_17,fld_1260_18,fld_1260_19,fld_1260_20,fld_1260_21,fld_1260_11,fld_1260_12,fld_1260_13,fld_1260_14,fld_1260_15,fld_1260_16,fld_1260_75 as ��������,fld_1260_24,fld_1260_76 as ��������,'' as �����������,fld_1260_74 as ��Ͷ��,fld_1260_26,fld_1260_72 as ռ�����,fld_1260_73 as �������,fld_1260_25,fld_1260_26,case CONVERT(varchar(10), fld_1260_27, 120) when '1900-01-01' then '' else CONVERT(varchar(10), fld_1260_27, 120) end,case CONVERT(varchar(10), fld_1260_28, 120) when '1900-01-01' then '' else CONVERT(varchar(10), fld_1260_28, 120) end,fld_1260_32,fld_1260_34,fld_1260_33,fld_1260_35,fld_1260_36,fld_1260_62,fld_1260_63,fld_1260_64,fld_1260_37,fld_1260_43,fld_1260_38,fld_1260_44,fld_1260_39,fld_1260_45,fld_1260_40,fld_1260_46,fld_1260_41,fld_1260_47,fld_1260_42,fld_1260_48,fld_1260_49,fld_1260_51,fld_1260_52,fld_1260_53,case CONVERT(varchar(10), fld_1260_54, 120) when '1900-01-01' then '' else CONVERT(varchar(10), fld_1260_54, 120) end,fld_1260_65,fld_1260_82,fld_1260_83,fld_1260_84,fld_1260_55,fld_1260_56,fld_1260_69,fld_1260_57,fld_1260_58,case CONVERT(varchar(10), fld_1260_59, 120) when '1900-01-01' then '' else CONVERT(varchar(10), fld_1260_59, 120) end,fld_1260_60 from gmis_mo_1260 where mocode="+id+";");
        
        view.SqlStr = sb.ToString();
    }
  
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--ѡ�-->

    <!--ѡ�-->
    <!--����������-->
    <div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"-->
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbar.aspx"-->
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbarright.aspx"-->
    <!--����������-->
    </div>

    <!--����-->
    
    <G:Content id="view" runat="server">
    <G:Template id="Template1" runat="server">
	<table border="0" width="100%">
	<tr><td align="center" style="TEXT-ALIGN: center; FONT-FAMILY: ??��?, Arial; COLOR: #ff0000; FONT-SIZE: 20pt; FONT-WEIGHT: bold">
	*
	</td></tr>
	<tr><td>
	<table cellpadding="3" cellspacing="1" border="0" width="100%" >
	<tr>
		<td width="120px">��Ŀ�ǼǺţ�</td><td width="40%">*&nbsp;</td>
		<td width="120px" >�� �� �ţ�</td><td width="40%">*&nbsp;</td> 	
	</tr>
	<tr>
		<td width="120px">�������</td><td>*&nbsp;</td>
		<td >�� ѯ �ţ�</td><td>*&nbsp;</td> 	
	</tr>
	</table></td></tr><tr><td>
    <table  cellpadding="3" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
	 <tr>
		<td colspan="8" class="td_viewcontent_title">��Ŀ������Ϣ��</td>
	</tr>
    <tr>
		<td width="12.5%"  class="td_viewcontent_content">��Ŀ����</td>
		<td width="37.5%"  colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td width="12.5%"    class="td_viewcontent_content">��Ŀ����</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
		<td width="12.5%"    class="td_viewcontent_content">��������</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">����ص�</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">��  ��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">�� ҵ ��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">�ܱ߱�����</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">�ص���Ŀ�� *&nbsp;</td>
		<td class="td_viewcontent_content">��    �ܣ� *&nbsp;</td>
		<td   class="td_viewcontent_content">��    �ȣ� *&nbsp;</td>
		<td class="td_viewcontent_content">γ    �ȣ� *&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">���赥λ</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">��λ���ʣ�</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">���ܲ���</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">ͨѶ��ַ</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">�� ϵ ��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">��ϵ�绰</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">��������</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">��ҵ���</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">��������</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">�����������</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">��Ͷ�ʣ���Ԫ��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">����Ͷ�ʣ���Ԫ��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">ռ�������m2��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">���������m2��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td   class="td_viewcontent_content">ʵ����Ͷ�ʣ���Ԫ��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">����Ͷ�ʣ���Ԫ��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">��������</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td   class="td_viewcontent_content">��������</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  rowspan="2" class="td_viewcontent_content">��¯</td>
		<td  class="td_viewcontent_content">ȼ    ��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td  rowspan="2" class="td_viewcontent_content">��    ˮ</td>
		<td  class="td_viewcontent_content">��ˮ��ʽ</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">�����������֣�</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td  class="td_viewcontent_content">����������/�գ�</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td class="td_viewcontent_content">һ����Ⱦ��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td class="td_viewcontent_content">������λ</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td class="td_viewcontent_content">���۾��ѣ���Ԫ��</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
		<td  class="td_viewcontent_content">�����۷�</td>
		<td class="td_viewcontent_content">*&nbsp;</td>
	</tr>
</table></td></tr><tr><td>
<TABLE border=0 width="96%" align=center>
	<TR>
		<TD>
			<SPAN  id=showzl><A onclick="setzlkzstar('show')" href="#">��ʾ����</A></SPAN>
			<SPAN style="DISPLAY: none" id=hiddzl><A onclick="setzlkzstar('hid')"  href="#">��������</A></SPAN>
		</TD>
	</TR>
</TABLE>
</td></tr><tr><td>
<TABLE style="DISPLAY: none" id=zlkzdiv border=1 cellSpacing=0 borderColor=#000000 borderColorDark=#ffffff cellPadding=2 width="96%" align=center valign="center">

  <TBODY>

  <TR>

    <TD width="12.5%">�������ƣ�COD��</TD>

    <TD width="37.5%" colSpan=3>&nbsp; </TD>

    <TD width="12.5%">�������ƣ�SO2��</TD>

    <TD width="37.5%" colSpan=3>&nbsp; </TD></TR>

  <TR>

    <TD>COD�ŷ�����</TD>

    <TD colSpan=3>*&nbsp;��/�� </TD>

    <TD >SO2�ŷ�����</TD>

    <TD colSpan=3>*&nbsp;��/�� </TD></TR>

  <TR>

    <TD >COD�����´��ϡ�������</TD>

    <TD  colSpan=3>*&nbsp;��/�� </TD>

    <TD >SO2�����´��ϡ�������</TD>

    <TD  colSpan=3>*&nbsp;��/�� </TD></TR>

  <TR>

    <TD >COD�ŷ�������</TD>

    <TD colSpan=3>*&nbsp;��/�� </TD>

    <TD >SO2�ŷ�������</TD>

    <TD  colSpan=3>*&nbsp;��/�� </TD></TR>

  <TR>

    <TD >�������ƣ�NH3��</TD>

    <TD colSpan=3>&nbsp; </TD>

    <TD>�������ƣ�NO��</TD>

    <TD  colSpan=3>&nbsp; </TD></TR>

  <TR>

    <TD>NH3�ŷ�����</TD>

    <TD colSpan=3>*&nbsp;��/�� </TD>

    <TD >NO�ŷ�����</TD>

    <TD  colSpan=3>*&nbsp;��/�� </TD></TR>

  <TR>

    <TD>NH3�����´��ϡ�������</TD>

    <TD colSpan=3>*&nbsp;��/�� </TD>

    <TD >NO�����´��ϡ�������</TD>

    <TD colSpan=3>*&nbsp;��/�� </TD></TR>

  <TR>

    <TD>NH3�ŷ�������</TD>

    <TD  colSpan=3>*&nbsp;��/�� </TD>

    <TD >NO�ŷ�������</TD>

    <TD colSpan=3>*&nbsp;��/�� </TD></TR></TBODY></TABLE></td></tr><tr><td>
<table  cellpadding="3" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
	 <tr>
		<td  class="td_viewcontent_content">�걨����</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
    <tr>
		<td width="12.5%"  class="td_viewcontent_content">�ʹ﷽ʽ</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
		<td width="12.5%"    class="td_viewcontent_content">����λ</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
		<td width="12.5%"    class="td_viewcontent_content">�� �� ��</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
		<td width="12.5%"    class="td_viewcontent_content">�ռ�����</td>
		<td width="12.5%"  class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	 <tr>
		<td colspan="8" class="td_viewcontent_title"></td>
	</tr>
	<tr>
		<td colspan="8" class="td_viewcontent_title">��ʾ��Ϣ��</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">���ڲ���</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">��Ŀ���</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">��������</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">��������</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	 <tr>
		<td colspan="8" class="td_viewcontent_title"></td>
	</tr>
	<tr>
		<td colspan="8" class="td_viewcontent_title">��������</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">������ʽ</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">������������ʽ</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">��Ŀ�ſ�</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">������</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td colspan="8" class="td_viewcontent_title">���ڱ�ţ�</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">�� �� ��</td>
		<td colspan="7" class="td_viewcontent_content">*&nbsp;</td>
	</tr>
	<tr>
		<td  class="td_viewcontent_content">��������</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		<td  class="td_viewcontent_content">�������</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
	</tr>

	
</table></td></tr></table>
</G:Template>
</G:Content>
      

    </form>
</body>
</html>
