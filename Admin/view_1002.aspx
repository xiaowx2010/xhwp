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

<script language="C#" runat="server">
    string hycode = "";//��ҵ
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode", "0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select fld_1002_2,fld_1002_4,fld_1002_9,fld_1002_6,(fld_1002_10+fld_1002_47+fld_1002_49+fld_1002_50+fld_1002_52),(fld_1002_11+'-'+cast(convert(decimal(11,0),fld_1002_12) as varchar(20))),case when fld_1002_13=0 then '' else cast(convert(decimal(10,0),fld_1002_13) as varchar(20)) end,fld_1002_14,fld_1002_15,fld_1002_42,fld_1002_46+'='+fld_1002_42,cast(fld_1002_41 as varchar(20))+'��'+cast(fld_1002_43 as varchar(20))+'��',fld_1002_44,fld_1002_17,fld_1002_20,fld_1002_26,fld_1002_22,fld_1002_25,fld_1002_65+'='+(select fld_1065_2 from gmis_mo_1065 where fld_1065_1=fld_1002_65),fld_1002_30+'='+(select fld_980_2 from gmis_mo_980 where fld_980_1=fld_1002_30),fld_1002_34,fld_1002_39,fld_1002_48+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_1002_48),fld_1002_16,fld_1002_51+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_51)+';'+(case when fld_1002_53='' then '' else fld_1002_53+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_53)+';' end)+(case when fld_1002_54='' then '' else fld_1002_54+'='+(select ");
        sb.Append("fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_54) end),fld_1002_18,fld_1002_19,fld_1002_21,(case when fld_1002_55='' then '' else fld_1002_55+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_55)+';' end)+(case when fld_1002_56='' then '' else fld_1002_56+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_56)+';' end)+(case when fld_1002_57='' then '' else fld_1002_57+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_57)+';' end)+(case when fld_1002_58='' then '' else fld_1002_58+'='+(select fld_1172_2 from gmis_mo_1172 where fld_1172_1=fld_1002_58)+';' end),(case when fld_1002_59='' then '' else (select fld_1193_2 from gmis_mo_1193 where fld_1193_1=fld_1002_59)+';' end)+(case when fld_1002_60='' then '' else (select fld_1193_2 from gmis_mo_1193 where fld_1193_1=fld_1002_60)+';' end)+(case when fld_1002_61='' then '' else (select fld_1193_2 from gmis_mo_1193 where fld_1193_1=fld_1002_61)+';' end)+(case when fld_1002_62='' then '' else (select fld_1193_2 from gmis_mo_1193 where fld_1193_1=fld_1002_62)+';' end)+(case when fld_1002_64='' then '' else (select fld_1193_2 from gmis_mo_1193 where fld_1193_1=fld_1002_64)+';' end),(case when fld_1002_31='' then '' else fld_1002_31+'='+(select fld_649_2 from gmis_mo_649 where fld_649_1=fld_1002_31)+';' end)+(case when fld_1002_27='' then '' else fld_1002_27+'='+(select fld_649_2 from gmis_mo_649 where fld_649_1=fld_1002_27)+';' end),fld_1002_33,");
        sb.Append("fld_1002_37,fld_1002_66,fld_1002_38,fld_1002_23,fld_1002_24,fld_1002_63+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_1002_63),fld_1002_32,fld_1002_28,fld_1002_29,fld_1002_35,'200'+(cast(convert(decimal(10,0),fld_1002_36) as varchar(20))+'��'+cast(convert(decimal(10,0),fld_1002_40) as varchar(20))+'��'+cast(convert(decimal(10,0),fld_1002_45) as varchar(20))+'��'),fld_1002_69,fld_1002_71,'200'+cast(convert(decimal(10,0),fld_1002_72) as varchar(20))+'��'+cast(convert(decimal(10,0),fld_1002_74) as varchar(20))+'��'+cast(convert(decimal(10,0),fld_1002_77) as varchar(20))+'��',fld_1002_1 from gmis_mo_1002 where fld_1002_1='"+orgcode+"' ");
        view.SqlStr = sb.ToString();
        list1.SqlStr = "select fld_1014_3,cast(fld_1014_4 as varchar(20))+'��'+cast(fld_1014_5 as varchar(20))+'��',fld_1014_6,fld_1014_7,fld_1014_8+'='+(select fld_783_2 from gmis_mo_783 where fld_783_1=fld_1014_8),fld_1014_9,fld_1014_10+'='+(select fld_784_2 from gmis_mo_784 where fld_784_1=fld_1014_10),fld_1014_11,fld_1014_12,fld_1014_13+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=fld_1014_13),fld_1014_14+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=fld_1014_14) from gmis_mo_1014 where fld_1014_1 in (select fld_1002_1 from gmis_mo_1002 where fld_1002_1='"+orgcode+"')";
        list1.Rows = list1.DataTable.Rows.Count;
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
        <tr><td width="30%"></td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
                ҽԺ��ȾԴ�ղ��
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            ��    &nbsp;&nbsp;&nbsp;�ţ�S403��
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
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>6.��ҵ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>��ҵ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>7.��ҵʱ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>8.��λ�����ţ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">��ˮ��ˮ��������ˮ���</td>
	</tr>
	<tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>9.��ˮ�������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>10.��ˮ������ʩ������������/�գ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>11.��ˮ������ʩ��Ͷ�ʣ���Ԫ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>12.��ˮʵ�ʴ��������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>13.��ˮ������ʩ���з���(��Ԫ):</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>14.��ˮ�����մ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>15.��ˮȥ�����ʹ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>16.����ˮ������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>17.����ˮ�����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
        </tr>
        
        
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">�������������</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>18.���������ռ���ʽ:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>19.ҽ�Ʒ������������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>20.ҽ�Ʒ��ﴦ��ʽ:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>21.ҽ�Ʒ����޺������������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>22.���б���λ�޺������õ�ҽ�Ʒ��������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>23.��ҽ�Ʒ��ﴦ�ó������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>24.����λҽ�Ʒ��ﴦ�÷�ʽ:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>25.����¯����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>26.����¯��������ʽ:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>27.ҽ�Ʒ��ﱾ��λ���������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>37.����������ʩ�����ף�:</td>
		<td class="td_viewcontent_content" style="width:35%" colspan="3">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>38.����������ʩ������������������/ʱ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>39.����������ʩ��Ͷ�ʣ���Ԫ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>40.����ʵ�ʴ��������������ף�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>41.����������ʩ���з��ã���Ԫ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>44.��ú�ҡ�¯���ռ���ʽ:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>45.����������ʩ����ʱ�䣨Сʱ��:</td>
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

<G:ListTable id="list1" runat="server">
<g:template id="temp11" type=head runat=server>
       <table cellpadding="2" cellspacing="1" border="0" width="100%" class="table_graybgcolor">
        <tr align="center">
		<td colspan="11" align="center" class="td_viewcontent_title_top" width="100%">��¯����״��</td>
	    </tr>
	    <tr>
	       <td width="12%" align="center"  class="td_viewcontent_title" >28.��¯���:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >29.Ͷ��ʱ�䣨��/�£�:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >30.����������ߣ�:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >31.����ʱ�䣨Сʱ��:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >32.ȼ�����ʹ���:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >33.ȼ������������/�����ף�:</td>
	       <td width="9%" align="center"  class="td_viewcontent_title" >34.ȼ�շ�ʽ����:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >35.ȼ����ݣ�%��:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >36.ȼ�ϻҷۣ�%��:</td>
	       <td width="12%" align="center"  class="td_viewcontent_title" >42.�����մ���:</td>
		<td width="12%"  class="td_viewcontent_title" nowrap>43.�������մ���:</td>
	    </tr>
	    </g:template>
    <G:template id="temp1" runat="server">
    <tr>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    </G:template>
    </G:ListTable>

    </form>
</body>
</html>
