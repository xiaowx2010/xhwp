<!--�����ҵ��Ⱦ�ŷż������������  �����1-2��,�༭ҳ-->
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
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����

        mid = GetQueryString("mid", "0");
        id = GetQueryString("id", "0");

        db.SqlString = "select fld_1149_2,fld_1149_5,fld_1149_6,fld_1149_7,fld_1149_8,fld_1149_9,fld_1149_10,fld_1149_11,fld_1149_4,(select fld_1194_1 from gmis_mo_1194 where gmis_mo_1194.mocode=fld_1149_93),fld_1149_12,fld_1149_16,fld_1149_19,(select fld_1157_2 from gmis_mo_1157 where fld_1149_21=fld_1157_1),fld_1149_13,fld_1149_17,fld_1149_14,fld_1149_18,(select fld_1175_2 from gmis_mo_1175 where fld_1149_22=fld_1175_1),fld_1149_15,(select (fld_1195_1+'|'+fld_1195_2) as fld_1195_view from gmis_mo_1195 where fld_1195_1=fld_1149_20),fld_1149_23,(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1149_24),(select fld_1164_2 from gmis_mo_1164 where fld_1164_1=fld_1149_25),fld_1149_26,fld_1149_27,(select fld_1175_2 from gmis_mo_1175 where fld_1175_1=fld_1149_28),fld_1149_92,fld_1149_35,fld_1149_43,fld_1149_44,fld_1149_29,fld_1149_36,fld_1149_45,fld_1149_46,fld_1149_30,fld_1149_37,fld_1149_47,fld_1149_31,fld_1149_38,fld_1149_48,fld_1149_32,fld_1149_39,fld_1149_49,fld_1149_33,fld_1149_40,fld_1149_50,fld_1149_34,fld_1149_41,fld_1149_42,fld_1149_51,fld_1149_52,fld_1149_65,fld_1149_77,fld_1149_53,fld_1149_66,fld_1149_78,fld_1149_54,fld_1149_79,fld_1149_67,fld_1149_80,fld_1149_55,fld_1149_68,fld_1149_81,fld_1149_56,fld_1149_69,fld_1149_82,fld_1149_57,fld_1149_70,fld_1149_83,fld_1149_58,fld_1149_84,fld_1149_59,fld_1149_71,fld_1149_85,fld_1149_60,fld_1149_72,fld_1149_86,fld_1149_61,fld_1149_73,fld_1149_87,fld_1149_62,fld_1149_74,fld_1149_88,fld_1149_75,fld_1149_89,fld_1149_63,fld_1149_76,fld_1149_90,fld_1149_64,fld_1149_91,fld_1149_1 from " + GetModuleTableName("1149") + " where mocode=" + id;
        //view_1149.SqlStr = db.SqlString;
        DataTable dt = db.GetDataTable();
        view_1149.DataTable = dt;

        db.SqlString = "select fieldname,caption from gmis_field where modulecode=1150 and fieldcode>26140";
        //db.SqlString = "select fld_1150_5,fld_1150_6,fld_1150_7,fld_1150_8,fld_1150_9,fld_1150_10,fld_1150_11,fld_1150_12,fld_1150_13,fld_1150_14,fld_1150_15,fld_1150_16,fld_1150_17,fld_1150_18,fld_1150_19,fld_1150_20,fld_1150_21,fld_1150_22,fld_1150_23,fld_1150_24,fld_1150_25,fld_1150_26,fld_1150_27,fld_1150_28,fld_1150_29,fld_1150_30,fld_1150_31,fld_1150_32,fld_1150_33,fld_1150_34,fld_1150_35,fld_1150_36,fld_1150_37,fld_1150_38,fld_1150_39,fld_1150_40,fld_1150_41,fld_1150_42 from " + GetModuleTableName("1150") + " where fld_1150_1='" + dt.Rows[0]["fld_1149_1"] + "' and fld_1150_2='" + dt.Rows[0]["fld_1149_2"] + "'";
        dt = db.GetDataTable();
        
        string strhtml = "";
        if (dt != null && dt.Rows.Count > 0)
        {
            strhtml+="<table width=\"100%\" id=\"table4\"  border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" class=\"table_graybgcolor\" style=\"margin-bottom:5px; \" >";
            foreach (DataRow row in dt.Rows)
            {
                strhtml += "<tr><td align=\"center\"  class=\"td01_viewcontent_content\">����</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_title\">" + row["caption"].ToString() + "</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">������λ</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ�ϼ�</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ����һ</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ�����</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ������</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ������</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ������</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ������</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ������</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ�����</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ�����</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">��ȡ����ʮ</td>";
                strhtml += "</tr>";
            }
            strhtml += "</table>";
        }
        listhtml.InnerHtml = strhtml;
        
        //Array p_contentarray=new ArrayList[][];
        //string[][] p_contentarray = new string[38][];
        //int[] p_contentarrayi=new int[38];
        /*
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                for (int j = 0; j < 38; j++)
                {

                    //p_contentarray[j][i] = dt.Rows[i][j].ToString();
                    //p_contentarray1[j] = dt.Rows[j][i].ToString(); 
                }
            }
        }*/
            //Response.Write(db.SqlString);
        //view_1150.DataTable = biaogezhuanzhi(db.SqlString,38,10);

        //BindListControl(fld_1149_21, "fld_1157_1", "fld_1157_2", "select fld_1157_1,fld_1157_2 from gmis_mo_1157");//�Ǽ�ע������
        //BindListControl(fld_1149_22, "fld_1175_1", "fld_1175_2", "select fld_1175_1,fld_1175_2 from gmis_mo_1175");//�������Ź�˾
        //BindListControl(fld_1149_20, "fld_1195_1", "fld_1195_view", "select fld_1195_1,(fld_1195_1+'|'+fld_1195_2) as fld_1195_view from gmis_mo_1195");//�����������--
        //BindListControl(fld_1149_24, "fld_1165_1", "fld_1165_2", "select fld_1165_1,fld_1165_2 from gmis_mo_1165");//��ˮȥ������
        //BindListControl(fld_1149_25, "fld_1164_1", "fld_1164_2", "select fld_1164_1,fld_1164_2 from gmis_mo_1164");//����ˮ�����
        //BindListControl(fld_1149_28, "fld_1175_1", "fld_1175_2", "select fld_1175_1,fld_1175_2 from gmis_mo_1175");//������ˮ����������--
        //BindListControl(fld_1149_93, "mocode", "fld_1194_1", "select mocode,fld_1194_1 from gmis_mo_1194");//�ص���ȾԴ��ʶ
    }
    
    //�������ת��
    private DataTable biaogezhuanzhi(string sqlstring, int obj_rows, int obj_cols)
    {
        SqlDB temp_db = new SqlDB();
        temp_db.SqlString = sqlstring;
        DataTable dt, dtt;
        dt = db.GetDataTable();
        DataTable ndt = new DataTable();
        ndt.Columns.Add("cols_1");
        ndt.Columns.Add("cols_2");
        ndt.Columns.Add("cols_3");
        ndt.Columns.Add("cols_4");
        ndt.Columns.Add("cols_5");
        ndt.Columns.Add("cols_6");
        ndt.Columns.Add("cols_7");
        ndt.Columns.Add("cols_8");
        ndt.Columns.Add("cols_9");
        ndt.Columns.Add("cols_10");
        //foreach (DataRow dr in dt.Rows)
        foreach(DataColumn dc in dt.Columns)
        {
            //for (int i = 0; i < obj_rows; i++)
            //{
            //ndt.Rows.Add(dc.Table);
            //}
        }
        return ndt;
    }

