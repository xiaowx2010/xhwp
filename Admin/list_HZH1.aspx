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
    tb_2.Visible = false;
    
    
    if (!IsPostBack)
    {
        DataTable h_dt1146 = db.GetDataTable(db.ConnStr,"select distinct fld_1146_1 from gmis_mo_1146 order by fld_1146_1 desc");
		BindListControl(fld_1146_1, "fld_1146_1", "fld_1146_1", h_dt1146);
		SetFilter(fld_1146_1, (h_dt1146.Rows.Count>0)?h_dt1146.Rows[0][0].ToString():System.DateTime.Now.Year.ToString()); 
    }
    StringBuilder sb = new StringBuilder();//sum(fld_1147_),
    sb.Append("select sum(fld_1146_74),count(gmis_mo_1146.mocode),sum(fld_1146_75),sum(fld_1146_30),sum(fld_1146_76),sum(fld_1146_31),sum(fld_1146_32),sum(fld_1147_4),sum(fld_1146_34)/10000,sum(fld_1147_5)/10000,sum(fld_1146_35)/10000,sum(fld_1147_6),sum(fld_1146_36)/10000,(case sum(fld_1146_34) when 0 then '' else cast(cast(sum(fld_1146_36)/sum(fld_1146_34)*100 as decimal(24,2)) as varchar(10))+'%' end) as lie32,sum(fld_1146_37)/10000,sum(fld_1147_7)/10000,sum(fld_1146_38)/10000,sum(fld_1147_8)/10000,sum(fld_1146_39)/10000,sum(fld_1147_9)/10000,(case count(gmis_mo_1146.mocode) when 0 then '' else cast(cast(sum(fld_1146_40)/count(gmis_mo_1146.mocode) as decimal(24,2)) as varchar(10))+'%' end) as lie7,sum(fld_1147_10)/10000,sum(fld_1146_41)/10000,sum(fld_1147_13)/10000,sum(fld_1146_42)/10000,(case sum(fld_1147_8) when 0 then '' else cast(cast(sum(fld_1147_13)/sum(fld_1147_8)*100 as decimal(24,2)) as varchar(10))+'%' end) as lie38,");
    sb.Append("sum(fld_1146_43)/10000,(case count(gmis_mo_1146.mocode) when 0 then '' else cast(cast(sum(fld_1146_44)/count(gmis_mo_1146.mocode) as decimal(24,2)) as varchar(10))+'%' end) as lie7,sum(fld_1147_14)/1000,sum(fld_1146_45),sum(fld_1147_15)/1000,sum(fld_1146_77)/10000,sum(fld_1147_16)/1000,sum(fld_1146_78)/10000,sum(fld_1147_17)/1000,sum(fld_1146_46),sum(fld_1147_18)/1000,sum(fld_1146_48),sum(fld_1147_19)/1000,sum(fld_1146_50),sum(fld_1146_52),sum(fld_1147_20)/1000,sum(fld_1146_53),sum(fld_1147_21)/1000,sum(fld_1146_54),sum(fld_1147_22)/1000,sum(fld_1146_73),sum(fld_1147_23)/1000,");
    sb.Append("sum(fld_1147_24)/1000,sum(fld_1147_55)/1000,sum(fld_1147_25)/1000,sum(fld_1147_56)/1000,sum(fld_1147_26)/1000,sum(fld_1147_27)/1000,sum(fld_1147_57)/10000,sum(fld_1147_28)/1000,sum(fld_1147_58),sum(fld_1147_29)/1000,sum(fld_1147_59)/10000,sum(fld_1147_60)/10000,");
    sb.Append("sum(fld_1147_30),sum(fld_1147_61)/10000,sum(fld_1147_31),sum(fld_1147_62)/10000,sum(fld_1147_32),sum(fld_1147_63)/10000,sum(fld_1147_33),sum(fld_1147_64)/10000,sum(fld_1147_34),sum(fld_1147_65)/10000,sum(fld_1147_35)/10000,sum(fld_1147_66)/10000,sum(fld_1147_36)/1000,sum(fld_1147_67)/10000,sum(fld_1147_37),sum(fld_1147_68),sum(fld_1147_38),sum(fld_1147_69)/10000,sum(fld_1147_39)/1000,sum(fld_1147_70)/10000,sum(fld_1147_40)/1000,sum(fld_1147_71)/10000,sum(fld_1147_41)/1000,sum(fld_1147_72)/10000,sum(fld_1147_42)/1000,sum(fld_1147_73)/10000,sum(fld_1147_43)/1000,sum(fld_1147_74)/10000,sum(fld_1147_44)/1000,sum(fld_1147_75)/10000,sum(fld_1147_45)/1000,sum(fld_1147_76)/10000,");
    sb.Append("sum(fld_1147_46)/1000,(case sum(fld_1147_57) when 0 then '' else cast(cast(sum(fld_1147_67)/sum(fld_1147_57)*100 as decimal(24,2)) as varchar(10))+'%' end) as lie102,sum(fld_1147_47)/1000,sum(fld_1147_77)/10000,sum(fld_1147_48)/1000,sum(fld_1147_78),sum(fld_1147_49)/1000,sum(fld_1147_79)/10000,sum(fld_1147_50)/1000,sum(fld_1147_80),sum(fld_1147_51)/1000,sum(fld_1147_81),sum(fld_1147_52)/1000,sum(fld_1147_82)/10000,sum(fld_1147_53)/1000,sum(fld_1147_83)/10000,sum(fld_1147_54)/1000,sum(fld_1147_84) from gmis_mo_1146 left join gmis_mo_1147 on (fld_1146_1=fld_1147_1 and fld_1146_2=fld_1147_2) where fld_1146_1='" + fld_1146_1.SelectedItem.Value + "'");

    content_0.SqlStr = sb.ToString();

    //db.SqlString = sb.ToString();
    //DataTable dt = db.GetDataTable();
    //foreach (DataRow dr in dt.Rows)
    //{
        //dr["lie32"] =(dr["lie32"]=="")?"": dr["lie32"].ToString().Substring(0, dr["lie32"].ToString().IndexOf('.') + 3) + "%";
        //dr["lie38"] = (dr["lie38"] == "") ? "" : dr["lie38"].ToString().Substring(0, dr["lie38"].ToString().IndexOf('.') + 3) + "%";
        //dr["lie102"] = (dr["lie102"] == "") ? "" : dr["lie102"].ToString().Substring(0, dr["lie102"].ToString().IndexOf('.') + 3) + "%";
        ////Response.Write("123");
    //}
    //content_0.DataTable = dt;
    
    //Response.Write(sb.ToString());
    
}


    private void Click_Toolbar(object sender, System.EventArgs e)
    {
        string idstr = ((Control)sender).ID.ToLower();

        switch (idstr)
        {
            case "btn_word":
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "GB2312";
                Response.AppendHeader("Content-Disposition", "attachment;filename=FileName.doc");
                Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
                Response.ContentType = "application/ms-word";
                this.EnableViewState = false;
                System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
                System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
                System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
                oHtmlTextWriter.Write(hiddenHtml.Value);
                Response.Write(oStringWriter.ToString());
                Response.End();
                break;
            case "btn_print":
                Session["html"] = hiddenHtml.Value;
                Page.RegisterStartupScript("print", "<scrip" + "t>window.open('tempview.aspx', 'newwindow', 'height=600,width=800,top=30,left=30,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no')</" + "script>");
                break;
        }
    }
