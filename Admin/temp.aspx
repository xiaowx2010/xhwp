<!--火电企业污染排放及处理租用情况  环年基1-2表,编辑页-->
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
        SetToolBar();//设置工具条,同时获取固定URL参数

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
                strhtml += "<tr><td align=\"center\"  class=\"td01_viewcontent_content\">代码</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_title\">" + row["caption"].ToString() + "</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">计量单位</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取合计</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取机组一</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取机组二</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取机组三</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取机组四</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取机组五</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取机组六</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取机组七</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取机组八</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取机组九</td>";
                strhtml += "<td align=\"center\"  class=\"td01_viewcontent_content\">获取机组十</td>";
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

        //BindListControl(fld_1149_21, "fld_1157_1", "fld_1157_2", "select fld_1157_1,fld_1157_2 from gmis_mo_1157");//登记注册类型
        //BindListControl(fld_1149_22, "fld_1175_1", "fld_1175_2", "select fld_1175_1,fld_1175_2 from gmis_mo_1175");//所属集团公司
        //BindListControl(fld_1149_20, "fld_1195_1", "fld_1195_view", "select fld_1195_1,(fld_1195_1+'|'+fld_1195_2) as fld_1195_view from gmis_mo_1195");//行政区域代码--
        //BindListControl(fld_1149_24, "fld_1165_1", "fld_1165_2", "select fld_1165_1,fld_1165_2 from gmis_mo_1165");//排水去向类型
        //BindListControl(fld_1149_25, "fld_1164_1", "fld_1164_2", "select fld_1164_1,fld_1164_2 from gmis_mo_1164");//受纳水体代码
        //BindListControl(fld_1149_28, "fld_1175_1", "fld_1175_2", "select fld_1175_1,fld_1175_2 from gmis_mo_1175");//排入污水厂处理名称--
        //BindListControl(fld_1149_93, "mocode", "fld_1194_1", "select mocode,fld_1194_1 from gmis_mo_1194");//重点污染源标识
    }
    
    //表格行列转置
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
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<table><tr><td>
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><!--表头-->
            <table width="100%">
                <tr>
                    <td align="center" valign="middle" style="font-size:large; font-weight:bolder;">火电企业污染排放及处理利用情况</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td><!--表头--> 
<G:Content id="view_1149" runat="server">
<G:Template id="Template1149" runat="server">     
            <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td rowspan="2" align="right"  class="td01_viewcontent_title">1、企业法人代码</td>
      <td rowspan="2" align="left"  class="td_viewcontent_content">*&nbsp;
      </td>
      <td rowspan="2" align="right"  class="td01_viewcontent_title">3、曾用名</td>
      <td rowspan="2" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" align="right"  class="td01_viewcontent_title">4、企业地理位置</td>
      <td class="td_viewcontent_content">中心经度
      *&nbsp;
      *&nbsp;
      *&nbsp;
      </td>
    </tr>
    <tr>
      <td class="td_viewcontent_content">中心纬度
      *&nbsp;
      *&nbsp;
      *&nbsp;
        </td>
    </tr>
    <tr>
      <td align="right"  class="td01_viewcontent_title">2、企业详细名称</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;
</td>
      <td align="right"  class="td01_viewcontent_title">重点污染源标识</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;
        </td>
    </tr>
    <tr>
      <td rowspan="4" align="right"  class="td01_viewcontent_title">5、法人及联系人</td>
      <td align="left"  class="td_viewcontent_content">姓&nbsp;&nbsp;&nbsp;&nbsp;名
      *&nbsp;
      *&nbsp;
      </td>
      <td rowspan="3" align="right"  class="td01_viewcontent_title">6、企业详细地址及行政区划</td>
      <td rowspan="3" align="left"  class="td_viewcontent_content">*&nbsp;
     </td>
      <td rowspan="2" align="right"  class="td01_viewcontent_title">7、登记注册类型</td>
      <td rowspan="2" class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="left"  class="td_viewcontent_content">电&nbsp;&nbsp;&nbsp;&nbsp;话
      *&nbsp;
      *&nbsp;
      </td>
    </tr>
    <tr>
      <td align="left"  class="td_viewcontent_content">传&nbsp;&nbsp;&nbsp;&nbsp;真
      *&nbsp;
      *&nbsp;
      </td>
      <td align="right"  class="td01_viewcontent_title">8、所属集团公司</td>
      <td class="td_viewcontent_content">*&nbsp;
