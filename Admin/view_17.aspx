<!--���ݹ���-��ȾԴ�����������-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string hycode = "";//��ҵ
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
    string h_tcode=GetQueryString("h_tcode","0");
    string h_fcode = GetQueryString("fcode", "0");
    if (h_fcode != "0" && h_fcode != "")
    {
        tb_backlist.Visible = false;
    }
  
    tb_2.Visible=false;
    if(aid=="list")
	{
		tb_backlist.Visible=false;
        tb_2.Visible = false;
	}
	string orgcode = GetQueryString("orgcode", "0"); //��ȡ��λ����
    if (orgcode != "0")
    {
        filter = " and fld_17_1='" + orgcode + "'";
        db.SqlString = "select mocode from gmis_mo_17 where 1=1 "+filter;
        if (db.GetDataTable().Rows.Count > 0)
        {
            id = db.GetDataTable().Rows[0][0].ToString();
        }
    }
    else
    {
        filter = " and mocode=" + id;
    }
    string h_sql = "select fld_17_1,fld_17_3,fld_17_4,fld_17_2,fld_17_18,fld_17_19,fld_17_16,fld_17_17,fld_17_6,(select fld_1201_1 from gmis_mo_1201 where gmis_mo_1201.mocode=fld_17_5),(select fld_44_1 from gmis_mo_44 where gmis_mo_44.mocode=fld_17_7),''as hy";
    h_sql += ",(select fld_47_1 from gmis_mo_47 where gmis_mo_47.mocode=fld_17_9),(select fld_48_1 from gmis_mo_48 where gmis_mo_48.mocode=fld_17_10),(select fld_49_1 from gmis_mo_49 where gmis_mo_49.mocode=fld_17_11),(select fld_50_1 from gmis_mo_50 where gmis_mo_50.mocode=fld_17_12),(select fld_51_1 from gmis_mo_51 where gmis_mo_51.mocode=fld_17_13),(select fld_52_1 from gmis_mo_52 where gmis_mo_52.mocode=fld_17_15),fld_17_14,mocode,fld_17_8 from gmis_mo_17 where 1=1 " + filter; 
    
    DataTable dt = db.GetDataTable(db.ConnStr,h_sql);

   
    //������ҵ
    if(dt!=null&&dt.Rows.Count>0)
    {
        db.SqlString = "select fld_1200_1 from gmis_mo_1200 where fld_1200_8 in (" + dt.Rows[0]["fld_17_8"].ToString() + ")";
        DataTable dtt = db.GetDataTable();
        string h_hy = "";
        foreach (DataRow drr in dtt.Rows)
        {
            h_hy += drr["fld_1200_1"].ToString() + ",";
        }
        dt.Rows[0]["hy"] += h_hy.Trim(',');
        if (id != "0")
        {
            orgcode = dt.Rows[0]["fld_17_1"].ToString();
        }
        view.DataTable = dt;
    }
   
    iframe_17.Attributes["src"] = "iframe_658.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid=" + mid + "&orgcode=" +StringUtility.StringToBase64(orgcode)+"&h_tcode="+h_tcode+"&fcode="+h_fcode ;

        
}
</script>

<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td>
<iframe id="iframe_17"  runat="server" frameborder="0"  width="100%" height="30" scrolling="no"></iframe>
</td></tr></table>
<div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar_17.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
</div>
<!--����������-->

<!--����-->
<G:Content ID="view" runat="server">
<G:Template id="tempview" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    
    <tr>
	    <td align="right"  class="td_viewcontent_title">��λ��ţ�</td>
	    <td class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	     <td align="right"  class="td_viewcontent_title">&nbsp;</td>
	    <td class="td_viewcontent_content"  style="width:35%">&nbsp;</td>
	   
    </tr>
    <tr> <td align="right"  class="td_viewcontent_title">��λ���ƣ�</td>
	    <td class="td_viewcontent_content" colspan="3">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��λ��ַ��</td>
	    <td colspan="3" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��ҵ���˴��룺</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">����������</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">���˵绰��</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">&nbsp;</td>
	    <td class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��λ������ϵ�ˣ�</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">��λ������ϵ�绰��</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">����������</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">���ڽֵ�����</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��ϽȨ�ޣ�</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">������ҵ��</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">������ϵ��</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">���ܲ��ţ�</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">ˮ��ȾԴ����</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">������ȾԴ����</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">Σ����ȾԴ����</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">��ˮ�������</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">���ܲ�ֵ��</td>
	    <td class="td_viewcontent_content">*&nbsp;</td>
	    <td align="right"  class="td_viewcontent_title">&nbsp;</td>
	    <td class="td_viewcontent_content">&nbsp;</td>
    </tr>
    
</table>
</G:Template> 
</G:Content> 
<!--��̬���ɽ���-->
</form>
</body>
</html>