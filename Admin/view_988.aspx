<!--����Դ-S401ס��ҵ������ҵ��ȾԴ�ղ��S401�� ��-->

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
        string  orgcode = GetQueryString("orgcode", "0");
        StringBuilder sb = new StringBuilder();
        sb.Append("select fld_988_2,fld_988_4,fld_988_9,fld_988_6,(fld_988_10+fld_988_52+fld_988_53+fld_988_54+fld_988_55),fld_988_11+'-'+cast(convert(decimal(11,0),fld_988_12) as varchar(20)),case when cast(fld_988_13 as varchar(20))='0' then '' else cast(fld_988_13 as varchar(20)) end,fld_988_14,fld_988_15,fld_988_16,fld_988_17+'='+fld_988_16,(cast(fld_988_18 as varchar(20))+'��'+cast(fld_988_19 as varchar(20))+'��'),fld_988_20,fld_988_56+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_988_56),fld_988_21,fld_988_22,fld_988_23,fld_988_24,fld_988_25,fld_988_26+'='+(select fld_652_2 from gmis_mo_652 where fld_652_1=fld_988_26),fld_988_57,fld_988_27+'='+(select fld_980_2 from gmis_mo_980 where fld_980_1=fld_988_27),fld_988_28,fld_988_58,fld_988_29,fld_988_30,fld_988_31,fld_988_32,fld_988_33,fld_988_34,fld_988_35,fld_988_36,fld_988_37,fld_988_38,");
        sb.Append(" fld_988_39,fld_988_40,(select fld_993_3 from gmis_mo_993 where fld_993_1=fld_988_1),(cast((select fld_993_4 from gmis_mo_993 where fld_993_1=fld_988_1) as varchar(20))+'��'+cast((select fld_993_5 from gmis_mo_993 where fld_993_1=fld_988_1) as varchar(20))+'��'),(select fld_993_6 from gmis_mo_993 where fld_993_1=fld_988_1),(select fld_993_7 from gmis_mo_993 where fld_993_1=fld_988_1),(select fld_993_8 from gmis_mo_993 where fld_993_1=fld_988_1)+'='+(select fld_783_2 from gmis_mo_783 where fld_783_1=(select fld_993_8 from gmis_mo_993 where fld_993_1=fld_988_1)),(select fld_993_9 from gmis_mo_993 where fld_993_1=fld_988_1),(select fld_993_10 from gmis_mo_993 where fld_993_1=fld_988_1)+'='+(select fld_785_2 from gmis_mo_785 where fld_785_1=(select fld_993_10 from gmis_mo_993 where fld_993_1=fld_988_1)),(select fld_993_11 from gmis_mo_993 where fld_993_1=fld_988_1),(select fld_993_12 from gmis_mo_993 where fld_993_1=fld_988_1),fld_988_41,fld_988_95,fld_988_42,fld_988_43,fld_988_44,(select fld_993_13 from gmis_mo_993 where fld_993_1=fld_988_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select fld_993_13 from gmis_mo_993 where fld_993_1=fld_988_1)),(select fld_993_14 from gmis_mo_993 where fld_993_1=fld_988_1)+'='+(select fld_623_2 from gmis_mo_623 where fld_623_1=(select fld_993_14 from gmis_mo_993 where fld_993_1=fld_988_1)),fld_988_59+'='+(select fld_1192_2 from gmis_mo_1192 where fld_1192_1=fld_988_59),fld_988_45,fld_988_46,fld_988_47,fld_988_48,'200'+(cast(fld_988_49 as varchar(20))+'��'+cast(fld_988_50 as varchar(20))+'��'+cast(fld_988_51 as varchar(20))+'��'),fld_988_62,fld_988_64,'200'+(cast(fld_988_66 as varchar(20))+'��'+cast(fld_988_67 as varchar(20))+'��'+cast(fld_988_69 as varchar(20))+'��'),fld_988_1 from gmis_mo_988 where fld_988_1='"+orgcode+"'");
        view.SqlStr=sb.ToString();
        iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;          
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
               ס��ҵ������ҵ��ȾԴ�ղ��
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            ��&nbsp;&nbsp;&nbsp;&nbsp;�ţ�S401��
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
                            ��&nbsp;&nbsp;&nbsp;&nbsp;�ţ���ͳ��[2007]124��
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
		<td width="100" align="right"  class="td_viewcontent_title_top">1.��λ����:</td>
		<td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
		</tr>
		<tr>
		<td width="100" align="right"  class="td_viewcontent_title_top">2.��λ����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title_top">3.����������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr align="center">
		<td colspan="4" align="center" class="td_viewcontent_title_top" style="line-height:25px" width="100%">4.��λ���ڵ���������</td>
	</tr>

		<tr>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>������������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>��λ���ڵ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		</tr>
		<tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">5.��ϵ��ʽ</td>
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
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>9.���������ռ���ʽ:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">��ˮ��ˮ��������ˮ���</td>
	</tr>
	<tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>10.��ˮ�������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>11.��ˮ������ʩ������������/�գ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>12.��ˮ������ʩ��Ͷ�ʣ���Ԫ��:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>13.��ˮʵ�ʴ��������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr><tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>14.��ˮ������ʩ���з���(��Ԫ):</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>15.��ˮ�����մ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>16.��ˮ�������������֣�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>17.��ˮȥ�����ʹ���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>18.����ˮ������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>19.����ˮ�����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">ס��ҵ�</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>20.���ݷ���ȼ�����:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>21.��λ�����ţ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>22.��ƽ����ס�ʣ�%��:</td>
		<td colspan="3" class="td_viewcontent_content" >*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">ס��ҵ����ϴȾ����ҵ�</td>
	    </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>23.ϴȾ�豸�����������:</td>
		<td colspan="3" class="td_viewcontent_content" >*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">ס��ҵ�����������ݱ�������ҵ�</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>24.���ݱ�����λ�����ţ�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>25.����λ��������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">ס��ҵ����ϴԡ����ҵ�</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>26.����ɣ���¹����������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>27.������λ��������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">����ҵ�</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>28.��Ӫ�����ƽ���ף�:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>29.��λ��������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>30.�̶���ͷ��������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>31.���̽�������������:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
        </tr>
        <tr align="center">
		<td colspan="4" align="center" style="line-height:25px" class="td_viewcontent_title_top" width="100%">��¯�������</td>
	    </tr>
	    <tr>
        <td width="100" align="right"  class="td_viewcontent_title" nowrap>32.��¯���:</td>
		<td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
		<td width="100" align="right"  class="td_viewcontent_title" nowrap>33.Ͷ��ʱ��:</td>
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
