<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>

<HTML>
<HEAD>	
	
<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	
<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">

</HEAD>

<!--#include file="func.aspx"-->

<script language="C#" runat="server">
    
string hycode;

private void Page_Load(object sender, System.EventArgs e)
{
    
    SetToolBar();//设置工具条,同时获取固定URL参数
    hycode = GetQueryString("hycode", "");
	string orgcode = GetQueryString("orgcode","");
    string str2 = "";
    str2 = "fld_667_12,fld_667_13,fld_667_14,fld_667_19,fld_667_20,fld_667_21,fld_667_22,fld_667_23,fld_667_24,fld_667_25,fld_667_26,fld_667_27,fld_667_28,fld_667_29,fld_667_15,fld_667_16,fld_667_17,fld_667_18";

	view1.SqlStr = "select (select fld_658_2 from gmis_mo_658 where fld_658_1=fld_664_1),(select fld_658_4 from gmis_mo_658 where fld_658_1=fld_664_1), fld_664_1 from gmis_mo_664 b where fld_664_1='"+orgcode+"'";
    list1.SqlStr = "select fld_667_3,fld_667_4,fld_667_5,fld_667_6,fld_667_7,fld_667_8,fld_667_9,fld_667_10,fld_667_11 from gmis_mo_667 a left outer join gmis_mo_664 b on a.fld_667_1=b.fld_664_1 where fld_664_1='"+orgcode+"'";
    list2.SqlStr = "select " + str2 + " from gmis_mo_667 a left outer join gmis_mo_664 b on a.fld_667_1=b.fld_664_1 where fld_664_1='"+orgcode+"'";
    view2.SqlStr = "select fld_664_18,fld_664_2,fld_664_3,fld_664_4,fld_664_5,fld_664_6 from gmis_mo_664 b  where fld_664_1='"+orgcode+"'";
    list1.Rows = list1.DataTable.Rows.Count;
    list2.Rows = list2.DataTable.Rows.Count;

	iframe_658.Attributes["src"]="iframe_17.aspx?mid=" + mid + "&orgcode=" + StringUtility.StringToBase64(orgcode) +"&hycode="+StringUtility.StringToBase64(hycode) ;

}

</script>

<body style="padding:10px;text-align:center">
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
<!--内容-->    
<!--动态生成结束-->
    <table width="100%" border="0" cellpadding="3" cellspacing="1">
        <tr>
         <td style="width: 30%" rowspan="2">&nbsp;</td>
            <td style="width: 40%" align="center" valign="middle"  style="font-size: large;
                font-weight: bold;">
                废水处理设施普查表
            </td>
            <td style="width: 30%" rowspan="2">
               <table>
                    <tr>
                        <td>
                            制表机关：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            批准机关：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            文号：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            有效期至：
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr><td style="font-size:small; font-weight:normal; width:40%" align="center" >2007年</td></tr>
    </table>
<G:content id="view1" runat="server">
<G:template id="templateview1" runat="server">
	<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="right"  class="td_viewcontent_title_top">单位名称：</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
	     <td align="right"  class="td_viewcontent_title_top">单位代码：</td>
	    <td  class="td_viewcontent_content" style="width:35%">*&nbsp;</td>
    </tr>  
</table>
</G:template>
</G:content>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="center"  class="td_viewcontent_title_top" colspan="9">处理设施基本情况</td>	    
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_title" colspan="2">废水处理设施</td>
        <td align="center"  class="td_viewcontent_title" rowspan="2" >3.总投资额（万元）</td>
        <td align="center"  class="td_viewcontent_title"  rowspan="2"  >4.设计处理能力（吨/日）</td>
        <td align="center"  class="td_viewcontent_title"  rowspan="2" >5.运行费用（万元）</td>	 
         <td align="center"  class="td_viewcontent_title"  rowspan="2" >6.运行小时</td>	    
          <td align="center"  class="td_viewcontent_title"  rowspan="2" >7.耗电量（万千瓦时）</td>	    
           <td align="center"  class="td_viewcontent_title"  colspan="2" >废水实际处理量</td>	       
    </tr>  
    <tr>
       <td align="center"  class="td_viewcontent_title"  >1.编号</td>
        <td align="center"  class="td_viewcontent_title"   >2.名称</td>
          <td align="center"  class="td_viewcontent_title"  >8.处理本单位量</td>
        <td align="center"  class="td_viewcontent_title"   >9.处理外单位量</td>
        
        </tr>
        <G:listbox ID="list1" runat="server">
