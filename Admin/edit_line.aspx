<!--��·����,�༭ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
string p_color = "";
private void Page_Load(object sender, System.EventArgs e)
{    
	mid = GetQueryString("mid","0");
	tid = GetQueryString("tid","0");
	id = GetQueryString("id","0");
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����    

    
    dtable = "gmis_Feature";
    filter = "Featurecode=" + id;
    flds = new string[] { "Featurename", "Featurebrief", "typecode", "Featuremode", "Featurex", "Featurey", "Featuredata", "Featuredepth", "Featurestate", "Featuredesc", "FeatureKind" };
    mflds = new string[] { "��·��|Featurename", "���|Featurebrief" };
    types = "00111101001";
    
	if (!IsPostBack) 
	{
		//�Ȱ��б�
		BindListControl(typecode,"typecode","typename","select typecode,typename from gmis_type where typekind='��·'");	
		dstr1.Value = "ff0000";
		if(id != "0")
		{
			//������ֵ
			guangye.BindData(dtable,filter,flds);
			tmpdepth.Value=Featuredepth.Value;
			string FWidth="1";
			if(Featuredata.Value.Length>0)
			{
				FWidth=Featuredata.Value.Substring(0,1);
				string[] color = Featuredata.Value.ToString().Trim('|').Split('|');
				if(color.Length > 0 )
				{
					string[] _color = color[0].ToString().Trim(',').Split(',');
					if(_color.Length > 1)
					{
						dstr1.Value = _color[1].ToString();
						dstr1.Attributes["style"] = "background-color:" + _color[1].ToString();
					}
				}
			}
			SetFilter(Featurewidth,FWidth.ToString());//���߿�
		}
	}
}
	public override void BeforeSave()
	{	
		Featurename.Value=Featurename.Value.Trim().Replace("<","").Replace(">","").Replace("'","");
		Featurebrief.Value=Featurebrief.Value.Trim().Replace("<","").Replace(">","").Replace("'","");		
		if(Featurebrief.Value.Trim().Length == 0)
		{
			Featurebrief.Value = Featurename.Value.Trim();
		}
		if(Featuredata.Value.Trim() != "" && dstr1.Value.Trim() != "" && Featuredata.Value.IndexOf('|') > 0)//��ID
		{
			Featuredata.Value = Featurewidth.SelectedItem.Value + "," + dstr1.Value + "," + dstr1.Value + Featuredata.Value.Substring(Featuredata.Value.IndexOf('|'));
		}
		else//����
		{
			Featuredata.Value = Featurewidth.SelectedItem.Value + "," + dstr1.Value + "," + dstr1.Value + '|';
		}
		if(id == "0" && Featurename.Value.Trim() != "")
		{
			SqlDB db = new SqlDB();
			db.SqlString = "select * from gmis_Feature where Featurename='"+Featurename.Value.Trim()+"'";
			if(db.GetDataTable().Rows.Count>0)
			{
				Session["alert"] = "����������·��";
				Response.Redirect("execommand.aspx?mid="+mid+"&pid="+pid+"&id="+id);
			}
		}
	}
