<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">

    <script type="text/javascript">
        
    </script>

</head>
<!--#include file="func.aspx"-->

<script runat="server" language="C#">
    string sortid, sortdir,p_field,p_key,p_type,p_date,p_month;
    private void Page_Load(object sender, System.EventArgs e)
    {
        
        SetToolBar();//设置工具条,同时获取固定URL参数  
        string base_aid=StringUtility.StringToBase64("add");
       btn_newadd.Visible=false;
        sortid = GetQueryString("sortid", "0");  //排序字段
        sortdir = GetQueryString("sortdir", "1");  //1降序，0升序
       // p_field = GetQueryString("fid", "");  //所选择字段
        //p_key = GetQueryString("key", "");  //关键字
		//p_type = GetQueryString("select_type", "0");  //污染物类别
		//p_date = GetQueryString("select_Year", "0");  //污染物类别
		//p_month = GetQueryString("select_Month", "0");  //污染物类别
		p_field = GetSESSION("fid");
		p_key = GetSESSION("key");  //关键字
		p_type = GetSESSION("select_type");  //污染物类别
		p_date = GetSESSION("select_Year");  //污染物类别
		p_month = GetSESSION("select_Month");  //污染物类别
        if(!IsPostBack)
        {
            key.Value=p_key;
			BindListControl(select_field,"fieldname","caption",GetListFields(mid));//绑定下拉菜单
            SetFilter(select_field,p_field);
            BindListControl(select_type,"fld_1260_4","fld_1260_4","select distinct fld_1260_4 as fld_1260_4 from gmis_mo_1260","-所有状态-");
            SetFilter(select_type,p_type);
            BindListControl(select_Year,"fld_1260_71","fld_1260_71","select distinct case cast(year(cast(fld_1260_71 as datetime)) as varchar) when '1900' then '' else cast(year(cast(fld_1260_71 as datetime)) as varchar) end as fld_1260_71  from gmis_mo_1260","---------");
            SetFilter(select_Year,p_date);
            
			for(int i=1;i<=12;i++)
			{
				select_Month.Items.Add(new ListItem(i+"月", i.ToString()));
			}
			select_Month.Items.Add(new ListItem("----","0"));
			SetFilter(select_Month,p_month);
        }

        if (tb_2.Visible)
        {
            db.SqlString="select moduleuppercode from gmis_module where modulecode ="+mid;
            DataTable h_dt=db.GetDataTable();
            string h_uppercode;//上级模块编号
            if(h_dt!=null&&h_dt.Rows.Count>0)
            {
                h_uppercode=h_dt.Rows[0][0].ToString();
            }
            else
                h_uppercode="0";
            //点击新增后隐藏左边栏目树
            if(mid!="1205"&&mid!="1206"&&h_uppercode!="1124"&&h_uppercode!="1187")
                btn_newadd.Url = "javascript:toAddNew('" + StringUtility.StringToBase64("edit") + "','" + mid + "','" + GetFieldData("select modulecode from gmis_module where moduleindex =(select left(moduleindex,5) from gmis_module where modulecode="+mid+")") + "')"; 
          
        }
        //if(mid=="988") SetSESSION("extinfo" ,"988");
        BindListData();
    }
    
    //动态绑定栏目数据列表
    private void BindListData()
    {
        db.SqlString="select top 1 mocode from "+GetModuleTableName(mid)+"";
        if(db.GetDataTable().Rows.Count==0)
        {
            db.SqlString= "select modulecode,modulename,modulebrief,moduleuppercode,modulelevel,moduleindex from gmis_module where modulestate=0 order by moduleindex asc";           
            DataRow[] drs = db.GetDataTable().Select("ModuleUpperCode=" + mid + " ", "moduleindex asc");
            if (drs.Length > 0)
            {
                Response.Redirect("list_1260.aspx?mid=" + drs[0]["moduleCode"].ToString());
            } 
        }
        DataTable fdt = GetListFields(mid);//列表显示字段
        StringBuilder fsb = new StringBuilder();//字段
        StringBuilder ftsb = new StringBuilder();//标题
        StringBuilder fcsb = new StringBuilder();//内容
        StringBuilder fcsb2 = new StringBuilder();//空行
        ftsb.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"righttableline\">\n<tr class=\"tr_listtitle\" align=\"left\">\n");
        
        string sortstr = "";
        if (fdt.Rows.Count > 0)
        {
            
                
            fcsb.Append("<tr class=\"tr_listcontent\">\n");           
            fcsb2.Append("<tr class=\"tr_listcontent\">\n");           

            DataRow[] sorts = fdt.Select("fieldcode=" + sortid);
            if (sorts.Length == 0)
            {
                sorts = fdt.Select("fieldname='createdate'");
                sortid = (sorts.Length == 0) ? "0" : sorts[0]["fieldcode"].ToString();
                sortdir = "1";
                sortstr = "order by createdate " + ((sortdir == "1") ? " desc" : " asc"); 
            }
            else
            {
                sortstr = "order by a." + sorts[0]["fieldname"].ToString()+((sortdir=="1")?" desc":" asc");
            }

            string h_url = "getpage.aspx";
            bool islink = false;
            foreach (DataRow dr in fdt.Rows)
            {
                
                if (dr["fieldname"].ToString().ToLower() == "creatorcode")
                {
                    fsb.Append(",(select username from gmis_user where usercode=creatorcode)");
                }
                else if (dr["fieldtypecode"].ToString() == "6")//是非
                {
                    fsb.Append(",Case when " + dr["fieldname"].ToString() + "=1 then '是' else '否' end");
                }
                else if (dr["fieldtypecode"].ToString() == "7")//日期
                {
                    fsb.Append(",case Convert(nvarchar(10)," + dr["fieldname"].ToString() + ",120) when '1900-01-01' then '' else Convert(nvarchar(10)," + dr["fieldname"].ToString() + ",120) end");
                }
				else if ((mid=="1205"||mid=="1206")&&dr["fieldname"].ToString().ToLower() == "fld_"+mid+"_3")//关联污染物类别
				{
					fsb.Append(",(select fld_55_1 from gmis_mo_55 where mocode=fld_"+mid+"_3)");
				}
				else if (dr["fieldname"].ToString().ToLower() == "fld_1260_71")//关联污染物类别
				{
					fsb.Append(",case convert(nvarchar(10),cast(fld_1260_71 as datetime),120) when '1900-01-01' then '' else convert(nvarchar(10),cast(fld_1260_71 as datetime),120) end ");
				}
                else
                {
                    if ((dr["fieldtypecode"].ToString() == "1" && islink) || dr["fieldtypecode"].ToString() != "1")
                    {
                        fsb.Append("," + dr["fieldname"].ToString());
                    }

                }
                dr["oneditlistcolumnwidth"]=(dr["oneditlistcolumnwidth"].ToString()!="0")?dr["oneditlistcolumnwidth"].ToString():"120";
                if (dr["fieldtypecode"].ToString() == "1" && !islink)//短语
                {
                    fsb.Append(",mocode,'' as orgcode");
                    fsb.Append("," + dr["fieldname"].ToString());
                    fsb.Append("," + dr["fieldname"].ToString() + " as chtitle");
                    islink = true;
                    fcsb.Append("<td width=\"" + dr["oneditlistcolumnwidth"].ToString() + "\"><div style=\"width:" + dr["oneditlistcolumnwidth"].ToString() + "px;height:24px;\">");
                    fcsb.Append("<a href=\"view_" + mid+ ".aspx?aid="+StringUtility.StringToBase64("view")+"&mid=" + mid + "&id=*&orgcode=*&sortid=" + sortid + "&sortdir=" + sortdir + "&tabid=" + tabid + "&navindex=" + navindex + "\" title=\"*\">*</a></div></td>\n");
                }
                else
                {
                    fcsb.Append("<td width=\"" + dr["oneditlistcolumnwidth"].ToString() + "\"><div style=\"width:" + dr["oneditlistcolumnwidth"].ToString() + "px;height:24px;\">*</div></td>\n");
                }
                fcsb2.Append("<td>&nbsp;</td>");

                if (dr["fieldcode"].ToString() == sortid)
                {
                    sortdir = (sortdir == "0") ? "1" : "0";
                    string h_dirstr = (sortdir == "0") ? "升序" : "降序";
                    string h_dirimg = (sortdir == "0") ? "<img src=\"images/asc.gif\" style=\"margin:3px\" title=\"升序\"/>" : "<img src=\"images/desc.gif\" style=\"margin:3px\" title=\"降序\" />";
                    ftsb.Append("<td style=\"padding-top:3px;\"  width=\"" + dr["oneditlistcolumnwidth"].ToString() + "\" ><a href=\"list_1260.aspx?mid=" + mid + "&navindex=" + navindex + "&sortid=" + dr["fieldcode"].ToString() + "&sortdir=" + sortdir + "&tabid="+tabid+"\" class=\"listtitle\"  title=\"" + dr["caption"].ToString() + h_dirstr + "\">" + dr["caption"].ToString() + "</a>" + h_dirimg + "</td>\n");
                }
                else
                {
                    ftsb.Append("<td width=\"" + dr["oneditlistcolumnwidth"].ToString() + "\"><a href=\"list_1260.aspx?mid=" + mid + "&navindex=" + navindex + "&sortid=" + dr["fieldcode"].ToString() + "&sortdir=1&tabid=" + tabid + "\" class=\"listtitle\" title=\"" + dr["caption"].ToString() + "降序\">" + dr["caption"].ToString() + "</a></td>\n");
                }
            }
            fcsb.Append("<td  nowrap>*</td>\n");
            fcsb.Append("</tr>\n");
            fcsb2.Append("<td nowrap>&nbsp;</td>\n");
            fcsb2.Append("</tr>\n");
        }
        ftsb.Append("<td width=\"40\" nowrap>操作</td>\n");
        ftsb.Append("</tr>\n");      


        if (fsb.Length > 0 )
        {
            listtemphead.InnerHtml = ftsb.ToString();
            listtemp1.InnerHtml = fcsb.ToString();
            listtemp2.InnerHtml = fcsb2.ToString();
            string h_fstr = " ";//筛选条件
            
            if(select_field.SelectedItem!=null&&guangye.GetControlValue(key)!="")
                h_fstr+= " and "+select_field.SelectedItem.Value+" like ('%"+guangye.GetControlValue(key)+"%') ";
			if(guangye.GetControlValue(select_type)!="0")
                h_fstr+= " and fld_1260_4 = '"+guangye.GetControlValue(select_type)+"' ";
			if(guangye.GetControlValue(select_Year)!="0" && guangye.GetControlValue(select_Year)!="")
                 h_fstr+= " and year(cast(fld_1260_71 as datetime)) =" + guangye.GetControlValue(select_Year);
			else if(guangye.GetControlValue(select_Year)=="")
				 h_fstr+= " and year(cast(fld_1260_71 as datetime)) = 1900";
			if(guangye.GetControlValue(select_Month)!="0")
                h_fstr+= " and Month(cast(fld_1260_71 as datetime)) = "+guangye.GetControlValue(select_Month);
            string h_tablename = GetModuleTableName(mid);//数据表名称  
            int pagesize = GetListRows();//获取列表每页显示的记录数
            int fromcount = Convert.ToInt32(navindex) * pagesize;//计算已翻过页数的记录数  
            //设置列表控件显示行数
            list.Rows = pagesize;
            list.Visible = (CheckSysObject(h_tablename));
    
                list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + h_tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount, " + fsb.ToString().Trim(',') + ",'' as btnstr,fld_"+mid+"_1 from " + h_tablename + " a where mocode in (select top " + (fromcount + pagesize) + " mocode from " + h_tablename + " where 1=1 " + h_fstr + " " + sortstr + ") and mocode not in (select top " + fromcount + " mocode from " + h_tablename + " where 1=1 " + h_fstr + "" + sortstr + " ) " + h_fstr + " " + sortstr;
            
			//Response.Write("declare @allcount int;select @allcount=count(1) from " + h_tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount, " + fsb.ToString().Trim(',') + ",'' as btnstr,fld_"+mid+"_1 from " + h_tablename + " a where mocode in (select top " + (fromcount + pagesize) + " mocode from " + h_tablename + " where 1=1 " + h_fstr + " " + sortstr + ") and mocode not in (select top " + fromcount + " mocode from " + h_tablename + " where 1=1 " + h_fstr + "" + sortstr + " ) " + h_fstr + " " + sortstr);
        }
    }
    public override void BeforeOutput(DataTable dt, int rowi)
    {	//处理当前页数据

        DataRow dr = dt.Rows[rowi];
        if (mua.IndexOf(";3;") != -1)
        {
            //dr["btnstr"] += "<a href=\"javascript:clickGuide('" + StringUtility.StringToBase64("edit") + "','" + mid + "','" + dr["mocode"].ToString() + "','" + navindex + "','"+pid+"')\")><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";    
             dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
        }

        if (mua.IndexOf(";4;") != -1)
        {
            dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
        }
	    dr["orgcode"] = StringUtility.StringToBase64(dr["fld_"+mid+"_1"].ToString());
    }
    //获取列表显示字段字段
    private DataTable GetListFields(string mid)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("select f.fieldname,f.caption,f.fieldtypecode,f.fieldcode,f.datalength,f.fieldindex,0 as sortable,f.isprimarykey,f.isvital,f.oneditlist,editlistcolumnwidth as oneditlistcolumnwidth,f.onedit,f.fullline as oneditfullline,f.oneditmust,0 as OnView,0 as OnViewFullLine,0 as sortmode,f.fielddatasrc,f.defaultvalue,fy.fieldtypename,fy.sqlname,case when (isvital=0) then Cast(Replace(fieldname,'fld_'+cast(Modulecode as varchar(50))+'_','') as int) else 0 end as fldindex from gmis_field f left outer join gmis_fieldtype fy on f.fieldtypecode=fy.fieldtypecode ");
        sb.Append(" where (oneditlist=1 or caption='名称' or caption='代码') and Modulecode=" + mid);
        sb.Append(" order by fieldindex asc");
        db.SqlString = sb.ToString();
        //Response.Write(sb.ToString()+"<br>");
        return db.GetDataTable();
    }
    private void Click_Seach(object sender, System.EventArgs e)
    {   
        string h_fstr;//url参数
		h_fstr ="";
		/*
		if(select_Year.SelectedItem!=null&&guangye.GetControlValue(select_Year)!="0")
		{
			h_fstr += "&select_Year="+StringUtility.StringToBase64(guangye.GetControlValue(select_Year));
		}      
		if(select_Month.SelectedItem!=null&&guangye.GetControlValue(select_Month)!="0")
		{
			h_fstr += "&select_Month="+StringUtility.StringToBase64(guangye.GetControlValue(select_Month));
		}             
		if(select_type.SelectedItem!=null&&guangye.GetControlValue(select_type)!="0")
		{
			h_fstr += "&select_type="+StringUtility.StringToBase64(guangye.GetControlValue(select_type));
		}    
		if(select_field.SelectedItem!=null&&guangye.GetControlValue(key)!="")
		{
			h_fstr += "&fid="+StringUtility.StringToBase64(guangye.GetControlValue(select_field))+"&key="+StringUtility.StringToBase64(guangye.GetControlValue(key));
		}       */
		SetSessionFilter();
        Response.Redirect("list_1260.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex=0&pid="+pid+h_fstr);
    }
	//污染物类别
    private void Change_Type(object sender, System.EventArgs e)
    {
		string h_fstr;//url参数
		h_fstr ="";
		/*
		if(select_field.SelectedItem!=null&&guangye.GetControlValue(key)!="")
		{
			h_fstr += "&fid="+StringUtility.StringToBase64(guangye.GetControlValue(select_field))+"&key="+StringUtility.StringToBase64(guangye.GetControlValue(key));
		}    
		if(select_Month.SelectedItem!=null&&guangye.GetControlValue(select_Month)!="0")
		{
			h_fstr += "&select_Month="+StringUtility.StringToBase64(guangye.GetControlValue(select_Month));
		}             
		if(select_Year.SelectedItem!=null&&guangye.GetControlValue(select_Year)!="0")
		{
			h_fstr += "&select_Year="+StringUtility.StringToBase64(guangye.GetControlValue(select_Year));
		}             
		if(select_type.SelectedItem!=null&&guangye.GetControlValue(select_type)!="0")
		{
			h_fstr += "&select_type="+StringUtility.StringToBase64(guangye.GetControlValue(select_type));
		} */
		SetSessionFilter();
        Response.Redirect("list_1260.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex=0&pid="+pid+h_fstr);
	}
	private void SetSessionFilter()
	{
		if(select_field.SelectedItem!=null&&guangye.GetControlValue(key)!="")
		{
			//h_fstr += "&fid="+StringUtility.StringToBase64(guangye.GetControlValue(select_field))+"&key="+StringUtility.StringToBase64(guangye.GetControlValue(key));
			SetSESSION("fid", guangye.GetControlValue(select_field));
			SetSESSION("key", guangye.GetControlValue(key));
		}        
		else
		{
			SetSESSION("fid", "");
			SetSESSION("key", "");
		}    
		if(select_Month.SelectedItem!=null&&guangye.GetControlValue(select_Month)!="0")
		{
			//h_fstr += "&select_Month="+StringUtility.StringToBase64(guangye.GetControlValue(select_Month));
			SetSESSION("select_Month", guangye.GetControlValue(select_Month));
		}        
		else
		{
			SetSESSION("select_Month", "0");
		}
		if(select_Year.SelectedItem!=null&&guangye.GetControlValue(select_Year)!="0")
		{
			//h_fstr += "&select_Year="+StringUtility.StringToBase64(guangye.GetControlValue(select_Year));
			SetSESSION("select_Year", guangye.GetControlValue(select_Year));
		}        
		else
		{
			SetSESSION("select_Year", "0");
		}             
		if(select_type.SelectedItem!=null&&guangye.GetControlValue(select_type)!="0")
		{
			//h_fstr += "&select_type="+StringUtility.StringToBase64(guangye.GetControlValue(select_type));
			SetSESSION("select_type", guangye.GetControlValue(select_type));
		}        
		else
		{
			SetSESSION("select_type", "0");
		}            
	}
	private DataTable GetModules()
	{
        db.SqlString= "select modulecode,modulename,modulebrief,moduleuppercode,modulelevel from gmis_module where modulestate=0 and moduleindex asc";           
		return db.GetDataTable();
	}
