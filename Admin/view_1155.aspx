<!--城市污水处理厂运行情况  环年基5表,查看页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{    
     
    SetToolBar();//设置工具条,同时获取固定URL参数   
    view.SqlStr = "select fld_1155_1,fld_1202_2,fld_1202_12,fld_1202_6,fld_1202_7,fld_1202_8,fld_1202_9,fld_1202_10,fld_1202_11,fld_1202_1,fld_1202_3,fld_1202_5+'='+(select fld_1195_2 from gmis_mo_1195 where fld_1195_1=fld_1202_5),fld_1155_13+'='+(select fld_1171_2 from gmis_mo_1171 where fld_1171_1=fld_1155_13),fld_1155_14,fld_1155_15,fld_1155_16,fld_1155_17+'='+(select fld_1166_2 from gmis_mo_1166 where fld_1166_1=fld_1155_17),fld_1202_18,fld_1155_19,fld_1155_20+'='+(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1155_20),fld_1155_22,fld_1155_21+'='+(select fld_1164_2 from gmis_mo_1164 where fld_1164_1=fld_1155_21),fld_1155_23,fld_1155_32,fld_1155_24,fld_1155_33,fld_1155_25,fld_1155_34,fld_1155_26,fld_1155_35,fld_1155_27,fld_1155_36,fld_1155_28,fld_1155_37,fld_1155_29,fld_1155_38,fld_1155_30,fld_1155_39,fld_1155_31,fld_1155_40 from gmis_mo_1155 left outer join gmis_mo_1202 on fld_1202_2=fld_1155_2 where gmis_mo_1155.mocode=" + id; 
 }
