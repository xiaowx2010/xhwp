<!--��ҵԴ-��ҵԴ�ղ����g105_1��-->

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

string hycode;//��ҵ

private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();
	hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");
	view1.SqlStr = "select fld_1396_2,fld_1396_4,fld_1396_1 from gmis_mo_1396 where fld_1396_1=(select fld_1401_1 from gmis_mo_1401 where mocode="+id+")";
	list.SqlStr = "select fld_1413_3,fld_1413_4,fld_1413_5,fld_1413_6,fld_1413_7,fld_1413_8,fld_1413_9,fld_1413_10,fld_1413_11,fld_1413_12,fld_1413_13,fld_1413_14,fld_1413_15,fld_1413_16 from gmis_mo_1413 where fld_1413_1='"+orgcode+"'";
	view.SqlStr = "select fld_1401_19,fld_1401_2,fld_1401_3,'201'+cast(fld_1401_4 as varchar(20))+'��'+cast(fld_1401_5 as varchar(20))+'��'+cast(fld_1401_6 as varchar(20))+'��' from gmis_mo_1401 where fld_1401_1='"+orgcode+"'";
	list.Rows = list.DataTable.Rows.Count;
	iframe_1396.Attributes["src"]="iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
}

</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--ѡ�-->
        <table width="100%">
            <tr>
                <td>
<iframe id="iframe_1396"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
        <td style="width: 30%" >&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               ��ˮ��Ⱦ�������ϵ�������
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            ��    �ţ�Gl05_1��
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �Ʊ���أ�����������
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼���أ�����ͳ�ƾ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼�ĺţ���ͳ��[2009]113��
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
        <tr><td  colspan=3 style="font-size:small; font-weight:normal; width:40%" align="center" >2010��</td></tr>
    </table>
    <g:Content id=view1 runat=server >
        <g:template id=tempview1 runat=server>
            <table border="0" cellpadding="3" width="100%" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        ��λ���ƣ����£���
                    </td>
                    <td class="td_viewcontent_content" style="width:33%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ��λ���룺
                    </td>
                    <td class="td_viewcontent_content" style="width:33%">
                        *&nbsp;
                    </td>
                </tr>
                </table>
        </g:template>
    </g:Content>
    <G:ListTable id="list" runat="server" >
    <G:Template id="listtemphead" type="head" runat="server">

    <table width="100%" border="0" cellpadding="1" cellspacing="1"   style="margin-top: 10px;" class="table_graybgcolor">
        <tr align="center" >
            <td align="center" class="td_viewcontent_title" width="8%" >
                1.��Ʒ����
            </td>
            <td align="center" class="td_viewcontent_title" width="10%" >
                2.ԭ������
            </td>
            <td align="center" class="td_viewcontent_title" width="11%" >
                3.������������
            </td>
            <td align="center" class="td_viewcontent_title" width="8%" >
                4.������λ
            </td>
            <td align="center" class="td_viewcontent_title" >
                5.��������
            </td>
            <td align="center" class="td_viewcontent_title" width="8%">
                6.������λ
            </td>
            <td align="center" class="td_viewcontent_title" width="8%">
                7.����ʹ����
            </td>
            <td align="center" class="td_viewcontent_title" width="7%" >
                8.��ˮ����������
            </td>
            <td align="center" class="td_viewcontent_title" width="7%" >
                9.��Ⱦ������
            </td>
            <td align="center" class="td_viewcontent_title" >
                10.����ϵ��
            </td>
            <td align="center" class="td_viewcontent_title">
                11.����ϵ��
            </td>
            <td align="center" class="td_viewcontent_title" width="11%" >
                12.������λ
            </td>
            <td align="center" class="td_viewcontent_title" >
                13.��Ⱦ��������
            </td>
            <td align="center" class="td_viewcontent_title" >
                14.��Ⱦ���ŷ���
            </td>
        </tr>
        </G:Template>
            <G:Template id="templist"  runat="server">
            <tr >
                <td align=center class="td_viewcontent_content"  >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content">
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content"  >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
                <td align=center class="td_viewcontent_content" >
                    *&nbsp;
                </td>
            </tr>
              </G:Template>
        </table>
   </G:ListTable>
   <g:Content id="view" runat=server>
    <g:template id="tempview" runat=server>
        <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        ��λ�����ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ����ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                </tr>
                 <tr>
                    <td align="right" class="td_viewcontent_title">
                        ����ˣ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ������ڣ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
            </table>
    </g:template>
   </g:Content>
    </form>
</body>
</html>