<G:Template id="tempview" runat="server">
            <tr>
                    <td align="center" class="td_viewcontent_content">
                        SZ--*&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                </tr>
                </G:Template> 
</G:listbox>
</table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr>
        <td align="center"  class="td_viewcontent_title_top" colspan="14">处理方法及主要污染物</td>	    
    </tr>  
     <tr>
        <td align="center"  class="td_viewcontent_title" rowspan="2" style="width:8%">1.废水处理设施编号</td>
        <td align="center"  class="td_viewcontent_title"  colspan="2"style="width:16%" >处理的废水类型</td>
        <td align="center"  class="td_viewcontent_title"  colspan="2" style="width:16%" >处理方法</td>
        <td align="center"  class="td_viewcontent_title"   colspan="9" style="width:60%" >处理的主要污染物</td>	     
    </tr>  
      <tr>
                    <td align="center" style="width:8%" class="td_viewcontent_title">
                        10.名称
                    </td>
                    <td align="center" style="width:8%" class="td_viewcontent_title">
                      11.代码
                    </td>
                    <td align="center"  style="width:8%" class="td_viewcontent_title">
                       12.名称
                    </td>
                    <td align="center" style="width:8%" class="td_viewcontent_title">
                       13.代码
                    </td>
                    <td align="center" style="width:7%"   class="td_viewcontent_title">
                       14.名称
                    </td>
                    <td align="center" style="width:5%"  class="td_viewcontent_title">
                      15.代码
                    </td>
                     <td align="center" style="width:8%"  class="td_viewcontent_title">
                      16.处理效率（%）
                    </td>
                     <td align="center"  style="width:7%"  class="td_viewcontent_title">
                     17.名称
                    </td>
                     <td align="center" style="width:5%"  class="td_viewcontent_title">
                      18.代码
                    </td>
                     <td align="center" style="width:8%"  class="td_viewcontent_title">
                      19.处理效率（%）
                    </td>
                     <td align="center" style="width:7%"  class="td_viewcontent_title">
                      20.名称
                    </td>
                     <td align="center" style="width:5%"  class="td_viewcontent_title">
                      21.代码
                    </td>
                     <td align="center" style="width:8%"  class="td_viewcontent_title">
                      22.处理效率（%）
                    </td>
                </tr>
                <G:listbox id="list2" runat="server">
                <G:template id="template2" runat="server">
                     <tr>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        SZ--*&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                     <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" rowspan="3">
                        *&nbsp
                    </td>
                    
                </tr>
                <tr>
                    <td align="center"  class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center"  class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    
                </tr>
                      <tr>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    <td align="center" class="td_viewcontent_content" >
                        *&nbsp
                    </td>
                    
                </tr>
                </G:template>
                </G:listbox>
    </table>
    <G:content id="view2" runat="server">
    <G:template id="templateview2" runat="server">
    <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
                <tr>
                    <td align="right" class="td_viewcontent_title">
                        单位负责人：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
                        *&nbsp;
                    </td>
                    <td align="right" class="td_viewcontent_title">
                        审核人：
                    </td>
                    <td class="td_viewcontent_content" style="width:35%">
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
                        200*年*月*日&nbsp;
                    </td>
                </tr>
            </table>
            </G:template>
            </G:content>

</form>
</body>
</html>