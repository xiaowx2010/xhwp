<!--企业信息,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string dtable_1146, filter_1146, types_1146, dtable_17, filter_17, types_17,ecode;
    string[] flds_1146, vflds_1146,vflds_17, flds_17;
private void Page_Load(object sender, System.EventArgs e)
{    
    SetToolBar();//设置工具条,同时获取固定URL参数    
    dtable="gmis_mo_1202";
    filter=" mocode="+id;
    flds = new string[] { "fld_1202_1", "fld_1202_2", "fld_1202_3", "fld_1202_4", "fld_1202_5", "fld_1202_6", "fld_1202_7", "fld_1202_8", "fld_1202_9", "fld_1202_10", "fld_1202_11", "fld_1202_12", "fld_1202_13", "fld_1202_14", "fld_1202_15", "fld_1202_16", "fld_1202_17", "fld_1202_18", "fld_1202_19", "fld_1202_20", "fld_1202_21", "fld_1202_24" };
    types="0001011111100000101011";

    dtable_1146 = "gmis_mo_1146";
    flds_1146 = new string[] { "fld_1146_2", "fld_1146_4", "fld_1146_19", "fld_1146_6", "fld_1146_7", "fld_1146_8", "fld_1146_9", "fld_1146_10", "fld_1146_11", "fld_1146_12", "fld_1146_13", "fld_1146_14", "fld_1146_15", "fld_1146_16", "fld_1146_20", "fld_1146_21", "fld_1146_22", "fld_1146_23", "fld_1146_24" };
    vflds_1146 = new string[] { "fld_1202_2", "fld_1202_1", "fld_1202_3", "fld_1202_6", "fld_1202_7", "fld_1202_8", "fld_1202_9", "fld_1202_10", "fld_1202_11", "fld_1202_15", "fld_1202_12", "fld_1202_13", "fld_1202_14", "fld_1202_16", "fld_1202_5", "fld_1202_17", "fld_1202_20", "fld_1202_19", "fld_1202_18"};
    filter_1146 = " fld_1146_2='" + ecode + "'";
    types_1146 = "0001111110000001010";

    dtable_17 = "gmis_mo_17";
    flds_17 = new string[] { "fld_17_3", "fld_17_1", "fld_17_4", "fld_17_5", "fld_17_17", "fld_17_18", "fld_17_16","fld_17_8"};
    vflds_17 = new string[] { "fld_1202_1", "fld_1202_2", "fld_1202_3", "fld_1202_4", "fld_1202_12", "fld_1202_15", "fld_1202_16","fld_1202_21" };
    filter_17 = " fld_17_1='" + ecode + "'";
    types_17 = "00010001";
    if(!IsPostBack)
    {
        //绑定行政区域
        db.SqlString = "select mocode,fld_1201_1,fld_1201_2,fld_1201_3 from gmis_mo_1201 order by fld_1201_5 asc";
		DataTable idt = db.GetDataTable();
        sel_area.Items.Add(new ListItem("-请选择-", "0"));
		string img="";
		foreach(DataRow dr in idt.Rows)
		{
			img="";
			for(int i=0;i<Convert.ToInt32(dr["fld_1201_2"]);i++)
			{
				img+=">";
			}
            sel_area.Items.Add(new ListItem(img + dr["fld_1201_1"].ToString(), dr["mocode"].ToString()));			
		}
        SetFilter(sel_area, "0");
        
        //绑定行业类别
		db.SqlString = "select mocode,fld_1200_1,fld_1200_3,fld_1200_4 from gmis_mo_1200 order by fld_1200_6 asc";
		idt = db.GetDataTable();
		fld_1202_21.Items.Add(new ListItem("-请选择-","0"));
		foreach(DataRow dr in idt.Rows)
		{
			img="";
			for(int i=0;i<Convert.ToInt32(dr["fld_1200_3"]);i++)
			{
				img+=">";
			}
			fld_1202_21.Items.Add(new ListItem(img+dr["fld_1200_1"].ToString(),dr["mocode"].ToString()));			
		}		
		SetFilter(fld_1202_21,"0");		
       
		//绑定登记注册类型
		BindListControl(fld_1202_17,"mocode","name","select mocode,fld_1157_1+'|'+fld_1157_2 as name from gmis_mo_1157","-请选择登记注册类型-");
		SetFilter(fld_1202_17,"0");		

		//绑定企业规模
		BindListControl(fld_1202_19,"mocode","name","select mocode,fld_1162_1+'|'+fld_1162_2 as name from gmis_mo_1162","-请选择企业规模-");
		SetFilter(fld_1202_19,"0");		

		if(id!="0")
		{
			guangye.BindData(dtable,filter,flds);
            SetFilter(sel_area, fld_1202_4.Value);
            
		}	
    }ecode = fld_1202_2.Value;
}
private void Area_Change(object sender, System.EventArgs e)
{
    if (sel_area.SelectedItem != null && sel_area.SelectedItem.Value != "0")
	{
        db.SqlString = "select fld_1201_6 from gmis_mo_1201 where mocode =" + sel_area.SelectedItem.Value;
		DataTable dt = db.GetDataTable();
		if(dt.Rows.Count>0)
		{
			fld_1202_5.Value = dt.Rows[0][0].ToString();
		}
	}
}
private void Dept_Change(object sender, System.EventArgs e)
{
	if(fld_1202_21.SelectedItem != null && fld_1202_21.SelectedItem.Value != "0")
	{
		db.SqlString = "select fld_1200_8 from gmis_mo_1200 where mocode ="+fld_1202_21.SelectedItem.Value;
        
		DataTable dt = db.GetDataTable();
		if(dt.Rows.Count>0)
		{
			fld_1202_20.Value = dt.Rows[0][0].ToString();
		}
	}
}
    
