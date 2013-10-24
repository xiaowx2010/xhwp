<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
	<script runat="server" language="C#">
		DataTable gdt;
        private void Page_Load(object sender, System.EventArgs e)
        {
            SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
            if (!IsPostBack)
            {
                BindListControl(selectuserdept, "deptcode", "deptname", "select deptcode,deptname from gmis_dept order by deptname", "���в���");
                if (GetSESSION("filter") == "")
                {
                    if(selectuserdept.SelectedItem != null)
                        SetSESSION("filter","0");
                }
                else
                {
                    SetFilter(selectuserdept, GetSESSION("filter"));
                }
            }
            string h_fstr = "";
            if (selectuserdept.SelectedItem != null &&  selectuserdept.SelectedItem.Value != "0")
                h_fstr += " and gmis_user.deptcode=" + selectuserdept.SelectedItem.Value;
			
            
			db.SqlString="select usergroupcode,usergroupname from gmis_usergroup";
			gdt=db.GetDataTable();
			
			list.Rows = GetListRows();
            list.SqlStr = GetListSQL(Convert.ToInt32(navindex) * list.Rows, list.Rows,h_fstr);
           
        }
        private string GetListSQL(int fromcount,int pagerows,string fstr)
        {
            return "declare @allcount int;select @allcount=count(1) from gmis_user where 1=1 "+fstr+";select @allcount as allcount,'" + StringUtility.StringToBase64("view") + "'," + mid + ",usercode," + navindex + ",username,g.deptname,'' as usergroupname,userstate,'&nbsp;' as btnstr,usergroupcode from gmis_user  Left Outer Join gmis_dept g on gmis_user.deptcode=g.deptcode where usercode not in (select top " + fromcount + " usercode from gmis_user where 1=1 "+fstr+" order by username) and usercode in (select top " + (fromcount+pagerows) + " usercode from gmis_user where 1=1 "+fstr+" order by username) "+fstr+" order by username";
        }
        public override void BeforeOutput(DataTable dt, int rowi)
        {	
            //����ǰҳ����
            DataRow dr = dt.Rows[rowi];
            if(dr["usergroupcode"].ToString().Trim(',').Length>0)
			{
				DataRow[] drs=gdt.Select("usergroupcode in ("+dr["usergroupcode"].ToString().Trim(',')+")"); 
				string h_name="";
				foreach(DataRow idr in drs)
				{
					h_name+=idr["usergroupname"].ToString()+",";
				}
				dr["usergroupname"]=h_name.Trim(',');
			}
			dr["deptname"]=(dr["deptname"].ToString()=="")?"&nbsp;":dr["deptname"].ToString();
            if (mua.IndexOf(";3;") != -1)
            {
                dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["usercode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"�༭\" align=\"absmiddle\" border=\"0\"></a>";
            }

            if (mua.IndexOf(";4;") != -1)
            {
                dr["btnstr"] += "<a href=\"javascript:if(confirm('ȷ��ɾ����')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["usercode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"ɾ��\" align=\"absmiddle\" border=\"0\"></a>";
            }

        }
        private void Filter_Change(object sender, System.EventArgs e)
        {
            if (selectuserdept.SelectedItem != null)
            {
                SetSESSION("filter", selectuserdept.SelectedItem.Value);
				Response.Redirect("list_user.aspx?mid="+mid+"");
             }
        }
	</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<td style="padding-left:5px;">
				<table  border="0" cellspacing="0" cellpadding="0" ID="Table1" align=left>
				<tr>
					<td class="font_blackcolor_B" nowrap>���ţ�</td>
					<td >
						<asp:DropDownList id="selectuserdept" autopostback="true" OnSelectedIndexChanged="Filter_Change" style="width:100px" runat="server"/>
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
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
    <tr class="tr_listtitle">
        <td>&nbsp;</td>
		<td width="25%" align="left">�û���</td>
		<td width="15%" align="left">����</td>
		<td width="30%" align="left">������ɫ</td>		
		<td width="10%" align="left">״̬</td>	
		<td width="8%" align="center">����</td>
    </tr>
</G:Template>
<G:Template id="listtemp1" runat="server">
    <tr class="tr_listcontent">
        <td>&nbsp;</td>
        <td align="left"><a href="view_user.aspx?aid=*&mid=*&id=*&navindex=*" title="�鿴��ϸ">*</a></td>
        <td align="left">*</td>
        <td align="left">*</td>
        <td align="left">*</td>        
        <td align="center">*</td>
    </tr>
</G:Template>
<G:Template id="listtemp2" runat="server">
    <tr  class="tr_listcontent">
		<td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>      
    </tr> 
 </G:Template>
<G:NavStyle5 ID="NavStyle" PageUrl="list_user.aspx" runat="server"></G:NavStyle5>
</G:ListTable>
</form>
</body>
</html>
