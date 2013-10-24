<!-- ϵͳ����ģ����� [�༭] -->

<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Import Namespace="System.IO" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<!--#include file="modulefunc.aspx"-->
<script language="C#" runat="server">
	
    private void Page_Load(object sender, System.EventArgs e)
    {
		if(!IsSystemDeveloper())
		{
			Response.Redirect("getpage.aspx");
		}
		
        SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    
        tabid=GetQueryString("tabid","1");
        dtable = "gmis_module";
        filter = " modulecode=" + id;
        flds = new string[] { "modulename", "modulebrief", "modulestate", "modulelevel", "moduleuppercode", "useactions", "listhelp", "edithelp", "viewhelp", "moduleposition", "moduleicon" };
        mflds = new string[] { "ģ����|modulename" };
        types = "00111000010";
		
		/**׷��ѡ�**/
		AddTab("1","������Ϣ");
		if(id!="0")
		{
			AddTab("2","�ֶνṹ");
		}
		/**׷��ѡ�**/
        string h_fstr = "";
        if (id != "0")
        {
            h_fstr = " or modulecode=" + id + "";
        }
        if (!IsPostBack)
        {
            BindListControl(useactions, "actioncode", "actionname", "select actioncode,actionname from gmis_action where modulecode=0 " + h_fstr);
            BindListControl(modulelevel, "modulelevel", "levelname", "select distinct modulelevel,'��'+Cast(modulelevel as varchar(50))+'��' as levelname from gmis_module where modulestate=0 and modulelevel<>0");

            modulestate.Items.Add(new ListItem("����", "0"));
            modulestate.Items.Add(new ListItem("����", "1"));
            int h_level = modulelevel.Items.Count + 1;
            modulelevel.Items.Add(new ListItem("��" + h_level.ToString() + "��", h_level.ToString()));

            if (modulelevel.SelectedItem != null && modulelevel.SelectedItem.Value != "1")
            {
                BindListControl(moduleuppercodetxt, "modulecode", "modulename", "select modulecode,modulename from gmis_module where modulestate=0 and modulelevel=" + (Convert.ToInt32(modulelevel.SelectedItem.Value) - 1) + " and modulename not in ('����','ģ��','�ֶι���')");
            }
            if (id != "0")
            {//������ֵ
                guangye.BindData(dtable, filter, flds);
                if (modulelevel.SelectedItem != null && modulelevel.SelectedItem.Value != "1")
                {
                    BindListControl(moduleuppercodetxt, "modulecode", "modulename", "select modulecode,modulename from gmis_module where modulestate=0 and modulelevel=" + (Convert.ToInt32(modulelevel.SelectedItem.Value) - 1) + "");
                }
                SetFilter(moduleuppercodetxt, moduleuppercode.Value);
            }

            if (id != "0" && IsSystemDeveloper())
            {
                string h_mtable = GetModuleTableName(id);
                tb_createtable.Visible = !CheckSysObject(h_mtable);
                tb_6.Visible = true;
                tb_7.Visible = true;
                tb_createfile.Visible = true;
            }
            else
            {
                tb_createfile.Visible = false;
                tb_createtable.Visible = false;
                tb_6.Visible = false;
                tb_7.Visible = false;
            }
        }

    }
    //�ı�ģ��㼶
    private void Change_Level(object sender, System.EventArgs e)
    {
        moduleuppercodetxt.Items.Clear();
        if (modulelevel.SelectedItem != null && modulelevel.SelectedItem.Value != "1")
        {
            BindListControl(moduleuppercodetxt, "modulecode", "modulename", "select modulecode,modulename from gmis_module where modulestate=0 and modulelevel=" + (Convert.ToInt32(modulelevel.SelectedItem.Value) - 1) + "  and modulename not in ('����','ģ��','�ֶι���')");
        }
    }
    public override void BeforeSave()
    {
        moduleuppercode.Value = (moduleuppercodetxt.SelectedItem != null && moduleuppercodetxt.SelectedItem.Value != "") ? moduleuppercodetxt.SelectedItem.Value : "0";
        string h_fstr = "";
        if (moduleuppercode.Value != "")
        {
            h_fstr = " and moduleuppercode=" + moduleuppercode.Value + " ";

        }
        db.SqlString = "select max(moduleposition)+1 from " + dtable + " where 1=1 " + h_fstr;
        if (db.GetDataTable().Rows.Count > 0)
            moduleposition.Value = db.GetDataTable().Rows[0][0].ToString();
        else
            moduleposition.Value = "1";
        //����
        if (id == "0")
        {
            if (modulename.Value.Trim() != "")
            {
                db.SqlString = "select modulecode from " + dtable + " where modulename='" + modulename.Value.Trim() + "'" + h_fstr;
                if (db.GetDataTable().Rows.Count > 0)
                {
                    SetSESSION("alert", "��������ģ�飡");
                    Response.Redirect("execommand.aspx?mid=" + mid + "");
                }
            }
            SetSESSION("extsql", "SELECT @@IDENTITY AS 'ModuleCode'; DECLARE @MID int; SELECT @MID=@@IDENTITY;INSERT INTO gmis_field (fieldname,caption,modulecode,fieldtypecode,datalength,fieldindex,defaultvalue,fielddatasrc,oneditlist,editlistcolumnwidth,onedit,fullline,oneditmust,fieldstatus,isvital,IsPrimaryKey) VALUES ('MoCode','�Զ����',@MID,2,4,1,'0','','0',0,'0','0','0',0,'1','1');INSERT INTO gmis_field (fieldname,caption,modulecode,fieldtypecode,datalength,fieldindex,defaultvalue,fielddatasrc,oneditlist,editlistcolumnwidth,onedit,fullline,oneditmust,fieldstatus,isvital) VALUES ('CreatorCode','�����߱��',@MID,2,4,2,'0','','0',0,'0','0','0',0,'1');INSERT INTO gmis_field (fieldname,caption,modulecode,fieldtypecode,datalength,fieldindex,defaultvalue,fielddatasrc,oneditlist,editlistcolumnwidth,onedit,fullline,oneditmust,fieldstatus,isvital,IsPrimaryKey) VALUES ('CreateDate','����ʱ��',@MID,7,8,3,'getdate()','','0',0,'0','0','0',0,'1','1')");
        }


    }
    //����ģ�����ݱ�
    private void Click_CreateTable(object sender, System.EventArgs e)
    {

        string h_mtable = GetModuleTableName(id);
        string exeinfo = "";
        DataRow[] fdr = GetFields(id).Select("fieldname<>'mocode'");
        StringBuilder createtablesb = new StringBuilder();
        if (fdr.Length > 0)
        {
            createtablesb.Append("Begin if not exists (select id from sysobjects where id = object_id('" + h_mtable + "')) create table [dbo].[" + h_mtable + "] (MoCode int IDENTITY(1,1) PRIMARY KEY CLUSTERED");
            foreach (DataRow dr in fdr)
            {
                string h_datalength = "";
                if (dr["sqlname"].ToString().ToLower() == "varchar")
                {
                    h_datalength = "(" + dr["datalength"].ToString() + ")";
                }
                string h_defaultvalue = dr["defaultvalue"].ToString();
                if (h_defaultvalue == "")
                {
                    h_defaultvalue = "''";
                }
                //createtablesb.Append("," + dr["fieldname"].ToString() + " " + dr["sqlname"].ToString() + h_datalength + " not null Default(" + h_defaultvalue + ")");
				createtablesb.Append("," + dr["fieldname"].ToString() + " " + dr["sqlname"].ToString() + h_datalength + " null Default(" + h_defaultvalue + ")");

            }
            createtablesb.Append("); End");
        }
        
        if (createtablesb.Length > 0)
        {
            db.SqlString = createtablesb.ToString();
            exeinfo = db.UpdateTable();
        }
        alertmess.InnerText = exeinfo;
    }
    //����ģ���ļ�edit,list,view
    private void Click_CreateFile(object sender, System.EventArgs e)
    {

        string head_path = Server.MapPath("/admin/common/head.txt");
        string foot_path = Server.MapPath("/admin/common/foot.txt");
        StringBuilder h_sb = new StringBuilder();
        StringBuilder f_sb = new StringBuilder();
        if (File.Exists(head_path) && File.Exists(foot_path))
        {

            using (StreamReader sr = new StreamReader(head_path, System.Text.Encoding.Default, true))
            {
                String line;
                while ((line = sr.ReadLine()) != null)
                {
                    h_sb.Append(line + "\n");
                }
            }

            using (StreamReader sr = new StreamReader(foot_path, System.Text.Encoding.Default, true))
            {
                String line;              
                while ((line = sr.ReadLine()) != null)
                {
                    f_sb.Append(line + "\n");
                }
            }

            if (h_sb.Length > 0 && f_sb.Length > 0)
            {
                bool flag_create = false, flag_change = false;
                string cfile_path = "";
                System.Text.Encoding temp = System.Text.Encoding.Default;
                FileInfo fi;
                string[] h_aidarr = new string[] { "list", "edit", "view" };
                foreach (string h_aid in h_aidarr)
                {
                    cfile_path = Server.MapPath("/admin/" + h_aid + "_" + id + ".aspx");
                    flag_create = false;
                    flag_change = false;
                    if (!File.Exists(cfile_path))
                    {
                        fi = new FileInfo(cfile_path);
                        using (FileStream fs = fi.Create()) //д�뵽�´������ļ�
                        {
                            byte[] b = temp.GetBytes("");
                            if (h_aid.ToLower() == "list")//�б�
                            {
                                b = temp.GetBytes("<!--" + modulename.Value + ",�б�ҳ-->\n" + h_sb.ToString() + "<!--��̬����html,��ʼ-->\n" + CreateListHTML(id) + "<!--��̬����html,����-->\n" + f_sb.ToString());
                            }
                            else if (h_aid.ToLower() == "edit")//�༭
                            {
                                b = temp.GetBytes("<!--" + modulename.Value + ",�༭ҳ-->\n" + h_sb.ToString() + "<!--��̬����html,��ʼ-->\n" + CreateEditHTML(id,"edit") + "<!--��̬����html,����-->\n" + f_sb.ToString());
                            }
                            else if (h_aid.ToLower() == "view")//�鿴
                            {
                                b = temp.GetBytes("<!--" + modulename.Value + ",�鿴ҳ-->\n" + h_sb.ToString() + "<!--��̬����html,��ʼ-->\n" + CreateEditHTML(id, "view") + "<!--��̬����html,����-->\n" + f_sb.ToString());
                            }
                            fs.Write(b, 0, b.Length);
                            fs.Close();
                            flag_create = true;
                        }
                    }
                    else
                    {
                        h_sb.Remove(0, h_sb.Length);
                        using (StreamReader sr = new StreamReader(cfile_path, System.Text.Encoding.Default, true))
                        {
                            String line;
                            while ((line = sr.ReadLine()) != null)
                            {
                                if (line.IndexOf("<!--��̬����html,��ʼ-->") > -1)
                                    break;
                                h_sb.Append(line + "\n");
                                
                            }
                        }
                        fi = new FileInfo(cfile_path);
                        fi.Delete();//��ԭ�����ļ�ɾ��;
                        using (FileStream fs = fi.Create()) //д�뵽�´������ļ�
                        {
                            byte[] b = temp.GetBytes(""); ;
                            if (h_aid.ToLower() == "list")//�б�
                            {
                                b = temp.GetBytes(h_sb.ToString() + "<!--��̬����html,��ʼ-->\n" + CreateListHTML(id) + "<!--��̬����html,����-->\n" + f_sb.ToString());
                            }
                            else if (h_aid.ToLower() == "edit")//�༭
                            {
                                b = temp.GetBytes(h_sb.ToString() + "<!--��̬����html,��ʼ-->\n" + CreateEditHTML(id, "edit") +"<!--��̬����html,����-->\n"+ f_sb.ToString());
                            }
                            else if (h_aid.ToLower() == "view")//�鿴
                            {
                                b = temp.GetBytes(h_sb.ToString() + "<!--��̬����html,��ʼ-->\n" + CreateEditHTML(id, "view") +"<!--��̬����html,����-->\n"+ f_sb.ToString());
                            }
                            fs.Write(b, 0, b.Length);
                            fs.Close();
                            flag_change = true;
                        }
                    }
                }
                if (flag_create)
                {
                    alertmess.InnerText = "�ɹ��������ļ���";
                }
                else if (flag_change)
                {
                    alertmess.InnerText = "�ɹ����޸��ļ���";
                }
                else
                {
                    alertmess.InnerText = "�ļ���ʽ���ܱ��ƻ����޷�����/�޸ģ�";
                }

            }

        }
        else
        {
            alertmess.InnerText = "ģ���ļ�common/head.txt��common/foot.txt�����ڣ�";
        }


    }
    //ģ������/����
    private void Click_ChangeIndex(object sender, System.EventArgs e)
    {
        string idstr = ((Control)sender).ID;
        alertmess.InnerText = ChangeModuleIndex(idstr);
    }
   //��̬���ѡ�//