</script>
<script>
function Fold(str)
{
    document.getElementById("table"+str).style.display="block";
    document.getElementById("td"+str).innerHTML="<img src=\"images/node_closed.gif\" onclick=\"unFold('"+str+"')\" onmouseover=\"this.style.cursor='hand';\"  width=\"17\" height=\"17\" >";
}
function unFold(str)
{
    document.getElementById("table"+str).style.display="none";
    document.getElementById("td"+str).innerHTML="<img src=\"images/node_opened.gif\" onclick=\"Fold('"+str+"')\" onmouseover=\"this.style.cursor='hand';\"  width=\"17\" height=\"17\" >";
    
}
</script>


<body style="padding:10px;text-align:center"><%----%>
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
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><!--��ͷ-->
            <table width="100%">
                <tr>
                    <td align="center" valign="middle" style="font-size:large; font-weight:bolder;">�����ҵ��Ⱦ�ŷż������������</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td><!--��ͷ--> 
<G:Content id="view_1149" runat="server">
<G:Template id="Template1149" runat="server">     
            <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td rowspan="2" align="right"  class="td01_viewcontent_title">1����ҵ���˴���</td>
      <td rowspan="2" align="left"  class="td_viewcontent_content">*&nbsp;
      </td>
      <td rowspan="2" align="right"  class="td01_viewcontent_title">3��������</td>
      <td rowspan="2" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="right"  class="td01_viewcontent_title">4����ҵ����λ��</td>
      <td class="td_viewcontent_content">���ľ���
      *&nbsp;
      *&nbsp;
      *&nbsp;
      </td>
    </tr>
    <tr>
      <td class="td_viewcontent_content">����γ��
      *&nbsp;
      *&nbsp;
      *&nbsp;
        </td>
    </tr>
    <tr>
      <td align="right"  class="td01_viewcontent_title">2����ҵ��ϸ����</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;
