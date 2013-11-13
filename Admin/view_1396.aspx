<!--G101工业企业基本情况表-->
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
	SetToolBar();//设置工具条,同时获取固定URL参数
	hycode = GetQueryString("hycode", "");
	string orgcode =  GetQueryString("orgcode", "");
	tb_2.Visible = false;


	view.SqlStr = "select fld_" + mid + "_2,fld_" + mid + "_4,fld_" + mid + "_14,fld_" + mid + "_6,fld_" + mid + "_22,fld_" + mid + "_23,fld_" + mid + "_40,fld_" + mid + "_41,fld_" + mid + "_9,''as longitude,''as latitude,fld_" + mid + "_21,fld_" + mid + "_42,''as phone,fld_" + mid + "_10,fld_" + mid + "_19,fld_" + mid + "_30,fld_" + mid + "_31,(case fld_"+mid+"_32 when '' then '' else fld_"+mid+"_32+'='+(select fld_1157_2 from gmis_mo_1157 where fld_1157_1=fld_" + mid + "_32) end ) ,'' as corsize ,''as opendate,'' as newdate,fld_" + mid + "_38,fld_" + mid + "_39 ,fld_" + mid + "_15,fld_" + mid + "_24,fld_" + mid + "_25,fld_" + mid + "_43,fld_" + mid + "_20,fld_" + mid + "_11,fld_" + mid + "_16,fld_" + mid + "_17,fld_" + mid + "_18,fld_" + mid + "_26,fld_" + mid + "_27,fld_" + mid + "_28,fld_" + mid + "_12,fld_" + mid + "_13,fld_" + mid + "_34,fld_" + mid + "_35,fld_" + mid + "_36,fld_" + mid + "_37,fld_"+mid+"_33,(select fld_1162_2 from gmis_mo_1162 where fld_1162_1=fld_" + mid + "_33) as fld_" + mid + "_33_1 ,fld_"+mid+"_1 from gmis_mo_" + mid + " where 1=1 and fld_" + mid + "_1='"+orgcode+"'" ;
	DataTable dt = view.DataTable;
	if (dt.Rows.Count > 0)
	{
		dt.Rows[0]["longitude"] = dt.Rows[0]["fld_" + mid + "_16"].ToString() + "°" + dt.Rows[0]["fld_" + mid + "_17"].ToString() + "′" + dt.Rows[0]["fld_" + mid + "_18"].ToString() + "″";
		dt.Rows[0]["latitude"] = dt.Rows[0]["fld_" + mid + "_26"].ToString() + "°" + dt.Rows[0]["fld_" + mid + "_27"].ToString() + "′" + dt.Rows[0]["fld_" + mid + "_28"].ToString() + "″";
		if(dt.Rows[0]["fld_" + mid + "_13"].ToString()!="0")
		{
			dt.Rows[0]["phone"] = dt.Rows[0]["fld_" + mid + "_12"].ToString() + "-" + dt.Rows[0]["fld_" + mid + "_13"].ToString();
		}
		else
		{
			dt.Rows[0]["phone"] = dt.Rows[0]["fld_" + mid + "_12"].ToString();
		}
		dt.Rows[0]["opendate"] = dt.Rows[0]["fld_" + mid + "_34"].ToString() + "年" + dt.Rows[0]["fld_" + mid + "_35"].ToString() + "月";
		if(dt.Rows[0]["fld_" + mid + "_36"].ToString()!="0"&&dt.Rows[0]["fld_" + mid + "_37"].ToString()!="0")
		{
			dt.Rows[0]["newdate"] = dt.Rows[0]["fld_" + mid + "_36"].ToString() + "年" + dt.Rows[0]["fld_" + mid + "_37"].ToString() + "月";
		}
		else
		{
			dt.Rows[0]["newdate"]="";
		}
		dt.Rows[0]["corsize"]=dt.Rows[0]["fld_"+mid+"_33"].ToString()+"="+dt.Rows[0]["fld_"+mid+"_33_1"].ToString();

	}

	iframe_1396.Attributes["src"]="iframe_17_2.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;

}


</script>
<body style="padding: 10px; text-align: center" >
    <form id="form1" runat="server">
    <!--选项卡-->
        <table width="100%">
            <tr>
                <td>
                    <iframe id="iframe_1396" runat="server" frameborder="0" width="100%" height="25" scrolling="no">
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
        <td align="right" class="font_2635B_000">工业企业基本情况表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2010年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="top_font1220_000000">表　　号：G101表</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">制表机关：环境保护部</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">批准机关：国家统计局</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">批准文号：国统制[2009]113号</td>
      </tr>
      <tr>
        <td class="top_font1220_000000">有效期至：2011年12月</td>
      </tr>
    </table></td>
  </tr>
</table>
    <G:Content ID="view" runat="server">
        <G:Template id="tempview" runat="server">
            <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">

                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        1.单位名称：
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        2.单位代码：
                    </td>
                    <td class="td_viewcontent_content" style="width: 35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        3.法定代表人：
                    </td>
                    <td class="td_viewcontent_content" style="width: 35%">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        4.单位所在地及行政区划
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        行政区划代码：
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        省：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        地区：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        县：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        乡：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        街、门牌号：
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        5.地理位置
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        中心经度：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        中心纬度：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4" class="td_viewcontent_title_top">
                        7.联系方式
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        区号：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        邮政编码：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        电话号码：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        传真号码：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        联系人姓名：
                    </td>
                    <td colspan="3" class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        8.行业类别：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        行业代码：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        9.登记注册类型：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        10.企业规模：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        11.开业时间：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        12.最新改扩建时间：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title_top">
                        13.年生产时间：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title_top">
                        14.工业总产值(万元)：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        单位负责人：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        审核人：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        填表人：
                    </td>
                    <td class="td_viewcontent_content">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        填表日期：
                    </td>
                    <td class="td_viewcontent_content">
                        201*年*月*日&nbsp;
                    </td>
                </tr>
            </table>
        </G:Template>
    </G:Content>
    </form>
</body>
</html>
