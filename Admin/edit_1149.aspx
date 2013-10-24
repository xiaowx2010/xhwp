
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--火电企业污染排放及处理租用情况  环年基1-2表,编辑页-->
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<!--#include file="toolbar1149.aspx"-->
<script language="javascript" src="common.js"></script>
<script language="C#" runat="server">
    private void Page_Load(object sender, System.EventArgs e)
    {
        SetToolBar();//设置工具条,同时获取固定URL参数
        tb_save.Visible = false;

        mid = GetQueryString("mid", "0");
        id = GetQueryString("id", "0");
		string h_yearstr = GetQueryString("year", System.DateTime.Now.Year.ToString());
        int thisyear = Convert.ToInt32(DateTime.Now.Year);
        if (fld_1149_1.Items.Count < 1)
        {
            for (int i = 0; i < 20; i++)
            {
                fld_1149_1.Items.Add(new ListItem(thisyear.ToString()+"年", thisyear.ToString()));
                thisyear--;
            }
			SetFilter(fld_1149_1,h_yearstr);
        }
		
        dtable_1149 = "gmis_mo_1149";
        dtable_1150 = "gmis_mo_1150";
        filter = " mocode=" + id;
        filter_1150="fld_1150_1="+GetFieldData("select fld_1149_1 from gmis_mo_1149 where "+filter)+" and fld_1150_2='"+GetFieldData("select fld_1149_2 from gmis_mo_1149 where "+filter)+"'";

        types_1149 = "100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        types_1150 = "10000000000000000000000000000000000000000";

        flds_1149 = new string[] { "fld_1149_1", "fld_1149_2", "fld_1149_3", "fld_1149_5", "fld_1149_17", "fld_1149_18", "fld_1149_22", "fld_1149_24", "fld_1149_25", "fld_1149_26", "fld_1149_27", "fld_1149_28", "fld_1149_29", "fld_1149_30", "fld_1149_31", "fld_1149_32", "fld_1149_33", "fld_1149_34", "fld_1149_35", "fld_1149_36", "fld_1149_37", "fld_1149_38", "fld_1149_39", "fld_1149_40", "fld_1149_41", "fld_1149_42", "fld_1149_43", "fld_1149_44", "fld_1149_45", "fld_1149_46", "fld_1149_47", "fld_1149_48", "fld_1149_49", "fld_1149_50", "fld_1149_51", "fld_1149_52", "fld_1149_53", "fld_1149_54", "fld_1149_55", "fld_1149_56", "fld_1149_57", "fld_1149_58", "fld_1149_59", "fld_1149_60", "fld_1149_61", "fld_1149_62", "fld_1149_63", "fld_1149_64", "fld_1149_65", "fld_1149_66", "fld_1149_67", "fld_1149_68", "fld_1149_69", "fld_1149_70", "fld_1149_71", "fld_1149_72", "fld_1149_73", "fld_1149_74", "fld_1149_75", "fld_1149_76", "fld_1149_77", "fld_1149_78", "fld_1149_79", "fld_1149_80", "fld_1149_81", "fld_1149_82", "fld_1149_83", "fld_1149_84", "fld_1149_85", "fld_1149_86", "fld_1149_87", "fld_1149_88", "fld_1149_89", "fld_1149_91", "fld_1149_92", "fld_1149_93", "fld_1149_4","fld_1149_19","fld_1149_6","fld_1149_7","fld_1149_8","fld_1149_9","fld_1149_10","fld_1149_11","fld_1149_12","fld_1149_13","fld_1149_14","fld_1149_15","fld_1149_16","fld_1149_21","fld_1149_23","fld_1149_20" };

        flds_1150 = new string[] { "fld_1150_1", "fld_1150_2", "fld_1150_4", "fld_1150_5", "fld_1150_6", "fld_1150_7", "fld_1150_8", "fld_1150_9", "fld_1150_10", "fld_1150_11", "fld_1150_12", "fld_1150_13", "fld_1150_14", "fld_1150_15", "fld_1150_16", "fld_1150_17", "fld_1150_18", "fld_1150_19", "fld_1150_20", "fld_1150_21", "fld_1150_22", "fld_1150_23", "fld_1150_24", "fld_1150_25", "fld_1150_26", "fld_1150_27", "fld_1150_28", "fld_1150_29", "fld_1150_30", "fld_1150_31", "fld_1150_32", "fld_1150_33", "fld_1150_34", "fld_1150_35", "fld_1150_36", "fld_1150_37", "fld_1150_38", "fld_1150_39", "fld_1150_40", "fld_1150_41", "fld_1150_42" };
        
     
     qiye_id = GetQueryString("pid", "0");
     if(qiye_id=="0")
     {
        qiye_id = GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2=('" + GetFieldData("select fld_1149_2 from gmis_mo_1149 where mocode='" + id + "' ") + "')");
        qiye_id = (qiye_id == "") ? "0" : qiye_id;
     
     }
     dtable_1202="gmis_mo_1202";
     vflds_1202=new string[] { "fld_1149_2","fld_1149_4","fld_1149_19","fld_1149_6","fld_1149_7","fld_1149_8","fld_1149_9","fld_1149_10","fld_1149_11","fld_1149_12","fld_1149_13","fld_1149_14","fld_1149_15","fld_1149_16","fld_1149_21","fld_1149_23","fld_1149_92","fld_1149_20", "fld_1202_24" };
     flds_1202=new string[] { "fld_1202_2","fld_1202_1","fld_1202_3","fld_1202_6","fld_1202_7","fld_1202_8","fld_1202_9","fld_1202_10","fld_1202_11","fld_1202_15","fld_1202_12","fld_1202_13","fld_1202_14","fld_1202_16","fld_1202_17","fld_1202_18","fld_1202_20","fld_1202_5", "fld_1202_24" };
     filter_1202=" mocode="+qiye_id;
     types_1202="0001111110000010001";

        if (!IsPostBack)
        {
            BindListControl(fld_1149_21, "fld_1157_1", "fld_1157_view", "select fld_1157_1,(fld_1157_1+'|'+fld_1157_2) as fld_1157_view from gmis_mo_1157", "--请选择--");//登记注册类型
            SetFilter(fld_1149_21, "0");
            BindListControl(fld_1149_22, "fld_1175_1", "fld_1175_view", "select fld_1175_1,(fld_1175_1+'|'+fld_1175_2) as fld_1175_view from gmis_mo_1175", "--请选择--");//所属集团公司
            SetFilter(fld_1149_22, "0");
            BindListControl(fld_1149_20, "fld_1195_1", "fld_1195_view", "select fld_1195_1,(fld_1195_1+'|'+fld_1195_2) as fld_1195_view from gmis_mo_1195");//行政区域代码--
            BindListControl(fld_1149_24, "fld_1165_1", "fld_1165_view", "select fld_1165_1,(fld_1165_1+'|'+fld_1165_2) as fld_1165_view from gmis_mo_1165", "--请选择--");//排水去向类型
            SetFilter(fld_1149_24, "0");
            BindListControl(fld_1149_25, "fld_1145_1", "fld_1145_view", "select fld_1145_1,(fld_1145_1+'|'+fld_1145_2) as fld_1145_view from gmis_mo_1145", "--请选择--");//受纳水体代码1145
            SetFilter(fld_1149_25, "0");
            //行业类别
            db.SqlString="select mocode,fld_1200_1,fld_1200_3 from gmis_mo_1200 order by fld_1200_6";
            DataTable dt22=db.GetDataTable();
            string strtag="";
            if(dt22.Rows.Count>0)
            {
                foreach(DataRow dr in dt22.Rows)
                {
                    strtag="";
                    for(int i=0;i<Convert.ToInt32(dr["fld_1200_3"]);i++)
                    {
                        strtag+=">";
                    }
                    fld_1149_92.Items.Add(new ListItem(strtag+dr["fld_1200_1"].ToString(),dr["mocode"].ToString()));
                    
                }
            }  
            BindListControl(fld_1149_28, "fld_1174_1", "fld_1174_2", "select fld_1174_1,fld_1174_2 from gmis_mo_1174");//排入污水厂处理名称--
            BindListControl(fld_1149_93, "mocode", "fld_1194_1", "select mocode,fld_1194_1 from gmis_mo_1194");//重点污染源标识
            for (int i = 1; i < 11; i++)
            {
                for (int j = 5; j < 43; j++)
                {//onfocusout="checkThis(0);"
                    //((System.Web.UI.HtmlControls.HtmlInputText)FindControl("fld_1150_" + j + "_" + i)).Attributes["runat"] = @"server";
                    ((System.Web.UI.HtmlControls.HtmlInputText)FindControl("fld_1150_" + j + "_" + i)).Attributes["onfocusout"] = @"checkin(" + j + "," + i + ")";
                    ((System.Web.UI.HtmlControls.HtmlInputText)FindControl("fld_1150_" + j + "_" + i)).Attributes["onkeyup"] = @"value=value.replace(/[^\d.]/g,'')";
                }
            }
            for (int i = 29; i < 92; i++)
            {
                ((System.Web.UI.HtmlControls.HtmlInputText)FindControl("fld_1149_" + i)).Attributes["onfocusout"] = @"checkin1149(" + i + ")";
                ((System.Web.UI.HtmlControls.HtmlInputText)FindControl("fld_1149_" + i)).Attributes["onkeyup"] = @"value=value.replace(/[^\d.]/g,'')";
            }
            if (id != "0")
            {
                guangye.BindData(dtable_1149, filter, flds_1149);
                guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
                fld_1149_2.Attributes.Add("readonly", "");
                fld_1149_1.Enabled = false;
                btn_search.Visible = false;
                tb_2_new.Visible=true;
                
                edit_value();
                
            }
            else if(qiye_id != "0")
            {
                guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
                fld_1149_2.Attributes.Add("readonly", "");
                btn_search.Visible = false;
                tb_2_new.Visible=true;
            }
           
        }
        //同步受纳水体名称
        if(fld_1149_25.SelectedItem.Value!="0")
        {
            fld_1149_26.Value = fld_1149_25.SelectedItem.ToString().Substring(fld_1149_25.SelectedItem.ToString().IndexOf('|')).TrimStart('|');
        }
        else
        {
            fld_1149_26.Value = "";
        }
        //Response.Write(filter);
            
    }
    //获取多选内容
    private string getcheckeditemname(string itemcode,string objtablename,string objcodecol,string objnamecol)
    {
        string itemname = "";
        db.SqlString = "select "+objcodecol+","+objnamecol+" from "+objtablename+"";
        DataTable dt_biaoshibiao = db.GetDataTable();

        string[] biaosi = itemcode.Replace(',',';').Split(';');
        foreach (DataRow dr_biaoshi in dt_biaoshibiao.Rows)
        {
            foreach (string biaoshidaima in biaosi)
            {
                if (dr_biaoshi[0].ToString() == biaoshidaima)
                {
                    //Response.Write(dr_wrybsb[1].ToString());
                    itemname += dr_biaoshi[1].ToString() + ",";
                }
            }
        }
        return itemname.TrimEnd(','); 
    }

