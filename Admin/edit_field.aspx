<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

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
            pid = GetQueryString("pid", "0");
            SetToolBar();//设置工具条,同时获取固定URL参数 
            tabid=GetQueryString("tabid","2");
            if(id=="0")
            {
                tb_6.Visible=false;
                tb_7.Visible=false;
            }
            tb_backlist.Visible=false;
            tb_2.Visible=true;
            /**追加选项卡**/
			AddTab("1","基本信息");
			AddTab("2","字段结构");
			/**追加选项卡**/
			
            dtable="gmis_field";
            filter=" fieldcode="+id;
            flds=new string[]{"fieldname","caption","modulecode","fieldtypecode","datalength","fieldindex","defaultvalue","fielddatasrc","oneditlist","editlistcolumnwidth","onedit","fullline","oneditmust","fieldstatus","isvital","IsSearch","ConnectModuleCode","ConnectModuleField","ConnectView"};
            mflds=new string[]{"字段名称|fieldname","字段标题|caption","字段类型|fieldtypecode","所属模块|modulecode"};
            types="0011110001000100111";
            if(!IsPostBack)
            {
				 
                 BindListControl(fieldtypecode,"fieldtypecode", "fieldtypename", GetFieldType());
                 fieldstatus.Items.Add(new ListItem("启用","0"));
                 fieldstatus.Items.Add(new ListItem("禁用","1"));
                 
                 BindListControl(ConnectModuleCodetxt,"modulecode","modulename","select modulecode,(REPLICATE('　',modulelevel-1)+modulename) as modulename from gmis_module order by moduleindex ","无关联模块");
                 
                 onedit.Checked=true;
                 modulecode.Value=(pid=="0")?"":pid;
                 if(id!="0")
                 {
                    guangye.BindData(dtable,filter,flds);
                    SetFilter(ConnectModuleCodetxt,ConnectModuleCode.Value);
                    if(ConnectModuleCodetxt.SelectedItem!=null && ConnectModuleCodetxt.SelectedValue!="0")
                    {
                        BindListControl(ConnectModuleFieldtxt,"fieldcode","caption","select fieldcode,caption from gmis_field where modulecode="+ConnectModuleCodetxt.SelectedValue);
                        SetFilter(ConnectModuleFieldtxt,ConnectModuleField.Value);
                        BindListControl(ConnectViewtxt,"fieldcode","caption","select fieldcode,caption from gmis_field where modulecode="+ConnectModuleCodetxt.SelectedValue);
                        SetFilter(ConnectViewtxt,ConnectView.Value);
                    }
                    
                    isvitaltxt.Visible=(isvital.Checked);
                    onmanual.Disabled=CheckSysColumn(GetModuleTableName(pid),fieldname.Value);   
                               
                    if(!CheckSysColumn(GetModuleTableName(pid),fieldname.Value))
                    {
						fieldtypecode.Enabled=true;
					}else
					{
						fieldtypecode.Enabled=false;
					}
					
					
                 }else
                 {
                        SetFilter(ConnectModuleCodetxt,"0");
						fieldindex.Value="1";
                        fieldname.Value = "fld_" + pid + "_1" ;
                        DataTable dt= GetFields(pid);
                        if(dt.Rows.Count>0)          
                        {
                            DataRow[] dr =dt.Select(" IsVital=0", " fldindex desc");//fldindex为新生成的排序字段，取自动生成字段的序号
                            if (dr.Length > 0 && dr[0]["fieldname"].ToString().IndexOf("fld_"+pid+"_")==0)
                            {
                                fieldname.Value = "fld_" + pid + "_" + (Convert.ToInt32(dr[0]["fieldname"].ToString().Replace("fld_" + pid + "_", "")) + 1).ToString();
                            } 
                            
							DataRow[] drs = dt.Select("", " fieldindex desc");
							if (drs.Length > 0)
							{
								fieldindex.Value = (Convert.ToInt32(drs[0]["fieldindex"]) + 1).ToString();
							}                          
                        } 
						
                 }                
                 BindFieldDataLength(); 
            }
            
           
            
            string h_fstr="";
            if(pid!="0")
            {
				h_fstr=" and Modulecode="+pid+" ";
            }
			list.Rows = GetListRows()-10;           
            list.SqlStr = GetListSQL(Convert.ToInt32(navindex) * list.Rows, list.Rows,h_fstr);           
        }
        private string GetListSQL(int fromcount,int pagerows,string fstr)
        {
            return "declare @allcount int;select @allcount=count(1) from gmis_field  where 1=1 "+fstr+" ;select @allcount as allcount,caption,fieldname,gmis_FieldType.FieldTypeName as FieldTypeName,(select modulename from gmis_module where gmis_module.modulecode=gmis_field.modulecode ),case when fieldstatus=0 then '启用' else '禁用' end,'&nbsp;' as btnstr,FieldCode,modulecode from gmis_field Left Outer Join gmis_FieldType on gmis_FieldType.FieldTypeCode=gmis_field.fieldtypecode  where FieldCode not in (select top " + fromcount + " FieldCode from gmis_field where 1=1 "+fstr+" order by  modulecode,fieldindex) and FieldCode in (select top " + (fromcount+pagerows) + " FieldCode from gmis_field where 1=1 "+fstr+" order by  modulecode,fieldindex)  "+fstr+" order by modulecode,fieldindex";
        }
        public override void BeforeOutput(DataTable dt, int rowi)
        {
            DataRow dr = dt.Rows[rowi];
            if (mua.IndexOf(";3;") != -1)
            {
                dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&pid="+dr["ModuleCode"].ToString()+"&id=" + dr["FieldCode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
            }
            else
            {
                dr["btnstr"] += "<img src=\"images/icons/tb02_off.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\">";
            }
            if (mua.IndexOf(";4;") != -1)
            {
                dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&pid="+dr["ModuleCode"].ToString()+"&id=" + dr["FieldCode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
            }
            else
            {
                dr["btnstr"] += "<img src=\"images/icons/tb03_off.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\">";
            }
        }
        public override void BeforeSave()
        {
            ConnectModuleCode.Value = (ConnectModuleCodetxt.SelectedItem!=null)?ConnectModuleCodetxt.SelectedValue:"0";
            ConnectModuleField.Value = (ConnectModuleFieldtxt.SelectedItem!=null)?ConnectModuleFieldtxt.SelectedValue:"0";
            ConnectView.Value = (ConnectViewtxt.SelectedItem!=null)?ConnectViewtxt.SelectedValue:"0";
            if(id=="0")
            {
                fieldindex.Value="1";
                DataRow[] dr = GetFields(pid).Select("", " fieldindex desc");
                if (dr.Length > 0)
                {
                    fieldindex.Value = (Convert.ToInt32(dr[0]["fieldindex"]) + 1).ToString();
                }
            }
            if(fieldname.Value!="")
            {
                if(id!="0")
                {
                    db.SqlString="select fieldcode from gmis_field where modulecode="+pid+" and fielcode<>"+id+" and fieldname='"+fieldname.Value+"'";
                }else
                {
                    db.SqlString="select fieldcode from gmis_field where modulecode="+pid+" and fieldname='"+fieldname.Value+"'";                
                }
                if(db.GetDataTable().Rows.Count>0)
                {
                     SetSESSION("alert","字段名称"+fieldname.Value+"，已存在！");                
                     Response.Redirect("execommand.aspx?mid=" + mid + "&id=" + id+"&pid="+pid);
                }
                datalength.Value=(datalength.Value=="" || Convert.ToInt32(datalength.Value)>8000)?"100":datalength.Value;
                if(pid!="0")
	            {
	                string tablename=GetModuleTableName(pid);
	               
	                string h_defaultvale = defaultvalue.Value.Trim();
                    if (h_defaultvale == "")
                    {
                        h_defaultvale = "''";
                    }
                    string h_datalength = "";
                    if (fieldtypesql.Value.ToLower() == "varchar")
                    {
                        h_datalength = "(" + datalength.Value + ")";
                    }
                    if (tablename != "" && CheckSysObject(tablename) && !CheckSysColumn(tablename, fieldname.Value))//表存在，且字段不存在于表
                    {                        
                        SetSESSION("extsql","ALTER Table " + tablename + " ADD " + fieldname.Value + " " + fieldtypesql.Value + h_datalength + " not null DEFAULT (" + h_defaultvale + ")");
                        
                    }
                    else if(CheckSysObject(tablename) && CheckSysColumn(tablename, fieldname.Value) && (fieldtypecode.SelectedItem.Value == "1" || fieldtypecode.SelectedItem.Value == "5" || fieldtypecode.SelectedItem.Value == "12"))
                    {
                        SetSESSION("extsql","ALTER Table " + tablename + " alter column " + fieldname.Value + " " + fieldtypesql.Value + h_datalength + " not null");
                    }
                   
	            }  
            }
            
        }
        private void Click_ChangeIndex(object sender, System.EventArgs e)
        {
            string idstr = ((Control)sender).ID;
            alertmess.InnerText=RestructFieldIndex(idstr);
        }
        //调整字段排序
        private string RestructFieldIndex(string idstr)
        {
            string exeinfo = "", sqlstr = "";
            int findex=Convert.ToInt32(fieldindex.Value);
            
                DataRow[] dr = GetFields(pid).Select("","fieldindex asc");
                for (int i = 0; i < dr.Length; i++)
                {
                    if (idstr == "td_up")
                    {
                        if ((Convert.ToInt32(dr[i]["fieldindex"])+1)==findex)
                        {
                            sqlstr = "Update gmis_Field set fieldindex=" + findex + " where modulecode=" + pid + " and fieldcode=" + dr[i]["fieldcode"].ToString() + ";Update gmis_Field set fieldindex=" + dr[i]["fieldindex"].ToString() + " where modulecode=" + pid + " and fieldcode=" + id + "";
                            break;
                        } 
                    }else if(idstr=="td_down")
                    {
                        if ((Convert.ToInt32(dr[i]["fieldindex"])-1)==findex)
                        {
                            sqlstr = "Update gmis_Field set fieldindex=" + findex + " where modulecode=" + pid + " and fieldcode=" + dr[i]["fieldcode"].ToString() + ";Update gmis_Field set fieldindex=" + dr[i]["fieldindex"].ToString() + " where modulecode=" + pid + " and fieldcode=" + id + "";
                            break;
                        } 
                    }
                }
            
            if(sqlstr.Length>0)
            {
                db.SqlString=sqlstr;
                exeinfo=db.UpdateTable();
                
            }
            return exeinfo;
        }
        //改变字段类型
        private void Change_FieldType(object sender, System.EventArgs e)
        {
            datalength.Value = "";
            datalength.Disabled = true;
            BindFieldDataLength();
           
        }
        
        private void Change_ConnectModule(object sender, System.EventArgs e)
        {
            ConnectModuleFieldtxt.Items.Clear();
            ConnectViewtxt.Items.Clear();
            if(ConnectModuleCodetxt.SelectedItem!=null && ConnectModuleCodetxt.SelectedValue!="0")
            {
                 BindListControl(ConnectModuleFieldtxt,"fieldcode","caption","select fieldcode,caption from gmis_field where modulecode="+ConnectModuleCodetxt.SelectedValue);
                 SetFilter(ConnectModuleFieldtxt,ConnectModuleField.Value);
                 BindListControl(ConnectViewtxt,"fieldcode","caption","select fieldcode,caption from gmis_field where modulecode="+ConnectModuleCodetxt.SelectedValue);
                 SetFilter(ConnectViewtxt,ConnectView.Value);
                 
            }
        }
        
        private void BindFieldDataLength()
        {
            if (fieldtypecode.SelectedItem != null)
            {		
						
				DataRow[] dr = GetFieldType().Select("fieldtypecode=" + fieldtypecode.SelectedItem.Value);
				if (dr.Length > 0)
				{
                
                    if(id=="0")
			        {
					    datalength.Value = dr[0]["sqllength"].ToString();
					    defaultvalue.Value = dr[0]["defaultvalue"].ToString();
					}
					fieldtypesql.Value = dr[0]["sqlname"].ToString();
				
                }
                if (fieldtypecode.SelectedItem.Value == "1" || fieldtypecode.SelectedItem.Value == "4" || fieldtypecode.SelectedItem.Value == "5" || fieldtypecode.SelectedItem.Value == "12" )
                {
                    datalength.Disabled = false;
                }
            }
        }
        //动态添加选项卡//
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
		btn.Url = "edit_field.aspx?mid="+mid+"&aid="+StringUtility.StringToBase64("edit")+"&tabid="+tabcode+"&id="+pid;
    }else if(tabcode=="1")
    {
		btn.Url = "edit_module.aspx?mid=2&aid="+StringUtility.StringToBase64("edit")+"&tabid="+tabcode+"&id="+pid;
	}
	
	cell.Controls.Add(btn);
	tabs.Rows[0].Cells.Add(cell);
}        
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
        <!--选项卡-->
        <div align=right>
        <table id="tabs" runat="server" border="0" cellpadding="0" cellspacing="0" ><tr></tr></table>
        </div>
        <!--选项卡-->
        <!--操作工具条-->
        <!--#include file="toolbarleft.aspx"-->
        <td id="tb_6" visible="false" runat="server" style="padding-left: 5px;">
            <table border="0" cellspacing="0" cellpadding="0" id="Table1" align="left">
                <tr>
                    <td>
                        <asp:LinkButton ID="td_up" Style="padding-right: 5px" title="提升位置" OnClick="Click_ChangeIndex"
                            runat="server"><img src="images/up.gif" border=0></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
        <td id="tb_7" visible="false" runat="server" style="padding-left: 5px;">
            <table border="0" cellspacing="0" cellpadding="0" id="Table2" align="left">
                <tr>
                    <td>
                        <asp:LinkButton ID="td_down" Style="padding-right: 5px" title="下降位置" OnClick="Click_ChangeIndex"
                            runat="server"><img src="images/btn_down.gif" border=0></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
        <td nowrap>
            <asp:Label ID="alertmessage" runat="server" ForeColor="red" align="left"></asp:Label></td>
        <!--右边固定按钮-->
        <!--#include file="toolbar.aspx"-->
        <!--右边固定按钮-->
        <!--#include file="toolbarright.aspx"-->
        <!--操作工具条-->
        <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
            <tr>
                <td class="td_viewcontent_title" align="right">
                    字段名称：</td>
                <td colspan="3" class="td_viewcontent_content" class="td_viewcontent_content">
                    <input id="fieldindex" type="hidden" runat="server" />
                    <input id="isvital" runat="server" runat="server" type="checkbox" visible="false">
                    <input id="modulecode" type="hidden" runat="server" /><input id="fieldname" runat="server"
                        contenteditable="false" type="text" class="boxbline" style="width: 250px; height: 16px;">&nbsp;<input
                            id="onmanual" runat="server" type="checkbox" onclick="if(this.checked==true){document.getElementById('fieldname').contentEditable=true;} else {document.getElementById('fieldname').contentEditable=false; }">手动命名<font
                                id="isvitaltxt" runat="server" visible="false" color="red">&nbsp;系统字段</font></td>
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title" nowrap>
                    字段标题：</td>
                <td colspan="3" class="td_viewcontent_content">
                    <input id="caption" runat="server" type="text" class="boxbline" style="width: 95%;
                        height: 16px;"></td>
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title" nowrap>
                    字段类型：</td>
                <td class="td_viewcontent_content" nowrap>
                    <asp:DropDownList ID="fieldtypecode" runat="server" AutoPostBack="true" Enable="false"
                        OnSelectedIndexChanged="Change_FieldType" Style="width: 200px;">
                    </asp:DropDownList></td>
                <td class="td_viewcontent_title" nowrap align="right">
                    长度限制：</td>
                <td class="td_viewcontent_content" nowrap>
                    <input id="datalength" class="boxbline" type="text" style="width: 200px; height: 16px;"
                        runat="server" disabled="true"><input id="fieldtypesql" type="hidden" runat="server" /></td>
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title" nowrap>
                    关联模块：</td>
                <td class="td_viewcontent_content" colspan="3">
                    <asp:DropDownList ID="ConnectModuleCodetxt" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Change_ConnectModule" Style="width: 95%;">
                    </asp:DropDownList>
                    <input id="ConnectModuleCode" type="hidden" runat="server" />
                    </td>
                
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title" nowrap>
                    关联字段：</td>
                <td class="td_viewcontent_content">
                    <asp:DropDownList ID="ConnectModuleFieldtxt" runat="server" Style="width: 200px;">
                    </asp:DropDownList>
                     <input id="ConnectModuleField" type="hidden" runat="server" />
                     </td>
                <td align="right" class="td_viewcontent_title" nowrap>
                    显示字段：</td>
                <td class="td_viewcontent_content">
                    <asp:DropDownList ID="ConnectViewtxt" runat="server" Style="width: 200px;;">
                    </asp:DropDownList>
                    <input id="ConnectView" type="hidden" runat="server" />
                    </td>
                
            </tr>
            
            
            <tr>
                <td align="right" class="td_viewcontent_title" nowrap>
                    编辑页面：</td>
                <td class="td_viewcontent_content" nowrap colspan="3">
                    <input id="onedit" runat="server" type="checkbox" onclick="if(this.checked==false){document.getElementById('fullline').checked=false;document.getElementById('oneditmust').checked=false;}">编辑页字段&nbsp;&nbsp;&nbsp;&nbsp;<input
                        id="fullline" runat="server" runat="server" type="checkbox">编辑页全行&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="oneditmust" runat="server" runat="server" type="checkbox">必填项&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="IsSearch" runat="server" runat="server" type="checkbox">是否参与搜索</td>
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title" nowrap>
                    列表页面：</td>
                <td class="td_viewcontent_content" nowrap>
                    <input id="oneditlist" runat="server" type="checkbox">列表显示</td>
                <td class="td_viewcontent_title" nowrap align="right">
                    列表页占宽：</td>
                <td class="td_viewcontent_content" nowrap>
                    <input id="editlistcolumnwidth" runat="server" type="text" class="boxbline" style="width: 200px;
                        height: 16px;">%</td>
            </tr>
            <tr>
                <td align="right" class="td_viewcontent_title" nowrap>
                    默认值：</td>
                <td class="td_viewcontent_content">
                    <input id="defaultvalue" runat="server" type="text" class="boxbline" style="width: 95%;
                        height: 16px;"></td>
                <td align="right" class="td_viewcontent_title" nowrap>
                    状态：</td>
                <td class="td_viewcontent_content">
                    <asp:DropDownList ID="fieldstatus" runat="server" Style="width: 200px;">
                    </asp:DropDownList></td>
            </tr>
            <tr id="tr_datasrc" visible="false" runat="server">
                <td align="right" class="td_viewcontent_title" nowrap>
                    关联数据：</td>
                <td class="td_viewcontent_content" colspan="3">
                    <textarea id="fielddatasrc" runat="server" class="boxbline" style="width: 95%; height: 60px;"></textarea><br>
                    <font color="red">多个选项数据之间以"|"分隔</font></td>
            </tr>
        </table>
        <G:ListTable ID="list" Rows="20" IsProPage="true" runat="server">
            <G:Template id="listtemphead" type="head" runat="server">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
                    <tr class="tr_listtitle">
                        <td>
                            &nbsp;</td>
                        <td width="25%" align="left">
                            字段标题</td>
                        <td width="25%" align="left">
                            字段名称</td>
                        <td width="15%" align="left">
                            字段类型</td>
                        <td width="15%" align="left">
                            所属模块</td>
                        <td width="10%" align="left">
                            状态</td>
                        <td width="10%" align="center">
                            操作</td>
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
            <G:NavStyle5 ID="NavStyle" PageUrl="edit_field.aspx" runat="server">
            </G:NavStyle5>
        </G:ListTable>
    </form>
</body>
</html>
