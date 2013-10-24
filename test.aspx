<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.Page" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<%@ Import Namespace="guangyeus.syscentralism" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>


<script language="C#" runat="server">

    private void Page_Load(object sender, System.EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
        UserService2 us = new UserService2();//y
        
        HttpCookie cookie = Request.Cookies["userinfo"];
        string h_deptname="",h_deptcode = "0";
        SqlDB db = new SqlDB();
        if (cookie == null)
        {
            Response.Redirect("http://centralism.xh.sh.cn/Web/Verify.aspx?CurrentPage="+Server.UrlEncode("http://syswrypc.xh.sh.cn"));
            //Response.Redirect("http://syscentralism.xh.sh.cn/web/VerifywithoutUI.aspx?CurrentPage="+Server.UrlEncode("http://syswrypc.xh.sh.cn"));
        }
        else
        {
            bool hasLoginRight = false;
            try
            {   
                XmlNode xn = us.getUserRight(ConfigurationSettings.AppSettings["APPCODE"].ToString(), cookie.Values["ldapStr"].ToString(), false, "");
               if (xn.ChildNodes.Count > 0)
                {
                    XmlElement xe = (XmlElement)xn.SelectSingleNode(@"//Right[@code='login']");
                    if (xe != null && xe.Attributes["code"].InnerText == "login")
                    {
                        hasLoginRight = true;
                        XmlNode xndept = us.getUserInfo(cookie.Values["ldapStr"].ToString(), "Department");
                        XmlElement xedept = (XmlElement)xndept.SelectSingleNode("CN");
                        if (xedept != null)
                        {
                            h_deptname = xedept.Attributes["Department"].InnerText;
                            db.SqlString = "if not exists (select deptcode from gmis_dept where deptname ='" + h_deptname + "') begin insert into gmis_dept (deptname) values ('" + h_deptname + "');select deptcode from gmis_dept where deptcode =@@IDENTITY; end else begin select deptcode from gmis_dept where deptname ='" + h_deptname + "'; end";
                            DataTable dtDept = db.GetDataTable();
                            if (dtDept.Rows.Count > 0)
                            {
                                h_deptcode = dtDept.Rows[0][0].ToString(); 
                            }
                        }
                    }
                }
                
            }
            catch(Exception ex){
                Response.Write(ex.Message);
            }
            hasLoginRight = true;
            if (hasLoginRight)
            {
                db = new SqlDB();
                db.SqlString = "declare @usergroupcode varchar(50);select @usergroupcode = usergroupcode from gmis_usergroup where usergroupname='普通用户';if not exists (select usercode from gmis_user where ldapStr ='" + cookie.Values["ldapStr"].ToString() + "') begin insert into gmis_user (username,ldapStr,deptcode,usergroupcode) values ('" + cookie.Values["Username"].ToString() + "','" + cookie.Values["ldapStr"].ToString() + "','" + h_deptcode + "',@usergroupcode);select usercode,username from gmis_user where usercode =@@IDENTITY; end else begin select usercode,username from gmis_user where ldapStr ='" + cookie.Values["ldapStr"].ToString() + "'; end";
                DataTable dt = db.GetDataTable();
                if (dt.Rows.Count > 0)
                {
                    ClearSESSION();
                    SetSESSION("uname", cookie.Values["Username"].ToString());
                    SetSESSION("SM", "2");
                    SetSESSION("uid", dt.Rows[0]["usercode"].ToString());

                    string p_denglujilu = "";//修改登陆次数
                    string p_today = DateTime.Now.ToString();//当天时间
                    string p_username = GetSESSION("uname");//登陆用户
                   
                    p_denglujilu = "declare @usermocode int;select @usermocode=usercode from gmis_user where username='" + p_username + "';";
                    
                    p_denglujilu += "if exists (select mocode from gmis_mo_1207 where fld_1207_1=@usermocode and DateDiff(day,fld_1207_2,'" + p_today + "')=0) begin update gmis_mo_1207 set fld_1207_3=fld_1207_3+1,fld_1207_2='" + p_today + "' where fld_1207_1=@usermocode and DateDiff(day,fld_1207_2,'" + p_today + "')=0 end else if exists (select mocode from gmis_mo_1207 where fld_1207_1=@usermocode) begin update gmis_mo_1207 set fld_1207_3=1,fld_1207_2='" + p_today + "' where fld_1207_1=@usermocode end else begin insert into gmis_mo_1207 (fld_1207_1,fld_1207_2,fld_1207_3) values (@usermocode,'" + p_today + "',1) end ";
                    db.SqlString = p_denglujilu;
                    string exeinfo = db.UpdateTable();
                    
                    if (exeinfo == "操作成功！")
                    {
                        SetSESSION("MainUrl", "Desktop.aspx");
                        Response.Redirect("admin/default.aspx");
                    }
                }
            }
            else
            {
                Response.Write("登陆未成功！");
            }
        }
    }
</script>