private void Click_NewAdd_1149(object sender, System.EventArgs e)
{   
    Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("add")+"&mid="+mid+"");
}
</script>

<script>
//验证是否输入数字
function checkin(args1,args2)
{
//alert('fld_1150_' + args1 + '_' + args2 + '');
    if(!IsFloat(document.getElementById('fld_1150_' + args1 + '_' + args2 + '').value, "+" ,null)&&document.getElementById('fld_1150_' + args1 + '_' + args2 + '').value!=''&&document.getElementById('fld_1150_' + args1 + '_' + args2 + '').value!='0')
    {
        alert('需输入正浮点数！');
        document.getElementById('fld_1150_' + args1 + '_' + args2 + '').focus();    
    }
}
function checkin1149(args1)
{

//    if((args1==42&&!IsFloat(document.getElementById('fld_1149_' + args1 + '').value, "+" ,null))||(args1==44&&!IsFloat(document.getElementById('fld_1149_' + args1 + '').value, "+" ,null))||(args1==46&&!IsFloat(document.getElementById('fld_1149_' + args1 + '').value, "+" ,null)))
//    {
//        alert('需输入正浮点数！');
//        document.getElementById('fld_1149_' + args1 + '').focus();
//    }
//    else
     if(!IsFloat(document.getElementById('fld_1149_' + args1 + '').value, "+" ,null)&&document.getElementById('fld_1149_' + args1 +  '').value!=''&&document.getElementById('fld_1149_' + args1 +  '').value!='0')
    {
        alert('需输入正浮点数！');
        document.getElementById('fld_1149_' + args1 + '').focus();
    }
    else
    {
        if((args1==71||args1==72)&&Number(document.getElementById('fld_1149_71').value)<Number(document.getElementById('fld_1149_72').value))
        {
//            if(document.getElementById('fld_1149_71').value!=''&&document.getElementById('fld_1149_72').value!='')
//            {
                alert("注意指标间关系：40≥41");
                document.getElementById('fld_1149_' + args1 + '').value="";
                document.getElementById('fld_1149_' + args1 + '').focus();
//            }
        }
        else if((args1==75||args1==76)&&Number(document.getElementById('fld_1149_75').value)<Number(document.getElementById('fld_1149_76').value))
        {
//            if(document.getElementById('fld_1149_75').value!=''&&document.getElementById('fld_1149_76').value!='')
//            {
                alert("注意指标间关系：44≥45");
                document.getElementById('fld_1149_' + args1 + '').value="";
                document.getElementById('fld_1149_' + args1 + '').focus();
//            }
        }
//        else if((args1==82||args1==87)&&Number(document.getElementById('fld_1149_82').value)<Number(document.getElementById('fld_1149_87').value))
//        {
////            if(document.getElementById('fld_1149_82').value!=''&&document.getElementById('fld_1149_87').value!='')
////            {
//                alert("注意指标间关系：51≥56");
//                document.getElementById('fld_1149_' + args1 + '').value="";
//                document.getElementById('fld_1149_' + args1 + '').focus();
////            }
//        }
//        else if((args1==89||args1==90)&&Number(document.getElementById('fld_1149_89').value)<Number(document.getElementById('fld_1149_90').value))
//        {
////            if(document.getElementById('fld_1149_89').value!=''&&document.getElementById('fld_1149_90').value!='')
////            {
//                alert("注意指标间关系：58≥59");
//                document.getElementById('fld_1149_' + args1 + '').value="";
//                document.getElementById('fld_1149_' + args1 + '').focus();
////            }
//        }
    }
}
function showsum()
{
    for(i=5;i<43;i++)
    {
        document.getElementById('fld_1150_'+i).value=Number(document.getElementById('fld_1150_'+i+'_1').value)+Number(document.getElementById('fld_1150_'+i+'_2').value)+Number(document.getElementById('fld_1150_'+i+'_3').value)+Number(document.getElementById('fld_1150_'+i+'_4').value)+Number(document.getElementById('fld_1150_'+i+'_5').value)+Number(document.getElementById('fld_1150_'+i+'_6').value)+Number(document.getElementById('fld_1150_'+i+'_7').value)+Number(document.getElementById('fld_1150_'+i+'_8').value)+Number(document.getElementById('fld_1150_'+i+'_9').value)+Number(document.getElementById('fld_1150_'+i+'_10').value);
    }
}
//合计并验证指标
function sum_value(i)
{
    document.getElementById('fld_1150_'+i).value=Number(document.getElementById('fld_1150_'+i+'_1').value)+Number(document.getElementById('fld_1150_'+i+'_2').value)+Number(document.getElementById('fld_1150_'+i+'_3').value)+Number(document.getElementById('fld_1150_'+i+'_4').value)+Number(document.getElementById('fld_1150_'+i+'_5').value)+Number(document.getElementById('fld_1150_'+i+'_6').value)+Number(document.getElementById('fld_1150_'+i+'_7').value)+Number(document.getElementById('fld_1150_'+i+'_8').value)+Number(document.getElementById('fld_1150_'+i+'_9').value)+Number(document.getElementById('fld_1150_'+i+'_10').value);
//    for(j=1;j<11;j++)
//    {
//        checkin(i,j)
//    }
    if(i==35||i==36)
    {
        for(j=1;j<11;j++)
        {
            if(Number(document.getElementById('fld_1150_35_'+j).value)<Number(document.getElementById('fld_1150_36_'+j).value))
            {
                alert("注意指标间关系：91≥92");
        document.getElementById('fld_1150_'+i+'_'+j).value="";
        document.getElementById('fld_1150_'+i+'_'+j).focus();
            }
        }
    }
    else if(i==38||i==39)
    {
        for(j=1;j<11;j++)
        {
            if(Number(document.getElementById('fld_1150_38_'+j).value)<Number(document.getElementById('fld_1150_39_'+j).value))
            {
                alert("注意指标间关系：94≥95");
        document.getElementById('fld_1150_'+i+'_'+j).value="";
        document.getElementById('fld_1150_'+i+'_'+j).focus();
            }
        }
    }
    else if(i==41||i==42)
    {
        for(j=1;j<11;j++)
        {
            if(Number(document.getElementById('fld_1150_41_'+j).value)<Number(document.getElementById('fld_1150_42_'+j).value))
            {
                alert("注意指标间关系：97≥98");
        document.getElementById('fld_1150_'+i+'_'+j).value="";
        document.getElementById('fld_1150_'+i+'_'+j).focus();
            }
        }
    }
    
    document.getElementById('fld_1150_'+i).value=Number(document.getElementById('fld_1150_'+i+'_1').value)+Number(document.getElementById('fld_1150_'+i+'_2').value)+Number(document.getElementById('fld_1150_'+i+'_3').value)+Number(document.getElementById('fld_1150_'+i+'_4').value)+Number(document.getElementById('fld_1150_'+i+'_5').value)+Number(document.getElementById('fld_1150_'+i+'_6').value)+Number(document.getElementById('fld_1150_'+i+'_7').value)+Number(document.getElementById('fld_1150_'+i+'_8').value)+Number(document.getElementById('fld_1150_'+i+'_9').value)+Number(document.getElementById('fld_1150_'+i+'_10').value);
}
function Fold(str)
{
    document.getElementById("table"+str).style.display="block";
    document.getElementById("td"+str).innerHTML="<img src=\"images/node_closed.gif\" onclick=\"unFold('"+str+"')\" onmouseover=\"this.style.cursor='hand';\"  width=\"17\" height=\"17\" >";
}
function unFold(str)
{
    document.getElementById("table"+str).style.display="none";
    document.getElementById("td"+str).innerHTML="<img src=\"images/node_opened.gif\" onclick=\"Fold('"+str+"')\" onmouseover=\"this.style.cursor='hand';\"  width=\"17\" height=\"17\" >";
    
}
</script>

