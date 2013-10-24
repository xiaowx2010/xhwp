<!--��ҵ��ҵ��Ⱦ������Ŀ�������  �����3��,�༭ҳ-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--#include file="toolbar_1153.aspx"-->
<script language="javascript" src="common.js"></script>
<script language="C#" runat="server">
    //string[] vflds,p_newflds,p_newvflds;
    //string p_newtypes;//updataΪ�޸ģ�insertΪ����
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL���� 
    tb_save.Visible = false;
    mid = GetQueryString("mid", "0");
    id = GetQueryString("id", "0");
    string h_yearstr = GetQueryString("year", System.DateTime.Now.Year.ToString());
    int thisyear = Convert.ToInt32(DateTime.Now.Year);
    if (fld_1153_1.Items.Count < 1)
    {
        for (int i = 0; i < 20; i++)
        {
            fld_1153_1.Items.Add(new ListItem(thisyear.ToString() + "��", thisyear.ToString()));
            thisyear--; 
        }
		SetFilter(fld_1153_1,h_yearstr);
    }
    dtable = "gmis_mo_1153";
    flds = new string[] {"mocode", "fld_1153_1", "fld_1153_2", "fld_1153_4", "fld_1153_5", "fld_1153_6", "fld_1153_7", "fld_1153_8", "fld_1153_9", "fld_1153_10", "fld_1153_11", "fld_1153_12", "fld_1153_13", "fld_1153_14", "fld_1153_15", "fld_1153_16" };

    p_newflds = new string[] { "fld_1153_1", "fld_1153_2", "fld_1153_4", "fld_1153_5", "fld_1153_6", "fld_1153_7", "fld_1153_8", "fld_1153_9", "fld_1153_10", "fld_1153_11", "fld_1153_12", "fld_1153_13", "fld_1153_14", "fld_1153_15", "fld_1153_16" };
    
    filter = " fld_1153_1='" + fld_1153_1.SelectedItem.Value+"' and fld_1153_2 = '" + fld_1153_2.Value+"'";
    types = "000000111111110";
    p_newtypes = "000000111111110";
    string[] newflds = new string[] { "fld_1153_2" };

    qiye_id = GetQueryString("pid", "0");
    if (qiye_id == "0")
    {
        qiye_id = GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2=('" + GetFieldData("select fld_1153_2 from " + dtable + " where mocode='" + id + "' ") + "')");
        qiye_id = (qiye_id == "") ? "0" : qiye_id;
    }
    dtable_1202 = "gmis_mo_1202";
    vflds_1202 = new string[] { "fld_1153_2", "fld_1153_16", "fld_1202_24" };
    flds_1202 = new string[] { "fld_1202_2", "fld_1202_1", "fld_1202_24" };
    filter_1202 = " mocode=" + qiye_id;
    types_1202 = "001";
    
    if (!IsPostBack)
    {
        if (id != "0")
        {
            guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
            db.SqlString = "select fld_1153_1 from " + GetModuleTableName("1153") + " where mocode=" + id;
            DataTable dt = db.GetDataTable();
            if (dt.Rows.Count > 0)
            {
                SetFilter(fld_1153_1, dt.Rows[0][0].ToString());
            }
            fld_1153_2.Attributes.Add("readonly", "");
            fld_1153_1.Enabled = false;
            //btn_search.Enabled = false;
            btn_search.Visible = false;
            tb_2_new.Visible = true;
            edit_value();
        }
        else if (qiye_id != "0")
        {
            guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
            fld_1153_2.Attributes.Add("readonly", "");
            btn_search.Visible = false;
            tb_2_new.Visible = true;
        }
        for (int i = 1; i < 9; i++)
        {
            for (int j = 8; j < 15; j++)
            {//"onkeyup","value=value.replace(/[^\d.]/g,'')"
                ((System.Web.UI.HtmlControls.HtmlInputText)FindControl("fld_1153_" + j + "_" + i)).Attributes["onblur"] = @"trans_value(" + j + "," + i + ")";
                ((System.Web.UI.HtmlControls.HtmlInputText)FindControl("fld_1153_" + j + "_" + i)).Attributes["onkeyup"] = @"value=value.replace(/[^\d.]/g,'')";
            }
        }
    }

 }
