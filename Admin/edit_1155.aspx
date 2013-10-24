<!--������ˮ�����������  �����5��,�༭ҳ-->

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

        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
		string h_yearstr = GetQueryString("year", System.DateTime.Now.Year.ToString());

		tb_save.Visible = false;  
        string base_aid = StringUtility.StringToBase64("list");
        //btn_backlist.Url = "javascript:clickGuide('" + base_aid + "','" + mid + "','" + pid + "')";
        dtable = "gmis_mo_1155";
        filter = " Mocode=" + id;
        flds = new string[] { "fld_1155_1", "fld_1155_2", "fld_1155_3", "fld_1155_13", "fld_1155_14", "fld_1155_15", "fld_1155_16", "fld_1155_17", "fld_1155_19", "fld_1155_20", "fld_1155_21", "fld_1155_22", "fld_1155_23", "fld_1155_24", "fld_1155_25", "fld_1155_26", "fld_1155_27", "fld_1155_28", "fld_1155_29", "fld_1155_30", "fld_1155_31", "fld_1155_32", "fld_1155_33", "fld_1155_34", "fld_1155_35", "fld_1155_36", "fld_1155_37", "fld_1155_38", "fld_1155_39", "fld_1155_40" };
        types = "000000000000000000000000000000";

        qiye_id = GetQueryString("pid", "0");
        if (qiye_id == "0")
        {
            qiye_id = GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2=('" + GetFieldData("select fld_1155_2 from " + dtable + " where mocode='" + id + "' ") + "')");
            qiye_id = (qiye_id == "") ? "0" : qiye_id;
        }
        dtable_1202 = "gmis_mo_1202";
        vflds_1202 = new string[] { "fld_1155_2", "fld_1155_3", "fld_1155_4", "fld_1155_5", "fld_1155_6", "fld_1155_7", "fld_1155_8", "fld_1155_9", "fld_1155_10", "fld_1155_11", "fld_1155_12", "fld_1155_18", "fld_1202_24" };
        flds_1202 = new string[] { "fld_1202_2", "fld_1202_1", "fld_1202_12", "fld_1202_6", "fld_1202_7", "fld_1202_8", "fld_1202_9", "fld_1202_10", "fld_1202_11", "fld_1202_3", "fld_1202_5", "fld_1202_18", "fld_1202_24" };
        filter_1202 = " mocode=" + qiye_id;
        types_1202 = "0001111110001";
        
        if (!IsPostBack)
        {
            
            //���
            int year = System.DateTime.Now.Year;
            for (int i = 0; i < 20; i++)
            {
                fld_1155_1.Items.Add(new ListItem((year - i).ToString() + '��', (year - i).ToString()));
            }
			SetFilter(fld_1155_1,h_yearstr);
            //������������
            BindListControl(fld_1155_12, "fld_1195_1", "name", "select fld_1195_1,fld_1195_1+'|'+fld_1195_2 as name from gmis_mo_1195");
            SetFilter(fld_1155_12, "0");
            //��ˮ������
            BindListControl(fld_1155_13, "fld_1171_1", "name", "select fld_1171_1,fld_1171_1+'|'+fld_1171_2 as name from gmis_mo_1171","--��ѡ��--");
            SetFilter(fld_1155_13,"0");
            //��ˮ������ʩ����
            BindListControl(fld_1155_17, "fld_1166_1", "name", "select fld_1166_1,fld_1166_1+'|'+fld_1166_2 as name from gmis_mo_1166", "--��ѡ��--");
            SetFilter(fld_1155_17,"0");
            //��ˮȥ������
            BindListControl(fld_1155_20, "fld_1165_1", "name", "select fld_1165_1,fld_1165_1+'='+fld_1165_2 as name from gmis_mo_1165", "--��ѡ��--");
            SetFilter(fld_1155_20, "0");
            //����ˮ�����
            BindListControl(fld_1155_21, "fld_1145_1", "name", "select fld_1145_1,fld_1145_1+'|'+fld_1145_2 as name from gmis_mo_1145", "--��ѡ��--");
            SetFilter(fld_1155_21, "0");
            if (id != "0")
            {
                guangye.BindData(dtable, filter, flds);
                guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
                //������ֵ
                fld_1155_2.Attributes.Add("readonly", "");
                fld_1155_1.Enabled = false;
                btn_search.Visible = false;
                tb_2_new.Visible = true;
            }
            else if (qiye_id != "0")
            {
                guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
                fld_1155_2.Attributes.Add("readonly", "");
                btn_search.Visible = false;
                tb_2_new.Visible = true;
            }
        }
        //ͬ������ˮ������
        if (fld_1155_21.SelectedItem.Value != "0")
        {
            fld_1155_22.Value = fld_1155_21.SelectedItem.ToString().Substring(fld_1155_21.SelectedItem.ToString().IndexOf('|')).TrimStart('|');
        }
        else
        {
            fld_1155_22.Value = "";
        }
        //list_water.SqlStr = "select 'td_'+cast(mocode as varchar(20)),fld_1165_1+'|'+fld_1165_2 from gmis_mo_1165";
        //list_water.Rows = list_water.DataTable.Rows.Count;
        //list_watercode.SqlStr = "select 'tb_'+cast(mocode as varchar(20)),fld_1145_1+'|'+fld_1145_2 from gmis_mo_1145";
        //list_watercode.Rows = list_watercode.DataTable.Rows.Count;
    }
    //public override void BeforeSave()
    private void Click_Save_1155(object sender, System.EventArgs e)
    {
        //��֤�����ֶ�����
        string alerttext = "";
        CheckMustAndFieldType(mid);
        string h_strBindYear = guangye.GetControlValue(fld_1155_1);
        string h_strBindCode = guangye.GetControlValue(fld_1155_2);
        filter = " fld_1155_1='" + h_strBindYear + "' and fld_1155_2='" + h_strBindCode.Trim() + "'";
        if (id == "0")
        {
            db.SqlString = "select mocode from " + GetModuleTableName("1155") + " where " + filter;
            DataTable dt = db.GetDataTable();
            if (dt.Rows.Count > 0)
            {
                SetSESSION("alert", GetSESSION("alert") + fld_1155_1.SelectedItem.Value + "�꣬����ҵ���˴����Ѵ��ڣ�����������!");
            }
        }
        //alerttext = CheckThat();
        SetSESSION("alert", GetSESSION("alert") + CheckThat());
        if (GetSESSION("alert").Length > 0)
        {
            alertmess_1155.InnerHtml = GetSESSION("alert");
            SetSESSION("alert", "");
        }
        else
        {
            ////��ӻ��޸�
            if (id != "0")
            {
                SetSESSION("sql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetUpdateSql(dtable, filter, flds, types));
            }
            else
            {
                if (qiye_id != "0")
                {
                    SetSESSION("sql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, flds, types));
                }
                else
                {
                    if (GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1155_2) + "'") != "")
                    {
                        filter_1202 = "mocode=" + GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1155_2) + "'");
                        fld_1202_24.Value = GetFieldData("select fld_1202_24 from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1155_2) + "'"); 
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
    
    private void Click_Fugai(object sender, System.EventArgs e)
    {
        filter_1202 = GetSESSION("filter");
        fld_1202_24.Value = "0";
        SetSESSION("sql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, flds, types));
        Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id);
    }

    private void Click_Fanhui(object sender, System.EventArgs e)
    {
        Response.Redirect("getpage.aspx?aid=" + StringUtility.StringToBase64("add") + "&mid=" + mid + "");
    }
    
    private string GetRepeatAlertStr(string _dtable, string _filter, string year)
    {
        if (GetFieldData("select 1 from " + _dtable + " where " + _filter) != "")
        {
            return year + "�꣬����ҵ���˴����Ѵ��ڣ�����������";
        }
        else
        {
            return "";
        }
    }
    private void Search_Click(object sender, System.EventArgs e)
    {
        
        if (guangye.GetControlValue(fld_1155_2).Length == 0)
        {
            alertmess_1155.InnerText ="��������ҵ���˴��룡";
        }
        else
        {
            string scriptstr = "";
            alertmess_1155.InnerText = "";
            scriptstr = "<scrip" + "t>__doOpenView('pop_search_company.aspx?mid=" + mid + "&year="+guangye.GetControlValue(fld_1155_1)+"&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_1155_2)) + "',800,600,10,50);</scrip" + "t>";
            Page.RegisterStartupScript("popwin", scriptstr);
        }
        
    }
    private string CheckThat()
    {
        bool flag = true;
        StringBuilder sb = new StringBuilder();
        double sum_left = 0.0, sum_right = 0.0;
        string p_tempvalue = "";

        try
        {
            sum_left = 0; sum_right = 0;
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1155_33"));
            if (p_tempvalue != "")
            {
                sum_left += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1155_34"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1155_35"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1155_36"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
        }
        catch { }
        if (sum_left != sum_right)
        {
            sb.Append("ָ����ϵ������11=12+13+14��");
        }
        try
        {
            sum_left = 0; sum_right = 0;
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1155_37"));
            if (p_tempvalue != "")
            {
                sum_left += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1155_38"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
            p_tempvalue = guangye.GetControlValue(FindControl("fld_1155_39"));
            if (p_tempvalue != "")
            {
                sum_right += Convert.ToDouble(p_tempvalue);
            }
        }
        catch { }
        if (sum_left < sum_right)
        {
            sb.Append("ָ����ϵ������15��16+17��");
        }
        return sb.ToString();
    }
    //private void Click_Save_1155(object sender, System.EventArgs e)
    //{
    //    BeforeSave();
    //}
    //��֤�����ֶ�����,����toolbar
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
                    if (Convert.ToBoolean(fdr["OnEditMust"]))//������
                    {
                        if (h_vreturn == "")
                        {
                            astr.Append(fdr["caption"].ToString() + "����Ϊ�գ�");
                        }
                    }
                    if (h_vreturn.Length > 0)
                    {
                        switch (fdr["fieldtypecode"].ToString())
                        {
                            case "2"://����
                            case "11"://С����
                                try
                                {
                                    Convert.ToInt32(h_vreturn);
                                }
                                catch
                                {
                                    astr.Append(fdr["caption"].ToString() + "Ӧ����������");
                                }
                                break;
                            case "10"://������                
                                try
                                {
                                    Convert.ToDouble(h_vreturn);
                                }
                                catch
                                {
                                    astr.Append(fdr["caption"].ToString() + "Ӧ�������֣�");
                                }
                                break;
                            case "7"://����                
                                try
                                {
                                    Convert.ToDateTime(h_vreturn);
                                }
                                catch
                                {
                                    astr.Append(fdr["caption"].ToString() + "Ӧ�������ڸ�ʽ��");
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
	private void Click_NewAdd_1155(object sender, System.EventArgs e)
	{   
		Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("add")+"&mid="+mid+"");
	}

</script>

<script>
    function clickGuide(aid,mid,pid)
    {
        window.parent.frames(1).location="nav.aspx?closed=1&pid="+pid;
        window.parent.frames(3).location="getpage.aspx?aid="+aid+"&mid="+mid+"&id=0";
    }
    
    function click_hide(obj)
    {
        var a=document.getElementById(obj).style.display;
        if(a=="block")
        {
            document.getElementById(obj).style.display="none";
            document.getElementById('hide').title="չ��";
        }
        else
        {
            document.getElementById(obj).style.display="block";
            document.getElementById('hide').title="����";
        }
    }
    
    function WriteWater(obj,args,a)
    {
        
        var ids=obj.id;
        document.getElementById(args).value=document.getElementById(ids).innerText;
        document.getElementById(a).style.display="none";
        
        if(args=="fld_1155_21")
        {
            var str=document.getElementById(ids).innerText;
            var s=str.indexOf('|')+1;
            var ss=str.substring(s,str.length);
            document.getElementById('fld_1155_22').innerText=ss;
        }
    }
    
    function ShowWaterGo(e,args)
    {
        var ids=e.id;
        var t=e.offsetTop;
        var l=e.offsetLeft;
        
        while(e=e.offsetParent)
        {
            t+=e.offsetTop+8;
            l+=e.offsetLeft;
            
        }
        document.getElementById(args).style.display="block";
        document.getElementById(args).style.top=t;
        
        if(ids=="fld_1155_21")
        {
            document.getElementById(args).style.left=l;
        }
        else
        {
            document.getElementById(args).style.left=l;
        }
    }
    function  checkThis(obj)
    {
        switch(obj.id)
        {
            case "fld_1155_23":
            if(Number(document.getElementById("fld_1155_23").value)<Number(document.getElementById("fld_1155_24").value))
            {
                obj.value="";
                alert("Ӧ����1��2");
                obj.focus();
            }
            break;
            case "fld_1155_24":
            if(Number(document.getElementById("fld_1155_23").value)<Number(document.getElementById("fld_1155_24").value))
            {
                obj.value="";
                alert("Ӧ����1��2");
                obj.focus();
            }
            break;
            case "fld_1155_25":
            if(Number(document.getElementById("fld_1155_25").value)<Number(document.getElementById("fld_1155_26").value))
            {
                obj.value="";
                alert("Ӧ����3��4");
                obj.focus();
            }
            break;
            case "fld_1155_26":
            if(Number(document.getElementById("fld_1155_25").value)<Number(document.getElementById("fld_1155_26").value))
            {
                obj.value="";
                alert("Ӧ����3��4");
                obj.focus();
            }
            break;
            case "fld_1155_27":
            if(Number(document.getElementById("fld_1155_27").value)<Number(document.getElementById("fld_1155_28").value))
            {
                obj.value="";
                alert("Ӧ����5��6");
                obj.focus();
            }
            break;
            case "fld_1155_28":
            if(Number(document.getElementById("fld_1155_27").value)<Number(document.getElementById("fld_1155_28").value))
            {
                obj.value="";
                alert("Ӧ����5��6");
                obj.focus();
            }
            break;
            case "fld_1155_29":
            if(Number(document.getElementById("fld_1155_29").value)<Number(document.getElementById("fld_1155_30").value))
            {
                obj.value="";
                alert("Ӧ����7��8");
                obj.focus();
            }
            break;
            case "fld_1155_30":
            if(Number(document.getElementById("fld_1155_29").value)<Number(document.getElementById("fld_1155_30").value))
            {
                obj.value="";
                alert("Ӧ����7��8");
                obj.focus();
            }
            break;
            case "fld_1155_31":
            if(Number(document.getElementById("fld_1155_31").value)<Number(document.getElementById("fld_1155_32").value))
            {
                obj.value="";
                alert("Ӧ����9��10");
                obj.focus();
            }
            break;
            case "fld_1155_32":
            if(Number(document.getElementById("fld_1155_31").value)<Number(document.getElementById("fld_1155_32").value))
            {
                obj.value="";
                alert("Ӧ����9��10");
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
    <!--ѡ�-->
    <!--ѡ�-->
    <!--����������-->
    <!--#include file="toolbarleft.aspx"-->
    <!--�ұ߹̶���ť-->
			<td  width="100%"><span id="alertmess_1155" runat="server" style="color:Red;"></span></td>
			<td id="tb_2_new" visible="false" runat="server" style="padding-left:5px;width:55px; padding-right:5px;" nowrap>
            <G:Button id="btn_newadd_new" type="toolbar" mode="on" icon="tb01" text="��������" onclick="Click_NewAdd_1155" runat="server"></G:Button>
            </td>
			<td id="tb_save_1155" align="right" runat="server" nowrap>
                <G:Button id="btn_save_1155" type="toolbar" mode="on" icon="tb05" text="����" onclick="Click_Save_1155" runat="server"></G:Button>
            </td>
    <!--#include file="toolbar.aspx"-->
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbarright.aspx"-->
    <!--����������-->
    <!--��̬����html,��ʼ-->
    <input id="fld_1202_24" runat="server" type="hidden" value="1" />
   <div id="div_input" runat="server"> 
    <div id="lay1" style="z-index:1; display:none; position:absolute; width:230px; background-color:White">
        <G:ListBox id="list_water" runat=server>
            <G:template id="temp_water" runat=server>
                <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
                    <tr>
                        <td id="*" onclick="WriteWater(this,'fld_1155_20','lay1')" style="cursor:hand">*</td>
                    </tr>
                </table>
            </G:template>
        </G:ListBox>
    </div>
    <div id="lay2" style="z-index:1; display:none; position:absolute; width:175px; background-color:White">
        <G:ListBox id="list_watercode" runat=server>
            <G:template id="temp_watercode" runat=server>
                <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" >
                    <tr>
                        <td id="*" onclick="WriteWater(this,'fld_1155_21','lay2')" style="cursor:hand">*</td>
                    </tr>
                </table>
            </G:template>
        </G:ListBox>
    </div>
    

    <input id="code" runat="server" type="hidden" />
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
        <tr>
            <td width="70%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="center" class="font_2635B_000">
                            ������ˮ������������������5��
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--����������-->
    
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table_graybgcolor"
        style="margin-bottom: 5px; margin-top: 5px;">
        <tr>
            <td rowspan="2" width="8%" align="right" class="td_viewcontent_title">
                <span style="color:Red;">*</span>ͳ�����
            </td>
            <td rowspan="2" width="9%" align="left" class="td_viewcontent_content" >
                <asp:DropDownList ID="fld_1155_1" AutoPostBack="true" runat="server" type="text"
                    Style="width: 98%" />
            </td>
            <td width="6%" rowspan="2" align="right" class="td_viewcontent_title" nowrap>
                <span style="color:Red;">*</span>��ҵ���˴���
            </td>
            <td rowspan="2" width="10%" align="left" class="td_viewcontent_content" >
                <input id="fld_1155_2" runat="server" name="textfield" type="text" style="width: 72%;"><input id="fld_1155_2_code" runat="server" name="textfield" type="hidden"><asp:LinkButton
                     id="btn_search" runat="server" OnClick="Search_Click"><img id="imgsearch" src="images/find.gif"  style="cursor:hand" border=0 title="��ѯ"/></asp:LinkButton>
            </td>
            <td rowspan="2" width="7%" align="right" class="td_viewcontent_title">
                ��ϵ�绰
            </td>
            <td rowspan="2" width="9%" align="left" class="td_viewcontent_content">
                <input id="fld_1155_4" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
            <td rowspan="2" width="7%" align="right" class="td_viewcontent_title" nowrap>
                ��ҵ����λ��
            </td>
            <td width="12%" class="td_viewcontent_content" nowrap>���ľ���<input id="fld_1155_5" runat="server" name="textfield" type="text" style="width: 12%;">��<input
                    id="fld_1155_6" runat="server" name="textfield" type="text" style="width: 12%;">��<input
                        id="fld_1155_7" runat="server" name="textfield" type="text" style="width: 12%;">��
            </td>
        </tr>
        <tr>
            <td  class="td_viewcontent_content" nowrap>����γ��<input id="fld_1155_8" runat="server" name="textfield" type="text" style="width: 12%;">��<input
                    id="fld_1155_9" runat="server" name="textfield" type="text" style="width: 12%;">��<input
                        id="fld_1155_10" runat="server" name="textfield" type="text" style="width: 12%;">��
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title">
                ��ҵ��ϸ����
            </td>
            <td colspan="7" align="left" class="td_viewcontent_content">
                <input id="fld_1155_3" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title">
                ��ҵ��ϸ��ַ
            </td>
            <td colspan="3" align="left" class="td_viewcontent_content">
                <input id="fld_1155_11" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
            <td align="right" class="td_viewcontent_title" nowrap>
                �����������
            </td>
            <td colspan="3" align="left" class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1155_12" runat="server" style="width:98%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title" nowrap>
                ��ˮ������
            </td>
            <td align="left" class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1155_13" runat="server" style="width:98%">
                </asp:DropDownList>
            </td>
            <td align="right" class="td_viewcontent_title" nowrap>
                ��ˮ������1
            </td>
            <td align="left" colspan="2" class="td_viewcontent_content">
                <input id="fld_1155_14" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
            <td align="right" class="td_viewcontent_title" >
                ��ˮ������2
            </td>
            <td colspan="2" class="td_viewcontent_content">
                <input id="fld_1155_15" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title" nowrap>
                ��ˮ������3
            </td>
            <td colspan="2" align="left" class="td_viewcontent_content">
                <input id="fld_1155_16" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
            <td align="right" class="td_viewcontent_title" >
                ��ˮ������ʩ����
            </td>
            <td align="left" colspan="2" class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1155_17" runat="server" style="width:98%">
                </asp:DropDownList>
            </td>
            <td align="right" class="td_viewcontent_title">
                ��ҵʱ��
            </td>
            <td class="td_viewcontent_content">
                <input id="fld_1155_18" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title">
                ������������
            </td>
            <td align="left" class="td_viewcontent_content">
                <input id="fld_1155_19" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
            <td align="right" class="td_viewcontent_title">
                ��ˮȥ������
            </td>
            <td align="left" class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1155_20" runat="server" style="width:98%">
                </asp:DropDownList>
                <%--<input type="text" id="fld_1155_20" runat="server" style="width:98%" value="--��ѡ��--"   onfocus="ShowWaterGo(this,'lay1')">--%>
            </td>
            
            <td align="right" class="td_viewcontent_title">
                ����ˮ������
            </td>
            <td align="left" class="td_viewcontent_content">
                <input id="fld_1155_22" runat="server" name="textfield" type="text" style="width: 98%;">
            </td>
            <td align="right" class="td_viewcontent_title" >
                ����ˮ�����
            </td>
            <td class="td_viewcontent_content">
                <asp:DropDownList ID="fld_1155_21" runat="server" AutoPostBack="true" style="width:98%">
                </asp:DropDownList>
                <%--<input type=text ID="fld_1155_21" runat="server" style="width:98%" value="--��ѡ��--"  onfocus="ShowWaterGo(this,'lay2')"/>--%>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01">
        <tr>
            <td align="center" class="td_viewcontent_content">
                <table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center">
                            �����5��
                        </td>
                        <td width="21">
                            <img id="hide" onclick="click_hide('div_hide')" title="����" src="images/fanhuiliebiao_007.gif"
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
                    ����
                </td>
                <td align="center" class="td_viewcontent_title">
                    ָ������
                </td>
                <td align="center" class="td_viewcontent_content">
                    ������λ
                </td>
                <td align="center" class="td_viewcontent_content">
                    ����ʵ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    ����
                </td>
                <td align="center" class="td_viewcontent_title">
                    ָ������
                </td>
                <td align="center" class="td_viewcontent_content">
                    ������λ
                </td>
                <td align="center" class="td_viewcontent_content">
                    ����ʵ��
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    ��
                </td>
                <td align="center" class="td_viewcontent_title">
                    ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    1
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��
                </td>
                <td align="center" class="td_viewcontent_title">
                    ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��
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
                    1����ˮ��ƴ�������
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��/��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_23" runat="server" onfocusout="checkThis(this)" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    10
                </td>
                <td align="center" class="td_viewcontent_title">
                    9���������ˮ������ƽ��Ũ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    ����/��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_32" runat="server" onfocusout="checkThis(this)" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    2
                </td>
                <td align="center" class="td_viewcontent_title">
                    2����ˮʵ�ʴ�������
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��/��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_24" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    11
                </td>
                <td align="center" class="td_viewcontent_title">
                    10�����������
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_33" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    3
                </td>
                <td align="center" class="td_viewcontent_title">
                    3����ˮ�괦����
                </td>
                <td align="center" class="td_viewcontent_content">
                    ���
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_25" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    12
                </td>
                <td align="center" class="td_viewcontent_title">
                    11�����ദ����
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_34" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    4
                </td>
                <td align="center" class="td_viewcontent_title">
                    ���У���ˮ����������
                </td>
                <td align="center" class="td_viewcontent_content">
                    ���
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_26" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    13
                </td>
                <td align="center" class="td_viewcontent_title">
                    12������������
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_35" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    5
                </td>
                <td align="center" class="td_viewcontent_title">
                    4������ǰ��ˮ�л�ѧ������ƽ��Ũ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    ����/��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_27" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    14
                </td>
                <td align="center" class="td_viewcontent_title">
                    13�������ŷ���
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_36" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    6
                </td>
                <td align="center" class="td_viewcontent_title">
                    5���������ˮ�л�ѧ������ƽ��Ũ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    ����/��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_28" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    15
                </td>
                <td align="center" class="td_viewcontent_title">
                    14���������з���
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��Ԫ
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_37" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    7
                </td>
                <td align="center" class="td_viewcontent_title">
                    6������ǰ��ˮ�а���ƽ��Ũ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    ����/��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_29" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    16
                </td>
                <td align="center" class="td_viewcontent_title">
                    ���У���������
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��Ԫ
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_38" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    8
                </td>
                <td align="center" class="td_viewcontent_title">
                    7���������ˮ�а���ƽ��Ũ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    ����/��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_30" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    17
                </td>
                <td align="center" class="td_viewcontent_title">
                    �շ�
                </td>
                <td align="center" class="td_viewcontent_content">
                    ��Ԫ
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_39" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr>
                <td align="center" class="td_viewcontent_content">
                    9
                </td>
                <td align="center" class="td_viewcontent_title">
                    8������ǰ��ˮ������ƽ��Ũ��
                </td>
                <td align="center" class="td_viewcontent_content">
                    ����/��
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_31" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
                <td align="center" class="td_viewcontent_content">
                    18
                </td>
                <td align="center" class="td_viewcontent_title">
                    15���ĵ���
                </td>
                <td align="center" class="td_viewcontent_content">
                    ���
                </td>
                <td align="center" class="td_viewcontent_content">
                    <input id="fld_1155_40" onfocusout="checkThis(this)" runat="server" name="textfield" type="text" style="width: 70px;">
                </td>
            </tr>
            <tr >
            <td colspan=8 class="td_viewcontent_content">��ָ����ϵ��1��2, 3��4,��5��6, 7��8, 9��10, 11=12+13+14, 15��16+17��</td></tr>
        </table>
    </div>
</div>
    <!--��̬����html,����-->
    </form>
</body>
</html>