<body style="padding:10px;text-align:center"><%-- onload="showsum()"--%>
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<td align="right" width="120px"><span style="width:120px; text-align:right;"><span style="color:Red;">*</span> 统计年份:</span></td>
          <td align="left" >
            <asp:DropDownList ID="fld_1149_1" Width="120px" runat="server">
            </asp:DropDownList>
          </td>
			<td  width="100%"><span id="alertmess_1149" runat="server" style="color:Red;"></span></td>
			<td id="tb_2_new" visible="false" runat="server" align="right" style="padding-left:5px;width:55px; padding-right:5px;" nowrap>
            <G:Button id="btn_newadd_new" type="toolbar" mode="on" icon="tb01" text="重新新增" onclick="Click_NewAdd_1149" runat="server"></G:Button>
            </td>
			<td id="tb_save_1149" align="right" runat="server" nowrap>
                <G:Button id="btn_save_1149" type="toolbar" mode="on" icon="tb05" text="保存" onclick="Click_Save_1149" runat="server"></G:Button>
            </td>
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
    <input id="fld_1202_24" runat="server" type="hidden" value="1" />
<input id="Hidden7" value="7" runat="server" type="hidden" />
<input id="Hidden8" value="8" runat="server" type="hidden" />
<input id="Hidden6" value="6" runat="server" type="hidden" />
<input id="Hidden5" value="5" runat="server" type="hidden" />
<input id="Hidden4" value="4" runat="server" type="hidden" />
<input id="Hidden1" value="1" runat="server" type="hidden" />
<input id="Hidden2" value="2" runat="server" type="hidden" />
<input id="Hidden3" value="3" runat="server" type="hidden" />
<input id="Hidden9" value="9" runat="server" type="hidden" />
<input id="Hidden10" value="10" runat="server" type="hidden" />
<div id="div_input" runat="server">
<table><tr><td>
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><!--表头-->
            <table width="100%">
                <tr>
                    <td align="center" valign="middle" style="font-size:large; font-weight:bolder;">火电企业污染排放及处理利用情况</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td><!--表头-->            
            <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td rowspan="2" align="right"  class="td_viewcontent_title"><span style="color:Red;">*</span>1、企业法人代码</td>
      <td rowspan="2" align="left"  class="td_viewcontent_content" runat="server">
        <div style="float:left;"><input runat="server" id="fld_1149_2" type="text" name="textfield"><input runat="server" id="fld_1149_2_code" type="hidden" name="textfield"></div>
        <div style="float:left;" id="btn_search_box"><asp:LinkButton id="btn_search" runat="server" OnClick="Click_Search"><img src="images\icons\search.gif" style="cursor:hand" title="查询" border="0" /></asp:LinkButton ></div>
      </td>
      <td rowspan="2" align="right"  class="td_viewcontent_title">3、曾用名</td>
      <td rowspan="2" align="left"  class="td_viewcontent_content"><input runat="server" id="fld_1149_5" name="textfield" type="text" style="width:100px; "></td>
      <td rowspan="2" align="right"  class="td_viewcontent_title">4、企业地理位置</td>
      <td class="td_viewcontent_content">中心经度
      <input runat="server" id="fld_1149_6" name="textfield" type="text" style="width:15px; ">°
      <input runat="server" id="fld_1149_7" name="textfield" type="text" style="width:15px; ">′
      <input runat="server" id="fld_1149_8" name="textfield" type="text" style="width:15px; ">″
      </td>
    </tr>
    <tr>
      <td class="td_viewcontent_content">中心纬度
        <input runat="server" id="fld_1149_9" name="textfield" type="text" style="width:15px; ">°
        <input runat="server" id="fld_1149_10" name="textfield" type="text" style="width:15px; ">′
        <input runat="server" id="fld_1149_11" name="textfield" type="text" style="width:15px; ">″</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">2、企业详细名称</td>
      <td align="left"  class="td_viewcontent_content">
        <input runat="server" id="fld_1149_4" type="text" name="textfield">
