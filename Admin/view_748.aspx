<!--G206 工业用水及废水处理、排放情况普查表-->

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
    string hycode = "";//行业
    string p_name="";//单位名称
    string p_code="";//单位代码
    private void Page_Load(object sender,System.EventArgs e)
    {
        SetToolBar();//设置工具条,同时获取固定URL参数   
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode","0");
       view.SqlStr="select top 1 fld_748_2,fld_748_3,fld_748_4,fld_748_5,fld_748_6,fld_748_7 ,fld_748_1,(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_748_1) as comcode,(select fld_730_2 from gmis_mo_730 where fld_730_1=fld_748_1) as comname from gmis_mo_748 where  fld_748_1='"+orgcode+"'";
        DataTable dt = view.DataTable;
        if (dt.Rows.Count > 0)
        {
            p_code=dt.Rows[0]["comcode"].ToString();
            p_name=dt.Rows[0]["comname"].ToString();            
        }
        list_750.SqlStr = "select top 5 fld_750_2,fld_750_3,fld_750_4,fld_750_5,fld_750_6,(case when fld_750_7!=0.0 then cast(fld_750_7 as nvarchar)+'年' else '' end),(case when fld_750_8!=0.0 then cast(fld_750_8 as nvarchar) +'月' else '' end ),fld_750_9 from gmis_mo_750 where fld_750_1='" + orgcode + "'";
        list_754.SqlStr = "select top 5 fld_754_2,fld_754_3,fld_754_4,fld_754_5,(case when fld_754_6!=0.0 then cast(fld_754_6 as nvarchar)+'年' else '' end),(case when fld_754_7!=0.0 then cast(fld_754_7 as nvarchar) +'月' else '' end ),fld_754_8 from gmis_mo_754 where fld_754_1='" + orgcode + "'";
        list_752.SqlStr = "select top 5 fld_752_2,fld_752_3,fld_752_4,fld_752_5,(case when fld_752_6!=0.0 then cast(fld_752_6 as nvarchar)+'年' else '' end),(case when fld_752_7!=0.0 then cast(fld_752_7 as nvarchar) +'月' else '' end ),fld_752_8 from gmis_mo_752 where fld_752_1='" + orgcode + "'";
        iframe_658.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) + "&hycode=" + StringUtility.StringToBase64(hycode);
    }
</script>
<body>

    <form id="form1" runat="server">
    <!--选项卡-->
        <table width="100%">
            <tr>
                <td>
    <iframe id="iframe_658"  runat="server" frameborder="0" width="100%" height="25" scrolling="no"></iframe>
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
    <!--操作工具条-->
    </div>

    <!--动态生成html,开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%" align="right" style="padding-right:20px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right" class="font_2635B_000">电磁辐射设备和放射性同位素与射线装置</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：G206表</td>
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
      <td width="100" align="right"  class="td_viewcontent_title">单位名称（公章）</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content"><%=p_name.ToString() %>&nbsp;</td>
    </tr>
    <tr>
      <td align="right" width="100" class="td_viewcontent_title">单位代码</td>
      <td colspan="3" align="left" class="td_viewcontent_content"><%=p_code.ToString() %>&nbsp;</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
    <tr>
      <td align="center" class="td_viewcontent_title"">一、工业用电磁辐射设备（频率大于500赫兹且功率大于5千瓦）</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="20%"  align="center" class="td_viewcontent_title"">1设备类别</td>
      <td width="13%"  align="center" class="td_viewcontent_title"">2设备代码</td>
      <td width="13%"  align="center" class="td_viewcontent_title"">3设备型号</td>
      <td width="13%"  align="center" class="td_viewcontent_title"">4标称功率（千瓦）</td>
      <td width="13%"  align="center" class="td_viewcontent_title"">5工作频率（千赫）</td>
      <td width="13%"  align="center" class="td_viewcontent_title"">6启用时间（年月）</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">7设备使用状态</td>
    </tr>
   <G:listbox id="list_750" runat="server" rows="5" showallline="true">
   <G:template id="temp_750" runat="server">
    <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    </G:template>
    </G:listbox>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">二、工业用含放射源设备</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="20%"  align="center" class="td_viewcontent_title"">8.含放射源设备类别</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">9.设备代码</td>
      <td width="20%"  align="center" class="td_viewcontent_title"">10.设备型号</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">11.放射源编码</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">12.出厂时间</td>
      <td width="18%"  align="center" class="td_viewcontent_title"">13.设备使用状态</td>
    </tr>
       <G:listbox id="list_754" runat="server" rows="5" showallline="true">
   <G:template id="temp_754" runat="server">
       <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>  
    </G:template>
    </G:listbox>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999">
    <tr>
      <td align="center" class="td_viewcontent_title">三、工业用射线装置</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="20%"  align="center" class="td_viewcontent_title"">14.射线装置名称</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">15.设备代码</td>
      <td width="20%"  align="center" class="td_viewcontent_title"">16.装置型号</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">17.射线装置名称</td>
      <td width="14%"  align="center" class="td_viewcontent_title"">18.启用时间（年月）</td>
      <td width="18%"  align="center" class="td_viewcontent_title"">13.装置使用状态</td>
    </tr>
       <G:listbox id="list_752" runat="server" rows="5" showallline="true">
   <G:template id="temp_752" runat="server">
       <tr>
      <td align="center" class="td_viewcontent_content" >*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
    </tr>  
    </G:template>
    </G:listbox>
  </table>
     <G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right" width="100"  class="td_viewcontent_title" style="padding-right:5px; ">单位负责人</td>
       <td align="left" class="td_viewcontent_content">*&nbsp;</td>
       <td width="100"align="right"  class="td_viewcontent_title" style="padding-right:5px; ">审核人 </td>
       <td  align="left" class="td_viewcontent_content">*&nbsp;</td>
    </tr>
   <tr>
      <td align="right" width="100"  class="td_viewcontent_title">填表人</td>
      <td width="230" align="left" class="td_viewcontent_content">*&nbsp;</td>
      <td width="100" align="right"  class="td_viewcontent_title">填表日期</td>
      <td width="210" align="left" class="td_viewcontent_content">200*年*月*日</td>
    </tr>
  </table>
  </G:template>
  </G:Content>
</form>
</body>
</html>