</script>
<script type="text/javascript">

//����function printsetup(){ 
//����// ��ӡҳ������ 
//����wb.execwb(8,1); 
//����} 
//����function printpreview(){ 
//����// ��ӡҳ��Ԥ�� 
//�������� 
//����wb.execwb(7,1); 
//���������� 
//�������� 
//����} 

//����function printit() 
//����{ 
//����if (confirm('ȷ����ӡ��')) { 
//����wb.execwb(6,6) 
//����} 
//����} 

    function clickOutPutWord()
    {
       document.getElementById("hiddenHtml").value=document.getElementById("divhtml").innerHTML;
       __doPostBack("btn_word","");
    }
    function clickPrint()
    {
        document.getElementById("hiddenHtml").value=document.getElementById("divhtml").innerHTML;
       __doPostBack("btn_print","");
    }
</script>
<body style="padding:10px;text-align:center;">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
              <td align="center"><span style="width:60px;">���:</span></td>
              <td>
                <asp:DropDownList ID="fld_1146_1" runat="server" AutoPostBack="true"></asp:DropDownList>
              </td>
			<!--#include file="toolbar.aspx"-->
			
			<td style="padding-left:5px;width:55px;" nowrap>
                <G:Button id="btn_wordtxt" type="toolbar" mode="on" icon="word" text="����" Url="javascript:clickOutPutWord();"  runat="server"></G:Button>
            </td>
            <td style="padding-left:5px;width:55px;" nowrap>
                <G:Button id="btn_printtxt" type="toolbar" mode="on" icon="print" text="��ӡ" Url="javascript:clickPrint();" runat="server"></G:Button>
            </td>
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
   
<input id="hiddenHtml" type="hidden" runat="server" />
<asp:LinkButton ID="btn_word" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<asp:LinkButton ID="btn_print" OnClick="Click_Toolbar" runat="server"></asp:LinkButton>
<div id="divhtml" >
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
              <td width="80%" align="right" valign="top" style="padding-top:25px; padding-right:250px; "><%=fld_1146_1.SelectedItem.Value %>��</td>
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