</td>
      <td align="right"  class="td_viewcontent_title">重点污染源标识</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">
        <asp:CheckBoxList ID="fld_1149_93" RepeatDirection="Horizontal" RepeatColumns="6" runat="server" />
        </td>
    </tr>
    <tr>
      <td rowspan="4" align="right"  class="td_viewcontent_title">5、法人及联系人</td>
      <td align="left"  class="td_viewcontent_content">姓&nbsp;&nbsp;&nbsp;&nbsp;名
      <input runat="server" id="fld_1149_12" name="textfield" type="text" style="width:80px; ">
      <input runat="server" id="fld_1149_16" name="textfield" type="text" style="width:80px; "></td>
      <td rowspan="3" align="right"  class="td_viewcontent_title">6、企业详细地址及行政区划</td>
      <td rowspan="3" align="left"  class="td_viewcontent_content">
        <textarea id="fld_1149_19" name="textarea" style="width:100px; height:100px; "></textarea>
     </td>
      <td rowspan="2" align="right"  class="td_viewcontent_title">7、登记注册类型</td>
      <td rowspan="2" class="td_viewcontent_content">
      <asp:DropDownList ID="fld_1149_21" style="width:120px;" runat="server"></asp:DropDownList>
      </td>
    </tr>
    <tr>
      <td align="left"  class="td_viewcontent_content">电&nbsp;&nbsp;&nbsp;&nbsp;话
      <input runat="server" id="fld_1149_13" name="textfield" type="text" style="width:80px; ">
      <input runat="server" id="fld_1149_17" name="textfield" type="text" style="width:80px; "></td>
    </tr>
    <tr>
      <td align="left"  class="td_viewcontent_content">传&nbsp;&nbsp;&nbsp;&nbsp;真
      <input runat="server" id="fld_1149_14" name="textfield" type="text" style="width:80px; ">
      <input runat="server" id="fld_1149_18" name="textfield" type="text" style="width:80px; "></td>
      <td align="right"  class="td_viewcontent_title">8、所属集团公司</td>
      <td class="td_viewcontent_content">
      <asp:DropDownList ID="fld_1149_22" style="width:120px;" runat="server"></asp:DropDownList>
</td>
    </tr>
    <tr>
      <td align="left"  class="td_viewcontent_content">邮政编码
      <input runat="server" id="fld_1149_15" name="textfield" type="text" style="width:166px; "></td>
      <td align="right"  class="td_viewcontent_title">行政区域代码</td>
      <td align="left"  class="td_viewcontent_content">
      <asp:DropDownList ID="fld_1149_20" style="width:120px;" runat="server"></asp:DropDownList>
      </td>
      <td align="right"  class="td_viewcontent_title">9、开业时间</td>
      <td class="td_viewcontent_content"><input runat="server" id="fld_1149_23" name="textfield" type="text" style="width:120px; "></td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">10、排水去向类型</td>
      <td align="left"  class="td_viewcontent_content">
      <asp:DropDownList ID="fld_1149_24" style="width:120px;" runat="server"></asp:DropDownList></td>
      <td align="right"  class="td_viewcontent_title">11、受纳水体代码</td>
      <td align="left"  class="td_viewcontent_content">
      <asp:DropDownList ID="fld_1149_25" style="width:120px;" AutoPostBack="true" runat="server"></asp:DropDownList></td>
      <td align="right"  class="td_viewcontent_title">受纳水体名称</td>
      <td class="td_viewcontent_content"><input runat="server" id="fld_1149_26" name="textfield" type="text" style="width:120px; "></td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">12、排入污水厂处理代码</td>
      <td align="left"  class="td_viewcontent_content"><input runat="server" id="fld_1149_27" name="textfield" type="text" style="width:220px; "></td>
      <td align="right"  class="td_viewcontent_title">排入污水厂处理名称</td>
      <td align="left"  class="td_viewcontent_content">
      <asp:DropDownList ID="fld_1149_28" style="width:120px;" runat="server"></asp:DropDownList></td>
      <td align="right"  class="td_viewcontent_title">行业类别</td>
      <td class="td_viewcontent_content"><asp:DropDownList ID="fld_1149_92" runat="server"  style="width:95%;" ></asp:DropDownList>
    </td>
    </tr>
</table>
            <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">环年基1-2表</td>
            <td width="21" id="td1"><img src="images/node_closed.gif" onclick="unFold('1')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table id="table1" width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td align="center"  class="td_viewcontent_content">代码</td>
      <td align="center"  class="td_viewcontent_title">指标名称</td>
      <td align="center"  class="td_viewcontent_content">计量单位</td>
      <td align="center"  class="td_viewcontent_content">本年实际</td>
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
      <td align="center"  class="td_viewcontent_content">甲</td>
      <td align="center"  class="td_viewcontent_title">乙</td>
      <td align="center"  class="td_viewcontent_content">丙</td>
      <td align="center"  class="td_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title">一、企业基本情况</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">7</td>
      <td align="center"  class="td_viewcontent_title">5、燃料煤平均硫份</td>
      <td align="center"  class="td_viewcontent_content">%</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_35" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">14</td>
      <td align="center"  class="td_viewcontent_title">其中：烟尘排放达标的</td>
      <td align="center"  class="td_viewcontent_content">台/蒸吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_43" name="textfield" type="text" style="width:40px; ">/<input runat="server" id="fld_1149_44" name="textfield" type="text" style="width:40px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">1</td>
      <td align="center"  class="td_viewcontent_title">1、工业总产值（现价）</td>
      <td align="center"  class="td_viewcontent_content">万元</td>
      <td align="center"  class="td_viewcontent_content">
        <input runat="server" id="fld_1149_29" name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center"  class="td_viewcontent_content">8</td>
      <td align="center"  class="td_viewcontent_title">6、燃料煤平均灰份</td>
      <td align="center"  class="td_viewcontent_content">%</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_36" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">15</td>
      <td align="left"  class="td_viewcontent_title">　　　　二氧化硫排放达标的</td>
      <td align="center"  class="td_viewcontent_content">台/蒸吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_45" name="textfield" type="text" style="width:40px; ">/<input runat="server" id="fld_1149_46" name="textfield" type="text" style="width:40px; ">
    </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">2</td>
      <td align="center"  class="td_viewcontent_title">2、“三废”综合利用产品产值</td>
      <td align="center"  class="td_viewcontent_content">万元</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_30" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">9</td>
      <td align="center"  class="td_viewcontent_title">7、燃料煤挥发份</td>
      <td align="center"  class="td_viewcontent_content">%</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_37" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">16</td>
      <td align="center"  class="td_viewcontent_title">12、污水排放口数</td>
      <td align="center"  class="td_viewcontent_content">个</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_47" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">3</td>
      <td align="center"  class="td_viewcontent_title">3、企业专职环保人员数</td>
      <td align="center"  class="td_viewcontent_content">人</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_31" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">10</td>
      <td align="center"  class="td_viewcontent_title">8、低位发热量</td>
      <td align="center"  class="td_viewcontent_content">千焦/千克</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_38" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">17</td>
      <td align="center"  class="td_viewcontent_title">13、直排海的污水排放口数</td>
      <td align="center"  class="td_viewcontent_content">个</td>
      <td align="center"  class="td_viewcontent_content">
        <input runat="server" id="fld_1149_48" name="textfield" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">4</td>
      <td align="center"  class="td_viewcontent_title">4、工业用水量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_32" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">11</td>
      <td align="center"  class="td_viewcontent_title">9、重油平均硫份</td>
      <td align="center"  class="td_viewcontent_content">%</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_39" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">18</td>
      <td align="center"  class="td_viewcontent_title">14、废水在线监测仪器套数</td>
      <td align="center"  class="td_viewcontent_content">套</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_49" name="textfield" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">5</td>
      <td align="center"  class="td_viewcontent_title">新鲜用水量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center" class="td_viewcontent_content"><input runat="server" id="fld_1149_33" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">12</td>
      <td align="center"  class="td_viewcontent_title">　10、机组数</td>
      <td align="center"  class="td_viewcontent_content">个</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_40" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">19</td>
      <td align="center"  class="td_viewcontent_title">15、废气在线监测仪器套数</td>
      <td align="center"  class="td_viewcontent_content">套</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_50" name="textfield" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">6</td>
      <td align="center"  class="td_viewcontent_title">重复用水量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_34" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">13</td>
      <td align="center"  class="td_viewcontent_title">11、锅炉数</td>
      <td align="center"  class="td_viewcontent_content">台/蒸吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_41" name="textfield" type="text" style="width:40px; ">/<input runat="server"  id="fld_1149_42" name="textfield" type="text" style="width:40px; "></td>
      <td align="center"  class="td_viewcontent_content">20</td>
      <td align="center"  class="td_viewcontent_title">16、脱硫机组装容量</td>
      <td align="center"  class="td_viewcontent_content">万千瓦</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_51" name="textfield" type="text" style="width:70px; "></td>
    </tr>