</script>
<script>
    function click_hide(obj)
    {
        var a=document.getElementById(obj).style.display;
        if(a=="block")
        {
            document.getElementById(obj).style.display="none";
            document.getElementById('hide').title="展开";
        }
        else
        {
            document.getElementById(obj).style.display="block";
            document.getElementById('hide').title="收缩";
        }
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
<G:Content id="view" runat="server">
<G:Template id="Template1" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%"  ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" class="font_2635B_000">
          
城市污水处理厂运行情况（环年基5表）</td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<!--操作工具条-->

  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td rowspan="2" width=9% align="right"  class="td_viewcontent_title">统计年份</td>
      <td rowspan="2" width=9% align="left"  class="td_viewcontent_content">
        *&nbsp;
      </td>
      <td  width=9% rowspan="2" align="right"  class="td_viewcontent_title">企业法人代码</td>
      <td rowspan="2" width=11% align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" width=9% align="right"  class="td_viewcontent_title">联系电话</td>
      <td rowspan="2" width=9% align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td rowspan="2" width=9% align="right"  class="td_viewcontent_title">企业地理位置</td>
      <td width=12% class="td_viewcontent_content" nowrap>中心经度
      *°*′*′&nbsp;
      </td>
    </tr>
    <tr>
      <td nowrap  class="td_viewcontent_content" >中心纬度
        *°*′*′&nbsp;
        </td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">企业详细名称</td>
      <td colspan="7" align="left"  class="td_viewcontent_content">
        *&nbsp;
    </td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">企业详细地址</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>行政区域代码</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">污水处理级别</td>
      <td  align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>污水处理方法1</td>
      <td align="left" colspan=2  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>污水处理方法2</td>
      <td colspan=2 class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title" nowrap>污水处理方法3</td>
      <td colspan="2" align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>污水处理设施类型</td>
      <td align="left" colspan=2  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">开业时间</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">本年运行天数</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">排水去向类型</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title">受纳水体名称</td>
      <td align="left"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="right"  class="td_viewcontent_title" nowrap>受纳水体代码</td>
      <td class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">环年基5表</td>
            <td width="21"><img id="hide" onclick="click_hide('div_hide')" title="收缩" src="images/fanhuiliebiao_007.gif" width="11" height="11"></td>
          </tr>
      </table></td>
    </tr>
  </table>
    <div id="div_hide" style="display:block">
  <table width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
    <tr>
      <td align="center"  class="td_viewcontent_content">代码</td>
      <td align="center"  class="td_viewcontent_title">指标名称</td>
      <td align="center"  class="td_viewcontent_content">计量单位</td>
      <td align="center"  class="td_viewcontent_content">本年实际</td>
      <td align="center"  class="td_viewcontent_content">代码</td>
      <td align="center"  class="td_viewcontent_title">指标名称</td>
      <td align="center"  class="td_viewcontent_content">计量单位</td>
      <td align="center"  class="td_viewcontent_content">本年实际</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">甲</td>
      <td align="center"  class="td_viewcontent_title">乙</td>
      <td align="center"  class="td_viewcontent_content">丙</td>
      <td align="center"  class="td_viewcontent_content">1</td>
      <td align="center"  class="td_viewcontent_content">甲</td>
      <td align="center"  class="td_viewcontent_title">乙</td>
      <td align="center"  class="td_viewcontent_content">丙</td>
      <td align="center"  class="td_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">1</td>
      <td align="center"  class="td_viewcontent_title">1、污水设计处理能力</td>
      <td align="center"  class="td_viewcontent_content">吨/日</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">10</td>
      <td align="center"  class="td_viewcontent_title">9、处理后污水中总磷平均浓度</td>
      <td align="center"  class="td_viewcontent_content">毫克/升</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">2</td>
      <td align="center"  class="td_viewcontent_title">2、污水实际处理能力</td>
      <td align="center"  class="td_viewcontent_content">吨/日</td>
      <td align="center"  class="td_viewcontent_content">
        *&nbsp;
      </td>
      <td align="center"  class="td_viewcontent_content">11</td>
      <td align="center"  class="td_viewcontent_title">10、污泥产生量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">3</td>
      <td align="center"  class="td_viewcontent_title">3、污水年处理量</td>
      <td align="center"  class="td_viewcontent_content">万吨</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">12</td>
      <td align="center"  class="td_viewcontent_title">11、污泥处置量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">4</td>
      <td align="center"  class="td_viewcontent_title">其中：污水再生利用量</td>
      <td align="center"  class="td_viewcontent_content">万吨</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">13</td>
      <td align="center"  class="td_viewcontent_title">12、污泥利用量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">5</td>
      <td align="center"  class="td_viewcontent_title">4、处理前污水中化学需氧量平均浓度</td>
      <td align="center"  class="td_viewcontent_content">毫克/升</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">14</td>
      <td align="center"  class="td_viewcontent_title">13、污泥排放量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">6</td>
      <td align="center"  class="td_viewcontent_title">5、处理后污水中化学需氧量平均浓度</td>
      <td align="center"  class="td_viewcontent_content">毫克/升</td>
      <td align="center" class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">15</td>
      <td align="center"  class="td_viewcontent_title">14、本年运行费用</td>
      <td align="center"  class="td_viewcontent_content">万元</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">7</td>
      <td align="center"  class="td_viewcontent_title">6、处理前污水中氨氮平均浓度</td>
      <td align="center"  class="td_viewcontent_content">毫克/升</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">16</td>
      <td align="center"  class="td_viewcontent_title">其中：政府补贴</td>
      <td align="center"  class="td_viewcontent_content">万元</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">8</td>
      <td align="center"  class="td_viewcontent_title">7、处理后污水中氨氮平均浓度</td>
      <td align="center"  class="td_viewcontent_content">毫克/升</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">17</td>
      <td align="center"  class="td_viewcontent_title">　收费</td>
      <td align="center"  class="td_viewcontent_content">万元</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">9</td>
      <td align="center"  class="td_viewcontent_title">8、处理前污水中总磷平均浓度</td>
      <td align="center"  class="td_viewcontent_content">毫克/升</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">18</td>
      <td align="center"  class="td_viewcontent_title">15、耗电量</td>
      <td align="center"  class="td_viewcontent_content">万度</td>
      <td align="center"  class="td_viewcontent_content">*&nbsp;</td>
    </tr>
</table>
</div>
</G:Template>
</G:Content>
<!--动态生成html,结束-->
</form>
</body>
</html>
