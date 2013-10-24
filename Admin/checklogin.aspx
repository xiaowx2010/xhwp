<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<!--#include file="func.aspx"-->
<script runat="server" language="C#">
	private void Page_Load(object sender, System.EventArgs e)
	{
		
	    string uname = GetQueryString("uname", "");
	    string upass = GetQueryString("upass", "");
	    
	 
        if(!IsPostBack)
        {
			if(uname!="" && upass!="")
			{
				string LoginInfo = CheckLogin1(uname,upass);
				if(LoginInfo.Length > 1 && (LoginInfo[0] == '0' || LoginInfo[0] == '1' || LoginInfo[0] == '2'))
				{
                    ClearSESSION();
                    SetSESSION("uname", uname);
                    SetSESSION("SM", LoginInfo[0].ToString());
                    SetSESSION("uid", LoginInfo.Substring(1));
                    //�û���¼                    
                    mid = GetFirstModule();
                    Response.Write("mid"+mid);
                   if(mid!="")
                   {
                        string h_mbrief = "";
                        h_mbrief = GetModuleBrief(mid);
                        aid = "list";                      
                        Response.Redirect("default.aspx");
                    }
					
				}
			}
			Response.Redirect("login.aspx");
        }
	}
	private string CheckLogin1(string uidStr, string pwdStr)
	{   
		string ReString = ""; 
		if (uidStr.ToLower() == "gmis")
		{
			db.SqlString = "SELECT userCode FROM gmis_user where username='" + uidStr.ToLower() + "'";
			if (db.GetDataTable().Rows.Count == 0)
			{
				if (pwdStr == ConfigurationSettings.AppSettings["PRODUCT_NAME"].ToString())
				{
					ReString = "20";
					                 
				}
				else
					ReString = "�û������������";
			}
		}
		else
		{
			try
			{
				db.SqlString = "SELECT usercode,username,userstate,userrole FROM gmis_user WHERE username='" + uidStr.Replace("\'", "") + "' ";           
				DataTable dt = db.GetDataTable();           
				if (dt.Rows.Count == 0)
				{
					return "�û������������";
				}
				else
				{
					DataRow dr = dt.Rows[0];
					if (dr["userstate"].ToString() == "����")
					{
						ReString = "���û��ѱ����ã�";
					}
					else
					{
						ReString = "0";
						if (dr["userrole"].ToString() == "ϵͳ����Ա")
							ReString = "1";
						ReString += dr["usercode"].ToString();
					}
				}
			}
			catch (Exception e)
			{
				ReString = e.Message;//"����δ֪�Ĵ����û���¼ʧ�ܣ�";
			}
		}
		return ReString;
	}
</script>