private void Click_NewAdd_1153(object sender, System.EventArgs e)
{   
    Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("add")+"&mid="+mid+"");
}

</script>

<script>
function trans_value(args1,args2)//���������֤
{
    //��֤�Ƿ���������
    if(!IsFloat(document.getElementById('fld_1153_' + args1 + '_' + args2 + '').value, "+" ,null)&&document.getElementById('fld_1153_' + args1 + '_' + args2 + '').value!=''&&document.getElementById('fld_1153_' + args1 + '_' + args2 + '').value!='0')
    {
        alert('����������������');
        document.getElementById('fld_1153_' + args1 + '_' + args2 + '').value="";
        document.getElementById('fld_1153_' + args1 + '_' + args2 + '').focus();
    }
    for (i = 8; i < 15;)
    {
        if(document.getElementById('fld_1153_'+i+'_1').value!=''||document.getElementById('fld_1153_'+i+'_2').value!=''||document.getElementById('fld_1153_'+i+'_3').value!=''||document.getElementById('fld_1153_'+i+'_4').value!=''||document.getElementById('fld_1153_'+i+'_5').value!=''||document.getElementById('fld_1153_'+i+'_6').value!=''||document.getElementById('fld_1153_'+i+'_7').value!=''||document.getElementById('fld_1153_'+i+'_8').value!='')
        {
        document.getElementById('fld_1153_'+i+'').innerHTML=Number(document.getElementById('fld_1153_'+i+'_1').value)+Number(document.getElementById('fld_1153_'+i+'_2').value)+Number(document.getElementById('fld_1153_'+i+'_3').value)+Number(document.getElementById('fld_1153_'+i+'_4').value)+Number(document.getElementById('fld_1153_'+i+'_5').value)+Number(document.getElementById('fld_1153_'+i+'_6').value)+Number(document.getElementById('fld_1153_'+i+'_7').value)+Number(document.getElementById('fld_1153_'+i+'_8').value);
        }
        
        i++;
     }
//     if(args1==9||args1==10)
//     {
//        if(Number(document.getElementById('fld_1153_9_'+args2).value)<Number(document.getElementById('fld_1153_10_'+args2).value))
//        {
//            alert("ע��ָ����ϵ�� 4��5");
//            document.getElementById('fld_1153_'+args1+'_'+args2).value="";
//            document.getElementById('fld_1153_'+args1+'_'+args2).focus();
//        }
//     }
//     if(args1==13||args1==14)
//     {
//        if(Number(document.getElementById('fld_1153_13_'+args2).value)<Number(document.getElementById('fld_1153_14_'+args2).value))
//        {
//            alert("ע��ָ����ϵ�� 8��9");
//            document.getElementById('fld_1153_'+args1+'_'+args2).value="";
//            document.getElementById('fld_1153_'+args1+'_'+args2).focus();
//            }
//     }
     
}


</script>
<body style="padding:10px;text-align:center"><%-- onload="trans_value(8,1)"--%>
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<td  width="100%"><span id="alertmess_1153" runat="server" style="color:Red;"></span></td>
			<td id="tb_2_new" visible="false" runat="server" style="padding-left:5px;width:55px; padding-right:5px;" nowrap>
            <G:Button id="btn_newadd_new" type="toolbar" mode="on" icon="tb01" text="��������" onclick="Click_NewAdd_1153" runat="server"></G:Button>
            </td>
			<td id="tb_save_1153" align="right" runat="server" nowrap>
                <G:Button id="btn_save_1153" type="toolbar" mode="on" icon="tb05" text="����" onclick="Click_Save_1153" runat="server"></G:Button>
            </td>
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
    <input id="fld_1202_24" runat="server" type="hidden" value="1" />
