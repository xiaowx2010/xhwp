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
	//G105_2 废水污染物监测表_主表
    SetToolBar();//设置工具条,同时获取固定URL参数
    hycode = GetQueryString("hycode", ""); 
	string orgcode = GetQueryString("orgcode","");

	StringBuilder h_viewstr=new StringBuilder();
	h_viewstr.Append("select ");
	for(int i=3;i<123;)
	{
		if(i!=6)
		{
			h_viewstr.Append("fld_676_"+i+",");
		}
		else if(i==7||i==20||i==36||i==49||i==65||i==78||i==94||i==107||i==13)
		{
			h_viewstr.Append("cast(fld_676_"+i+" as char(8))+'年'+cast(fld_676_"+(i+1)+" as char(2))+'月',");
			i++;
		}
		switch(i)
		{
			case 19:
				i=36;
				break; 
				
			case 48:
				i=65;
				break;
				
			case 77:
				i=94;
				break;
				
			case 106:
				i=20;
				break;
				
			case 35:
				i=49;
				break;
				
			case 64:
				i=78;
				break;
				
			case 93:
				i=107;
				break;
				
			default:
				i++;
				break;
		}
	}
	h_viewstr.Append(" '' as kong from gmis_mo_676 where fld_676_1='"+orgcode+"'");
	db.SqlString = h_viewstr.ToString();
	DataTable h_dt = db.GetDataTable();
	if(h_dt.Rows.Count>0)
	{
		view.DataTable=h_dt;
	}
	else
	{
		view_673.InnerHtml=view_673_alert.InnerHtml;
	}
	
	
	db.SqlString="select (select top 1 fld_1202_1 from gmis_mo_1202 where fld_1202_2=fld_" + mid + "_1) as c_name,fld_" + mid + "_1,fld_"+mid+"_18,fld_"+mid+"_2,fld_"+mid+"_3,((case when fld_" + mid + "_4<10 then '200'+cast(fld_" + mid + "_4 as char(4)) else cast(fld_" + mid + "_4 as char(4)) end)+'年 '+(case when fld_" + mid + "_5<10 then '0'+cast(fld_" + mid + "_5 as char(1)) else cast(fld_" + mid + "_5 as char(2)) end)+' 月 '+(case when fld_" + mid + "_6<10 then '0'+cast(fld_" + mid + "_6 as char(1)) else cast(fld_" + mid + "_6 as char(2)) end)+' 日') as ctbrq from gmis_mo_" + mid + " where fld_"+mid+"_1='"+orgcode+"'";     
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
        <td align="right" class="font_2635B_000">废水污染物监测表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：G105-2表</td>
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
<div id="view_673" runat="server">
    <G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td width="216" align="right"  class="td01_viewcontent_title">处理设施编号：</td>
      <td width="195" align="left"  class="td_viewcontent_content">SZ--* </td>
      <td width="200" align="right"  class="td01_viewcontent_title">对应的排放口编号：</td>
      <td width="195" align="left"  class="td_viewcontent_content">FS--*</td>
      <td width="200" align="right"  class="td01_viewcontent_title">排水去向类型</td>
      <td width="195" class="td_viewcontent_content">*</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="7%" rowspan="3"  align="center" class="new01_td_viewcontent_title">数据来源</td>
      <td width="10%" rowspan="3"  align="center" class="new01_td_viewcontent_title">1、监测时间（年月）</td>
      <td width="7%" rowspan="3"  align="center" class="new01_td_viewcontent_title">2、废水流量（立方米/时）</td>
      <td colspan="10"  align="center" class="new01_td_viewcontent_title">污染物浓度（毫升/克）</td>
    </tr>
    <tr>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">化学需氧量</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">氨氮</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">石油类</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">挥发酚</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">生化需氧量</td>
    </tr>
    <tr>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">3、进口</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">4、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">5、进口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">6、排口</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">7、进口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">8、排口</td>
      <td width="8%"  align="center" class="new01_td_viewcontent_title">9、进口</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">10、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">11、进口</td>
      <td width="8%"  align="center" class="new01_td_viewcontent_title">12、排口</td>
    </tr>
    <tr>
      <td rowspan="4" align="center" class="new_td_viewcontent_content" >A=普照查监测</td>
      <td align="center" class="new_td_viewcontent_content" >*年*月</td>
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
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*年*月</td>
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
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*年*月</td>
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
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*年*月</td>
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
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="new_td_viewcontent_title">污染物浓度（除汞为微克/升外，其余均为毫克/升）</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%" rowspan="2"  align="center" class="new01_td_viewcontent_title">1、监测时间（年月）</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">氰化物</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">砷</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">总铭</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">六价铭</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">铅</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">镉</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">汞</td>
    </tr>
    <tr>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">13、进口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">14、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">15、进口</td>
      <td width="5%"  align="center" class="new01_td_viewcontent_title">16、排口</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">17、进口</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">18、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">19、进口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">20、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">20、进口</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">22、排口</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">23、进口</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">24、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">25、进口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">26、排口</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*年*月</td>
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
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*年*月</td>
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
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*年*月</td>
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
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >*年*月</td>
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
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">*&nbsp;</td>
    </tr>
  </table>
        </G:Template>
    </G:Content>
    </div>
    <div id="view_673_alert" runat="server" style="display:none;">
    <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td width="216" align="right"  class="td01_viewcontent_title">处理设施编号：</td>
      <td width="195" align="left"  class="td_viewcontent_content">&nbsp;</td>
      <td width="200" align="right"  class="td01_viewcontent_title">对应的排放口编号：</td>
      <td width="195" align="left"  class="td_viewcontent_content">&nbsp;</td>
      <td width="200" align="right"  class="td01_viewcontent_title">排水去向类型</td>
      <td width="195" class="td_viewcontent_content">&nbsp;</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="7%" rowspan="3"  align="center" class="new01_td_viewcontent_title">数据来源</td>
      <td width="10%" rowspan="3"  align="center" class="new01_td_viewcontent_title">1、监测时间（年月）</td>
      <td width="7%" rowspan="3"  align="center" class="new01_td_viewcontent_title">2、废水流量（立方米/时）</td>
      <td colspan="10"  align="center" class="new01_td_viewcontent_title">污染物浓度（毫升/克）</td>
    </tr>
    <tr>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">化学需氧量</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">氨氮</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">石油类</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">挥发酚</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">生化需氧量</td>
    </tr>
    <tr>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">3、进口</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">4、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">5、进口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">6、排口</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">7、进口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">8、排口</td>
      <td width="8%"  align="center" class="new01_td_viewcontent_title">9、进口</td>
      <td width="9%"  align="center" class="new01_td_viewcontent_title">10、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">11、进口</td>
      <td width="8%"  align="center" class="new01_td_viewcontent_title">12、排口</td>
    </tr>
    <tr>
      <td rowspan="4" align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
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
    <tr>
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
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content">&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="new_td_viewcontent_title">污染物浓度（除汞为微克/升外，其余均为毫克/升）</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%" rowspan="2"  align="center" class="new01_td_viewcontent_title">1、监测时间（年月）</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">氰化物</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">砷</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">总铭</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">六价铭</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">铅</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">镉</td>
      <td colspan="2"  align="center" class="new01_td_viewcontent_title">汞</td>
    </tr>
    <tr>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">13、进口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">14、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">15、进口</td>
      <td width="5%"  align="center" class="new01_td_viewcontent_title">16、排口</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">17、进口</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">18、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">19、进口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">20、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">20、进口</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">22、排口</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">23、进口</td>
      <td width="7%"  align="center" class="new01_td_viewcontent_title">24、排口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">25、进口</td>
      <td width="6%"  align="center" class="new01_td_viewcontent_title">26、排口</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
      <td align="center" class="new_td_viewcontent_content" >&nbsp;</td>
    </tr>
  </table>
    </div>
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
&nbsp;&nbsp;&nbsp;&nbsp;指标关系：进口浓度≥排口浓度</td>
    </tr>
  </table>
</form>
</body>
</html>
