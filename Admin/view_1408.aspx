<!--��ҵԴ-��ҵԴ�ղ����g109_1��-->

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
	string orgcode = GetQueryString("orgcode","");

	view1.SqlStr = "select fld_1396_2,fld_1396_4 ,fld_1396_1 from gmis_mo_1396 where fld_1396_1='"+orgcode+"'";
	list.SqlStr = "select fld_1420_3,fld_1420_4,fld_1420_5,fld_1420_6,fld_1420_7,fld_1420_8,fld_1420_9,fld_1420_10,fld_1420_11,fld_1420_12,fld_1420_13,fld_1420_14,fld_1420_15,fld_1420_16 from gmis_mo_1420 where fld_1420_1='"+orgcode+"'";
	list.Rows=list.DataTable.Rows.Count;
	view.SqlStr = "select fld_1408_19,fld_1408_2,fld_1408_3,'201'+cast(fld_1408_4 as varchar(20))+'��'+cast(fld_1408_5 as varchar(20))+'��'+cast(fld_1408_6 as varchar(20))+'��',fld_1408_1 from gmis_mo_1408 where fld_1408_1='"+orgcode+"'";
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
            <td style="width:40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
               ������Ⱦ�������ϵ�������
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            ��    �ţ�Gl09_1��
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
            <td align="center" class="td_viewcontent_title" width="9%" >
                1.��Ʒ����
            </td>
            <td align="center" class="td_viewcontent_title" width="9%" >
                2.ԭ������
            </td>
            <td align="center" class="td_viewcontent_title" width="10%">
                3.������������
            </td>
            <td align="center" class="td_viewcontent_title" width="8%" >
                4.������λ
            </td>
            <td align="center" class="td_viewcontent_title" width="4%" >
                5.��������
            </td>
            <td align="center" class="td_viewcontent_title" width="7%">
                6.������λ
            </td>
            <td align="center" class="td_viewcontent_title" width="5%">
                7.����ʹ����
            </td>
            <td align="center" class="td_viewcontent_title" width="8%" >
                8.��ˮ����������
            </td>
            <td align="center" class="td_viewcontent_title" width="8%" >
                9.��Ⱦ������
            </td>
            <td align="center" class="td_viewcontent_title" width="4%" >
                10.����ϵ��
            </td>
            <td align="center" class="td_viewcontent_title" width="4%">
                11.����ϵ��
            </td>
            <td align="center" class="td_viewcontent_title" width="8%">
                12.������λ
            </td>
            <td align="center" class="td_viewcontent_title" width="4%" >
                13.��Ⱦ��������
            </td>
            <td align="center" class="td_viewcontent_title" width="4%" >
                14.��Ⱦ���ŷ���
            </td>
        </tr>
        </G:Template>
            <G:Template id="templist"  runat="server">
            <tr >
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content">
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content">
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
                </td>
                <td align=center class="td_viewcontent_content" >
                    *
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
