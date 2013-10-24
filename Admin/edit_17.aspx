<!--数据管理-污染源基本情况管理-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" Debug="true"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
/*主表：gmis_mo_17
关联表：[企业信息]gmis_mo_1202，关联条件：（gmis_mo_1202.fld_1202_2=gmis_mo_17.fld_17_1）;）
关联表：[关联]gmis_mo_1197，关联条件：（gmis_mo_1197.modulecode=mid and gmis_mo_1197.datamocode=id）;）
关联表：[地图]gmis_feature，关联条件：（gmis_feature.featurecode=gmis_mo_1197.featurecode）;
*/
    string dtablefeature, filterfeature, typesfeature, dtable_1202, filter_1202,types_1202;
    string[] fldsfeature, vflds_1202, flds_1202;
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//设置工具条,同时获取固定URL参数    
    //污染源基本情况
	dtable = "gmis_Mo_17";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_17_1", "fld_17_2", "fld_17_3", "fld_17_4", "fld_17_5", "fld_17_6", "fld_17_7", "fld_17_8", "fld_17_9", "fld_17_10", "fld_17_11", "fld_17_12", "fld_17_13", "fld_17_14", "fld_17_15", "fld_17_16", "fld_17_17", "fld_17_18", "fld_17_19", "creatorcode" };
    mflds = new string[] { "单位编号|fld_17_1" };
    types = "00001010111111100001";
    
    //地图数据表
    dtablefeature = "gmis_feature";
    fldsfeature = new string[] { "featurename", "featurebrief", "featurex", "featurey", "Featuredepth", "FeatureKind", "featurestate","typecode"};
    //filterfeature = " featurecode in (select featurecode from gmis_mo_1197 where modulecode="+mid+" and datamocode="+id+")";
    typesfeature = "00111100";
 
    //企业信息
    dtable_1202 = "gmis_mo_1202";
    flds_1202 = new string[] { "fld_1202_1", "fld_1202_2", "fld_1202_3", "fld_1202_4", "fld_1202_5", "fld_1202_12", "fld_1202_15", "fld_1202_16", "fld_1202_24", "fld_1202_20", "fld_1202_21" };
    filter_1202 = " mocode=" + pid;
    types_1202 = "00010000101";
    
     if (!IsPostBack) {//先绑定列表
        creatorcode.Value = GetUID();//创建人ID

        //街道
        db.SqlString = "select mocode,fld_1201_1,fld_1201_2,fld_1201_3 from gmis_mo_1201 order by fld_1201_5 asc";
        DataTable idt = db.GetDataTable();
        sel_area.Items.Add(new ListItem("-请选择-", "0"));
        string img = "";
        foreach (DataRow dr in idt.Rows)
        {
            img = "";
            for (int i = 0; i < Convert.ToInt32(dr["fld_1201_2"]); i++)
            {
                img += ">";
            }
            sel_area.Items.Add(new ListItem(img + dr["fld_1201_1"].ToString(), dr["mocode"].ToString()));
        }
        SetFilter(sel_area, "0");

        //绑定行业类别
        db.SqlString = "select mocode,fld_1200_1,fld_1200_3,fld_1200_4,fld_1200_8 from gmis_mo_1200 order by fld_1200_6 asc";
        idt = db.GetDataTable();
        fld_17_8.Items.Add(new ListItem("-请选择-", "0"));
        foreach (DataRow dr in idt.Rows)
        {
            img = "";
            for (int i = 0; i < Convert.ToInt32(dr["fld_1200_3"]); i++)
            {
                img += ">";
            }
            fld_17_8.Items.Add(new ListItem(img + dr["fld_1200_1"].ToString(), dr["fld_1200_8"].ToString()));
        }
        SetFilter(fld_17_8, "0");
         
        //管辖权限
        BindListControl(fld_17_7, "mocode", "fld_44_1", "select mocode,fld_44_1 from gmis_mo_44", "请选择");
        SetFilter(fld_17_7, "0");
        
        //隶属关系
        BindListControl(fld_17_9, "mocode", "fld_47_1", "select mocode,fld_47_1 from gmis_mo_47", "请选择");
        SetFilter(fld_17_9, "0");
        //主管部门
        BindListControl(fld_17_10, "mocode", "fld_48_1", "select mocode,fld_48_1 from gmis_mo_48", "请选择");
        SetFilter(fld_17_10, "0");
        //水污染源级别
        BindListControl(fld_17_11, "mocode", "fld_49_1", "select mocode,fld_49_1 from gmis_mo_49", "请选择");
        SetFilter(fld_17_11, "0");
        //大气污染源级别
        BindListControl(fld_17_12, "mocode", "fld_50_1", "select mocode,fld_50_1 from gmis_mo_50", "请选择");
        SetFilter(fld_17_12, "0");
        //危废污染源级别
        BindListControl(fld_17_13, "mocode", "fld_51_1", "select mocode,fld_51_1 from gmis_mo_51", "请选择");
        SetFilter(fld_17_13, "0");
        //污水产生类别
        BindListControl(fld_17_15, "mocode", "fld_52_1", "select mocode,fld_52_1 from gmis_mo_52", "请选择");
        SetFilter(fld_17_15, "0");
        
        if (id != "0")
        {//绑定所有值
            btn_search.Visible = false;//隐藏查询按钮
            fld_17_1.Disabled = true;//单位编号不可编辑
            guangye.BindData(dtable, filter, flds);
            tb_2_new.Visible = true;//重新编辑   
            //根据企业代码，获取地图位置
            featurecode.Value = GetFieldData("select top 1 featurecode from gmis_mo_1197 where orgcode='" + guangye.GetControlValue(fld_17_1) + "'");
            if (featurecode.Value != "")
            {
                guangye.BindData(dtablefeature, " featurecode=" + featurecode.Value + "", fldsfeature);
            }
           
        }
        else
        {
            if (pid != "0")//从企业信息绑定数据
            {
                guangye.BindData(dtable_1202, filter_1202, flds_1202);
                btn_search.Visible = false;//隐藏查询按钮
                fld_17_1.Disabled = true;//单位编号不可编辑
                tb_2_new.Visible = true;//重新编辑
                featurename.Value=fld_17_3.Value = fld_1202_1.Value;//单位名称 -- 企业名称
                featurebrief.Value=fld_17_1.Value = fld_1202_2.Value;//单位编号 -- 企业代码
                fld_17_4.Value = fld_1202_3.Value;//单位地址 -- 企业地址
                fld_17_18.Value = fld_1202_15.Value;//法人姓名 -- 法定代表人
                fld_17_16.Value = fld_1202_16.Value;//单位环保联系人 -- 联系人姓名
                fld_17_17.Value = fld_1202_12.Value;//单位环保联系电话 -- 联系人电话
                SetFilter(fld_17_8, fld_1202_20.Value);//行业类别 -- 行业类别,记录行业代码
                fld_17_5.Value= fld_1202_4.Value;//区域绑定
                //根据企业代码，获取地图位置
                featurecode.Value = GetFieldData("select top 1 featurecode from gmis_mo_1197 where orgcode='" + guangye.GetControlValue(fld_17_1) + "'");
                if (featurecode.Value != "")
                {
                    guangye.BindData(dtablefeature, " featurecode=" + featurecode.Value + "", fldsfeature);
                }
                
            }
        }
        if (featurecode.Value == "")
        {
            featurecode.Value = "0";
        }        
        if (featurestate.Value == "")
        {
            featurestate.Value = "启用";
        }

        if (FeatureKind.Value == "" || FeatureKind.Value == "0")
        {
            FeatureKind.Value = "1";
        }
        SetFilter(sel_area, fld_17_5.Value);
    }   
}
/// <summary>
/// 保存之前的数据处理
/// </summary>
public override void BeforeSave()
{
    //获取区域
    if (sel_area.SelectedItem != null && sel_area.SelectedItem.Value != "0")
    {
        fld_17_5.Value = sel_area.SelectedItem.Value;
        db.SqlString = "select fld_1201_6 from gmis_mo_1201 where mocode=" + fld_17_5.Value;
        DataTable dt_temp = db.GetDataTable();
        if (dt_temp != null && dt_temp.Rows.Count > 0)
        {
            fld_1202_5.Value = dt_temp.Rows[0][0].ToString();
        }
    }
    //行业代码
    if (fld_17_8.SelectedItem != null && fld_17_8.SelectedItem.Value != "0")
    {
        fld_1202_20.Value = fld_17_8.SelectedItem.Value;
        db.SqlString = "select mocode from gmis_mo_1200 where fld_1200_8=" + fld_1202_20.Value;
        DataTable dt_temp = db.GetDataTable();
        if (dt_temp != null && dt_temp.Rows.Count > 0)
        {
            fld_1202_21.Value = dt_temp.Rows[0][0].ToString();
        }
    }


    featurename.Value=fld_1202_1.Value = fld_17_3.Value;//企业名称 -- 单位名称
    featurebrief.Value=fld_1202_2.Value = fld_17_1.Value;//企业代码 -- 单位编号
    fld_1202_3.Value = fld_17_4.Value;//企业地址 -- 单位地址
    fld_1202_15.Value = fld_17_18.Value;//法定代表人 -- 法人姓名
    fld_1202_16.Value = fld_17_16.Value;//联系人姓名 -- 单位环保联系人
    fld_1202_12.Value = fld_17_17.Value;//联系人电话 -- 单位环保联系电话
    //fld_1202_21.Value = fld_17_8.SelectedItem.Value;
    fld_1202_4.Value = fld_17_5.Value;
    typecode.Value = GetFieldData("select typecode from gmis_type where typename='"+GetModuleName(mid)+"'");
    string exeinfo = "";
    CheckMustAndFieldType();
    DataTable idt;
    //设置数据来源
    //fld_1202_24.Value = "17";
    if (id == "0")
    {
        db.SqlString = "select 1 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_17_1) + "'";
         idt = db.GetDataTable();
         if (idt.Rows.Count > 0)
         {
             exeinfo = "已有相同单位代码，请重新输入";
             salert.InnerHtml = exeinfo;
         }
    }
    //不重复
    if (exeinfo.Length == 0)
    {
        string sqlstr = "";//SQL语句

        if (id == "0")
        {
            //地图数据
            if (guangye.GetControlValue(featurecode) == "0" || guangye.GetControlValue(featurecode) == "")
            {
                sqlstr += guangye.GetInsertSql(dtablefeature, fldsfeature, typesfeature) + ";SELECT @@IDENTITY AS 'featurecode'; DECLARE @featureid int; SELECT @featureid=@@IDENTITY;";
                featurecode.Value = "@featureid";
            }
            else
            {
                filterfeature = " featurecode=" + featurecode.Value;
                sqlstr += guangye.GetUpdateSql(dtablefeature, filterfeature, fldsfeature, typesfeature)+";";
            }
            //污染源企业情况
            sqlstr += guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'mocode'; DECLARE @moid_17 int; SELECT @moid_17=@@IDENTITY;";
            //污染企业关系表
            sqlstr += "insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname,areacode,featurecode,tradecode) values (" + mid + ",@moid_17,'" + guangye.GetControlValue(fld_17_1) + "','" + guangye.GetControlValue(fld_17_3) + "','" + guangye.GetControlValue(fld_17_5) + "'," + guangye.GetControlValue(featurecode) + ",'" + guangye.GetControlValue(fld_1202_20) + "');";
            //企业基本信息表
            filter_1202 = "fld_1202_2='" + guangye.GetControlValue(fld_17_1) + "'";
            sqlstr += "if exists (select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_17_1) + "') begin  " + guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, types_1202) + " end else begin " + guangye.GetInsertSql(dtable_1202, flds_1202, types_1202) + " end;";
            //同企业(以企业代码为标识)的地图关系改为同一个
            sqlstr += "Update gmis_mo_1197 set featurecode=" + guangye.GetControlValue(featurecode) + " where orgcode='" + guangye.GetControlValue(fld_17_1) + "';";
            SetSESSION("sql", sqlstr);
        }
        else
        {
            //地图数据
            if (guangye.GetControlValue(featurecode) == "0" || guangye.GetControlValue(featurecode) == "")
            {
                sqlstr += guangye.GetInsertSql(dtablefeature, fldsfeature, typesfeature) + ";SELECT @@IDENTITY AS 'featurecode'; DECLARE @featureid int; SELECT @featureid=@@IDENTITY;";
                featurecode.Value = "@featureid";
            }
            else
            {
                filterfeature = " featurecode=" + featurecode.Value;
                sqlstr +=  guangye.GetUpdateSql(dtablefeature, filterfeature, fldsfeature, typesfeature)+";";
            }
            
            //污染源企业情况
            sqlstr += guangye.GetUpdateSql(dtable, filter, flds, types)+";";
            
            
            //污染企业关系表
            sqlstr += "if exists (select mocode from gmis_mo_1197 where orgcode='" + guangye.GetControlValue(fld_17_1) + "' and modulecode=" + mid + ") Update gmis_mo_1197 set featurecode=" + guangye.GetControlValue(featurecode) + ",tradecode='" + guangye.GetControlValue(fld_1202_20) + "',orgname='" + guangye.GetControlValue(fld_17_3) + "',areacode=" + guangye.GetControlValue(fld_17_5) + " where orgcode='" + guangye.GetControlValue(fld_17_1) + "' and modulecode=" + mid + " else insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname,areacode,featurecode,tradecode) values (" + mid + "," + id + ",'" + guangye.GetControlValue(fld_17_1) + "','" + guangye.GetControlValue(fld_17_3) + "','" + guangye.GetControlValue(fld_17_5) + "'," + guangye.GetControlValue(featurecode) + ",'" + guangye.GetControlValue(fld_1202_20) + "');";
            //企业基本信息表及关系表数据
            string h_mid = "1202";
            filter_1202 = "fld_1202_2='" + guangye.GetControlValue(fld_17_1) + "'";
            sqlstr += "if exists (select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_17_1) + "') begin " + guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, types_1202) + " ;if exists (select mocode from gmis_mo_1197 where orgcode='" + guangye.GetControlValue(fld_17_1) + "' and modulecode=" + h_mid + ") Update gmis_mo_1197 set featurecode=" + guangye.GetControlValue(featurecode) + ",tradecode='" + guangye.GetControlValue(fld_1202_20) + "',orgname='" + guangye.GetControlValue(fld_17_3) + "',areacode=" + guangye.GetControlValue(fld_17_5) + " where orgcode='" + guangye.GetControlValue(fld_17_1) + "' and modulecode=" + h_mid + " else insert into gmis_mo_1197 (modulecode,orgcode,orgname,areacode,featurecode,tradecode) values (" + h_mid + ",'" + guangye.GetControlValue(fld_17_1) + "','" + guangye.GetControlValue(fld_17_3) + "','" + guangye.GetControlValue(fld_17_5) + "'," + guangye.GetControlValue(featurecode) + ",'" + guangye.GetControlValue(fld_1202_20) + "') end  ";
            sqlstr += " else ";
            sqlstr += "begin " + guangye.GetInsertSql(dtable_1202, flds_1202, types_1202) + ";insert into gmis_mo_1197 (modulecode,orgcode,orgname,areacode,featurecode,tradecode) values (" + h_mid + ",'" + guangye.GetControlValue(fld_17_1) + "','" + guangye.GetControlValue(fld_17_3) + "','" + guangye.GetControlValue(fld_17_5) + "'," + guangye.GetControlValue(featurecode) + ",'" + guangye.GetControlValue(fld_1202_20) + "') end ";

            //同企业(以企业代码为标识)的地图关系改为同一个
            sqlstr += "Update gmis_mo_1197 set featurecode=" + guangye.GetControlValue(featurecode) + " where orgcode='" + guangye.GetControlValue(fld_17_1) + "';";
            
            SetSESSION("sql", sqlstr);
        }
    }
   
    if (GetSESSION("sql") != "")
        Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);

}
private void Click_Search(object sender, System.EventArgs e)
{
    string scriptstr = "";
    if (guangye.GetControlValue(fld_17_1).Length > 0)
    {
        salert.InnerText = "";
        scriptstr = "<scrip" + "t>__doOpenView('pop_search_company.aspx?mid=" + mid + "&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_17_1)) + "',800,600,10,50);</scrip" + "t>";
        Page.RegisterStartupScript("popwin", scriptstr);
    }
    else salert.InnerText = "请输入查询数据！";


}
</script>
<script language="javascript">
function GetData(args)
{		
	
	var arrstr = args.toString().split("|");
	if(arrstr.length>1)
	{			
		window.document.form1.Featurex.value=arrstr[0];
		window.document.form1.Featurey.value=arrstr[1];
	}
	window.document.focus();	
	
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
            <td style="width:100%"><span id="salert" runat="server" style="color:Red;"></span></td>	
			<!--右边固定按钮-->
			<!--#include file="toolbar1146.aspx"-->
			<!--右边固定按钮-->
	<!--#include file="toolbarright.aspx"-->   
<!--操作工具条-->

<!--企业信息-->
<input id="fld_1202_1" runat="server" type="hidden" /><!--企业名称-->
<input id="fld_1202_2" runat="server" type="hidden" /><!--企业代码-->
<input id="fld_1202_3" runat="server" type="hidden" /><!--企业地址-->
<input id="fld_1202_4" runat="server" type="hidden" /><!--行政区域-->
<input id="fld_1202_5" runat="server" type="hidden" /><!--行政区划代码-->
<input id="fld_1202_12" runat="server" type="hidden" /><!--联系人电话-->
<input id="fld_1202_15" runat="server" type="hidden" /><!--法定代表人-->
<input id="fld_1202_16" runat="server" type="hidden" /><!--联系人姓名-->
<input id="fld_1202_20" runat="server" type="hidden" /><!--行业代码-->
<input id="fld_1202_21" runat="server" type="hidden" /><!--行业类型-->
<input id="fld_1202_24" runat="server" type="hidden" /><!--数据来源-->
<!--企业信息-->

<input id="fld_17_5" runat="server" type="hidden" />

<input id="creatorcode" runat="server" type="hidden" />

<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
	<tr>
	    <td align="right"  class="td_viewcontent_title"><span style="color:red">*</span>单位编号：</td>
	    <td class="td_viewcontent_content" nowrap>
	        <input id="fld_17_1" class="boxbline" type="text" runat="server" />
	        <asp:LinkButton id="btn_search" runat="server" OnClick="Click_Search"><img src="images\icons\search.gif" style="cursor:hand" title="查询" border="0" /></asp:LinkButton >
	       
	    </td>
	    <td align="right"  class="td_viewcontent_title">&nbsp;</td>
	    <td class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
    <td align="right"  class="td_viewcontent_title"><span style="color:red">*</span>单位名称：</td>
	    <td class="td_viewcontent_content" colspan="3"><input id="fld_17_3" class="boxbline" type="text" style="width:95%"  runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">单位地址：</td>
	    <td colspan="3" class="td_viewcontent_content"><input id="fld_17_4" class="boxbline" style="width:95%" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">企业法人代码：</td>
	    <td class="td_viewcontent_content"><input id="fld_17_2" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">法人姓名：</td>
	    <td class="td_viewcontent_content"><input id="fld_17_18" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">法人电话：</td>
	    <td class="td_viewcontent_content"><input id="fld_17_19" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">&nbsp;</td>
	    <td class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">单位环保联系人：</td>
	    <td class="td_viewcontent_content"><input id="fld_17_16" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">单位环保联系电话：</td>
	    <td class="td_viewcontent_content"><input id="fld_17_17" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">所在街道乡镇：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="sel_area" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">所属县区：</td>
	    <td class="td_viewcontent_content"><input id="fld_17_6" runat="server" class="boxbline" type="text" readonly value="青浦区" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">管辖权限：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_7" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">所属行业：</td>
	    <td class="td_viewcontent_content">
	        <asp:dropdownlist id="fld_17_8" class="boxbline" style="width: 95%;" runat="server" ></asp:dropdownlist>
	       
	        <!---->
	    </td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">隶属关系：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_9" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">主管部门：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_10" runat="server" Width="150"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">水污染源级别：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_11" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">大气污染源级别：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_12" runat="server" Width="150"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">危废污染源级别：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_13" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">污水产生类别：</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_15" runat="server" Width="150"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">年总产值：</td>
	    <td class="td_viewcontent_content"><input id="fld_17_14" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">&nbsp;</td>
	    <td class="td_viewcontent_content">&nbsp;</td>
    </tr>
        <tr>
            <td class="td_viewcontent_title_top" align="right">
                数据：
            </td>
            <td class="td_viewcontent_content" colspan="3">
                <input id="Featurex" type="hidden" runat="server">
                <input id="Featurey" type="hidden" runat="server">
                <input id="featurename" type="hidden" runat="server">
                <input id="featurebrief" type="hidden" runat="server">
                <input id="featurecode" type="hidden" runat="server">
                <input id="FeatureKind" value="1" type="hidden" runat="server">
                <input id="featurestate" value="启用" type="hidden" runat="server">
                <input id="typecode"  type="hidden" runat="server">
                <table>
                    <tr>
                        <td>
                            <input id="dataface" type="password" style="width: 250px" title="请从地图获取数据" value="1111111111111111111111111111"
                                readonly="true">
                        </td>
                        <td>
                            &nbsp;深度：
                        </td>
                        <td>
                            <input id="tmpdepth" type="hidden" value="0" runat="server">
                            <input id="Featuredepth" type="text" style="width: 60px" value="0" onmousedown="this.value=''"
                                onmouseout="if(this.value=='') {this.value=tmpdepth.value}" title="只能输入数字" runat="server">
                        </td>
                        <td>
                            &nbsp;<a href="javascript:__doOpenMap('1',form1.featurecode.value+'|'+form1.FeatureKind.value+'|'+form1.typecode.value)")"><img src="images/getdata_.gif" border="0"></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
</table>
<!--动态生成结束-->
</form>
</body>
</html>