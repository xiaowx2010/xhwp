<!--���ݹ���-��ȾԴ�����������-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" Debug="true"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
/*����gmis_mo_17
������[��ҵ��Ϣ]gmis_mo_1202��������������gmis_mo_1202.fld_1202_2=gmis_mo_17.fld_17_1��;��
������[����]gmis_mo_1197��������������gmis_mo_1197.modulecode=mid and gmis_mo_1197.datamocode=id��;��
������[��ͼ]gmis_feature��������������gmis_feature.featurecode=gmis_mo_1197.featurecode��;
*/
    string dtablefeature, filterfeature, typesfeature, dtable_1202, filter_1202,types_1202;
    string[] fldsfeature, vflds_1202, flds_1202;
private void Page_Load(object sender, System.EventArgs e)
{
	SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
    //��ȾԴ�������
	dtable = "gmis_Mo_17";
    filter = " Mocode=" + id;
    flds = new string[] { "fld_17_1", "fld_17_2", "fld_17_3", "fld_17_4", "fld_17_5", "fld_17_6", "fld_17_7", "fld_17_8", "fld_17_9", "fld_17_10", "fld_17_11", "fld_17_12", "fld_17_13", "fld_17_14", "fld_17_15", "fld_17_16", "fld_17_17", "fld_17_18", "fld_17_19", "creatorcode" };
    mflds = new string[] { "��λ���|fld_17_1" };
    types = "00001010111111100001";
    
    //��ͼ���ݱ�
    dtablefeature = "gmis_feature";
    fldsfeature = new string[] { "featurename", "featurebrief", "featurex", "featurey", "Featuredepth", "FeatureKind", "featurestate","typecode"};
    //filterfeature = " featurecode in (select featurecode from gmis_mo_1197 where modulecode="+mid+" and datamocode="+id+")";
    typesfeature = "00111100";
 
    //��ҵ��Ϣ
    dtable_1202 = "gmis_mo_1202";
    flds_1202 = new string[] { "fld_1202_1", "fld_1202_2", "fld_1202_3", "fld_1202_4", "fld_1202_5", "fld_1202_12", "fld_1202_15", "fld_1202_16", "fld_1202_24", "fld_1202_20", "fld_1202_21" };
    filter_1202 = " mocode=" + pid;
    types_1202 = "00010000101";
    
     if (!IsPostBack) {//�Ȱ��б�
        creatorcode.Value = GetUID();//������ID

        //�ֵ�
        db.SqlString = "select mocode,fld_1201_1,fld_1201_2,fld_1201_3 from gmis_mo_1201 order by fld_1201_5 asc";
        DataTable idt = db.GetDataTable();
        sel_area.Items.Add(new ListItem("-��ѡ��-", "0"));
        string img = "";
        foreach (DataRow dr in idt.Rows)
        {
            img = "";
            for (int i = 0; i < Convert.ToInt32(dr["fld_1201_2"]); i++)
            {
                img += ">";
            }
            sel_area.Items.Add(new ListItem(img + dr["fld_1201_1"].ToString(), dr["mocode"].ToString()));
        }
        SetFilter(sel_area, "0");

        //����ҵ���
        db.SqlString = "select mocode,fld_1200_1,fld_1200_3,fld_1200_4,fld_1200_8 from gmis_mo_1200 order by fld_1200_6 asc";
        idt = db.GetDataTable();
        fld_17_8.Items.Add(new ListItem("-��ѡ��-", "0"));
        foreach (DataRow dr in idt.Rows)
        {
            img = "";
            for (int i = 0; i < Convert.ToInt32(dr["fld_1200_3"]); i++)
            {
                img += ">";
            }
            fld_17_8.Items.Add(new ListItem(img + dr["fld_1200_1"].ToString(), dr["fld_1200_8"].ToString()));
        }
        SetFilter(fld_17_8, "0");
         
        //��ϽȨ��
        BindListControl(fld_17_7, "mocode", "fld_44_1", "select mocode,fld_44_1 from gmis_mo_44", "��ѡ��");
        SetFilter(fld_17_7, "0");
        
        //������ϵ
        BindListControl(fld_17_9, "mocode", "fld_47_1", "select mocode,fld_47_1 from gmis_mo_47", "��ѡ��");
        SetFilter(fld_17_9, "0");
        //���ܲ���
        BindListControl(fld_17_10, "mocode", "fld_48_1", "select mocode,fld_48_1 from gmis_mo_48", "��ѡ��");
        SetFilter(fld_17_10, "0");
        //ˮ��ȾԴ����
        BindListControl(fld_17_11, "mocode", "fld_49_1", "select mocode,fld_49_1 from gmis_mo_49", "��ѡ��");
        SetFilter(fld_17_11, "0");
        //������ȾԴ����
        BindListControl(fld_17_12, "mocode", "fld_50_1", "select mocode,fld_50_1 from gmis_mo_50", "��ѡ��");
        SetFilter(fld_17_12, "0");
        //Σ����ȾԴ����
        BindListControl(fld_17_13, "mocode", "fld_51_1", "select mocode,fld_51_1 from gmis_mo_51", "��ѡ��");
        SetFilter(fld_17_13, "0");
        //��ˮ�������
        BindListControl(fld_17_15, "mocode", "fld_52_1", "select mocode,fld_52_1 from gmis_mo_52", "��ѡ��");
        SetFilter(fld_17_15, "0");
        
        if (id != "0")
        {//������ֵ
            btn_search.Visible = false;//���ز�ѯ��ť
            fld_17_1.Disabled = true;//��λ��Ų��ɱ༭
            guangye.BindData(dtable, filter, flds);
            tb_2_new.Visible = true;//���±༭   
            //������ҵ���룬��ȡ��ͼλ��
            featurecode.Value = GetFieldData("select top 1 featurecode from gmis_mo_1197 where orgcode='" + guangye.GetControlValue(fld_17_1) + "'");
            if (featurecode.Value != "")
            {
                guangye.BindData(dtablefeature, " featurecode=" + featurecode.Value + "", fldsfeature);
            }
           
        }
        else
        {
            if (pid != "0")//����ҵ��Ϣ������
            {
                guangye.BindData(dtable_1202, filter_1202, flds_1202);
                btn_search.Visible = false;//���ز�ѯ��ť
                fld_17_1.Disabled = true;//��λ��Ų��ɱ༭
                tb_2_new.Visible = true;//���±༭
                featurename.Value=fld_17_3.Value = fld_1202_1.Value;//��λ���� -- ��ҵ����
                featurebrief.Value=fld_17_1.Value = fld_1202_2.Value;//��λ��� -- ��ҵ����
                fld_17_4.Value = fld_1202_3.Value;//��λ��ַ -- ��ҵ��ַ
                fld_17_18.Value = fld_1202_15.Value;//�������� -- ����������
                fld_17_16.Value = fld_1202_16.Value;//��λ������ϵ�� -- ��ϵ������
                fld_17_17.Value = fld_1202_12.Value;//��λ������ϵ�绰 -- ��ϵ�˵绰
                SetFilter(fld_17_8, fld_1202_20.Value);//��ҵ��� -- ��ҵ���,��¼��ҵ����
                fld_17_5.Value= fld_1202_4.Value;//�����
                //������ҵ���룬��ȡ��ͼλ��
                featurecode.Value = GetFieldData("select top 1 featurecode from gmis_mo_1197 where orgcode='" + guangye.GetControlValue(fld_17_1) + "'");
                if (featurecode.Value != "")
                {
                    guangye.BindData(dtablefeature, " featurecode=" + featurecode.Value + "", fldsfeature);
                }
                
            }
        }
        if (featurecode.Value == "")
        {
            featurecode.Value = "0";
        }        
        if (featurestate.Value == "")
        {
            featurestate.Value = "����";
        }

        if (FeatureKind.Value == "" || FeatureKind.Value == "0")
        {
            FeatureKind.Value = "1";
        }
        SetFilter(sel_area, fld_17_5.Value);
    }   
}
/// <summary>
/// ����֮ǰ�����ݴ���
/// </summary>
public override void BeforeSave()
{
    //��ȡ����
    if (sel_area.SelectedItem != null && sel_area.SelectedItem.Value != "0")
    {
        fld_17_5.Value = sel_area.SelectedItem.Value;
        db.SqlString = "select fld_1201_6 from gmis_mo_1201 where mocode=" + fld_17_5.Value;
        DataTable dt_temp = db.GetDataTable();
        if (dt_temp != null && dt_temp.Rows.Count > 0)
        {
            fld_1202_5.Value = dt_temp.Rows[0][0].ToString();
        }
    }
    //��ҵ����
    if (fld_17_8.SelectedItem != null && fld_17_8.SelectedItem.Value != "0")
    {
        fld_1202_20.Value = fld_17_8.SelectedItem.Value;
        db.SqlString = "select mocode from gmis_mo_1200 where fld_1200_8=" + fld_1202_20.Value;
        DataTable dt_temp = db.GetDataTable();
        if (dt_temp != null && dt_temp.Rows.Count > 0)
        {
            fld_1202_21.Value = dt_temp.Rows[0][0].ToString();
        }
    }


    featurename.Value=fld_1202_1.Value = fld_17_3.Value;//��ҵ���� -- ��λ����
    featurebrief.Value=fld_1202_2.Value = fld_17_1.Value;//��ҵ���� -- ��λ���
    fld_1202_3.Value = fld_17_4.Value;//��ҵ��ַ -- ��λ��ַ
    fld_1202_15.Value = fld_17_18.Value;//���������� -- ��������
    fld_1202_16.Value = fld_17_16.Value;//��ϵ������ -- ��λ������ϵ��
    fld_1202_12.Value = fld_17_17.Value;//��ϵ�˵绰 -- ��λ������ϵ�绰
    //fld_1202_21.Value = fld_17_8.SelectedItem.Value;
    fld_1202_4.Value = fld_17_5.Value;
    typecode.Value = GetFieldData("select typecode from gmis_type where typename='"+GetModuleName(mid)+"'");
    string exeinfo = "";
    CheckMustAndFieldType();
    DataTable idt;
    //����������Դ
    //fld_1202_24.Value = "17";
    if (id == "0")
    {
        db.SqlString = "select 1 from gmis_mo_17 where fld_17_1='" + guangye.GetControlValue(fld_17_1) + "'";
         idt = db.GetDataTable();
         if (idt.Rows.Count > 0)
         {
             exeinfo = "������ͬ��λ���룬����������";
             salert.InnerHtml = exeinfo;
         }
    }
    //���ظ�
    if (exeinfo.Length == 0)
    {
        string sqlstr = "";//SQL���

        if (id == "0")
        {
            //��ͼ����
            if (guangye.GetControlValue(featurecode) == "0" || guangye.GetControlValue(featurecode) == "")
            {
                sqlstr += guangye.GetInsertSql(dtablefeature, fldsfeature, typesfeature) + ";SELECT @@IDENTITY AS 'featurecode'; DECLARE @featureid int; SELECT @featureid=@@IDENTITY;";
                featurecode.Value = "@featureid";
            }
            else
            {
                filterfeature = " featurecode=" + featurecode.Value;
                sqlstr += guangye.GetUpdateSql(dtablefeature, filterfeature, fldsfeature, typesfeature)+";";
            }
            //��ȾԴ��ҵ���
            sqlstr += guangye.GetInsertSql(dtable, flds, types) + ";SELECT @@IDENTITY AS 'mocode'; DECLARE @moid_17 int; SELECT @moid_17=@@IDENTITY;";
            //��Ⱦ��ҵ��ϵ��
            sqlstr += "insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname,areacode,featurecode,tradecode) values (" + mid + ",@moid_17,'" + guangye.GetControlValue(fld_17_1) + "','" + guangye.GetControlValue(fld_17_3) + "','" + guangye.GetControlValue(fld_17_5) + "'," + guangye.GetControlValue(featurecode) + ",'" + guangye.GetControlValue(fld_1202_20) + "');";
            //��ҵ������Ϣ��
            filter_1202 = "fld_1202_2='" + guangye.GetControlValue(fld_17_1) + "'";
            sqlstr += "if exists (select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_17_1) + "') begin  " + guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, types_1202) + " end else begin " + guangye.GetInsertSql(dtable_1202, flds_1202, types_1202) + " end;";
            //ͬ��ҵ(����ҵ����Ϊ��ʶ)�ĵ�ͼ��ϵ��Ϊͬһ��
            sqlstr += "Update gmis_mo_1197 set featurecode=" + guangye.GetControlValue(featurecode) + " where orgcode='" + guangye.GetControlValue(fld_17_1) + "';";
            SetSESSION("sql", sqlstr);
        }
        else
        {
            //��ͼ����
            if (guangye.GetControlValue(featurecode) == "0" || guangye.GetControlValue(featurecode) == "")
            {
                sqlstr += guangye.GetInsertSql(dtablefeature, fldsfeature, typesfeature) + ";SELECT @@IDENTITY AS 'featurecode'; DECLARE @featureid int; SELECT @featureid=@@IDENTITY;";
                featurecode.Value = "@featureid";
            }
            else
            {
                filterfeature = " featurecode=" + featurecode.Value;
                sqlstr +=  guangye.GetUpdateSql(dtablefeature, filterfeature, fldsfeature, typesfeature)+";";
            }
            
            //��ȾԴ��ҵ���
            sqlstr += guangye.GetUpdateSql(dtable, filter, flds, types)+";";
            
            
            //��Ⱦ��ҵ��ϵ��
            sqlstr += "if exists (select mocode from gmis_mo_1197 where orgcode='" + guangye.GetControlValue(fld_17_1) + "' and modulecode=" + mid + ") Update gmis_mo_1197 set featurecode=" + guangye.GetControlValue(featurecode) + ",tradecode='" + guangye.GetControlValue(fld_1202_20) + "',orgname='" + guangye.GetControlValue(fld_17_3) + "',areacode=" + guangye.GetControlValue(fld_17_5) + " where orgcode='" + guangye.GetControlValue(fld_17_1) + "' and modulecode=" + mid + " else insert into gmis_mo_1197 (modulecode,datamocode,orgcode,orgname,areacode,featurecode,tradecode) values (" + mid + "," + id + ",'" + guangye.GetControlValue(fld_17_1) + "','" + guangye.GetControlValue(fld_17_3) + "','" + guangye.GetControlValue(fld_17_5) + "'," + guangye.GetControlValue(featurecode) + ",'" + guangye.GetControlValue(fld_1202_20) + "');";
            //��ҵ������Ϣ����ϵ������
            string h_mid = "1202";
            filter_1202 = "fld_1202_2='" + guangye.GetControlValue(fld_17_1) + "'";
            sqlstr += "if exists (select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_17_1) + "') begin " + guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, types_1202) + " ;if exists (select mocode from gmis_mo_1197 where orgcode='" + guangye.GetControlValue(fld_17_1) + "' and modulecode=" + h_mid + ") Update gmis_mo_1197 set featurecode=" + guangye.GetControlValue(featurecode) + ",tradecode='" + guangye.GetControlValue(fld_1202_20) + "',orgname='" + guangye.GetControlValue(fld_17_3) + "',areacode=" + guangye.GetControlValue(fld_17_5) + " where orgcode='" + guangye.GetControlValue(fld_17_1) + "' and modulecode=" + h_mid + " else insert into gmis_mo_1197 (modulecode,orgcode,orgname,areacode,featurecode,tradecode) values (" + h_mid + ",'" + guangye.GetControlValue(fld_17_1) + "','" + guangye.GetControlValue(fld_17_3) + "','" + guangye.GetControlValue(fld_17_5) + "'," + guangye.GetControlValue(featurecode) + ",'" + guangye.GetControlValue(fld_1202_20) + "') end  ";
            sqlstr += " else ";
            sqlstr += "begin " + guangye.GetInsertSql(dtable_1202, flds_1202, types_1202) + ";insert into gmis_mo_1197 (modulecode,orgcode,orgname,areacode,featurecode,tradecode) values (" + h_mid + ",'" + guangye.GetControlValue(fld_17_1) + "','" + guangye.GetControlValue(fld_17_3) + "','" + guangye.GetControlValue(fld_17_5) + "'," + guangye.GetControlValue(featurecode) + ",'" + guangye.GetControlValue(fld_1202_20) + "') end ";

            //ͬ��ҵ(����ҵ����Ϊ��ʶ)�ĵ�ͼ��ϵ��Ϊͬһ��
            sqlstr += "Update gmis_mo_1197 set featurecode=" + guangye.GetControlValue(featurecode) + " where orgcode='" + guangye.GetControlValue(fld_17_1) + "';";
            
            SetSESSION("sql", sqlstr);
        }
    }
   
    if (GetSESSION("sql") != "")
        Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64(aid) + "&mid=" + mid + "&tid=" + tid + "&id=" + id + "&pid=" + pid);

}
private void Click_Search(object sender, System.EventArgs e)
{
    string scriptstr = "";
    if (guangye.GetControlValue(fld_17_1).Length > 0)
    {
        salert.InnerText = "";
        scriptstr = "<scrip" + "t>__doOpenView('pop_search_company.aspx?mid=" + mid + "&keynumber=" + StringUtility.StringToBase64(guangye.GetControlValue(fld_17_1)) + "',800,600,10,50);</scrip" + "t>";
        Page.RegisterStartupScript("popwin", scriptstr);
    }
    else salert.InnerText = "�������ѯ���ݣ�";


}
</script>
<script language="javascript">
function GetData(args)
{		
	
	var arrstr = args.toString().split("|");
	if(arrstr.length>1)
	{			
		window.document.form1.Featurex.value=arrstr[0];
		window.document.form1.Featurey.value=arrstr[1];
	}
	window.document.focus();	
	
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
            <td style="width:100%"><span id="salert" runat="server" style="color:Red;"></span></td>	
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar1146.aspx"-->
			<!--�ұ߹̶���ť-->
	<!--#include file="toolbarright.aspx"-->   
<!--����������-->

<!--��ҵ��Ϣ-->
<input id="fld_1202_1" runat="server" type="hidden" /><!--��ҵ����-->
<input id="fld_1202_2" runat="server" type="hidden" /><!--��ҵ����-->
<input id="fld_1202_3" runat="server" type="hidden" /><!--��ҵ��ַ-->
<input id="fld_1202_4" runat="server" type="hidden" /><!--��������-->
<input id="fld_1202_5" runat="server" type="hidden" /><!--������������-->
<input id="fld_1202_12" runat="server" type="hidden" /><!--��ϵ�˵绰-->
<input id="fld_1202_15" runat="server" type="hidden" /><!--����������-->
<input id="fld_1202_16" runat="server" type="hidden" /><!--��ϵ������-->
<input id="fld_1202_20" runat="server" type="hidden" /><!--��ҵ����-->
<input id="fld_1202_21" runat="server" type="hidden" /><!--��ҵ����-->
<input id="fld_1202_24" runat="server" type="hidden" /><!--������Դ-->
<!--��ҵ��Ϣ-->

<input id="fld_17_5" runat="server" type="hidden" />

<input id="creatorcode" runat="server" type="hidden" />

<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
	<tr>
	    <td align="right"  class="td_viewcontent_title"><span style="color:red">*</span>��λ��ţ�</td>
	    <td class="td_viewcontent_content" nowrap>
	        <input id="fld_17_1" class="boxbline" type="text" runat="server" />
	        <asp:LinkButton id="btn_search" runat="server" OnClick="Click_Search"><img src="images\icons\search.gif" style="cursor:hand" title="��ѯ" border="0" /></asp:LinkButton >
	       
	    </td>
	    <td align="right"  class="td_viewcontent_title">&nbsp;</td>
	    <td class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
    <td align="right"  class="td_viewcontent_title"><span style="color:red">*</span>��λ���ƣ�</td>
	    <td class="td_viewcontent_content" colspan="3"><input id="fld_17_3" class="boxbline" type="text" style="width:95%"  runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��λ��ַ��</td>
	    <td colspan="3" class="td_viewcontent_content"><input id="fld_17_4" class="boxbline" style="width:95%" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��ҵ���˴��룺</td>
	    <td class="td_viewcontent_content"><input id="fld_17_2" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">����������</td>
	    <td class="td_viewcontent_content"><input id="fld_17_18" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">���˵绰��</td>
	    <td class="td_viewcontent_content"><input id="fld_17_19" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">&nbsp;</td>
	    <td class="td_viewcontent_content">&nbsp;</td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��λ������ϵ�ˣ�</td>
	    <td class="td_viewcontent_content"><input id="fld_17_16" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">��λ������ϵ�绰��</td>
	    <td class="td_viewcontent_content"><input id="fld_17_17" class="boxbline" type="text" runat="server" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">���ڽֵ�����</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="sel_area" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">����������</td>
	    <td class="td_viewcontent_content"><input id="fld_17_6" runat="server" class="boxbline" type="text" readonly value="������" /></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">��ϽȨ�ޣ�</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_7" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">������ҵ��</td>
	    <td class="td_viewcontent_content">
	        <asp:dropdownlist id="fld_17_8" class="boxbline" style="width: 95%;" runat="server" ></asp:dropdownlist>
	       
	        <!---->
	    </td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">������ϵ��</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_9" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">���ܲ��ţ�</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_10" runat="server" Width="150"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">ˮ��ȾԴ����</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_11" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">������ȾԴ����</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_12" runat="server" Width="150"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">Σ����ȾԴ����</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_13" runat="server" Width="150"></asp:DropDownList></td>
	    <td align="right"  class="td_viewcontent_title">��ˮ�������</td>
	    <td class="td_viewcontent_content"><asp:DropDownList ID="fld_17_15" runat="server" Width="150"></asp:DropDownList></td>
    </tr>
    <tr>
	    <td align="right"  class="td_viewcontent_title">���ܲ�ֵ��</td>
	    <td class="td_viewcontent_content"><input id="fld_17_14" class="boxbline" type="text" runat="server" /></td>
	    <td align="right"  class="td_viewcontent_title">&nbsp;</td>
	    <td class="td_viewcontent_content">&nbsp;</td>
    </tr>
        <tr>
            <td class="td_viewcontent_title_top" align="right">
                ���ݣ�
            </td>
            <td class="td_viewcontent_content" colspan="3">
                <input id="Featurex" type="hidden" runat="server">
                <input id="Featurey" type="hidden" runat="server">
                <input id="featurename" type="hidden" runat="server">
                <input id="featurebrief" type="hidden" runat="server">
                <input id="featurecode" type="hidden" runat="server">
                <input id="FeatureKind" value="1" type="hidden" runat="server">
                <input id="featurestate" value="����" type="hidden" runat="server">
                <input id="typecode"  type="hidden" runat="server">
                <table>
                    <tr>
                        <td>
                            <input id="dataface" type="password" style="width: 250px" title="��ӵ�ͼ��ȡ����" value="1111111111111111111111111111"
                                readonly="true">
                        </td>
                        <td>
                            &nbsp;��ȣ�
                        </td>
                        <td>
                            <input id="tmpdepth" type="hidden" value="0" runat="server">
                            <input id="Featuredepth" type="text" style="width: 60px" value="0" onmousedown="this.value=''"
                                onmouseout="if(this.value=='') {this.value=tmpdepth.value}" title="ֻ����������" runat="server">
                        </td>
                        <td>
                            &nbsp;<a href="javascript:__doOpenMap('1',form1.featurecode.value+'|'+form1.FeatureKind.value+'|'+form1.typecode.value)")"><img src="images/getdata_.gif" border="0"></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
</table>
<!--��̬���ɽ���-->
</form>
</body>
</html>