//保存之前的数据处理
public override void BeforeSave()
{
    if (sel_area.SelectedItem != null)
        fld_1202_4.Value = sel_area.SelectedItem.Value;
    if (id != "0")
    {
        if (fld_1202_24.Value == "2")//来源工业企业基本情况
        {
            SetSESSION("extsql", guangye.GetUpdateSql(dtable_1146, filter_1146, flds_1146, vflds_1146, types_1146) + ";update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_1202_2) + "',orgname='" + guangye.GetControlValue(fld_1202_1) + "',areacode='" + guangye.GetControlValue(fld_1202_4) + "',TradeCode='" + fld_1202_20.Value + "' where modulecode=1202 and orgcode='" + ecode + "'");
        }
        if (fld_1202_24.Value == "17")
        {
            filter_17 = " fld_17_1='" + ecode + "'";
            SetSESSION("extsql", guangye.GetUpdateSql(dtable_17, filter_17, flds_17, vflds_17, types_17) + ";update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_1202_2) + "',orgname='" + guangye.GetControlValue(fld_1202_1) + "',areacode='" + guangye.GetControlValue(fld_1202_4) + "',TradeCode='" + fld_1202_20.Value + "' where modulecode=1202 and orgcode='" + ecode + "';update gmis_mo_1197 set orgcode='" + guangye.GetControlValue(fld_1202_2) + "',orgname='" + guangye.GetControlValue(fld_1202_1) + "',areacode='" + guangye.GetControlValue(fld_1202_4) + "',tradecode='" + fld_1202_20.Value + "' where modulecode=17 and orgcode='" + ecode + "'");
        }
    }
    else
    { 
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
    <input id="fld_1202_24" runat="server" type="hidden" value="1" /><!--区分数据来源是否为导入的数据-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title"><font color="#ff6600">*</font>企业名称:</td>
		<td colspan="3" class="td_viewcontent_content"><input id="fld_1202_1" class="boxbline" style="width:98%;" maxlength="50" runat="server" ></td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">企业详细地址:</td>
		<td colspan="3" class="td_viewcontent_content" ><input id="fld_1202_3" class="boxbline" style="width:98%;" maxlength="50" runat="server" ></td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title"><font color="#ff6600">*</font>企业代码:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1202_2" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		<td width="100" align="right"  class="td_viewcontent_title">法定代表人:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1202_15" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
	</tr>	
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">行政区域:</td>
		<td class="td_viewcontent_content">
		    <input  id="fld_1202_4" type="hidden" runat="server" />
		    <input  id="fld_1202_4_temp" type="hidden" runat="server" />
			<asp:dropdownlist id="sel_area" class="boxbline" style="width: 95%;" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Area_Change"></asp:dropdownlist>
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">行政区划代码:</td>
		<td class="td_viewcontent_content"><input id="fld_1202_5" class="boxbline" style="width:98%;" maxlength="100" runat="server" readonly></td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">行业类别:</td>
		<td class="td_viewcontent_content">
			<asp:dropdownlist id="fld_1202_21" class="boxbline" style="width: 95%;" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Dept_Change"></asp:dropdownlist>
		</td>
		<td width="100" align="right"  class="td_viewcontent_title">行业代码:</td>
		<td class="td_viewcontent_content"><input id="fld_1202_20" class="boxbline" style="width:98%;" maxlength="100" runat="server" readonly></td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">登记注册类型:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:dropdownlist id="fld_1202_17" class="boxbline" style="width: 95%;" runat="server"></asp:dropdownlist>
		</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">企业规模:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<asp:dropdownlist id="fld_1202_19" class="boxbline" style="width: 95%;" runat="server"></asp:dropdownlist>
		</td>
	</tr>	
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">中心经度:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_1202_6" class="boxbline" style="width:70px;"  maxlength="8" runat="server" >&nbsp;°
		<input id="fld_1202_7" class="boxbline" style="width:70px;"  maxlength="8" runat="server" >&nbsp;'
		<input id="fld_1202_8" class="boxbline" style="width:70px;"  maxlength="8" runat="server" >&nbsp;"
		</td>
		
		<td width="100" align="right"  class="td_viewcontent_title">中心纬度:</td>
		<td class="td_viewcontent_content" style="width:35%">
		<input id="fld_1202_9" class="boxbline" style="width:70px;"  maxlength="8" runat="server" >&nbsp;°
		<input id="fld_1202_10" class="boxbline" style="width:70px;" maxlength="8" runat="server" >&nbsp;'
		<input id="fld_1202_11" class="boxbline" style="width:70px;" maxlength="8" runat="server" >&nbsp;"
		</td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">联系人姓名:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1202_16" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">联系人电话:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1202_12" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">传真号码:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1202_13" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">邮政编码:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1202_14" class="boxbline" style="width:95%;"  maxlength="6" runat="server" ></td>
	</tr>
	<tr>
		<td width="100" align="right"  class="td_viewcontent_title">开业时间:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_1202_18" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td width="100" align="right"  class="td_viewcontent_title">&nbsp;</td>
		<td class="td_viewcontent_content" style="width:35%">&nbsp;</td>
	</tr>
</table>
<!--动态生成html,结束-->
</form>
</body>
</html>
