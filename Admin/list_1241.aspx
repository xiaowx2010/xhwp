<!--ȫ��ҵ�Զ���߼���ѯ,�б�ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    string p_str, p_str2;//JS
    string p_qystr = "";//JS,������
private void Page_Load(object sender, System.EventArgs e)
{
    id = GetQueryString("id","0");
    if (!IsPostBack)
    {
        //��ѯģ��
        BindListControl(edition, "mocode", "fld_1241_1", "select mocode,fld_1241_1 from gmis_mo_1241 order by mocode", "��ģ��");
        SetFilter(edition, id);
        //��ҵ������Ϣ�ֶ�
        BindListControl(s_field1,"fieldname","caption","select fieldname,caption from gmis_field where modulecode=1202 and isvital=0 and fieldcode<26793");
        //��ҵ�������������ֶ�
        BindListControl(area, "fld_1201_6", "fld_1201_1", "select distinct fld_1201_1,fld_1201_6 from gmis_mo_1201", "��ѡ����������");
        SetFilter(area, "0");
        //��Ⱦ���ŷ�����ֶ�
        BindListControl(s_field2, "mocode", "fld_1236_1", "select mocode,fld_1236_1 from gmis_mo_1236");
        //��ҵ������Ϣ������
        BindConrolData(compare1);
        //��Ⱦ�������
        BindConrolData(compare2);
        //������Ϣ������
        BindConrolData(compare3);
        //������Ϣ���
        BindListControl(type3,"modulecode","modulename","select modulecode ,modulename from gmis_module where modulecode=1125 or modulecode=1127 or modulecode=1128","��ѡ��");
        SetFilter(type3,"0");
        //����
        BindListControl(s_sortfield, "fieldname", "caption", "select fieldname,caption from gmis_field where (modulecode=1202 or modulecode=1235)  and isvital=0 and (fieldcode<26793 or fieldcode>26973)");

    }
    if (id != "0")
    {
        AppLoad();
        guangye.SetControlValue(selectfiled,"1");//�ж��Ƿ���Ҫ��ʾ�ֶ�
    }
    btn_loadedition.Url = "list_1241.aspx?id=" + guangye.GetControlValue(edition);
 }

/*
 * ����:BindConrolData()
 * ���ܣ��󶨲�������ֵ
 */
private void BindConrolData(ListControl _c)
{
    _c.Items.Add(new ListItem("����", "="));
    _c.Items.Add(new ListItem("����", ">"));
    _c.Items.Add(new ListItem("���ڵ���", ">="));
   _c.Items.Add(new ListItem("С��", "<"));
   _c.Items.Add(new ListItem("С�ڵ���", "<="));
   _c.Items.Add(new ListItem("������", "like"));
}
/*
 * ����: SaveThis(object sender,System.EventArgs e)
 * ���ܣ�����ģ��
 */
private void SaveThis(object sender,System.EventArgs e)
{
    //Response.Write(GetSESSION("extsql") + GetSESSION("sql"));
    StringBuilder sb_sql = new StringBuilder();
    sb_sql.Append("begin ");
    sb_sql.Append("update gmis_mo_1241 set fld_1241_1='" + guangye.GetControlValue(fld_1241_1) + "',fld_1241_2='" +fld_1241_2_1.Value.ToString().Trim(',') + "',fld_1241_3='" + guangye.GetControlValue(f4_v) + "',fld_1241_4='"+guangye.GetControlValue(mid_v)+"' where mocode="+guangye.GetControlValue(edition)+"");
    sb_sql.Append(";select @@IDENTITY AS 'mocode';declare @MoID_1241 int; SELECT @MoID_1241=@@IDENTITY;");
    string[] h_str1_1 = fld_1242_2_1.Value.Trim('#').Split('#');//��ҵsql
    string[] h_str1_2 = guangye.GetControlValue(f1_v).Trim(';').Split(';');//��ҵtext

    string[] h_str2_1 = fld_1242_2_2.Value.Trim('#').Split('#');//����sql
    string[] h_str2_2 = guangye.GetControlValue(f2_v).Trim(';').Split(';');//����text

    string[] h_str3_1 = fld_1242_2_3.Value.Trim('#').Split('#');//����sql
    string[] h_str3_2 = guangye.GetControlValue(f3_v).Trim(';').Split(';');//����text
    sb_sql.Append(";delete gmis_mo_1242 where fld_1242_1="+guangye.GetControlValue(edition)+";");
    //�����ֶ�:1-��ҵ��2-���ۣ�3-������
    for (int i = 0; i < h_str1_1.Length; i++)
    {
        if (h_str1_1[i] != "")
            sb_sql.Append("Insert into gmis_mo_1242(fld_1242_1,fld_1242_2,fld_1242_3,fld_1242_4,fld_1242_5) values(" + guangye.GetControlValue(edition) + ",'" + StringUtility.StringToBase64(h_str1_1[i].ToString()) + "','" + h_str1_2[i].ToString() + "'," + i + ",1);");
    }
    for (int i = 0; i < h_str2_1.Length; i++)
    {
        if (h_str2_1[i] != "")
            sb_sql.Append("Insert into gmis_mo_1242(fld_1242_1,fld_1242_2,fld_1242_3,fld_1242_4,fld_1242_5) values(" + guangye.GetControlValue(edition) + ",'" + StringUtility.StringToBase64(h_str2_1[i].ToString()) + "','" + h_str2_2[i].ToString() + "'," + i + ",2);");
    }
    for (int i = 0; i < h_str3_1.Length; i++)
    {
        if (h_str3_1[i] != "")
            sb_sql.Append("Insert into gmis_mo_1242(fld_1242_1,fld_1242_2,fld_1242_3,fld_1242_4,fld_1242_5) values(" + guangye.GetControlValue(edition) + ",'" + StringUtility.StringToBase64(h_str3_1[i].ToString()) + "','" + h_str3_2[i].ToString() + "'," + i + ",3);");

    }
    if (GetSESSION("extsql") != "") sb_sql.Append(GetSESSION("extsql"));
    sb_sql.Append(" end");
    string exinfo = guangye.ExeBySql(sb_sql.ToString(), 1);
    if (exinfo == "�����ɹ���")
    {
       // alertmess.InnerText = "�����ɹ���";
        SetSESSION("extsql", "");
        Response.Redirect("list_1241.aspx?id="+id+"");
    }

}
/*
 * ����: SaveOther(object sender, System.EventArgs e)
 * ���ܣ����ģ��
 */