<div id="div_input" runat="server">
<table><tr><td>
<input name="Text1" id="fld_1153_0_0" type="hidden" style="width:70px; " onkeyup="checkin(0,0)"  />
<input id="Hidden1" runat="server" type="hidden" />
<input id="Hidden2" runat="server" type="hidden" />
<input id="Hidden3" runat="server" type="hidden" />
<input id="Hidden7" runat="server" type="hidden" />
<input id="Hidden8" runat="server" type="hidden" />
<input id="Hidden6" runat="server" type="hidden" />
<input id="Hidden5" runat="server" type="hidden" />
<input id="Hidden4" runat="server" type="hidden" />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
      <tr>
        <td align="center" class="font_2635B_000">��ҵ��ҵ��Ⱦ������Ŀ�������</td>
      </tr>
    </table>
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; ">
    <tr>
      <td align="right"  class="td_viewcontent_title" width="15%"> <span style="color:Red;">*</span>ͳ�����:</td>
      <td align="left" class="td_viewcontent_content" width="35%">
        <asp:DropDownList ID="fld_1153_1" Width="120px" runat="server">
        </asp:DropDownList>
      </td>
      <td align="right"  class="td_viewcontent_title" width="15%"><span style="color:Red;">*</span> ��ҵ���˴���</td>
      <td align="left" class="td_viewcontent_content">
        <div style="float:left;"><input id="fld_1153_2" runat="server" style="width:160px;" name="textfield" type="text"><input id="fld_1153_2_code" runat="server" style="width:160px;" name="textfield" type="hidden"></div>
        <div style="float:left;" id="btn_search_box"><asp:LinkButton id="btn_search" runat="server" OnClick="Click_Search"><img src="images\icons\search.gif" style="cursor:hand" title="��ѯ" border="0" /></asp:LinkButton ></div>
      </td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title" nowrap width="15%">���λ��ϸ���ƣ����£�</td>
      <td colspan="3" align="left" class="td_viewcontent_content">
        <input id="fld_1153_16" style="width:80%;" runat="server" name="textfield" type="text">
      </td>
    </tr>
