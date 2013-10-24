<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
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
string choiceid,hycode;
string p_cname="",p_ccode="",p_cfzr="",p_cshr="",p_ctbr="",p_ctbrq="";
private void Page_Load(object sender, System.EventArgs e)
{
	//G109_2 废气污染物监测表_主表
    SetToolBar();//设置工具条,同时获取固定URL参数
    hycode = GetQueryString("hycode", ""); 
	string orgcode = GetQueryString("orgcode","");
	StringBuilder h_viewstr=new StringBuilder();
	h_viewstr.Append("select top 2 fld_1310_2+'='+(select fld_1038_2 from gmis_mo_1038 where fld_1038_1=fld_1310_2)");
	for(int i=4;i<37;i++)
	{
		if(i==6||i==13)
		{
			h_viewstr.Append(",cast(fld_1310_"+i+" as char(8))+'年'+cast(fld_1310_"+(i+1)+" as char(2))+'月'");
			i++;
		}
		else
		h_viewstr.Append(",fld_1310_"+i);
	}
	h_viewstr.Append(" from gmis_mo_1310 left join gmis_mo_" + mid + " on fld_1310_1=fld_1292_1 where fld_1292_1='"+orgcode+"'");
	list_top.SqlStr = h_viewstr.ToString();
	
	DataTable h_dt = list_top.DataTable;
	list_bottom.DataTable= h_dt;
	
	db.SqlString="select fld_"+mid+"_18,fld_"+mid+"_2,fld_"+mid+"_3,((case when fld_" + mid + "_4<10 then '201'+cast(fld_" + mid + "_4 as char(4)) else cast(fld_" + mid + "_4 as char(4)) end)+'年 '+(case when fld_" + mid + "_5<10 then '0'+cast(fld_" + mid + "_5 as char(1)) else cast(fld_" + mid + "_5 as char(2)) end)+' 月 '+(case when fld_" + mid + "_6<10 then '0'+cast(fld_" + mid + "_6 as char(1)) else cast(fld_" + mid + "_6 as char(2)) end)+' 日') as ctbrq,(select top 1 fld_1202_1 from gmis_mo_1202 where fld_1202_2=fld_" + mid + "_1) as c_name,fld_" + mid + "_1 from gmis_mo_" + mid + " where fld_1292_1='"+orgcode+"'";     
	h_dt = db.GetDataTable();
	if (h_dt.Rows.Count > 0)
	{
		p_cname=h_dt.Rows[0]["c_name"].ToString();
		p_ccode=h_dt.Rows[0]["fld_"+mid+"_1"].ToString();
		p_cfzr=h_dt.Rows[0]["fld_"+mid+"_18"].ToString();
		p_cshr=h_dt.Rows[0]["fld_"+mid+"_2"].ToString();
		p_ctbr=h_dt.Rows[0]["fld_"+mid+"_3"].ToString();
		p_ctbrq=h_dt.Rows[0]["ctbrq"].ToString();
	}
	 
       
	iframe_658.Attributes["src"]="iframe_17_1.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;

    
}
</script>

<body style="width:97%;">
    <form id="form1" runat="server">
    <!--选项卡-->
        <table width="100%">
            <tr>
                <td>
                    <iframe id="iframe_658" runat="server" frameborder="0" width="100%" height="25" scrolling="no">
                    </iframe>
                </td>
            </tr>
        </table>
    <!--选项卡-->
    <!--操作工具条-->
    <div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbar_17.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbarright.aspx"-->
    </div>
    <!--操作工具条-->
    <!--内容-->
    <!--动态生成结束-->  
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">废气污染物监测表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2009年</td>
      </tr>
    </table></td>
    <td><table>
                    <tr>
                        <td>
                            表    号：Gl09-2表
                        </td>
                    </tr>
                    <tr>
                        <td>
                            制表机关：环境保护部
                        </td>
                    </tr>
                    <tr>
                        <td>
                            批准机关：国家统计局
                        </td>
                    </tr>
                    <tr>
                        <td>
                            批准文号：国统制[2009]113号
                        </td>
                    </tr>
                    <tr>
                        <td>
                            有效期至：2011年12月
                        </td>
                    </tr>
                    
                </table></td>
  </tr>
</table>
<!--操作工具条-->

  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td width="25%" align="right"  class="td_viewcontent_title">单位名称（公章）</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content"><%=p_cname%>&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">单位代码</td>
      <td colspan="3" align="left" class="td_viewcontent_content"><%=p_ccode  %>&nbsp;</td>
    </tr>
