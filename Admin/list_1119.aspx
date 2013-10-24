<!--废气污染物排放许可管理状态,列表页-->
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
}
public override void BeforeOutput(DataTable dt, int rowi)
{	//处理当前页数据

    DataRow dr = dt.Rows[rowi];
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
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="td_graybgcolor" style="margin-top:10px;">
  <tr>
    <td width="5"><img src="images/mid_top_toolbar01.gif" width="5" height="5"></td>
    <td ></td>
    <td width="5"><img src="images/mid_top_toolbar02.gif" width="5" height="5"></td>
  </tr>
    <tr>
      <td ></td>
      <td align="right" >
        <table width="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="left"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="30" align="center">年份</td>
              <td>
                <select name="select" style="width:100px; ">
                </select>
              </td>
              </tr>
          </table></td>
          <td width="65" align="left"><img src="images/fanhuiliebiao_002.gif" width="55" height="22"></td>
          <td width="55" align="right"><img src="images/fanhuiliebiao_001.gif" width="55" height="22"></td>
          <td width="81" align="right"><img src="images/fanhuiliebiao.gif" width="76" height="20"></td>
        </tr>
      </table></td>
      <td ></td>
    </tr>
  <tr>
    <td><img src="images/mid_top_toolbar04.gif" width="5" height="5"></td>
    <td ></td>
    <td><img src="images/mid_top_toolbar03.gif" width="5" height="5"></td>
  </tr>
</table>   
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%"  ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
      <tr>
        <td width="70%" align="right" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center" class="font_2635B_000">各地区重点调查工业污染排放及处理利用情况</td>
            </tr>
        </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="80%" align="right" valign="top" style="padding-top:25px; padding-right:250px; ">2006年</td>
              <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="font1220_000000">表　　号：环年综1-1表</td>
                </tr>
                <tr>
                  <td class="font1220_000000">制表机关：环境保护部</td>
                </tr>
                <tr>
                  <td class="font1220_000000">批准机关：国家统计局</td>
                </tr>
                <tr>
                  <td class="font1220_000000">批准文号：国统制[2008]号</td>
                </tr>
                <tr>
                  <td class="font1220_000000">有效截止时间：2010年　月　日</td>
                </tr>
              </table></td>
            </tr>
          </table>
          <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_000000">
            <tr>
              <td align="left">综合机关名称：310118青浦区</td>
              <td align="right" style="padding-right:10px; ">环年综1-1表</td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<!--操作工具条-->

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000" class="font1225_black">
    <tr class="font1225_black">
      <td align="center" bgcolor="#e1e1e1" >指标名称</td>
      <td align="center" bgcolor="#e1e1e1"  >计量单位</td>
      <td align="center" bgcolor="#e1e1e1" >代码</td>
      <td align="center" bgcolor="#e1e1e1"  >本年实际</td>
      <td align="center" bgcolor="#e1e1e1"  >指标名称</td>
      <td align="center" bgcolor="#e1e1e1"  >计量单位</td>
      <td align="center" bgcolor="#e1e1e1"  >代码</td>
      <td align="center" bgcolor="#e1e1e1"  >本年实际</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"  >企业基本情况</td>
      <td align="center" bgcolor="#FFFFFF"  >－</td>
      <td align="center" bgcolor="#FFFFFF"  >－</td>
      <td align="center" bgcolor="#FFFFFF" >－</td>
      <td align="center" bgcolor="#FFFFFF"  >其中：直排海的污水排放口数</td>
      <td align="center" bgcolor="#FFFFFF" >个</td>
      <td align="center" bgcolor="#FFFFFF"  >26</td>
      <td align="center" bgcolor="#FFFFFF"  >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"  >1、汇总工业企业数</td>
      <td align="center" bgcolor="#FFFFFF"  >个</td>
      <td align="center" bgcolor="#FFFFFF" >1</td>
      <td align="center" bgcolor="#FFFFFF"  >112</td>
      <td align="center" bgcolor="#FFFFFF"  >14、废水污染物在线监测仪器套数</td>
      <td align="center" bgcolor="#FFFFFF"  >套</td>
      <td align="center" bgcolor="#FFFFFF" >27</td>
      <td align="center" bgcolor="#FFFFFF" >7</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"  >2、工业总产值（现价）</td>
      <td align="center" bgcolor="#FFFFFF"  >万元</td>
      <td align="center" bgcolor="#FFFFFF" >2
      </td>
      <td align="center"  bgcolor="#FFFFFF" >1669624.3</td>
      <td align="center"  bgcolor="#FFFFFF" >14、废水污染物在线监测仪器套数</td>
      <td align="center" bgcolor="#FFFFFF" >套</td>
      <td align="center"  bgcolor="#FFFFFF" >28</td>
      <td align="center"  bgcolor="#FFFFFF" >1</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >3、“三废”综合利用产品产值</td>
      <td align="center"  bgcolor="#FFFFFF" >万元</td>
      <td align="center"  bgcolor="#FFFFFF" >3</td>
      <td align="center"  bgcolor="#FFFFFF" >3880.6</td>
      <td align="center"  bgcolor="#FFFFFF" >二、工业废水</td>
      <td align="center"  bgcolor="#FFFFFF" >－</td>
      <td align="center"  bgcolor="#FFFFFF" >－</td>
      <td align="center"  bgcolor="#FFFFFF" >-</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >4、企业专职环保人员数</td>
      <td align="center"  bgcolor="#FFFFFF" >个</td>
      <td align="center"  bgcolor="#FFFFFF" >4</td>
      <td align="center"  bgcolor="#FFFFFF" >343</td>
      <td align="center"  bgcolor="#FFFFFF" >1、废水治理设施数</td>
      <td align="center"  bgcolor="#FFFFFF" >套</td>
      <td align="center" bgcolor="#FFFFFF" >29</td>
      <td align="center"  bgcolor="#FFFFFF" >90</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >5、工业用水总量</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >5</td>
      <td align="center"  bgcolor="#FFFFFF" >2241.62</td>
      <td align="center" bgcolor="#FFFFFF" >2、废水治理设施处理能力</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨/日
     </td>
      <td align="center"  bgcolor="#FFFFFF" >30</td>
      <td align="center"  bgcolor="#FFFFFF" >3.43</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >其中：新鲜用水量</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"bgcolor="#FFFFFF" >6</td>
      <td align="center"  bgcolor="#FFFFFF" >1197.01</td>
      <td align="center"  bgcolor="#FFFFFF" >3、废水治理设施运行费用</td>
      <td align="center" bgcolor="#FFFFFF" >万元</td>
      <td align="center" bgcolor="#FFFFFF" >31</td>
      <td align="center"  bgcolor="#FFFFFF" >4654</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >　　重复用水量</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >7</td>
      <td align="center" bgcolor="#FFFFFF" >1044.62</td>
      <td align="center"  bgcolor="#FFFFFF" >4、工业用水重复利用率</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center" bgcolor="#FFFFFF" >32</td>
      <td align="center"  bgcolor="#FFFFFF" >46.6</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >6、工业煤炭消费总量</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >8</td>
      <td align="center"  bgcolor="#FFFFFF" >20.35</td>
      <td align="center"  bgcolor="#FFFFFF" >　5、工业废水处理量</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >33</td>
      <td align="center"  bgcolor="#FFFFFF" >589.42</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >其中：燃料煤消费量</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >9</td>
      <td align="center" bgcolor="#FFFFFF" >20.35</td>
      <td align="center"  bgcolor="#FFFFFF" >6、工业废水排放量</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >34</td>
      <td align="center"  bgcolor="#FFFFFF" >683.69</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >　　　原料煤消费量</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >10</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center"  bgcolor="#FFFFFF" >其中：直接排入海的</td>
      <td align="center" bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >35</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >7、燃料煤平均硫份（加权值）</td>
      <td align="center"  bgcolor="#FFFFFF" >%</td>
      <td align="center"  bgcolor="#FFFFFF" >11</td>
      <td align="center"  bgcolor="#FFFFFF" >0.68</td>
      <td align="center"  bgcolor="#FFFFFF" >　　　　　排入污水处理厂的</td>
      <td align="center" bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >36</td>
      <td align="center"  bgcolor="#FFFFFF" >268.42</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >8、燃料油消费量（不含车船用）</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >12</td>
      <td align="center"  bgcolor="#FFFFFF" >2.9</td>
      <td align="center" bgcolor="#FFFFFF" >7、工业废水排放达标量</td>
      <td align="center" bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >37</td>
      <td align="center"  bgcolor="#FFFFFF" >661.25</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >其中：重油</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center" bgcolor="#FFFFFF" >13</td>
      <td align="center"  bgcolor="#FFFFFF" >1.34</td>
      <td align="center"  bgcolor="#FFFFFF" >8、工业废水排放达标率</td>
      <td align="center" bgcolor="#FFFFFF" >%</td>
      <td align="center"  bgcolor="#FFFFFF" >38</td>
      <td align="center" bgcolor="#FFFFFF" >96.72</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >　　柴油</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >14</td>
      <td align="center" bgcolor="#FFFFFF" >1.56</td>
      <td align="center" bgcolor="#FFFFFF" >9、工业废水中污染物去除量</td>
      <td align="center"  bgcolor="#FFFFFF" >－</td>
      <td align="center"  bgcolor="#FFFFFF" >－</td>
      <td align="center" bgcolor="#FFFFFF" >-</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >9、重油平均硫份（加权值）</td>
      <td align="center"  bgcolor="#FFFFFF" >%</td>
      <td align="center" bgcolor="#FFFFFF" >15</td>
      <td align="center"  bgcolor="#FFFFFF" >0.44</td>
      <td align="center" bgcolor="#FFFFFF" >（1）化学需氧量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center" bgcolor="#FFFFFF" >39</td>
      <td align="center"  bgcolor="#FFFFFF" >5521.65</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >10、洁净燃气消费量</td>
      <td align="center"  bgcolor="#FFFFFF" >万标立方米</td>
      <td align="center" bgcolor="#FFFFFF" >16</td>
      <td align="center"  bgcolor="#FFFFFF" >48</td>
      <td align="center"  bgcolor="#FFFFFF" >其中：当年新增设施去除的</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >40</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >11、焦炭消费量</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >17</td>
      <td align="center"  bgcolor="#FFFFFF" >&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >（2）氨氮</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >41</td>
      <td align="center"  bgcolor="#FFFFFF" >114.55</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >12、其他燃料消费量</td>
      <td align="center"  bgcolor="#FFFFFF" >万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >18</td>
      <td align="center"  bgcolor="#FFFFFF" >&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >（3）石油类</td>
      <td align="center" bgcolor="#FFFFFF" >吨</td>
      <td align="center" bgcolor="#FFFFFF" >42</td>
      <td align="center" bgcolor="#FFFFFF" >31.35</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >11、工业锅炉数</td>
      <td align="center"  bgcolor="#FFFFFF" >台/蒸吨</td>
      <td align="center"  bgcolor="#FFFFFF" >19</td>
      <td align="center" bgcolor="#FFFFFF" >126/&nbsp;&nbsp;&nbsp;&nbsp;665.9</td>
      <td align="center"  bgcolor="#FFFFFF" >（4）挥发酚</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center" bgcolor="#FFFFFF" >43</td>
      <td align="center"  bgcolor="#FFFFFF" >0.03</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >其中：烟尘排放达标的</td>
      <td align="center"  bgcolor="#FFFFFF" >台/蒸吨</td>
      <td align="center"  bgcolor="#FFFFFF" >20</td>
      <td align="center"  bgcolor="#FFFFFF" >126/&nbsp;&nbsp;&nbsp;&nbsp;665.9</td>
      <td align="center"  bgcolor="#FFFFFF" >（5）氰化物</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center" bgcolor="#FFFFFF" >44</td>
      <td align="center" bgcolor="#FFFFFF" >0.02</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >二氧化硫排放达标的</td>
      <td align="center"  bgcolor="#FFFFFF" >台/蒸吨</td>
      <td align="center"  bgcolor="#FFFFFF" >21</td>
      <td align="center"  bgcolor="#FFFFFF" >126/&nbsp;&nbsp;&nbsp;&nbsp;660.9</td>
      <td align="center" bgcolor="#FFFFFF" >10、工业废水中污染物排放量</td>
      <td align="center"  bgcolor="#FFFFFF" >－</td>
      <td align="center"  bgcolor="#FFFFFF" >-</td>
      <td align="center"  bgcolor="#FFFFFF" >-</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >12、工业炉窑数</td>
      <td align="center"  bgcolor="#FFFFFF" >座</td>
      <td align="center"  bgcolor="#FFFFFF" >22</td>
      <td align="center"  bgcolor="#FFFFFF" >52</td>
      <td align="center"  bgcolor="#FFFFFF" >（1）化学需氧量</td>
      <td align="center" bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >45</td>
      <td align="center"  bgcolor="#FFFFFF" >436.5</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >其中：烟尘排放达标的</td>
      <td align="center"  bgcolor="#FFFFFF" >座</td>
      <td align="center" bgcolor="#FFFFFF" >23</td>
      <td align="center"  bgcolor="#FFFFFF" >52</td>
      <td align="center"  bgcolor="#FFFFFF" >（2）氨氮</td>
      <td align="center" bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >46</td>
      <td align="center"  bgcolor="#FFFFFF" >28.09</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >二氧化硫排放达标的</td>
      <td align="center"  bgcolor="#FFFFFF" >座</td>
      <td align="center"  bgcolor="#FFFFFF" >24</td>
      <td align="center"  bgcolor="#FFFFFF" >51</td>
      <td align="center" bgcolor="#FFFFFF" >（3）石油类</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center" bgcolor="#FFFFFF" >47</td>
      <td align="center"  bgcolor="#FFFFFF" >1.21</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >13、污水排放口数</td>
      <td align="center"  bgcolor="#FFFFFF" >个</td>
      <td align="center"  bgcolor="#FFFFFF" >25</td>
      <td align="center"  bgcolor="#FFFFFF" >118</td>
      <td align="center" bgcolor="#FFFFFF" >（4）挥发酚</td>
      <td align="center"  bgcolor="#FFFFFF"> 吨</td>
      <td align="center"  bgcolor="#FFFFFF" >48</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr align="left">
      <td align="center" bgcolor="#FFFFFF" >（5）氰化物</td>
      <td align="center" bgcolor="#FFFFFF" >吨</td>
      <td align="center" bgcolor="#FFFFFF" >49</td>
      <td align="center" bgcolor="#FFFFFF" >0.01</td>
      <td align="center" bgcolor="#FFFFFF" >12、工业粉尘排放量</td>
      <td align="center" bgcolor="#FFFFFF" >吨</td>
      <td align="center" bgcolor="#FFFFFF" >80</td>
      <td align="center" bgcolor="#FFFFFF" >167.43</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >（6）砷</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >50</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >其中：排放达标量</td>
      <td align="center"  bgcolor="#FFFFFF">吨</td>
      <td align="center"  bgcolor="#FFFFFF" >81</td>
      <td align="center"  bgcolor="#FFFFFF" >167.43</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >（7）铅</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >51</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >四、工业固体废物</td>
      <td align="center"  bgcolor="#FFFFFF">－</td>
      <td align="center"  bgcolor="#FFFFFF" >－</td>
      <td align="center"  bgcolor="#FFFFFF" >－</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >（8）汞</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >52</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >1、工业固体废物产生量</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >82</td>
      <td align="center"  bgcolor="#FFFFFF" >7.43</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >（9）镉</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >53</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >（1）危险废物</td>
      <td align="center"  bgcolor="#FFFFFF">吨</td>
      <td align="center"  bgcolor="#FFFFFF" >83</td>
      <td align="center"  bgcolor="#FFFFFF" >8075.1</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >（10）六价铬</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >54</td>
      <td align="center"  bgcolor="#FFFFFF" >0.02</td>
      <td align="center" bgcolor="#FFFFFF" >（2）冶炼废渣</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >84</td>
      <td align="center"  bgcolor="#FFFFFF" >0.14</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >三、工业废气</td>
      <td align="center"  bgcolor="#FFFFFF" >－</td>
      <td align="center"  bgcolor="#FFFFFF" >－</td>
      <td align="center"  bgcolor="#FFFFFF" >－</td>
      <td align="center" bgcolor="#FFFFFF" >（3）粉煤灰</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >85</td>
      <td align="center"  bgcolor="#FFFFFF" >1</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >1、工业废气排放量</td>
      <td align="center"  bgcolor="#FFFFFF" >万标立方米</td>
      <td align="center"  bgcolor="#FFFFFF" >55</td>
      <td align="center"  bgcolor="#FFFFFF" >1263777</td>
      <td align="center" bgcolor="#FFFFFF" >（4）炉渣</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >86</td>
      <td align="center"  bgcolor="#FFFFFF" >2.46</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：燃料燃烧过程中排放量</td>
      <td align="center"  bgcolor="#FFFFFF" >万标立方米</td>
      <td align="center"  bgcolor="#FFFFFF" >56</td>
      <td align="center"  bgcolor="#FFFFFF" >310143</td>
      <td align="center" bgcolor="#FFFFFF" >（5）煤矸石</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >87</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >　　　生产工艺过程中排放量</td>
      <td align="center"  bgcolor="#FFFFFF" >万标立方米</td>
      <td align="center"  bgcolor="#FFFFFF" >57</td>
      <td align="center"  bgcolor="#FFFFFF" >953634</td>
      <td align="center" bgcolor="#FFFFFF" >（6）尾矿</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >88</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >2、废气治理设施数</td>
      <td align="center"  bgcolor="#FFFFFF" >套</td>
      <td align="center"  bgcolor="#FFFFFF" >58</td>
      <td align="center"  bgcolor="#FFFFFF" >292</td>
      <td align="center" bgcolor="#FFFFFF" >（7）放身性废物</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >89</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：脱硫设施数</td>
      <td align="center"  bgcolor="#FFFFFF" >套</td>
      <td align="center"  bgcolor="#FFFFFF" >59</td>
      <td align="center"  bgcolor="#FFFFFF" >4</td>
      <td align="center" bgcolor="#FFFFFF" >（8）脱硫石膏</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >90</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >3、废气治理设施处理能力</td>
      <td align="center"  bgcolor="#FFFFFF" >万标立方米/时</td>
      <td align="center"  bgcolor="#FFFFFF" >60</td>
      <td align="center"  bgcolor="#FFFFFF" >196.68</td>
      <td align="center" bgcolor="#FFFFFF" >（9）其他废物</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >91</td>
      <td align="center"  bgcolor="#FFFFFF" >3.01</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：脱硫设施脱硫能力</td>
      <td align="center"  bgcolor="#FFFFFF" >吨/时</td>
      <td align="center"  bgcolor="#FFFFFF" >61</td>
      <td align="center"  bgcolor="#FFFFFF" >0.27</td>
      <td align="center" bgcolor="#FFFFFF" >2、工业固体废物综合利用量</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >92</td>
      <td align="center"  bgcolor="#FFFFFF" >2.64</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >4、废气治理设施运行费用</td>
      <td align="center"  bgcolor="#FFFFFF" >万元</td>
      <td align="center"  bgcolor="#FFFFFF" >62</td>
      <td align="center"  bgcolor="#FFFFFF" >1479.6</td>
      <td align="center" bgcolor="#FFFFFF" >（1）危险废物</td>
      <td align="center"  bgcolor="#FFFFFF">吨</td>
      <td align="center"  bgcolor="#FFFFFF" >93</td>
      <td align="center"  bgcolor="#FFFFFF" >1393</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：脱硫设施运行费用</td>
      <td align="center"  bgcolor="#FFFFFF" >万元</td>
      <td align="center"  bgcolor="#FFFFFF" >63</td>
      <td align="center"  bgcolor="#FFFFFF" >210</td>
      <td align="center" bgcolor="#FFFFFF" >（2）冶炼废渣</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >94</td>
      <td align="center"  bgcolor="#FFFFFF" >0.14</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >5、二氧化硫去除量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >64</td>
      <td align="center"  bgcolor="#FFFFFF" >2027.94</td>
      <td align="center" bgcolor="#FFFFFF" >（3）粉煤灰</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >95</td>
      <td align="center"  bgcolor="#FFFFFF" >1</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：燃料燃烧过程中去除量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >65</td>
      <td align="center"  bgcolor="#FFFFFF" >2027.94</td>
      <td align="center" bgcolor="#FFFFFF" >（4）炉渣</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >96</td>
      <td align="center"  bgcolor="#FFFFFF" >2.46</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >　　　生产工艺过程中去除量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >66</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >（5）煤矸石</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >97</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：当年新增设施去除量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >67</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >（6）尾矿</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >98</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >6、二氧化硫排放量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >68</td>
      <td align="center"  bgcolor="#FFFFFF" >2243.31</td>
      <td align="center" bgcolor="#FFFFFF" >（7）脱硫石膏</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >99</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：燃料燃烧过程中排放量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >69</td>
      <td align="center"  bgcolor="#FFFFFF" >2243.31</td>
      <td align="center" bgcolor="#FFFFFF" >（8）其他废物</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >100</td>
      <td align="center"  bgcolor="#FFFFFF" >2.49</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：排放达标量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >70</td>
      <td align="center"  bgcolor="#FFFFFF" >2181.21</td>
      <td align="center" bgcolor="#FFFFFF" >其中：综合利用往年贮存量</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >101</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：生产工艺过程中排放量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >71</td>
      <td align="center"  bgcolor="#FFFFFF" >0.17</td>
      <td align="center" bgcolor="#FFFFFF" >3、工业固体废物综合利用率</td>
      <td align="center"  bgcolor="#FFFFFF">%</td>
      <td align="center"  bgcolor="#FFFFFF" >102</td>
      <td align="center"  bgcolor="#FFFFFF" >84.02</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：排放达标量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >72</td>
      <td align="center"  bgcolor="#FFFFFF" >0.17</td>
      <td align="center" bgcolor="#FFFFFF" >4、工业固体废物贮存量</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >103</td>
      <td align="center"  bgcolor="#FFFFFF" >0.02</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >7、氮氧化物去除量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >73</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >其中：危险废物贮存量</td>
      <td align="center"  bgcolor="#FFFFFF">吨</td>
      <td align="center"  bgcolor="#FFFFFF" >104</td>
      <td align="center"  bgcolor="#FFFFFF" >200</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >8、氮氧化物排放量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >74</td>
      <td align="center"  bgcolor="#FFFFFF" >1610.62</td>
      <td align="center" bgcolor="#FFFFFF" >5、工业固体废物处置量</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >105</td>
      <td align="center"  bgcolor="#FFFFFF" >1.17</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：排放达标量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >75</td>
      <td align="center"  bgcolor="#FFFFFF" >1610.62</td>
      <td align="center" bgcolor="#FFFFFF" >其中：危险废物处置量</td>
      <td align="center"  bgcolor="#FFFFFF">吨</td>
      <td align="center"  bgcolor="#FFFFFF" >106</td>
      <td align="center"  bgcolor="#FFFFFF" >6482.1</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >9、烟尘去除量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >76</td>
      <td align="center"  bgcolor="#FFFFFF" >4192.82</td>
      <td align="center" bgcolor="#FFFFFF" >其中：送往集中处置声处置量</td>
      <td align="center"  bgcolor="#FFFFFF">吨</td>
      <td align="center"  bgcolor="#FFFFFF" >107</td>
      <td align="center"  bgcolor="#FFFFFF" >5788.1</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >10、烟尘排放量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >77</td>
      <td align="center"  bgcolor="#FFFFFF" >790.98</td>
      <td align="center" bgcolor="#FFFFFF" >其中：处置往年贮存量</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >108</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >其中：排放达标量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >78</td>
      <td align="center"  bgcolor="#FFFFFF" >784.82</td>
      <td align="center" bgcolor="#FFFFFF" >6、工业固体废物排放量</td>
      <td align="center"  bgcolor="#FFFFFF">万吨</td>
      <td align="center"  bgcolor="#FFFFFF" >109</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >11、工业粉尘去除量</td>
      <td align="center"  bgcolor="#FFFFFF" >吨</td>
      <td align="center"  bgcolor="#FFFFFF" >79</td>
      <td align="center"  bgcolor="#FFFFFF" >1145.13</td>
      <td align="center" bgcolor="#FFFFFF" >其中：危险废物排放量</td>
      <td align="center"  bgcolor="#FFFFFF">吨</td>
      <td align="center"  bgcolor="#FFFFFF" >110</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
</table>
<!--动态生成html,结束-->
</form>
</body>
</html>
