<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
	<script runat="server" language="C#">
        int _rc;
        string iconid="";
        string _astr="�ò���������ݻ�����㣬ȷ��Ҫɾ����",tbname,_typekind;
        string aim = "/SpeedMap/Shell.aspx?com=IconSystem&mode=view&id=";
        string aimlist = "/SpeedMap/Shell.aspx?com=IconSystem&mode=list";	
        private void Page_Load(object sender, System.EventArgs e)
        {
            size = "16";//Ĭ��ͼ���С
            SetSESSION("speedmap", "0");
            SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����  
          

            dtable = "gmis_type";
			filter = " typecode="+id;
			flds = new string[]{"typename","typekind","typebrief","typelevel","typeuppercode","typeicon","typestate","typedesc","modulecode"};
			mflds = new string[]{"���ݲ���|typename","���|typebrief"};
			types = "000111001";
           
            SqlDB db = new SqlDB();
            DataTable dt;
            if (!IsPostBack)
            {
                BindListControl(ModuleCode,"modulecode","modulename","select modulecode,(replicate('��',modulelevel-2)+modulename) as modulename from gmis_module where ((moduleindex like '%'+(select moduleindex from gmis_module where modulecode =40 )+'%' and modulecode<>40  and modulecode not in (select modulecode from gmis_module where moduleindex like '%'+(select moduleindex from gmis_module where modulecode=1188)+'%')) or  (moduleindex like '%'+(select moduleindex from gmis_module where modulecode =38 )+'%' and modulecode<>38 ) or modulecode=1196 ) and modulestate=0 order by moduleindex");
              
                BindListControl(typelevel, "level", "leveltxt", "select distinct typelevel as level,'�� '+cast(typelevel as varchar(10))+' ��' as leveltxt from "+dtable+"");
        
                if (typelevel.Items.Count == 0)
                {
                    typelevel.Items.Add(new ListItem("�� 1 ��", "1"));
                }else
                {
			         typelevel.Items.Add(new ListItem("�� "+(typelevel.Items.Count+1)+" ��", (typelevel.Items.Count+1).ToString()));
                }
              
            //�Ȱ��б�	
                if (id != "0")
                {
                    //������ֵ
                    guangye.BindData(dtable, filter, flds);
                    db.SqlString="select Iconsize from gmis_Icon where IconCode="+typeicon.Value;			
					dt=db.GetDataTable();			
					if (dt.Rows.Count>0){						
					   iconsize.Value=dt.Rows[0]["Iconsize"].ToString();
					   size=iconsize.Value;
					}				
                   
                }
                else
                {
                    tb_7.Visible=false;		
				}
				
				if (typelevel.SelectedItem != null && typelevel.SelectedItem.Value != "1")
                {
                    BindListControl(typeuppercodetxt, "uppercode", "uppertxt", "select typecode as uppercode,typename as uppertxt from " + dtable + " where typelevel="+(Convert.ToInt32(typelevel.SelectedItem.Value)-1)+"");
                }
                SetFilter(typeuppercodetxt,typeuppercode.Value);

            }
            
            if (typeicon.Value != "") iconid = typeicon.Value;
            if (typekind.SelectedItem!=null && typekind.SelectedValue == "���ݵ�")
            {
                tr_inputicon.Visible = true;
            }
            else
            {
                tr_inputicon.Visible = false;
            }
            //ͼ��	
            aim += iconid + "&size=" + size;
            aimlist += "&size=" + size;
        }
        //ѡ��㼶
        private void Level_Change(object sender, System.EventArgs e)
        {
            typeuppercodetxt.Items.Clear();
            if (typelevel.SelectedItem != null && typelevel.SelectedItem.Value != "1")
            {
                BindListControl(typeuppercodetxt, "uppercode", "uppertxt", "select typecode as uppercode,typename as uppertxt from " + dtable + " where typelevel=" + (Convert.ToInt32(typelevel.SelectedItem.Value) - 1) + " and typecode<>"+id);
            }
			 
        }
        
        public override void BeforeSave()
        {
            typename.Value = typename.Value.Trim().Replace("<", "").Replace(">", "").Replace("'", "");
            typebrief.Value = typebrief.Value.Trim().Replace("<", "").Replace(">", "").Replace("'", "");
            if (typebrief.Value.Trim().Length == 0)
            {
                typebrief.Value = typename.Value;
            }
            if (coverico.Checked)
            {
                SqlDB dbIco = new SqlDB();
                dbIco.SqlString = "select typeindex from gmis_type where typecode=" + id;
                DataTable dtIco = dbIco.GetDataTable();
                if (dtIco.Rows.Count > 0)
                {
                    SetSESSION("extsql", " UPDATE gmis_type set typeicon = " + typeicon.Value + " where typeindex like '%" + dtIco.Rows[0]["typeindex"].ToString() + "%'");
                }
            }
            else
            {
                SetSESSION("extsql", "");
            }
            if (typelevel.SelectedItem != null && typelevel.SelectedValue != "1" && typeuppercodetxt.SelectedItem == null)
            {
                SetSESSION("alert", "ֱ���ϼ�����Ϊ�գ�");	
            }
            
            typeuppercode.Value = (typeuppercodetxt.SelectedItem != null) ? typeuppercodetxt.SelectedItem.Value : "0";
          
           
            
            /*
            if(id == "0")
	        {
                if (typeuppercode.SelectedItem != null && typeuppercode.SelectedItem.Value != "0")
                {
                    SqlDB DBsql=new SqlDB();
                    DBsql.SqlString = "select count(*)+1 from gmis_type where typeuppercode=" + typeuppercode.SelectedItem.Value;
                    DataTable DBdt = DBsql.GetDataTable();
                    string P_TypeUpperCodeIndex = GetFieldData("select typeindex from gmis_type where typecode=" + typeuppercode.SelectedItem.Value);
                    if (DBdt.Rows.Count > 0)
                    {
                        typeindex.Value = P_TypeUpperCodeIndex + DBdt.Rows[0][0].ToString().PadLeft(3,'0');
                    }
                    
                }
                else
                {
                    SqlDB DBsql=new SqlDB();
                    DBsql.SqlString = "select count(typelevel) from gmis_type where typelevel=0";
                        typeindex.Value = DBsql.GetDataTable().Rows[0][0].ToString()+".";
                }
	        }
	        */
        }
        //����/����
