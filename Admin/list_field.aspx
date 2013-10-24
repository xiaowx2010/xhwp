<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage"
    Debug="true" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead ID="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->

<script runat="server" language="C#">
        private void Page_Load(object sender, System.EventArgs e)
        {
			if(!IsSystemDeveloper())
			{
				Response.Redirect("getpage.aspx");
			}
            string h_mgroup = GetQueryString("mgroup", "0");
            string h_mlevel = GetQueryString("mlevel", "0");
            string h_mmodule = GetQueryString("mmodule", "0");
                       
            SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
            tb_2.Visible = false;
            string fstr = "";
            if (!IsPostBack)
            {   
               
                //��ģ����
                BindListControl(selectmodulegroup, "ModuleCode", "ModuleName", "select ModuleCode,ModuleName from gmis_module where ModuleLevel=1");                
                if(selectmodulegroup.SelectedItem!=null)
                {
                    SetFilter(selectmodulegroup, h_mgroup);
                    //��ģ�鼶��
                    BindListControl(selectlevel, "modulelevel", "levelname", "select modulelevel,'��'+Cast(modulelevel as varchar(50))+'��' as levelname from gmis_module where ModuleLevel>1 and Moduleindex like ('%'+(select moduleindex from gmis_module where modulecode="+selectmodulegroup.SelectedValue+")+'%') Group By ModuleLevel");                    
                    if(selectlevel.SelectedItem!=null)
                    {
                        SetFilter(selectlevel, h_mlevel);
                        //��ģ��
                        BindListControl(selectmodule, "ModuleCode", "ModuleName", "select modulecode,modulename from gmis_module where Moduleindex like ('%'+(select moduleindex from gmis_module where modulecode=" + selectmodulegroup.SelectedValue + ")+'%') and ModuleLevel=" + selectlevel.SelectedValue +"");
                        if(selectmodule.SelectedItem!=null)
                        {
                             SetFilter(selectmodule, h_mmodule);
                        }
                    }
                }
            }
            string h_fstr="";
            if(selectmodule.SelectedItem!=null && selectmodule.SelectedItem.Value!="0")
            {
                pid = selectmodule.SelectedItem.Value;
                tb_2.Visible=true;
                h_fstr=" and modulecode in (select modulecode from gmis_module where moduleindex like '%'+(select moduleindex from gmis_module where modulecode="+selectmodule.SelectedItem.Value+")+'%')";
            }
           
            list.Rows = GetListRows();
           
            list.SqlStr = GetListSQL(Convert.ToInt32(navindex) * list.Rows, list.Rows,h_fstr);           
        }
        private string GetListSQL(int fromcount,int pagerows,string fstr)
        {
            return "declare @allcount int;select @allcount=count(1) from gmis_field  where 1=1 "+fstr+" ;select @allcount as allcount,caption,fieldname,gmis_FieldType.FieldTypeName as FieldTypeName,(select modulename from gmis_module where gmis_module.modulecode=gmis_field.modulecode ),case when fieldstatus=0 then '����' else '����' end,'&nbsp;' as btnstr,FieldCode,modulecode from gmis_field Left Outer Join gmis_FieldType on gmis_FieldType.FieldTypeCode=gmis_field.fieldtypecode  where FieldCode not in (select top " + fromcount + " FieldCode from gmis_field where 1=1 "+fstr+" order by  modulecode,fieldindex) and FieldCode in (select top " + (fromcount+pagerows) + " FieldCode from gmis_field where 1=1 "+fstr+" order by  modulecode,fieldindex)  "+fstr+" order by modulecode,fieldindex";
        }
        public override void BeforeOutput(DataTable dt, int rowi)
        {
            DataRow dr = dt.Rows[rowi];
            if (mua.IndexOf(";3;") != -1)
            {
                dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid="+dr["ModuleCode"].ToString()+"&id=" + dr["FieldCode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
            }

            if (mua.IndexOf(";4;") != -1)
            {
                dr["btnstr"] += "<a href=\"javascript:if(confirm('ȷ��ɾ����')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&pid="+dr["ModuleCode"].ToString()+"&id=" + dr["FieldCode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"ɾ��\" align=\"absmiddle\" border=\"0\"></a>";
            }

        }
        private void Change_Module(object sender, System.EventArgs e)
        {
            string h_mgroup = (selectmodulegroup.SelectedItem != null) ? selectmodulegroup.SelectedValue : "0";
            string h_mlevel = (selectlevel.SelectedItem != null) ? selectlevel.SelectedValue : "0";
            string h_mmodule = (selectmodule.SelectedItem != null) ? selectmodule.SelectedValue : "0";
            Response.Redirect("list_field.aspx?mid=" + mid + "&mgroup=" + h_mgroup + "&mlevel=" + h_mlevel+"&mmodule="+h_mmodule);
        }

        
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
        <!--ѡ�-->
        <!--ѡ�-->
        <!--����������-->
        <!--#include file="toolbarleft.aspx"-->
        <td style="padding-left: 5px;">
            <table border="0" cellspacing="0" cellpadding="0" align="left">
                <tr>
                    <td class="font_blackcolor_B" nowrap>
                        ģ���飺</td>
                    <td>
                        <asp:DropDownList ID="selectmodulegroup" Style="width: 150px;" AutoPostBack="true"
                            OnSelectedIndexChanged="Change_Module" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
        <td style="padding-left: 5px;">
            <table border="0" cellspacing="0" cellpadding="0" align="left">
                <tr>
                    <td class="font_blackcolor_B" nowrap>
                        �㼶��</td>
                    <td>
                        <asp:DropDownList ID="selectlevel" Style="width: 150px;" AutoPostBack="true" OnSelectedIndexChanged="Change_Module"
                            runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
        <td style="padding-left: 5px;">
            <table border="0" cellspacing="0" cellpadding="0" align="left">
                <tr>
                    <td class="font_blackcolor_B" nowrap>
                        ģ�飺</td>
                    <td>
                        <asp:DropDownList ID="selectmodule" Style="width: 150px;" AutoPostBack="true" OnSelectedIndexChanged="Change_Module"
                            runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbar.aspx"-->
        <!--�ұ߹̶���ť-->
        <!--#include file="toolbarright.aspx"-->
        <!--����������-->
        <G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
            <G:Template id="listtemphead" type="head" runat="server">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
                    <tr class="tr_listtitle">
                        <td>
                            &nbsp;</td>
                        <td width="25%" align="left">
                            �ֶα���</td>
                        <td width="25%" align="left">
                            �ֶ�����</td>
                        <td width="15%" align="left">
                            �ֶ�����</td>
                        <td width="15%" align="left">
                            ����ģ��</td>
                        <td width="10%" align="left">
                            ״̬</td>
                        <td width="10%" align="center">
                            ����</td>
                    </tr>
            </G:Template>
            <G:Template id="listtemp1" runat="server">
                <tr class="tr_listcontent">
                    <td>
                        &nbsp;</td>
                    <td align="left">
                        *</td>
                    <td align="left">
                        *&nbsp;</td>
                    <td align="left">
                        *&nbsp;</td>
                    <td align="left">
                        *</td>
                    <td align="left">
                        *</td>
                    <td align="center">
                        *</td>
                </tr>
            </G:Template>
            <G:Template id="listtemp2" runat="server">
                <tr class="tr_listcontent">
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </G:Template>
            <G:NavStyle5 ID="NavStyle" PageUrl="list_field.aspx" runat="server">
            </G:NavStyle5>
        </G:ListTable>
    </form>
</body>
</html>