</table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999" >
    <tr>
      <td rowspan="2"  align="center" class="td_viewcontent_title"> ��Ⱦ����<br>
      ��Ŀ���� </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title"> �������� </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">�������� </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title"> ����Ͷ������ </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">�ƻ���Ͷ��<br>
      (��Ԫ) </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">��������ۼ����Ͷ��(��Ԫ) </td>
      <td colspan="5"  align="center" class="td_viewcontent_title"> �������Ͷ�ʼ��ʽ���Դ(��Ԫ) </td>
      <td rowspan="2"  align="center" class="td_viewcontent_title">������Ŀ��ƻ������������� </td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_title"> �ϼ� </td>
      <td align="center" class="td_viewcontent_title">���۷Ѳ��� </td>
      <td align="center" class="td_viewcontent_title"> ������������ </td>
      <td align="center" class="td_viewcontent_title">��ҵ�Գ� </td>
      <td align="center" class="td_viewcontent_title"> ���д��� </td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content"> �� </td>
      <td align="center" class="td_viewcontent_content"> �� </td>
      <td align="center" class="td_viewcontent_content">1</td>
      <td align="center" class="td_viewcontent_content">2</td>
      <td align="center" class="td_viewcontent_content">3</td>
      <td align="center" class="td_viewcontent_content">4</td>
      <td align="center" class="td_viewcontent_content">5</td>
      <td align="center" class="td_viewcontent_content">6</td>
      <td align="center" class="td_viewcontent_content">7</td>
      <td align="center" class="td_viewcontent_content">8</td>
      <td align="center" class="td_viewcontent_content">9</td>
      <td align="center" class="td_viewcontent_content">10</td>
    </tr>
    <tr>
      <td align="center" class="td_viewcontent_content">�ϼ�(���°���Ŀ����) </td>
      <td align="center" class="td_viewcontent_content">&nbsp;
      </td>
      <td align="center" class="td_viewcontent_content">&nbsp;
      </td>
      <td align="center" class="td_viewcontent_content">&nbsp;
     </td>
      <td id="fld_1153_8" align="center" class="td_viewcontent_content">&nbsp;</td>
      <td id="fld_1153_9" align="center" class="td_viewcontent_content">&nbsp;</td>
      <td id="fld_1153_10" align="center" class="td_viewcontent_content">&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_11">&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_12">&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_13">&nbsp;</td>
      <td align="center" class="td_viewcontent_content" id="fld_1153_14">&nbsp;</td>
      <td align="center" class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
      <td height="30" align="center" class="td_viewcontent_content"><input id="fld_1153_4_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_5_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_6_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_7_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_8_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_9_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_10_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_11_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_12_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_13_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_14_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_15_1" runat="server" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td height="30" align="center" class="td_viewcontent_content"><input id="fld_1153_4_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_5_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_6_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_7_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_8_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_9_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_10_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_11_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_12_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_13_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_14_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_15_2" runat="server" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td height="30" align="center" class="td_viewcontent_content"><input id="fld_1153_4_3" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_5_3" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_6_3" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_7_3" runat="server" name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_8_3" runat="server" name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_9_3" runat="server" name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_10_3" runat="server" name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_11_3" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_12_3" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_13_3" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_14_3" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_15_3" runat="server" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td height="30" align="center" class="td_viewcontent_content"><input id="fld_1153_4_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_5_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_6_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_7_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_8_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_9_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_10_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_11_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_12_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_13_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_14_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_15_4" runat="server" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td height="30" align="center" class="td_viewcontent_content"><input id="fld_1153_4_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_5_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_6_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_7_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_8_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_9_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_10_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_11_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_12_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_13_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_14_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_15_5" runat="server" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td height="30" align="center" class="td_viewcontent_content"><input id="fld_1153_4_6" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_5_6" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_6_6" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_7_6" runat="server" name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_8_6" runat="server" name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_9_6" runat="server" name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_10_6" runat="server" name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_11_6" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_12_6" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_13_6" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_14_6" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_15_6" runat="server" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td height="30" align="center" class="td_viewcontent_content"><input id="fld_1153_4_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_5_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_6_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_7_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_8_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_9_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_10_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_11_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_12_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_13_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_14_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_15_7" runat="server" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td height="30" align="center" class="td_viewcontent_content"><input id="fld_1153_4_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_5_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_6_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_7_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_8_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_9_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_10_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_11_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_12_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_13_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_14_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1153_15_8" runat="server" name="textfield" type="text" style="width:70px; "></td>
    </tr>
</table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; ">
    <tr>
      <td align="left" class="font1220_000000">˵����1. �����ѿ���Ͷ��ʹ�õ���Ŀ������������뽨����Ŀ������������ͬʱ���������Ŀ�����<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. �������ʹ���:&nbsp;1-��ҵ��ˮ����&nbsp;&nbsp;&nbsp;2-ȼ��ȼ�շ�������&nbsp;&nbsp;&nbsp;3-���շ�������(����ҵ�۳�����)&nbsp;&nbsp;&nbsp;4-��ҵ�����������&nbsp;&nbsp;&nbsp;5-�����������񶯣�
          &nbsp;6-��ŷ�������&nbsp;&nbsp;&nbsp;&nbsp;7-�������� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;8-��Ⱦ��Ǩ����&nbsp;&nbsp;&nbsp;9-�����������ۺϷ��Σ�
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        3. ��ˮ�������������λΪ��/�գ������������������λΪ��������/ʱ����������������������λΪ��/�գ�����������͡��ֱ���ֵ��<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. ָ����ϵ�� 4��5, 5=6+7+8,8��9 </td>
    </tr></table>
    </td></tr></table>
</div>
<!--��̬����html,����-->
</form>
</body>
</html>
