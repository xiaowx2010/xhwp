<script language="c#" runat="server">
private void Click_Save(object sender, System.EventArgs e)
{   
    BeforeSave();
    //验证输入字段类型
    CheckMustAndFieldType();
    if (id == "0")
    {
        SetSESSION("sql", guangye.GetInsertSql(dtable, flds, types));
    }
    else
    {
        SetSESSION("sql", guangye.GetUpdateSql(dtable, filter, flds, types));
    }
    //Response.Write(guangye.GetUpdateSql(dtable, filter,flds, types));
    //Response.Write(GetSESSION("sql")+";"+GetSESSION("extsql"));
    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
    
}
private void Click_Clear(object sender, System.EventArgs e)
{   
    if(flds!=null){				
		guangye.ClearData(flds);
	}	
}
private void Click_NewAdd(object sender, System.EventArgs e)
{   
    Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("add")+"&mid="+mid+"&tid="+tid+"&pid="+pid+"");
}
private void Click_BackList(object sender, System.EventArgs e)
{   
    Response.Redirect("getpage.aspx?aid="+StringUtility.StringToBase64("list")+"&mid="+mid+"&navindex="+navindex+"&tid="+tid+"&pid="+pid);
}
//验证输入字段类型
private void CheckMustAndFieldType()
{
    if (flds != null && mid!="0")
    {
        StringBuilder astr = new StringBuilder();
        DataTable fddt = GetFields(mid);
        DataRow[] fdrs;
        DataRow fdr;
        string h_vreturn = "";
        foreach (string cf in flds)
        {
            fdrs = fddt.Select(" fieldname='"+cf+"'");
            if (fdrs.Length > 0)
            {
                fdr = fdrs[0];
                h_vreturn = guangye.GetControlValue(FindControl(cf));
                if (Convert.ToBoolean(fdr["OnEditMust"]))//必填项
                {
                    if (h_vreturn == "")
                    {
                        astr.Append(fdr["caption"].ToString() + "不能为空！");
                    }
                }
                if (h_vreturn.Length > 0)
                {
                    switch (fdr["fieldtypecode"].ToString())
                    {
                        case "1"://短语类型的验证长度
                        case "4":
                        case "5":
                            int h_intdatelength = 0;
                            try
                            {
                                h_intdatelength = Convert.ToInt32(fdr["DataLength"].ToString());
                            }
                            catch { }
                            if (RealStringCount(h_vreturn) > h_intdatelength)
                            {
                                astr.Append(fdr["caption"].ToString() + "字符数不能超过" + h_intdatelength.ToString() + "！");
                            }

                            break;
    
                        case "2"://整数
                        case "11"://小整数
                            try
                            {
                                Convert.ToInt32(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "应输入整数！");
                            }
                            break;
                        case "10"://浮点数                
                            try
                            {
                                Convert.ToDouble(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "应输入数字！");
                            }
                            break;
                        case "7"://日期                
                            try
                            {
                                Convert.ToDateTime(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "应输入日期格式！");
                            }
                            break;
                    }
                }
            }
        }
        if (astr.Length > 0)
        {
            SetSESSION("sql", "");
            SetSESSION("alert", astr.ToString());
            Response.Redirect("execommand.aspx?mid=" + mid + "&id=" + id);
        }
    }
}
//获得字符串的真实长度
private int RealStringCount(string str)
{
    int count = 0;
    foreach (char ch in str)
    {
        if (Convert.ToInt32(ch) < 256)
        {
            count += 1;
        }
        else
        {
            count += 2;
        }
    }
    return count;
}