private void SaveOther(object sender, System.EventArgs e)
{
    db.SqlString = "select fld_1241_1 from gmis_mo_1241 where fld_1241_1='"+guangye.GetControlValue(fld_1241_1)+"'";
    DataTable h_dt = db.GetDataTable();
    if (h_dt.Rows.Count > 0)
    {
        alertmess.InnerText = "�����ظ�ģ������";
    }
    else
    {
        StringBuilder sb_sql = new StringBuilder();
        sb_sql.Append("begin ");
        sb_sql.Append("Insert into gmis_mo_1241(fld_1241_1,fld_1241_2,fld_1241_3,fld_1241_4) values('" + guangye.GetControlValue(fld_1241_1) + "','" + guangye.GetControlValue(fld_1241_2_1) + "','" + guangye.GetControlValue(f4_v) + "','"+guangye.GetControlValue(mid_v)+"')");
        sb_sql.Append(";select @@IDENTITY AS 'mocode';declare @MoID_1241 int; SELECT @MoID_1241=@@IDENTITY;");

        string[] h_str1_1 = fld_1242_2_1.Value.Trim('#').Split('#');//��ҵsql
        //string[] h_str1_2 = guangye.GetControlValue(s_fstr1).Trim('.').Split('.');//��ҵtext
        string[] h_str1_2 = guangye.GetControlValue(f1_v).Trim(';').Split(';');//��ҵtext

        string[] h_str2_1 = fld_1242_2_2.Value.Trim('#').Split('#');//����sql
        string[] h_str2_2 = guangye.GetControlValue(f2_v).Trim(';').Split(';');//����text

        string[] h_str3_1 = fld_1242_2_3.Value.Trim('#').Split('#');//����sql
        string[] h_str3_2 = guangye.GetControlValue(f3_v).Trim(';').Split(';');//����text
        //�����ֶ�:1-��ҵ��2-���ۣ�3-������
        for (int i = 0; i < h_str1_1.Length; i++)
        {
            if (h_str1_1[i] != "")
                sb_sql.Append("Insert into gmis_mo_1242(fld_1242_1,fld_1242_2,fld_1242_3,fld_1242_4,fld_1242_5) values(@MoID_1241,'" + StringUtility.StringToBase64(h_str1_1[i].ToString()) + "','" + h_str1_2[i].ToString() + "'," + i + ",1);");
        }
        for (int i = 0; i < h_str2_1.Length; i++)
        {
            if (h_str2_1[i] != "")
                sb_sql.Append("Insert into gmis_mo_1242(fld_1242_1,fld_1242_2,fld_1242_3,fld_1242_4,fld_1242_5) values(@MoID_1241,'" + StringUtility.StringToBase64(h_str2_1[i].ToString()) + "','" + h_str2_2[i].ToString() + "'," + i + ",2);");
        }
        for (int i = 0; i < h_str3_1.Length; i++)
        {
            if (h_str3_1[i] != "")
                sb_sql.Append("Insert into gmis_mo_1242(fld_1242_1,fld_1242_2,fld_1242_3,fld_1242_4,fld_1242_5) values(@MoID_1241,'" + StringUtility.StringToBase64(h_str3_1[i].ToString()) + "','" + h_str3_2[i].ToString() + "'," + i + ",3);");

        }
        if (id != "0"&&GetSESSION("sql")=="")//���Ϊģ��ʱ�����������ֶ�ֱ�Ӵӱ���ȡ��ԭ���ݵ���ʵ�ֶ�
        {
            db.SqlString = "select fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5 from gmis_mo_1243 where fld_1243_6="+id+"";
            DataTable h_dt1243 = db.GetDataTable();
            if (h_dt1243.Rows.Count > 0)
            {
                foreach (DataRow dr in h_dt1243.Rows)
                {
                    sb_sql.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + dr[0].ToString() + "','" +dr[1].ToString() + "','" + dr[2].ToString()+ "','" + dr[3].ToString() + "','" + dr[4].ToString() + "',@MoID_1241);");
                }
            }
        }
        else  sb_sql.Append(GetSESSION("sql"));
        sb_sql.Append(" end");
        db.SqlString = sb_sql.ToString();
        string h_id="";//��ǰ���ݵ�ID
        DataTable h_dtt = db.GetDataTable();//�ڴ��
        if (h_dtt.Rows.Count > 0)
        {
            h_id=h_dtt.Rows[0][0].ToString();
        //}
        //string exinfo = guangye.ExeBySql(sb_sql.ToString(), 1);
        //if (exinfo == "�����ɹ���")
        //{
            alertmess.InnerText = "�����ɹ���";
            SetSESSION("sql", "");

            Response.Redirect("list_1241.aspx?id="+h_id);
        }
    }
}
    /*
     * ������AppLoad()
     * ���ܣ������ݰ�������
     */
private void AppLoad()
{
    s_fstr1.Value = "";
    s_fstr2.Value = "";
    s_fstr3.Value = "";
    s_fstr4.Value = "";
    db.SqlString = "select fld_1241_1,fld_1241_2,fld_1241_3,fld_1241_4,fld_1242_1,fld_1242_2,fld_1242_3,fld_1242_4,fld_1242_5 from gmis_mo_1241 a left outer join gmis_mo_1242 b on a.mocode=b.fld_1242_1 where a.mocode=" + id;//+ guangye.GetControlValue(edition);
    DataTable h_dt = db.GetDataTable();//�ڴ��
    if (h_dt.Rows.Count > 0)
    {
        p_qystr += "objCondition1.Clear();objCondition2.Clear();objCondition3.Clear();objCondition4.Clear();";

        if (!IsPostBack)
        {
            fld_1241_1.Value = h_dt.Rows[0]["fld_1241_1"].ToString();
        }
        mid_v.Value = h_dt.Rows[0]["fld_1241_4"].ToString();
        p_qystr += "objCondition4.AddItem(\"" +h_dt.Rows[0]["fld_1241_2"].ToString().Trim(',') + "\",\"" + h_dt.Rows[0]["fld_1241_3"].ToString() + "\");";

        DataRow [] qydr=h_dt.Select("fld_1242_5=1");
        if(qydr.Length>0)
        {
            foreach (DataRow dr in qydr)
            {
                p_qystr += "objCondition1.AddItem(\"" +StringUtility.Base64ToString(dr["fld_1242_2"].ToString()) + "\",\"" + dr["fld_1242_3"].ToString() + ";\");";              
            }
        }
        DataRow[] wrwdr = h_dt.Select("fld_1242_5=2");
        if (wrwdr.Length > 0)
        {
            foreach (DataRow dr in wrwdr)
            {
                p_qystr += "objCondition2.AddItem(\"" + StringUtility.Base64ToString(dr["fld_1242_2"].ToString()) + "\",\"" + dr["fld_1242_3"].ToString() + ";\");";
            }
        }
        DataRow[] qtdr = h_dt.Select("fld_1242_5=3");
        if (qtdr.Length > 0)
        {
            foreach (DataRow dr in qtdr)
            {
                p_qystr += "objCondition3.AddItem(\"" + StringUtility.Base64ToString(dr["fld_1242_2"].ToString()) + "\",\"" + dr["fld_1242_3"].ToString() + ";\");";
            }
        }
    }
}
/*
 * ������Click_Search(object sender,System.EventArgs e)
 * ���ܣ���ѯ�����ʾ
 */