</td>
    </tr>
    <tr>
      <td align="left"  class="td_viewcontent_content">邮政编码*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">行政区域代码</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;
      </td>
      <td align="right"  class="td_viewcontent_title">9、开业时间</td>
      <td class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="right"  class="td01_viewcontent_title">10、排水去向类型</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td01_viewcontent_title">11、受纳水体代码</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td01_viewcontent_title">受纳水体名称</td>
      <td class="td_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="right"  class="td01_viewcontent_title">12、排入污水厂处理代码</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td01_viewcontent_title">排入污水厂处理名称</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td01_viewcontent_title">行业类别</td>
      <td class="td_viewcontent_content">*&nbsp;
    </td>
    </tr>
</table>
            <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td01_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">环年基1-2表</td>
            <td width="21" id="td1"><img src="images/node_closed.gif" onclick="unFold('1')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table id="table1" width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td align="center"  class="td01_viewcontent_content">代码</td>
      <td align="center"  class="td01_viewcontent_title">指标名称</td>
      <td align="center"  class="td01_viewcontent_content">计量单位</td>
      <td align="center"  class="td01_viewcontent_content">本年实际</td>
      <td align="center"  class="td01_viewcontent_content">代码</td>
      <td align="center"  class="td01_viewcontent_title">指标名称</td>
      <td align="center"  class="td01_viewcontent_content">计量单位</td>
      <td align="center"  class="td01_viewcontent_content">本年实际</td>
      <td align="center"  class="td01_viewcontent_content">代码</td>
      <td align="center"  class="td01_viewcontent_title">指标名称</td>
      <td align="center"  class="td01_viewcontent_content">计量单位</td>
      <td align="center"  class="td01_viewcontent_content">本年实际</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">甲</td>
      <td align="center"  class="td01_viewcontent_title">乙</td>
      <td align="center"  class="td01_viewcontent_content">丙</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">甲</td>
      <td align="center"  class="td01_viewcontent_title">乙</td>
      <td align="center"  class="td01_viewcontent_content">丙</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">甲</td>
      <td align="center"  class="td01_viewcontent_title">乙</td>
      <td align="center"  class="td01_viewcontent_content">丙</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title">一、企业基本情况</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">7</td>
      <td align="center"  class="td01_viewcontent_title">5、燃料煤平均硫份</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">14</td>
      <td align="center"  class="td01_viewcontent_title">其中：烟尘排放达标的</td>
      <td align="center"  class="td01_viewcontent_content">台/蒸吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;/*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_title">1、工业总产值（现价）</td>
      <td align="center"  class="td01_viewcontent_content">万元</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
      <td align="center"  class="td01_viewcontent_content">8</td>
      <td align="center"  class="td01_viewcontent_title">6、燃料煤平均灰份</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">15</td>
      <td align="left"  class="td01_viewcontent_title">　　　　二氧化硫排放达标的</td>
      <td align="center"  class="td01_viewcontent_content">台/蒸吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;/*&nbsp;
    </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">2</td>
      <td align="center"  class="td01_viewcontent_title">2、“三废”综合利用产品产值</td>
      <td align="center"  class="td01_viewcontent_content">万元</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">9</td>
      <td align="center"  class="td01_viewcontent_title">7、燃料煤挥发份</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">16</td>
      <td align="center"  class="td01_viewcontent_title">12、污水排放口数</td>
      <td align="center"  class="td01_viewcontent_content">个</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">3</td>
      <td align="center"  class="td01_viewcontent_title">3、企业专职环保人员数</td>
      <td align="center"  class="td01_viewcontent_content">人</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">10</td>
      <td align="center"  class="td01_viewcontent_title">8、低位发热量</td>
      <td align="center"  class="td01_viewcontent_content">千焦/千克</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">17</td>
      <td align="center"  class="td01_viewcontent_title">13、直排海的污水排放口数</td>
      <td align="center"  class="td01_viewcontent_content">个</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">4</td>
      <td align="center"  class="td01_viewcontent_title">4、工业用水量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">11</td>
      <td align="center"  class="td01_viewcontent_title">9、重油平均硫份</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">18</td>
      <td align="center"  class="td01_viewcontent_title">14、废水在线监测仪器套数</td>
      <td align="center"  class="td01_viewcontent_content">套</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">5</td>
      <td align="center"  class="td01_viewcontent_title">新鲜用水量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">12</td>
      <td align="center"  class="td01_viewcontent_title">　10、机组数</td>
      <td align="center"  class="td01_viewcontent_content">个</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">19</td>
      <td align="center"  class="td01_viewcontent_title">15、废气在线监测仪器套数</td>
      <td align="center"  class="td01_viewcontent_content">套</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">6</td>
      <td align="center"  class="td01_viewcontent_title">重复用水量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">13</td>
      <td align="center"  class="td01_viewcontent_title">11、锅炉数</td>
      <td align="center"  class="td01_viewcontent_content">台/蒸吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;/*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">20</td>
      <td align="center"  class="td01_viewcontent_title">16、脱硫机组装容量</td>
      <td align="center"  class="td01_viewcontent_content">万千瓦</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
            <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td01_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">环年基1-2表续表1</td>
            <td width="21" id="td2"><img src="images/node_closed.gif" onclick="unFold('2')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%" id="table2"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td align="center"  class="td01_viewcontent_content">代码</td>
      <td align="center"  class="td01_viewcontent_title">指标名称</td>
      <td align="center"  class="td01_viewcontent_content">计量单位</td>
      <td align="center"  class="td01_viewcontent_content">本年实际</td>
      <td align="center"  class="td01_viewcontent_content">代码</td>
      <td align="center"  class="td01_viewcontent_title">指标名称</td>
      <td align="center"  class="td01_viewcontent_content">计量单位</td>
      <td align="center"  class="td01_viewcontent_content">本年实际</td>
      <td align="center"  class="td01_viewcontent_content">代码</td>
      <td align="center"  class="td01_viewcontent_title">指标名称</td>
      <td align="center"  class="td01_viewcontent_content">计量单位</td>
      <td align="center"  class="td01_viewcontent_content">本年实际</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">甲</td>
      <td align="center"  class="td01_viewcontent_title">乙</td>
      <td align="center"  class="td01_viewcontent_content">丙</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">甲</td>
      <td align="center"  class="td01_viewcontent_title">乙</td>
      <td align="center"  class="td01_viewcontent_content">丙</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">甲</td>
      <td align="center"  class="td01_viewcontent_title">乙</td>
      <td align="center"  class="td01_viewcontent_content">丙</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">21</td>
      <td align="center"  class="td01_viewcontent_title">17、脱硝机组装机容量 </td>
      <td align="center"  class="td01_viewcontent_content">万/千瓦</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">34</td>
      <td align="center"  class="td01_viewcontent_title"> （3）石油类 </td>
      <td align="center"  class="td01_viewcontent_content">千克</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">46</td>
      <td align="center"  class="td01_viewcontent_title"> 1、工业固体废物产生量 </td>
      <td align="center"  class="td01_viewcontent_content"> 吨 </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">22</td>
      <td align="center"  class="td01_viewcontent_title">18、厂用电率  </td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
      <td align="center"  class="td01_viewcontent_content">35</td>
      <td align="center"  class="td01_viewcontent_title">


（4）挥发酚</td>
      <td align="center"  class="td01_viewcontent_content">千克</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      <td align="center"  class="td01_viewcontent_content">47</td>
      <td align="center"  class="td01_viewcontent_title"> （1）粉煤灰</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">23</td>
      <td align="center"  class="td01_viewcontent_title">19、供电标准煤耗 </td>
      <td align="center"  class="td01_viewcontent_content">克/千瓦</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> 9、工业废水中污染物排放量 </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">48</td>
      <td align="center"  class="td01_viewcontent_title"> （2）炉渣 </td>
      <td align="center"  class="td01_viewcontent_content">吨 </td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title">二、工业废水  </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">36</td>
      <td align="center"  class="td01_viewcontent_title"> （1）化学需氧量 </td>
      <td align="center"  class="td01_viewcontent_content">千克</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">49</td>
      <td align="center"  class="td01_viewcontent_title"> （3）煤矸石 </td>
      <td align="center"  class="td01_viewcontent_content"> 吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">24</td>
      <td align="center"  class="td01_viewcontent_title">1、废水治理设施数  </td>
      <td align="center"  class="td01_viewcontent_content">套</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">37</td>
      <td align="center"  class="td01_viewcontent_title">（2）氨氮 </td>
      <td align="center"  class="td01_viewcontent_content">千克</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">50</td>
      <td align="center"  class="td01_viewcontent_title"> （4）脱硫石膏 </td>
      <td align="center"  class="td01_viewcontent_content"> 吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">25</td>
      <td align="center"  class="td01_viewcontent_title">2、废水治理设施数处理能力 </td>
      <td align="center"  class="td01_viewcontent_content">吨/日</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">38</td>
      <td align="center"  class="td01_viewcontent_title">　（3）石油类</td>
      <td align="center"  class="td01_viewcontent_content">千克</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">51</td>
      <td align="center"  class="td01_viewcontent_title"> 2.工业固体废物综合利用量</td>
      <td align="center"  class="td01_viewcontent_content"> 吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">26</td>
      <td align="center"  class="td01_viewcontent_title">3、废水治理设施数运行费用</td>
      <td align="center"  class="td01_viewcontent_content">万元</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">39</td>
      <td align="center"  class="td01_viewcontent_title"> 　（4）挥发酚 </td>
      <td align="center"  class="td01_viewcontent_content">千克</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">52</td>
      <td align="center"  class="td01_viewcontent_title"> （1）粉煤灰</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">27</td>
      <td align="center"  class="td01_viewcontent_title">4、工业废水处理量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> 三、工业废气 </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">53</td>
      <td align="center"  class="td01_viewcontent_title"> （2）炉渣</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">28</td>
      <td align="center"  class="td01_viewcontent_title">5、工业废水排放量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">40</td>
      <td align="center"  class="td01_viewcontent_title"> 1、废气治理设施数 </td>
      <td align="center"  class="td01_viewcontent_content">套</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">54</td>
      <td align="center"  class="td01_viewcontent_title"> （3）煤矸石</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">29</td>
      <td align="center"  class="td01_viewcontent_title">其中：直接排入海的</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">41</td>
      <td align="center"  class="td01_viewcontent_title"> 其中：脱硫设施数</td>
      <td align="center"  class="td01_viewcontent_content">套</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">55</td>
      <td align="center"  class="td01_viewcontent_title"> （4）脱硫石膏</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">30</td>
      <td align="center"  class="td01_viewcontent_title">　　　　　排入污水厂处理的 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">42</td>
      <td align="center"  class="td01_viewcontent_title"> 2、废气治理设施处理能力 </td>
      <td align="center"  class="td01_viewcontent_content">标立方米/时</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">56</td>
      <td align="center"  class="td01_viewcontent_title"> 其中：综合利用往年贮存量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">31</td>
      <td align="center"  class="td01_viewcontent_title">7、工业废水排放达标量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">43</td>
      <td align="center"  class="td01_viewcontent_title"> 其中：脱硫设施脱硫能力</td>
      <td align="center"  class="td01_viewcontent_content">吨/年</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">57</td>
      <td align="center"  class="td01_viewcontent_title"> 3、工业固体废物贮存量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> 8、工业废水中污染物却除量</td>
      <td align="center"  class="td_viewcontent_content"> --</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">44</td>
      <td align="center"  class="td01_viewcontent_title"> 3、废气治理设施运行费用</td>
      <td align="center"  class="td01_viewcontent_content">万元</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">58</td>
      <td align="center"  class="td01_viewcontent_title"> 4、工业固体废物处置量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">32</td>
      <td align="center"  class="td01_viewcontent_title"> （1）化学需氧量 </td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">45</td>
      <td align="center"  class="td01_viewcontent_title">其中：脱硫设施运行费用</td>
      <td align="center"  class="td01_viewcontent_content">万元</td>
      <td align="center" class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">59</td>
      <td align="center"  class="td01_viewcontent_title"> 其中：处置往年贮存量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">33</td>
      <td align="center"  class="td01_viewcontent_title"> （2）氨氮 </td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td01_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> 四、工业固体废物 </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center" class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">60</td>
      <td align="center"  class="td01_viewcontent_title"> 5、工业固体废物排放量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
            <td align="center">环年基1-2表续表2</td>
            <td width="21" id="td3"><img src="images/node_closed.gif" onclick="unFold('3')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%" id="table3"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td align="center"  class="td01_viewcontent_content">代码</td>
      <td align="center"  class="td01_viewcontent_title">指标名称</td>
      <td align="center"  class="td01_viewcontent_content">计量单位</td>
      <td colspan="11" align="center"  class="td01_viewcontent_content"> 本年实际   </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> 五、机组情况 </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content"> 合计 </td>
      <td align="center"  class="td01_viewcontent_content"> #1机组 </td>
      <td align="center"  class="td01_viewcontent_content"> #2机组 </td>
      <td align="center"  class="td01_viewcontent_content">#3机组</td>
      <td align="center"  class="td01_viewcontent_content">#4机组</td>
      <td align="center"  class="td01_viewcontent_content">#5机组</td>
      <td align="center" class="td01_viewcontent_content">#6机组</td>
      <td align="center"  class="td01_viewcontent_content">#7机组 </td>
      <td align="center"  class="td01_viewcontent_content">#8机组 </td>
      <td align="center"  class="td01_viewcontent_content">#9机组</td>
      <td align="center"  class="td01_viewcontent_content">#10机组</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">61</td>
      <td align="center"  class="td01_viewcontent_title"> 1. 装机容量 </td>
      <td align="center"  class="td01_viewcontent_content">万/千瓦 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 2.锅炉吨位 </td>
      <td align="center"  class="td01_viewcontent_content">蒸吨/时 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 3.发电量 </td>
      <td align="center"  class="td01_viewcontent_content">万千瓦时 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 4.供热量 </td>
      <td align="center"  class="td01_viewcontent_content">兆焦 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 5.机组投产时间 </td>
      <td align="center"  class="td01_viewcontent_content">年月 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 6.发电小时数 </td>
      <td align="center"  class="td01_viewcontent_content">小时</td>
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
      <td align="center"  class="td01_viewcontent_title"> 7.发电标准煤耗 </td>
      <td align="center"  class="td01_viewcontent_content"> 克/千瓦时 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 8.煤炭消费量 </td>
      <td align="center"  class="td01_viewcontent_content"> 万吨 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 其中：发电消费量 </td>
      <td align="center"  class="td01_viewcontent_content"> 万吨 </td>
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
      <td align="center"  class="td01_viewcontent_title">　　


供热消费量</td>
      <td align="center"  class="td01_viewcontent_content">万吨</td>
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
      <td align="center"  class="td01_viewcontent_title"> 9.燃油消费量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title">其中：重油</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title">　　　柴油</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title">10.洁净燃气消耗量</td>
      <td align="center"  class="td_viewcontent_content"> 万立方米 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 11.煤矸石消耗量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title"> 12.废气排放量 </td>
      <td align="center"  class="td_viewcontent_content"> 万标立方米 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 13.出口烟气温度 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 14.脱硝设施投产时间 </td>
      <td align="center"  class="td_viewcontent_content"> 年月 </td>
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
      <td align="center"  class="td01_viewcontent_title"> 15.脱硫剂消耗量 </td>
      <td align="center"  class="td_viewcontent_content"> 吨 </td>
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
      <td class="td01_viewcontent_content" colspan="14"><p>指标间关系：68=69+70,71≥72+73</p></td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td01_viewcontent_content"> <table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">环年基1-2表续表3</td>
            <td width="21" id="td4"><img src="images/node_closed.gif" onclick="unFold('4')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" id="table4"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">代码</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_title">指标名称</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">计量单位</td>
      <td colspan="11" align="center"  class="td01_viewcontent_content"> 本年实际 </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">合计 </td>
      <td align="center"  class="td01_viewcontent_content">#1机组</td>
      <td align="center"  class="td01_viewcontent_content">#2机组</td>
      <td align="center"  class="td01_viewcontent_content">#3机组</td>
      <td align="center"  class="td01_viewcontent_content">#4机组</td>
      <td align="center"  class="td01_viewcontent_content">#5机组</td>
      <td align="center"  class="td01_viewcontent_content">#6机组</td>
      <td align="center"  class="td01_viewcontent_content">#7机组</td>
      <td align="center"  class="td01_viewcontent_content">#8机组</td>
      <td align="center"  class="td01_viewcontent_content">#9机组</td>
      <td align="center"  class="td01_viewcontent_content">#10机组</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">80</td>
      <td align="center"  class="td01_viewcontent_title">16.脱硫设施脱硫效率</td>
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
      <td align="center"  class="td01_viewcontent_title"> 17.<span class="font1225_FF0000">脱硫设施</span>投产时间其中：氨法 </td>
      <td align="center"  class="td01_viewcontent_content">年月</td>
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
      <td align="center"  class="td01_viewcontent_title">石灰/石膏法</td>
      <td align="center"  class="td01_viewcontent_content">年月</td>
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
      <td align="center"  class="td01_viewcontent_title">炉内喷钙炉外增湿法</td>
      <td align="center"  class="td01_viewcontent_content">年月</td>
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
      <td align="center"  class="td01_viewcontent_title">烟气循环硫化床法</td>
      <td align="center"  class="td01_viewcontent_content">年月</td>
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
      <td align="center"  class="td01_viewcontent_title">循环硫化床锅炉炉内脱硫</td>
      <td align="center"  class="td01_viewcontent_content">年月 </td>
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
      <td align="center"  class="td01_viewcontent_title">其他方法</td>
      <td align="center"  class="td01_viewcontent_content">年月</td>
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
      <td align="center"  class="td01_viewcontent_title">18.二氧化硫排放浓度</td>
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
      <td align="center"  class="td01_viewcontent_title">19.烟尘排放浓度</td>
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
      <td align="center"  class="td01_viewcontent_title">20.氮氧化物排放浓度</td>
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


21.二氧化硫去除量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title">22.二氧化硫排放量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title"> 其中：排放达标量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title"> 23.氮氧化物去除量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title"> 24.氮氧化物排放量 </td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title">其中：排放达标量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title">25.烟尘去除量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title">26.烟尘排放量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td align="center"  class="td01_viewcontent_title">其中：排放达标量</td>
      <td align="center"  class="td01_viewcontent_content">吨</td>
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
      <td class="td01_viewcontent_content" colspan="14"> 指标间关系：91≥92,94≥95,97≥98 </td>
    </tr>
  </table>
  </G:Template></G:Content>
  
  
	</td>
</tr>
</table>
</td></tr></table>
<div id="listhtml" runat="server"></div>
<!--动态生成html,结束-->
</form>
</body>
</html>
