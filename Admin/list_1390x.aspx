<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">

    <script type="text/javascript">

    </script>

</head>
<!--#include file="func.aspx"-->

<script runat="server" language="C#">
    string sortstr, sortdir,p_field,p_key,p_type,p_area;
    private void Page_Load(object sender, System.EventArgs e)
    {

        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
        string base_aid=StringUtility.StringToBase64("add");
        btn_newadd.Visible=false;
        sortstr = GetQueryString("sortstr", "");  //�����ֶ�
        sortdir = GetQueryString("sortdir", "1");  //1����0����
        p_field = GetQueryString("fid", "ԭú");  //��ѡ���ֶ�
		p_area = GetQueryString("select_Area", "0");  //��������
		p_key = GetQueryString("p_key", "");  //��ҵ��
        if(!IsPostBack)
        {
			BindListControl(select_field,"fld_1390_1","fld_1390_1","select fld_1390_1,fld_1390_1 from gmis_mo_1390");
            SetFilter(select_field,p_field);
			BindListControl(select_Area,"fld_1201_1","fld_1201_1","select fld_1201_1 from gmis_mo_1201 where fld_1201_1<>'�����'","-��������-");
            SetFilter(select_Area,p_area);
			key.Value=p_key;

        }
        BindDataList();
    }

    private void BindDataList()
    {
		db.SqlString = "select mocode,fld_1390_2,fld_1390_1,fld_1390_3,fld_1390_4 from gmis_mo_1390 where fld_1390_1='"+p_field+"'";
		DataTable fieldDT = db.GetDataTable();

		string h_unit = fieldDT.Rows[0]["fld_1390_4"].ToString();
		string h_newFieldCode = fieldDT.Rows[0]["fld_1390_2"].ToString();
		string h_oldFieldCode = fieldDT.Rows[0]["fld_1390_3"].ToString();
		string h_fieldName = fieldDT.Rows[0]["fld_1390_1"].ToString();//��Ⱦ����
		string h_newModuleCode = h_newFieldCode.Substring(h_newFieldCode.IndexOf('_')+1,4);
		string h_oldModuleCode = h_oldFieldCode.Substring(h_oldFieldCode.IndexOf('_')+1,3);

        string h_fstr = "";

        /*����ɸѡ����*/
		if(p_area != "0")
		{
			h_fstr += " and fld_1280_41='"+p_area+"'";
		}
		if(p_key != String.Empty)
		{
			h_fstr += " and fld_1280_2 like '%"+p_key+"%'";
		}
        /*����ɸѡ����*/

        int pagesize = GetListRows();//��ȡ�б�ÿҳ��ʾ�ļ�¼��
        int fromcount = Convert.ToInt32(navindex) * pagesize;//�����ѷ���ҳ���ļ�¼��
        string tablename = " gmis_mo_1280 g1280 left join gmis_mo_658 g658 on g1280.fld_1280_1=g658.fld_658_1 ";//���ݱ�����
        tablename += " inner join gmis_mo_"+h_newModuleCode+" on fld_1280_1=fld_"+h_newModuleCode+"_1 ";
		tablename += " inner join gmis_mo_"+h_oldModuleCode+" on fld_1280_1=fld_"+h_oldModuleCode+"_1 ";
		if(h_fieldName.IndexOf("��������") > -1 || h_fieldName.IndexOf("��������") > -1)
		{
			tablename += " inner join gmis_mo_1312 on fld_1280_1=fld_1312_1 ";
			tablename += " inner join gmis_mo_707 on fld_1280_1=fld_707_1 ";
		}
		else if(h_fieldName=="��ˮȥ��")
		{
			h_newFieldCode="fld_1284_7+(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_1284_7)";
			h_oldFieldCode="fld_668_7+(select fld_1165_2 from gmis_mo_1165 where fld_1165_1=fld_668_7)";
		}
        string orderstr = " order by fld_1280_2 desc";//��������;

        if (sortstr != "")
        {
            orderstr = " order by " + sortstr + " " + ((sortdir == "1") ? " desc" : " asc");
        }
        else
        {
            sortstr = "fld_1280_2";
        }


        //���ñ�ͷ
        StringBuilder sbhead = new StringBuilder();
        sbhead.Append("<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"righttableline\"><tr class=\"tr_listtitle\" align=\"left\">");
        ArrayList al = new ArrayList();

        al.Add(new string[] { "��ҵ��", "30%", "fld_1280_2" });
        al.Add(new string[] { "��Ⱦ����", "15%", "fld_1280_2" });
        al.Add(new string[] { "2007����ֵ��"+h_unit+"��", "18%", h_newFieldCode });
        al.Add(new string[] { "2009����ֵ��"+h_unit+"��", "18%", h_oldFieldCode });
        al.Add(new string[] { "��������", "20%", "fld_1280_41" });

        sortdir = (sortdir == "0") ? "1" : "0";
        string h_dirstr = "";
        string h_dirimg = "";
        foreach (string[] arr in al)
        {
            if (arr[2] == sortstr)
            {
                h_dirstr = (sortdir == "0") ? "����" : "����";
                h_dirimg = (sortdir == "0") ? "<img src=\"images/asc.gif\" style=\"margin:3px\" title=\"����\"/>" : "<img src=\"images/desc.gif\" style=\"margin:3px\" title=\"����\" />";

                sbhead.Append("<td style=\"padding-top:3px;\"  width=\"" + arr[1] + "\" ><a href=\"list_1390.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&sortstr=" + StringUtility.StringToBase64(arr[2]) + "&fid="+StringUtility.StringToBase64(p_field)+"&sortdir=" + sortdir + "\" class=\"listtitle\"  title=\"" + arr[0] + h_dirstr + "\">" + arr[0] + "</a>" + h_dirimg + "</td>\n");
            }
            else
            {
                sbhead.Append("<td width=\"" + arr[1] + "\" ><a href=\"list_1390.aspx?aid=" + StringUtility.StringToBase64("list") + "&mid=" + mid + "&fid="+StringUtility.StringToBase64(p_field)+"&sortstr=" + StringUtility.StringToBase64(arr[2]) + "&sortdir=" + sortdir + "\" class=\"listtitle\"  title=\"" + arr[0] + h_dirstr + "\">" + arr[0] + "</a></td>\n");
            }


        }

        sbhead.Append("</tr>");

        listtemphead.InnerHtml = sbhead.ToString();


        //�����б�ؼ���ʾ����
        //�����б�ؼ�����Դ
		string h_SqlStr="select distinct '' as orgcode,fld_1280_2,'"+h_fieldName+"' as h_fieldName,'' as old,'' as new,fld_1280_41,fld_1280_1,isnull("+h_newFieldCode+",0) as h_newFieldCode,"+h_oldFieldCode+" as h_oldFieldCode from "+tablename+"  where 1=1 " + h_fstr + " " + orderstr + " ";
		DataTable h_dt = db.GetDataTable(db.ConnStr, h_SqlStr);
		if(h_fieldName != "��ˮȥ��")
		{
			double h_old=0,h_new=0;
			foreach (DataRow dr in h_dt.Rows)
			{
					dr["old"]=double.Parse(dr["h_oldFieldCode"].ToString()).ToString("N20").TrimEnd('0').TrimEnd('.');
					dr["new"]=double.Parse(dr["h_newFieldCode"].ToString()).ToString("N20").TrimEnd('0').TrimEnd('.');
					h_old+=double.Parse(dr["h_oldFieldCode"].ToString());
					h_new+=double.Parse(dr["h_newFieldCode"].ToString());
			}
			AmountMes.InnerHtml="�ϼ� 07�����ݣ�"+h_old.ToString("N20").TrimEnd('0').TrimEnd('.')+"��"+h_unit+"��; 09�����ݣ�"+h_new.ToString("N20").TrimEnd('0').TrimEnd('.')+"��"+h_unit+"����<font color=red>ͬ������"+(h_new-h_old).ToString("N20").TrimEnd('0').TrimEnd('.')+"��"+h_unit+"��</font>,<font color=red>Լ"+((h_new-h_old)*100/h_old).ToString("N2")+"%</font>";
		}
		else
		{
			AmountMes.InnerHtml="&nbsp;";
		}
       list.DataTable = h_dt;
	   list.Rows = h_dt.Rows.Count;

		Response.Write(h_dt.Rows.Count);

    }

    public override void BeforeOutput(DataTable dt, int rowi)
    {	//����ǰҳ����

        DataRow dr = dt.Rows[rowi];

	    dr["orgcode"] = StringUtility.StringToBase64(dr["fld_1280_1"].ToString());

    }

    private void Click_Seach(object sender, System.EventArgs e)
    {
        string h_fstr;//url����
		h_fstr ="";
		if(select_Area.SelectedItem!=null&&guangye.GetControlValue(select_Area)!="0")
		{
			h_fstr += "&select_Area="+StringUtility.StringToBase64(guangye.GetControlValue(select_Area));
		}
		if(select_field.SelectedItem!=null&&guangye.GetControlValue(select_field)!="0")
		{
			h_fstr += "&fid="+StringUtility.StringToBase64(guangye.GetControlValue(select_field));
		}
		if(guangye.GetControlValue(key)!=String.Empty)
		{
			h_fstr += "&p_key="+StringUtility.StringToBase64(guangye.GetControlValue(key));
		}

        Response.Redirect("list_1390.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex=0&pid="+pid+h_fstr);
    }
	//��Ⱦ�����
    private void Change_Type(object sender, System.EventArgs e)
    {
		string h_fstr;//url����
		h_fstr ="";

		if(select_Area.SelectedItem!=null&&guangye.GetControlValue(select_Area)!="0")
		{
			h_fstr += "&select_Area="+StringUtility.StringToBase64(guangye.GetControlValue(select_Area));
		}
		if(select_field.SelectedItem!=null&&guangye.GetControlValue(select_field)!="0")
		{
			h_fstr += "&fid="+StringUtility.StringToBase64(guangye.GetControlValue(select_field));
		}
		if(guangye.GetControlValue(key)!=String.Empty)
		{
			h_fstr += "&p_key="+StringUtility.StringToBase64(guangye.GetControlValue(key));
		}
        Response.Redirect("list_1390.aspx?aid="+StringUtility.StringToBase64(aid)+"&mid="+mid+"&id="+id+"&navindex=0&pid="+pid+h_fstr);
	}
	private DataTable GetModules()
	{
        db.SqlString= "select modulecode,modulename,modulebrief,moduleuppercode,modulelevel from gmis_module where modulestate=0 and moduleindex asc";
		return db.GetDataTable();
	}
