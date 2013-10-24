<!--废气污染物排放许可管理状态,列表页-->
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
DataTable p_dt ;
string  hycode="";
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();//设置工具条,同时获取固定URL参数 
	String a = "fld_1311_5";
    tb_2.Visible = false;
    hycode = GetQueryString("hycode", "");
    string h_t = GetQueryString("t", "0");  
    string h_fstr = "";
	if(h_t!="0")
		SetSESSION("filter", "");
    if (hycode == "3" || hycode == "2" || hycode == "1")
    {
        hangyexiaolei.Visible = false;
        if (hycode == "3")
        {
            h_fstr = " and ( fld_1202_2 in (select fld_834_1 from gmis_mo_834) or fld_1202_2 in (select fld_848_1 from gmis_mo_848) or fld_1202_2 in (select fld_866_1 from gmis_mo_866) or fld_1202_2 in (select fld_884_1 from gmis_mo_884))";
        }
    }    
    else
    {
        h_fstr = " and (select fld_1200_6 from gmis_mo_1200 where fld_1200_8=fld_1202_20) like '%'+(select fld_1200_6 from gmis_mo_1200 where fld_1200_8='" + hycode + "')+'%'";
    }


    if (!IsPostBack)
    {
        if (hycode != "3" || hycode != "2" || hycode != "1")
        {
            BindListControl(hangye, "fld_1200_8", "fld_1200_1", "select distinct fld_1200_1,fld_1200_8 from gmis_mo_1200 where fld_1200_6 like '%'+(select fld_1200_6 from gmis_mo_1200 where fld_1200_8='"+hycode+"')+'%' and fld_1200_8<>'"+hycode+"'", "行业小类筛选");
        }
    
        
        BindListControl(xiangzhen, "fld_1201_6", "fld_1201_1", "select distinct fld_1201_1,fld_1201_6 from gmis_mo_1201", "乡镇筛选");
        BindListControl(ziduan, "fieldname", "caption", "select fieldname,caption from gmis_field where modulecode=1202 and fieldname like 'fld%'", "选择字段");
		
		string hy = "0",xz = "0", zd = "0";
		if (GetSESSION("filter") != "")
		{
			//使用正则表达式取出Session里的条件     
			Regex r;
			Match m;
		   
			r = new Regex(".*?hangye=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				hy = m.Result("${txt}");
			}	
			
			r = new Regex(".*?xiangzhen=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				xz = m.Result("${txt}");
			}
			
			r = new Regex(".*?ziduan=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				zd = m.Result("${txt}");
			}

			r = new Regex(".*?guanjianzi=[\'](?<txt>[^\']+)[\'].*?", RegexOptions.IgnoreCase);
			m = r.Match(GetSESSION("filter"));
			if (m.Success)
			{
				guangye.SetControlValue(guanjianzi, m.Result("${txt}"));
			}
		} 
		SetFilter(hangye,hy);
		SetFilter(xiangzhen,xz);
		SetFilter(ziduan,zd);

		p_dt = db.GetDataTable(db.ConnStr,"select modulecode,moduleurl from gmis_module where modulestate=0 and moduleurl<>'' and moduleindex like '%0.002%'");
    }
    if (hycode == "1" || hycode == "2")
    {
        h_fstr += " and substring(fld_1202_20,0,3) in (select fld_1200_8 from gmis_mo_1200 where fld_1200_3=1 and fld_1200_2='" + hycode + "')";
    }
    else
    {
        if (hangye.SelectedItem != null && hangye.SelectedItem.Value != "0")
        {
            h_fstr += " and fld_1202_20='" + hangye.SelectedItem.Value + "'";
        }
    }
    if (xiangzhen.SelectedItem != null && xiangzhen.SelectedItem.Value != "0")
    {
        h_fstr += " and substring(fld_1202_5,0," + (xiangzhen.SelectedItem.Value.Length + 1) + ")='" + xiangzhen.SelectedItem.Value + "'";
    }
    if (ziduan.SelectedItem != null && ziduan.SelectedItem.Value != "0" && guanjianzi.Value != "")
    {
        h_fstr += " and " + ziduan.SelectedItem.Value + " like '%" + guanjianzi.Value + "%'";
    }

    int pagesize = GetListRows();//获取列表每页显示的记录数
    int fromcount = Convert.ToInt32(navindex) * pagesize;//计算已翻过页数的记录数
    list.Rows = pagesize;
    list.SqlStr = "declare @allcount int;select @allcount=count(1) from gmis_mo_1202 where fld_1202_24=0 " + h_fstr + ";select @allcount as allcount,'' as orgcode,'"+StringUtility.StringToBase64(hycode)+"',fld_1202_2,fld_1202_1,'' as zibiao,mocode,fld_1202_25 from gmis_mo_1202 where mocode in (select top " + (fromcount + pagesize) + " mocode from gmis_mo_1202 where fld_1202_24=0 " + h_fstr + " order by fld_1202_2) and mocode not in (select top " + fromcount + " mocode from gmis_mo_1202 where fld_1202_24=0 " + h_fstr + " order by fld_1202_2) order by fld_1202_2";

    //Response.Write(list.SqlStr);
    
    list.Rows = GetListRows();
}
public override void BeforeOutput(DataTable dt, int rowi)
{	
    DataRow dr = dt.Rows[rowi];
	dr["orgcode"] = StringUtility.StringToBase64(dr["fld_1202_2"].ToString());
	if (p_dt != null && p_dt.Rows.Count>0 && dr["fld_1202_25"].ToString()!="")
	{
		DataRow[] h_idr = p_dt.Select("modulecode in ("+dr["fld_1202_25"].ToString()+")");
		if (h_idr.Length>0)
		{
			for (int i=0;i<h_idr.Length;i++)
			{
				dr["zibiao"] += "<a href=\"view_"+h_idr[i][0].ToString()+".aspx?aid=dmlldw==&mid="+h_idr[i][0].ToString()+"&orgcode="+StringUtility.StringToBase64(dr["fld_1202_2"].ToString())+"&hycode="+StringUtility.StringToBase64(hycode)+"\">"+h_idr[i][1].ToString().ToUpper()+"</a>&nbsp;";
			}
		}
	}
}

