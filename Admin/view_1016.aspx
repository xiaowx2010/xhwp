<!--����Դ-S404-->

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
    string hycode = "";
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();
		string 	orgcode = GetQueryString("orgcode", "0");
        hycode = GetQueryString("hycode","0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select fld_1016_2,fld_1016_4,fld_1016_9,fld_1016_6,(fld_1016_10+fld_1016_51+fld_1016_52+fld_1016_54+fld_1016_56),fld_1016_11+'-'+cast(convert(decimal(11,0),fld_1016_12) as varchar(20)),case when cast(convert(decimal(11,0),fld_1016_13) as varchar(20))='0' then '' else cast(convert(decimal(11,0),fld_1016_13) as varchar(20)) end,fld_1016_14,fld_1016_15,(select top 1 fld_1021_3 from gmis_mo_1021 where fld_1021_1=fld_1016_1),cast((select top 1 fld_1021_4 from gmis_mo_1021 where fld_1021_1=fld_1016_1) as varchar(20))+'��'+cast((select top 1 fld_1021_5 from gmis_mo_1021 where fld_1021_1=fld_1016_1) as varchar(20))+'��',(select top 1 fld_1021_6 from gmis_mo_1021 where fld_1021_1=fld_1016_1),(select top 1 fld_1021_7 from gmis_mo_1021 where fld_1021_1=fld_1016_1),(select top 1 fld_1021_8 from gmis_mo_1021 where fld_1021_1=fld_1016_1)+'='+(select fld_783_2 from gmis_mo_783 where fld_783_1=(select top 1 fld_1021_8");
        sb.Append(" from gmis_mo_1021 where fld_1021_1=fld_1016_1)),(select top 1 fld_1021_9 from gmis_mo_1021 where fld_1021_1=fld_1016_1),(select top 1 fld_1021_10 from gmis_mo_1021 where fld_1021_1=fld_1016_1)+'='+(select fld_784_2 from gmis_mo_784 where fld_784_1=(select top 1 fld_1021_10 from gmis_mo_1021 where fld_1021_1=fld_1016_1)),(select top 1 fld_1021_11 from gmis_mo_1021 where fld_1021_1=fld_1016_1),(select top 1 fld_1021_12 from gmis_mo_1021 where fld_1021_1=fld_1016_1),fld_1016_21,fld_1016_22,fld_1016_16,fld_1016_17,fld_1016_18,(select top 1 fld_1021_13 from gmis_mo_1021 where fld_1021_1=fld_1016_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select top 1 fld_1021_13 from gmis_mo_1021 where fld_1021_1=fld_1016_1)),(select top 1 fld_1021_14 from gmis_mo_1021 where fld_1021_1=fld_1016_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select top 1 fld_1021_14 from gmis_mo_1021 where fld_1021_1=fld_1016_1)),fld_1016_20+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_1016_20),fld_1016_19,fld_1016_38,fld_1016_39,fld_1016_42,'200'+cast(convert(decimal(10,0),fld_1016_27) as varchar(20))+'��'+cast(convert(decimal(10,0),fld_1016_29) as varchar(20))+'��'+cast(convert(decimal(10,0),fld_1016_30) as varchar(20))+'��',fld_1016_25,fld_1016_26,'200'+cast(convert(decimal(10,0),fld_1016_43) as varchar(20))+'��'+cast(convert(decimal(10,0),fld_1016_46) as varchar(20))+'��'+cast(convert(decimal(10,0),fld_1016_47) as varchar(20))+'��' ,fld_1016_1 from gmis_mo_1016 where fld_1016_1='"+orgcode+"'");
        view.SqlStr = sb.ToString();
        iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
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
        <tr>
        <td width="30%"></td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               ����ȼ����ʩ�ղ��
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            ��    &nbsp;&nbsp;&nbsp;�ţ�S404��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �Ʊ���أ�����Ժ��һ��ȫ����ȾԴ�ղ��쵼С��칫��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼���أ�����ͳ�ƾ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��    &nbsp;&nbsp;&nbsp;�ţ���ͳ��[2007]124��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��Ч������2008��6��30��
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
        <tr><td  colspan=3 style="font-size:small; font-weight:normal; width:40%" align="center" >2007��</td></tr>
    </table>
    <G:Content id="view" runat="server">
    <G:Template id="Template1" runat="server">
    <table cellpadding="3" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
    <tr>
		<td width="100" align="right"  class="td_viewcontent_title">1.��λ����:</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title">2.��λ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">3.����������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">4.��λ���ڵ���������</td>
	</tr>

		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>������������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>��λ���ڵ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">5.��ϵ��ʽ</td>
	</tr>

		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>����-�绰����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>�������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>��������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>��ϵ������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>6.��¯���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>7.Ͷ��ʱ�䣨��/�£�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>8.����������ߣ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>9.����ʱ�䣨Сʱ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>10.ȼ�����ʹ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>11.ȼ������������/�����ף�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>12.ȼ�շ�ʽ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>13.ȼ����ݣ�%��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>14.ȼ�ϻҷۣ�%��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>15.����������ʩ�����ף�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>16.����������ʩ������������������/ʱ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>17.����������ʩ��Ͷ�ʣ���Ԫ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>18.����ʵ�ʴ��������������ף�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>19.����������ʩ���з��ã���Ԫ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>20.�����մ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>21.�������մ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>22.��ú�ҡ�¯���ռ���ʽ:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>23.����������ʩ����ʱ�䣨Сʱ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
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
