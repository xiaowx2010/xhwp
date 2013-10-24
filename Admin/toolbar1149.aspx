
    <script language="C#" runat="server">
        string dtable_1149, dtable_1150, types_1149, types_1150,filter_1150, dtable_1202, types_1202, filter_1202, qiye_id = "";
        string[] flds_1149, flds_1150, vflds_1150, flds_1202, vflds_1202;
        private void edit_value()
        {
            //filter = " fld_1150_1='" + fld_1149_1.SelectedItem.Value + "' and fld_1150_2 = '" + fld_1149_2.Value + "'";
            //string p_filter = filter;
            string p_filter = " fld_1150_1='" + fld_1149_1.SelectedItem.Value + "' and fld_1150_2 = '" + fld_1149_2.Value + "'";
            db.SqlString = "select top 10 fld_1150_4 from " + GetModuleTableName("1150") + " where " + p_filter;
            //Response.Write(db.SqlString);

            DataTable dt = db.GetDataTable();
            if (dt.Rows.Count > 0)
            {
                //绑定已有的值
                for (int i = 1; i < dt.Rows.Count + 1; i++)
                {
                    vflds_1150 = new string[] { "fld_1149_1", "fld_1149_2", "Hidden" + i, "fld_1150_5_" + i, "fld_1150_6_" + i, "fld_1150_7_" + i, "fld_1150_8_" + i, "fld_1150_9_" + i, "fld_1150_10_" + i, "fld_1150_11_" + i, "fld_1150_12_" + i, "fld_1150_13_" + i, "fld_1150_14_" + i, "fld_1150_15_" + i, "fld_1150_16_" + i, "fld_1150_17_" + i, "fld_1150_18_" + i, "fld_1150_19_" + i, "fld_1150_20_" + i, "fld_1150_21_" + i, "fld_1150_22_" + i, "fld_1150_23_" + i, "fld_1150_24_" + i, "fld_1150_25_" + i, "fld_1150_26_" + i, "fld_1150_27_" + i, "fld_1150_28_" + i, "fld_1150_29_" + i, "fld_1150_30_" + i, "fld_1150_31_" + i, "fld_1150_32_" + i, "fld_1150_33_" + i, "fld_1150_34_" + i, "fld_1150_35_" + i, "fld_1150_36_" + i, "fld_1150_37_" + i, "fld_1150_38_" + i, "fld_1150_39_" + i, "fld_1150_40_" + i, "fld_1150_41_" + i, "fld_1150_42_" + i };

                    guangye.BindData(dtable_1150, p_filter, flds_1150, vflds_1150);
                    p_filter += " and fld_1150_4 != '" + guangye.GetControlValue(FindControl("Hidden" + i)).ToString() + "'";

                    for (int j = 0; j < vflds_1150.Length; j++)
                    {
                        vflds_1150.SetValue(null, j);
                    }
                }
            }
            //Response.Write(p_filter);
        }

        //public override void BeforeSave()
        private void Click_Save_1149(object sender, System.EventArgs e)
        {
            //string teststring="";
            string p_sqlstring = "";//SQL语句
            string p_filternow = " fld_1150_1='" + fld_1149_1.SelectedItem.Value + "' and fld_1150_2  in (" + GetFieldData("select mocode from " + dtable_1202 + " where fld_1202_2='" + fld_1149_2.Value + "'") + ")";

            CheckMustAndFieldType(mid);

            SetSESSION("alert", GetSESSION("alert") + GetRepeatAlertStr());

            db.SqlString = "select mocode from " + GetModuleTableName("1149") + " where fld_1149_1='" + fld_1149_1.SelectedItem.Value + "' and fld_1149_2 ='" + fld_1149_2.Value+"'";//取当前年份的值
            //SetSESSION("alert", db.SqlString);
            DataTable dt = db.GetDataTable();
            if (id == "0")
            {
                if (dt.Rows.Count > 0)
                {
                    SetSESSION("alert", GetSESSION("alert") + fld_1149_1.SelectedItem.Value + "年该企业法人代码已存在，请重新输入!");
                }
            }
            //alertmess_1149.InnerHtml = GetSESSION("alert");
            if (GetSESSION("alert").Length > 0)
            {
                alertmess_1149.InnerHtml = GetSESSION("alert");
                SetSESSION("alert", "");
                SetSESSION("sql", "");
                //Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id);
            }
            else
            {
                if (id != "0")
                {
                    p_sqlstring +=guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" +  guangye.GetUpdateSql(dtable_1149, filter, flds_1149, types_1149) + ";";
                }
                else
                {
                    if (qiye_id != "0")
                    {
                        p_sqlstring += guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable_1149, flds_1149, types_1149) + ";";
                    }
                    else
                    {
                        if (GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1149_2) + "'") != "")
                        {
                            filter_1202 = "mocode=" + GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1149_2) + "'");
                            fld_1202_24.Value = GetFieldData("select fld_1202_24 from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1149_2) + "'"); 
                            SetSESSION("filter", filter_1202);
                            p_sqlstring = "";
                            //div_input.Visible = false;
                            //div_output.Visible = true; 
                            SetSESSION("extsql",(guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable_1149, flds_1149, types_1149) + ";" + update1150()).TrimEnd(';'));
                            string scriptstr = "<scrip" + "t>__doOpenView('pop_alert.aspx?mid=" + mid + "&id=" +id+ "&pid="+pid+"&tid="+tid+"',300,200,10,50);</scrip" + "t>";
                            Page.RegisterStartupScript("popwin", scriptstr);

                        }
                        else
                        {
                            p_sqlstring += guangye.GetInsertSql(dtable_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable_1149, flds_1149, types_1149) + ";";
                        }
                    }
                }
                if (p_sqlstring != "")
                {
                    p_sqlstring += update1150();
                    SetSESSION("sql", p_sqlstring.TrimEnd(';'));
                    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
                }
            }
        }

        private string update1150()
        {
            db.SqlString = "select mocode from " + GetModuleTableName("1149") + " where fld_1149_1='" + fld_1149_1.SelectedItem.Value + "' and fld_1149_2 in (" + GetFieldData("select mocode from " + dtable_1202 + " where fld_1202_2='" + fld_1149_2.Value + "'") + ")";//取当前年份的值
            DataTable dt = db.GetDataTable();
            string p_sqlstring="";
            string p_filternow = " fld_1150_1='" + fld_1149_1.SelectedItem.Value + "' and fld_1150_2  in (" + GetFieldData("select mocode from " + dtable_1202 + " where fld_1202_2='" + fld_1149_2.Value + "'") + ")";
            int uporinsert = 1;//标记是更新还是添加，0为更新，1为添加
            db.SqlString = "select fld_1150_4 from " + GetModuleTableName("1150") + " where fld_1150_1='" + fld_1149_1.SelectedItem.Value + "' and fld_1150_2 = '" + fld_1149_2.Value + "'";//取当前年份的值
            dt = db.GetDataTable();
            for (int i = 1; i < 11; i++)// && (guangye.GetControlValue(FindControl("Hidden" + i)).ToString() != "")
            {
                vflds_1150 = new string[] { "fld_1149_1", "fld_1149_2", "Hidden" + i, "fld_1150_5_" + i, "fld_1150_6_" + i, "fld_1150_7_" + i, "fld_1150_8_" + i, "fld_1150_9_" + i, "fld_1150_10_" + i, "fld_1150_11_" + i, "fld_1150_12_" + i, "fld_1150_13_" + i, "fld_1150_14_" + i, "fld_1150_15_" + i, "fld_1150_16_" + i, "fld_1150_17_" + i, "fld_1150_18_" + i, "fld_1150_19_" + i, "fld_1150_20_" + i, "fld_1150_21_" + i, "fld_1150_22_" + i, "fld_1150_23_" + i, "fld_1150_24_" + i, "fld_1150_25_" + i, "fld_1150_26_" + i, "fld_1150_27_" + i, "fld_1150_28_" + i, "fld_1150_29_" + i, "fld_1150_30_" + i, "fld_1150_31_" + i, "fld_1150_32_" + i, "fld_1150_33_" + i, "fld_1150_34_" + i, "fld_1150_35_" + i, "fld_1150_36_" + i, "fld_1150_37_" + i, "fld_1150_38_" + i, "fld_1150_39_" + i, "fld_1150_40_" + i, "fld_1150_41_" + i, "fld_1150_42_" + i };
                uporinsert = 1;

                //修改
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[0].ToString() == guangye.GetControlValue(FindControl("Hidden" + i)).ToString())
                    {
                        p_filternow = " fld_1150_1='" + fld_1149_1.SelectedItem.Value + "' and fld_1150_2 = '" + fld_1149_2.Value + "' and fld_1150_4 ='" + guangye.GetControlValue(FindControl("Hidden" + i)).ToString() + "'";
                        //如果有值就更新
                        p_sqlstring += guangye.GetUpdateSql(dtable_1150, p_filternow, flds_1150, vflds_1150, types_1150) + ";";
                        uporinsert = 0;
                        //teststring += guangye.GetUpdateSql(dtable_1150, p_filternow, flds_1150, vflds_1150, types_1150) + "<br>";
                    }
                }
                if (uporinsert == 1)
                {
                    //如果没有就提交
                    p_sqlstring += guangye.GetInsertSql(dtable_1150, flds_1150, vflds_1150, types_1150) + ";";
                }
                //追加
                for (int j = 0; j < vflds_1150.Length; j++)
                {
                    vflds_1150.SetValue(null, j);
                }
            }
            return p_sqlstring;
        }

        //private void Click_Fugai(object sender, System.EventArgs e)//覆盖原数据
        //{
        //    filter_1202 = GetSESSION("filter");
        //    SetSESSION("sql", (guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable_1149, flds_1149, types_1149) + ";" + update1150()).TrimEnd(';'));
        //    Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);
        //}

        //private void Click_Fanhui(object sender, System.EventArgs e)//返回重新新增
        //{
        //    Response.Redirect("getpage.aspx?aid=" + StringUtility.StringToBase64("add") + "&mid=" + mid + "");
        //}

        //保存前验证
        private string GetRepeatAlertStr()
        {
            string alerttext = "";
            double sum_left = 0.0, sum_right = 0.0;
            string p_tempvalue = "";

            for (int i = 29; i < 92; i++)//验证企业排放表1149
            {
                if (guangye.GetControlValue(FindControl("fld_1149_" + i)) != "0" && guangye.GetControlValue(FindControl("fld_1149_" + i)) != "" && !CheckFloat(guangye.GetControlValue(FindControl("fld_1149_" + i))))
                {
                    alerttext += "实际值只能输入数字，请返回修改!";
                }
            }

            try
            {
                sum_left = 0; sum_right = 0;
                if (guangye.GetControlValue(FindControl("fld_1149_41")) != "" && guangye.GetControlValue(FindControl("fld_1149_42")) != "" && guangye.GetControlValue(FindControl("fld_1149_42")) != "0")
                {
                    sum_left = Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1149_41"))) / Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1149_42")));
                }
                if (guangye.GetControlValue(FindControl("fld_1149_43")) != "" && guangye.GetControlValue(FindControl("fld_1149_44")) != "" && guangye.GetControlValue(FindControl("fld_1149_44")) != "0")
                {
                    sum_right = Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1149_43"))) / Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1149_44")));
                }
            }
            catch { }
            if (sum_left < sum_right)
            {
                alerttext += "注意指标间关系： 13≥14";
            }

            try
            {
                sum_left = 0; sum_right = 0;
                if (guangye.GetControlValue(FindControl("fld_1149_41")) != "" && guangye.GetControlValue(FindControl("fld_1149_42")) != "" && guangye.GetControlValue(FindControl("fld_1149_42")) != "0")
                    sum_left = Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1149_41"))) / Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1149_42")));
                if (guangye.GetControlValue(FindControl("fld_1149_45")) != "" && guangye.GetControlValue(FindControl("fld_1149_45")) != "" && guangye.GetControlValue(FindControl("fld_1149_46")) != "0")
                    sum_right = Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1149_45"))) / Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1149_46")));
            }
            catch { }
            if (sum_left < sum_right)
            {
                alerttext += "注意指标间关系： 13≥15";
            }

            string[] zhibiao = new string[] { "33|59|5|28", "59|60|28|29", "59|61|28|30", "59|62|28|31", "82|87|51|56", "89|90|58|59" };//, "71|72|40|41", "75|76|44|45" 
            string[] zhibiaobianhao;

            foreach (string zb in zhibiao)
            {
                zhibiaobianhao = zb.Split('|');
                try
                {
                    sum_left = Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1149_" + zhibiaobianhao[0])));
                    sum_right = Convert.ToDouble(guangye.GetControlValue(FindControl("fld_1149_" + zhibiaobianhao[1])));
                }
                catch { }
                if (sum_left < sum_right)
                {
                    alerttext += "注意指标间关系： " + zhibiaobianhao[2] + "≥" + zhibiaobianhao[3];
                }
            }

            try
            {
                sum_left = 0; sum_right = 0;
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_32"));
                if (p_tempvalue != "")
                {
                    sum_left += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_33"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_34"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
            }
            catch { }
            if (sum_left != sum_right)
            {
                alerttext += "注意指标间关系： 4=5+6";
            }

            try
            {
                sum_left = 0; sum_right = 0;
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_77"));
                if (p_tempvalue != "")
                {
                    sum_left += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_78"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_79"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_80"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_81"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
            }
            catch { }
            if (sum_left != sum_right)
            {
                alerttext += "注意指标间关系： 46=47+48+49+50";
            }

            try
            {
                sum_left = 0; sum_right = 0;
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_77"));
                if (p_tempvalue != "")
                {
                    sum_left += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_82"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_88"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_89"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_91"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_87"));
                if (p_tempvalue != "")
                {
                    sum_right -= Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_90"));
                if (p_tempvalue != "")
                {
                    sum_right -= Convert.ToDouble(p_tempvalue);
                }
            }
            catch { }
            if (sum_left != sum_right)
            {
                alerttext += "注意指标间关系： 46=51+57+58+60-56-59";
            }

            try
            {
                sum_left = 0; sum_right = 0;
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_82"));
                if (p_tempvalue != "")
                {
                    sum_left += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_83"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_84"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_85"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
                p_tempvalue = guangye.GetControlValue(FindControl("fld_1149_86"));
                if (p_tempvalue != "")
                {
                    sum_right += Convert.ToDouble(p_tempvalue);
                }
            }
            catch { }
            if (sum_left != sum_right)
            {
                alerttext += "注意指标间关系： 51=52+53+54+55";
            }

            for (int i = 1; i < 11; i++)//验证明细表1150
            {
                for (int tagnum = 5; tagnum < 43; tagnum++)
                {
                    //正浮点数
                    if (guangye.GetControlValue(FindControl("fld_1150_" + tagnum + "_" + i)) != "0" && guangye.GetControlValue(FindControl("fld_1150_" + tagnum + "_" + i)) != "" && !CheckFloat(guangye.GetControlValue(FindControl("fld_1150_" + tagnum + "_" + i))))
                    {
                        alerttext += "注意列表代码" + (tagnum + 56).ToString() + "行#" + i.ToString() + "机组只能输入正浮点数，请返回修改!";
                    }
                }

                try
                {
                    sum_left = 0; sum_right = 0;
                    p_tempvalue = guangye.GetControlValue(FindControl("fld_1150_12_" + i));
                    if (p_tempvalue != "")
                    {
                        sum_left += Convert.ToDouble(p_tempvalue);
                    }
                    p_tempvalue = guangye.GetControlValue(FindControl("fld_1150_13_" + i));
                    if (p_tempvalue != "")
                    {
                        sum_right += Convert.ToDouble(p_tempvalue);
                    }
                    p_tempvalue = guangye.GetControlValue(FindControl("fld_1150_14_" + i));
                    if (p_tempvalue != "")
                    {
                        sum_right += Convert.ToDouble(p_tempvalue);
                    }
                }
                catch { }
                if (sum_left != sum_right)
                {
                    alerttext += "注意#" + i.ToString() + "机组指标间关系： 68=69+70";
                }

                try
                {
                    sum_left = 0; sum_right = 0;
                    p_tempvalue = guangye.GetControlValue(FindControl("fld_1150_15_" + i));
                    if (p_tempvalue != "")
                    {
                        sum_left += Convert.ToDouble(p_tempvalue);
                    }
                    p_tempvalue = guangye.GetControlValue(FindControl("fld_1150_16_" + i));
                    if (p_tempvalue != "")
                    {
                        sum_right += Convert.ToDouble(p_tempvalue);
                    }
                    p_tempvalue = guangye.GetControlValue(FindControl("fld_1150_17_" + i));
                    if (p_tempvalue != "")
                    {
                        sum_right += Convert.ToDouble(p_tempvalue);
                    }
                }
                catch { }
                if (sum_left != sum_right)
                {
                    alerttext += "注意#" + i.ToString() + "机组指标间关系： 71≥72+73";
                }
            }
            return alerttext;
        }

        //关键字搜索企业法人代码
        private void Click_Search(object sender, System.EventArgs e)
        {
            string scriptstr = "";
            if (guangye.GetControlValue(fld_1149_2).Length > 0)
            {
                alertmess.InnerText = "";
                scriptstr = "<scrip" + "t>__doOpenView('pop_search_company.aspx?mid=" + mid + "&year="+guangye.GetControlValue(fld_1149_1)+"&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_1149_2)) + "',800,600,10,50);</scrip" + "t>";
                Page.RegisterStartupScript("popwin", scriptstr);
            }
            else
            {
                alertmess_1149.InnerHtml = "请输入企业法人代码";
            }

            Page.RegisterStartupScript("search", scriptstr);

        }
        //正浮点数
        private bool CheckFloat(string value)
        {
            try
            {
                if (Convert.ToDouble(value) > 0)
                {
                    return true;
                }
            }
            catch { }

            return false;
        }
        //验证输入字段类型,来自toolbar
        private void CheckMustAndFieldType(string temp_mid)
        {
            if (flds_1149 != null && mid != "0")
            {
                StringBuilder astr = new StringBuilder();
                DataTable fddt = GetFields(mid);
                DataRow[] fdrs;
                DataRow fdr;
                string h_vreturn = "";
                foreach (string cf in flds_1149)
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
                    //Response.Redirect("getpage.aspx");
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
    </script>