</table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="font1220_000000">指标间关系：4=5+6,13≥14,13≥15</td>
    </tr>
  </table>
            <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">环年基1-2表续表1</td>
            <td width="21" id="td2"><img src="images/node_closed.gif" onclick="unFold('2')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%" id="table2"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td align="center"  class="td_viewcontent_content">代码</td>
      <td align="center"  class="td_viewcontent_title">指标名称</td>
      <td align="center"  class="td_viewcontent_content">计量单位</td>
      <td align="center"  class="td_viewcontent_content">本年实际</td>
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
      <td align="center"  class="td_viewcontent_content">甲</td>
      <td align="center"  class="td_viewcontent_title">乙</td>
      <td align="center"  class="td_viewcontent_content">丙</td>
      <td align="center"  class="td_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">21</td>
      <td align="center"  class="td_viewcontent_title">17、脱硝机组装机容量 </td>
      <td align="center"  class="td_viewcontent_content">万/千瓦</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_52" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">34</td>
      <td align="center"  class="td_viewcontent_title"> （3）石油类 </td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_65" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">46</td>
      <td align="center"  class="td_viewcontent_title"> 1、工业固体废物产生量 </td>
      <td align="center"  class="td_viewcontent_content"> 吨 </td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_77" name="textfield" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">22</td>
      <td align="center"  class="td_viewcontent_title">18、厂用电率  </td>
      <td align="center"  class="td_viewcontent_content">%</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_53" name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center"  class="td_viewcontent_content">35</td>
      <td align="center"  class="td_viewcontent_title">


