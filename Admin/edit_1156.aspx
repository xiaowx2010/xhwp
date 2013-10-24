<!--医院污染排放及利用情况  环年基6表,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string dtable_1202, types_1202, filter_1202, qiye_id = "";
    string[] flds_1202, vflds_1202;
private void Page_Load(object sender, System.EventArgs e)
{

    SetToolBar();//设置工具条,同时获取固定URL参数  
    tb_save.Visible = false; 		
	string h_yearstr = GetQueryString("year", System.DateTime.Now.Year.ToString());

    string base_aid = StringUtility.StringToBase64("list");
    //btn_backlist.Url = "javascript:clickGuide('" + base_aid + "','" + mid + "','" + pid + "')";
    dtable = "gmis_mo_1156";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_1156_1", "fld_1156_2", "fld_1156_3", "fld_1156_4", "fld_1156_14", "fld_1156_15", "fld_1156_16", "fld_1156_17", "fld_1156_18", "fld_1156_19", "fld_1156_20", "fld_1156_21", "fld_1156_22", "fld_1156_23", "fld_1156_24", "fld_1156_25", "fld_1156_26", "fld_1156_27", "fld_1156_28", "fld_1156_29", "fld_1156_30", "fld_1156_31", "fld_1156_32", "fld_1156_33", "fld_1156_34", "fld_1156_35", "fld_1156_36", "fld_1156_37", "fld_1156_38", "fld_1156_39", "fld_1156_40", "fld_1156_41", "fld_1156_42", "fld_1156_43", "fld_1156_44" };
    types = "00000000000000000000000000000000000";

    qiye_id = GetQueryString("pid", "0");
    if (qiye_id == "0")
    {
        qiye_id = GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2=('" + GetFieldData("select fld_1156_2 from " + dtable + " where mocode='" + id + "' ") + "')");
        qiye_id = (qiye_id == "") ? "0" : qiye_id;
    }
    //Response.Write(qiye_id);
    dtable_1202 = "gmis_mo_1202";
    vflds_1202 = new string[] { "fld_1156_2", "fld_1156_3", "fld_1156_5", "fld_1156_6", "fld_1156_7", "fld_1156_8", "fld_1156_9", "fld_1156_10", "fld_1156_11", "fld_1156_12", "fld_1156_13", "fld_1202_24" };
    flds_1202 = new string[] { "fld_1202_2", "fld_1202_1", "fld_1202_6", "fld_1202_7", "fld_1202_8", "fld_1202_9", "fld_1202_10", "fld_1202_11", "fld_1202_3", "fld_1202_5", "fld_1202_18", "fld_1202_24" };
    filter_1202 = " mocode=" + qiye_id;
    types_1202 = "001111110001";
        
    
    if (!IsPostBack)
    {
        //年份
        int year = System.DateTime.Now.Year;
        for (int i = 0; i < 20; i++)
        {
            fld_1156_1.Items.Add(new ListItem((year - i).ToString()+'年', (year - i).ToString()));
        }
		SetFilter(fld_1156_1,h_yearstr);
        //行政区划代码
        BindListControl(fld_1156_12, "fld_1195_1", "name", "select fld_1195_1,fld_1195_1+'|'+fld_1195_2 as name from gmis_mo_1195");
        SetFilter(fld_1156_12, "0");
        //医院等级
        BindListControl(fld_1156_14, "fld_1179_1", "name", "select fld_1179_1,fld_1179_1+'|'+fld_1179_2 as name from gmis_mo_1179", "--请选择--");
        SetFilter(fld_1156_14, "0");
        //污水处理级别
        BindListControl(fld_1156_15, "fld_1171_1", "name", "select fld_1171_1,fld_1171_1+'|'+fld_1171_2 as name from gmis_mo_1171", "--请选择--");
        SetFilter(fld_1156_15, "0");
        //受纳水体代码
        BindListControl(fld_1156_19, "fld_1145_1", "name", "select fld_1145_1,fld_1145_1+'|'+fld_1145_2 as name from gmis_mo_1145", "--请选择--");
        SetFilter(fld_1156_19, "0");
        //医疗废物处置方式
        BindListControl(fld_1156_21, "fld_1172_1", "name", "select fld_1172_1,fld_1172_1+'|'+fld_1172_2 as name from gmis_mo_1172", "--请选择--");
        SetFilter(fld_1156_21, "0");

        if (id != "0")
        {
            guangye.BindData(dtable, filter, flds);
            guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
            //绑定所有值
            fld_1156_2.Attributes.Add("readonly", "");
            fld_1156_1.Enabled = false;
            btn_search.Visible = false;
            tb_2_new.Visible = true;
        }
        else
        {
            if (qiye_id != "0")
            {
                guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
                fld_1156_2.Attributes.Add("readonly", "");
                btn_search.Visible = false;
                tb_2_new.Visible = true;
            }
        }
        
    }

    //同步受纳水体名称
    if (fld_1156_19.SelectedItem.Value != "0")
    {
        fld_1156_20.Value = fld_1156_19.SelectedItem.ToString().Substring(fld_1156_19.SelectedItem.ToString().IndexOf('|')).TrimStart('|');
    }
    else
    {
        fld_1156_20.Value = "";
    } 
 }
 