</script>
<script>
function GetData(args)
{		
	var arrstr = args.toString().split("&");
	if(window.document.form1.Featuredata != null)
	{			
		window.document.form1.Featuredata.value=arrstr[1];
		window.document.form1.Featuredepth.value=arrstr[0];
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
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr> 
        <td  class="td_viewcontent_title"  align="right">��·����</td>
        <td  class="td_viewcontent_content" colspan="3">
        <input id="Featurename" type="text" style="width:95%"  runat="server"></td>
		<input id="FeatureKind" Value="3" type="hidden" runat="server">
    </tr>
    <tr> 
        <td class="td_viewcontent_title"  align="right">״̬��</td>
        <td class="td_viewcontent_content">
        <select id="Featurestate" style="width:250px" runat="server">
            <option value="0">����</option>
            <option value="-1">����</option>
            <option value="1">����</option>
        </select></td>        
        <td  class="td_viewcontent_title"  align="right">��ƣ�</td>
        <td  class="td_viewcontent_content">
        <input id="Featurebrief" type="text" style="width:250px" title="��ͼ����ʾ���" maxlength="12" runat="server"></td>
    </tr>
    <tr> 
        <td  class="td_viewcontent_title"  align="right">���ݣ�</td>
        <td  class="td_viewcontent_content" colspan="3">
        <input id="Featuredata" type="hidden" runat="server">
        <input id="Featurex" type="hidden" runat="server">
        <input id="Featurey" type="hidden" runat="server">
        <table><tr><td>
		<input id="dataface" type="password" style="width:200px" title="��ӵ�ͼ��ȡ����" value="1111111111111111111111111111" readonly="true">
        </td><td >&nbsp;��ȣ�</td><td >
		<input id="tmpdepth" type="hidden" value="0" runat="server">
		<input id="Featuredepth" type="text" style="width:60px" value="0" onmousedown="this.value=''" onmouseout="if(this.value=='') {this.value=tmpdepth.value}"  title="ֻ����������"  runat="server">
        </td><td>&nbsp;<a href="javascript:__doOpenMap('3',<%=id%>+'|'+form1.FeatureKind.value+'|'+form1.typecode.value)"><img src="images/getdata_.gif" border="0"></a>
       </td></tr></table>
        </td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title"  align="right">�����㣺</td>
        <td class="td_viewcontent_content">
		<asp:DropDownList id="typecode" style="width:250px" runat="server"/></td>
        <td class="td_viewcontent_title"  align="right">ģʽ��</td>
        <td class="td_viewcontent_content">
        <select id="Featuremode" style="width:250px" runat="server">
            <option value="1">����ģʽ</option>
            <option value="2">��ͼģʽ</option>
            <option value="3">��λģʽ</option>
        </select>
        </td>
    </tr>
    <tr>
    <td class="td_viewcontent_title"  align="right">�߿�</td>
    <td class="td_viewcontent_content" >
         <asp:DropDownList id="Featurewidth" style="width:50px" runat="server">
             <asp:ListItem>1</asp:ListItem>
             <asp:ListItem>2</asp:ListItem>
             <asp:ListItem>3</asp:ListItem>
             <asp:ListItem>4</asp:ListItem>
             <asp:ListItem>5</asp:ListItem>             
        </asp:DropDownList>
      </td>
      <td class="td_viewcontent_title" >ѡ����ɫ��</td>
		<td class="td_viewcontent_content" ><input id="dstr1" type="text" readonly="true" style="width:165px" runat="server"><div id="div_color" style="position:absolute;"></div></td>
    </tr>
    <script language="javascript">
<!--
	var cp1 = CreateColorControl( "div_color","colorpicker1","1",1,"<%=dstr1.Value.Replace("#","0x")%>");

	function colorpicker1_DoFSCommand(command, args)
	{
		if(command == "showcontrol")
		{
			showControl(cp1,args);
		}
		else if(command == "value")
		{//���յ�ѡ�����ɫֵ
			document.getElementById("dstr1").value = args;
			document.getElementById("dstr1").style.backgroundColor = args;
			closeControl(cp1);
		}
	}
//-->
</script>
<SCRIPT LANGUAGE="VBScript">
Sub colorpicker1_FSCommand(ByVal cmd, ByVal args)
 call colorpicker1_DoFSCommand(cmd, args)
end sub
</SCRIPT>
<tr>
	<td class="td_viewcontent_title" align="right" valign="top" align="right">���ܣ�</td>
	<td class="td_viewcontent_content" colspan="3" align="right">
    <G:Editor id="Featuredesc" height="300"  BasePath="Common/Editor/" runat="server"/>
    </td>
</tr>
</table>
<!--��̬����html,����-->
</form>
</body>
</html>
