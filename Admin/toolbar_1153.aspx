
<script language="C#" runat="server">
    string[] vflds, p_newflds, p_newvflds, flds_1202, vflds_1202;
    string p_newtypes, dtable_1202, types_1202, filter_1202, qiye_id = "";//updata为修改，insert为新增
    //显示记录
    private void edit_value()
    {
        //guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
        filter = " fld_1153_1='" + fld_1153_1.SelectedItem.Value + "' and fld_1153_2 = '" + fld_1153_2.Value + "'";
        string p_filter = filter;
        db.SqlString = "select top 8 mocode from " + GetModuleTableName("1153") + " where " + filter;
        
        DataTable dt = db.GetDataTable();
        if (dt.Rows.Count > 0)
        {
            //绑定已有的值
            for (int i = 1; i < dt.Rows.Count + 1; i++)
            {
                vflds = new string[] { "Hidden" + i, "fld_1153_1", "fld_1153_2", "fld_1153_4_" + i, "fld_1153_5_" + i, "fld_1153_6_" + i, "fld_1153_7_" + i, "fld_1153_8_" + i, "fld_1153_9_" + i, "fld_1153_10_" + i, "fld_1153_11_" + i, "fld_1153_12_" + i, "fld_1153_13_" + i, "fld_1153_14_" + i, "fld_1153_15_" + i, "fld_1153_16" };
                
                guangye.BindData(dtable, p_filter, flds, vflds);//参数表BindData(string table, string filter, string[] fieldlist, string[] valuelist)
                p_filter += " and mocode != '" + guangye.GetControlValue(FindControl("Hidden" + i)).ToString() + "'";

                for (int j = 0; j < vflds.Length; j++)
                {
                    vflds.SetValue(null, j);
                }
            }
            //Response.Write(p_filter);
        }
    }


    public override void BeforeSave()
    {
        string p_allsqlstr = "";//SQL语句
        CheckMustAndFieldType(mid);

        SetSESSION("alert", GetSESSION("alert") + GetRepeatAlertStr());

        db.SqlString = "select mocode from " + GetModuleTableName("1153") + " where  fld_1153_1='" + fld_1153_1.SelectedItem.Value + "' and fld_1153_2 ='" + fld_1153_2.Value + "'";
        DataTable dt = db.GetDataTable();
    
    //取当前年份的值
        if (id == "0" && dt.Rows.Count > 0)//
        {
            SetSESSION("alert", GetSESSION("alert")+fld_1153_1.SelectedItem.Value + "年，该企业法人代码已存在，请重新输入!");//2009
        }
        if (GetSESSION("alert").Length > 0)
        {
            alertmess_1153.InnerHtml = GetSESSION("alert");
            SetSESSION("alert", "");
        }
        else
        {
            if (id != "0")
            {
                p_allsqlstr += guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetUpdateSql(dtable, filter, p_newflds, types);
            }
            else
            {
                if (qiye_id != "0")
                {
                    p_allsqlstr += guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, p_newflds, types);
                }
                else
                {
                    if (GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1153_2) + "'") != "")
                    {
                        filter_1202 = "mocode=" + GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1153_2) + "'");
                        fld_1202_24.Value = GetFieldData("select fld_1202_24 from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1153_2) + "'");
                        SetSESSION("filter", filter_1202);
                        p_allsqlstr = "";
                        SetSESSION("extsql", (guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, p_newflds, types) + ";" + update1153()).TrimEnd(';'));
                        string scriptstr = "<scrip" + "t>__doOpenView('pop_alert.aspx?mid=" + mid + "&id=" + id + "&pid=" + pid + "&tid=" + tid + "',300,200,10,50);</scrip" + "t>";
                        Page.RegisterStartupScript("popwin", scriptstr);

                    }
                    else
                    {
                        p_allsqlstr += guangye.GetInsertSql(dtable_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, p_newflds, types);
                    }
                }
            }
            if (p_allsqlstr != "")
            {
                p_allsqlstr += update1153();
                SetSESSION("sql", p_allsqlstr.TrimEnd(';'));
                Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id);
            }
        }
    }

    private string update1153()
    {
        string p_allsqlstr = "";
        string p_filternow = "";
        int uporinsert = 1;//标记是更新还是添加，0为更新，1为添加
        db.SqlString = "select mocode from " + GetModuleTableName("1153") + " where " + filter;
        DataTable dt = db.GetDataTable();

        for (int i = 1; i < 9 && (guangye.GetControlValue(FindControl("fld_1153_4_" + i)).ToString() != "" || guangye.GetControlValue(FindControl("Hidden" + i)).ToString() != ""); i++)//GetControlValue
        {// 
            p_newvflds = new string[] { "fld_1153_1", "fld_1153_2", "fld_1153_4_" + i, "fld_1153_5_" + i, "fld_1153_6_" + i, "fld_1153_7_" + i, "fld_1153_8_" + i, "fld_1153_9_" + i, "fld_1153_10_" + i, "fld_1153_11_" + i, "fld_1153_12_" + i, "fld_1153_13_" + i, "fld_1153_14_" + i, "fld_1153_15_" + i, "fld_1153_16" };
            uporinsert = 1;
            foreach (DataRow dr in dt.Rows)
            {
                if (dr[0].ToString() == guangye.GetControlValue(FindControl("Hidden" + i)).ToString())
                {
                    p_filternow = filter + " and mocode ='" + guangye.GetControlValue(FindControl("Hidden" + i)).ToString() + "'";
                    //如果有值就更新
                    p_allsqlstr += guangye.GetUpdateSql(dtable, p_filternow, p_newflds, p_newvflds, p_newtypes) + ";";
                    uporinsert = 0;
                }
            }
            if (uporinsert == 1)
            {
                //如果没有就提交
                p_allsqlstr += guangye.GetInsertSql(dtable, p_newflds, p_newvflds, p_newtypes) + ";";
            }
            for (int j = 0; j < p_newvflds.Length; j++)
            {
                p_newvflds.SetValue(null, j);
            }
        }
        return p_allsqlstr;
    }

    private void Click_Fugai(object sender, System.EventArgs e)//覆盖原数据
    {
        filter_1202 = GetSESSION("filter");
        SetSESSION("sql", (guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + update1153()).TrimEnd(';'));
        Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
    }

    private void Click_Fanhui(object sender, System.EventArgs e)//返回重新新增
    {
        Response.Redirect("getpage.aspx?aid=" + StringUtility.StringToBase64("add") + "&mid=" + mid + "");
    }

    
    //保存前验证
    private string GetRepeatAlertStr()
    {
        string alerttext = "";
        double sum_left = 0.0, sum_right = 0.0;
        string p_tempvalue = "";
        
        for (int i = 1; i < 9; i++)
        {

            for (int tagnum = 8; tagnum < 16; tagnum++)
            {
                //正浮点数
                if (guangye.GetControlValue(FindControl("fld_1153_" + tagnum + "_" + i)) != "0" && guangye.GetControlValue(FindControl("fld_1153_" + tagnum + "_" + i)) != "" && !CheckFloat(guangye.GetControlValue(FindControl("fld_1153_" + tagnum + "_" + i))))
                {
                    return "注意列表第" + i.ToString() + "行第" + (tagnum-2).ToString() + "列只能输入数字，请返回修改!";
                }
            }
            try
            {
                sum_left = 0; sum_right = 0;
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1153_9_" + i));
                if (p_tempvalue != "")
                {
                    sum_left += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1153_10_" + i));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
            }
            catch { }
            if (sum_left < sum_right)
            {
                alerttext += "注意指标间关系： 4≥5";
            }
            try
            {
                sum_left = 0; sum_right = 0;
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1153_10_" + i));
                if (p_tempvalue != "")
                {
                    sum_left += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1153_11_" + i));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1153_12_" + i));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1153_13_" + i));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
            }
            catch { }
            if (sum_left != sum_right)
            {
                alerttext += "注意指标间关系： 5=6+7+8";
            }
            try
            {
                sum_left = 0; sum_right = 0;
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1153_13_" + i));
                if (p_tempvalue != "")
                {
                    sum_left += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1153_14_" + i));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
            }
            catch { }
            if (sum_left < sum_right)
            {
                alerttext += "注意指标间关系： 8≥9";
            }
        }
        return alerttext;
    }

    //正浮点数
    private bool CheckFloat(string value)
    {
        try
        {
            if (Convert.ToDouble(value) > 0||value=="0")
            {
                return true;
            }
        }
        catch { }

        return false;
    }

    //查看企业
    private void Click_Search(object sender, System.EventArgs e)
    {
        string scriptstr = "";
        if (guangye.GetControlValue(fld_1153_2).Length > 0)
        {
            alertmess_1153.InnerText = "";
            scriptstr = "<scrip" + "t>__doOpenView('pop_search_company.aspx?mid=" + mid + "&year="+guangye.GetControlValue(fld_1153_1)+"&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_1153_2)) + "',800,600,10,50);</scrip" + "t>";
            Page.RegisterStartupScript("popwin", scriptstr);

        Page.RegisterStartupScript("search", scriptstr);
        }
        else
        {
            alertmess_1153.InnerHtml = "请输入企业法人代码";
        }

    }
    
    //验证输入字段类型,来自toolbar
    private void CheckMustAndFieldType(string temp_mid)
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
    private void Click_Save_1153(object sender, System.EventArgs e)
    {
        BeforeSave();
    }
</script>
