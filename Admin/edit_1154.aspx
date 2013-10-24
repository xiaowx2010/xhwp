<!--危险废物集中处置厂运行情况  环年基4表,编辑页-->

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
    string dtable_1202, types_1202, filter_1202, qiye_id = "";
    string[] flds_1202, vflds_1202;
    private void Page_Load(object sender, System.EventArgs e)
    {

        SetToolBar();//设置工具条,同时获取固定URL参数  
		string h_yearstr = GetQueryString("year", System.DateTime.Now.Year.ToString());
        tb_save.Visible = false; 
        string base_aid = StringUtility.StringToBase64("list");
        //btn_backlist.Url = "javascript:clickGuide('" + base_aid + "','" + mid + "','" + pid + "')";


        dtable = "gmis_mo_1154";
        filter = " Mocode=" + id;

        flds = new string[] { "fld_1154_1", "fld_1154_2", "fld_1154_3", "fld_1154_14", "fld_1154_15", "fld_1154_16", "fld_1154_17", "fld_1154_18", "fld_1154_19", "fld_1154_20", "fld_1154_21", "fld_1154_22", "fld_1154_23", "fld_1154_24", "fld_1154_25", "fld_1154_26", "fld_1154_27", "fld_1154_28", "fld_1154_29", "fld_1154_30", "fld_1154_31", "fld_1154_32", "fld_1154_33", "fld_1154_34", "fld_1154_35"};
        types = "0000000000000000000000000";

        qiye_id = GetQueryString("pid", "0");
        if (qiye_id == "0")
        {
            qiye_id = GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2=('" + GetFieldData("select fld_1154_2 from " + dtable + " where mocode='" + id + "' ") + "')");
            qiye_id = (qiye_id == "") ? "0" : qiye_id;
        }
        dtable_1202 = "gmis_mo_1202";
        vflds_1202 = new string[] { "fld_1154_2", "fld_1154_3", "fld_1154_4", "fld_1154_5", "fld_1154_6", "fld_1154_7", "fld_1154_8", "fld_1154_9", "fld_1154_10", "fld_1154_11", "fld_1154_12", "fld_1154_13", "fld_1202_24" };
        flds_1202 = new string[] { "fld_1202_2", "fld_1202_1", "fld_1202_12", "fld_1202_6", "fld_1202_7", "fld_1202_8", "fld_1202_9", "fld_1202_10", "fld_1202_11", "fld_1202_3", "fld_1202_5", "fld_1202_18", "fld_1202_24" };
        filter_1202 = " mocode=" + qiye_id;
        types_1202 = "0001111110001";
        
        if (!IsPostBack)
        {
            //code.Value = GetQueryString("id", "0");//创建人ID
            //年份
            int years = System.DateTime.Now.Year;
            for (int i = 0; i < 20; i++)
            {
                fld_1154_1.Items.Add(new ListItem((years - i).ToString() + '年', (years - i).ToString()));
            }
			SetFilter(fld_1154_1,h_yearstr);
            //行政区域代码
            BindListControl(fld_1154_12, "fld_1195_1", "name", "select fld_1195_1,fld_1195_1+'|'+fld_1195_2 as name from gmis_mo_1195");

            //废物类型1-5
            BindListControl(fld_1154_15, "fld_1167_1", "name", "select fld_1167_1,fld_1167_1+'|'+fld_1167_2 as name from gmis_mo_1167", "--请选择--");
            SetFilter(fld_1154_15, "0");
            BindListControl(fld_1154_16, "fld_1167_1", "name", "select fld_1167_1,fld_1167_1+'|'+fld_1167_2 as name from gmis_mo_1167", "--请选择--");
            SetFilter(fld_1154_16, "0");
            BindListControl(fld_1154_17, "fld_1167_1", "name", "select fld_1167_1,fld_1167_1+'|'+fld_1167_2 as name from gmis_mo_1167", "--请选择--");
            SetFilter(fld_1154_17, "0");
            BindListControl(fld_1154_18, "fld_1167_1", "name", "select fld_1167_1,fld_1167_1+'|'+fld_1167_2 as name from gmis_mo_1167", "--请选择--");
            SetFilter(fld_1154_18, "0");
            BindListControl(fld_1154_19, "fld_1167_1", "name", "select fld_1167_1,fld_1167_1+'|'+fld_1167_2 as name from gmis_mo_1167", "--请选择--");
            SetFilter(fld_1154_19, "0");

            if (id != "0")
            {
                guangye.BindData(dtable, filter, flds);
                guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
                //绑定所有值
                fld_1154_2.Attributes.Add("readonly", "");
                fld_1154_1.Enabled = false;
                btn_search.Visible = false;
                tb_2_new.Visible = true;
            }
            else if (qiye_id != "0")
            {
                guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
                fld_1154_2.Attributes.Add("readonly", "");
                btn_search.Visible = false;
                tb_2_new.Visible = true;
            }
        }
    }

    private void Click_Save_1154(object sender, System.EventArgs e)
    {
        //验证输入字段类型
        string alerttext = "";
        CheckMustAndFieldType(mid);
        string h_strBindYear = guangye.GetControlValue(fld_1154_1);
        string h_strBindCode = guangye.GetControlValue(fld_1154_2);
        filter = " fld_1154_1='" + h_strBindYear + "' and fld_1154_2 ='" + h_strBindCode + "'";
        if (id == "0")
        {
            db.SqlString = "select mocode from " + GetModuleTableName("1154") + " where " + filter;
            DataTable dt = db.GetDataTable();
            if (dt.Rows.Count > 0)
            {
                SetSESSION("alert", GetSESSION("alert") + fld_1154_1.SelectedItem.Value + "年，该企业法人代码已存在，请重新输入!");
            }
        }
        //alerttext = CheckThat();
        SetSESSION("alert", GetSESSION("alert") + CheckThat());
        if (GetSESSION("alert").Length > 0)
        {
            alertmess_1154.InnerHtml = GetSESSION("alert");
            SetSESSION("alert", "");
        }
        else
        {
            ////添加或修改
            if (id != "0")
            {
                SetSESSION("sql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetUpdateSql(dtable, filter, flds, types) );
            }
            else
            {
                if (qiye_id != "0")
                {
                    SetSESSION("sql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, flds, types) );
                }
                else
                {
                    if (GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1154_2) + "'") != "")
                    {
                        filter_1202 = "mocode=" + GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1154_2) + "'");
                        fld_1202_24.Value = GetFieldData("select fld_1202_24 from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1154_2) + "'");
                        SetSESSION("filter", filter_1202);
                        SetSESSION("sql", "");
                        SetSESSION("extsql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, flds, types));
                        string scriptstr = "<scrip" + "t>__doOpenView('pop_alert.aspx?mid=" + mid + "&id=" + id + "&pid=" + pid + "&tid=" + tid + "',300,200,10,50);</scrip" + "t>";
                        Page.RegisterStartupScript("popwin", scriptstr);

                    }
                    else
                    {
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
    
    private string GetRepeatAlertStr(string _dtable, string _filter, string year)
    {
        if (GetFieldData("select 1 from " + _dtable + " where " + _filter) != "")
        {
            return year + "年，该企业法人代码已存在，请重新输入";
        }
        else
        {
            return "";
        }
    }

    private void Search_Click(object sender, System.EventArgs e)
    {
        if (guangye.GetControlValue(fld_1154_2).Length > 0)
        {
            string scriptstr = "";
            alertmess_1154.InnerText = "";
            scriptstr = "<scrip" + "t>__doOpenView('pop_search_company.aspx?mid=" + mid + "&year="+guangye.GetControlValue(fld_1154_1)+"&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_1154_2)) + "',800,600,10,50);</scrip" + "t>";
            Page.RegisterStartupScript("popwin", scriptstr);
        }
        else
        {
            alertmess_1154.InnerText = "请输入企业法人代码！";
        }

    }
    private string CheckThat()
    { 
        bool flag=true;
        StringBuilder sb = new StringBuilder();
        double sum_left = 0.0, sum_right = 0.0;
        string p_tempvalue = "";

        try
        {
            sum_left = 0; sum_right = 0;
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_20"));
            if (p_tempvalue != "")
            {
                sum_left += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_21"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_22"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
        }
        catch { }
        if (sum_left != sum_right)
        {
            sb.Append("指标间关系不满足1=2+3！");
        }
        try
        {
            sum_left = 0; sum_right = 0;
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_20"));
            if (p_tempvalue != "")
            {
                sum_left += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_23"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_24"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
        }
        catch { }
        if (sum_left < sum_right)
        {
            sb.Append("指标间关系不满足1≥4+5！");
        }
        if (guangye.GetControlValue(FindControl("fld_1154_14")) != "")
        {
            try
            {
                sum_left = 0; sum_right = 0;
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_20"));
                if (p_tempvalue != "")
                {
                    sum_left += Convert.ToDouble(p_tempvalue) * Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1154_14")));
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_25"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
            }
            catch { }
            if (sum_left < sum_right)
            {
                sb.Append("指标间关系不满足1×本年运行天数≥6！");
            }
            try
            {
                sum_left = 0; sum_right = 0;
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_21"));
                if (p_tempvalue != "")
                {
                    sum_left += Convert.ToDouble(p_tempvalue) * Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1154_14")));
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_26"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
            }
            catch { }
            if (sum_left < sum_right)
            {
                sb.Append("指标间关系不满足2×本年运行天数≥7！");
            }
            try
            {
                sum_left = 0; sum_right = 0;
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_22"));
                if (p_tempvalue != "")
                {
                    sum_left += Convert.ToDouble(p_tempvalue) * Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1154_14")));
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_27"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
            }
            catch { }
            if (sum_left < sum_right)
            {
                sb.Append("指标间关系不满足3×本年运行天数≥8！");
            }
        }
        try
        {
            sum_left = 0; sum_right = 0;
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_25"));
            if (p_tempvalue != "")
            {
                sum_left += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_26"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_27"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
        }
        catch { }
        if (sum_left != sum_right)
        {
            sb.Append("指标间关系不满足6=7+8！");
        }
        try
        {
            sum_left = 0; sum_right = 0;
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_25"));
            if (p_tempvalue != "")
            {
                sum_left += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_28"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_29"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_30"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
        }
        catch { }
        if (sum_left != sum_right)
        {
            sb.Append("指标间关系不满足6=9+10+11！");
        }
        try
        {
            sum_left = 0; sum_right = 0;
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_32"));
            if (p_tempvalue != "")
            {
                sum_left += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_33"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1154_34"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
        }
        catch { }
        if (sum_left < sum_right)
        {
            sb.Append("指标间关系不满足13≥14+15！");
        }
        
        return sb.ToString();
    }
    //private void Click_Save_1154(object sender, System.EventArgs e)
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
        //SetSESSION("alert", "123");
            }
            if (astr.Length > 0)
            {
                SetSESSION("sql", "");
                SetSESSION("alert", astr.ToString());
            }
        }
    }
	private void Click_NewAdd_1154(object sender, System.EventArgs e)
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
        window.parent.frames(1).location="nav.aspx?closed=1&pid="+pid;
            window.parent.frames(3).location="getpage.aspx?aid="+aid+"&mid="+mid+"&id=0";
    }
    function checkThis(obj)
    {
        
        switch(obj.id)
        {
            
            case "fld_1154_21":
            if(Number(document.getElementById("fld_1154_21").value)<Number(document.getElementById("fld_1154_23").value))
            {
                obj.value="";
                alert("应满足2≥4");
                obj.focus();
            }
            break;
            case "fld_1154_22":
            if(Number(document.getElementById("fld_1154_22").value)<Number(document.getElementById("fld_1154_24").value))
            {
                obj.value="";
                alert("应满足3≥5");
                obj.focus();
            }
            break;
            case "fld_1154_23":
            if(Number(document.getElementById("fld_1154_21").value)<Number(document.getElementById("fld_1154_23").value))
            {
                obj.value="";
                alert("应满足2≥4");
                obj.focus();
            }
            break;
            case "fld_1154_24":
            if(Number(document.getElementById("fld_1154_22").value)<Number(document.getElementById("fld_1154_24").value))
            {
                obj.value="";
                alert("应满足3≥5");
                obj.focus();
            }
            break;
            
            case "fld_1154_26":
            if(Number(document.getElementById("fld_1154_26").value)<Number(document.getElementById("fld_1154_32").value))
            {
                obj.value="";
                alert("应满足7≥13");
                obj.focus();
            }
            break;
            case "fld_1154_32":
            if(Number(document.getElementById("fld_1154_26").value)<Number(document.getElementById("fld_1154_32").value))
            {
                obj.value="";
                alert("应满足7≥13");
                obj.focus();
            }
            break;
            default:
            break;
        }
    }
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--选项卡-->
    <!--选项卡-->
    <!--操作工具条-->
    <!--#include file="toolbarleft.aspx"-->
    <!--右边固定按钮-->
			<td  width="100%"><span id="alertmess_1154" runat="server" style="color:Red;"></span></td>
			<td id="tb_2_new" visible="false" runat="server" style="padding-left:5px;width:55px; padding-right:5px;" nowrap>
            <G:Button id="btn_newadd_new" type="toolbar" mode="on" icon="tb01" text="重新新增" onclick="Click_NewAdd_1154" runat="server"></G:Button>
            </td>
			<td id="tb_save_1154" align="right" runat="server" nowrap>
                <G:Button id="btn_save_1154" type="toolbar" mode="on" icon="tb05" text="保存" onclick="Click_Save_1154" runat="server"></G:Button>
            </td>
    <!--#include file="toolbar.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbarright.aspx"-->
    <!--操作工具条-->
    <!--动态生成html,开始-->
    
    <input id="fld_1202_24" runat="server" type="hidden" value="1" />
    <input id="code" runat="server" type="hidden" />
    <div id="div_input" runat="server">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
        <tr>
            <td width="70%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="center" class="font_2635B_000">
                            危险废物集中处置厂运行情况（环年基4表）
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table_graybgcolor"
        style="margin-bottom: 5px; margin-top: 5px;">
        <tr>
            <td rowspan="2" width="7%" align="right" class="td_viewcontent_title">
                <span style="color:Red;">*</span>统计年份
            </td>
            <td rowspan="2" width="5%" align="left" class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1154_1" runat="server" Style="width: 98%;" />
            </td>
            <td width="5%" rowspan="2" align="right" class="td_viewcontent_title" nowrap>
                <span style="color: Red">*</span>企业法人代码
            </td>
            <td width="7%" rowspan="2" align="left" class="td_viewcontent_content" nowrap>
                <input id="fld_1154_2" runat="server" name="textfield" type="text" style="width: 75%;"><input id="fld_1154_2_code" runat="server" name="textfield" type="hidden" style="width: 75%;"><asp:LinkButton id="btn_search"
                    runat="server" OnClick="Search_Click"><img id="imgsearch" src="images/find.gif" style="cursor:hand" border=0 title="查询"/></asp:LinkButton>
            </td>
            <td width="4%" rowspan="2" align="right" class="td_viewcontent_title">
                联系电话
            </td>
            <td width="5%" rowspan="2" align="left" class="td_viewcontent_content">
                <input id="fld_1154_4" maxlength="13" runat="server" name="textfield" type="text"
                    style="width: 98%;">
            </td>
            <td width="7%" rowspan="2" align="right" class="td_viewcontent_title">
                企业地理位置
            </td>
            <td width="11%" class="td_viewcontent_content" nowrap>
                中心经度
                <input id="fld_1154_5" runat="server" name="textfield" type="text" style="width: 10%;">°<input
                    id="fld_1154_6" runat="server" name="textfield" type="text" style="width: 10%;">′<input
                        id="fld_1154_7" runat="server" name="textfield" type="text" style="width: 10%;">″
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_content" nowrap>
                中心纬度
                <input id="fld_1154_8" runat="server" name="textfield" type="text" style="width: 10%;">°<input
                    id="fld_1154_9" runat="server" name="textfield" type="text" style="width: 10%;">′<input
                        id="fld_1154_10" runat="server" name="textfield" type="text" style="width: 10%;">″
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title">
                企业详细名称
            </td>
            <td colspan="7" align="left" class="td_viewcontent_content">
                <input id="fld_1154_3" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title">
                企业详细地址
            </td>
            <td colspan="2" align="left" class="td_viewcontent_content">
                <input id="fld_1154_11" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
            <td align="right" class="td_viewcontent_title">
                行政区域代码
            </td>
            <td align="left" colspan="2" class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1154_12" runat="server" Style="width: 98%;">
                </asp:DropDownList>
            </td>
            <td align="right" class="td_viewcontent_title">
                开业时间
            </td>
            <td class="td_viewcontent_content">
                <input id="fld_1154_13" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title">
                本年运行天数
            </td>
            <td colspan="2" align="left" class="td_viewcontent_content">
                <input id="fld_1154_14" onkeyup="value=value.replace(/[^\d.]/g,'')" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
            <td align="right" class="td_viewcontent_title" nowrap>
                废弃物主要类型1
            </td>
            <td align="left" colspan="2" class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1154_15" runat="server" Style="width: 98%;">
                </asp:DropDownList>
            </td>
            <td align="right" class="td_viewcontent_title" nowrap>
                废弃物主要类型2
            </td>
            <td class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1154_16" runat="server" Style="width: 98%;">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title" nowrap>
                废弃物主要类型3
            </td>
            <td colspan="2" align="left" class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1154_17" runat="server" Style="width: 98%;">
                </asp:DropDownList>
            </td>
            <td align="right" class="td_viewcontent_title" nowrap>
                废弃物主要类型4
            </td>
            <td align="left" colspan="2" class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1154_18" runat="server" Style="width: 98%;">
                </asp:DropDownList>
            </td>
            <td align="right" class="td_viewcontent_title" nowrap>
                废弃物主要类型5
            </td>
            <td class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1154_19" runat="server" Style="width: 98%;">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
        <tr>
            <td align="center" class="td_viewcontent_content">
                <table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center">
                            环年基4表
                        </td>
                        <td width="21">
                            <img id="hide" onclick="click_hide('div_hide')" title="收缩" src="images/fanhuiliebiao_007.gif"
                                width="11" height="11">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div id="div_hide" style="display: block">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor">
            <tr>
                <td align="center" class="td_viewcontent_content">
                    代码
                </td>
                <td align="center" class="td_viewcontent_title">
                    指标名称
                </td>
                <td align="center" class="td_viewcontent_content">
                    计量单位
                </td>
                <td align="center" class="td_viewcontent_content">
                    本年实际
                </td>
                <td align="center" class="td_viewcontent_content">
                    代码
                </td>
                <td align="center" class="td_viewcontent_title">
                    指标名称
                </td>
                <td align="center" class="td_viewcontent_content">
                    计量单位
                </td>
                <td align="center" class="td_viewcontent_content">
                    本年实际
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    甲
                </td>
                <td align="center" class="td_viewcontent_title">
                    乙
                </td>
                <td align="center" class="td_viewcontent_content">
                    丙
                </td>
                <td align="center" class="td_viewcontent_content">
                    1
                </td>
                <td align="center" class="td_viewcontent_content">
                    甲
                </td>
                <td align="center" class="td_viewcontent_title">
                    乙
                </td>
                <td align="center" class="td_viewcontent_content">
                    丙
                </td>
                <td align="center" class="td_viewcontent_content">
                    1
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    1
                </td>
                <td align="center" class="td_viewcontent_title">
                    1、废弃物实际处理能力
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨/日
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_20" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    10
                </td>
                <td align="center" class="td_viewcontent_title">
                    处置医疗废物量
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_29" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    2
                </td>
                <td align="center" class="td_viewcontent_title">
                    其中：焚烧处置能力
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨/日
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_21" onfocusout="checkThis(this)" runat="server" name="textfield"
                        type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    11
                </td>
                <td align="center" class="td_viewcontent_title">
                    处置其他危险废物量
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_30" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    3
                </td>
                <td align="center" class="td_viewcontent_title">
                    填埋处置能力
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨/日
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_22" onfocusout="checkThis(this)" runat="server" name="textfield"
                        type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    12
                </td>
                <td align="center" class="td_viewcontent_title">
                    3、危险废物综合利用量
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_31" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    4
                </td>
                <td align="center" class="td_viewcontent_title">
                    其中：当年新增焚烧处置能力
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨/日
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_23" onfocusout="checkThis(this)" runat="server" name="textfield"
                        type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    --
                </td>
                <td align="center" class="td_viewcontent_title">
                    4、焚烧残渣流向
                </td>
                <td align="center" class="td_viewcontent_content">
                    &nbsp;
                </td>
                <td align="center" class="td_viewcontent_content">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    5
                </td>
                <td align="center" class="td_viewcontent_title">
                    当年新增填埋处置能力
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨/日
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_24" onfocusout="checkThis(this)" runat="server" name="textfield"
                        type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    13
                </td>
                <td align="center" class="td_viewcontent_title">
                    （1）焚烧残渣量
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_32" onfocusout="checkThis(this)" runat="server" name="textfield"
                        type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    6
                </td>
                <td align="center" class="td_viewcontent_title">
                    2、危险废物处置量
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_25" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    14
                </td>
                <td align="center" class="td_viewcontent_title">
                    （2）焚烧残渣利用量
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_33" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    7
                </td>
                <td align="center" class="td_viewcontent_title">
                    其中：焚烧量
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_26" onfocusout="checkThis(this)" runat="server" name="textfield"
                        type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    15
                </td>
                <td align="center" class="td_viewcontent_title">
                    （3）焚烧残渣填埋量
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_34" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    8
                </td>
                <td align="center" class="td_viewcontent_title">
                    填埋量
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_27" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    16
                </td>
                <td align="center" class="td_viewcontent_title">
                    5、本年运行费用
                </td>
                <td align="center" class="td_viewcontent_content">
                    万元
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_35" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    9
                </td>
                <td align="center" class="td_viewcontent_title">
                    其中：处置工业危险废物量
                </td>
                <td align="center" class="td_viewcontent_content">
                    吨
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1154_28" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    &nbsp;
                </td>
                <td align="center" class="td_viewcontent_title">
                    &nbsp;
                </td>
                <td align="center" class="td_viewcontent_content">
                    &nbsp;
                </td>
                <td align="center" class="td_viewcontent_content">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="8" class="td_viewcontent_content">
                    “指标间关系：1=2+3,2≥4,3≥5,1≥4+5,1×本年运行天数≥6,2×本年运行天数≥7,3×本年运行天数≥8,6=7+8,6=9+10+11,7≥13,13≥14+15”
                </td>
            </tr>
        </table>
    </div>
</div>
    <!--动态生成html,结束-->
    </form>
</body>
</html>