</script>

<script type="text/javascript">
function toAddNew(arg1,arg2,arg3)
{
    //����Ϊpid���Ŀ¼��ѡ�ģ���� ����midΪģ����(ѡ��������)
    window.parent.frames(1).location = "Nav.aspx?pid="+arg3+"&mid="+arg2+"&closed=1";
    window.parent.frames(3).location = "getpage.aspx?aid="+arg1+"&mid="+arg2+"&id=0";
}
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--ѡ�-->
    <!--ѡ�-->
    <!--����������-->
    <!--#include file="toolbarleft.aspx"-->
	<td nowrap style="padding-left: 10px;">
        ��Ⱦ���ӣ�<asp:DropDownList ID="select_field" runat="server"  OnSelectedIndexChanged="Change_Type" style="width: 120px;">
        </asp:DropDownList>
    </td>
    <td nowrap style="padding-left: 10px;">
        ��������<asp:DropDownList ID="select_Area" runat="server" OnSelectedIndexChanged="Change_Type"  style="width: 120px;">
        </asp:DropDownList>
    </td>
    <td nowrap style="padding-left: 10px;">
        ��ҵ����<input id="key" runat="server" type="text" style="width: 100px;" onkeydown="javascript:{if(event.keyCode==13)__doPostBack('btn_seach$btn','');}" />
    </td>
    <td nowrap style="padding-left: 10px;">
        <G:Button id="btn_seach" type="toolbar" mode="on" icon="tb08" text="��ѯ" onclick="Click_Seach"
            runat="server">
        </G:Button>
    </td>
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbar.aspx"-->
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbarright.aspx"-->
	<!--#include file="toolbarleft.aspx"-->
    <!--�ұ߹̶���ť-->
    <td nowrap style="padding-left: 10px;" id="AmountMes" runat="server">
        &nbsp;
    </td>
    <!--�ұ߹̶���ť-->
    <!--#include file="toolbarright.aspx"-->
    <!--����������-->
    <G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
		    <td width="60%">��ҵ��</td>
		    <td width="150" align="left">��Ⱦ����</td>
		    <td width="150" align="left">�ŷ�������λ ��</td>
		    <td width="150" align="left">����������λ ��</td>
		    <td width="150" align="left">������</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td align="left">&nbsp;<a href="view_1199.aspx?aid=dmlldw==&mid=1199&orgcode=*"  >*</a></td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td align="left">&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	</G:ListTable>
    <!--��̬���ɽ���-->
    </form>
</body>
</html>
