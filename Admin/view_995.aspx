<!--����Դ-S402-->

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
        string orgcode = GetQueryString("orgcode", "0");
        hycode = GetQueryString("hycode", "");
        SetToolBar();
        StringBuilder sb = new StringBuilder();
        sb.Append("select fld_995_2,fld_995_4,fld_995_9,fld_995_6,(fld_995_10+fld_995_50+fld_995_51+fld_995_52+fld_995_54),fld_995_11+'-'+cast(convert(decimal(11,0),fld_995_12) as varchar(20)),case when cast(fld_995_13 as varchar(20))='0' then '' else cast(fld_995_13 as varchar(20)) end,fld_995_14,fld_995_15,fld_995_26,fld_995_31+'='+fld_995_26,cast(fld_995_32 as varchar(20))+'��'+cast(fld_995_39 as varchar(20))+'��',fld_995_42,fld_995_43,fld_995_53+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_995_53),fld_995_17,fld_995_18,fld_995_20,fld_995_21,fld_995_24,fld_995_29+'='+(select fld_653_2 from gmis_mo_653 where fld_653_1=fld_995_29),fld_995_56,fld_995_37+'='+(select fld_980_2 from gmis_mo_980 where fld_980_1=fld_995_37),fld_995_46,fld_995_55,fld_995_34,fld_995_38,fld_995_45,fld_995_36,fld_995_49,fld_995_69,fld_995_47,fld_995_30,fld_995_68,fld_995_35,fld_995_41,(select fld_1001_3 from gmis_mo_1001 where fld_1001_1=fld_995_1),cast((select fld_1001_4 from gmis_mo_1001 where fld_1001_1=fld_995_1) as varchar(20))+'��'+cast((select fld_1001_5 from gmis_mo_1001 where fld_1001_1=fld_995_1) as varchar(20))+'��',(select fld_1001_6 from gmis_mo_1001 where fld_1001_1=fld_995_1),(select fld_1001_7 from gmis_mo_1001 where fld_1001_1=fld_995_1),");
        sb.Append("(select fld_1001_8 from gmis_mo_1001 where fld_1001_1=fld_995_1)+'='+(select fld_783_2 from gmis_mo_783 where fld_783_1=(select fld_1001_8 from gmis_mo_1001 where fld_1001_1=fld_995_1)),(select fld_1001_9 from gmis_mo_1001 where fld_1001_1=fld_995_1),(select fld_1001_10 from gmis_mo_1001 where fld_1001_1=fld_995_1)+'='+(select fld_784_2 from gmis_mo_784 where fld_784_1=(select fld_1001_10 from gmis_mo_1001 where fld_1001_1=fld_995_1)),(select fld_1001_11 from gmis_mo_1001 where fld_1001_1=fld_995_1),(select fld_1001_12 from gmis_mo_1001 where fld_1001_1=fld_995_1),fld_995_16,fld_995_58,fld_995_19,fld_995_23,fld_995_25,(select fld_1001_13 from gmis_mo_1001 where fld_1001_1=fld_995_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select fld_1001_13 from gmis_mo_1001 where fld_1001_1=fld_995_1)),(select fld_1001_14 from gmis_mo_1001 where fld_1001_1=fld_995_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select fld_1001_14 from gmis_mo_1001 where fld_1001_1=fld_995_1)),fld_995_57+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_995_57),fld_995_44,fld_995_22,fld_995_27,fld_995_28,'200'+cast(fld_995_33 as varchar(20))+'��'+cast(fld_995_40 as varchar(20))+'��'+cast(fld_995_48 as varchar(20))+'��',fld_995_61,fld_995_62,'200'+cast(fld_995_65 as varchar(20))+'��'+cast(fld_995_66 as varchar(20))+'��'+cast(fld_995_70 as varchar(20))+'��',fld_995_1 from gmis_mo_995 where fld_995_1='"+orgcode+"'");
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
        <tr><td width="30%">&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               ����������������ҵ��ȾԴ�ղ��
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            ��    &nbsp;&nbsp;&nbsp;�ţ�S402��
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
                            ��&nbsp;&nbsp;&nbsp;   �ţ���ͳ��[2007]124��
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
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>8.��Ӫ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>9.��Ӫ�����ƽ���ף�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>10.���������ռ���ʽ:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">��ˮ��ˮ��������ˮ���</td>
	</tr>
	<tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>11.��ˮ�������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>12.��ˮ������ʩ������������/�գ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>13.��ˮ������ʩ��Ͷ�ʣ���Ԫ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>14.��ˮʵ�ʴ��������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>15.��ˮ������ʩ���з���(��Ԫ):</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>16.��ˮ�����մ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>17.��ˮ�������������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>18.��ˮȥ�����ʹ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>19.����ˮ������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>20.����ˮ�����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        
        
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">ϴȾ����ҵ�</td>
	    </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>21.ϴȾ�豸�����������:</td>
		<td colspan="3" class="td_viewcontent_content" >*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">�������ݱ�������ҵ�</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>22.���ݱ�����λ�����ţ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>23.����λ��������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">ϴԡ����ҵ�</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>24.����ɣ���¹����������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>25.������λ��������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">��Ӱ��ӡ����ҵҵ�</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>26.��ӡ�豸����������/Сʱ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>27.��ƽ����ӡ��Ƭ������/�죩:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">������Ħ�г�ά���뱣������ҵ��ϴ��ҵ���</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>28.��λ��������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>29.רҵϴ���豸��ѹ����̨����̨����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>30.רҵϴ���豸��ѹ�����ܹ��ʣ�ǧ�ߣ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>31.������ˮ�����֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" width="100%">��¯����״��</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>32.��¯���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>33.Ͷ��ʱ�䣨��/�£�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>34.����������ߣ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>35.����ʱ�䣨Сʱ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>36.ȼ�����ʹ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>37.ȼ������������/�����ף�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>38.ȼ�շ�ʽ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>39.ȼ����ݣ�%��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>40.ȼ�ϻҷۣ�%��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>41.����������ʩ�����ף�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>42.����������ʩ������������������/ʱ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>43.����������ʩ��Ͷ�ʣ���Ԫ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>44.����ʵ�ʴ��������������ף�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>45.����������ʩ���з��ã���Ԫ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>46.�����մ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>47.�������մ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>48.��ú�ҡ�¯���ռ���ʽ:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>49.����������ʩ����ʱ�䣨Сʱ��:</td>
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