</table>
<G:ListTable ID="list_top" Rows="2" runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="9%" rowspan="4"  align="center" class="new01_td_viewcontent_title">数据来源</td>
      <td width="9%" rowspan="4"  align="center" class="new01_td_viewcontent_title">1、处理设施编号</td>
      <td width="11%" rowspan="4"  align="center" class="new01_td_viewcontent_title">2、对应的排放口编号</td>
      <td width="15%" rowspan="4"  align="center" class="new01_td_viewcontent_title">3、监测时间（年月）</td>
      <td colspan="2" rowspan="2"  align="center" class="new01_td_viewcontent_title">废气流量（立方米/时）</td>
      <td colspan="3"  align="center" class="new01_td_viewcontent_title">污染物浓度（毫克/立方米）</td>
    </tr>
    <tr>
      <td colspan="3"  align="center" class="new01_td_viewcontent_title">烟（粉）尘</td>
    </tr>
    <tr>
      <td rowspan="2"  align="center" class="new01_td_viewcontent_title">4、处理设施前</td>
      <td rowspan="2"  align="center" class="new01_td_viewcontent_title">5、处理设施后</td>
      <td width="11%" rowspan="2"  align="center" class="new01_td_viewcontent_title">6、进口</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">排口</td>
    </tr>
    <tr>
      <td width="15%"  align="center" class="new01_td_viewcontent_title">7、实例</td>
      <td width="13%"  align="center" class="new01_td_viewcontent_title">8、折算</td>
    </tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
    <tr>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >*&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content">QZ--*</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content">FQ--*</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
    <tr>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content">QZ--</td>
      <td rowspan="2" align="center" class="new_td_viewcontent_content">FQ--</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
    </tr>
	</G:Template>
    </G:ListTable>
    
    
<G:ListTable ID="list_bottom" Rows="2" runat="server">
	<G:Template id="listtemp_bottomhead" type="head" runat="server">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="new_td_viewcontent_title">污染物浓度（毫克/立方米）</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="13%" rowspan="3"  align="center" class="new01_td_viewcontent_title">1、处理设施编号</td>
      <td colspan="3"  align="center" class="new01_td_viewcontent_title">二氧化硫</td>
      <td colspan="3"  align="center" class="new01_td_viewcontent_title">氮氧化物</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">氟化物</td>
    </tr>
    <tr>
      <td width="13%" rowspan="2"  align="center" class="new01_td_viewcontent_title">9、进口</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">排口</td>
      <td width="12%" rowspan="2"  align="center" class="new01_td_viewcontent_title">12、进口</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">排口</td>
      <td width="14%" rowspan="2"  align="center" class="new01_td_viewcontent_title">15、进口</td>
      <td width="7%" rowspan="2"  align="center" class="new01_td_viewcontent_title">16、排口</td>
    </tr>
    <tr>
      <td width="11%"  align="center" class="new01_td_viewcontent_title">10、实测</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">11、折算</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">13、实测</td>
      <td width="12%"  align="center" class="new01_td_viewcontent_title">14、折算</td>
    </tr>
	</G:Template>
	<G:Template id="listtemp_bottom1" runat="server">
    <tr>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" ><input type="hidden" value="***************" />QZ--*</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
	</G:Template>
	<G:Template id="listtemp_bottom2" runat="server">
    <tr>
      <td rowspan="2" align="center" class="new_td_viewcontent_content" >QZ--</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
    </tr>
    </G:Template>
    </G:ListTable>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  class="td_viewcontent_title"  width="15%">单位负责人</td>
       <td width="230" align="left" class="td_viewcontent_content"><%=p_cfzr %>&nbsp;</td>
       <td align="right"  class="td_viewcontent_title"  width="15%">审核人 </td>
       <td width="210" align="left" class="td_viewcontent_content"><%=p_cshr %>&nbsp;</td>
    </tr>
   <tr>
      <td align="right"  class="td_viewcontent_title">填表人</td>
      <td width="230" align="left" class="td_viewcontent_content"><%=p_ctbr %>&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">填表日期</td>
      <td width="210" align="left" class="td_viewcontent_content"><%=p_ctbrq %>&nbsp;</td>
    </tr>

  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">注：①如表格不够填写,请自行复印。②数据来源：指获取监测数据的监测活动方式。按a、普查监测、b、监督监测、c、验收监测、d、委托监测、e、企业自测、f、在线监测，将代码填入表格内。<br>
&nbsp;&nbsp;&nbsp;&nbsp;③废水流量保留整数、污染物监测方法对应有效数字填报。<br>
&nbsp;&nbsp;&nbsp;&nbsp;指标关系：6≥7，9≥10，12≥13，15≥16，</td>
    </tr>
  </table>
  </form>
</body>
</html>