private void btn_search(object sender, System.EventArgs e)
{
    
    string filter = "";
    if (guangye.GetControlValue(hangye) != "0")
    {
        filter +=  " and hangye='" + guangye.GetControlValue(hangye) + "'";
    }
    if (guangye.GetControlValue(xiangzhen) != "0")
    {
        filter += " and xiangzhen='" + guangye.GetControlValue(xiangzhen) + "'";
    }

    if (guangye.GetControlValue(ziduan) != "0" && guangye.GetControlValue(guanjianzi) != "")
    {
        filter += " and ziduan='" + guangye.GetControlValue(ziduan) + "' and guanjianzi='"+guangye.GetControlValue(guanjianzi)+"'";

    }

    SetSESSION("filter", filter);
    Response.Redirect("list_1199.aspx?mid=1199&hycode=" +StringUtility.StringToBase64(hycode) + "&navindex=0");
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<td>
			<asp:DropDownList runat="server" ID="xiangzhen" Width="140px"></asp:DropDownList>
			</td>
			<td id="hangyexiaolei" runat="server" align="left" style="padding-left:10px;">
			<asp:DropDownList runat="server" ID="hangye" Width="140px"></asp:DropDownList>
			</td>
			<td align="left" style="padding-left:10px;">
			<asp:DropDownList runat="server" ID="ziduan" Width="140px"></asp:DropDownList>
			</td>
			<td align="left" style="padding-left:10px;">
			<input runat="server" id="guanjianzi" style="width:140px;" />
			</td>
			<td width="100%" align="left" style="padding-left:10px;">
			<G:Button id="search" type="toolbar" mode="on" icon="tb08" text="开始检索" onclick="btn_search" data="0" runat="server"></G:Button>
			
			</td>
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline" style="table-layout: fixed;WORD-BREAK: break-all; WORD-WRAP: break-word" >
    <tr class="tr_listtitle" align="left">
	    <td width="25%" >单位代码</td>
	    <td width="25%">单位名称</td>
	    <td width="50%">所包含子表</td>
    </tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td ><a href="view_1199.aspx?aid=dmlldw==&mid=1199&orgcode=*&hycode=*">*&nbsp;</a></td>
			<td >*</td>
			<td >*</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_1199.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--动态生成html,结束-->
</form>
</body>
</html>
