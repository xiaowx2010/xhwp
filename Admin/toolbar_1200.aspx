<script language="c#" runat="server">
    StringBuilder sb;
//ȡ�ò㼶
private string GetSonLevel(string upcode)
{
    if (upcode != "0")
    {
        DataTable dt = db.GetDataTable(db.ConnStr, "select fld_1200_3+1 from gmis_mo_1200 where mocode=" + upcode);
        if (dt.Rows.Count > 0)
        {
            return dt.Rows[0][0].ToString();
        }
    }
    return "1";
}

//��ť�¼�
private void Click_Toolbar(object sender, System.EventArgs e)
{
    string exeinfo = "";
    string idstr = ((Control)sender).ID.ToLower();

    switch (idstr)
    {
        case "btn_backlist":
            Response.Redirect("getpage.aspx?mid=1200");
            break;
        case "btn_newson":
            Response.Redirect("edit_1200.aspx?upsonid=0&id=0&aid=" + StringUtility.StringToBase64("edit"));
            break;
        case "btn_newsubson":
            if (id != "0")
            {
                Response.Redirect("edit_1200.aspx?upsonid=" + id + "&id=0&aid=" + StringUtility.StringToBase64("edit"));
            }
            break;
        case "btn_up":
        case "btn_down":
            exeinfo = ChangeOneTypeIndex(idstr, dtable, "mocode", "fld_1200_6", "fld_1200_5", "fld_1200_4");
            break;
        case "btn_deleteson":
            exeinfo = db.UpdateTable(db.ConnStr, "delete gmis_mo_1200 where mocode in (select mocode from gmis_mo_1200 where fld_1200_6 like '%'+(select fld_1200_6 from gmis_mo_1200 where mocode=" + id + ")+'%')");
            if (exeinfo == "�����ɹ���")
            {
                SetSESSION("alert", exeinfo);
                Response.Redirect("edit_1200.aspx?id=0");
            }
            break;
        case "btn_saveson":
            SetSESSION("alert", "");
            CheckMustAndFieldType("1200");
            CheckSave();
            if (GetSESSION("alert").Length == 0)
            {
                if (id == "0")
                {
                    DataTable dt = db.GetDataTable(db.ConnStr, guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'MoCode';");
                    if (dt.Rows.Count > 0)
                    {
                        exeinfo = guangye.ExeBySql(UpdateTypeIndex("gmis_mo_1200", "mocode", "fld_1200_3", "fld_1200_6", "fld_1200_5", "fld_1200_4"), 1);
                        SetSESSION("alert", exeinfo);
                        Response.Redirect("edit_1200.aspx?id=" + dt.Rows[0][0].ToString() + "&upsonid=" + upsonid);

                    }
                    else
                    {
                        exeinfo = "�������ɹ���";
                    }
                }
                else
                {
                    exeinfo = db.UpdateTable(db.ConnStr, guangye.GetUpdateSql(dtable, filter, flds, types));
                    //exeinfo = guangye.GetUpdateSql(dtable, filter, flds, types);
                    if (exeinfo == "�����ɹ���")
                    {
                        SetSESSION("alert", exeinfo);
                        Response.Redirect("edit_1200.aspx?id=" + id + "&upsonid=" + upsonid);
                    }
                }
            }
            else
            {
                exeinfo = GetSESSION("alert");
            }
            break;

        case "btn_clear":
            if (flds != null)
            {
                guangye.ClearData(flds);
            }
            break;
    }

    alertmiddle.InnerText = exeinfo;
}

/*��������ṹ,dtable:������fmocodename:����ֶ�����findexname:�����ֶ���,fpositionname:ͬ������,fuppercodename:ֱ���ϼ��ֶ���
 */
private string UpdateTypeIndex(string dtable, string fmocodename, string flevelname, string findexname, string fpositionname, string fuppercodename)
{ 
    sb = new StringBuilder(); 
    if (db.UpdateTable(db.ConnStr, "update " + dtable + " set " + findexname + "=" + fmocodename + " where " + flevelname + "=1 ") == "�����ɹ���")
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
//��֤�����ֶ�����
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
                if (Convert.ToBoolean(fdr["OnEditMust"]))//������
                {
                    if (h_vreturn == "")
                    {
                        astr.Append(fdr["caption"].ToString() + "����Ϊ�գ�");
                    }
                }
                if (h_vreturn.Length > 0)
                {
                    switch (fdr["fieldtypecode"].ToString())
                    {
                        case "1"://�������͵���֤����
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
                                astr.Append(fdr["caption"].ToString() + "�ַ������ܳ���" + h_intdatelength.ToString() + "��");
                            }

                            break;
                        case "2"://����
                        case "11"://С����
                            try
                            {
                                Convert.ToInt32(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "Ӧ����������");
                            }
                            break;
                        case "10"://������                
                            try
                            {
                                Convert.ToDouble(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "Ӧ�������֣�");
                            }
                            break;
                        case "7"://����                
                            try
                            {
                                Convert.ToDateTime(h_vreturn);
                            }
                            catch
                            {
                                astr.Append(fdr["caption"].ToString() + "Ӧ�������ڸ�ʽ��");
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
//����ַ�������ʵ����
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
//����֮ǰ��������֤����
//private void CheckSave()
//{
    //if (fld_1200_3.SelectedItem != null && fld_1200_3.SelectedValue != "1" && fld_1200_4.SelectedItem == null)
    //{
    //    SetSESSION("alert", GetSESSION("alert") + "ֱ���ϼ�����Ϊ�գ�");
    //}

    //fld_1200_3.Value = (fld_1200_4.SelectedItem != null) ? fld_1200_4.SelectedItem.Value : "0";
//}

</script> 
    <td nowrap style="padding-left:5px;" id="td_btn_up" runat="server"><G:Button id="btn_up" type="toolbar" mode="on" text="ͬ��������" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td nowrap style="padding-left:5px;" id="td_btn_down" runat="server"><G:Button id="btn_down" type="toolbar" mode="on" text="ͬ��������" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td width="100%" nowrap style="padding-left:5px;"><span id="alertmiddle" runat="server" style="color:Red;"></span></td>
    <td nowrap style="padding-right:5px;" id="td_btn_backlist" runat="server"><G:Button id="btn_backlist" type="toolbar" icon="tb13"  mode="on" text="�����б�" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td nowrap style="padding-right:5px;" id="td_btn_newson" runat="server"><G:Button id="btn_newson" type="toolbar" icon="tb01"  mode="on" text="����" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td nowrap style="padding-right:5px;" id="td_btn_newsubson" runat="server"><G:Button id="btn_newsubson" type="toolbar" icon="tb01"  mode="on" text="��������" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td id="tb_btn_clear" visible="false" runat="server" style="padding-right:5px;width:55px;" nowrap><G:Button id="btn_clear" type="toolbar" mode="on" icon="tb06" text="���" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td nowrap style="padding-right:5px;" id="td_btn_deleteson" runat="server"><G:Button id="btn_deleteson" type="toolbar" icon="tb06"  mode="on" text="ɾ��" onclick="Click_Toolbar" runat="server"></G:Button></td>
    <td nowrap style="padding-right:5px;" id="td_btn_saveson" runat="server"><G:Button id="btn_saveson" type="toolbar" icon="tb05"  mode="on" text="����" onclick="Click_Toolbar" runat="server"></G:Button></td>
