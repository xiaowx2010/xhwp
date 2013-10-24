<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<script language="c#" runat=server>
string p_name="",p_code="",pid2="",p_id,p_tredeccode,p_area;
private void Page_Load(object sender,System.EventArgs e)
{
    SetToolBar();
    //企业代码
    pid2=GetQueryString("pid2","0");   
    mid=GetQueryString("mid","0");
    tb_2.Visible=false;
    tb_save.Visible=false;
    dtable = "gmis_feature";
    flds = new string[] { "featurename","featurebrief","featurex", "featurey", "Featuredepth","FeatureKind","featurestate"};
    types = "0011110";
     
    if (!IsPostBack)
    {
        
        featurecode.Value="0";
        DataTable dt;
        dt=db.GetDataTable(db.ConnStr,"select mocode,fld_1202_1,fld_1202_4,fld_1202_20 from gmis_mo_1202 where fld_1202_2='"+pid2+"'");
        if(dt!=null && dt.Rows.Count>0)
        {
            DataRow dr=dt.Rows[0];
            featurename.Value=orgname.Value=txt_orgname.InnerText=dr["fld_1202_1"].ToString();//企业名称
            featurebrief.Value=orgcode.Value=txt_orgcode.InnerText=pid2;//企业代码                      
            areacode.Value=dr["fld_1202_4"].ToString();
            typecode.Value=tradecode.Value=dr["fld_1202_20"].ToString();
            //关联数据及模块and modulecode="+mid+"
            modulecode.Value=mid;
                    
            dt=db.GetDataTable(db.ConnStr,"select top 1 featurecode from gmis_feature where featurecode in (select featurecode from gmis_mo_1197 where orgcode='"+pid2+"' and featurecode<>0 )");
          
            if(dt!=null && dt.Rows.Count>0)
            {
                featurecode.Value=dt.Rows[0]["featurecode"].ToString();
            }
        }      
      
       if (guangye.GetControlValue(featurecode)!= "0")
       {
            filter = "featurecode="+guangye.GetControlValue(featurecode);   
            guangye.BindData(dtable, filter, flds);
            
        }
        featurestate.Value="启用";
    }
   
}
private void Click_Save_658(object sender, System.EventArgs e)
{
    string exeinfo="";
    if(guangye.GetControlValue(orgcode)=="")
    {
        exeinfo="请选择企业！";
    }
    if(exeinfo.Length==0)
    {
        if (guangye.GetControlValue(featurecode) == "0" )
        {
            SetSESSION("sql", guangye.GetInsertSql(dtable, flds, types)+";SELECT @@IDENTITY AS 'featurecode'; DECLARE @featureid int; SELECT @featureid=@@IDENTITY;");
            featurecode.Value="@featureid";
        }
        else
        {
            filter = "featurecode="+guangye.GetControlValue(featurecode);   
            SetSESSION("sql", guangye.GetUpdateSql(dtable, filter, flds, types));
        } 
        //更新关系表
        string sqlstr="if exists (select mocode from gmis_mo_1197 where orgcode='"+pid2+"' and modulecode="+mid+") Update gmis_mo_1197 set featurecode="+guangye.GetControlValue(featurecode)+",tradecode='"+guangye.GetControlValue(tradecode)+"',orgname='"+guangye.GetControlValue(orgname)+"',areacode="+guangye.GetControlValue(areacode)+" where orgcode='" + pid2 + "' and modulecode=" + mid + " else insert into gmis_mo_1197 (modulecode,orgcode,orgname,areacode,featurecode,tradecode) values ("+guangye.GetControlValue(modulecode)+",'"+pid2+"','"+guangye.GetControlValue(orgname)+"','"+guangye.GetControlValue(areacode)+"',"+guangye.GetControlValue(featurecode)+",'"+guangye.GetControlValue(tradecode)+"')";
         //同企业(以企业代码为标识)的地图关系改为同一个
         sqlstr+=";Update gmis_mo_1197 set featurecode="+guangye.GetControlValue(featurecode)+" where orgcode='" + pid2 + "'";
         SetSESSION("extsql",sqlstr);
         if (GetSESSION("sql") != "")
        {
            string h_sql = "Begin "+GetSESSION("sql").Trim(';')+";"+GetSESSION("extsql").Trim(';')+" end"; 
            SetSESSION("sql","");
            
            string Exeinfo = "";
           //Response.Write(h_sql);
            SetSESSION("extsql","");
            Exeinfo = guangye.ExeBySql(h_sql, 1);            
            if (Exeinfo.IndexOf("操作成功！") > -1)
            {
                Page.RegisterStartupScript("popwin", "<scrip" + "t>opener.window.location.href=opener.window.location.href+\"&doback=1\";window.close();</s" + "cript>");
            }
        }
    }
    alertmess.InnerText=exeinfo;
 
}
</script>
<script >


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

<body>
    <form id="form1" runat="server">
    <!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<td style="padding-left:5px;" width="100%" align="right">
                <G:Button id="btn_save_658" type="toolbar" mode="on" icon="tb05" text="保存" onclick="Click_Save_658" runat="server"></G:Button>
            </td>
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<!--关系表字段-->
<input id="featurecode" type="hidden" runat="server">
<input id="modulecode" type="hidden" runat="server">
<input id="orgname" type="hidden" runat="server">
<input id="datamocode" type="hidden" runat="server">
<input id="orgcode" type="hidden" runat="server">
<input id="areacode" type="hidden" runat="server">
<input id="tradecode" type="hidden" runat="server">
<!--关系表字段-->
<input id="FeatureKind" Value="1" type="hidden" runat="server">
<input id="typecode"  type="hidden" runat="server">
<input id="featurename"  type="hidden" runat="server">
<input id="featurebrief"  type="hidden" runat="server">
<input id="featurestate"  type="hidden" runat="server">
    <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
        <tr>
            <td align="right" class="td_viewcontent_title_top">
                单位名称：
            </td>
            <td class="td_viewcontent_content">
               <span id="txt_orgname" runat=server></span>&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title_top">
                单位代码：
            </td>
            <td class="td_viewcontent_content">
               <span id="txt_orgcode" runat=server></span>&nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_viewcontent_title_top" align="right">
                数据：
            </td>
            <td class="td_viewcontent_content" colspan="3">
                <input id="Featurex" type="hidden" runat="server">
                <input id="Featurey" type="hidden" runat="server">
                <table>
                    <tr>
                        <td>
                            <input id="dataface" type="password" style="width: 200px" title="请从地图获取数据" value="1111111111111111111111111111"
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
    </form>
</body>
</html>