//验证输入字段类型,带字段数组和模块编号
private void CheckMustAndFieldType(string[] flds, string mid)
{
    if (flds != null && mid != "0")
    {
        StringBuilder astr = new StringBuilder();
        DataTable fddt = GetFields(mid);
        DataRow[] fdrs;
        DataRow fdr;
        string h_vreturn = "";
        foreach (string cf in flds)
        {
            fdrs = fddt.Select(" fieldname='" + cf + "'");
            if (fdrs.Length > 0)
            {
                fdr = fdrs[0];
                h_vreturn = guangye.GetControlValue(FindControl(cf));
                if (Convert.ToBoolean(fdr["OnEditMust"]))//必填项
                {
                    if (h_vreturn == "")
                    {
                        astr.Append(fdr["caption"].ToString() + "不能为空！");
                    }
                }
                if (h_vreturn.Length > 0)
                {
                    switch (fdr["fieldtypecode"].ToString())
                    {
                        case "1"://短语类型的验证长度
                        case "4":
                        case "5":
                            int h_intdatelength = 0;
                            try
                            {
                                h_intdatelength = Convert.ToInt32(fdr["DataLength"].ToString());
                            }
                            catch { }
                            if (RealStringCount(h_vreturn) > h_intdatelength)
                            {
                                astr.Append(fdr["caption"].ToString() + "字符数不能超过" + h_intdatelength.ToString() + "！");
                            }

                            break;
                        case "2"://整数
                        case "11"://小整数
                            try
                            {
                                Convert.ToInt32(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "应输入整数！");
                            }
                            break;
                        case "10"://浮点数                
                            try
                            {
                                Convert.ToDouble(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "应输入数字！");
                            }
                            break;
                        case "7"://日期                
                            try
                            {
                                Convert.ToDateTime(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "应输入日期格式！");
                            }
                            break;
                    }
                }
            }
        }
        if (astr.Length > 0)
        {
            SetSESSION("sql", "");
            SetSESSION("alert", astr.ToString());
            //Response.Redirect("execommand.aspx?mid=" + mid + "&id=" + id);
        }
    }
}
private void SetToolBar()
{
	
	
    mid = GetQueryString("mid", "0");
    tid = GetQueryString("tid", "0");
    aid = GetQueryString("aid", "list");
    pid = GetQueryString("pid","0");
    id = GetQueryString("id", "0");
    navindex = GetQueryString("navindex", "0");
  
    //判断是否为开发用户
    if(",2,3,7,".IndexOf(","+mid+",")>-1 && !IsSystemDeveloper())
	{
		
		Response.Redirect("getpage.aspx?mid=0");
	}
	
    mua=";"+GetModuleActions(mid)+";";//模块权限    
    CheckToolBar(mua.Trim(';').Split(';'));
    if(aid == "list"){				
		tb_backlist.Visible = false;
		tb_save.Visible = false;				
	}else if(aid == "view"){
		tb_2.Visible = false;
		tb_backlist.Visible=true;		
	}else if(aid == "edit"){
		tb_2.Visible = false;
		tb_save.Visible = true;
		tb_clear.Visible = true;
		tb_backlist.Visible=true;
	}else if(id == "0" && flds!=null){				
		guangye.ClearData(flds);
	}	
	SetSESSION("MainUrl",Request.Url.ToString());
}
</script>
<td width="100%" ><span id="alertmess" runat="server" style="color:Red;">&nbsp;</span></td>

<td id="tb_2" visible="false" runat="server" style="padding-left:5px;width:55px;" nowrap>
<G:Button id="btn_newadd" type="toolbar" mode="on" icon="tb01" text="新增" onclick="Click_NewAdd" runat="server"></G:Button>
</td>
<td id="tb_save" visible="false" runat="server" style="padding-left:5px;width:55px;" nowrap>
<G:Button id="btn_save" type="toolbar" mode="on" icon="tb05" text="保存" onclick="Click_Save" runat="server"></G:Button>
</td>
<td id="tb_clear" visible="false" runat="server" style="padding-left:5px;width:55px;" nowrap>
<G:Button id="btn_clear" type="toolbar" mode="on" icon="tb06" text="清空" onclick="Click_Clear" runat="server"></G:Button>
</td>
<td id="tb_backlist" visible="false" runat="server" style="padding-left:5px;width:75px;" nowrap>
<G:Button id="btn_backlist" type="toolbar" mode="on" icon="tb13" text="返回列表" onclick="Click_BackList" runat="server"></G:Button>
</td>