private void Click_Search(object sender,System.EventArgs e)
{
    string[] h_str1_1 = fld_1242_2_1.Value.Trim('#').Split('#');//��ҵsql
    string[] h_str2_1 = fld_1242_2_2.Value.Trim('#').Split('#');//����sql
    string[] h_str3_1 = fld_1242_2_3.Value.Trim('#').Split('#');//����sql
    string h_fstr1 = "",h_fstr2="",h_fstr3="";//����
    for (int i = 0; i < h_str1_1.Length; i++)
    {
        h_fstr1 += h_str1_1[i];
    }
    for (int i = 0; i < h_str2_1.Length; i++)
    {
        h_fstr2 += h_str2_1[i];
    }
    for (int i = 0; i < h_str3_1.Length; i++)
    {
        h_fstr3 += h_str3_1[i];
    }
    h_fstr1 = h_fstr1 + "*" + h_fstr2 + "*" + h_fstr3+"*"+fld_1241_2_1.Value.ToString().Trim(',');
    SetSESSION("filter",h_fstr1);
	//SetSESSION("year",guangye.GetControlValue(yearList));
    Page.RegisterStartupScript("str", "<s" + "cript>window.open('pop_1241_2.aspx?id="+guangye.GetControlValue(edition)+"');</s" + "cript>");
}
private void ClearAll(object sender,System.EventArgs e)
{
    Response.Redirect("list_1241.aspx");
}
</script>

<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<input id="selectfiled"  runat="server" type="hidden"/><!--�����ж��Ƿ�ѡ���ֶ�-->
<input id="fld_1242_2_1" runat="server" type="hidden"/><!--���SQL����(��ҵ��Ϣ)-->
<input id="fld_1242_2_2" runat="server" type="hidden"/><!--���SQL��������Ⱦ���ŷţ�-->
<input id="fld_1242_2_3" runat="server" type="hidden"/><!--���SQL������������-->
<input id="fld_1241_2_1" runat="server" type="hidden" /><!--���SQL����-->
<input id="fld_1242_2" runat="server" type="hidden" /><!--������е�SQL�����Լ�������䣬������ҳ��ȡ-->
<input id="showcaption" runat="server" type="hidden"  /><!--���������Ϊ�������ֶΣ�������ҳ��ȡ-->
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1"  class="table_graybgcolor">
		<tr >
			<td colspan="1" align="right" style="pading-right:5px;" width="100" class="td_viewcontent_title">��ѯģ��&nbsp;</td>			
			<td colspan="3" class="td_viewcontent_content" align="left">
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="88%"  style="padding-left:0px" >
						<!--��ѯģ��-->
						    <asp:DropDownList ID="edition" runat="server" Width="90%" AutoPostBack="true"></asp:DropDownList>
						<!--��ѯģ��-->	
						</td>
						<td width="12%" align="center" >
							<table border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td class="btn_L_pic"></td>
                                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="bottom" class="btn_text">
									  <!--Ӧ��ģ��-->
									  <G:Button id="btn_loadedition" type="toolbar" mode="on" icon="tb11" text="Ӧ��ģ��" runat="server"></G:Button>
									  <!--Ӧ��ģ��-->
									  </td>
                                    </tr>
                                </table></td>
                                <td class="btn_R_pic"></td>
                              </tr>
                            </table>
					  </td>
					</tr>
				</table>
			</td>	
		</tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1"  class="table_graybgcolor">
		<tr >
			<td colspan="1" align="right" style="pading-right:5px;" width="100" class="td_viewcontent_title">�������&nbsp;</td>			
			<td colspan="3" class="td_viewcontent_content" align="left">
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="88%"  style="padding-left:0px" >
						<!--��ѯģ��-->
						    <asp:DropDownList ID="yearList" runat="server" Width="90%">
								<asp:ListItem Text="2007" Value="2007" />
								<asp:ListItem Text="2009" Value="2009" />
							</asp:DropDownList>
						<!--��ѯģ��-->	
						</td>
					</tr>
				</table>
			</td>	
		</tr>
	</table>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1"  class="table_graybgcolor">
		<tr >
			<td colspan="4" align="center" valign="middle" style="pading-right:5px;"  class="td_viewcontent_title" nowrap>��ҵ������Ϣ</td>
		</tr>
		<tr >
			<td align="right"  width="100"  class="td_viewcontent_title">�ֶ���&nbsp;</td>	
			<td align="center" class="td_viewcontent_content" style="width:35%"><!--�����ֶ�-->
						<asp:DropDownList ID="s_field1" Style="height:20px;width:95%" runat="server">
						</asp:DropDownList>
						<!--�����ֶ�--></td>	
			<td align="right" width="100"   class="td_viewcontent_title">������&nbsp;</td>	
			<td align="center"  class="td_viewcontent_content"><!--�Ƚ�����-->
						<asp:DropDownList ID="compare1" Style="width: 95%" runat="server">
						</asp:DropDownList>
						<!--�Ƚ�����-->&nbsp;</td>	
		</tr>
		<tr >
			<td align="right"  width="100"  class="td_viewcontent_title">ֵ&nbsp;</td>	
			<td align="center" class="td_viewcontent_content"><input id="comparekey1" style="width:95%" runat="server" type="text" /></td>	
			<td align="right"  width="100"  class="td_viewcontent_title">��������&nbsp;</td>	
			<td align="center" class="td_viewcontent_content" style="width:35%"><!--�����ֶ�-->
						<asp:DropDownList ID="area" Style="height:20px;width:95%" runat="server">
						</asp:DropDownList>
						<!--�����ֶ�--></td>	
		</tr>
		<tr >
			<td align="right" width="100"   class="td_viewcontent_title">����һ������ϵ&nbsp;</td>	
			<td align="left"  class="td_viewcontent_content">
			<table border="0" cellpadding="0" cellspacing="0"><tr><td>
			<input type="radio" name="connection" id="and1" checked runat=server>          
							����
							<input type="radio" name="connection" id="or1" runat=server> 
							����&nbsp;</td><td style="padding-left:20px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--�������-->
								  <G:Button id="btn_s_add1" type="toolbar" mode="on" icon="" text="���"  url="javascript:conAdd1()" runat=server></G:Button>
								  <!--�������-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--ȡ������-->
								  <G:Button id="btn_s_cancel1" type="toolbar" mode="on" icon="" text="ȡ��"  url="javascript:conCancel1()" runat=server></G:Button>
								  <!--ȡ������-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--ȡ������-->
								  <G:Button id="btn_s_clear1" type="toolbar" mode="on" icon="" text="���"  url="javascript:conClear1()" runat=server></G:Button>
								  <!--ȡ������-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table></td><td><span id="alert1" runat="server" style="color:Red;"></span></td></tr></table></td>	
			<td align="right" width="100"   class="td_viewcontent_title">&nbsp;</td>	
			<td align="center"  class="td_viewcontent_content">&nbsp;</td>	
		</tr>
		<tr>
		<td align="right"  width="100"  class="td_viewcontent_title">��ѯ��������&nbsp;</td>	
		<td colspan="3"  class="td_viewcontent_content">	
		<!--������ʾ��-->
				<textarea id="s_fstr1" style="width:98%; height:150px;"  runat="server"  contenteditable="false" ></textarea>
				<input id="f1_v" runat="server" type="hidden" /><!--�ݴ�s_fstr1ֵ-->
		<!--������ʾ��-->
        </td>
        </tr>

		<tr >
			<td colspan="4" align="center" style="pading-right:5px;"  class="td_viewcontent_title">��Ⱦ���ŷ����&nbsp;</td>		
		</tr>
		<tr>
		<td align="right"  width="100"  class="td_viewcontent_title">���&nbsp;</td>	
			<td align="center" class="td_viewcontent_content">
			            &nbsp;<asp:DropDownList id="hytype" runat="server" Width="95%"><asp:ListItem Value="0">ȫ����ѯ</asp:ListItem><asp:ListItem Value="1">��ҵԴ</asp:ListItem><asp:ListItem Value="2">����Դ</asp:ListItem></asp:DropDownList>&nbsp;</td>
				<td align="right"  width="100"  class="td_viewcontent_title">&nbsp;</td>	
			<td align="center"  class="td_viewcontent_content">&nbsp;</td>

		</tr>
		<tr >
			<td align="right"  width="100"  class="td_viewcontent_title">��Ⱦ��&nbsp;</td>	
			<td align="center" class="td_viewcontent_content"><!--�����ֶ�--><asp:DropDownList ID="s_field2" Style="height:20px;width:95%" runat="server">
						</asp:DropDownList></td>	
			<td align="right" width="100"   class="td_viewcontent_title">����&nbsp;</td>	
			<td align="center"  class="td_viewcontent_content"><!--����-->
						<asp:DropDownList ID="type2" Style="width: 95%" runat="server">
							<asp:ListItem Value="fld_1235_3">������</asp:ListItem>
							<asp:ListItem Value="fld_1235_4">�ŷ���</asp:ListItem>								
						</asp:DropDownList>
						<!--���ͼ�-->&nbsp;</td>	
		</tr>
			<tr >
			<td align="right"  width="100"  class="td_viewcontent_title">���㷽��&nbsp;</td>	
			<td align="center" class="td_viewcontent_content"><!--���㷽��-->
						<asp:DropDownList ID="way2" Style="height:20px;width:95%" runat="server"><asp:ListItem Value="0">��ͨ</asp:ListItem><asp:ListItem Value="1">�ܼ�</asp:ListItem><asp:ListItem Value="2">ϵ����</asp:ListItem><asp:ListItem Value="3">ʵ�ʼ��</asp:ListItem>
						</asp:DropDownList></td>	
			<td align="right" width="100"   class="td_viewcontent_title">������&nbsp;</td>	
			<td align="center"  class="td_viewcontent_content"><!--����-->
						<asp:DropDownList ID="compare2" Style="width: 95%" runat="server">
						</asp:DropDownList>
						<!--���ͼ�-->&nbsp;</td>	
		</tr>
		<tr >
			<td align="right"  width="100"  class="td_viewcontent_title">ֵ&nbsp;</td>	
			<td align="center" class="td_viewcontent_content"><input id="comparekey2" style="width:95%" runat="server" type="text" />&nbsp;</td>	
			<td align="right" width="100"   class="td_viewcontent_title">����һ������ϵ&nbsp;</td>	
			<td align="left"  class="td_viewcontent_content"><table border="0" cellpadding="0" cellspacing="0"><tr><td><input type="radio" name="connection" id="and2" checked runat=server>����<input type="radio" name="connection" id="or2" runat=server> ����&nbsp;</td>
			<td style="padding-left:20px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--�������-->
								  <G:Button id="btn_s_add2" type="toolbar" mode="on" icon="" text="���" Url="javascript:conAdd2()"   runat=server></G:Button>
								  <!--�������-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--ȡ������-->
								  <G:Button id="btn_s_cancel2" type="toolbar" mode="on" icon="" text="ȡ��"  url="javascript:conCancel2()" runat=server></G:Button>
								  <!--ȡ������-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--ȡ������-->
								  <G:Button id="btn_s_clear2" type="toolbar" mode="on" icon="" text="���"  url="javascript:conClear2()" runat=server></G:Button>
								  <!--ȡ������-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table></td><td><span id="alert2" runat="server" style="color:Red;"></span></td></tr></table></td>	
		</tr>
		<tr>
		<td align="right"  width="100"  class="td_viewcontent_title">��ѯ��������&nbsp;</td>	
		<td colspan="3"  class="td_viewcontent_content">	
		<!--������ʾ��-->
							<textarea id="s_fstr2" style="width:98%; height:150px;"  runat="server"  contenteditable="false" ></textarea>
