<!--工业企业污染治理项目建设情况  环年基3表,编辑页-->
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
    string p_year="",p_code="",p_name="",p_table="";//updata为修改，insert为新增
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//设置工具条,同时获取固定URL参数 

        mid = GetQueryString("mid", "0");
        id = GetQueryString("id", "0");
        if (id != "0")
        {
        }
        db.SqlString= "select fld_1153_4,fld_1153_5,fld_1153_6,fld_1153_7,fld_1153_8,fld_1153_9,fld_1153_10,fld_1153_11,fld_1153_12,fld_1153_13,fld_1153_14,fld_1153_15,fld_1153_1+'年' as p_year,fld_1202_2 as p_code,fld_1202_1 as p_name from " + GetModuleTableName("1153") + " left outer join gmis_mo_1202 on fld_1202_2=fld_1153_2 where fld_1153_1 in (select fld_1153_1 from " + GetModuleTableName("1153") + " where mocode=" + id + ") and fld_1153_2 in (select fld_1153_2 from " + GetModuleTableName("1153") + " where mocode=" + id + ")";
        //list_table.SqlStr=db.SqlString;
        int[] p_heji = new int[] { 0, 0, 0, 0, 0, 0, 0 };//合计
        string p_hejihang = "";
        DataTable dt = db.GetDataTable();
        foreach (DataRow dr in dt.Rows)//有值的行
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
        for (int j = 8 - dt.Rows.Count; j > 0; j--)//补充空行
        {
            p_table += "<tr><td height=\"30\" align=\"center\" class=\"td_viewcontent_content\">&nbsp;</td>";
            for (int i = 5; i < 16; i++)
            {
                p_table += "<td align=\"center\" class=\"td_viewcontent_content\">&nbsp;</td>";
            }
            p_table += "</tr>";
        }
        //合计行
        p_hejihang += "<tr><td align=\"center\" class=\"td_viewcontent_content\">合计(以下按项目分列) </td>";
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
      <tr>
        <td align="center" class="font_2635B_000">工业企业污染治理项目建设情况</td>
      </tr>
    </table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td align="right"  class="td_viewcontent_title" width="15%"> 统计年份:</td>
      <td align="left" class="td_viewcontent_content" width="35%">
        <%=p_year %>&nbsp;
      </td>
      <td align="right"  class="td_viewcontent_title" width="15%"> 企业法人代码</td>
      <td align="left" class="td_viewcontent_content"><%=p_code %>&nbsp;
      </td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title" nowrap width="15%">填报单位详细名称（公章）</td>
      <td colspan="3" align="left" class="td_viewcontent_content"><%=p_name %>&nbsp;
      </td>
    </tr>
</table>
<%--<G:ListTable ID="list_table" Rows="8" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">--%>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2"  align="center" class="td_viewcontent_title"> 污染治理<br>
      项目名称 </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title"> 治理类型 </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">开工年月 </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title"> 建成投产年月 </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">计划总投资<br>
      (万元) </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">至本年底累计完成投资(万元) </td>
      <td colspan="5"  align="center" class="td_viewcontent_title"> 本年完成投资及资金来源(万元) </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">竣工项目设计或新增处理能力 </td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title"> 合计 </td>
      <td align="center" class="td_viewcontent_title">排污费补助 </td>
      <td align="center" class="td_viewcontent_title"> 政府其他补助 </td>
      <td align="center" class="td_viewcontent_title">企业自筹 </td>
      <td align="center" class="td_viewcontent_title"> 银行贷款 </td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content"> 甲 </td>
      <td align="center" class="td_viewcontent_content"> 乙 </td>
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
      <td align="center" class="td_viewcontent_content">合计(以下按项目分列) </td>
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
      <td align="left" class="font1220_000000">说明：1. 上年已竣工投入使用的项目不再填报，已纳入建设项目环境保护“三同时”管理的项目不填本表。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 治理类型代码:&nbsp;1-工业废水治理&nbsp;&nbsp;&nbsp;2-燃料燃烧废气治理&nbsp;&nbsp;&nbsp;3-工艺废气治理(含工业粉尘治理)&nbsp;&nbsp;&nbsp;4-工业固体废物治理&nbsp;&nbsp;&nbsp;5-噪声治理（含振动）
          &nbsp;6-电磁辐射治理&nbsp;&nbsp;&nbsp;&nbsp;7-放射性治 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;理&nbsp;&nbsp;&nbsp;8-污染搬迁治理&nbsp;&nbsp;&nbsp;9-其他治理（含综合防治）
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        3. 废水治理设计能力单位为吨/日，废气治理设计能力单位为标立方米/时，固体废物治理设计能力单位为吨/日，噪声治理填降低“分贝”值。<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 指标间关系： 4≥5, 5=6+7+8,8≥9 </td>
    </tr></table>
    </td></tr></table>
<!--动态生成html,结束-->
</form>
</body>
</html>
