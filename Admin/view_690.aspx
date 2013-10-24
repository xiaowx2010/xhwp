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
	//G108 生产工艺废气处理设施普查表_主表
    SetToolBar();//设置工具条,同时获取固定URL参数
    hycode = GetQueryString("hycode", ""); 
	string orgcode = GetQueryString("orgcode","");
	StringBuilder h_viewstr=new StringBuilder();
	h_viewstr.Append("select top 6 fld_693_3");
	for(int i=4;i<24;i++)
	{
		h_viewstr.Append(",fld_693_"+i);
	}
	h_viewstr.Append(" from gmis_mo_693 left join gmis_mo_" + mid + " on fld_690_1=fld_693_1 where fld_690_1='"+orgcode+"'");
	list_top.SqlStr = h_viewstr.ToString();
	
	DataTable h_dt = list_top.DataTable;
	list_bottom.DataTable= h_dt;
	
	db.SqlString="select (select top 1 fld_1202_1 from gmis_mo_1202 where fld_1202_2=fld_" + mid + "_1) as c_name,fld_" + mid + "_1,fld_"+mid+"_18,fld_"+mid+"_2,fld_"+mid+"_3,((case when fld_" + mid + "_4<10 then '200'+cast(fld_" + mid + "_4 as char(4)) else cast(fld_" + mid + "_4 as char(4)) end)+'年 '+(case when fld_" + mid + "_5<10 then '0'+cast(fld_" + mid + "_5 as char(1)) else cast(fld_" + mid + "_5 as char(2)) end)+' 月 '+(case when fld_" + mid + "_6<10 then '0'+cast(fld_" + mid + "_6 as char(1)) else cast(fld_" + mid + "_6 as char(2)) end)+' 日') as ctbrq from gmis_mo_" + mid + " where fld_690_1='"+orgcode+"'";     
	h_dt = db.GetDataTable();
	if ( h_dt.Rows.Count > 0)
	{
		p_cname=h_dt.Rows[0]["c_name"].ToString();
		p_ccode=h_dt.Rows[0]["fld_"+mid+"_1"].ToString();
		p_cfzr=h_dt.Rows[0]["fld_"+mid+"_18"].ToString();
		p_cshr=h_dt.Rows[0]["fld_"+mid+"_2"].ToString();
		p_ctbr=h_dt.Rows[0]["fld_"+mid+"_3"].ToString();
		p_ctbrq=h_dt.Rows[0]["ctbrq"].ToString();
	}
         
       
	iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
    
} 
</script>

<body style="width:97%;" >
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
        <td align="right" class="font_2635B_000">生产工艺废气处理设施普查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：G108表</td>
      </tr>
      <tr>
        <td class="font1220_000000">制表机关：国务院第一次全国污染普查领导小组办公室</td>
      </tr>
      <tr>
        <td class="font1220_000000">批准机关：国家统计局</td>
      </tr>
      <tr>
        <td class="font1220_000000">批准文号：国统制[2007]124号</td>
      </tr>
      <tr>
        <td class="font1220_000000">有效期至：2008年6月30日</td>
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
<G:ListTable ID="list_top" Rows="6" runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="new_td_viewcontent_title">处理设施基本情况</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">1、处理设施编号</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">2、处理设施名称</td>
      <td width="11%"  align="center" class="new01_td_viewcontent_title">3、总投资额（万元）</td>
      <td width="15%"  align="center" class="new01_td_viewcontent_title">4、设计处理能力（立方米/时）</td>
      <td width="10%"  align="center" class="new01_td_viewcontent_title">5、运行费用（万元）</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">6、运行小时</td>
      <td width="11%"  align="center" class="new01_td_viewcontent_title">7、耗电量（万千瓦时）</td>
      <td width="15%"  align="center" class="new01_td_viewcontent_title">8、废气实际处理量（万立方米）</td>
      <td width="13%"  align="center" class="new01_td_viewcontent_title">9、产生废气的主要生产工艺</td>
    </tr>
		
	</G:Template>
	<G:Template id="listtemp1" runat="server">
    <tr>
      <td align="center" class="new_td_viewcontent_content" >QZ--*</td>
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
	<G:Template id="listtemp2" runat="server">
    <tr>
      <td align="center" class="new_td_viewcontent_content" >QZ--</td>
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
    
    
<G:ListTable ID="list_bottom" Rows="6" runat="server">
	<G:Template id="listtemp_bottomhead" type="head" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="new_td_viewcontent_title">处理方法及主要污染物</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="8%" rowspan="2"  align="center" class="new01_td_viewcontent_title">1、处理设施编号</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">处理方法</td>
      <td colspan="9"  align="center" class="new01_td_viewcontent_title">处理的主要污染物</td>
    </tr>
    <tr>
      <td  align="center" class="new01_td_viewcontent_title">10、名称</td>
      <td  align="center" class="new01_td_viewcontent_title">11、代码</td>
      <td  align="center" class="new01_td_viewcontent_title">12、名称</td>
      <td  align="center" class="new01_td_viewcontent_title">13、代码</td>
      <td  align="center" class="new01_td_viewcontent_title">14、处理效率（%）</td>
      <td  align="center" class="new01_td_viewcontent_title">15、名称</td>
      <td  align="center" class="new01_td_viewcontent_title">16、代码</td>
      <td  align="center" class="new01_td_viewcontent_title">17、处理效率（%）</td>
      <td  align="center" class="new01_td_viewcontent_title">18、名称</td>
      <td  align="center" class="new01_td_viewcontent_title">19、代码</td>
      <td  align="center" class="new01_td_viewcontent_title">14、处理效率（%）</td>
    </tr>
	</G:Template>
	<G:Template id="listtemp_bottom1" runat="server">
    <tr>
      <td align="center" class="new_td_viewcontent_content" >QZ--*<input type="hidden" value="*********" /></td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
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
      <td align="center" class="new_td_viewcontent_content" >QZ--</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
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
      <td align="left" class="font1220_000000">注：①除锅炉、窑炉配套治理设施外的其他废气治理设施填表报此表。②如表格不够填表写,请自行复印。③运行小时和以“立方米/时”为单位的指标保留整数；以“万元、%”为计量单位的指标允许保留一位小数；其他指标允许保留两位小数。</td>
    </tr>
  </table>
  </form>
</body>
</html>
