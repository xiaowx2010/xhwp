<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<script language="c#" runat="server">
string orgcode,fcode;
private void Page_Load(object sender, System.EventArgs e)
{
    SetToolBar();//设置工具条,同时获取固定URL参数
    fcode = GetQueryString("fcode", "");
    string orgcode = GetQueryString("orgcode", "0");
    if (fcode != "")
    {
        tools.Visible = false;
    }
    if(mid=="21"||mid=="29")
    {
        //Response.Redirect("list_"+mid+"_xuanxiangkaguanlianliebiaoye.aspx?mid=" + mid + "&orgcode=" +StringUtility.StringToBase64(orgcode));
    } 
    iframe_17.Attributes["src"] = "iframe_17.aspx?mid=" + mid + "&orgcode=" +StringUtility.StringToBase64(orgcode) + "&fcode="+fcode; 
    BindListData(orgcode);
}
 private void BindListData(string orgcode)
    {

        DataTable fdt = GetListFields(mid);//列表显示字段
        StringBuilder fsb = new StringBuilder();//字段
        StringBuilder ftsb = new StringBuilder();//标题
        StringBuilder fcsb = new StringBuilder();//内容
        StringBuilder fcsb2 = new StringBuilder();//空行
        ftsb.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\"  class=\"righttableline\">\n<tr class=\"tr_listtitle\" align=\"left\">\n");
        if (fdt.Rows.Count > 0)
        {        
            fcsb.Append("<tr class=\"tr_listcontent\">\n");           
            fcsb2.Append("<tr class=\"tr_listcontent\">\n");  
        
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
                    fsb.Append(",Convert(nvarchar(16)," + dr["fieldname"].ToString() + ",120)");
                }
              <%--    else if (dr["fieldtypecode"].ToString() == "2"&&mid=="27")//整型,关联数据表
                {
                
                    fsb.Append(",(select fld_62_1 from gmis_mo_62 where mocode=" + dr["fieldname"].ToString() + ")");
                }--%>
                else
                {
                    if (((dr["fieldtypecode"].ToString() == "1" && islink) || dr["fieldtypecode"].ToString() != "1")&&!(dr["fieldtypecode"].ToString()=="2"&&mid=="27"))
                    {
                        fsb.Append("," + dr["fieldname"].ToString());
                    }

                }
                dr["oneditlistcolumnwidth"]=(dr["oneditlistcolumnwidth"].ToString()!="0")?dr["oneditlistcolumnwidth"].ToString():"50";
                if (dr["fieldtypecode"].ToString() == "1" && !islink)//短语
                {
                    fsb.Append(",mocode");
                    fsb.Append("," + dr["fieldname"].ToString());
                    fsb.Append("," + dr["fieldname"].ToString() + " as chtitle");
                    islink = true;
                    fcsb.Append("<td nowrap width=\"" + dr["oneditlistcolumnwidth"].ToString() + "%\">");
                    fcsb.Append("<a href=\"" + h_url + "?aid="+StringUtility.StringToBase64("view")+"&mid=" + mid + "&id=*&tabid=" + tabid + "&navindex=" + navindex + "&fcode="+fcode+"\" title=\"*\">*</a>&nbsp;</td>\n");
                }
               else if (dr["fieldtypecode"].ToString() == "2" && !islink && mid=="27")//燃料种类
                {
                    fsb.Append(",mocode");
                    fsb.Append(",(select fld_62_1 from gmis_mo_62 where mocode=" + dr["fieldname"].ToString() + ")");
                    fsb.Append(",(select fld_62_1 from gmis_mo_62 where mocode=" + dr["fieldname"].ToString() + ") as chtitle");
                    islink = true;
                    fcsb.Append("<td nowrap width=\"" + dr["oneditlistcolumnwidth"].ToString() + "%\">");
                    fcsb.Append("<a href=\"" + h_url + "?aid="+StringUtility.StringToBase64("view")+"&mid=" + mid + "&id=*&tabid=" + tabid + "&navindex=" + navindex + "&fcode="+fcode+"\" title=\"*\" >*</a>&nbsp;</td>\n");
                }
                else
                {
                    fcsb.Append("<td nowrap  width=\"" + dr["oneditlistcolumnwidth"].ToString() + "%\">*&nbsp;</td>\n");
                }
               fcsb2.Append("<td nowrap>&nbsp;</td>");
                            ftsb.Append("<td nowrap>" + dr["caption"].ToString() + "&nbsp;</td>\n");

            }
            //fcsb.Append("<td nowrap>*&nbsp;</td>\n");
            fcsb.Append("</tr>\n");
            //fcsb2.Append("<td nowrap>&nbsp;</td>\n");
            fcsb2.Append("</tr>\n");
        }
         //ftsb.Append("<td nowrap width=\"40\" nowrap>&nbsp;</td>\n");
        ftsb.Append("</tr>\n");      


        if (fsb.Length > 0 )
        {
            listtemphead.InnerHtml = ftsb.ToString();
            listtemp1.InnerHtml = fcsb.ToString();
            listtemp2.InnerHtml = fcsb2.ToString();
            string h_fstr = " ";//筛选条件
            if(mid=="18")  h_fstr= " and fld_18_8='"+orgcode+"'";            
            if(mid=="25")  h_fstr=" and fld_25_14='"+orgcode+"'";
             if(mid=="26")  h_fstr=" and fld_26_6='"+orgcode+"'";
             if(mid=="27")  h_fstr=" and fld_27_4='"+orgcode+"'";
             if(mid=="28")  h_fstr=" and fld_28_12='"+orgcode+"'";
              if(mid=="53")  h_fstr=" and fld_53_3='"+orgcode+"'";
              if(mid=="57") h_fstr=" and fld_57_6='"+orgcode+"'";
               if(mid=="66") h_fstr= " and fld_66_7='"+orgcode+"'";
               if(mid=="127") h_fstr= " and fld_127_6='"+orgcode+"'";
               if(mid=="23") h_fstr= " and fld_23_3='"+orgcode+"'";
                if(mid=="24") h_fstr= " and fld_24_8='"+orgcode+"'";
                 if(mid=="35") h_fstr= " and fld_35_7='"+orgcode+"'";
                 if(mid=="21") h_fstr= " and fld_21_5='"+orgcode+"'";
                 if(mid=="29") h_fstr= " and fld_29_5='"+orgcode+"'";
            string h_tablename = GetModuleTableName(mid);//数据表名称  
            int pagesize = GetListRows();//获取列表每页显示的记录数
            int fromcount = Convert.ToInt32(navindex) * pagesize;//计算已翻过页数的记录数  
            //设置列表控件显示行数
            list.Rows = pagesize;
            list.Visible = (CheckSysObject(h_tablename));

        //if(mid=="21"||mid=="29")
        //{
          //list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + h_tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount, " + fsb.ToString().Trim(',') + ",'' as btnstr from " + h_tablename + " where mocode in (select top " + (fromcount + pagesize) + " mocode from " + h_tablename + " where 1=1 " + h_fstr + ") and mocode not in (select top " + fromcount + " mocode from " + h_tablename + " where 1=1 " + h_fstr + " ) " + h_fstr + " ";
        //}
        //else
        //{
          list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + h_tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount, " + fsb.ToString().Trim(',') + " from " + h_tablename + " where mocode in (select top " + (fromcount + pagesize) + " mocode from " + h_tablename + " where 1=1 " + h_fstr + ") and mocode not in (select top " + fromcount + " mocode from " + h_tablename + " where 1=1 " + h_fstr + " ) " + h_fstr + " ";
        //}/**********,'' as btnstr*******************/

        }
        

    }
  private DataTable GetListFields(string mid)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("select f.fieldname,f.caption,f.fieldtypecode,f.fieldcode,f.datalength,f.fieldindex,0 as sortable,f.isprimarykey,f.isvital,f.oneditlist,editlistcolumnwidth as oneditlistcolumnwidth,f.onedit,f.fullline as oneditfullline,f.oneditmust,0 as OnView,0 as OnViewFullLine,0 as sortmode,f.fielddatasrc,f.defaultvalue,fy.fieldtypename,fy.sqlname,case when (isvital=0) then Cast(Replace(fieldname,'fld_'+cast(Modulecode as varchar(50))+'_','') as int) else 0 end as fldindex from gmis_field f left outer join gmis_fieldtype fy on f.fieldtypecode=fy.fieldtypecode ");
        sb.Append(" where oneditlist=1 and Modulecode=" + mid);
        if(mid=="21"||mid=="29")
        {
        sb.Append(" order by fieldindex desc");
        }
        else
        {
        sb.Append(" order by fieldindex asc");
        }
        db.SqlString = sb.ToString();
        //Response.Write(db.SqlString);
        return db.GetDataTable();
    }
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--选项卡-->
    <!--选项卡-->
    <!--操作工具条-->
    <div id="tools" runat="server">
    <!--#include file="toolbarleft.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbar_17.aspx"-->
    <!--右边固定按钮-->
    <!--#include file="toolbarright.aspx"-->
    <!--操作工具条-->
    </div>
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td>
<iframe id="iframe_17"  runat="server" frameborder="0"  width="100%" height="30" scrolling="no"></iframe>
</td></tr></table>
<table width="100%" ><tr><td>
    <G:ListTable ID="list" style="width:100%"  Rows="20" IsProPage="true" runat="server">
        <G:Template id="listtemphead" type="head" runat="server">
        </G:Template>
        <G:Template id="listtemp1" runat="server">
        </G:Template>
        <G:Template id="listtemp2" runat="server">
        </G:Template>
        <G:NavStyle5 ID="NavStyle" PageUrl="getpage.aspx" runat="server">
        </G:NavStyle5>
    </G:ListTable></td></tr></table>
    <!--动态生成结束-->
    </form>
</body>
</html>