</td>
      <td align="right"  class="td01_viewcontent_title">�ص���ȾԴ��ʶ</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;
        </td>
    </tr>
    <tr>
      <td rowspan="4" align="right"  class="td01_viewcontent_title">5�����˼���ϵ��</td>
      <td align="left"  class="td_viewcontent_content">��&nbsp;&nbsp;&nbsp;&nbsp;��
      *&nbsp;
      *&nbsp;
      </td>
      <td rowspan="3" align="right"  class="td01_viewcontent_title">6����ҵ��ϸ��ַ����������</td>
      <td rowspan="3" align="left"  class="td_viewcontent_content">*&nbsp;
     </td>
      <td rowspan="2" align="right"  class="td01_viewcontent_title">7���Ǽ�ע������</td>
      <td rowspan="2" class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="left"  class="td_viewcontent_content">��&nbsp;&nbsp;&nbsp;&nbsp;��
      *&nbsp;
      *&nbsp;
      </td>
    </tr>
    <tr>
      <td align="left"  class="td_viewcontent_content">��&nbsp;&nbsp;&nbsp;&nbsp;��
      *&nbsp;
      *&nbsp;
      </td>
      <td align="right"  class="td01_viewcontent_title">8���������Ź�˾</td>
      <td class="td_viewcontent_content">*&nbsp;
</td>
    </tr>
    <tr>
      <td align="left"  class="td_viewcontent_content">��������*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">�����������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;
      </td>
      <td align="right"  class="td_viewcontent_title">9����ҵʱ��</td>
      <td class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="right"  class="td01_viewcontent_title">10����ˮȥ������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td01_viewcontent_title">11������ˮ�����</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td01_viewcontent_title">����ˮ������</td>
      <td class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="right"  class="td01_viewcontent_title">12��������ˮ���������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td01_viewcontent_title">������ˮ����������</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td01_viewcontent_title">��ҵ���</td>
      <td class="td_viewcontent_content">*&nbsp;
    </td>
    </tr>