<input id="f2_v" runat="server" type="hidden" /><!--�ݴ�s_fstr2ֵ-->
		<!--������ʾ��-->
        </td>
        </tr>
		<tr >
			<td colspan="4" align="center" style="pading-right:5px;"  class="td_viewcontent_title">������Ϣ&nbsp;</td>		
		</tr>
		<tr >
			<td align="right"  width="100"  class="td_viewcontent_title">���&nbsp;</td>	
			<td align="center" class="td_viewcontent_content"><!--����ֶ�-->
						<asp:DropDownList ID="type3" Style="height:20px;width:95%" runat="server" onchange="if(this.value != '') setTypes(this.options[this.selectedIndex].value);">
						</asp:DropDownList>
						<!--����ֶ�--></td>	
			<td align="right" width="100"   class="td_viewcontent_title">����&nbsp;</td>	
			<td align="center"  class="td_viewcontent_content"><!--����-->
						<asp:DropDownList ID="tabname" runat="server" Style="height:20px;width:95%" onchange="if(this.value != '') setTable(this.options[this.selectedIndex].value);"><asp:ListItem Value="0">��ѡ��</asp:ListItem></asp:DropDownList>
						&nbsp;</td>	
		</tr>
			<tr >
			<td align="right"  width="100"  class="td_viewcontent_title">�ֶα���&nbsp;</td>	
			<td align="center" class="td_viewcontent_content"><!--�ֶ�-->
						<asp:DropDownList ID="s_field3" Style="height:20px;width:95%" runat="server"><asp:ListItem Value="0">��ѡ��</asp:ListItem>
						</asp:DropDownList>
						<!--�ֶ�--></td>	
			<td align="right" width="100"   class="td_viewcontent_title">������&nbsp;</td>	
			<td align="center"  class="td_viewcontent_content"><!--�Ƚ�����-->
						<asp:DropDownList ID="compare3" Style="width: 95%" runat="server">
						</asp:DropDownList>
						<!--�Ƚ�����--></td>	
		</tr>
		<tr >
			<td align="right"  width="100"  class="td_viewcontent_title">ֵ&nbsp;</td>	
			<td align="center" class="td_viewcontent_content"><input id="comparekey3" style="width:95%" runat="server" type="text" /></td>	
			<td align="right" width="100"   class="td_viewcontent_title">����һ������ϵ&nbsp;</td>	
			<td align="left"  class="td_viewcontent_content"><table border="0" cellpadding="0" cellspacing="0"><tr><td><input type="radio" name="connection" id="and3" runat=server>����<input type="radio" name="connection" id="or3" runat=server> ����&nbsp;</td>
			<td style="padding-left:20px"><table border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--�������-->
								  <G:Button id="btn_s_add3" type="toolbar" mode="on" icon="" text="���" Url="javascript:conAdd3();"   runat=server></G:Button>
								  <!--�������-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--ȡ������-->
								  <G:Button id="btn_s_cancel3" type="toolbar" mode="on" icon="" text="ȡ��"  url="javascript:conCancel3()" runat=server></G:Button>
								  <!--ȡ������-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--ȡ������-->
								  <G:Button id="btn_s_clear3" type="toolbar" mode="on" icon="" text="���"  url="javascript:conClear3()" runat=server></G:Button>
								  <!--ȡ������-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table></td><td><span id="alert3" runat="server" style="color:Red;"></span></td></tr></table></td>	
		</tr>
		<tr>
		<td align="right"  width="100"  class="td_viewcontent_title">��ѯ��������&nbsp;</td>	
		<td colspan="3"  class="td_viewcontent_content">	
		<!--������ʾ��-->
	<textarea id="s_fstr3" style="width:98%; height:150px;"   runat="server" contenteditable="false" ></textarea>		<!--������ʾ��-->
	<input id="f3_v" runat="server" type="hidden" /><!--�ݴ�s_fstr3ֵ-->
        </td>
        </tr>