//public override void BeforeSave()
    private void Click_Save_1156(object sender, System.EventArgs e)
    {
        //验证输入字段类型
        CheckMustAndFieldType(mid);
        string h_strBindYear = guangye.GetControlValue(fld_1156_1);
        string h_strBindCode = guangye.GetControlValue(fld_1156_2);
        filter = " fld_1156_1='" + h_strBindYear + "' and fld_1156_2='" + h_strBindCode.Trim() + "'";
        if (id == "0")
        {
            db.SqlString = "select mocode from " + GetModuleTableName("1156") + " where " + filter;
            DataTable dt = db.GetDataTable();
            if (dt.Rows.Count > 0)
            {
                SetSESSION("alert", GetSESSION("alert") + fld_1156_1.SelectedItem.Value + "年，该企业法人代码已存在，请重新输入!");
            }
        }
        //alerttext = CheckThat();
        SetSESSION("alert", GetSESSION("alert") + CheckThat());
        if (GetSESSION("alert").Length > 0)
        {
            alertmess_1156.InnerHtml = GetSESSION("alert");
            SetSESSION("alert", "");
        }
        else
        {
            ////添加或修改
            if (id != "0")
            {
                SetSESSION("sql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetUpdateSql(dtable, filter, flds, types));
            }
            else
            {
                if (qiye_id != "0")
                {
                    //fld_1156_2.Value = "@qiyeid";
                    SetSESSION("sql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, flds, types));
                }
                else
                {
                    if (GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1156_2) + "'") != "")
                    {
                        filter_1202 = "mocode=" + GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1156_2) + "'");
                        fld_1202_24.Value = GetFieldData("select fld_1202_24 from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1156_2) + "'");
                        SetSESSION("filter", filter_1202);
                        //fld_1156_2.Value = "@qiyeid";
                        SetSESSION("sql", "");
                        //SetSESSION("sql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";declare @qiyeid as int;select @qiyeid=mocode from gmis_mo_1202 where " + filter_1202 + ";" + guangye.GetInsertSql(dtable, flds, types));
                        SetSESSION("extsql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, flds, types));
                        string scriptstr = "<scrip" + "t>__doOpenView('pop_alert.aspx?mid=" + mid + "&id=" + id + "&pid=" + pid + "&tid=" + tid + "',300,200,10,50);</scrip" + "t>";
                        Page.RegisterStartupScript("popwin", scriptstr);


                    }
                    else
                    {
                        //fld_1156_2.Value = "@qiyeid";
                        SetSESSION("sql", guangye.GetInsertSql(dtable_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, flds, types));
                    }
                }
            }
            if (GetSESSION("sql") != "")
            {
                Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id);
            }
        }
    }
    
