<!--������Ⱦ���ŷ���ɹ���״̬,�б�ҳ-->
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

    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
}
public override void BeforeOutput(DataTable dt, int rowi)
{	//����ǰҳ����

    DataRow dr = dt.Rows[rowi];
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
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
              <td width="30" align="center">���</td>
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
              <td align="center" class="font_2635B_000">�������ص���鹤ҵ��Ⱦ�ŷż������������</td>
            </tr>
        </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="80%" align="right" valign="top" style="padding-top:25px; padding-right:250px; ">2006��</td>
              <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="font1220_000000">�����ţ�������1-1��</td>
                </tr>
                <tr>
                  <td class="font1220_000000">�Ʊ���أ�����������</td>
                </tr>
                <tr>
                  <td class="font1220_000000">��׼���أ�����ͳ�ƾ�</td>
                </tr>
                <tr>
                  <td class="font1220_000000">��׼�ĺţ���ͳ��[2008]��</td>
                </tr>
                <tr>
                  <td class="font1220_000000">��Ч��ֹʱ�䣺2010�ꡡ�¡���</td>
                </tr>
              </table></td>
            </tr>
          </table>
          <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_000000">
            <tr>
              <td align="left">�ۺϻ������ƣ�310118������</td>
              <td align="right" style="padding-right:10px; ">������1-1��</td>
            </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<!--����������-->

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000" class="font1225_black">
    <tr class="font1225_black">
      <td align="center" bgcolor="#e1e1e1" >ָ������</td>
      <td align="center" bgcolor="#e1e1e1"  >������λ</td>
      <td align="center" bgcolor="#e1e1e1" >����</td>
      <td align="center" bgcolor="#e1e1e1"  >����ʵ��</td>
      <td align="center" bgcolor="#e1e1e1"  >ָ������</td>
      <td align="center" bgcolor="#e1e1e1"  >������λ</td>
      <td align="center" bgcolor="#e1e1e1"  >����</td>
      <td align="center" bgcolor="#e1e1e1"  >����ʵ��</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"  >��ҵ�������</td>
      <td align="center" bgcolor="#FFFFFF"  >��</td>
      <td align="center" bgcolor="#FFFFFF"  >��</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF"  >���У�ֱ�ź�����ˮ�ŷſ���</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF"  >26</td>
      <td align="center" bgcolor="#FFFFFF"  >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"  >1�����ܹ�ҵ��ҵ��</td>
      <td align="center" bgcolor="#FFFFFF"  >��</td>
      <td align="center" bgcolor="#FFFFFF" >1</td>
      <td align="center" bgcolor="#FFFFFF"  >112</td>
      <td align="center" bgcolor="#FFFFFF"  >14����ˮ��Ⱦ�����߼����������</td>
      <td align="center" bgcolor="#FFFFFF"  >��</td>
      <td align="center" bgcolor="#FFFFFF" >27</td>
      <td align="center" bgcolor="#FFFFFF" >7</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"  >2����ҵ�ܲ�ֵ���ּۣ�</td>
      <td align="center" bgcolor="#FFFFFF"  >��Ԫ</td>
      <td align="center" bgcolor="#FFFFFF" >2
      </td>
      <td align="center"  bgcolor="#FFFFFF" >1669624.3</td>
      <td align="center"  bgcolor="#FFFFFF" >14����ˮ��Ⱦ�����߼����������</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >28</td>
      <td align="center"  bgcolor="#FFFFFF" >1</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >3�������ϡ��ۺ����ò�Ʒ��ֵ</td>
      <td align="center"  bgcolor="#FFFFFF" >��Ԫ</td>
      <td align="center"  bgcolor="#FFFFFF" >3</td>
      <td align="center"  bgcolor="#FFFFFF" >3880.6</td>
      <td align="center"  bgcolor="#FFFFFF" >������ҵ��ˮ</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >-</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >4����ҵרְ������Ա��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >4</td>
      <td align="center"  bgcolor="#FFFFFF" >343</td>
      <td align="center"  bgcolor="#FFFFFF" >1����ˮ������ʩ��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >29</td>
      <td align="center"  bgcolor="#FFFFFF" >90</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >5����ҵ��ˮ����</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >5</td>
      <td align="center"  bgcolor="#FFFFFF" >2241.62</td>
      <td align="center" bgcolor="#FFFFFF" >2����ˮ������ʩ��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���/��
     </td>
      <td align="center"  bgcolor="#FFFFFF" >30</td>
      <td align="center"  bgcolor="#FFFFFF" >3.43</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >���У�������ˮ��</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"bgcolor="#FFFFFF" >6</td>
      <td align="center"  bgcolor="#FFFFFF" >1197.01</td>
      <td align="center"  bgcolor="#FFFFFF" >3����ˮ������ʩ���з���</td>
      <td align="center" bgcolor="#FFFFFF" >��Ԫ</td>
      <td align="center" bgcolor="#FFFFFF" >31</td>
      <td align="center"  bgcolor="#FFFFFF" >4654</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >�����ظ���ˮ��</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >7</td>
      <td align="center" bgcolor="#FFFFFF" >1044.62</td>
      <td align="center"  bgcolor="#FFFFFF" >4����ҵ��ˮ�ظ�������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center" bgcolor="#FFFFFF" >32</td>
      <td align="center"  bgcolor="#FFFFFF" >46.6</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >6����ҵú̿��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >8</td>
      <td align="center"  bgcolor="#FFFFFF" >20.35</td>
      <td align="center"  bgcolor="#FFFFFF" >��5����ҵ��ˮ������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >33</td>
      <td align="center"  bgcolor="#FFFFFF" >589.42</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >���У�ȼ��ú������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >9</td>
      <td align="center" bgcolor="#FFFFFF" >20.35</td>
      <td align="center"  bgcolor="#FFFFFF" >6����ҵ��ˮ�ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >34</td>
      <td align="center"  bgcolor="#FFFFFF" >683.69</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >������ԭ��ú������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >10</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center"  bgcolor="#FFFFFF" >���У�ֱ�����뺣��</td>
      <td align="center" bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >35</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >7��ȼ��úƽ����ݣ���Ȩֵ��</td>
      <td align="center"  bgcolor="#FFFFFF" >%</td>
      <td align="center"  bgcolor="#FFFFFF" >11</td>
      <td align="center"  bgcolor="#FFFFFF" >0.68</td>
      <td align="center"  bgcolor="#FFFFFF" >����������������ˮ������</td>
      <td align="center" bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >36</td>
      <td align="center"  bgcolor="#FFFFFF" >268.42</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >8��ȼ���������������������ã�</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >12</td>
      <td align="center"  bgcolor="#FFFFFF" >2.9</td>
      <td align="center" bgcolor="#FFFFFF" >7����ҵ��ˮ�ŷŴ����</td>
      <td align="center" bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >37</td>
      <td align="center"  bgcolor="#FFFFFF" >661.25</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >���У�����</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center" bgcolor="#FFFFFF" >13</td>
      <td align="center"  bgcolor="#FFFFFF" >1.34</td>
      <td align="center"  bgcolor="#FFFFFF" >8����ҵ��ˮ�ŷŴ����</td>
      <td align="center" bgcolor="#FFFFFF" >%</td>
      <td align="center"  bgcolor="#FFFFFF" >38</td>
      <td align="center" bgcolor="#FFFFFF" >96.72</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >14</td>
      <td align="center" bgcolor="#FFFFFF" >1.56</td>
      <td align="center" bgcolor="#FFFFFF" >9����ҵ��ˮ����Ⱦ��ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >-</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >9������ƽ����ݣ���Ȩֵ��</td>
      <td align="center"  bgcolor="#FFFFFF" >%</td>
      <td align="center" bgcolor="#FFFFFF" >15</td>
      <td align="center"  bgcolor="#FFFFFF" >0.44</td>
      <td align="center" bgcolor="#FFFFFF" >��1����ѧ������</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >39</td>
      <td align="center"  bgcolor="#FFFFFF" >5521.65</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >10���ྻȼ��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���������</td>
      <td align="center" bgcolor="#FFFFFF" >16</td>
      <td align="center"  bgcolor="#FFFFFF" >48</td>
      <td align="center"  bgcolor="#FFFFFF" >���У�����������ʩȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >40</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >11����̿������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >17</td>
      <td align="center"  bgcolor="#FFFFFF" >&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >��2������</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >41</td>
      <td align="center"  bgcolor="#FFFFFF" >114.55</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >12������ȼ��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >18</td>
      <td align="center"  bgcolor="#FFFFFF" >&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >��3��ʯ����</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >42</td>
      <td align="center" bgcolor="#FFFFFF" >31.35</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >11����ҵ��¯��</td>
      <td align="center"  bgcolor="#FFFFFF" >̨/����</td>
      <td align="center"  bgcolor="#FFFFFF" >19</td>
      <td align="center" bgcolor="#FFFFFF" >126/&nbsp;&nbsp;&nbsp;&nbsp;665.9</td>
      <td align="center"  bgcolor="#FFFFFF" >��4���ӷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >43</td>
      <td align="center"  bgcolor="#FFFFFF" >0.03</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >���У��̳��ŷŴ���</td>
      <td align="center"  bgcolor="#FFFFFF" >̨/����</td>
      <td align="center"  bgcolor="#FFFFFF" >20</td>
      <td align="center"  bgcolor="#FFFFFF" >126/&nbsp;&nbsp;&nbsp;&nbsp;665.9</td>
      <td align="center"  bgcolor="#FFFFFF" >��5���軯��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >44</td>
      <td align="center" bgcolor="#FFFFFF" >0.02</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���������ŷŴ���</td>
      <td align="center"  bgcolor="#FFFFFF" >̨/����</td>
      <td align="center"  bgcolor="#FFFFFF" >21</td>
      <td align="center"  bgcolor="#FFFFFF" >126/&nbsp;&nbsp;&nbsp;&nbsp;660.9</td>
      <td align="center" bgcolor="#FFFFFF" >10����ҵ��ˮ����Ⱦ���ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >-</td>
      <td align="center"  bgcolor="#FFFFFF" >-</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >12����ҵ¯Ҥ��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >22</td>
      <td align="center"  bgcolor="#FFFFFF" >52</td>
      <td align="center"  bgcolor="#FFFFFF" >��1����ѧ������</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >45</td>
      <td align="center"  bgcolor="#FFFFFF" >436.5</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >���У��̳��ŷŴ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >23</td>
      <td align="center"  bgcolor="#FFFFFF" >52</td>
      <td align="center"  bgcolor="#FFFFFF" >��2������</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >46</td>
      <td align="center"  bgcolor="#FFFFFF" >28.09</td>
    </tr>
    <tr>
      <td align="center"  bgcolor="#FFFFFF" >���������ŷŴ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >24</td>
      <td align="center"  bgcolor="#FFFFFF" >51</td>
      <td align="center" bgcolor="#FFFFFF" >��3��ʯ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >47</td>
      <td align="center"  bgcolor="#FFFFFF" >1.21</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >13����ˮ�ŷſ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >25</td>
      <td align="center"  bgcolor="#FFFFFF" >118</td>
      <td align="center" bgcolor="#FFFFFF" >��4���ӷ���</td>
      <td align="center"  bgcolor="#FFFFFF"> ��</td>
      <td align="center"  bgcolor="#FFFFFF" >48</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr align="left">
      <td align="center" bgcolor="#FFFFFF" >��5���軯��</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >49</td>
      <td align="center" bgcolor="#FFFFFF" >0.01</td>
      <td align="center" bgcolor="#FFFFFF" >12����ҵ�۳��ŷ���</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >80</td>
      <td align="center" bgcolor="#FFFFFF" >167.43</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >��6����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >50</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >���У��ŷŴ����</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >81</td>
      <td align="center"  bgcolor="#FFFFFF" >167.43</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >��7��Ǧ</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >51</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >�ġ���ҵ�������</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >��8����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >52</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >1����ҵ������������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >82</td>
      <td align="center"  bgcolor="#FFFFFF" >7.43</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >��9����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >53</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >��1��Σ�շ���</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >83</td>
      <td align="center"  bgcolor="#FFFFFF" >8075.1</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >��10�����۸�</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >54</td>
      <td align="center"  bgcolor="#FFFFFF" >0.02</td>
      <td align="center" bgcolor="#FFFFFF" >��2��ұ������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >84</td>
      <td align="center"  bgcolor="#FFFFFF" >0.14</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >������ҵ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >��3����ú��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >85</td>
      <td align="center"  bgcolor="#FFFFFF" >1</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >1����ҵ�����ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >���������</td>
      <td align="center"  bgcolor="#FFFFFF" >55</td>
      <td align="center"  bgcolor="#FFFFFF" >1263777</td>
      <td align="center" bgcolor="#FFFFFF" >��4��¯��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >86</td>
      <td align="center"  bgcolor="#FFFFFF" >2.46</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У�ȼ��ȼ�չ������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >���������</td>
      <td align="center"  bgcolor="#FFFFFF" >56</td>
      <td align="center"  bgcolor="#FFFFFF" >310143</td>
      <td align="center" bgcolor="#FFFFFF" >��5��ú�ʯ</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >87</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >�������������չ������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >���������</td>
      <td align="center"  bgcolor="#FFFFFF" >57</td>
      <td align="center"  bgcolor="#FFFFFF" >953634</td>
      <td align="center" bgcolor="#FFFFFF" >��6��β��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >88</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >2������������ʩ��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >58</td>
      <td align="center"  bgcolor="#FFFFFF" >292</td>
      <td align="center" bgcolor="#FFFFFF" >��7�������Է���</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >89</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У�������ʩ��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >59</td>
      <td align="center"  bgcolor="#FFFFFF" >4</td>
      <td align="center" bgcolor="#FFFFFF" >��8������ʯ��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >90</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >3������������ʩ��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���������/ʱ</td>
      <td align="center"  bgcolor="#FFFFFF" >60</td>
      <td align="center"  bgcolor="#FFFFFF" >196.68</td>
      <td align="center" bgcolor="#FFFFFF" >��9����������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >91</td>
      <td align="center"  bgcolor="#FFFFFF" >3.01</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У�������ʩ��������</td>
      <td align="center"  bgcolor="#FFFFFF" >��/ʱ</td>
      <td align="center"  bgcolor="#FFFFFF" >61</td>
      <td align="center"  bgcolor="#FFFFFF" >0.27</td>
      <td align="center" bgcolor="#FFFFFF" >2����ҵ��������ۺ�������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >92</td>
      <td align="center"  bgcolor="#FFFFFF" >2.64</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >4������������ʩ���з���</td>
      <td align="center"  bgcolor="#FFFFFF" >��Ԫ</td>
      <td align="center"  bgcolor="#FFFFFF" >62</td>
      <td align="center"  bgcolor="#FFFFFF" >1479.6</td>
      <td align="center" bgcolor="#FFFFFF" >��1��Σ�շ���</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >93</td>
      <td align="center"  bgcolor="#FFFFFF" >1393</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У�������ʩ���з���</td>
      <td align="center"  bgcolor="#FFFFFF" >��Ԫ</td>
      <td align="center"  bgcolor="#FFFFFF" >63</td>
      <td align="center"  bgcolor="#FFFFFF" >210</td>
      <td align="center" bgcolor="#FFFFFF" >��2��ұ������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >94</td>
      <td align="center"  bgcolor="#FFFFFF" >0.14</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >5����������ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >64</td>
      <td align="center"  bgcolor="#FFFFFF" >2027.94</td>
      <td align="center" bgcolor="#FFFFFF" >��3����ú��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >95</td>
      <td align="center"  bgcolor="#FFFFFF" >1</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У�ȼ��ȼ�չ�����ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >65</td>
      <td align="center"  bgcolor="#FFFFFF" >2027.94</td>
      <td align="center" bgcolor="#FFFFFF" >��4��¯��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >96</td>
      <td align="center"  bgcolor="#FFFFFF" >2.46</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >�������������չ�����ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >66</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >��5��ú�ʯ</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >97</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У�����������ʩȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >67</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >��6��β��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >98</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >6�����������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >68</td>
      <td align="center"  bgcolor="#FFFFFF" >2243.31</td>
      <td align="center" bgcolor="#FFFFFF" >��7������ʯ��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >99</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У�ȼ��ȼ�չ������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >69</td>
      <td align="center"  bgcolor="#FFFFFF" >2243.31</td>
      <td align="center" bgcolor="#FFFFFF" >��8����������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >100</td>
      <td align="center"  bgcolor="#FFFFFF" >2.49</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У��ŷŴ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >70</td>
      <td align="center"  bgcolor="#FFFFFF" >2181.21</td>
      <td align="center" bgcolor="#FFFFFF" >���У��ۺ���������������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >101</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У��������չ������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >71</td>
      <td align="center"  bgcolor="#FFFFFF" >0.17</td>
      <td align="center" bgcolor="#FFFFFF" >3����ҵ��������ۺ�������</td>
      <td align="center"  bgcolor="#FFFFFF">%</td>
      <td align="center"  bgcolor="#FFFFFF" >102</td>
      <td align="center"  bgcolor="#FFFFFF" >84.02</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У��ŷŴ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >72</td>
      <td align="center"  bgcolor="#FFFFFF" >0.17</td>
      <td align="center" bgcolor="#FFFFFF" >4����ҵ�������������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >103</td>
      <td align="center"  bgcolor="#FFFFFF" >0.02</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >7����������ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >73</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
      <td align="center" bgcolor="#FFFFFF" >���У�Σ�շ���������</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >104</td>
      <td align="center"  bgcolor="#FFFFFF" >200</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >8�����������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >74</td>
      <td align="center"  bgcolor="#FFFFFF" >1610.62</td>
      <td align="center" bgcolor="#FFFFFF" >5����ҵ������ﴦ����</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >105</td>
      <td align="center"  bgcolor="#FFFFFF" >1.17</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У��ŷŴ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >75</td>
      <td align="center"  bgcolor="#FFFFFF" >1610.62</td>
      <td align="center" bgcolor="#FFFFFF" >���У�Σ�շ��ﴦ����</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >106</td>
      <td align="center"  bgcolor="#FFFFFF" >6482.1</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >9���̳�ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >76</td>
      <td align="center"  bgcolor="#FFFFFF" >4192.82</td>
      <td align="center" bgcolor="#FFFFFF" >���У��������д�����������</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >107</td>
      <td align="center"  bgcolor="#FFFFFF" >5788.1</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >10���̳��ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >77</td>
      <td align="center"  bgcolor="#FFFFFF" >790.98</td>
      <td align="center" bgcolor="#FFFFFF" >���У���������������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >108</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >���У��ŷŴ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >78</td>
      <td align="center"  bgcolor="#FFFFFF" >784.82</td>
      <td align="center" bgcolor="#FFFFFF" >6����ҵ��������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >109</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" >11����ҵ�۳�ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >79</td>
      <td align="center"  bgcolor="#FFFFFF" >1145.13</td>
      <td align="center" bgcolor="#FFFFFF" >���У�Σ�շ����ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >110</td>
      <td align="center"  bgcolor="#FFFFFF" >0</td>
    </tr>
</table>
<!--��̬����html,����-->
</form>
</body>
</html>