<%--</table>
<table  width="100%" border="0" align="center" cellpadding="3" cellspacing="1"  class="table_graybgcolor">--%>
    <tr>
        <td align="center"  colspan="4"  class="td_viewcontent_title">��������&nbsp;</td>	
    </tr>
    <tr >
			<td align="right"  width="100"  class="td_viewcontent_title">�ֶ���&nbsp;</td>	
			<td align="center" class="td_viewcontent_content" style="width:35%"><!--�����ֶ�-->
						<asp:DropDownList ID="s_sortfield" Style="height:20px;width:95%" runat="server">
						</asp:DropDownList>
						<!--�����ֶ�--></td>	
			<td align="right" width="100"   class="td_viewcontent_title">����ʽ&nbsp;</td>	
			<td align="left"  class="td_viewcontent_content" style="width:35%">	<!--����ʽ-->
							<table border="0" cellpadding="0" cellspacing="0"><tr><td><asp:DropDownList ID="updown" Style="width:200px" runat="server">
								<asp:ListItem Value="asc">����</asp:ListItem>
								<asp:ListItem Value="desc">����</asp:ListItem>
							</asp:DropDownList></td><td>
						<!--����ʽ-->	<table border="0" cellspacing="0" cellpadding="0" style="padding-left:20px" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--�������-->
								  <G:Button id="btn_s_add4" type="toolbar" mode="on" icon="" text="���" Url="javascript:conAdd4();"   runat=server></G:Button>
								  <!--�������-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--ȡ������-->
								  <G:Button id="btn_s_cancel4" type="toolbar" mode="on" icon="" text="ȡ��"  url="javascript:conCancel4()" runat=server></G:Button>
								  <!--ȡ������-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--ȡ������-->
								  <G:Button id="btn_s_clear4" type="toolbar" mode="on" icon="" text="���"  url="javascript:conClear4()" runat=server></G:Button>
								  <!--ȡ������-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td>
                          </tr>
                        </table></td></tr></table></td>	
		</tr>
		<tr>
		<td align="right"  width="100"  class="td_viewcontent_title">��������&nbsp;</td>	
		<td colspan="3"  class="td_viewcontent_content">	
		<!--������ʾ��-->
	<textarea id="s_fstr4" style="width:98%; height:150px;" runat="server"   contenteditable="false" ></textarea>		<!--������ʾ��-->
	<input id="f4_v" runat="server" type="hidden" /><!--�ݴ�s_fstr4ֵ-->
		<!--������ʾ��-->
        </td>
        </tr>
        <tr>
        <td align="right"  width="100"  class="td_viewcontent_title">��ʾ�ֶ�</td>
        <td  class="td_viewcontent_content" >
        <table border="0" cellpadding="0" cellspacing="0"><tr>
        <td><table border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td class="btn_L_pic"></td>
            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="bottom" class="btn_text" >
				  <!--������ʾ�ֶ�-->
				  <G:Button id="btn_selectfield" type="toolbar" mode="on" icon="tb02" url="javascript:__doOpenView('pop_1241_1.aspx?id='+form1.edition.value,'600','600','50','50')" text="������ʾ�ֶ�" runat=server></G:Button>
				  <!--������ʾ�ֶ�-->
				  </td>
                </tr>
            </table></td>
            <td class="btn_R_pic"></td>
          </tr>
     </table></td>
     <td style="padding-left:10px"><table border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td class="btn_L_pic"></td>
            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="bottom" class="btn_text" >
				  <!--Ԥ����ͷ-->
				  <G:Button id="btn_viewhead" type="toolbar" mode="on" icon="tb47" url="javascript:__doOpenView('pop_1241_2.aspx?t=1&id='+form1.edition.value,'800','600','50','50')" text="Ԥ����ͷ" runat=server></G:Button>
				  <!--Ԥ����ͷ-->
				  </td>
                </tr>
            </table></td>
            <td class="btn_R_pic"></td>
          </tr>
     </table></td></tr></table></td>
        <td align="right"  width="100"  class="td_viewcontent_title">ģ�����</td>
        <td  class="td_viewcontent_content"><table border="0" cellpadding="0" cellspacing="0"><tr><td><table border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td class="btn_L_pic"></td>
            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="bottom" class="btn_text" >
				  <!--����ԭ��ģ��-->
				  <G:Button id="btn_savemoden" type="toolbar" mode="on" icon="tb05" url="javascript:confirmsave()" text="����ԭ��ģ��" runat=server></G:Button>
				  <asp:LinkButton ID="btn_savethis" OnClick="SaveThis" runat="server"></asp:LinkButton>   
				  <!--����ԭ��ģ��-->
				  </td>
                </tr>
            </table></td>
            <td class="btn_R_pic"></td>
          </tr>
      </table></td><td style="padding-left:10px"><table border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td class="btn_L_pic"></td>
        <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td valign="bottom" class="btn_text" >
			  <!--���Ϊ��ģ��-->
			  <G:Button id="btn_saveother" type="toolbar" mode="on" icon="tb05" text="���Ϊ��ģ��" url="javascript:ShowNM()" runat=server></G:Button>
			  <!--���Ϊ��ģ��-->
			  </td>
            </tr>
        </table></td>
        <td class="btn_R_pic"></td>
      </tr>
      </table></td>
      <td style="padding-left:10px"><table border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td class="btn_L_pic"></td>
        <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td valign="bottom" class="btn_text" >
			  <!--����ģ��-->
			  <G:Button id="btn_manage" type="toolbar" mode="on" icon="tb05" text="����ģ��" url="javascript:__doOpenView('pop_1241_3.aspx','600','600','50','50')" runat=server></G:Button>
			  <!--����ģ��-->
			  </td>
            </tr>
        </table></td>
        <td class="btn_R_pic"></td>
      </tr>
      </table></td></tr></table></td>
        </tr>
        <tr>
        <td align="right"  width="100"  class="td_viewcontent_title">����</td>
        <td colspan="3" class="td_viewcontent_content" >
        <table border="0" cellpadding="0" cellspacing="0"><tr>
        <td width="100%"  id="alertmess" style="padding-left:20px; color:Red" runat="server"></td>        
        <td  align="right" style="padding-left:10px; display:none; width:400px " runat="server" id="moname" >
             <table border="0" cellspacing="0" cellpadding="0" width="100%" >
             <tr>             
             <td><input id="fld_1241_1" runat="server" style="width:350px" ><!--ģ����--></td>
             <td><table border="0" cellspacing="0" cellpadding="0" >
              <tr>
                <td class="btn_L_pic"></td>
                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="bottom" class="btn_text" >
			          <!--���Ϊ��ģ��-->			            
			          <G:Button id="btn_savenm" type="toolbar" mode="on" url="javascript:confirmover();"  icon="tb05" text="����" runat=server></G:Button>
			          <!--���Ϊ��ģ��-->
			           <asp:LinkButton ID="btn_saveall" OnClick="SaveOther" runat="server"></asp:LinkButton>   
			          </td>
                    </tr>
                </table></td>
                <td class="btn_R_pic"></td>
              </tr>
              </table></td></tr></table>
       </td>
        <td>
         <table border="0" cellspacing="0" cellpadding="0"  >
              <tr >
                <td class="btn_L_pic"></td>
                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="bottom" class="btn_text" >
				      <!--��ʼ��ѯ-->
				      <G:Button id="btn_begin" type="toolbar" mode="on" url="javascript:confirmsearch();" icon="tb08" text="��ʼ��ѯ" runat=server></G:Button>
				      <!--��ʼ��ѯ-->
				  			       <asp:LinkButton ID="btn_search" onclick="Click_Search"  runat="server"></asp:LinkButton>   

				      </td>
                    </tr>
                </table></td>
                <td class="btn_R_pic"></td>
              </tr>
          </table>
        </td>
      <td> 
     <table border="0" cellspacing="0" cellpadding="0"  >
          <tr >
            <td class="btn_L_pic"></td>
            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="bottom" class="btn_text" >
				  <!--���-->
				  <G:Button id="btn_end" type="toolbar" mode="on" onclick="ClearAll" icon="tb04" text="���" runat=server></G:Button>
				  <!--���-->
				  </td>
                </tr>
            </table></td>
            <td class="btn_R_pic"></td>
          </tr>
      </table>
      </td>
      </tr></table></td>
        </tr>