</table>
            <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td01_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">�����1-2��</td>
            <td width="21" id="td1"><img src="images/node_closed.gif" onclick="unFold('1')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table id="table1" width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title">һ����ҵ�������</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">7</td>
      <td align="center"  class="td01_viewcontent_title">5��ȼ��úƽ�����</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">14</td>
      <td align="center"  class="td01_viewcontent_title">���У��̳��ŷŴ���</td>
      <td align="center"  class="td01_viewcontent_content">̨/����</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;/*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_title">1����ҵ�ܲ�ֵ���ּۣ�</td>
      <td align="center"  class="td01_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
      <td align="center"  class="td01_viewcontent_content">8</td>
      <td align="center"  class="td01_viewcontent_title">6��ȼ��úƽ���ҷ�</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">15</td>
      <td align="left"  class="td01_viewcontent_title">�����������������ŷŴ���</td>
      <td align="center"  class="td01_viewcontent_content">̨/����</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;/*&nbsp;
    </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">2</td>
      <td align="center"  class="td01_viewcontent_title">2�������ϡ��ۺ����ò�Ʒ��ֵ</td>
      <td align="center"  class="td01_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">9</td>
      <td align="center"  class="td01_viewcontent_title">7��ȼ��ú�ӷ���</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">16</td>
      <td align="center"  class="td01_viewcontent_title">12����ˮ�ŷſ���</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">3</td>
      <td align="center"  class="td01_viewcontent_title">3����ҵרְ������Ա��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">10</td>
      <td align="center"  class="td01_viewcontent_title">8����λ������</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��/ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">17</td>
      <td align="center"  class="td01_viewcontent_title">13��ֱ�ź�����ˮ�ŷſ���</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">4</td>
      <td align="center"  class="td01_viewcontent_title">4����ҵ��ˮ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">11</td>
      <td align="center"  class="td01_viewcontent_title">9������ƽ�����</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">18</td>
      <td align="center"  class="td01_viewcontent_title">14����ˮ���߼����������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">5</td>
      <td align="center"  class="td01_viewcontent_title">������ˮ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">12</td>
      <td align="center"  class="td01_viewcontent_title">��10��������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">19</td>
      <td align="center"  class="td01_viewcontent_title">15���������߼����������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">6</td>
      <td align="center"  class="td01_viewcontent_title">�ظ���ˮ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">13</td>
      <td align="center"  class="td01_viewcontent_title">11����¯��</td>
      <td align="center"  class="td01_viewcontent_content">̨/����</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;/*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">20</td>
      <td align="center"  class="td01_viewcontent_title">16���������װ����</td>
      <td align="center"  class="td01_viewcontent_content">��ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
            <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td01_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">�����1-2������1</td>
            <td width="21" id="td2"><img src="images/node_closed.gif" onclick="unFold('2')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%" id="table2"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">21</td>
      <td align="center"  class="td01_viewcontent_title">17����������װ������ </td>
      <td align="center"  class="td01_viewcontent_content">��/ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">34</td>
      <td align="center"  class="td01_viewcontent_title"> ��3��ʯ���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">46</td>
      <td align="center"  class="td01_viewcontent_title"> 1����ҵ������������ </td>
      <td align="center"  class="td01_viewcontent_content"> �� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">22</td>
      <td align="center"  class="td01_viewcontent_title">18�����õ���  </td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
      <td align="center"  class="td01_viewcontent_content">35</td>
      <td align="center"  class="td01_viewcontent_title">


��4���ӷ���</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      <td align="center"  class="td01_viewcontent_content">47</td>
      <td align="center"  class="td01_viewcontent_title"> ��1����ú��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">23</td>
      <td align="center"  class="td01_viewcontent_title">19�������׼ú�� </td>
      <td align="center"  class="td01_viewcontent_content">��/ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> 9����ҵ��ˮ����Ⱦ���ŷ��� </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">48</td>
      <td align="center"  class="td01_viewcontent_title"> ��2��¯�� </td>
      <td align="center"  class="td01_viewcontent_content">�� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title">������ҵ��ˮ  </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">36</td>
      <td align="center"  class="td01_viewcontent_title"> ��1����ѧ������ </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">49</td>
      <td align="center"  class="td01_viewcontent_title"> ��3��ú�ʯ </td>
      <td align="center"  class="td01_viewcontent_content"> ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">24</td>
      <td align="center"  class="td01_viewcontent_title">1����ˮ������ʩ��  </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">37</td>
      <td align="center"  class="td01_viewcontent_title">��2������ </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">50</td>
      <td align="center"  class="td01_viewcontent_title"> ��4������ʯ�� </td>
      <td align="center"  class="td01_viewcontent_content"> ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">25</td>
      <td align="center"  class="td01_viewcontent_title">2����ˮ������ʩ���������� </td>
      <td align="center"  class="td01_viewcontent_content">��/��</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">38</td>
      <td align="center"  class="td01_viewcontent_title">����3��ʯ����</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">51</td>
      <td align="center"  class="td01_viewcontent_title"> 2.��ҵ��������ۺ�������</td>
      <td align="center"  class="td01_viewcontent_content"> ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">26</td>
      <td align="center"  class="td01_viewcontent_title">3����ˮ������ʩ�����з���</td>
      <td align="center"  class="td01_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">39</td>
      <td align="center"  class="td01_viewcontent_title"> ����4���ӷ��� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">52</td>
      <td align="center"  class="td01_viewcontent_title"> ��1����ú��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">27</td>
      <td align="center"  class="td01_viewcontent_title">4����ҵ��ˮ������ </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> ������ҵ���� </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">53</td>
      <td align="center"  class="td01_viewcontent_title"> ��2��¯��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">28</td>
      <td align="center"  class="td01_viewcontent_title">5����ҵ��ˮ�ŷ��� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">40</td>
      <td align="center"  class="td01_viewcontent_title"> 1������������ʩ�� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">54</td>
      <td align="center"  class="td01_viewcontent_title"> ��3��ú�ʯ</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">29</td>
      <td align="center"  class="td01_viewcontent_title">���У�ֱ�����뺣��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">41</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�������ʩ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">55</td>
      <td align="center"  class="td01_viewcontent_title"> ��4������ʯ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">30</td>
      <td align="center"  class="td01_viewcontent_title">����������������ˮ������� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">42</td>
      <td align="center"  class="td01_viewcontent_title"> 2������������ʩ�������� </td>
      <td align="center"  class="td01_viewcontent_content">��������/ʱ</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">56</td>
      <td align="center"  class="td01_viewcontent_title"> ���У��ۺ���������������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">31</td>
      <td align="center"  class="td01_viewcontent_title">7����ҵ��ˮ�ŷŴ���� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">43</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�������ʩ��������</td>
      <td align="center"  class="td01_viewcontent_content">��/��</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">57</td>
      <td align="center"  class="td01_viewcontent_title"> 3����ҵ������������� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> 8����ҵ��ˮ����Ⱦ��ȴ����</td>
      <td align="center"  class="td_viewcontent_content"> --</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">44</td>
      <td align="center"  class="td01_viewcontent_title"> 3������������ʩ���з���</td>
      <td align="center"  class="td01_viewcontent_content">��Ԫ</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">58</td>
      <td align="center"  class="td01_viewcontent_title"> 4����ҵ������ﴦ���� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">32</td>
      <td align="center"  class="td01_viewcontent_title"> ��1����ѧ������ </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">45</td>
      <td align="center"  class="td01_viewcontent_title">���У�������ʩ���з���</td>
      <td align="center"  class="td01_viewcontent_content">��Ԫ</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">59</td>
      <td align="center"  class="td01_viewcontent_title"> ���У���������������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">33</td>
      <td align="center"  class="td01_viewcontent_title"> ��2������ </td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> �ġ���ҵ������� </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center" class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">60</td>
      <td align="center"  class="td01_viewcontent_title"> 5����ҵ��������ŷ��� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
  </table>
  
  </G:Template></G:Content>
  
  
<G:Content id="view_1150" runat="server">
<G:Template id="Template1150" runat="server">
  
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td01_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">�����1-2������2</td>
            <td width="21" id="td3"><img src="images/node_closed.gif" onclick="unFold('3')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%" id="table3"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td colspan="11" align="center"  class="td01_viewcontent_content"> ����ʵ��   </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> �塢������� </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content"> �ϼ� </td>
      <td align="center"  class="td01_viewcontent_content"> #1���� </td>
      <td align="center"  class="td01_viewcontent_content"> #2���� </td>
      <td align="center"  class="td01_viewcontent_content">#3����</td>
      <td align="center"  class="td01_viewcontent_content">#4����</td>
      <td align="center"  class="td01_viewcontent_content">#5����</td>
      <td align="center" class="td01_viewcontent_content">#6����</td>
      <td align="center"  class="td01_viewcontent_content">#7���� </td>
      <td align="center"  class="td01_viewcontent_content">#8���� </td>
      <td align="center"  class="td01_viewcontent_content">#9����</td>
      <td align="center"  class="td01_viewcontent_content">#10����</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">61</td>
      <td align="center"  class="td01_viewcontent_title"> 1. װ������ </td>
      <td align="center"  class="td01_viewcontent_content">��/ǧ�� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">62</td>
      <td align="center"  class="td01_viewcontent_title"> 2.��¯��λ </td>
      <td align="center"  class="td01_viewcontent_content">����/ʱ </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">63</td>
      <td align="center"  class="td01_viewcontent_title"> 3.������ </td>
      <td align="center"  class="td01_viewcontent_content">��ǧ��ʱ </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">64</td>
      <td align="center"  class="td01_viewcontent_title"> 4.������ </td>
      <td align="center"  class="td01_viewcontent_content">�׽� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">65</td>
      <td align="center"  class="td01_viewcontent_title"> 5.����Ͷ��ʱ�� </td>
      <td align="center"  class="td01_viewcontent_content">���� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">66</td>
      <td align="center"  class="td01_viewcontent_title"> 6.����Сʱ�� </td>
      <td align="center"  class="td01_viewcontent_content">Сʱ</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">67</td>
      <td align="center"  class="td01_viewcontent_title"> 7.�����׼ú�� </td>
      <td align="center"  class="td01_viewcontent_content"> ��/ǧ��ʱ </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">68</td>
      <td align="center"  class="td01_viewcontent_title"> 8.ú̿������ </td>
      <td align="center"  class="td01_viewcontent_content"> ��� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">69</td>
      <td align="center"  class="td01_viewcontent_title"> ���У����������� </td>
      <td align="center"  class="td01_viewcontent_content"> ��� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">70</td>
      <td align="center"  class="td01_viewcontent_title">����


����������</td>
      <td align="center"  class="td01_viewcontent_content">���</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">71</td>
      <td align="center"  class="td01_viewcontent_title"> 9.ȼ�������� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">72</td>
      <td align="center"  class="td01_viewcontent_title">���У�����</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">73</td>
      <td align="center"  class="td01_viewcontent_title">����������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">74</td>
      <td align="center"  class="td01_viewcontent_title">10.�ྻȼ��������</td>
      <td align="center"  class="td_viewcontent_content"> �������� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">75</td>
      <td align="center"  class="td01_viewcontent_title"> 11.ú�ʯ������ </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">76</td>
      <td align="center"  class="td01_viewcontent_title"> 12.�����ŷ��� </td>
      <td align="center"  class="td_viewcontent_content"> ��������� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">77</td>
      <td align="center"  class="td01_viewcontent_title"> 13.���������¶� </td>
      <td align="center"  class="td_viewcontent_content"> oC </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">78</td>
      <td align="center"  class="td01_viewcontent_title"> 14.������ʩͶ��ʱ�� </td>
      <td align="center"  class="td_viewcontent_content"> ���� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">79</td>
      <td align="center"  class="td01_viewcontent_title"> 15.����������� </td>
      <td align="center"  class="td_viewcontent_content"> �� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td class="td01_viewcontent_content" colspan="14"><p>ָ����ϵ��68=69+70,71��72+73</p></td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td01_viewcontent_content"> <table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">�����1-2������3</td>
            <td width="21" id="td4"><img src="images/node_closed.gif" onclick="unFold('4')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" id="table4"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">����</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_title">ָ������</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">������λ</td>
      <td colspan="11" align="center"  class="td01_viewcontent_content"> ����ʵ�� </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">�ϼ� </td>
      <td align="center"  class="td01_viewcontent_content">#1����</td>
      <td align="center"  class="td01_viewcontent_content">#2����</td>
      <td align="center"  class="td01_viewcontent_content">#3����</td>
      <td align="center"  class="td01_viewcontent_content">#4����</td>
      <td align="center"  class="td01_viewcontent_content">#5����</td>
      <td align="center"  class="td01_viewcontent_content">#6����</td>
      <td align="center"  class="td01_viewcontent_content">#7����</td>
      <td align="center"  class="td01_viewcontent_content">#8����</td>
      <td align="center"  class="td01_viewcontent_content">#9����</td>
      <td align="center"  class="td01_viewcontent_content">#10����</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">80</td>
      <td align="center"  class="td01_viewcontent_title">16.������ʩ����Ч��</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">81</td>
      <td align="center"  class="td01_viewcontent_title"> 17.<span class="font1225_FF0000">������ʩ</span>Ͷ��ʱ�����У����� </td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">82</td>
      <td align="center"  class="td01_viewcontent_title">ʯ��/ʯ�෨</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">83</td>
      <td align="center"  class="td01_viewcontent_title">¯�����¯����ʪ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">84</td>
      <td align="center"  class="td01_viewcontent_title">����ѭ���򻯴���</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">85</td>
      <td align="center"  class="td01_viewcontent_title">ѭ���򻯴���¯¯������</td>
      <td align="center"  class="td01_viewcontent_content">���� </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">86</td>
      <td align="center"  class="td01_viewcontent_title">��������</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">87</td>
      <td align="center"  class="td01_viewcontent_title">18.���������ŷ�Ũ��</td>
      <td align="center"  class="td01_viewcontent_content">mg/Nm</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">88</td>
      <td align="center"  class="td01_viewcontent_title">19.�̳��ŷ�Ũ��</td>
      <td align="center"  class="td01_viewcontent_content"> mg/Nm</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">89</td>
      <td align="center"  class="td01_viewcontent_title">20.���������ŷ�Ũ��</td>
      <td align="center"  class="td01_viewcontent_content"> mg/Nm</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">90</td>
      <td align="center"  class="td01_viewcontent_title"> 


21.��������ȥ����</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">91</td>
      <td align="center"  class="td01_viewcontent_title">22.���������ŷ���</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">92</td>
      <td align="center"  class="td01_viewcontent_title"> ���У��ŷŴ���� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">93</td>
      <td align="center"  class="td01_viewcontent_title"> 23.��������ȥ���� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">94</td>
      <td align="center"  class="td01_viewcontent_title"> 24.���������ŷ��� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">95</td>
      <td align="center"  class="td01_viewcontent_title">���У��ŷŴ����</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">96</td>
      <td align="center"  class="td01_viewcontent_title">25.�̳�ȥ����</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">97</td>
      <td align="center"  class="td01_viewcontent_title">26.�̳��ŷ���</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">98</td>
      <td align="center"  class="td01_viewcontent_title">���У��ŷŴ����</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td class="td01_viewcontent_content" colspan="14"> ָ����ϵ��91��92,94��95,97��98 </td>
    </tr>
  </table>
  </G:Template></G:Content>
  
  
	</td>
</tr>
</table>
</td></tr></table>
<div id="listhtml" runat="server"></div>
<!--��̬����html,����-->
</form>
</body>
</html>
