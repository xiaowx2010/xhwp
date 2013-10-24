<!--水质量监测信息,编辑页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string dtablefeature, filterfeature, typesfeature,featurecode;
    string[] fldsfeature;
private void Page_Load(object sender, System.EventArgs e)
{    
     
    SetToolBar();//设置工具条,同时获取固定URL参数  
    mid = GetQueryString("mid", "0");
    id = GetQueryString("id", "0");
    dtable = "gmis_mo_" + mid + "";
    flds = new string[] { "fld_" + mid + "_1", "fld_" + mid + "_2", "fld_" + mid + "_3", "fld_" + mid + "_4", "fld_" + mid + "_5", "fld_" + mid + "_6", "fld_" + mid + "_7", "fld_" + mid + "_8", "fld_" + mid + "_9", "fld_" + mid + "_10", "fld_" + mid + "_11", "fld_" + mid + "_12", "fld_" + mid + "_13", "fld_" + mid + "_14", "fld_" + mid + "_15", "fld_" + mid + "_16", "fld_" + mid + "_17", "fld_" + mid + "_18", "fld_" + mid + "_19", "fld_" + mid + "_20", "fld_" + mid + "_21", "fld_" + mid + "_22", "fld_" + mid + "_23", "fld_" + mid + "_24", "fld_" + mid + "_25", "fld_" + mid + "_26", "fld_" + mid + "_27", "fld_" + mid + "_28", "fld_" + mid + "_29", "fld_" + mid + "_30", "fld_" + mid + "_31", "fld_" + mid + "_32", "fld_" + mid + "_33", "fld_" + mid + "_34", "fld_" + mid + "_35" };
    types = "0000011011  1111111111  1111111111  11111";
    filter = "mocode=" + id;
    dtablefeature = "gmis_feature";
    fldsfeature = new string[] { "featurename","featurebrief","featurex", "featurey", "Featuredepth","featurekind","featurestate" ,"typecode"};
    typesfeature = "00111100";
    /*if (id != "0")
    {
        db.SqlString = "select fld_37_35 from gmis_mo_37 where mocode=" + id;
        DataTable dt35 = db.GetDataTable();
        if (dt35.Rows.Count > 0)
        {
            filterfeature = "featurecode=" + dt35.Rows[0]["fld_37_35"].ToString() + "";
            featurecode = dt35.Rows[0]["fld_37_35"].ToString();
        }
    }*/
    if (!IsPostBack)
    {
        if (id != "0")
        {
            guangye.BindData(dtable, filter, flds);
            if (guangye.GetControlValue(fld_37_35) != "" && guangye.GetControlValue(fld_37_35) != "0")
            {
                filterfeature = "featurecode=" + guangye.GetControlValue(fld_37_35) + "";
            }
            if (filterfeature != null && filterfeature != "")
            {
                guangye.BindData(dtablefeature, filterfeature, fldsfeature);
                if (guangye.GetControlValue(fld_37_35) == "")
                {
                    fld_37_35.Value = "0";
                }
            }
            else
            {
                fld_37_35.Value = "0";
            }
        }
    }

    
 }