</table><input id="mid_v" runat="server" type="hidden" />
</form>
</body>
        <script type="text/javascript" language="javascript">  
        var showcaption1 = new Array();//��ҵ��ʾ�ֶ�
        var showcaption2 = new Array();//��Ⱦ����ʾ�ֶ�
        var showcaption3 = new Array();//   ������ʾ�ֶ�
    function dataPart()
    {
         var h_v1="";
		//var h_v1=document.getElementById("yearList").value+"#";
        for(i=0;i<objCondition1.Items.length;i++)
        { 
             h_v1+=objCondition1.Items[i].Value+"#";
        }
        document.getElementById("fld_1242_2_1").value=h_v1;
        document.getElementById("f1_v").value=document.getElementById("s_fstr1").value;
          var h_v2="";
        for(i=0;i<objCondition2.Items.length;i++)
        {
             h_v2+=objCondition2.Items[i].Value+"#";
        }
        document.getElementById("fld_1242_2_2").value=h_v2;
        document.getElementById("f2_v").value=document.getElementById("s_fstr2").value;
        var h_v3="";
        for(i=0;i<objCondition3.Items.length;i++)
        {
             h_v3+=objCondition3.Items[i].Value+"#";
        }
        document.getElementById("fld_1242_2_3").value=h_v3;
        document.getElementById("f3_v").value=document.getElementById("s_fstr3").value;
        var h_v4=""
         for(i=0;i<objCondition4.Items.length;i++)
        {
             h_v4+=objCondition4.Items[i].Value+",";
        }
        document.getElementById("fld_1241_2_1").value=h_v4.toString();
        document.getElementById("f4_v").value=document.getElementById("s_fstr4").value;
    }
    function captionPart()
    {
        var h_c1="";
        for(i=0;i<showcaption1.length;i++)
        {
            h_c1+=showcaption1[i]+"#";
        }
        for(i=0;i<showcaption2.length;i++)
        {
            h_c1+=showcaption2[i]+"#";
        }
        for(i=0;i<showcaption3.length;i++)
        {
            h_c1+=showcaption3[i]+"#";
        }
        document.getElementById("showcaption").value=h_c1;
    }
function confirmover()
{
    if(confirm("ȷ��Ҫ���Ϊ��ģ�壿"))
    {
        dataPart();
        captionPart()
        if(document.getElementById("selectfiled").value=="2"||document.getElementById("selectfiled").value=="1")
           __doPostBack('btn_saveall','');
        else document.getElementById("alertmess").innerText="��ѡ����ʾ�ֶΣ�";
    }
}
function confirmsave()
{
    if(confirm("ȷ��Ҫ����ԭ��ģ�壿"))
    {
     dataPart();   
     captionPart() 
     __doPostBack('btn_savethis','');
    }
}
function confirmsearch()
{
    if(confirm("ȷ��Ҫ��ʼ��ѯ��"))
    {
        dataPart();
        captionPart()
        //��ҵsql
        var h_str1_1 = document.getElementById("fld_1242_2_1").value.split('#');
        if(h_str1_1[h_str1_1.length-1]=="") {h_str1_1.pop();}  
        //����sql
        var h_str2_1 = document.getElementById("fld_1242_2_2").value.split('#');
        if(h_str2_1[h_str2_1.length-1]=="") h_str2_1.pop();
        //����sql
        var h_str3_1 = document.getElementById("fld_1242_2_3").value.split('#');
        if(h_str3_1[h_str3_1.length-1]=="") h_str3_1.pop();
        //����
        var h_fstr1 = "",h_fstr2="",h_fstr3="";
        for ( i = 0; i < h_str1_1.length; i++)
        {
            h_fstr1 += h_str1_1[i];
        }
        for ( i = 0; i < h_str2_1.length; i++)
        {
            h_fstr2 += h_str2_1[i];
        }
        for ( i = 0; i < h_str3_1.length; i++)
        {
            h_fstr3 += h_str3_1[i];
        }
        h_fstr1 = h_fstr1 + "*" + h_fstr2 + "*" + h_fstr3+"*"+document.getElementById("fld_1241_2_1").value.toString();
       document.getElementById("fld_1242_2").value=h_fstr1;
       window.open("pop_1241_2.aspx?id="+document.getElementById("edition").value+"&year="+document.getElementById("yearList").value+"");      
    }
}
function ShowNM()
{
    document.getElementById("moname").style.display="block";
    document.getElementById("fld_1241_1").value="";
}
      
  //��ҵ��Ϣ