</script>

<script type="text/javascript">
function toAddNew(arg1,arg2,arg3)
{
    //参数为pid左边目录树选项卡模块编号 参数mid为模块编号(选择中项编号)
    window.parent.frames(1).location = "Nav.aspx?pid="+arg3+"&mid="+arg2+"&closed=1";
    window.parent.frames(3).location = "getpage.aspx?aid="+arg1+"&mid="+arg2+"&id=0"; 
}
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--选项卡-->
    <!--选项卡-->
    <!--操作工具条-->
    <!--#include file="toolbarleft.aspx"-->
	<td nowrap style="padding-left: 10px;">
        选择字段：<asp:DropDownList ID="select_field" runat="server"  style="width: 120px;">
        </asp:DropDownList>
    </td>
    <td nowrap style="padding-left: 10px;">
        关键字：<input id="key" runat="server" type="text" style="width: 100px;" onkeydown="javascript:{if(event.keyCode==13)__doPostBack('btn_seach$btn','');}" />
    </td>
    <td nowrap style="padding-left: 10px;">
        申报日期 年：<asp:DropDownList ID="select_Year" runat="server" OnSelectedIndexChanged="Change_Type"  style="width: 120px;">
        </asp:DropDownList>
    </td>
    <td nowrap style="padding-left: 10px;">
        月：<asp:DropDownList ID="select_Month" runat="server" OnSelectedIndexChanged="Change_Type"  style="width: 60px;">
        </asp:DropDownList>
    </td>
    <td nowrap style="padding-left: 10px;">
        类别：<asp:DropDownList ID="select_type" runat="server" OnSelectedIndexChanged="Change_Type"  style="width: 120px;">
        </asp:DropDownList>
    </td>
    <td nowrap style="padding-left: 10px;">
        <G:Button id="btn_seach" type="toolbar" mode="on" icon="tb08" text="查询" onclick="Click_Seach"
            runat="server">
        </G:Button>
    </td>
    <!--右边固定按钮-->
    <!--#include file="toolbar.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbarright.aspx"-->
    <!--操作工具条-->
    <G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
        <G:Template id="listtemphead" type="head" runat="server">
        </G:Template>
        <G:Template id="listtemp1" runat="server">
        </G:Template>
        <G:Template id="listtemp2" runat="server">
        </G:Template>
        <G:NavStyle5 ID="NavStyle" PageUrl="getpage.aspx" runat="server">
        </G:NavStyle5>
    </G:ListTable>
    <!--动态生成结束-->
    </form>
</body>
</html>