private void Click_ChangeIndex(object sender, System.EventArgs e)
{
    string idstr = ((Control)sender).ID;
    alertmess.InnerText = ChangeOneTypeIndex(idstr,dtable,"typecode","typeindex","typeposition","typeuppercode");
}
	</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<td id="tb_6" visible="false" runat="server" style="padding-left: 5px;"
            nowrap>
            <G:Button ID="btn_up" Type="toolbar" Mode="on" Text="����" OnClick="Click_ChangeIndex"
                runat="server">
            </G:Button>
        </td>
        <td id="tb_7" visible="false" runat="server" style="padding-left: 5px;"
            nowrap>
            <G:Button ID="btn_down" Type="toolbar" Mode="on" Text="����" OnClick="Click_ChangeIndex"
                runat="server">
            </G:Button>
        </td>
			</td>
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--����-->

<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr> 
        <td align="right"  class="td_viewcontent_title">���ݲ�����</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="typename" type="text" style="width:95%" maxlength="200" runat="server"></td>
    </tr>
    <tr> 
        <td align="right"  class="td_viewcontent_title">���</td>
        <td class="td_viewcontent_content"><asp:DropDownList id="typekind" style="width:250px" AutoPostBack="true" runat="server">
        <asp:ListItem Value="���ݵ�">���ݵ�</asp:ListItem>
        <asp:ListItem Value="ͼ��">ͼ��</asp:ListItem>
        <asp:ListItem Value="��·">��·</asp:ListItem>
        </asp:DropDownList>
          
        </td>
        <td align="right"  class="td_viewcontent_title">��ƣ�</td>
        <td class="td_viewcontent_content">
        <input id="typebrief" type="text" style="width:250px" title="��ͼ����ʾ���" maxlength="12" runat="server"></td>
    </tr>
    <tr> 
        <td align="right"  class="td_viewcontent_title">�㼶��</td>
        <td class="td_viewcontent_content">
		<asp:DropDownList id="typelevel" style="width:250px" autopostback="true" OnSelectedIndexChanged="Level_Change" runat="server"/></td>
        <td align="right"  class="td_viewcontent_title">�ϼ��㣺</td>
        <td class="td_viewcontent_content">
		<input id="typeuppercode" type="hidden" runat="server">
		<asp:DropDownList id="typeuppercodetxt" style="width:95%;"  runat="server" />
		</td>
    </tr>
    <tr>
      <td align="right"  class="td_viewcontent_title">��չģ�飺</td>
        <td class="td_viewcontent_content" colspan="3">
        <asp:DropDownList ID="ModuleCode" Width="95%" runat="server"></asp:DropDownList>
        </td>
    </tr>
    
    <tr> 
      
        <td align="right"  class="td_viewcontent_title">״̬��</td>
        <td class="td_viewcontent_content" colspan="3" >
        <select id="typestate" style="width:250px" runat="server">
            <option>����</option>
            <option>����</option>
            <option>����</option>
        </select>       
        </td>
    </tr>
	<!-- new tr -->
	<tr id="tr_inputicon" visible="false" runat="server">
		<td align="right"  class="td_viewcontent_title">ͼ�꣺</td>
        <td class="td_viewcontent_content" colspan="3">      
			<table border=0 width="96%" cellspacing="1" cellpadding="0" height="35">
				<tr>
					<td width="80px;" nowrap>
						<input id="typeicon" name="typeicon" runat="server" type="hidden"  style="width:30px;" />
						<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" style="WIDTH:16px;HEIGHT:16px;" codebase="Player/swflash.cab#version=7,0,0,0" WIDTH="16" HEIGHT="16" id="IconView" ALIGN="" VIEWASTEXT>
								<PARAM NAME=movie VALUE="<%=aim%>"> 
								<PARAM NAME=quality VALUE=high>
								<PARAM NAME=bgcolor VALUE=#EEEEEE> 
								<PARAM NAME=wmode VALUE=transparent> 
								<EMBED src="<%=aim%>" WIDTH="16" HEIGHT="16" NAME="IconView" bgcolor=#EEEEEE TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
						</OBJECT>    
					</td>  
					<td style="width:80px;" nowrap> 
						<img src="images/select.gif" style="cursor:hand;padding:2px"  onmouseover="ShowSubMenu('ListIcon',this);" border=0 >
						<div id="ListIcon" onmouseout="HideMeMenu(this);" onmouseover="ShowMeMenu(this);" style="display:none;position: absolute;left:350px; top:395px; width: 220; height:80px;cursor:hand;overflow:auto;background-color:#ffffff;border-style:solid; border-width:1px;border-color:#8C9DBE; " >
						<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" style="WIDTH:200px;HEIGHT:60px;position:absolute;LEFT:0px;TOP:0px;Z-INDEX:1;" codebase="Player/swflash.cab#version=7,0,0,0" WIDTH="200" HEIGHT="60" id="IconList" ALIGN="" VIEWASTEXT>
							<PARAM NAME=movie VALUE="<%=aimlist%>"> 
							<PARAM NAME=quality VALUE=high> 
							<PARAM NAME=bgcolor VALUE=#FFFFFF> 
							<EMBED src="<%=aimlist%>"  WIDTH="200" HEIGHT="60" NAME="IconList" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
						</OBJECT>
						<input id="icondata" type="hidden" runat="server">
						</div>
					</td>
					<td width="200" nowrap><asp:CheckBox id="coverico" text="ͬʱ������ͼ��ͼ��"  runat="server"/></td>
					<td style="width:50px;" nowrap>
						<select id="iconsize" style="width:40px" onchange="Updatesize(typeicon.value,iconsize.value)"  runat="server">
							<option>16</option>
							<option>32</option>     
						</select>
					</td>
					<td width="100%">&nbsp;</td>
				</tr>
			</table>
		
		</td>
	</tr>
	<!-- end tr -->
    <tr> 
        <td align="right"  class="td_viewcontent_title">��ע��</td>
        <td class="td_viewcontent_content" colspan="3">
        <textarea id="typedesc" rows="4" style="width:95%" runat="server"></textarea></td>
    </tr>
