<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat=server language=C#>
	private void Page_Load(object sender, System.EventArgs e)
	{	
		string mbrief="", mesiscode = "";		
		mid = (Request.QueryString.Get("mid") == null || Request.QueryString.Get("mid") == "" || !CheckSqlInjection(Request.QueryString.Get("mid"),0))?"0":Request.QueryString.Get("mid");
		id = (Request.QueryString.Get("id") == null || Request.QueryString.Get("id") == ""  || !CheckSqlInjection(Request.QueryString.Get("id"),0))?"0":Request.QueryString.Get("id");
		pid = (Request.QueryString.Get("pid") == null)?"":Request.QueryString.Get("pid").Trim();
		navindex = (Request.QueryString.Get("navindex") == null || Request.QueryString.Get("navindex") == "" || !CheckSqlInjection(Request.QueryString.Get("navindex"),0))?"0":Request.QueryString.Get("navindex");
		tid = (Request.QueryString.Get("tid") == null || Request.QueryString.Get("tid") == ""  || !CheckSqlInjection(Request.QueryString.Get("tid"),0))?"0":Request.QueryString.Get("tid");
		newid = (Request.QueryString.Get("newid") == null || Request.QueryString.Get("newid") == ""  || !CheckSqlInjection(Request.QueryString.Get("newid"),0))?"0":Request.QueryString.Get("newid");	
		if(Request.QueryString.Get("aid") == null )
		{
			Session["attention"]="";
			Session["filter"] = "";	//如果从导航栏进入则清空
			Session["areafilter"]="";
			Session["typefilter"]="";			
			Session["StarTime"]="";
			Session["EndTime"]="";
			Session["ZhuangTai"]="";
			Session["keywordfilter"]="";
			Session["XiangMu"]="";
			Session["MainUrl"]="";
			Session["Extsql"]="";
			Session["statusSql"]="";
			Session["way"]="";	
			Session["filter_dept"]="";
			Session["filter_state"]="";
			Session["filter_type"]="";
			Session["filter_person"]="";
			Session["filter_year"]="";
			Session["filter_month"]="";
			Session["filter_syear"]="";
			Session["filter_smonth"]="";
			Session["filter_eyear"]="";
			Session["filter_emonth"]="";
			Session["filter_day"]="";
			Session["modulegroupfilter"]="";
			Session["levelfilter"]="";
			Session["modulefilter"]="";
			Session["html"]="";
			if(mid!="47"&&mid!="33")
			{
				aid = "list";
			}
			else
			{
				aid = "add";
			}			
		}
		else
		{
			aid = (Request.QueryString.Get("aid") == null || !CheckSqlInjection(Request.QueryString.Get("aid"),3))?"list":Request.QueryString.Get("aid").Trim();
		}	
		if(aid=="login" && mid=="1")
		{
			mid = GetTopModule();				
			if(mid == "" || mid=="0")				
				Response.Redirect("login.aspx?aid=login&mid=1&pid=1");
			else//默认登录到个人桌面
				Response.Redirect("desktop.aspx");
			aid="list";
		}	
		mbrief=GetModuleBrief(mid);
		   if(aid=="change")
        {
            string tname = "gmis"+mbrief;	
		    string pname = GetPK(tname);//
		    string qname="";
		    if(mid=="11")
		    {
				qname="fld_11_4";
			}
			if(mid=="18")
			{
			   qname="fld_18_9";
			}
		    Session["sql"] = "update "+tname+" set "+qname+"='1'  where "+pname+"="+id;
			Response.Redirect("execommand.aspx?mid="+mid+"&aid=change&id="+id+"&navindex="+navindex);
        }
		if(aid == "delete")
		{			
			string tname = "gmis"+mbrief;	
			if(mid=="10" || mid=="11" || mid=="12")
			{
				tname="gmis_feature";
			}								
			string pname = GetPK(tname);//
			Session["sql"] = "delete from "+tname+" where "+pname+"="+id;
			//Response.Write(Session["sql"]);
			if(mid=="3" && id!="0") {//删除字段
				StringBuilder sql=new StringBuilder();
				DBsql.SqlString="select fieldname,modulecode from "+tname+" where "+pname+"="+id;
				//Response.Write(DBsql.SqlString);
				DataTable idt=DBsql.GetDataTable();
				if(idt.Rows.Count>0){
					string tablename="gmis"+GetModuleBrief(idt.Rows[0]["modulecode"].ToString());
					DBsql.SqlString="select * from sysobjects where id = object_id('"+tablename+"')";//判断表是否存在
					//Response.Write(DBsql.SqlString);
					DataTable dtt=DBsql.GetDataTable();
					if(dtt.Rows.Count>0){
						DBsql.SqlString="select b.name from syscolumns a,sysobjects b where a.id=object_id('"+tablename+"') and b.id=a.cdefault and a.name='"+idt.Rows[0]["fieldname"].ToString()+"' and b.name like 'DF%'";			
						DataTable dt=DBsql.GetDataTable();
						if(dt.Rows.Count>0)
						{
							sql.Append("; ALTER TABLE "+tablename+" DROP CONSTRAINT "+dt.Rows[0][0].ToString()+"");
						}
						sql.Append("; IF NOT EXISTS (SELECT * FROM syscolumns WHERE name='"+idt.Rows[0]["fieldname"].ToString()+"' AND id =object_id ('"+tablename+"')) ");
						sql.Append("RAISERROR ('无法删除，该列已不存在！', 16, 1) ELSE ");
						sql.Append("ALTER TABLE "+tablename+" DROP COLUMN "+idt.Rows[0]["fieldname"].ToString()+";");
						Session["sql"]+=sql.ToString();
					}
														
				}	
			}
			 if(mid=="31")
	        {
	            Session["sql"]="update gmis_mo_31 set fld_31_6='-1' where mocode="+id;
	            Response.Redirect("execommand_iframe.aspx?mid="+mid+"&aid=delete&id="+id+"&tid="+tid+"&navindex="+navindex);
	        }
	        else if (mid=="43")
	        {
				Session["sql"]+=";delete from gmis_mo_44 where fld_44_2="+id;
				Response.Redirect("execommand.aspx?mid="+mid+"&aid=delete&id="+id+"&navindex="+navindex);
	        }
	        else if(mid=="52")
	        {
				Session["sql"]+=";delete from gmis_mo_48 where fld_48_1="+id+" ; delete from gmis_mo_49 where fld_49_1="+id+"";
				Response.Redirect("execommand.aspx?mid="+mid+"&aid=delete&id="+id+"&navindex="+navindex);
	        }
	        else
	        {
				Response.Redirect("execommand.aspx?mid="+mid+"&aid=delete&id="+id+"&navindex="+navindex);
	        }
		
			
		}
		else if(aid=="restore"||aid=="transmit")
		{
			if(mid=="31")
			{
				Session["sql"]="update gmis_mo_31 set fld_31_6='0' where mocode="+id;
				Response.Redirect("execommand_iframe.aspx?mid="+mid+"&aid=delete&id="+id+"&tid="+tid+"&navindex="+navindex);	
			}
			else if(mid=="56")
			{
				Session["sql"]="update gmis_fold set foldstate=0 where foldcode="+id+" or foldcode=(select folduppercode from gmis_fold where foldcode="+id+")";
				Response.Redirect("execommand_iframe.aspx?mid="+mid+"&aid=delete&id="+id+"&tid="+tid+"&navindex="+navindex);	
			}
			else
			{
				Response.Redirect("edit"+mbrief.Replace("Mo_","")+".aspx?aid="+aid+"&mid="+mid+"&tid="+tid+"&id="+id+"&newid="+newid+"&navindex="+navindex);
			}
		}
		else if(aid=="rdelete")
		{
			if(mid=="31")
			{
				Session["sql"]="delete from gmis_mo_31  where mocode="+id;
				Response.Redirect("execommand_iframe.aspx?mid="+mid+"&aid=delete&id="+id+"&tid="+tid+"&navindex="+navindex);
			}
			else if(mid=="56")
			{
				Session["sql"]="update gmis_fold set folduppercode = (select folduppercode from gmis_fold where foldcode="+id+") where folduppercode="+id+";update gmis_fold set foldlevel=foldlevel-1 where foldcode<>"+id+" and foldindex like '%'+(select foldindex from gmis_fold where foldcode="+id+")+'%';delete gmis_mo_31 where fld_31_4="+id+";delete gmis_fold where foldcode="+id;
				Response.Redirect("execommand_iframe.aspx?mid="+mid+"&aid=delete&id="+id+"&tid="+tid+"&navindex="+navindex);
			}
		}
		else if(aid=="baofei")
		{			
			if(mid=="32")
			{
				Session["sql"]="UPDATE gmis_mo_32 set fld_32_8=-1 where mocode="+id;
			}
			Response.Redirect("execommand.aspx?mid="+mid+"&pid="+pid+"&id="+id+"&navindex="+navindex);
		}
		else if(aid=="zhuanmai")
		{			
			if(mid=="32")
			{
				Session["sql"]="UPDATE gmis_mo_32 set fld_32_8=2 where mocode="+id;
			}
			Response.Redirect("execommand.aspx?mid="+mid+"&pid="+pid+"&id="+id+"&navindex="+navindex);
		}
		else
		{		
			//Response.Write(mbrief);	
			if(aid == "add"){aid = "edit";id = "0";}
			if(mid=="28"||mid=="19"||mid=="33")
			{
				Response.Redirect("edit_"+mid+".aspx?aid=edit&mid="+mid+"&tid="+tid+"&id="+id+"&newid="+newid+"&navindex="+navindex);

			}						
			else
			{
				Response.Redirect(aid+mbrief.Replace("Mo_","")+".aspx?aid="+aid+"&mid="+mid+"&tid="+tid+"&id="+id+"&newid="+newid+"&navindex="+navindex);
			}
			
			
		}
	}
</script>