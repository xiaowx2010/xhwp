<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">

    <script type="text/javascript">
        //alert(window.parent.frames(1).location);
    </script>

</head>
<!--#include file="func.aspx"-->

<script runat="server" language="C#">
    string sortid, sortdir,p_field,p_key,p_type;
    private void Page_Load(object sender, System.EventArgs e)
    {
        
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
        string base_aid=StringUtility.StringToBase64("add");
       
        sortid = GetQueryString("sortid", "0");  //�����ֶ�
        sortdir = GetQueryString("sortdir", "1");  //1����0����
        p_field = GetQueryString("fid", "");  //��ѡ���ֶ�
        p_key = GetQueryString("key", "");  //�ؼ���
		p_type = GetQueryString("type", "0");  //��Ⱦ�����
        /*
        db.SqlString="select moduleuppercode from gmis_module where modulecode="+mid;
        DataTable dt_temp=db.GetDataTable();
        if(dt_temp!=null&&dt_temp.Rows.Count>0)
        {
            if(dt_temp.Rows[0][0].ToString()=="1129"||dt_temp.Rows[0][0].ToString()=="1130")
                Response.Redirect("list_730.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid=730&id="+id+"&navindex="+navindex+"&pid="+pid);
        }
        */
        if(!IsPostBack)
        {
            key.Value=p_key;
            BindListControl(select_type,"mocode","fld_55_1","select mocode,fld_55_1 from gmis_mo_55","-�������-");//����Ⱦ�����
            SetFilter(select_type,p_type);
			BindListControl(select_field,"fieldname","caption",GetListFields(mid));//�������˵�
            SetFilter(select_field,p_field);
            
        }
        
        if(mid=="1215") Response.Redirect("list_1215.aspx?aid="+StringUtility.StringToBase64("list")+"&mid=1215");
		if(mid=="1205"||mid=="1206")//��ˮ��Ⱦ��ģ��ͷ�����Ⱦ��ģ����ʾ��Ⱦ�����ɸѡ
		{
			td_type.Visible = true;
		}
		tb_2.Visible=false;
        if (tb_2.Visible)
        {
            db.SqlString="select moduleuppercode from gmis_module where modulecode ="+mid;
            DataTable h_dt=db.GetDataTable();
            string h_uppercode;//�ϼ�ģ����
            if(h_dt!=null&&h_dt.Rows.Count>0)
            {
                h_uppercode=h_dt.Rows[0][0].ToString();
            }
            else
                h_uppercode="0";
            //������������������Ŀ��
            if(mid!="1205"&&mid!="1206"&&h_uppercode!="1124"&&h_uppercode!="1187")
                btn_newadd.Url = "javascript:toAddNew('" + StringUtility.StringToBase64("edit") + "','" + mid + "','" + GetFieldData("select modulecode from gmis_module where moduleindex =(select left(moduleindex,5) from gmis_module where modulecode="+mid+")") + "')"; 
          
        }
        //if(mid=="988") SetSESSION("extinfo" ,"988");
        BindListData();
		
    }
    
    //��̬����Ŀ�����б�
    private void BindListData()
    {
        db.SqlString="select top 1 mocode from "+GetModuleTableName(mid)+"";
        if(db.GetDataTable().Rows.Count==0)
        {
            db.SqlString= "select modulecode,modulename,modulebrief,moduleuppercode,modulelevel,moduleindex from gmis_module where modulestate=0 order by moduleindex asc";           
            DataRow[] drs = db.GetDataTable().Select("ModuleUpperCode=" + mid + " ", "moduleindex asc");
            if (drs.Length > 0)
            {
                Response.Redirect("list_0.aspx?mid=" + drs[0]["moduleCode"].ToString());
            } 
        }
        DataTable fdt = GetListFields(mid);//�б���ʾ�ֶ�
        StringBuilder fsb = new StringBuilder();//�ֶ�
        StringBuilder ftsb = new StringBuilder();//����
        StringBuilder fcsb = new StringBuilder();//����
        StringBuilder fcsb2 = new StringBuilder();//����
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
                else if (dr["fieldtypecode"].ToString() == "6")//�Ƿ�
                {
                    fsb.Append(",Case when " + dr["fieldname"].ToString() + "=1 then '��' else '��' end");
                }
                else if (dr["fieldtypecode"].ToString() == "7")//����
                {
                    fsb.Append(",Convert(nvarchar(16)," + dr["fieldname"].ToString() + ",120)");
                }
				else if ((mid=="1205"||mid=="1206")&&dr["fieldname"].ToString().ToLower() == "fld_"+mid+"_3")//������Ⱦ�����
				{
					fsb.Append(",(select fld_55_1 from gmis_mo_55 where mocode=fld_"+mid+"_3)");
				}
                else
                {
                    if ((dr["fieldtypecode"].ToString() == "1" && islink) || dr["fieldtypecode"].ToString() != "1")
                    {
                        fsb.Append("," + dr["fieldname"].ToString());
                    }

                }
                dr["oneditlistcolumnwidth"]=(dr["oneditlistcolumnwidth"].ToString()!="0")?dr["oneditlistcolumnwidth"].ToString():"120";
                if (dr["fieldtypecode"].ToString() == "1" && !islink)//����
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
                    fcsb.Append("<td width=\"" + dr["oneditlistcolumnwidth"].ToString() + "\"><span style=\"width:" + dr["oneditlistcolumnwidth"].ToString() + "px;height:24px;overflow:hidden\">*</span></td>\n");
                }
                fcsb2.Append("<td>&nbsp;</td>");
                if (dr["fieldcode"].ToString() == sortid)
                {
                    sortdir = (sortdir == "0") ? "1" : "0";
                    string h_dirstr = (sortdir == "0") ? "����" : "����";
                    string h_dirimg = (sortdir == "0") ? "<img src=\"images/asc.gif\" style=\"margin:3px\" title=\"����\"/>" : "<img src=\"images/desc.gif\" style=\"margin:3px\" title=\"����\" />";
                    ftsb.Append("<td style=\"padding-top:3px;\"  width=\"" + dr["oneditlistcolumnwidth"].ToString() + "\" ><a href=\"list_0.aspx?mid=" + mid + "&navindex=" + navindex + "&sortid=" + dr["fieldcode"].ToString() + "&sortdir=" + sortdir + "&tabid="+tabid+"\" class=\"listtitle\"  title=\"" + dr["caption"].ToString() + h_dirstr + "\">" + dr["caption"].ToString() + "</a>" + h_dirimg + "</td>\n");
                }
                else
                {
                    ftsb.Append("<td width=\"" + dr["oneditlistcolumnwidth"].ToString() + "\"><a href=\"list_0.aspx?mid=" + mid + "&navindex=" + navindex + "&sortid=" + dr["fieldcode"].ToString() + "&sortdir=1&tabid=" + tabid + "\" class=\"listtitle\" title=\"" + dr["caption"].ToString() + "����\">" + dr["caption"].ToString() + "</a></td>\n");
                }
            }
            fcsb.Append("<td  nowrap>*</td>\n");
            fcsb.Append("</tr>\n");
            fcsb2.Append("<td nowrap>&nbsp;</td>\n");
            fcsb2.Append("</tr>\n");
        }
        ftsb.Append("<td width=\"40\" nowrap>����</td>\n");
        ftsb.Append("</tr>\n");      


        if (fsb.Length > 0 )
        {
            listtemphead.InnerHtml = ftsb.ToString();
            listtemp1.InnerHtml = fcsb.ToString();
            listtemp2.InnerHtml = fcsb2.ToString();
            string h_fstr = " ";//ɸѡ����
            
            if(select_field.SelectedItem!=null&&guangye.GetControlValue(key)!="")
                h_fstr+= " and "+select_field.SelectedItem.Value+" like ('%"+guangye.GetControlValue(key)+"%')";
			if(guangye.GetControlValue(select_type)!=""&&guangye.GetControlValue(select_type)!="0")
                h_fstr+= " and fld_"+mid+"_3 = "+guangye.GetControlValue(select_type);
            string h_tablename = GetModuleTableName(mid);//���ݱ�����  
            int pagesize = GetListRows();//��ȡ�б�ÿҳ��ʾ�ļ�¼��
            int fromcount = Convert.ToInt32(navindex) * pagesize;//�����ѷ���ҳ���ļ�¼��  
            //�����б�ؼ���ʾ����
            list.Rows = pagesize;
            list.Visible = (CheckSysObject(h_tablename));
            if(mid=="1153")
            {
                list.SqlStr = "select " + fsb.ToString().Trim(',') + ",'' as btnstr,fld_1153_1 from (select fld_1153_1,fld_1153_2,fld_1153_16,createdate,mocode from  gmis_mo_1153 a where mocode=(select top 1 mocode from gmis_mo_1153 b where a.fld_1153_1=b.fld_1153_1 and a.fld_1153_2=b.fld_1153_2)) t where 1=1 "+h_fstr+ sortstr;
               
            }
            else
            {
                list.SqlStr = "declare @allcount int;select @allcount=count(1) from " + h_tablename + " where 1=1 " + h_fstr + " ;select @allcount as allcount, " + fsb.ToString().Trim(',') + ",'' as btnstr,fld_"+mid+"_1 from " + h_tablename + " a where mocode in (select top " + (fromcount + pagesize) + " mocode from " + h_tablename + " where 1=1 " + h_fstr + " " + sortstr + ") and mocode not in (select top " + fromcount + " mocode from " + h_tablename + " where 1=1 " + h_fstr + "" + sortstr + " ) " + h_fstr + " " + sortstr;
            }
        }
    }
    public override void BeforeOutput(DataTable dt, int rowi)
    {	//����ǰҳ����

        DataRow dr = dt.Rows[rowi];
        if (mua.IndexOf(";3;") != -1)
        {
            //dr["btnstr"] += "<a href=\"javascript:clickGuide('" + StringUtility.StringToBase64("edit") + "','" + mid + "','" + dr["mocode"].ToString() + "','" + navindex + "','"+pid+"')\")><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";    
             dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
        }

        if (mua.IndexOf(";4;") != -1)
        {
            dr["btnstr"] += "<a href=\"javascript:if(confirm('ȷ��ɾ����')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"ɾ��\" align=\"absmiddle\" border=\"0\"></a>";
        }
	    dr["orgcode"] = StringUtility.StringToBase64(dr["fld_"+mid+"_1"].ToString());
    }
    //��ȡ�б���ʾ�ֶ��ֶ�
    private DataTable GetListFields(string mid)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("select f.fieldname,f.caption,f.fieldtypecode,f.fieldcode,f.datalength,f.fieldindex,0 as sortable,f.isprimarykey,f.isvital,f.oneditlist,editlistcolumnwidth as oneditlistcolumnwidth,f.onedit,f.fullline as oneditfullline,f.oneditmust,0 as OnView,0 as OnViewFullLine,0 as sortmode,f.fielddatasrc,f.defaultvalue,fy.fieldtypename,fy.sqlname,case when (isvital=0) then Cast(Replace(fieldname,'fld_'+cast(Modulecode as varchar(50))+'_','') as int) else 0 end as fldindex from gmis_field f left outer join gmis_fieldtype fy on f.fieldtypecode=fy.fieldtypecode ");
        sb.Append(" where (oneditlist=1 or caption='����' or caption='����') and Modulecode=" + mid);
        sb.Append(" order by fieldindex asc");
        db.SqlString = sb.ToString();
        //Response.Write(sb.ToString()+"<br>");
        return db.GetDataTable();
    }
    private void Click_Seach(object sender, System.EventArgs e)
    {   
        string h_fstr;//url����
		h_fstr ="";
		if(guangye.GetControlValue(select_type)!=""&&guangye.GetControlValue(select_type)!="0")
		{
			h_fstr += "&type="+guangye.GetControlValue(select_type);
		}
		if(select_field.SelectedItem!=null&&guangye.GetControlValue(key)!="")
		{
			h_fstr += "&fid="+StringUtility.StringToBase64(guangye.GetControlValue(select_field))+"&key="+StringUtility.StringToBase64(guangye.GetControlValue(key));
		}            
        Response.Redirect("list_0.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex=0&pid="+pid+h_fstr);
    }
	//��Ⱦ�����
    private void Change_Type(object sender, System.EventArgs e)
    {
		string h_fstr;//url����
		h_fstr ="";
		if(guangye.GetControlValue(select_type)!=""&&guangye.GetControlValue(select_type)!="0")
		{
			h_fstr += "&type="+guangye.GetControlValue(select_type);
		}
		if(select_field.SelectedItem!=null&&guangye.GetControlValue(key)!="")
		{
			h_fstr += "&fid="+StringUtility.StringToBase64(guangye.GetControlValue(select_field))+"&key="+StringUtility.StringToBase64(guangye.GetControlValue(key));
		}            
        Response.Redirect("list_0.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex=0&pid="+pid+h_fstr);
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
    //����Ϊpid���Ŀ¼��ѡ�ģ���� ����midΪģ����(ѡ��������)
    window.parent.frames(1).location = "Nav.aspx?pid="+arg3+"&mid="+arg2+"&closed=1";
    window.parent.frames(3).location = "getpage.aspx?aid="+arg1+"&mid="+arg2+"&id=0"; 
}
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--ѡ�-->
    <!--ѡ�-->
    <!--����������-->
    <!--#include file="toolbarleft.aspx"-->
	<!--��Ⱦ�����ɸѡ-->
    <td id="td_type" visible=false nowrap runat=server>
       ��Ⱦ�����<asp:DropDownList ID="select_type" AutoPostBack="true" OnSelectedIndexChanged="Change_Type" runat="server" >
        </asp:DropDownList>
    </td>
	<!--��Ⱦ�����ɸѡ-->
	<td nowrap style="padding-left: 10px;">
        ѡ���ֶΣ�<asp:DropDownList ID="select_field" runat="server"  style="width: 120px;">
        </asp:DropDownList>
    </td>
    <td nowrap style="padding-left: 10px;">
        �ؼ��֣�<input id="key" runat="server" type="text" style="width: 100px;" onkeydown="javascript:{if(event.keyCode==13)__doPostBack('btn_seach$btn','');}" />
    </td>
    <td nowrap style="padding-left: 10px;">
        <G:Button id="btn_seach" type="toolbar" mode="on" icon="tb08" text="��ѯ" onclick="Click_Seach"
            runat="server">
        </G:Button>
    </td>
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbar.aspx"-->
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbarright.aspx"-->
    <!--����������-->
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
    <!--��̬���ɽ���-->
    </form>
</body>
</html>