（4）挥发酚</td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_66" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">47</td>
      <td align="center"  class="td_viewcontent_title"> （1）粉煤灰</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_78" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">23</td>
      <td align="center"  class="td_viewcontent_title">19、供电标准煤耗 </td>
      <td align="center"  class="td_viewcontent_content">克/千瓦</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_54" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title"> 9、工业废水中污染物排放量 </td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">48</td>
      <td align="center"  class="td_viewcontent_title"> （2）炉渣 </td>
      <td align="center"  class="td_viewcontent_content">吨 </td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_79" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title">二、工业废水  </td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">36</td>
      <td align="center"  class="td_viewcontent_title"> （1）化学需氧量 </td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_67" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">49</td>
      <td align="center"  class="td_viewcontent_title"> （3）煤矸石 </td>
      <td align="center"  class="td_viewcontent_content"> 吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_80" name="textfield" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">24</td>
      <td align="center"  class="td_viewcontent_title">1、废水治理设施数  </td>
      <td align="center"  class="td_viewcontent_content">套</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_55" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">37</td>
      <td align="center"  class="td_viewcontent_title">（2）氨氮 </td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_68" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">50</td>
      <td align="center"  class="td_viewcontent_title"> （4）脱硫石膏 </td>
      <td align="center"  class="td_viewcontent_content"> 吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_81" name="textfield" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">25</td>
      <td align="center"  class="td_viewcontent_title">2、废水治理设施数处理能力 </td>
      <td align="center"  class="td_viewcontent_content">吨/日</td>
      <td align="center" class="td_viewcontent_content"><input runat="server" id="fld_1149_56" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">38</td>
      <td align="center"  class="td_viewcontent_title">　（3）石油类</td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_69" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">51</td>
      <td align="center"  class="td_viewcontent_title"> 2.工业固体废物综合利用量</td>
      <td align="center"  class="td_viewcontent_content"> 吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_82" name="textfield" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">26</td>
      <td align="center"  class="td_viewcontent_title">3、废水治理设施数运行费用</td>
      <td align="center"  class="td_viewcontent_content">万元</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_57" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">39</td>
      <td align="center"  class="td_viewcontent_title"> 　（4）挥发酚 </td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_70" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">52</td>
      <td align="center"  class="td_viewcontent_title"> （1）粉煤灰</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_83" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">27</td>
      <td align="center"  class="td_viewcontent_title">4、工业废水处理量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_58" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title"> 三、工业废气 </td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">53</td>
      <td align="center"  class="td_viewcontent_title"> （2）炉渣</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_84" name="textfield" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">28</td>
      <td align="center"  class="td_viewcontent_title">5、工业废水排放量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_59" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">40</td>
      <td align="center"  class="td_viewcontent_title"> 1、废气治理设施数 </td>
      <td align="center"  class="td_viewcontent_content">套</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_71" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">54</td>
      <td align="center"  class="td_viewcontent_title"> （3）煤矸石</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_85" name="textfield" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">29</td>
      <td align="center"  class="td_viewcontent_title">其中：直接排入海的</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_60" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">41</td>
      <td align="center"  class="td_viewcontent_title"> 其中：脱硫设施数</td>
      <td align="center"  class="td_viewcontent_content">套</td>
      <td align="center" class="td_viewcontent_content"><input runat="server" id="fld_1149_72" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">55</td>
      <td align="center"  class="td_viewcontent_title"> （4）脱硫石膏</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_86" name="textfield" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">30</td>
      <td align="center"  class="td_viewcontent_title">　　　　　排入污水厂处理的 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_61" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">42</td>
      <td align="center"  class="td_viewcontent_title"> 2、废气治理设施处理能力 </td>
      <td align="center"  class="td_viewcontent_content">标立方米/时</td>
      <td align="center" class="td_viewcontent_content"><input runat="server" id="fld_1149_73" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">56</td>
      <td align="center"  class="td_viewcontent_title"> 其中：综合利用往年贮存量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_87" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">31</td>
      <td align="center"  class="td_viewcontent_title">7、工业废水排放达标量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_62" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">43</td>
      <td align="center"  class="td_viewcontent_title"> 其中：脱硫设施脱硫能力</td>
      <td align="center"  class="td_viewcontent_content">吨/年</td>
      <td align="center" class="td_viewcontent_content"><input runat="server" id="fld_1149_74" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">57</td>
      <td align="center"  class="td_viewcontent_title"> 3、工业固体废物贮存量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_88" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title"> 8、工业废水中污染物却除量</td>
      <td align="center"  class="td_viewcontent_content"> --</td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">44</td>
      <td align="center"  class="td_viewcontent_title"> 3、废气治理设施运行费用</td>
      <td align="center"  class="td_viewcontent_content">万元</td>
      <td align="center" class="td_viewcontent_content"><input runat="server" id="fld_1149_75" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">58</td>
      <td align="center"  class="td_viewcontent_title"> 4、工业固体废物处置量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_89" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">32</td>
      <td align="center"  class="td_viewcontent_title"> （1）化学需氧量 </td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_63" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">45</td>
      <td align="center"  class="td_viewcontent_title">其中：脱硫设施运行费用</td>
      <td align="center"  class="td_viewcontent_content">万元</td>
      <td align="center" class="td_viewcontent_content"><input runat="server" id="fld_1149_76" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">59</td>
      <td align="center"  class="td_viewcontent_title"> 其中：处置往年贮存量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_90" name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">33</td>
      <td align="center"  class="td_viewcontent_title"> （2）氨氮 </td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_64" name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title"> 四、工业固体废物 </td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center" class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content">60</td>
      <td align="center"  class="td_viewcontent_title"> 5、工业固体废物排放量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input runat="server" id="fld_1149_91" name="textfield" type="text" style="width:70px; "></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="font1220_000000">指标间关系：5≥28,28≥29,28≥30,28≥31,40≥41,44≥45,46=47+48+49+50,46=51+57+58+60-56-59,51=52+53+54+55,51≥56,58≥59</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">环年基1-2表续表2</td>
            <td width="21" id="td3"><img src="images/node_closed.gif" onclick="unFold('3')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%" id="table3"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td align="center"  class="td_viewcontent_content">代码</td>
      <td align="center"  class="td_viewcontent_title">指标名称</td>
      <td align="center"  class="td_viewcontent_content">计量单位</td>
      <td colspan="11" align="center"  class="td_viewcontent_content"> 本年实际   </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_title"> 五、机组情况 </td>
      <td align="center"  class="td_viewcontent_content">--</td>
      <td align="center"  class="td_viewcontent_content"> 合计 </td>
      <td align="center"  class="td_viewcontent_content"> #1机组 </td>
      <td align="center"  class="td_viewcontent_content"> #2机组 </td>
      <td align="center"  class="td_viewcontent_content">#3机组</td>
      <td align="center"  class="td_viewcontent_content">#4机组</td>
      <td align="center"  class="td_viewcontent_content">#5机组</td>
      <td align="center" class="td_viewcontent_content">#6机组</td>
      <td align="center"  class="td_viewcontent_content">#7机组 </td>
      <td align="center"  class="td_viewcontent_content">#8机组 </td>
      <td align="center"  class="td_viewcontent_content">#9机组</td>
      <td align="center"  class="td_viewcontent_content">#10机组</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">61</td>
      <td align="center"  class="td_viewcontent_title"> 1. 装机容量 </td>
      <td align="center"  class="td_viewcontent_content">万/千瓦 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_5" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(5)" id="fld_1150_5_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(5)" id="fld_1150_5_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(5)" id="fld_1150_5_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(5)" id="fld_1150_5_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(5)" id="fld_1150_5_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(5)" id="fld_1150_5_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(5)" id="fld_1150_5_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(5)" id="fld_1150_5_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(5)" id="fld_1150_5_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(5)" id="fld_1150_5_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">62</td>
      <td align="center"  class="td_viewcontent_title"> 2.锅炉吨位 </td>
      <td align="center"  class="td_viewcontent_content">蒸吨/时 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_6" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(6)" id="fld_1150_6_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(6)" id="fld_1150_6_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(6)" id="fld_1150_6_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(6)" id="fld_1150_6_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(6)" id="fld_1150_6_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(6)" id="fld_1150_6_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(6)" id="fld_1150_6_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(6)" id="fld_1150_6_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(6)" id="fld_1150_6_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(6)" id="fld_1150_6_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">63</td>
      <td align="center"  class="td_viewcontent_title"> 3.发电量 </td>
      <td align="center"  class="td_viewcontent_content">万千瓦时 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_7" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(7)" id="fld_1150_7_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(7)" id="fld_1150_7_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(7)" id="fld_1150_7_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(7)" id="fld_1150_7_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(7)" id="fld_1150_7_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(7)" id="fld_1150_7_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(7)" id="fld_1150_7_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(7)" id="fld_1150_7_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(7)" id="fld_1150_7_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(7)" id="fld_1150_7_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">64</td>
      <td align="center"  class="td_viewcontent_title"> 4.供热量 </td>
      <td align="center"  class="td_viewcontent_content">兆焦 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_8" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(8)" id="fld_1150_8_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(8)" id="fld_1150_8_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(8)" id="fld_1150_8_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(8)" id="fld_1150_8_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(8)" id="fld_1150_8_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(8)" id="fld_1150_8_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(8)" id="fld_1150_8_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(8)" id="fld_1150_8_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(8)" id="fld_1150_8_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(8)" id="fld_1150_8_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">65</td>
      <td align="center"  class="td_viewcontent_title"> 5.机组投产时间 </td>
      <td align="center"  class="td_viewcontent_content">年月 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_9" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(9)" id="fld_1150_9_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(9)" id="fld_1150_9_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(9)" id="fld_1150_9_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(9)" id="fld_1150_9_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(9)" id="fld_1150_9_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(9)" id="fld_1150_9_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(9)" id="fld_1150_9_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(9)" id="fld_1150_9_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(9)" id="fld_1150_9_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(9)" id="fld_1150_9_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">66</td>
      <td align="center"  class="td_viewcontent_title"> 6.发电小时数 </td>
      <td align="center"  class="td_viewcontent_content">小时</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_10" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(10)" id="fld_1150_10_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(10)" id="fld_1150_10_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(10)" id="fld_1150_10_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(10)" id="fld_1150_10_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(10)" id="fld_1150_10_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(10)" id="fld_1150_10_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(10)" id="fld_1150_10_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(10)" id="fld_1150_10_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(10)" id="fld_1150_10_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(10)" id="fld_1150_10_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">67</td>
      <td align="center"  class="td_viewcontent_title"> 7.发电标准煤耗 </td>
      <td align="center"  class="td_viewcontent_content"> 克/千瓦时 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_11" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(11)" id="fld_1150_11_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(11)" id="fld_1150_11_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(11)" id="fld_1150_11_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(11)" id="fld_1150_11_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(11)" id="fld_1150_11_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(11)" id="fld_1150_11_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(11)" id="fld_1150_11_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(11)" id="fld_1150_11_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(11)" id="fld_1150_11_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(11)" id="fld_1150_11_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">68</td>
      <td align="center"  class="td_viewcontent_title"> 8.煤炭消费量 </td>
      <td align="center"  class="td_viewcontent_content"> 万吨 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_12" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(12)" id="fld_1150_12_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(12)" id="fld_1150_12_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(12)" id="fld_1150_12_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(12)" id="fld_1150_12_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(12)" id="fld_1150_12_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(12)" id="fld_1150_12_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(12)" id="fld_1150_12_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(12)" id="fld_1150_12_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(12)" id="fld_1150_12_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(12)" id="fld_1150_12_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">69</td>
      <td align="center"  class="td_viewcontent_title"> 其中：发电消费量 </td>
      <td align="center"  class="td_viewcontent_content"> 万吨 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_13" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(13)" id="fld_1150_13_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(13)" id="fld_1150_13_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(13)" id="fld_1150_13_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(13)" id="fld_1150_13_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(13)" id="fld_1150_13_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(13)" id="fld_1150_13_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(13)" id="fld_1150_13_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(13)" id="fld_1150_13_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(13)" id="fld_1150_13_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(13)" id="fld_1150_13_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">70</td>
      <td align="center"  class="td_viewcontent_title">　　


