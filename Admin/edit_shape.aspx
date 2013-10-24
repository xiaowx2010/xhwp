<!--ͼ������,�༭ҳ-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{     
	mid = GetQueryString("mid","0");
	tid = GetQueryString("tid","0");
	id = GetQueryString("id","0");
	
	SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����	
	
	dtable = "gmis_Feature";
	filter = "Featurecode="+id;
	flds = new string[]{"Featurename","Featurebrief","typecode","areacode","Featuremode","Featurex","Featurey","Featuredata","Featuredepth","Featurestate","Featuredesc","FeatureKind"};
	mflds = new string[]{"ͼ����|Featurename","���|Featurebrief"};
	types = "001111101001";
	if (!IsPostBack)
	{
		//�Ȱ��б�
		BindListControl(typecode,"typecode","typename","select typecode,typename from gmis_type where typekind='ͼ��' order by typeindex");
		BindListControl(areacode,"areacode","areaname","select areacode,areaname from gmis_area where areastate='����' order by areaindex","������");

        dstr1.Value = "ff0000";
		if(id != "0")
		{
			//������ֵ
			guangye.BindData(dtable,filter,flds);
			tmpdepth.Value=Featuredepth.Value;
			if(Featuredata.Value != "")
			{
				string[] color = Featuredata.Value.ToString().Trim('|').Split('|');                
				if(color.Length > 0 )
				{
					string[] _color = color[0].ToString().Trim(',').Split(',');
					if(_color.Length > 0)
					{
						dstr1.Value = _color[1].ToString();//��ɫ�ؼ��ı�����ֵ
                        dstr1.Attributes["style"] = "background-color:" + _color[1].ToString();
					}
				}
			}
			
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
	if(id == "0" && Featurename.Value.Trim() != "")
	{
		SqlDB db = new SqlDB();
		db.SqlString = "select * from gmis_Feature where Featurename='"+Featurename.Value.Trim()+"'";
		if(db.GetDataTable().Rows.Count>0)
		{
			Session["alert"] = "��������ͼ�Σ�";
			Response.Redirect("execommand.aspx?mid="+mid+"&pid="+pid+"&id="+id);
		}
	}
    if (Featuredata.Value.Trim() != "" && dstr1.Value != ""&& Featuredata.Value.IndexOf('|') > 0)//��ID
    {
        Featuredata.Value = "," + dstr1.Value + "," + dstr1.Value + Featuredata.Value.Substring(Featuredata.Value.IndexOf('|'));//�滻Featuredata����ɫ
    }
    else//����
    {
		Featuredata.Value = "," + dstr1.Value + "," + dstr1.Value + '|';
	}
}
</script>
<script>
function GetData(args)
{	
	if(args.length >0)
	{
		if(window.document.form1.Featuredata != null)
		{			
			window.document.form1.Featuredata.value=args;
		}
		
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
        <td class="td_viewcontent_title" align="right">ͼ������</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="Featurename" type="text" style="width:95%" maxlength="200" runat="server"></td>
		<input id="FeatureKind" Value="2" type="hidden" runat="server">
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">״̬��</td>
        <td class="td_viewcontent_content">
        <select id="Featurestate" style="width:250px" runat="server">
			<option value="0">����</option>
            <option value="-1">����</option>
            <option value="1">����</option>
        </select></td>        
        <td class="td_viewcontent_title" align="right">��ƣ�</td>
        <td class="td_viewcontent_content">
        <input id="Featurebrief" type="text" style="width:250px" title="��ͼ����ʾ���" maxlength="12" runat="server"></td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">���ݣ�</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="Featuredata" type="hidden" runat="server">
        <input id="Featurex" type="hidden" runat="server">
        <input id="Featurey" type="hidden" runat="server">
        <table><tr><td>
		<input id="dataface" type="password" style="width:200px" title="��ӵ�ͼ��ȡ����" value="1111111111111111111111111111" readonly="true">
        </td><td >&nbsp;��ȣ�</td><td >
        <input id="tmpdepth" type="hidden" value="0" runat="server">
		<input id="Featuredepth" type="text" style="width:60px" value="0" onmousedown="this.value=''" onmouseout="if(this.value=='') {this.value=tmpdepth.value}"  title="ֻ����������"  runat="server">
        </td><td>&nbsp;<a href="javascript:__doOpenMap('2',<%=id%>+'|'+form1.FeatureKind.value+'|'+form1.typecode.value)"><img src="images/getdata_.gif" border="0"></a>
        </td></tr></table>
        </td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">�����㣺</td>
        <td class="td_viewcontent_content">
		<asp:DropDownList id="typecode" style="width:250px" runat="server"/></td>
        <td class="td_viewcontent_title" align="right">ģʽ��</td>
        <td class="td_viewcontent_content">
        <select id="Featuremode" style="width:250px" runat="server">
            <option value="1">����ģʽ</option>
            <option value="2">��ͼģʽ</option>
            <option value="3">��λģʽ</option>
        </select>
        </td>
    </tr>
     <tr > 
        <td class="td_viewcontent_title" align="right">��������</td>
        <td class="td_viewcontent_content">
		<asp:DropDownList id="areacode" style="width:250px" runat="server"/></td>
        <td class="td_viewcontent_title" align="right">ѡ����ɫ��</td>
        <td class="td_viewcontent_content"><input id="dstr1" type="text" readonly="true" style="width:165px;" runat="server"><div id="div_color" style="position:absolute;"></div></td>
    </tr>   
<script language="javascript">
<!--
	var cp1 = CreateColorControl( "div_color","colorpicker1","1",1,"<%=dstr1.Value.ToString().Replace("#","0x")%>");

	function colorpicker1_DoFSCommand(command, args)
	{
		if(command == "showcontrol")
		{
			showControl(cp1,args);
		}
		else if(command == "value")
		{
			//���յ�ѡ�����ɫֵ
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
