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
	        ClearSESSION();//��ճ���¼��Ϣ�����SESSION
	   
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
	    if(aid=="delete")//ɾ��
	    {
	        string h_sqlstr="Delete from  "+h_mtable+" where "+GetPK(h_mtable)+"="+id+"";
	        /*ɾ�������������*/
	        string h_fieldstr=GetFieldName(mid,"��λ����");

			if(h_fieldstr!="")
	        {
				string h_orgcode=GetFieldData("select top 1 "+h_fieldstr+" from "+h_mtable+" where "+GetPK(h_mtable)+"="+id+"");
				if(h_orgcode!="")//ȡ����λ����
				{	            
					string h_featurecode=GetFieldData("select top 1 featurecode from gmis_mo_1197 where modulecode="+mid+" and orgcode='"+h_orgcode+"'");   
					//�е�ͼ����
					if(h_featurecode!="")
					{   
						//�������һ�����ݹ�ϵ��ͼ��ɾ����ͼ����   
						h_sqlstr+=";if exists(select 1 from gmis_feature where featurecode="+h_featurecode+") delete from gmis_feature where featurecode="+h_featurecode+" and (select count(1) from gmis_mo_1197 where featurecode="+h_featurecode+")=1";
					}
					//ɾ����ϵ�����ݣ�
					h_sqlstr+=";if exists(select 1 from gmis_mo_1197 where modulecode="+mid+" and orgcode='"+h_orgcode+"') delete from gmis_mo_1197 where modulecode="+mid+" and orgcode='"+h_orgcode+"'";  
				}   
	        }
			string h_pfkcode;
			switch (mid)
			{
				case "19"://��ˮ��չ��ɾ��(ͬʱ�жϵ����Ƿ�û�����ݡ�û����ͬʱɾ�����������)
				case "58"://������չ��ɾ��(ͬʱ�жϵ����Ƿ�û�����ݡ�û����ͬʱɾ�����������)
					string h_soncode = (mid=="19")?"20":"59";//��Ӧ���걨��
					string h_extcode = (mid=="19")?"1209":"1210";//��Ӧ����չ��
					h_sqlstr = "declare @year as int,@code as varchar(50);select @year=fld_"+mid+"_3 from gmis_mo_"+mid+" where mocode="+id+";select @code=fld_"+mid+"_2 from gmis_mo_"+mid+" where mocode="+id+";if not exists (select mocode from gmis_mo_"+mid+" where fld_"+mid+"_3=@year and fld_"+mid+"_2=@code and mocode <>"+id+") begin delete gmis_mo_"+h_soncode+" where fld_"+h_soncode+"_2=@year and fld_"+h_soncode+"_1=@code end;delete gmis_mo_"+mid+" where mocode="+id+";delete gmis_mo_"+h_extcode+" where fld_"+h_extcode+"_1="+id+"";
					break;
				case "21"://ɾ����ͬʱ��һ��ɾ��gmis_mo_1197�����ݿ�������������ŷſڱ����ݱ��У����к��и���Ⱦ��ļ�¼�����и���
				case "29"://ɾ����ͬʱ��һ��ɾ��gmis_mo_1197�����ݿ�������������ŷſڱ����ݱ��У����к��и���Ⱦ��ļ�¼�����и���
					string h_uppercode = (mid=="21")?"53":"23";//��Ӧ���ŷſ�modulecode
					h_sqlstr += ";delete gmis_mo_1197 where datamocode=" + id + " and modulecode="+mid+";update gmis_mo_"+h_uppercode+" set fld_"+h_uppercode+"_11 = replace(';'+fld_"+h_uppercode+"_11+';',';"+id+";','') where ';'+fld_"+h_uppercode+"_11+';' like '%;"+id+";%'";
					break;
				case "53"://ɾ����ˮ�ŷſڣ�����Ӧ�ļ�����ݣ�ͬʱɾ����Ӧ��gmis_mo_1197���е�����,�Լ���Ӧ���������±�������
					h_pfkcode = GetFieldData("select top 1 fld_53_1 from gmis_mo_53 where mocode="+id+"");//��ȡ�ŷſڴ���
					if(h_pfkcode!="")
					{						
						h_sqlstr += ";delete gmis_mo_1197 where modulecode=18 and datamocode in (select mocode from gmis_mo_18 where fld_18_1='"+h_pfkcode+"');delete gmis_mo_18 where fld_18_1='"+h_pfkcode+"';delete gmis_mo_19 where fld_19_2='"+h_pfkcode+"';delete gmis_mo_20 where fld_20_1='"+h_pfkcode+"';delete gmis_mo_1209 where fld_1209_1 in (select mocode from gmis_mo_19 where fld_19_2='"+h_pfkcode+"')";				
					}
					break;
				case "23"://ɾ�������ŷſڣ�����Ӧ�ļ�����ݺ͹�¯¯Ҥ���ݣ�ͬʱɾ����Ӧ��gmis_mo_1197���е�����,�Լ���Ӧ���������±�������
					h_pfkcode = GetFieldData("select top 1 fld_23_1 from gmis_mo_23 where mocode="+id+"");//��ȡ�ŷſڴ���
					if(h_pfkcode!="")
					{
						h_sqlstr += ";delete gmis_mo_1197 where modulecode=24 and datamocode in (select mocode from gmis_mo_24 where fld_24_1='"+h_pfkcode+"');delete gmis_mo_24 where fld_24_1='"+h_pfkcode+"';delete gmis_mo_58 where fld_58_2='"+h_pfkcode+"';delete gmis_mo_59 where fld_59_1='"+h_pfkcode+"';delete gmis_mo_1210 where fld_1210_1 in (select mocode from gmis_mo_58 where fld_58_2='"+h_pfkcode+"');delete gmis_mo_1197 where modulecode=25 and datamocode in (select mocode from gmis_mo_25 where fld_25_15='"+h_pfkcode+"');delete gmis_mo_25 where fld_25_15='"+h_pfkcode+"'";
						
					}
					break;
				case "17"://ɾ����ȾԴ�����Ӧɾ����������ˮ��Ⱦ���ŷ���ɡ�������Ⱦ���ŷ���ɡ���ˮ�ŷſڡ������ŷſڡ���Դ���ġ���Ҫ��Ʒ��ԭ�����ϡ�����������ʩ����ˮ��⡢������⡢��¯¯Ҥ����ˮ���걨����չ���������걨����չ���Լ���������Ӧ��gmis_mo_1197���е�����
					string h_orgcode=GetFieldData("select top 1 fld_17_1 from gmis_mo_17 where mocode="+id+"");//��ȡ��λ����
					h_sqlstr += ";delete gmis_mo_1197 where modulecode in (53,27,28,26,23,18,25,24,29,21) and orgcode='"+h_orgcode+"';delete gmis_mo_29 where fld_29_3='"+h_orgcode+"';delete gmis_mo_21 where fld_21_3='"+h_orgcode+"';delete gmis_mo_53 where fld_53_3='"+h_orgcode+"';delete gmis_mo_23 where fld_23_3='"+h_orgcode+"';delete gmis_mo_27 where fld_27_4='"+h_orgcode+"';delete gmis_mo_28 where fld_28_12='"+h_orgcode+"';delete gmis_mo_26 where fld_26_6='"+h_orgcode+"';delete gmis_mo_18 where fld_18_8='"+h_orgcode+"';delete gmis_mo_24 where fld_24_8='"+h_orgcode+"';delete gmis_mo_25 where fld_25_14='"+h_orgcode+"';delete gmis_mo_20 where fld_20_1 in (select fld_19_2 from gmis_mo_19 where fld_19_1='"+h_orgcode+"');delete gmis_mo_1209 where fld_1209_1 in (select mocode from gmis_mo_19 where fld_19_1='"+h_orgcode+"');delete gmis_mo_19 where fld_19_1='"+h_orgcode+"';delete gmis_mo_59 where fld_59_1 in (select fld_58_2 from gmis_mo_58 where fld_58_1='"+h_orgcode+"');delete gmis_mo_1210 where fld_1210_1 in (select mocode from gmis_mo_58 where fld_58_1='"+h_orgcode+"');delete gmis_mo_58 where fld_58_1='"+h_orgcode+"'";
					break;
				case "1241":
				    h_sqlstr+=";delete gmis_mo_1242 where fld_1242_1='"+id+"';delete gmis_mo_1243 where fld_1243_6='"+id+"'";
				    break;
				case "1244":
				    h_sqlstr+="delete gmis_mo_1255 where fld_1255_1='"+id+"';delete gmis_mo_1256 where fld_1256_1='"+id+"';delete gmis_mo_1257 where fld_1257_1='"+id+"';delete gmis_mo_1258 where fld_1258_1='"+id+"';delete gmis_mo_1259 where fld_1259_1='"+id+"'";
			        break;
			}	       
			
			
			 
	        if(GetModuleName(mid) == "�ֶι���" && pid!="0")
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
                
                if (tablename_t != "" && CheckSysObject(tablename_t) && CheckSysColumn(tablename_t, fieldname))//����ڣ����ֶδ����ڱ�
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
				 string h_newmid=GetFirstRightModule(mid);//��ȡֱ���¼���һ����Ȩ�޵�ģ����
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
				    if(mid=="1118")//���������������Ⱦ��� ������6��
				        Response.Redirect(aid+"_"+mid+".aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
					if(mid=="1260" && aid=="list")//������������
				        Response.Redirect(aid+"_"+mid+".aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
					if(mid=="1390" && aid=="list")//�Աȱ���
				        Response.Redirect(aid+"_"+mid+".aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
				    else
				        Response.Redirect(aid+"_0.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex="+navindex+"&pid="+pid+"&fcode="+fcode);
				}
				//Response.Write(h_filedir+aid+"_"+h_mbrief+".aspx"+"   "+mid);
			}
			
	    }
	}
</script>
<div style="color:red;font-size:12px;margin-top:50px;" align=center>���ڽ����С��� <a href="#" target="_blank">�Ϻ������Ϣ�������޹�˾</a></div>