供热消费量</td>
      <td align="center"  class="td_viewcontent_content">万吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_14" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(14)" id="fld_1150_14_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(14)" id="fld_1150_14_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(14)" id="fld_1150_14_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(14)" id="fld_1150_14_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(14)" id="fld_1150_14_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(14)" id="fld_1150_14_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(14)" id="fld_1150_14_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(14)" id="fld_1150_14_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(14)" id="fld_1150_14_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(14)" id="fld_1150_14_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">71</td>
      <td align="center"  class="td_viewcontent_title"> 9.燃油消费量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_15" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(15)" id="fld_1150_15_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(15)" id="fld_1150_15_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(15)" id="fld_1150_15_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(15)" id="fld_1150_15_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(15)" id="fld_1150_15_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input onblur="sum_value(15)" id="fld_1150_15_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(15)" id="fld_1150_15_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(15)" id="fld_1150_15_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(15)" id="fld_1150_15_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(15)" id="fld_1150_15_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">72</td>
      <td align="center"  class="td_viewcontent_title">其中：重油</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_16" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(16)" id="fld_1150_16_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(16)" id="fld_1150_16_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(16)" id="fld_1150_16_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(16)" id="fld_1150_16_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input onblur="sum_value(16)" id="fld_1150_16_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(16)" id="fld_1150_16_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(16)" id="fld_1150_16_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(16)" id="fld_1150_16_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(16)" id="fld_1150_16_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(16)" id="fld_1150_16_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">73</td>
      <td align="center"  class="td_viewcontent_title">　　　柴油</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_17" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(17)" id="fld_1150_17_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(17)" id="fld_1150_17_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(17)" id="fld_1150_17_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(17)" id="fld_1150_17_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(17)" id="fld_1150_17_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(17)" id="fld_1150_17_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(17)" id="fld_1150_17_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(17)" id="fld_1150_17_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(17)" id="fld_1150_17_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(17)" id="fld_1150_17_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">74</td>
      <td align="center"  class="td_viewcontent_title">10.洁净燃气消耗量</td>
      <td align="center"  class="td_viewcontent_content"> 万立方米 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_18" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(18)" id="fld_1150_18_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(18)" id="fld_1150_18_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(18)" id="fld_1150_18_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(18)" id="fld_1150_18_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(18)" id="fld_1150_18_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(18)" id="fld_1150_18_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(18)" id="fld_1150_18_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(18)" id="fld_1150_18_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(18)" id="fld_1150_18_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(18)" id="fld_1150_18_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">75</td>
      <td align="center"  class="td_viewcontent_title"> 11.煤矸石消耗量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_19" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(19)" id="fld_1150_19_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(19)" id="fld_1150_19_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(19)" id="fld_1150_19_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(19)" id="fld_1150_19_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(19)" id="fld_1150_19_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(19)" id="fld_1150_19_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(19)" id="fld_1150_19_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(19)" id="fld_1150_19_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(19)" id="fld_1150_19_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(19)" id="fld_1150_19_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">76</td>
      <td align="center"  class="td_viewcontent_title"> 12.废气排放量 </td>
      <td align="center"  class="td_viewcontent_content"> 万标立方米 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_20" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(20)" id="fld_1150_20_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(20)" id="fld_1150_20_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(20)" id="fld_1150_20_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(20)" id="fld_1150_20_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(20)" id="fld_1150_20_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(20)" id="fld_1150_20_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(20)" id="fld_1150_20_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(20)" id="fld_1150_20_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(20)" id="fld_1150_20_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(20)" id="fld_1150_20_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">77</td>
      <td align="center"  class="td_viewcontent_title"> 13.出口烟气温度 </td>
      <td align="center"  class="td_viewcontent_content"> oC </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_21" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(21)" id="fld_1150_21_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(21)" id="fld_1150_21_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(21)" id="fld_1150_21_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(21)" id="fld_1150_21_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(21)" id="fld_1150_21_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(21)" id="fld_1150_21_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(21)" id="fld_1150_21_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(21)" id="fld_1150_21_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(21)" id="fld_1150_21_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(21)" id="fld_1150_21_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">78</td>
      <td align="center"  class="td_viewcontent_title"> 14.脱硝设施投产时间 </td>
      <td align="center"  class="td_viewcontent_content"> 年月 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_22" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(22)" id="fld_1150_22_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(22)" id="fld_1150_22_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(22)" id="fld_1150_22_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(22)" id="fld_1150_22_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(22)" id="fld_1150_22_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(22)" id="fld_1150_22_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(22)" id="fld_1150_22_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(22)" id="fld_1150_22_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(22)" id="fld_1150_22_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(22)" id="fld_1150_22_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">79</td>
      <td align="center"  class="td_viewcontent_title"> 15.脱硫剂消耗量 </td>
      <td align="center"  class="td_viewcontent_content"> 吨 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_23" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(23)" id="fld_1150_23_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(23)" id="fld_1150_23_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(23)" id="fld_1150_23_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(23)" id="fld_1150_23_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(23)" id="fld_1150_23_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(23)" id="fld_1150_23_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(23)" id="fld_1150_23_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(23)" id="fld_1150_23_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(23)" id="fld_1150_23_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(23)" id="fld_1150_23_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
  </table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="font1220_000000">指标间关系：68=69+70,71≥72+73</td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"> <table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">环年基1-2表续表3</td>
            <td width="21" id="td4"><img src="images/node_closed.gif" onclick="unFold('4')" onmouseover="this.style.cursor='hand';"  width="17" height="17" ></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" id="table4"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" style="margin-bottom:5px; " >
    <tr>
      <td rowspan="2" align="center"  class="td_viewcontent_content">代码</td>
      <td rowspan="2" align="center"  class="td_viewcontent_title">指标名称</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">计量单位</td>
      <td colspan="11" align="center"  class="td_viewcontent_content"> 本年实际 </td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">合计 </td>
      <td align="center"  class="td_viewcontent_content">#1机组</td>
      <td align="center"  class="td_viewcontent_content">#2机组</td>
      <td align="center"  class="td_viewcontent_content">#3机组</td>
      <td align="center"  class="td_viewcontent_content">#4机组</td>
      <td align="center"  class="td_viewcontent_content">#5机组</td>
      <td align="center"  class="td_viewcontent_content">#6机组</td>
      <td align="center"  class="td_viewcontent_content">#7机组</td>
      <td align="center"  class="td_viewcontent_content">#8机组</td>
      <td align="center"  class="td_viewcontent_content">#9机组</td>
      <td align="center"  class="td_viewcontent_content">#10机组</td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">80</td>
      <td align="center"  class="td_viewcontent_title">16.脱硫设施脱硫效率</td>
      <td align="center"  class="td_viewcontent_content">%</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_24" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(24)" id="fld_1150_24_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(24)" id="fld_1150_24_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(24)" id="fld_1150_24_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(24)" id="fld_1150_24_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(24)" id="fld_1150_24_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(24)" id="fld_1150_24_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(24)" id="fld_1150_24_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(24)" id="fld_1150_24_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(24)" id="fld_1150_24_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(24)" id="fld_1150_24_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">81</td>
      <td align="center"  class="td_viewcontent_title"> 17.<span class="font1225_FF0000">脱硫设施</span>投产时间其中：氨法 </td>
      <td align="center"  class="td_viewcontent_content">年月</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_25" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(25)" id="fld_1150_25_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(25)" id="fld_1150_25_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(25)" id="fld_1150_25_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(25)" id="fld_1150_25_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(25)" id="fld_1150_25_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(25)" id="fld_1150_25_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(25)" id="fld_1150_25_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(25)" id="fld_1150_25_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(25)" id="fld_1150_25_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(25)" id="fld_1150_25_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">82</td>
      <td align="center"  class="td_viewcontent_title">石灰/石膏法</td>
      <td align="center"  class="td_viewcontent_content">年月</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_26" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(26)" id="fld_1150_26_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(26)" id="fld_1150_26_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(26)" id="fld_1150_26_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(26)" id="fld_1150_26_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(26)" id="fld_1150_26_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(26)" id="fld_1150_26_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(26)" id="fld_1150_26_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(26)" id="fld_1150_26_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(26)" id="fld_1150_26_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(26)" id="fld_1150_26_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">83</td>
      <td align="center"  class="td_viewcontent_title">炉内喷钙炉外增湿法</td>
      <td align="center"  class="td_viewcontent_content">年月</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_27" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(27)" id="fld_1150_27_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(27)" id="fld_1150_27_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(27)" id="fld_1150_27_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(27)" id="fld_1150_27_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(27)" id="fld_1150_27_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(27)" id="fld_1150_27_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(27)" id="fld_1150_27_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(27)" id="fld_1150_27_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(27)" id="fld_1150_27_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(27)" id="fld_1150_27_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">84</td>
      <td align="center"  class="td_viewcontent_title">烟气循环硫化床法</td>
      <td align="center"  class="td_viewcontent_content">年月</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_28" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(28)" id="fld_1150_28_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(28)" id="fld_1150_28_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(28)" id="fld_1150_28_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(28)" id="fld_1150_28_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(28)" id="fld_1150_28_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(28)" id="fld_1150_28_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(28)" id="fld_1150_28_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(28)" id="fld_1150_28_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(28)" id="fld_1150_28_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(28)" id="fld_1150_28_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">85</td>
      <td align="center"  class="td_viewcontent_title">循环硫化床锅炉炉内脱硫</td>
      <td align="center"  class="td_viewcontent_content">年月 </td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_29" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(29)" id="fld_1150_29_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(29)" id="fld_1150_29_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(29)" id="fld_1150_29_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(29)" id="fld_1150_29_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(29)" id="fld_1150_29_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(29)" id="fld_1150_29_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(29)" id="fld_1150_29_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(29)" id="fld_1150_29_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(29)" id="fld_1150_29_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(29)" id="fld_1150_29_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">86</td>
      <td align="center"  class="td_viewcontent_title">其他方法</td>
      <td align="center"  class="td_viewcontent_content">年月</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_30" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(30)" id="fld_1150_30_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(30)" id="fld_1150_30_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(30)" id="fld_1150_30_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(30)" id="fld_1150_30_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(30)" id="fld_1150_30_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(30)" id="fld_1150_30_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(30)" id="fld_1150_30_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(30)" id="fld_1150_30_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(30)" id="fld_1150_30_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(30)" id="fld_1150_30_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">87</td>
      <td align="center"  class="td_viewcontent_title">18.二氧化硫排放浓度</td>
      <td align="center"  class="td_viewcontent_content">mg/Nm</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_31" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(31)" id="fld_1150_31_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(31)" id="fld_1150_31_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(31)" id="fld_1150_31_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(31)" id="fld_1150_31_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(31)" id="fld_1150_31_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(31)" id="fld_1150_31_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(31)" id="fld_1150_31_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(31)" id="fld_1150_31_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(31)" id="fld_1150_31_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(31)" id="fld_1150_31_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">88</td>
      <td align="center"  class="td_viewcontent_title">19.烟尘排放浓度</td>
      <td align="center"  class="td_viewcontent_content"> mg/Nm</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_32" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(32)" id="fld_1150_32_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(32)" id="fld_1150_32_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(32)" id="fld_1150_32_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(32)" id="fld_1150_32_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(32)" id="fld_1150_32_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(32)" id="fld_1150_32_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(32)" id="fld_1150_32_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(32)" id="fld_1150_32_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(32)" id="fld_1150_32_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(32)" id="fld_1150_32_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">89</td>
      <td align="center"  class="td_viewcontent_title">20.氮氧化物排放浓度</td>
      <td align="center"  class="td_viewcontent_content"> mg/Nm</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_33" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(33)" id="fld_1150_33_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(33)" id="fld_1150_33_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(33)" id="fld_1150_33_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(33)" id="fld_1150_33_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(33)" id="fld_1150_33_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(33)" id="fld_1150_33_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(33)" id="fld_1150_33_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(33)" id="fld_1150_33_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(33)" id="fld_1150_33_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(33)" id="fld_1150_33_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">90</td>
      <td align="center"  class="td_viewcontent_title"> 