private void AddTab(string tabcode,string tabname)
{
    if(tabcode!="1")
    {
        HtmlTableCell cell0 = new HtmlTableCell();
        cell0.InnerText=(tabcode=="0")?"":"|";
        cell0.Width="11";
        cell0.Align="center";
        tabs.Rows[0].Cells.Add(cell0);
    }
	HtmlTableCell cell = new HtmlTableCell();
	Guangye.WebApplication.Controls.Button btn = new Guangye.WebApplication.Controls.Button();
	btn.ID = "btn_bs_"+tabcode;
	btn.Text = tabname;
	btn.Type = "tab";	
	btn.Mode =(tabid==tabcode)?"on":"off";	
    if(tabcode=="2")
    {
		btn.Url = "edit_field.aspx?mid=3&aid="+StringUtility.StringToBase64("edit")+"&tabid="+tabcode+"&pid="+id;
    }else if(tabcode=="1")
    {
		btn.Url = "edit_module.aspx?mid="+mid+"&aid="+StringUtility.StringToBase64("edit")+"&tabid="+tabcode+"&id="+id;
	}
	
	cell.Controls.Add(btn);
	tabs.Rows[0].Cells.Add(cell);
}
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
        <!--ѡ�-->
        <div align=right>
        <table id="tabs" runat="server" border="0" cellpadding="0" cellspacing="0" ><tr></tr></table>
        </div>
        <!--ѡ�-->
        <!--����������-->
        <!--#include file="toolbarleft.aspx"-->
        <td id="tb_6" visible="false" runat="server" style="padding-left: 5px; width: 55px;"
            nowrap>
            <G:Button ID="btn_up" Type="toolbar" Mode="on" Text="����" OnClick="Click_ChangeIndex"
                runat="server">
            </G:Button>
        </td>
        <td id="tb_7" visible="false" runat="server" style="padding-left: 5px; width: 55px;"
            nowrap>
            <G:Button ID="btn_down" Type="toolbar" Mode="on" Text="����" OnClick="Click_ChangeIndex"
                runat="server">
            </G:Button>
        </td>
        <td id="tb_createtable" visible="false" runat="server" style="padding-left: 5px;
            width: 115px;" nowrap>
            <G:Button ID="btn_createtable" Type="toolbar" Mode="on" Text="����ģ�����ݱ�" OnClick="Click_CreateTable"
                runat="server">
            </G:Button>
        </td>
        <td id="tb_createfile" visible="false" runat="server" style="padding-left: 5px; width: 105px;"
            nowrap>
            <G:Button ID="btn_createfile" Type="toolbar" Mode="on" Text="����ģ���ļ�" OnClick="Click_CreateFile"
                runat="server">
            </G:Button>
        </td>
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbar.aspx"-->
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbarright.aspx"-->
        <!--����������-->
        <!--����-->
        <input id="moduleposition" type="hidden" style="width: 160px" maxlength="100" runat="server">
        <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
            <tr>
                <td align="right" class="td_viewcontent_title">
                    ģ������</td>
                <td class="td_viewcontent_content">
                    <input id="modulename" type="text" class="boxbline" style="width: 95%;" runat="server"></td>
                <td align="right" class="td_viewcontent_title">
                    ģ���ʶ��</td>
                <td class="td_viewcontent_content">
                    <input id="modulebrief" type="text" class="boxbline" style="width: 95%;" runat="server"></td>
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title">
                    ģ��ͼ����ţ�</td>
                <td class="td_viewcontent_content">
                    <input id="moduleicon" type="text" class="boxbline" style="width: 95%;" runat="server"></td>
                <td align="right" class="td_viewcontent_title">
                    ģ��״̬��</td>
                <td class="td_viewcontent_content">
                    <asp:DropDownList ID="modulestate" Style="width: 150px;" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title">
                    ģ��㼶��</td>
                <td class="td_viewcontent_content">
                    <asp:DropDownList ID="modulelevel" class="boxbline" Style="width: 150px;" AutoPostBack="true"
                        OnSelectedIndexChanged="Change_Level" runat="server">
                    </asp:DropDownList>
                </td>
                <td align="right" class="td_viewcontent_title">
                    ֱ���ϼ���</td>
                <td class="td_viewcontent_content">
                    <input id="moduleuppercode" type="hidden" runat="server" />
                    <asp:DropDownList ID="moduleuppercodetxt" class="boxbline" Style="width: 150px;"
                        runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="td_viewcontent_title" align="right">
                    ��ز�����</td>
                <td class="td_viewcontent_content" colspan="3">
                    <asp:CheckBoxList ID="useactions" RepeatDirection="Horizontal" RepeatColumns="6"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title">
                    �б�ҳ������</td>
                <td class="td_viewcontent_content" colspan="3">
                    <textarea id="listhelp" class="boxbline" style="width: 98%; height: 60px;" runat="server">
      </textarea>
                </td>
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title">
                    �༭ҳ������</td>
                <td class="td_viewcontent_content" colspan="3">
                    <textarea id="edithelp" class="boxbline" style="width: 98%; height: 60px;" runat="server">
      </textarea>
                </td>
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title">
                    �鿴ҳ������</td>
                <td class="td_viewcontent_content" colspan="3">
                    <textarea id="viewhelp" class="boxbline" style="width: 98%; height: 60px;" runat="server">
      </textarea>
                </td>
            </tr>
        </table>
        <!--����-->
    </form>
</body>
</html>
