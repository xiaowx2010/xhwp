<!--��ҵ��ҵ��Ⱦ������Ŀ�������  �����3��,�༭ҳ-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="javascript" src="common.js"></script>
<script language="C#" runat="server">
    string p_year="",p_code="",p_name="",p_table="";//updataΪ�޸ģ�insertΪ����
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 

        mid = GetQueryString("mid", "0");
        id = GetQueryString("id", "0");
        if (id != "0")
        {
        }
        db.SqlString= "select fld_1153_4,fld_1153_5,fld_1153_6,fld_1153_7,fld_1153_8,fld_1153_9,fld_1153_10,fld_1153_11,fld_1153_12,fld_1153_13,fld_1153_14,fld_1153_15,fld_1153_1+'��' as p_year,fld_1202_2 as p_code,fld_1202_1 as p_name from " + GetModuleTableName("1153") + " left outer join gmis_mo_1202 on fld_1202_2=fld_1153_2 where fld_1153_1 in (select fld_1153_1 from " + GetModuleTableName("1153") + " where mocode=" + id + ") and fld_1153_2 in (select fld_1153_2 from " + GetModuleTableName("1153") + " where mocode=" + id + ")";
        //list_table.SqlStr=db.SqlString;
        int[] p_heji = new int[] { 0, 0, 0, 0, 0, 0, 0 };//�ϼ�
        string p_hejihang = "";
        DataTable dt = db.GetDataTable();
        foreach (DataRow dr in dt.Rows)//��ֵ����
        {
            p_year = dr["p_year"].ToString();
            p_code = dr["p_code"].ToString();
            p_name = dr["p_name"].ToString();
            p_table += "<tr><td height=\"30\" align=\"center\" class=\"td_viewcontent_content\">" + dr["fld_1153_4"].ToString() + "&nbsp;</td>";
            for (int i = 5; i < 16; i++)
            {
                p_table += "<td align=\"center\" class=\"td_viewcontent_content\">" + dr["fld_1153_"+i].ToString() + "&nbsp;</td>";
            }
            p_table += "</tr>";
            for (int i = 8; i < 15; i++)
            {
                p_heji[i-8] += Convert.ToInt32(dr["fld_1153_"+i].ToString());
            }
        }
        for (int j = 8 - dt.Rows.Count; j > 0; j--)//�������
        {
            p_table += "<tr><td height=\"30\" align=\"center\" class=\"td_viewcontent_content\">&nbsp;</td>";
            for (int i = 5; i < 16; i++)
            {
                p_table += "<td align=\"center\" class=\"td_viewcontent_content\">&nbsp;</td>";
            }
            p_table += "</tr>";
        }
        //�ϼ���
        p_hejihang += "<tr><td align=\"center\" class=\"td_viewcontent_content\">�ϼ�(���°���Ŀ����) </td>";
        p_hejihang += "<td align=\"center\" class=\"td_viewcontent_content\">&nbsp;</td>";
        p_hejihang += "<td align=\"center\" class=\"td_viewcontent_content\">&nbsp;</td>";
        p_hejihang += "<td align=\"center\" class=\"td_viewcontent_content\">&nbsp;</td>";
        for (int i = 8; i < 15; i++)
        {
            p_hejihang += "<td align=\"center\" class=\"td_viewcontent_content\">" + p_heji[i - 8].ToString() + "&nbsp;</td>";
        }
        p_hejihang += "<td align=\"center\" class=\"td_viewcontent_content\">&nbsp;</td></tr>";
        //Response.Write(list_table.SqlStr);
        p_table =p_hejihang+p_table+ "</table>";

    }
</script>


