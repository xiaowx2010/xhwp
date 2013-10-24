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
    string p_name = "", p_code = "", pid2, p_id, p_tredeccode, p_area;
private void Page_Load(object sender,System.EventArgs e)
{
    SetToolBar();
    pid2=GetQueryString("pid2","0");
    mid=GetQueryString("mid","0");
    tb_2.Visible=false;
    tb_save.Visible=true;

    db.SqlString = "select fld_1202_1,fld_1202_4,fld_1202_20 from gmis_mo_1202 where fld_1202_2='" + pid2 + "'";
    DataTable dt_1202 = db.GetDataTable();
    if (dt_1202 != null && dt_1202.Rows.Count > 0)
    {
        p_name = dt_1202.Rows[0]["fld_1202_1"].ToString();
        p_code = pid2;
        p_tredeccode = dt_1202.Rows[0]["fld_1202_20"].ToString();
        p_area = dt_1202.Rows[0]["fld_1202_4"].ToString();
    }
    
    
    db.SqlString="select featurecode from gmis_mo_1197 where orgcode='"+pid2+"' and modulecode="+mid;
    DataTable dt=db.GetDataTable();
    if (dt.Rows.Count > 0)
    {
        p_id=dt.Rows[0]["featurecode"].ToString();
    }
    dtable = "gmis_feature";
    flds = new string[] { "featurex", "featurey", "Featuredepth" ,"FeatureKind"};
    types = "1111";
    filter = "featurecode="+p_id;
    if (!IsPostBack)
    {
        if (p_id != "0")
        {
            guangye.BindData(dtable, filter, flds);
            
        }
    }
   
}
public  override void BeforeSave()
{
    SetSESSION("extsql", "SELECT @@IDENTITY AS 'featurecode'; DECLARE @featurecode int; SELECT @featurecode=@@IDENTITY;if exists (select mocode from gmis_mo_1197 where orgcode='" + pid2 + "' and modulecode=" + mid + ") Update gmis_mo_1197 set featurecode=@featurecode,tradecode=" + p_tredeccode + ",orgname='" + p_name + "',areacode=" + p_area + " where orgcode='" + pid2 + "' and modulecode=" + mid + " else insert into gmis_mo_1197 (orgcode,orgname,areacode,featurecode,tradecode) values ('" + pid2 + "','" + p_name + "','" + p_area + "',@featurecode," + p_tredeccode + ")");
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
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<input id="FeatureKind" Value="1" type="hidden" runat="server">
<input id="typecode" Value="1" type="hidden" runat="server">
    <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
        <tr>
            <td align="right" class="td_viewcontent_title_top">
                单位名称：
            </td>
            <td class="td_viewcontent_content">
               <%=p_name.ToString() %> &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="td_viewcontent_title_top">
                单位代码：
            </td>
            <td class="td_viewcontent_content">
                <%=p_code.ToString() %>&nbsp;
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
                            &nbsp;<a href="javascript:__doOpenMap('1',<%=id%>+'|'+form1.FeatureKind.value+'|'+form1.typecode.value)")"><img src="images/getdata_.gif" border="0"></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