var objfield1 = document.getElementById("s_field1");//��ҵ������Ϣ�ֶ�
var objcompare1 = document.getElementById("compare1");//��ҵ������Ϣ������
var objtxt1 = document.getElementById("comparekey1");//��ҵ��ѯ������ֵ
var objCondition1 = createConditionObj(document.getElementById("s_fstr1"));//��ѯ�����ı���
var objArea1 = document.getElementById("area");//����ҵ����������
function conAdd1(){
    var obj1 = GetSelectedItem(objfield1);
    var obj2 = GetSelectedItem(objcompare1);
    var obj3 = GetSelectedItem(objArea1);
    var re = new Object();
    re.Value = "and";
    re.Text = "��";
    if(objCondition1.GetLength()>0)
    {
        if(document.getElementById("and1").checked)
        {
            re.Value = "and";
            re.Text = "����";
        }
        else if(document.getElementById("or1").checked)
        {
            re.Value = "or";
            re.Text = "����";
        }

    }
    else
    {
        re.Value = "and";
        re.Text = "";
    }
    var h_like;//������Ϊlike
    if(obj2.Value=="like")
    {
        h_like="%"+objtxt1.value.replace("\'","")+"%";
    }
    else h_like=objtxt1.value.replace("\'","");
    if(objtxt1.value=="" && obj3.Value == "0")
    {
        alert1.innerText="�ֶ�ֵ����Ϊ�գ�";
    }else if(objtxt1.value!="" && obj3.Value != "0")
    {
         alert1.innerText="��ѯ�����뵥��ѡ��";
    }
    else alert1.innerText="";
    if(alert1.innerText==""){
        // ѡ����ҵ������Ϣ����
         if(objtxt1.value != ""){
            if(obj1.Value=="fld_1202_21")
            {
                 objCondition1.AddItem(" "+re.Value+" "+obj1.Value+" in(select mocode from gmis_mo_1200 where fld_1200_1 "+obj2.Value+" '"+h_like+"')"," "+re.Text+" ["+obj1.Text+obj2.Text+objtxt1.value.replace("\'","")+"]; ");
            }
            else if(obj1.Value=="fld_1202_17")
            {
                 objCondition1.AddItem(" "+re.Value+" "+obj1.Value+" in (select fld_1157_1 from gmis_mo_1157 where fld_1157_2 "+obj2.Value+" '"+h_like+"')"," "+re.Text+" ["+obj1.Text+obj2.Text+objtxt1.value.replace("\'","")+"]; ");
            }
             else if(obj1.Value=="fld_1202_4")
            {
                 objCondition1.AddItem(" "+re.Value+" "+obj1.Value+" in(select mocode from gmis_mo_1201 where fld_1201_1 "+obj2.Value+" '"+h_like+"')"," "+re.Text+" ["+obj1.Text+obj2.Text+objtxt1.value.replace("\'","")+"]; ");
            }
            else
            {
                objCondition1.AddItem(" "+re.Value+" "+obj1.Value+" "+obj2.Value+" '"+h_like+"'"," "+re.Text+" ["+obj1.Text+obj2.Text+objtxt1.value.replace("\'","")+"]; ");
            }
            showcaption1.push(obj1.Value);
        }
        //ѡ����ҵ��������
        else 
        {
            objCondition1.AddItem(" "+re.Value+" fld_1202_5 like '"+obj3.Value+"%'"," "+re.Text+" [��������Ϊ"+obj3.Text.replace("\'","")+"]; ");
            //objCondition1.AddItem(" "+re.Text+" [��������Ϊ"+obj3.Text.replace("\'","")+"]; "," "+re.Value+" fld_1202_5 like '"+obj3.Value+"'");
            showcaption1.push("fld_1202_4");
        }
    }
   document.getElementById("comparekey1").value="";
   document.getElementById("area").value="0";
}
function conCancel1()
{
    objCondition1.Delete();
    showcaption1.pop();
}
function conClear1()
{
    objCondition1.Clear();
    showcaption1.splice(0,showcaption1.length);
}
//��Ⱦ���ŷ�
var objfield2= document.getElementById("s_field2");
var objcompare2 = document.getElementById("compare2");
var objtype2 = document.getElementById("type2");
var objway2=document.getElementById("way2");
var objtxt2 = document.getElementById("comparekey2");
var objhytype=document.getElementById("hytype");
var objCondition2 = createConditionObj(document.getElementById("s_fstr2"));
function conAdd2(){
    var obj1 = GetSelectedItem(objfield2);
      document.getElementById("mid_v").value+="1235,";
    var obj2 = GetSelectedItem(objcompare2);
    var obj3=GetSelectedItem(objtype2);
    var obj4=GetSelectedItem(objway2);
    var obj5=GetSelectedItem(objhytype);
    var re = new Object();
    re.Value = "and";
    re.Text = "��";
    if(objCondition2.GetLength()>0)
    {
        if(document.getElementById("and2").checked)
        {
            re.Value = "and";
            re.Text = "����";
        }
        else if(document.getElementById("or2").checked)
        {
            re.Value = "or";
            re.Text = "����";
        }
    }
    else
    {
        re.Value = "and";
        re.Text = "";
    }
    var h_like;//������Ϊlike
    if(obj2.Value=="like")
    {
        h_like="%"+objtxt2.value.replace("\'","")+"%";
    }
    else h_like=objtxt2.value.replace("\'","");
     if(objtxt2.value=="")
    {
        alert2.innerText="�ֶ�ֵ����Ϊ�գ�";
    }
    else alert2.innerText="";
    var h_hytype="";//��ҵ����
    if(obj5.Value!="0")
    {
        h_hytype=" and fld_1235_8="+obj5.Value;
    }
    else
    {
        h_hytype="";
    }
    if(alert2.innerText=="")
    {
        objCondition2.AddItem(" "+re.Value+" fld_1235_1="+obj1.Value+" and "+obj3.Value+" "+obj2.Value+" '"+h_like+"' and fld_1235_7="+obj4.Value+" "+h_hytype+""," "+re.Text+"[���"+obj5.Text+"��"+obj1.Text+obj3.Text+obj2.Text+objtxt2.value.replace("\'","")+",���㷽��Ϊ"+obj4.Text+"];");
         //objCondition2.AddItem(" "+re.Text+"["+obj1.Text+obj3.Text+obj2.Text+objtxt2.value.replace("\'","")+",���㷽��Ϊ"+obj4.Text+"];"," "+re.Value+" fld_1235_1="+obj1.Value+" and fld_1235_3 "+obj2.Value+" '"+h_like+"' and fld_1235_7="+obj4.Value+"");
        showcaption2.push("fld_1235_1|"+obj3.Value);
    }

}
function conCancel2()
{
    objCondition2.Delete();
     showcaption2.pop();
}
function conClear2()
{
    objCondition2.Clear();
    showcaption2.splice(0,showcaption2.length);
}
//������Ϣ
var objfield3 = document.getElementById("s_field3");
var objcompare3 = document.getElementById("compare3");
var objtxt3 = document.getElementById("comparekey3");
var objtype3 = document.getElementById("type3");
var objtab3 = document.getElementById("tabname");
var objCondition3 = createConditionObj(document.getElementById("s_fstr3"));
function conAdd3(){
    var obj1 = GetSelectedItem(objfield3);
    var obj2 = GetSelectedItem(objcompare3);
    var obj3=GetSelectedItem(objtype3);
    var obj4=GetSelectedItem(objtab3);
    document.getElementById("mid_v").value+=obj4.Value+",";
    var re = new Object();
    re.Value = "and";
    re.Text = "��";
    if(objCondition3.GetLength()>0)
    {
        if(document.getElementById("and3").checked)
        {
            re.Value = "and";
            re.Text = "����";
        }
        else if(document.getElementById("or3").checked)
        {
            re.Value = "or";
            re.Text = "����";
        }

    }
    else
    {
        re.Value = "and";
        re.Text = "";
    }
    var h_like;//������Ϊlike
    if(obj2.Value=="like")
    {
        h_like="%"+objtxt3.value.replace("\'","")+"%";
    }
    else h_like=objtxt3.value.replace("\'","");
    if(objtxt3.value=="")
    {
        alert3.innerText="�ֶ�ֵ����Ϊ�գ�";
    }
    else alert3.innerText="";
    if(alert3.innerText=="")
    {
        objCondition3.AddItem(" "+re.Value+" "+obj1.Value+" "+obj2.Value+" '"+h_like+"'"," "+re.Text+" ["+obj3.Text+obj4.Text+obj1.Text+obj2.Text+objtxt3.value.replace("\'","")+"];");
       
        showcaption3.push(obj1.Value);
        
    }

}
function conCancel3()
{
    objCondition3.Delete();
    showcaption3.pop();
}
function conClear3()
{
    objCondition3.Clear();
    showcaption3.splice(0,showcaption3.length);
}
//����
var objsortfld = document.getElementById("s_sortfield");
var objsort = document.getElementById("updown");
var objCondition4 = createConditionObj(document.getElementById("s_fstr4"));
function conAdd4(){
    var obj1 = GetSelectedItem(objsortfld);
    var obj2 = GetSelectedItem(objsort);
    objCondition4.AddItem(""+obj1.Value+" "+obj2.Value+" "," ["+obj1.Text+ obj2.Text+"] ");
}
function conCancel4()
{
    objCondition4.Delete();
}
function conClear4()
{
    objCondition4.Clear();
}