private void Search_Click(object sender, System.EventArgs e)
{
    if (guangye.GetControlValue(fld_1156_2).Length > 0)
    {
        string scriptstr = "";
        alertmess_1156.InnerText = "";
        scriptstr = "<scrip" + "t>__doOpenView('pop_search_company.aspx?mid=" + mid + "&year="+guangye.GetControlValue(fld_1156_1)+"&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_1156_2)) + "',800,600,10,50);</scrip" + "t>";
        Page.RegisterStartupScript("popwin", scriptstr);
    }
    else 
    {
        alertmess_1156.InnerText ="请输入企业法人代码！";
    }

}
private string CheckThat()
{
    StringBuilder sb = new StringBuilder();
    double sum_left = 0.0, sum_right = 0.0;
    string p_tempvalue = "";

    try
    {
        sum_left = 0; sum_right = 0;
        p_tempvalue = guangye.GetControlValue(FindControl("fld_1156_30"));
        if (p_tempvalue != "")
        {
            sum_left += Convert.ToDouble(p_tempvalue);
        }
        p_tempvalue = guangye.GetControlValue(FindControl("fld_1156_32"));
        if (p_tempvalue != "")
        {
            sum_right += Convert.ToDouble(p_tempvalue);
        }
    }
    catch { }
    if (sum_left < sum_right)
    {
        sb.Append("指标间关系不满足9≥11！");
    }
    try
    {
        sum_left = 0; sum_right = 0;
        p_tempvalue = guangye.GetControlValue(FindControl("fld_1156_32"));
        if (p_tempvalue != "")
        {
            sum_left += Convert.ToDouble(p_tempvalue);
        }
        p_tempvalue = guangye.GetControlValue(FindControl("fld_1156_33"));
        if (p_tempvalue != "")
        {
            sum_right += Convert.ToDouble(p_tempvalue);
        }
    }
    catch { }
    if (sum_left < sum_right)
    {
        sb.Append("指标间关系不满足11≥12！");
    }
    try
    {
        sum_left = 0; sum_right = 0;
        p_tempvalue = guangye.GetControlValue(FindControl("fld_1156_39"));
        if (p_tempvalue != "")
        {
            sum_left += Convert.ToDouble(p_tempvalue);
        }
        p_tempvalue = guangye.GetControlValue(FindControl("fld_1156_40"));
        if (p_tempvalue != "")
        {
            sum_right += Convert.ToDouble(p_tempvalue);
        }
    }
    catch { }
    if (sum_left < sum_right)
    {
        sb.Append("指标间关系不满足18≥19！");
    }
    try
    {
        sum_left = 0; sum_right = 0;
        p_tempvalue = guangye.GetControlValue(FindControl("fld_1156_40"));
        if (p_tempvalue != "")
        {
            sum_left += Convert.ToDouble(p_tempvalue);
        }
        p_tempvalue = guangye.GetControlValue(FindControl("fld_1156_41"));
        if (p_tempvalue != "")
        {
            sum_right += Convert.ToDouble(p_tempvalue);
        }
    }
    catch { }
    if (sum_left < sum_right)
    {
        sb.Append("指标间关系不满足19≥20！");
    }
    return sb.ToString();
}
//private void Click_Save_1156(object sender, System.EventArgs e)
//{
//    BeforeSave();
//}
//验证输入字段类型,来自toolbar
private void CheckMustAndFieldType(string temp_mid)
{
    if (flds != null && mid != "0")
    {
        StringBuilder astr = new StringBuilder();
        DataTable fddt = GetFields(mid);
        DataRow[] fdrs;
        DataRow fdr;
        string h_vreturn = "";
        foreach (string cf in flds)
        {
            fdrs = fddt.Select(" fieldname='" + cf + "'");
            if (fdrs.Length > 0)
            {
                fdr = fdrs[0];
                h_vreturn = guangye.GetControlValue(FindControl(cf));
                if (Convert.ToBoolean(fdr["OnEditMust"]))//必填项
                {
                    if (h_vreturn == "")
                    {
                        astr.Append(fdr["caption"].ToString() + "不能为空！");
                    }
                }
                if (h_vreturn.Length > 0)
                {
                    switch (fdr["fieldtypecode"].ToString())
                    {
                        case "2"://整数
                        case "11"://小整数
                            try
                            {
                                Convert.ToInt32(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "应输入整数！");
                            }
                            break;
                        case "10"://浮点数                
                            try
                            {
                                Convert.ToDouble(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "应输入数字！");
                            }
                            break;
                        case "7"://日期                
                            try
                            {
                                Convert.ToDateTime(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "应输入日期格式！");
                            }
                            break;
                    }
                }
            }
        }
        if (astr.Length > 0)
        {
            SetSESSION("sql", "");
            SetSESSION("alert", astr.ToString());
        }
    }
}
private void Click_NewAdd_1156(object sender, System.EventArgs e)
{   
    Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("add")+"&mid="+mid+"");
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
    function clickGuide(aid,mid,pid)
    {
            window.parent.frames(1).location="nav.aspx?closed=1&mid="+mid+"&pid="+pid;
            window.parent.frames(3).location="getpage.aspx?aid="+aid+"&mid="+mid+"&id=0";
       
    }
    function checkThis(obj)
    {
        
        switch(obj.id)
        {
            
            case "fld_1156_42":
            if(Number(document.getElementById("fld_1156_42").value)<Number(document.getElementById("fld_1156_43").value))
            {
                obj.value="";
                alert("应满足21≥22");
                obj.focus();
            }
            break;
            case "fld_1156_43":
            if(Number(document.getElementById("fld_1156_42").value)<Number(document.getElementById("fld_1156_43").value))
            {
                obj.value="";
                alert("应满足21≥22");
                obj.focus();
            }
            break;
            default:
            break;
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
			<td  width="100%"><span id="alertmess_1156" runat="server" style="color:Red;"></span></td>
			<td id="tb_2_new" visible="false" runat="server" style="padding-left:5px;width:55px; padding-right:5px;" nowrap>
            <G:Button id="btn_newadd_new" type="toolbar" mode="on" icon="tb01" text="重新新增" onclick="Click_NewAdd_1156" runat="server"></G:Button>
            </td>
			<td id="tb_save_1156" align="right" runat="server" nowrap>
                <G:Button id="btn_save_1156" type="toolbar" mode="on" icon="tb05" text="保存" onclick="Click_Save_1156" runat="server"></G:Button>
            </td>
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
    <input id="fld_1202_24" runat="server" type="hidden" value="1" />
<input id="code" runat="server" type="hidden" />
<div id="div_input" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%"  ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" class="font_2635B_000">
          
医院污染排放及处理利用情况（环年基6表）</td>
      </tr>
    </table>
    </td>
  </tr>
</table>


  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td align="right" width="6%"  class="td_viewcontent_title"><span style="color:Red;">*</span>统计年份</td>
      <td align="left" width="10%" class="td_viewcontent_content">
        <asp:DropDownList id="fld_1156_1" AutoPostBack=true runat=server type="text" style="width:98%; "/>
      </td>
      <td align="right" width="6%" class="td_viewcontent_title"><span style="color:Red;">*</span>企业法人代码</td>
      <td align="left" width="10%" class="td_viewcontent_content"><input id="fld_1156_2" runat=server name="textfield" type="text" style="width:75%; "><input id="fld_1156_2_code" runat=server name="textfield" type="hidden" ><asp:LinkButton  id="btn_search" runat=server OnClick="Search_Click"><img id="imgsearch" src="images/find.gif" style="cursor:hand" border=0 title="查询"/></asp:LinkButton></td>
      <td rowspan="2" width="7%" align="right"  class="td_viewcontent_title">企业地理位置</td>
      <td width="11%" class="td_viewcontent_content" nowrap>中心经度
      <input id="fld_1156_5" runat=server name="textfield" type="text" style="width:12%; ">°<input id="fld_1156_6" runat=server name="textfield" type="text" style="width:12%; ">′<input id="fld_1156_7" runat=server name="textfield" type="text" style="width:12%; ">″</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">企业详细名称</td>
      <td align="left"  class="td_viewcontent_content">
        <input id="fld_1156_3" runat=server style="width:98%" type="text" name="textfield">
</td>
      <td align="right"  class="td_viewcontent_title">曾用名</td>
      <td align="left"  class="td_viewcontent_content"><input id="fld_1156_4" runat=server name="textfield" type="text" style="width:98%; "></td>
      <td align="left" nowrap  class="td_viewcontent_content">中心纬度
        <input id="fld_1156_8" runat=server name="textfield" type="text" style="width:12%; ">°<input id="fld_1156_9" runat=server name="textfield" type="text" style="width:12%; ">′<input id="fld_1156_10" runat=server name="textfield" type="text" style="width:12%; ">″</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">企业详细地址</td>
      <td align="left"  class="td_viewcontent_content"><input id="fld_1156_11" runat=server name="textfield" type="text" style="width:98%; "></td>
      <td align="right"  class="td_viewcontent_title">行政区域代码</td>
      <td colspan="3" align="left"  class="td_viewcontent_content"><asp:DropDownList ID="fld_1156_12" runat=server style="width:98%; "></asp:DropDownList></td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">开业时间</td>
      <td align="left"  class="td_viewcontent_content"><input id="fld_1156_13" runat=server name="textfield" type="text" style="width:98%; "></td>
      <td align="right"  class="td_viewcontent_title">医院等级</td>
      <td align="left"  class="td_viewcontent_content"><asp:DropDownList ID="fld_1156_14" runat=server style="width:98%; "></asp:DropDownList></td>
      <td align="right"  class="td_viewcontent_title">污水处理级别</td>
      <td class="td_viewcontent_content"><asp:DropDownList ID="fld_1156_15" runat=server style="width:98%; "></asp:DropDownList></td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title" nowrap>污水处理方法1</td>
      <td align="left"  class="td_viewcontent_content"><input id="fld_1156_16" runat=server name="textfield" type="text" style="width:98%; "></td>
      <td align="right"  class="td_viewcontent_title" nowrap>污水处理方法2</td>
      <td align="left"  class="td_viewcontent_content"><input id="fld_1156_17" runat=server name="textfield" type="text" style="width:98%; "></td>
      <td align="right"  class="td_viewcontent_title" nowrap >污水处理方法3</td>
      <td class="td_viewcontent_content"><input id="fld_1156_18" runat=server name="textfield" type="text" style="width:98%; "></td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">受纳水体名称</td>
      <td align="left"  class="td_viewcontent_content"><input id="fld_1156_20" runat=server name="textfield" type="text" style="width:98%; "></td>
      <td align="right"  class="td_viewcontent_title">受纳水体代码</td>
      <td align="left"  class="td_viewcontent_content"><asp:DropDownList ID="fld_1156_19" AutoPostBack="true" runat=server style="width:98%; "></asp:DropDownList></td>
      <td align="right"  class="td_viewcontent_title" nowrap>医疗废物处置方式</td>
      <td class="td_viewcontent_content"><asp:DropDownList ID="fld_1156_21" runat=server style="width:98%; "></asp:DropDownList></td>
    </tr>
</table>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td_viewcontent_content"><table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">环年基6表</td>
            <td width="21"><img id="hide" title="收缩" onclick="click_hide('div_hide')" src="images/fanhuiliebiao_007.gif" width="11" height="11"></td>
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
      <td align="center"  class="td_viewcontent_content">1</td>
      <td align="center"  class="td_viewcontent_title">1、总床数</td>
      <td align="center"  class="td_viewcontent_content">张</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_22" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">9</td>
      <td align="center"  class="td_viewcontent_title">9、用水量</td>
      <td align="center"  class="td_viewcontent_content">毫克/升</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_30" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">17</td>
      <td align="center"  class="td_viewcontent_title">16、类大肠菌群检出浓度年均值</td>
      <td align="center"  class="td_viewcontent_content">个/L</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_38" runat=server name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">2</td>
      <td align="center"  class="td_viewcontent_title">2、病床使用率</td>
      <td align="center"  class="td_viewcontent_content">%</td>
      <td align="center"  class="td_viewcontent_content">
        <input id="fld_1156_23" runat=server name="textfield" type="text" style="width:70px; ">
      </td>
      <td align="center"  class="td_viewcontent_content">10</td>
      <td align="center"  class="td_viewcontent_title">10、废水处理量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_31" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">18</td>
      <td align="center"  class="td_viewcontent_title">17、医疗废物产生量</td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_39" runat=server name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">3</td>
      <td align="center"  class="td_viewcontent_title">3、门诊量</td>
      <td align="center"  class="td_viewcontent_content">个</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_24" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">11</td>
      <td align="center"  class="td_viewcontent_title">11、废水排放量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_32" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">19</td>
      <td align="center"  class="td_viewcontent_title">18、医疗废物处置量</td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_40" runat=server name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">4</td>
      <td align="center"  class="td_viewcontent_title">4、废水处理设施数</td>
      <td align="center"  class="td_viewcontent_content">套</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_25" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">12</td>
      <td align="center"  class="td_viewcontent_title">其中：达标排放量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_33" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">20</td>
      <td align="center"  class="td_viewcontent_title">19、运往危险废物集中处置厂的量</td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_41" runat=server name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">5</td>
      <td align="center"  class="td_viewcontent_title">5、废水处理设施能力</td>
      <td align="center"  class="td_viewcontent_content">吨/日</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_26" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">13</td>
      <td align="center"  class="td_viewcontent_title">12、处理废水产生污泥量</td>
      <td align="center"  class="td_viewcontent_content">吨</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_34" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">21</td>
      <td align="center"  class="td_viewcontent_title">20、放射源数</td>
      <td align="center"  class="td_viewcontent_content">枚</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_42" onfocusout="checkThis(this)" runat=server name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">6</td>
      <td align="center"  class="td_viewcontent_title">6、废水处理设施运行费用</td>
      <td align="center"  class="td_viewcontent_content">万元</td>
      <td align="center" class="td_viewcontent_content"><input id="fld_1156_27" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">14</td>
      <td align="center"  class="td_viewcontent_title">13、化学需氧量排放量</td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_35" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">22</td>
      <td align="center"  class="td_viewcontent_title">其中：集中管理的</td>
      <td align="center"  class="td_viewcontent_content">枚</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_43" onfocusout="checkThis(this)" runat=server name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">7</td>
      <td align="center"  class="td_viewcontent_title">7、医疗废物处理设施数</td>
      <td align="center"  class="td_viewcontent_content">套</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_28" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">15</td>
      <td align="center"  class="td_viewcontent_title">14、氨氮排放量</td>
      <td align="center"  class="td_viewcontent_content">千克</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_36" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">23</td>
      <td align="center"  class="td_viewcontent_title">21、退役放射源数</td>
      <td align="center"  class="td_viewcontent_content">枚</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_44" runat=server name="textfield" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td_viewcontent_content">8</td>
      <td align="center"  class="td_viewcontent_title">8
      、医疗废物处理设施运行费用</td>
      <td align="center"  class="td_viewcontent_content">万元</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_29" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">16</td>
      <td align="center"  class="td_viewcontent_title">　15、余氯检出浓度年均值</td>
      <td align="center"  class="td_viewcontent_content">mg/L</td>
      <td align="center"  class="td_viewcontent_content"><input id="fld_1156_37" runat=server name="textfield" type="text" style="width:70px; "></td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td_viewcontent_title">&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
    <td colspan="12" align="left"  class="td_viewcontent_content">注：污水处里级别，1、一级处理（或一级强化）＋消毒工艺；2、二级处理＋消毒工艺；3、其他工艺 指标间关系：9≥11, 11≥12, 18≥19, 19≥20, 21≥22 </td>
    </tr>
</table>
</div>
</div>
<!--动态生成html,结束-->
</form>
</body>
</html>
