<!--G101��ҵ��ҵ���������-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" Debug="true" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->

<script language="C#" runat="server">
    string hycode;
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
	hycode = GetQueryString("hycode", "");            
	string orgcode =  GetQueryString("orgcode", "");      
	tb_2.Visible = false;


	view.SqlStr = "select fld_" + mid + "_2,fld_" + mid + "_4,fld_" + mid + "_14,fld_" + mid + "_6,fld_" + mid + "_22,fld_" + mid + "_23,fld_" + mid + "_40,fld_" + mid + "_41,fld_" + mid + "_9,''as longitude,''as latitude,fld_" + mid + "_29,fld_" + mid + "_21,fld_" + mid + "_42,''as phone,fld_" + mid + "_10,fld_" + mid + "_19,fld_" + mid + "_30,fld_" + mid + "_31,(case fld_"+mid+"_32 when '' then '' else fld_"+mid+"_32+'='+(select fld_1157_2 from gmis_mo_1157 where fld_1157_1=fld_" + mid + "_32) end ) ,'' as corsize ,''as opendate,'' as newdate,fld_" + mid + "_38,fld_" + mid + "_39 ,fld_" + mid + "_15,fld_" + mid + "_24,fld_" + mid + "_25,fld_" + mid + "_43,fld_" + mid + "_20,fld_" + mid + "_11,fld_" + mid + "_16,fld_" + mid + "_17,fld_" + mid + "_18,fld_" + mid + "_26,fld_" + mid + "_27,fld_" + mid + "_28,fld_" + mid + "_12,fld_" + mid + "_13,fld_" + mid + "_34,fld_" + mid + "_35,fld_" + mid + "_36,fld_" + mid + "_37,fld_"+mid+"_33,(select fld_1162_2 from gmis_mo_1162 where fld_1162_1=fld_" + mid + "_33) as fld_" + mid + "_33_1 ,fld_"+mid+"_1 from gmis_mo_" + mid + " where 1=1 and fld_" + mid + "_1='"+orgcode+"'" ;
	
	DataTable dt = view.DataTable;
	if (dt.Rows.Count > 0)
	{		   
		dt.Rows[0]["longitude"] = dt.Rows[0]["fld_" + mid + "_16"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_17"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_18"].ToString() + "��";
		dt.Rows[0]["latitude"] = dt.Rows[0]["fld_" + mid + "_26"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_27"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_28"].ToString() + "��";
		if(dt.Rows[0]["fld_" + mid + "_13"].ToString()!="0")
		{
			dt.Rows[0]["phone"] = dt.Rows[0]["fld_" + mid + "_12"].ToString() + "-" + dt.Rows[0]["fld_" + mid + "_13"].ToString();
		}
		else   
		{
			dt.Rows[0]["phone"] = dt.Rows[0]["fld_" + mid + "_12"].ToString();
		}
		dt.Rows[0]["opendate"] = dt.Rows[0]["fld_" + mid + "_34"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_35"].ToString() + "��";
		if(dt.Rows[0]["fld_" + mid + "_36"].ToString()!="0"&&dt.Rows[0]["fld_" + mid + "_37"].ToString()!="0")
		{
			dt.Rows[0]["newdate"] = dt.Rows[0]["fld_" + mid + "_36"].ToString() + "��" + dt.Rows[0]["fld_" + mid + "_37"].ToString() + "��";
		}
		else 
		{
			dt.Rows[0]["newdate"]="";
		}
		dt.Rows[0]["corsize"]=dt.Rows[0]["fld_"+mid+"_33"].ToString()+"="+dt.Rows[0]["fld_"+mid+"_33_1"].ToString();

	} 
   
	iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
	
}  
               
	
</script>
<body style="padding: 10px; text-align: center" >
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
    <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
         <td style="width: 30%" rowspan="2">&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
                ��ҵ��ҵ���������
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            �Ʊ���أ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��׼���أ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            �ĺţ�
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ��Ч������
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr><td style="font-size:small; font-weight:normal; width:40%" align="center" >2007��</td></tr>
    </table>
    <G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
             
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        1.��λ���ƣ�
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        2.��λ���룺
                    </td>
                    <td class="td_viewcontent_content" style="width: 35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        3.���������ˣ�
                    </td>
                    <td class="td_viewcontent_content" style="width: 35%">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        4.��λ���ڵؼ���������
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        �����������룺
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        ʡ��
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ������
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        �أ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        �磺
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        �֡����ƺţ�
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        5.����λ��
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        ���ľ��ȣ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ����γ�ȣ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        6.���ڹ�ҵ԰�����ƣ�
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        7.��ϵ��ʽ
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        ���ţ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        �������룺
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        �绰���룺
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ������룺
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        ��ϵ��������
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        8.��ҵ���
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ��ҵ���룺
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        9.�Ǽ�ע�����ͣ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        10.��ҵ��ģ��
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        11.��ҵʱ�䣺
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        12.���¸�����ʱ�䣺
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        13.������ʱ�䣺
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        14.��ҵ�ܲ�ֵ(��Ԫ)��
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        ��λ�����ˣ�
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        ����ˣ�
                    </td>
                    <td class="td_viewcontent_content">
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
                        200*��*��*��&nbsp;
                    </td>
                </tr>
            </table>
        </G:Template>
    </G:Content>
    </form>
</body>
</html>