public override void BeforeSave()
{
    CheckMustAndFieldType();
    featurename.Value = fld_37_3.Value;
    featurebrief.Value = fld_37_1.Value;
    typecode.Value = GetFieldData("select typecode from gmis_type where typename='" + GetModuleName(mid) + "'");
    string h_sql = "";
    if (id == "0")
    {
        fld_37_35.Value = "@modulefeature";        
        SetSESSION("sql", guangye.GetInsertSql(dtablefeature, fldsfeature, typesfeature) + ";SELECT @@IDENTITY AS 'modulefeature';declare @modulefeature as int;select @modulefeature=@@IDENTITY;"+guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int;select @mocode=@@IDENTITY;insert into gmis_mo_1197 (orgname,featurecode,modulecode,datamocode) values ('" + fld_37_3.Value + "',@modulefeature," + mid + ",@mocode);");

    }
    else
    {
        
       
        string sqlstr = "";

        if (guangye.GetControlValue(fld_37_35) == "" || guangye.GetControlValue(fld_37_35) == "0")
        {
            fld_37_35.Value = "@modulefeature";
            sqlstr = guangye.GetInsertSql(dtablefeature, fldsfeature, typesfeature) + ";SELECT @@IDENTITY AS 'modulefeature';declare @modulefeature as int;select @modulefeature=@@IDENTITY;";
        }
        else
        {
            filterfeature = " featurecode=" + guangye.GetControlValue(fld_37_35);
            sqlstr =guangye.GetUpdateSql(dtablefeature, filterfeature, fldsfeature, typesfeature)+";";
        }
        sqlstr += guangye.GetUpdateSql(dtable, filter, flds, types);
        sqlstr += ";if exists (select mocode from gmis_mo_1197 where modulecode=" + mid + " and datamocode=" + id + ") update gmis_mo_1197 set orgname='" + fld_37_3.Value + "',featurecode=" + guangye.GetControlValue(fld_37_35) + " where modulecode=" + mid + " and datamocode=" + id + " else insert into gmis_mo_1197 (orgname,featurecode,modulecode,datamocode) values ('" + fld_37_3.Value + "'," + guangye.GetControlValue(fld_37_35) + "," + mid + "," + id + ")";
        SetSESSION("sql", sqlstr);

    }
    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);

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
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<input id="fld_37_35" Value="0" type="hidden" runat="server">
<input id="FeatureKind" Value="1" type="hidden" runat="server">
<input id="typecode" Value="1" type="hidden" runat="server">
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
		<td align="right"  class="td_viewcontent_title">监测日期:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_1" class="boxbline" style="width:80%;" type="text" runat="server" readonly>&nbsp;&nbsp;<G:GetDate id="get_fld_37_1"   return="fld_37_1" runat="server" /></td>
			<td align="right"  class="td_viewcontent_title">收到日期:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_2" class="boxbline" style="width:80%;" type="text" runat="server" readonly>&nbsp;&nbsp;<G:GetDate id="get_fld_37_2" align="right" return="fld_37_2"  runat="server" /></td>
		</tr>
	
		<tr>
		<td  align="right"  class="td_viewcontent_title"><span style="color:red">*</span>湖岸名称:</td>
		<td colspan="3" class="td_viewcontent_content"><input id="fld_37_3" class="boxbline" style="width:98%;" maxlength="50" runat="server" ></td>
		</tr>
		<tr>
		<td align="right"  class="td_viewcontent_title">采样点位置:</td>
		<td colspan="3" class="td_viewcontent_content"><input id="fld_37_4" class="boxbline" style="width:98%;" maxlength="50" runat="server" ></td>
		</tr>
		<tr>
		<td align="right"  class="td_viewcontent_title">采样时间:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_5" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		
		<td align="right"  class="td_viewcontent_title">氨氮:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_6" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td  align="right"  class="td_viewcontent_title">溶解氧:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_7" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td  align="right"  class="td_viewcontent_title">PH:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_8" class="boxbline" style="width:95%;"  maxlength="50" runat="server" ></td>
		</tr>
		<tr>
		<td  align="right"  class="td_viewcontent_title">电导率:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_9" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td  align="right"  class="td_viewcontent_title">高锰酸盐指数:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_10" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td  align="right"  class="td_viewcontent_title">化学需氧量（CODcr）:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_11" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td  align="right"  class="td_viewcontent_title">挥发酚:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_12" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td  align="right"  class="td_viewcontent_title">生化需氧量（BOD5）:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_13" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td align="right"  class="td_viewcontent_title">石油类（石油醚萃取）:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_14" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td align="right"  class="td_viewcontent_title">水温:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_15" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td align="right"  class="td_viewcontent_title">铁:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_16" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td align="right"  class="td_viewcontent_title">透明度:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_17" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td  align="right"  class="td_viewcontent_title">总氮:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_18" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td  align="right"  class="td_viewcontent_title">总磷（以P计）:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_19" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td  align="right"  class="td_viewcontent_title">总汞:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_20" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td  align="right"  class="td_viewcontent_title">总锰:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_21" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td  align="right"  class="td_viewcontent_title">总铅:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_22" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td align="right"  class="td_viewcontent_title">氟化物（以F-计）:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_23" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td  align="right"  class="td_viewcontent_title">铬（六价）:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_24" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td align="right"  class="td_viewcontent_title">硫化物:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_25" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td align="right"  class="td_viewcontent_title">阴离子表面活性剂:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_26" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td  align="right"  class="td_viewcontent_title">总镉:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_27" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td  align="right"  class="td_viewcontent_title">总氰化物:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_28" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td  align="right"  class="td_viewcontent_title">总砷:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_29" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td  align="right"  class="td_viewcontent_title">总铜:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_30" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td  align="right"  class="td_viewcontent_title">总锌:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_31" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td align="right"  class="td_viewcontent_title">粪大肠菌群:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_32" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		</tr>
		<tr>
		<td  align="right"  class="td_viewcontent_title">硒:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_33" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
		
		<td  align="right"  class="td_viewcontent_title">叶绿素a:</td>
		<td class="td_viewcontent_content" style="width:35%"><input id="fld_37_34" class="boxbline" style="width:95%;"  maxlength="8" runat="server" ></td>
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
                <input id="featurestate" value='启用' type="hidden" runat="server">                
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
                            &nbsp;<a href="javascript:__doOpenMap('1',form1.fld_37_35.value+'|'+form1.FeatureKind.value+'|'+form1.typecode.value)")"><img src="images/getdata_.gif" border="0"></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
	</table>
<!--动态生成html,结束-->
</form>
</body>
</html>