<G:Content ID="content_0" runat="server" Alert="...">
<G:Template id="template_0" runat="server">

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
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF"  >��ҵ�������</td>
      <td align="center" bgcolor="#FFFFFF"  >��</td>
      <td align="center" bgcolor="#FFFFFF"  >��</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF"  >���У�ֱ�ź�����ˮ�ŷſ���</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF"  >26</td>
      <td align="center" bgcolor="#FFFFFF"  >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF"  >1�����ܹ�ҵ��ҵ��</td>
      <td align="center" bgcolor="#FFFFFF"  >��</td>
      <td align="center" bgcolor="#FFFFFF" >1</td>
      <td align="center" bgcolor="#FFFFFF"  >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF"  >14����ˮ��Ⱦ�����߼����������</td>
      <td align="center" bgcolor="#FFFFFF"  >��</td>
      <td align="center" bgcolor="#FFFFFF" >27</td>
      <td align="center" bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF"  >2����ҵ�ܲ�ֵ���ּۣ�</td>
      <td align="center" bgcolor="#FFFFFF"  >��Ԫ</td>
      <td align="center" bgcolor="#FFFFFF" >2
      </td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >14����ˮ��Ⱦ�����߼����������</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >28</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >3�������ϡ��ۺ����ò�Ʒ��ֵ</td>
      <td align="center"  bgcolor="#FFFFFF" >��Ԫ</td>
      <td align="center"  bgcolor="#FFFFFF" >3</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >������ҵ��ˮ</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >-</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >4����ҵרְ������Ա��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >4</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >1����ˮ������ʩ��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >29</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >5����ҵ��ˮ����</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >5</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >2����ˮ������ʩ��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���/��
     </td>
      <td align="center"  bgcolor="#FFFFFF" >30</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >���У�������ˮ��</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"bgcolor="#FFFFFF" >6</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >3����ˮ������ʩ���з���</td>
      <td align="center" bgcolor="#FFFFFF" >��Ԫ</td>
      <td align="center" bgcolor="#FFFFFF" >31</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >�����ظ���ˮ��</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >7</td>
      <td align="center" bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >4����ҵ��ˮ�ظ�������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center" bgcolor="#FFFFFF" >32</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >6����ҵú̿��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >8</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >��5����ҵ��ˮ������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >33</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >���У�ȼ��ú������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >9</td>
      <td align="center" bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >6����ҵ��ˮ�ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >34</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >������ԭ��ú������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >10</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >���У�ֱ�����뺣��</td>
      <td align="center" bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >35</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >7��ȼ��úƽ����ݣ���Ȩֵ��</td>
      <td align="center"  bgcolor="#FFFFFF" >%</td>
      <td align="center"  bgcolor="#FFFFFF" >11</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >����������������ˮ������</td>
      <td align="center" bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >36</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >8��ȼ���������������������ã�</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >12</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >7����ҵ��ˮ�ŷŴ����</td>
      <td align="center" bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >37</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >���У�����</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center" bgcolor="#FFFFFF" >13</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >8����ҵ��ˮ�ŷŴ����</td>
      <td align="center" bgcolor="#FFFFFF" >%</td>
      <td align="center"  bgcolor="#FFFFFF" >38</td>
      <td align="center" bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >14</td>
      <td align="center" bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >9����ҵ��ˮ����Ⱦ��ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >-</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >9������ƽ����ݣ���Ȩֵ��</td>
      <td align="center"  bgcolor="#FFFFFF" >%</td>
      <td align="center" bgcolor="#FFFFFF" >15</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��1����ѧ������</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >39</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >10���ྻȼ��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���������</td>
      <td align="center" bgcolor="#FFFFFF" >16</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >���У�����������ʩȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >40</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >11����̿������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >17</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >��2������</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >41</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >12������ȼ��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���</td>
      <td align="center"  bgcolor="#FFFFFF" >18</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >��3��ʯ����</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >42</td>
      <td align="center" bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >11����ҵ��¯��</td>
      <td align="center"  bgcolor="#FFFFFF" >̨/����</td>
      <td align="center"  bgcolor="#FFFFFF" >19</td>
      <td align="center" bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >��4���ӷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >43</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >���У��̳��ŷŴ���</td>
      <td align="center"  bgcolor="#FFFFFF" >̨/����</td>
      <td align="center"  bgcolor="#FFFFFF" >20</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >��5���軯��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >44</td>
      <td align="center" bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���������ŷŴ���</td>
      <td align="center"  bgcolor="#FFFFFF" >̨/����</td>
      <td align="center"  bgcolor="#FFFFFF" >21</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >10����ҵ��ˮ����Ⱦ���ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >-</td>
      <td align="center"  bgcolor="#FFFFFF" >-</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >12����ҵ¯Ҥ��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >22</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >��1����ѧ������</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >45</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >���У��̳��ŷŴ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >23</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center"  bgcolor="#FFFFFF" >��2������</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >46</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center"  bgcolor="#FFFFFF" >���������ŷŴ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >24</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��3��ʯ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >47</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >13����ˮ�ŷſ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >25</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��4���ӷ���</td>
      <td align="center"  bgcolor="#FFFFFF"> ��</td>
      <td align="center"  bgcolor="#FFFFFF" >48</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr align="left">
      <td align="center" bgcolor="#FFFFFF" >��5���軯��</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >49</td>
      <td align="center" bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >12����ҵ�۳��ŷ���</td>
      <td align="center" bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >80</td>
      <td align="center" bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >��6����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >50</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >���У��ŷŴ����</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >81</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >��7��Ǧ</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >51</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >�ġ���ҵ�������</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >��8����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >52</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >1����ҵ������������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >82</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >��9����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >53</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��1��Σ�շ���</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >83</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >��10�����۸�</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >54</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��2��ұ������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >84</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >������ҵ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center" bgcolor="#FFFFFF" >��3����ú��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >85</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >1����ҵ�����ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >���������</td>
      <td align="center"  bgcolor="#FFFFFF" >55</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��4��¯��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >86</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У�ȼ��ȼ�չ������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >���������</td>
      <td align="center"  bgcolor="#FFFFFF" >56</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��5��ú�ʯ</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >87</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >�������������չ������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >���������</td>
      <td align="center"  bgcolor="#FFFFFF" >57</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��6��β��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >88</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >2������������ʩ��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >58</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��7�������Է���</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >89</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У�������ʩ��</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >59</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��8������ʯ��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >90</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >3������������ʩ��������</td>
      <td align="center"  bgcolor="#FFFFFF" >���������/ʱ</td>
      <td align="center"  bgcolor="#FFFFFF" >60</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��9����������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >91</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У�������ʩ��������</td>
      <td align="center"  bgcolor="#FFFFFF" >��/ʱ</td>
      <td align="center"  bgcolor="#FFFFFF" >61</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >2����ҵ��������ۺ�������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >92</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >4������������ʩ���з���</td>
      <td align="center"  bgcolor="#FFFFFF" >��Ԫ</td>
      <td align="center"  bgcolor="#FFFFFF" >62</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��1��Σ�շ���</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >93</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У�������ʩ���з���</td>
      <td align="center"  bgcolor="#FFFFFF" >��Ԫ</td>
      <td align="center"  bgcolor="#FFFFFF" >63</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��2��ұ������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >94</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >5����������ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >64</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��3����ú��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >95</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У�ȼ��ȼ�չ�����ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >65</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��4��¯��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >96</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >�������������չ�����ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >66</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��5��ú�ʯ</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >97</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У�����������ʩȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >67</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��6��β��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >98</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >6�����������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >68</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��7������ʯ��</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >99</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У�ȼ��ȼ�չ������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >69</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >��8����������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >100</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У��ŷŴ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >70</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >���У��ۺ���������������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >101</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У��������չ������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >71</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >3����ҵ��������ۺ�������</td>
      <td align="center"  bgcolor="#FFFFFF">%</td>
      <td align="center"  bgcolor="#FFFFFF" >102</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У��ŷŴ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >72</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >4����ҵ�������������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >103</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >7����������ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >73</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >���У�Σ�շ���������</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >104</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >8�����������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >74</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >5����ҵ������ﴦ����</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >105</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У��ŷŴ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >75</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >���У�Σ�շ��ﴦ����</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >106</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >9���̳�ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >76</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >���У��������д�����������</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >107</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >10���̳��ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >77</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >���У���������������</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >108</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >���У��ŷŴ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >78</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >6����ҵ��������ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF">���</td>
      <td align="center"  bgcolor="#FFFFFF" >109</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
    <tr height="23">
      <td align="center" bgcolor="#FFFFFF" >11����ҵ�۳�ȥ����</td>
      <td align="center"  bgcolor="#FFFFFF" >��</td>
      <td align="center"  bgcolor="#FFFFFF" >79</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF" >���У�Σ�շ����ŷ���</td>
      <td align="center"  bgcolor="#FFFFFF">��</td>
      <td align="center"  bgcolor="#FFFFFF" >110</td>
      <td align="center"  bgcolor="#FFFFFF" >*&nbsp;</td>
    </tr>
</table>

</G:Template>
</G:Content>
</div>
<!--��̬����html,����-->
</form>
</body>
</html>
