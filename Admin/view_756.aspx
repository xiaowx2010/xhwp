<!--G207 含多氯联苯电容器（变压器）普查表-->

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
    
private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//设置工具条,同时获取固定URL参数   
        hycode = GetQueryString("hycode", "");
        string orgcode = GetQueryString("orgcode","0");
        string h_sql1="";//字段
        for(int i=0;i<18;i++)
        {
            
            h_sql1+=" ,fld_756_"+(7+i);
            h_sql1+=" ,fld_756_"+(25+i);
            h_sql1+=" ,fld_756_"+(43+i);
            h_sql1+=" ,fld_756_"+(61+i);
            h_sql1+=" ,(case when fld_756_"+(79+i)+"!=0 then cast(fld_756_"+(79+i)+" as nvarchar)+'年' else '' end)";
            h_sql1+=" ,(case when fld_756_"+(97+i)+"!=0 then cast(fld_756_"+(97+i)+" as nvarchar)+'月' else '' end)";
            h_sql1+=" ,(case when fld_756_"+(115+i)+"!=0 then cast(fld_756_"+(115+i)+" as nvarchar)+'年' else '' end)";
            h_sql1+=" ,(case when fld_756_"+(133+i)+"!=0 then cast(fld_756_"+(133+i)+" as nvarchar)+'月' else '' end)";
            if(i<12)
            {
                h_sql1+=" ,(case when fld_756_"+(151+i)+"!=0 then cast(fld_756_"+(151+i)+" as nvarchar)+'年' else '' end)";
                h_sql1+=" ,(case when fld_756_"+(163+i)+"!=0 then cast(fld_756_"+(163+i)+" as nvarchar)+'月' else '' end)";
            }       
        }
        view.SqlStr ="select top 1 (select fld_730_2 from gmis_mo_730 where fld_730_1=fld_756_1) as comname ,(select fld_730_4 from gmis_mo_730 where fld_730_1=fld_756_1) as comcode "+h_sql1+" ,fld_756_3,fld_756_5,fld_756_6,fld_756_175,fld_756_4,fld_756_2,fld_756_1 from gmis_mo_756 where fld_756_1='"+orgcode+"'"; 
    iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;
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
        <td align="right" class="font_2635B_000">含多氯联苯电容器（变压器）普查表</td>
      </tr>
      <tr>
        <td align="right" class="font1425B_000000" style="padding-right:150px; ">2007年</td>
      </tr>
    </table></td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="font1220_000000">表　　号：G207表</td>
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
 <G:Content id="view" runat="server">
        <G:template id="tempview" runat="server">
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td  width="100" align="right"  class="td_viewcontent_title">单位名称（公章）</td>
      <td width="562" colspan="3" align="left" class="td_viewcontent_content">*</td>
    </tr>
    <tr>
      <td align="right" width="100"  class="td_viewcontent_title">单位代码</td>
      <td colspan="3" align="left" class="td_viewcontent_content">*</td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td width="11%"  align="center" class="td_viewcontent_title">设备情况</td>
      <td width="15%"  align="center" class="td_viewcontent_title">生厂产家（进口的标明国家）</td>
      <td width="13%"  align="center" class="td_viewcontent_title">型号</td>
      <td width="13%"  align="center" class="td_viewcontent_title">容量（KVar）</td>
      <td width="13%"  align="center" class="td_viewcontent_title">数量</td>
      <td width="13%"  align="center" class="td_viewcontent_title">设备生产时间（年月）</td>
      <td width="13%"  align="center" class="td_viewcontent_title">投运时间（年月）</td>
      <td width="13%"  align="center" class="td_viewcontent_title">报废时间（年月）</td>
    </tr>
    <tr>
      <td rowspan="6" align="center" class="td_viewcontent_content" >在用</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
  <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
    <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="6" align="center" class="td_viewcontent_content" >报废</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
     <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
   <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
        <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
    </tr>
    <tr>
      <td rowspan="6" align="center" class="td_viewcontent_content" >疑似</td>
     <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
    <tr>
     <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
    <tr>
    <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
    <tr>
       <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">**&nbsp;</td>
      <td align="center" class="td_viewcontent_content">-&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-top:5px; ">
     <tr>
       <td align="right"  width="100"  class="td_viewcontent_title" style="padding-right:5px; ">单位负责人</td>
       <td width="230" align="left" class="td_viewcontent_content">*</td>
       <td  width="100" align="right"  class="td_viewcontent_title" style="padding-right:5px; ">审核人 </td>
       <td width="210" align="left" class="td_viewcontent_content">*</td>
    </tr>
   <tr>
      <td align="right"  width="100"  class="td_viewcontent_title">填表人</td>
      <td width="230" align="left" class="td_viewcontent_content">*</td>
      <td width="100" align="right"  class="td_viewcontent_title">填表日期</td>
      <td width="210" align="left" class="td_viewcontent_content">200*年*月*日</td>
    </tr>
  </table>
  </G:template>
</G:Content>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">注：使用含多氯联苯电容器（变压器）的单位填写此表。</td>
    </tr>
  </table></form>
</body>
</html>