<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<table><tr><td>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
      <tr>
        <td align="center" class="font_2635B_000">��ҵ��ҵ��Ⱦ������Ŀ�������</td>
      </tr>
    </table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td align="right"  class="td_viewcontent_title" width="15%"> ͳ�����:</td>
      <td align="left" class="td_viewcontent_content" width="35%">
        <%=p_year %>&nbsp;
      </td>
      <td align="right"  class="td_viewcontent_title" width="15%"> ��ҵ���˴���</td>
      <td align="left" class="td_viewcontent_content"><%=p_code %>&nbsp;
      </td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title" nowrap width="15%">���λ��ϸ���ƣ����£�</td>
      <td colspan="3" align="left" class="td_viewcontent_content"><%=p_name %>&nbsp;
      </td>
    </tr>
</table>
<%--<G:ListTable ID="list_table" Rows="8" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">--%>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2"  align="center" class="td_viewcontent_title"> ��Ⱦ����<br>
      ��Ŀ���� </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title"> �������� </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">�������� </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title"> ����Ͷ������ </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">�ƻ���Ͷ��<br>
      (��Ԫ) </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��������ۼ����Ͷ��(��Ԫ) </td>
      <td colspan="5"  align="center" class="td_viewcontent_title"> �������Ͷ�ʼ��ʽ���Դ(��Ԫ) </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">������Ŀ��ƻ������������� </td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title"> �ϼ� </td>
      <td align="center" class="td_viewcontent_title">���۷Ѳ��� </td>
      <td align="center" class="td_viewcontent_title"> ������������ </td>
      <td align="center" class="td_viewcontent_title">��ҵ�Գ� </td>
      <td align="center" class="td_viewcontent_title"> ���д��� </td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content"> �� </td>
      <td align="center" class="td_viewcontent_content"> �� </td>
      <td align="center" class="td_viewcontent_content">1</td>
      <td align="center" class="td_viewcontent_content">2</td>
      <td align="center" class="td_viewcontent_content">3</td>
      <td align="center" class="td_viewcontent_content">4</td>
      <td align="center" class="td_viewcontent_content">5</td>
      <td align="center" class="td_viewcontent_content">6</td>
      <td align="center" class="td_viewcontent_content">7</td>
      <td align="center" class="td_viewcontent_content">8</td>
      <td align="center" class="td_viewcontent_content">9</td>
      <td align="center" class="td_viewcontent_content">10</td>
    </tr><%=p_table %>
<%--    <tr>
      <td align="center" class="td_viewcontent_content">�ϼ�(���°���Ŀ����) </td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td id="fld_1153_8" align="center" class="td_viewcontent_content">&nbsp;</td>
      <td id="fld_1153_9" align="center" class="td_viewcontent_content">&nbsp;</td>
      <td id="fld_1153_10" align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_11">&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_12">&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_13">&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_14">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
    </G:Template>
	<G:Template id="listtemp1" runat="server">
    <tr>
      <td height="30" align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_7_1">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_8_1">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_9_1">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_10_1">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_11_1">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_12_1">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_13_1">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_14_1">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</G:Template>
<G:Template id="listtemp2" runat="server">
    <tr>
      <td height="30" align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
</G:Template></G:ListTable>--%>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">˵����1. �����ѿ���Ͷ��ʹ�õ���Ŀ������������뽨����Ŀ������������ͬʱ���������Ŀ�����<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. �������ʹ���:&nbsp;1-��ҵ��ˮ����&nbsp;&nbsp;&nbsp;2-ȼ��ȼ�շ�������&nbsp;&nbsp;&nbsp;3-���շ�������(����ҵ�۳�����)&nbsp;&nbsp;&nbsp;4-��ҵ�����������&nbsp;&nbsp;&nbsp;5-�����������񶯣�
          &nbsp;6-��ŷ�������&nbsp;&nbsp;&nbsp;&nbsp;7-�������� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;8-��Ⱦ��Ǩ����&nbsp;&nbsp;&nbsp;9-�����������ۺϷ��Σ�
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        3. ��ˮ�������������λΪ��/�գ������������������λΪ��������/ʱ����������������������λΪ��/�գ�����������͡��ֱ���ֵ��<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. ָ����ϵ�� 4��5, 5=6+7+8,8��9 </td>
    </tr></table>
    </td></tr></table>
<!--��̬����html,����-->
</form>
</body>
</html>