21.二氧化硫去除量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_34" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(34)" id="fld_1150_34_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(34)" id="fld_1150_34_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(34)" id="fld_1150_34_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(34)" id="fld_1150_34_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(34)" id="fld_1150_34_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(34)" id="fld_1150_34_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(34)" id="fld_1150_34_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(34)" id="fld_1150_34_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(34)" id="fld_1150_34_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(34)" id="fld_1150_34_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">91</td>
      <td align="center"  class="td_viewcontent_title">22.二氧化硫排放量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_35" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(35)" id="fld_1150_35_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(35)" id="fld_1150_35_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(35)" id="fld_1150_35_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(35)" id="fld_1150_35_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(35)" id="fld_1150_35_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(35)" id="fld_1150_35_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(35)" id="fld_1150_35_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(35)" id="fld_1150_35_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(35)" id="fld_1150_35_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(35)" id="fld_1150_35_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">92</td>
      <td align="center"  class="td_viewcontent_title"> 其中：排放达标量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_36" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(36)" id="fld_1150_36_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(36)" id="fld_1150_36_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(36)" id="fld_1150_36_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(36)" id="fld_1150_36_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(36)" id="fld_1150_36_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(36)" id="fld_1150_36_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(36)" id="fld_1150_36_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(36)" id="fld_1150_36_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(36)" id="fld_1150_36_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(36)" id="fld_1150_36_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">93</td>
      <td align="center"  class="td_viewcontent_title"> 23.氮氧化物去除量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_37" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(37)" id="fld_1150_37_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(37)" id="fld_1150_37_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(37)" id="fld_1150_37_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(37)" id="fld_1150_37_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(37)" id="fld_1150_37_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(37)" id="fld_1150_37_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(37)" id="fld_1150_37_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(37)" id="fld_1150_37_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(37)" id="fld_1150_37_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(37)" id="fld_1150_37_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">94</td>
      <td align="center"  class="td_viewcontent_title"> 24.氮氧化物排放量 </td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_38" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(38)" id="fld_1150_38_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(38)" id="fld_1150_38_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(38)" id="fld_1150_38_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(38)" id="fld_1150_38_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(38)" id="fld_1150_38_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(38)" id="fld_1150_38_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(38)" id="fld_1150_38_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(38)" id="fld_1150_38_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(38)" id="fld_1150_38_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(38)" id="fld_1150_38_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">95</td>
      <td align="center"  class="td_viewcontent_title">其中：排放达标量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_39" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(39)" id="fld_1150_39_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(39)" id="fld_1150_39_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(39)" id="fld_1150_39_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(39)" id="fld_1150_39_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(39)" id="fld_1150_39_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(39)" id="fld_1150_39_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(39)" id="fld_1150_39_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(39)" id="fld_1150_39_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(39)" id="fld_1150_39_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(39)" id="fld_1150_39_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">96</td>
      <td align="center"  class="td_viewcontent_title">25.烟尘去除量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_40" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(40)" id="fld_1150_40_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(40)" id="fld_1150_40_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(40)" id="fld_1150_40_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(40)" id="fld_1150_40_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(40)" id="fld_1150_40_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(40)" id="fld_1150_40_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(40)" id="fld_1150_40_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(40)" id="fld_1150_40_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(40)" id="fld_1150_40_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(40)" id="fld_1150_40_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">97</td>
      <td align="center"  class="td_viewcontent_title">26.烟尘排放量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_41" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(41)" id="fld_1150_41_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(41)" id="fld_1150_41_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(41)" id="fld_1150_41_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(41)" id="fld_1150_41_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(41)" id="fld_1150_41_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(41)" id="fld_1150_41_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(41)" id="fld_1150_41_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(41)" id="fld_1150_41_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(41)" id="fld_1150_41_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(41)" id="fld_1150_41_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">98</td>
      <td align="center"  class="td_viewcontent_title">其中：排放达标量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input readonly runat="server" id="fld_1150_42" name="textfield" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(42)" id="fld_1150_42_1" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(42)" id="fld_1150_42_2" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(42)" id="fld_1150_42_3" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(42)" id="fld_1150_42_4" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(42)" id="fld_1150_42_5" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center" class="td_viewcontent_content"><input  onblur="sum_value(42)" id="fld_1150_42_6" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(42)" id="fld_1150_42_7" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(42)" id="fld_1150_42_8" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(42)" id="fld_1150_42_9" name="textfield" runat="server" type="text" style="width:60px; "></td>
      <td align="center"  class="td_viewcontent_content"><input  onblur="sum_value(42)" id="fld_1150_42_10" name="textfield" runat="server" type="text" style="width:60px; "></td>
    </tr>
  </table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="font1220_000000"> 指标间关系：91≥92,94≥95,97≥98 </td>
    </tr>
  </table>
	</td>
</tr>
</table>
</td></tr></table>
</div>
<!--动态生成html,结束-->
</form>
</body>
</html>
