<!--����Դ-S405-->

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
    string hycode="";
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();
        string    orgcode = GetQueryString("orgcode", "0");
        hycode = GetQueryString("hycode","0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select fld_1383_2,fld_1383_6,fld_1383_16+'-'+cast(convert(decimal(11,0),fld_1383_11) as varchar(20)),case when cast(convert(decimal(11,0),fld_1383_9) as varchar(20))='0' then '' else cast(convert(decimal(11,0),fld_1383_9) as varchar(20)) end ,fld_1383_14,fld_1383_22,fld_1383_23,fld_1383_24,fld_1383_25,fld_1383_26,fld_1383_27,fld_1383_28,fld_1383_29,fld_1383_30,fld_1383_31,fld_1383_32,fld_1383_33,fld_1383_34,fld_1383_35,fld_1383_36,fld_1383_37,fld_1383_38,fld_1383_39,fld_1383_45,case when cast(convert(decimal(11,0),fld_1383_51) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1383_51) as varchar(20)) end,fld_1383_40,fld_1383_46,case when cast(convert(decimal(11,0),fld_1383_52) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1383_52) as varchar(20)) end,fld_1383_41,fld_1383_47,case when cast(convert(decimal(11,0),fld_1383_53) as varchar(20))='0' then ' ' else cast(convert(decimal(10,0),fld_1383_53) as varchar(20)) end,fld_1383_42,fld_1383_48,case when");
        sb.Append(" cast(convert(decimal(11,0),fld_1383_54) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1383_54) as varchar(20)) end,fld_1383_43,fld_1383_49,case when cast(convert(decimal(11,0),fld_1383_55) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1383_55) as varchar(20)) end,fld_1383_44,fld_1383_50,case when cast(convert(decimal(11,0),fld_1383_56) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1383_56) as varchar(20)) end,fld_1383_13,fld_1383_59,fld_1383_60,'201'+cast(fld_1383_21 as varchar(20))+'��'+(case when cast(convert(decimal(11,0),fld_1383_15) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1383_15) as varchar(20)) end)+'��'+(case when cast(convert(decimal(11,0),fld_1383_10) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1383_10) as varchar(20)) end)+'��',fld_1383_19,fld_1383_20,'201'+cast(fld_1383_61 as varchar(20))+'��'+(case when cast(convert(decimal(11,0),fld_1383_58) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1383_58) as varchar(20)) end)+'��'+(case when cast(convert(decimal(11,0),fld_1383_57) as varchar(20))='0' then ' ' else cast(convert(decimal(11,0),fld_1383_57) as varchar(20)) end)+'��',fld_1383_1 from gmis_mo_1383 where fld_1383_1='"+orgcode+"'");
        view.SqlStr = sb.ToString();
        iframe_658.Attributes["src"] = "iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
    }
 
</script>

<body style="padding: 10px; text-align: center">
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
    <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr><td width="30%"></td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               �������������ȾԴ�ղ��
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            ��    &nbsp;&nbsp;&nbsp;�ţ�S405��
                        </td>
                    </tr>
                     <tr>
                        <td>
                            �Ʊ����أ�����������
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼���أ�����ͳ�ƾ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �� &nbsp;&nbsp;&nbsp;�ţ���ͳ��[2009]113��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��Ч������2011��12��
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
         <tr><td  colspan=3 style="font-size:small; font-weight:normal; width:40%" align="center" >2009��</td></tr>
    </table>
    <G:Content id="view" runat="server">
    <G:Template id="Template1" runat="server">
    <table cellpadding="3" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">1.�������е������أ��ؼ��У������������ƣ����£�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">2.������������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">3.��ϵ��ʽ</td>
	    </tr>
		
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>����-�绰����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>�������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>��ϵ������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
		</tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>4.Ͻ���ڳ���ס�˿ڣ����ˣ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>5.ú̿����������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>6.ú̿��ƽ����ݣ�%��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>7.ú̿��ƽ���ҷݣ�%��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>8.ȼ��������������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>9.ȼ������ƽ����ݣ�%��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>10.�ܵ�ú�����������������ף�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>11.��Ȼ��������������������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>12.Һ��ʯ��������������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>13.������������������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>14.���У����������޺�������������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>15.���У�����������������������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>16.���У����������ѷ�������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>17.���У�������������������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>18.���У�������������������ʽ����������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>19.������ˮ��������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>20.���У������ͥ��ˮ��������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
        </tr>
        </table>
        
        <table cellpadding="2" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
        <tr align="center">
		<td width="150"  align="center"  class="td_viewcontent_title" nowrap>21.����ˮ������:</td>
		<td width="120" align="center"  class="td_viewcontent_title" nowrap>22.���У�����ˮ�����:</td>
		<td width="120" align="center"  class="td_viewcontent_title" nowrap>23.��������ˮ�����ˮ��&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150"  align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150"  align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150"  align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150"  align="right"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    <tr align="center">
		<td width="150" align="right"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		<td width="120" align="center"  class="td_viewcontent_content" nowrap>*&nbsp;</td>
		
	    </tr>
	    </table>
	    <table cellpadding="2" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>��λ������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>�����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>�����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>�������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>�ղ�Ա:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>�ղ�ָ��Ա:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>�������:</td>
		<td class="td_viewcontent_content" colspan="3">*&nbsp;</td>
		
        </tr>
	</table>
</G:Template>
</G:Content>

    </form>
</body>
</html>