<%=p_qystr %>//����ҵ����

//��������
function createConditionObj(objcontrol)
{
    var obj = new Object();
    obj.ControlCondition=objcontrol;
    obj.Items = new Array();
    obj.GetLength = function(){
        return obj.Items.length;
    }
    obj.AddNew = function(newobj){
        obj.Items.push(newobj);
        obj.ControlCondition.value += newobj.Text;
    }
    obj.AddItem = function(value,text){
        var objItem = new Object();
        objItem.Value = value;
        objItem.Text = text;
        obj.AddNew(objItem);
    }
    obj.Delete = function(){
        if(obj.GetLength()>0)
        {
            obj.Items.reverse();
            obj.ControlCondition.value = obj.ControlCondition.value.substr(0,obj.ControlCondition.value.length-obj.Items.shift().Text.length);
            obj.Items.reverse();
        }
        else
        {
            alert("û�п���ȥ�����");
        }
    }
    obj.Clear = function(){
        obj.Items = new Array();
        obj.ControlCondition.value = "";
    }
     
    return obj;
}

function ViewTxt()
{
    for(var i=0;i<objCondition1.Items.length;i++)
    {
        alert("value:"+objCondition1.Items[i].Value+" text:"+objCondition1.Items[i].Text);
    }
  
}

//���select��ǩѡ��ֵ ����һ�������null
function GetSelectedItem(obj)
{
    for(var i=0;i<obj.options.length;i++)
    {
        if(obj.options[i].selected)
        {
            var objselect = new Object();
            objselect.Value = obj.options[i].value;
            objselect.Text = obj.options[i].text;
            return objselect;
        }
    }
    return null;
}

function GetItemObj(value,text)
{
    var obj = new Object();
    obj.Value = value;
    obj.Text = text;
    return obj;
}
</script>
<script language="javascript" type="text/javascript"> 
<!--  
//�Ƴ�select������
function removeOptions(selectObj) 
{     
    if (typeof selectObj != 'object')
    {         
        selectObj = document.getElementById(selectObj);
    }      
    // ԭ��ѡ�����    
    var len = selectObj.options.length;      
    for (var i=0; i < len; i++)     
    {         
        // �Ƴ���ǰѡ��        
        selectObj.options[0] = null;    
    } 
} 


function setSelectOption(selectObj, optionList, firstOption, selected) 
{     
    if (typeof selectObj != 'object')
    {         
        selectObj = document.getElementById(selectObj);     
    }      
    // ���ѡ��     
    removeOptions(selectObj);      
    if(selectObj.id=="type3")
    {
        var selectObj2 = document.getElementById("tabname");
        removeOptions(selectObj2); 
        selectObj2.options[0] = new Option(firstOption, '');
    }
    // ѡ�����     
    var start = 0;          
    // �����Ҫ��ӵ�һ��ѡ��     
    if (firstOption)
    {         
        selectObj.options[0] = new Option(firstOption, '');    // ѡ������� 1 ��ʼ         
        start ++;     
    }      
    
    var len = optionList.length;   
    for (var i=0; i < len; i++) 
    {        
        //����option         
        selectObj.options[start] = new Option(optionList[i].txt, optionList[i].val);          
        //ѡ����         
        if(selected == optionList[i].val)
        {             
            selectObj.options[start].selected = true;         
        }          
        //������ 1         
        start ++; 
    } 
}  //--> 
</script>

<script language="javascript" type="text/javascript">  
var xmlDoc;
    if(window.ActiveXObject)
    {
        xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async=false; 
        
    }
    else if(document.implementation&&document.implementation.createDocument)
    {
        xmlDoc=document.implementation.createDocument("","",null);
        xmlDoc.async=false;
        
    }
    else
    {
        //alert("δ�ܶ�ȡXML���ݣ�");
    }
    
var tabArr = [];
var fldArr = []; 



function setTypes(type3){
if(tabArr[type3]==null)
{
    xmlDoc.load("WriteXml.aspx?pid="+escape(type3));
    if(xmlDoc!=null)
    {
        var nodes=xmlDoc.getElementsByTagName('root/type3/tabname');
       // alert(nodes[0].getAttribute('Value'));
        
        tabArr[type3] = new Array();
        
        if(nodes!=null && nodes.length>0)
        {
               
            for(var i=0;i<nodes.length;i++)
            {
                var obj = new Object();
                obj.txt = nodes[i].getAttribute('Text');
                obj.val = nodes[i].getAttribute('Value');
                tabArr[type3].push(obj);
            }
        }
        
    }
} 
setSelectOption('tabname', tabArr[type3], '-��ѡ��-');
} 
function setTable(tabname) {   
if(fldArr[tabname]==null)
{
    xmlDoc.load("WriteXml.aspx?pid="+escape(tabname));
    if(xmlDoc!=null)
    {
        var nodes=xmlDoc.getElementsByTagName('root/tabname/field3');
        
        fldArr[tabname] = new Array();
        
        if(nodes!=null && nodes.length>0)
        {
               
            for(var i=0;i<nodes.length;i++)
            {
                var obj = new Object();
                obj.txt = nodes[i].getAttribute('Text');
                obj.val = nodes[i].getAttribute('Value');
                fldArr[tabname].push(obj);
            }
        }
        
    }
}       
setSelectOption('s_field3', fldArr[tabname], '-��ѡ��-');
}  

</script>

</html>