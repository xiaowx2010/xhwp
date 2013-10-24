<script language="c#" runat="server">
    StringBuilder sb;
    //取得层级
private string GetSonLevel(string upcode)
{
    if (upcode != "0")
    {
        DataTable dt = db.GetDataTable(db.ConnStr, "select fld_1201_2+1 from gmis_mo_1201 where mocode=" + upcode);
        if (dt.Rows.Count > 0)
        {
            return dt.Rows[0][0].ToString();
        }
    }
    return "1";
    //return "select fld_1201_2+1 from gmis_mo_1201 where mocode=" + upcode;
}

//按钮事件
private void Click_Toolbar(object sender, System.EventArgs e)
{
    string exeinfo = "";
    string idstr = ((Control)sender).ID.ToLower();

    switch (idstr)
    {
        case "btn_backlist":
            Response.Redirect("getpage.aspx?mid=1201");
            break;
        case "btn_newson":
            Response.Redirect("edit_1201.aspx?upsonid=0&id=0&aid=" + StringUtility.StringToBase64("edit"));
            break;
        case "btn_newsubson":
            if (id != "0")
            {
                Response.Redirect("edit_1201.aspx?upsonid=" + id + "&id=0&aid=" + StringUtility.StringToBase64("edit"));
            }
            break;
        case "btn_up":
        case "btn_down":
            exeinfo = ChangeOneTypeIndex(idstr, dtable, "mocode", "fld_1201_5", "fld_1201_4", "fld_1201_3");
            break;
        case "btn_deleteson":
            exeinfo = db.UpdateTable(db.ConnStr, "delete gmis_mo_1201 where mocode in (select mocode from gmis_mo_1201 where fld_1201_5 like '%'+(select fld_1201_5 from gmis_mo_1201 where mocode=" + id + ")+'%')");
            if (exeinfo == "操作成功！")
            {
                SetSESSION("alert", exeinfo);
                Response.Redirect("edit_1201.aspx?id=0");
            }
            break;
        case "btn_saveson":
            SetSESSION("alert", "");
            CheckMustAndFieldType("1201");
            CheckSave();

            if (GetSESSION("alert").Length == 0)
            {
                if (id == "0")
                {
                    DataTable dt = db.GetDataTable(db.ConnStr, guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';declare @mocode as int;select @mocode=@@IDENTITY;insert into gmis_mo_1197 (orgname,featurecode,modulecode,datamocode) values ('" + fld_1201_1.Value + "'," + featurecode.Value + "," + mid + ",@mocode)");
                    if (dt.Rows.Count > 0)
                    {
                        exeinfo = guangye.ExeBySql(UpdateTypeIndex("gmis_mo_1201", "mocode", "fld_1201_2", "fld_1201_5", "fld_1201_4", "fld_1201_3"), 1);
                        SetSESSION("alert", exeinfo);
                        //Response.Redirect("edit_1201.aspx?id=" + dt.Rows[0][0].ToString() + "&upsonid=" + upsonid);

                    }
                    else
                    {
                        exeinfo = "操作不成功！";
                    }
                }
                else
                {
                    exeinfo = db.UpdateTable(db.ConnStr, guangye.GetUpdateSql(dtable, filter, flds, types) + ";if exists (select mocode from gmis_mo_1197 where modulecode=" + mid + " and datamocode=" + id + ") update gmis_mo_1197 set orgname='" + fld_1201_1.Value + "',featurecode=" + featurecode.Value + " where modulecode=" + mid + " and datamocode=" + id + " else insert into gmis_mo_1197 (orgname,featurecode,modulecode,datamocode) values ('" + fld_1201_1.Value + "'," + featurecode.Value + "," + mid + "," + id + ")");
                    if (exeinfo == "操作成功！")
                    {
                        SetSESSION("alert", exeinfo);
                        //Response.Redirect("edit_1201.aspx?id=" + id + "&upsonid=" + upsonid);
                    }
                }
            }
            else
            {
                exeinfo = GetSESSION("alert");
            }
            break;
    }

    alertmiddle.InnerText = exeinfo;
}

/*更新排序结构,dtable:表名，fmocodename:编号字段名，findexname:索引字段名,fpositionname:同级排序,fuppercodename:直属上级字段名
 */
private string UpdateTypeIndex(string dtable, string fmocodename, string flevelname, string findexname, string fpositionname, string fuppercodename)
{
    sb = new StringBuilder();
    if (db.UpdateTable(db.ConnStr, "update " + dtable + " set " + findexname + "=" + fmocodename + " where " + flevelname + "=1 ") == "操作成功！")
    {
        DataTable dt = db.GetDataTable(db.ConnStr, "select " + fmocodename + "," + flevelname + " as level," + fuppercodename + " as uppercode from " + dtable + "  order by " + findexname + " ");
        GetTypeIndexSQl("1.", "Level=1", dt, dtable, fmocodename, findexname, fpositionname);
    }
    return "Begin " + sb.ToString() + " End";
}

private void GetTypeIndexSQl(string pindex, string filter, DataTable dt, string dtable, string fmocodename, string findexname, string fpositionname)
{
    DataRow[] drs = dt.Select(filter, "");
    for (int i = 0; i < drs.Length; i++)
    {
        string tindex = pindex + (i + 1).ToString().PadLeft(3, '0');
        sb.Append("update " + dtable + " set " + findexname + "='" + tindex + "'," + fpositionname + "=" + Convert.ToString(i + 1) + " where " + fmocodename + "='" + drs[i][fmocodename].ToString() + "';");
        if (dt.Select("UpperCode='" + drs[i][fmocodename].ToString() + "'", "").Length > 0)
        {
            GetTypeIndexSQl(tindex, "UpperCode='" + drs[i][fmocodename].ToString() + "'", dt, dtable, fmocodename, findexname, fpositionname);
        }
    }
}
//验证输入字段类型
private void CheckMustAndFieldType(string mid)
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
</script> 
    <td nowrap style="padding-left:5px;"><G:Button id="btn_up" type="toolbar" icon="up" mode="on" text="上移" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td nowrap style="padding-left:5px;"><G:Button id="btn_down" type="toolbar" icon="down" mode="on" text="下移" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td width="100%" nowrap style="padding-left:5px;"><span id="alertmiddle" runat="server" style="color:Red;"></span></td>
    <td nowrap style="padding-right:5px;"><G:Button id="btn_backlist" type="toolbar" icon="tb13"  mode="on" text="返回列表" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td nowrap style="padding-right:5px;"><G:Button id="btn_newson" type="toolbar" icon="tb01"  mode="on" text="新增" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td nowrap style="padding-right:5px;"><G:Button id="btn_newsubson" type="toolbar" icon="tb01"  mode="on" text="新增子项" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td nowrap style="padding-right:5px;"><G:Button id="btn_deleteson" type="toolbar" icon="tb06"  mode="on" text="删除" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td nowrap style="padding-right:5px;"><G:Button id="btn_saveson" type="toolbar" icon="tb05"  mode="on" text="保存" onclick="Click_Toolbar" runat="server"></G:Button></td>