</table>							
</form>
<script language="javascript">
<!--
function IconView_DoFSCommand(command, args){
	if(command == "resize"){		
		var _s = args.split("|");
		//alert(_s);
		if(_s[0] != "" && _s[0] != "0"){			
			window.document.IconView.style.width = parseInt(_s[0]);
		}
		if(_s[1] != "" && _s[1] != "0"){			
			window.document.IconView.style.height = parseInt(_s[1]);
		}
	}else{
		//alert(command+":"+args);
	}
}

function IconList_DoFSCommand(command, args){
	if(command == "getid"){
		window.document.form1.typeicon.value=args;	
		var _size=window.document.form1.iconsize.value;	
		this.document.IconView.LoadMovie(0,"/SpeedMap/Shell.aspx?com=IconSystem&mode=view&id="+args+"&size="+_size+"");			
	}else if(command == "resize"){
		var _s = args.split("|");				
		if(_s[0] != "" && _s[0] != "0"){
			document.all.item("ListIcon").style.width = parseInt(_s[0])+10;
			window.document.IconList.style.width = parseInt(_s[0]);
		}
		if(_s[1] != "" && _s[1] != "0"){
			document.all.item("ListIcon").style.height = parseInt(_s[1])+10;
			window.document.IconList.style.height = parseInt(_s[1]);
		}
	}else{
		//alert(command+":"+args);
	}
}

function Updatesize(iconid,size){
window.document.IconList.LoadMovie(0,"/SpeedMap/Shell.aspx?com=IconSystem&mode=list&size="+size+"");
if(iconid!="0" ){
	window.document.IconView.style.width=size;
	window.document.IconView.style.height=size;
}
}
//-->
</script>
<SCRIPT LANGUAGE="VBScript">
Sub IconView_FSCommand(ByVal cmd, ByVal args)
	call IconView_DoFSCommand(cmd, args)
end sub

Sub IconList_FSCommand(ByVal cmd, ByVal args)
	call IconList_DoFSCommand(cmd, args)
end sub
</SCRIPT>
</body>
<script>
function ShowSubMenu(eventTarget,obj)
{
	var t=obj.offsetTop;
    var l=obj.offsetLeft;
    while(obj=obj.offsetParent){
        t+=obj.offsetTop;
        l+=obj.offsetLeft;
    }
	
	var mn = document.all.item(eventTarget);
	mn.style.display = "block";	
	mn.style.left=l;
	mn.style.top=t;
	//document.getElementById("ListIcon").style.left=l;

	
}
function HideSubMenu(eventTarget)
{
	
	var mn = document.all.item(eventTarget);
	mn.style.display = "none";	
}
function ShowMeMenu(eventTarget)
{
	
	var mn = eventTarget;
	mn.style.display = "block";	
}
function HideMeMenu(eventTarget)
{
	
	var mn = eventTarget;
	mn.style.display = "none";	
}

</script>
</html>
