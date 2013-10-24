<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Import Namespace="System.IO" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat="server" language="C#">
	private void Page_Load(object sender, System.EventArgs e)
	{	
	    string h_mbrief="",h_mtable="";
	    mid = GetQueryString("mid", "0");
        aid = GetQueryString("aid", "");
        id = GetQueryString("id", "0");
        pid=GetQueryString("pid", "0");
        navindex = GetQueryString("navindex", "0");
        tabid=GetQueryString("tabid", "0");
        string fcode = GetQueryString("fcode", "");
	    if(aid=="")
	    {
	        ClearSESSION();//清空除登录信息以外的SESSION
	   
	        aid="list";
	    }	    
        
	    if(mid!="0")
	    {
	        SetSESSION("xuanxiangkamid", mid);
	        h_mbrief=GetModuleBrief(mid);
	        try
	        {
	            Convert.ToInt32(h_mbrief);
	            h_mtable="gmis_Mo_"+h_mbrief;
	        }
	        catch
	        {
	            h_mtable="gmis_"+h_mbrief;
	        }
	    }	    
	    if(aid=="delete")//删除
	    {
	        string h_sqlstr="Delete from  "+h_mtable+" where "+GetPK(h_mtable)+"="+id+"";
	        /*删除其它相关数据*/
	        string h_fieldstr=GetFieldName(mid,"单位代码");

			if(h_fieldstr!="")
	        {
				string h_orgcode=GetFieldData("select top 1 "+h_fieldstr+" from "+h_mtable+" where "+GetPK(h_mtable)+"="+id+"");
				if(h_orgcode!="")//取到单位代码
				{	            
					string h_featurecode=GetFieldData("select top 1 featurecode from gmis_mo_1197 where modulecode="+mid+" and orgcode='"+h_orgcode+"'");   
					//有地图数据
					if(h_featurecode!="")
					{   
						//如果仅有一条数据关系地图，删除地图数据   
						h_sqlstr+=";if exists(select 1 from gmis_feature where featurecode="+h_featurecode+") delete from gmis_feature where featurecode="+h_featurecode+" and (select count(1) from gmis_mo_1197 where featurecode="+h_featurecode+")=1";
					}
					//删除关系表数据；
					h_sqlstr+=";if exists(select 1 from gmis_mo_1197 where modulecode="+mid+" and orgcode='"+h_orgcode+"') delete from gmis_mo_1197 where modulecode="+mid+" and orgcode='"+h_orgcode+"'";  
				}   
	        }
			string h_pfkcode;
			switch (mid)
			{
				case "19"://污水扩展表删除(同时判断当年是否没有数据。没有则同时删除年表当年数据)
				case "58"://废气扩展表删除(同时判断当年是否没有数据。没有则同时删除年表当年数据)
					string h_soncode = (mid=="19")?"20":"59";//对应的年报表
					string h_extcode = (mid=="19")?"1209":"1210";//对应的扩展表
					h_sqlstr = "declare @year as int,@code as varchar(50);select @year=fld_"+mid+"_3 from gmis_mo_"+mid+" where mocode="+id+";select @code=fld_"+mid+"_2 from gmis_mo_"+mid+" where mocode="+id+";if not exists (select mocode from gmis_mo_"+mid+" where fld_"+mid+"_3=@year and fld_"+mid+"_2=@code and mocode <>"+id+") begin delete gmis_mo_"+h_soncode+" where fld_"+h_soncode+"_2=@year and fld_"+h_soncode+"_1=@code end;delete gmis_mo_"+mid+" where mocode="+id+";delete gmis_mo_"+h_extcode+" where fld_"+h_extcode+"_1="+id+"";
					break;
				case "21"://删除的同时，一并删除gmis_mo_1197表（数据库关联表），并将排放口表数据表中，所有含有该污染物的记录，进行更新
				case "29"://删除的同时，一并删除gmis_mo_1197表（数据库关联表），并将排放口表数据表中，所有含有该污染物的记录，进行更新
					string h_uppercode = (mid=="21")?"53":"23";//对应的排放口modulecode
					h_sqlstr += ";delete gmis_mo_1197 where datamocode=" + id + " and modulecode="+mid+";update gmis_mo_"+h_uppercode+" set fld_"+h_uppercode+"_11 = replace(';'+fld_"+h_uppercode+"_11+';',';"+id+";','') where ';'+fld_"+h_uppercode+"_11+';' like '%;"+id+";%'";
					break;
				case "53"://删除污水排放口，及对应的监测数据，同时删除对应于gmis_mo_1197表中的数据,以及对应的所有年月报表数据
					h_pfkcode = GetFieldData("select top 1 fld_53_1 from gmis_mo_53 where mocode="+id+"");//获取排放口代码
					if(h_pfkcode!="")
					{						
						h_sqlstr += ";delete gmis_mo_1197 where modulecode=18 and datamocode in (select mocode from gmis_mo_18 where fld_18_1='"+h_pfkcode+"');delete gmis_mo_18 where fld_18_1='"+h_pfkcode+"';delete gmis_mo_19 where fld_19_2='"+h_pfkcode+"';delete gmis_mo_20 where fld_20_1='"+h_pfkcode+"';delete gmis_mo_1209 where fld_1209_1 in (select mocode from gmis_mo_19 where fld_19_2='"+h_pfkcode+"')";				
					}
					break;
				case "23"://删除废气排放口，及对应的监测数据和锅炉炉窑数据，同时删除对应于gmis_mo_1197表中的数据,以及对应的所有年月报表数据
					h_pfkcode = GetFieldData("select top 1 fld_23_1 from gmis_mo_23 where mocode="+id+"");//获取排放口代码
					if(h_pfkcode!="")
					{
						h_sqlstr += ";delete gmis_mo_1197 where modulecode=24 and datamocode in (select mocode from gmis_mo_24 where fld_24_1='"+h_pfkcode+"');delete gmis_mo_24 where fld_24_1='"+h_pfkcode+"';delete gmis_mo_58 where fld_58_2='"+h_pfkcode+"';delete gmis_mo_59 where fld_59_1='"+h_pfkcode+"';delete gmis_mo_1210 where fld_1210_1 in (select mocode from gmis_mo_58 where fld_58_2='"+h_pfkcode+"');delete gmis_mo_1197 where modulecode=25 and datamocode in (select mocode from gmis_mo_25 where fld_25_15='"+h_pfkcode+"');delete gmis_mo_25 where fld_25_15='"+h_pfkcode+"'";
						
					}
					break;
				case "17"://删除污染源，需对应删除关联的污水污染物排放许可、废气污染物排放许可、污水排放口、废气排放口、能源消耗、主要产品及原辅材料、大气治理设施、污水监测、废气监测、锅炉炉窑、污水月年报及扩展表、废气月年报及扩展表，以及他们所对应于gmis_mo_1197表中的数据
					string h_orgcode=GetFieldData("select top 1 fld_17_1 from gmis_mo_17 where mocode="+id+"");//获取单位代码
					h_sqlstr += ";delete gmis_mo_1197 where modulecode in (53,27,28,26,23,18,25,24,29,21) and orgcode='"+h_orgcode+"';delete gmis_mo_29 where fld_29_3='"+h_orgcode+"';delete gmis_mo_21 where fld_21_3='"+h_orgcode+"';delete gmis_mo_53 where fld_53_3='"+h_orgcode+"';delete gmis_mo_23 where fld_23_3='"+h_orgcode+"';delete gmis_mo_27 where fld_27_4='"+h_orgcode+"';delete gmis_mo_28 where fld_28_12='"+h_orgcode+"';delete gmis_mo_26 where fld_26_6='"+h_orgcode+"';delete gmis_mo_18 where fld_18_8='"+h_orgcode+"';delete gmis_mo_24 where fld_24_8='"+h_orgcode+"';delete gmis_mo_25 where fld_25_14='"+h_orgcode+"';delete gmis_mo_20 where fld_20_1 in (select fld_19_2 from gmis_mo_19 where fld_19_1='"+h_orgcode+"');delete gmis_mo_1209 where fld_1209_1 in (select mocode from gmis_mo_19 where fld_19_1='"+h_orgcode+"');delete gmis_mo_19 where fld_19_1='"+h_orgcode+"';delete gmis_mo_59 where fld_59_1 in (select fld_58_2 from gmis_mo_58 where fld_58_1='"+h_orgcode+"');delete gmis_mo_1210 where fld_1210_1 in (select mocode from gmis_mo_58 where fld_58_1='"+h_orgcode+"');delete gmis_mo_58 where fld_58_1='"+h_orgcode+"'";
					break;
				case "1241":
				    h_sqlstr+=";delete gmis_mo_1242 where fld_1242_1='"+id+"';delete gmis_mo_1243 where fld_1243_6='"+id+"'";
				    break;
				case "1244":
				    h_sqlstr+="delete gmis_mo_1255 where fld_1255_1='"+id+"';delete gmis_mo_1256 where fld_1256_1='"+id+"';delete gmis_mo_1257 where fld_1257_1='"+id+"';delete gmis_mo_1258 where fld_1258_1='"+id+"';delete gmis_mo_1259 where fld_1259_1='"+id+"'";
			        break;
			}	       
			
			
			 
	        if(GetModuleName(mid) == "字段管理" && pid!="0")
	        {
    	        h_sqlstr="Update gmis_field set fieldindex=(fieldindex-1) where modulecode=" + pid + " and fieldindex>(select fieldindex from gmis_field where fieldcode="+id+") ;"+h_sqlstr;    	       
                string tablename_t="";
                string h_mbrief_t=GetModuleBrief(pid);               
                try
                {
                    Convert.ToInt32(h_mbrief_t);
                    tablename_t="gmis_Mo_"+h_mbrief_t;
                }
                catch
                {
                    tablename_t="gmis_"+h_mbrief_t;
                }
                db.SqlString="select fieldname from gmis_field where fieldcode="+id;               
                string fieldname="";
                if(db.GetDataTable().Rows.Count>0)
                {
                    fieldname=db.GetDataTable().Rows[0]["fieldname"].ToString();
                }
                
                if (tablename_t != "" && CheckSysObject(tablename_t) && CheckSysColumn(tablename_t, fieldname))//表存在，且字段存在于表
                {                        
                    string exesql = "";
                    db.SqlString= "select b.name from syscolumns a,sysobjects b where a.id=object_id('" + tablename_t + "') and b.id=a.cdefault and a.name='" + fieldname + "' and b.name like 'DF%'";
                    DataTable dt = db.GetDataTable();
                    if (dt.Rows.Count > 0)
                    {
                        h_sqlstr += ";ALTER TABLE " + tablename_t + " DROP CONSTRAINT " + dt.Rows[0]["name"].ToString() + "";
                    }                    
                     h_sqlstr+=";ALTER TABLE " + tablename_t + " DROP COLUMN " + fieldname + "";
                    
                }
	        }
	        
	        
	        SetSESSION("sql",h_sqlstr);
	        
	        Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&id="+id+"&pid="+pid+"&tabid="+tabid);
	    }	    
	    else
	    {	 
			
			aid=(aid=="add")?"edit":aid;
			string h_filedir=Server.MapPath("\\");
			if(System.Configuration.ConfigurationSettings.AppSettings["FILE_DIRECTORY"]!=null && System.Configuration.ConfigurationSettings.AppSettings["FILE_DIRECTORY"].ToString()!="")
			{
				h_filedir+=System.Configuration.ConfigurationSettings.AppSettings["FILE_DIRECTORY"].TrimStart('\\');
			}
			else
			{
				h_filedir+="\\Admin\\";
			}
						
			if(mid == "1123" || mid == "1124")
			{
			    Response.Redirect(aid+"_1123.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
			}
			if(File.Exists(h_filedir+aid+"_"+h_mbrief+".aspx"))
			{
				Response.Redirect(aid+"_"+h_mbrief+".aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
				
			}
			else
			{
				 string h_newmid=GetFirstRightModule(mid);//获取直属下级第一个有权限的模块编号
				 if(h_newmid!="0")
				 {
				   mid=h_newmid;
				 }
				 
				h_mbrief=GetModuleBrief(mid);			
				
				if(File.Exists(h_filedir+aid+"_"+h_mbrief+".aspx"))
				{   
				    Response.Redirect(aid+"_"+h_mbrief+".aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
				}else if(File.Exists(h_filedir+aid+"_0.aspx"))
				{
				    if(mid=="1118")//各地区生活及其他污染情况 环年综6表
				        Response.Redirect(aid+"_"+mid+".aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
					if(mid=="1260" && aid=="list")//拉过来的数据
				        Response.Redirect(aid+"_"+mid+".aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
					if(mid=="1390" && aid=="list")//对比报表
				        Response.Redirect(aid+"_"+mid+".aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
				    else
				        Response.Redirect(aid+"_0.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
				}
				//Response.Write(h_filedir+aid+"_"+h_mbrief+".aspx"+"   "+mid);
			}
			
	    }
	}
</script>
<div style="color:red;font-size:12px;margin-top:50px;" align=center>正在建设中…… <a href="#" target="_blank">上海雨和信息技术有限公司</a></div>
