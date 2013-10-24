<!--��λ����,�༭ҳ-->
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
    SetToolBar();//���ù�����,ͬʱ��ȡ�̶�URL����
     
    mid = GetQueryString("mid", "0");
    id = GetQueryString("id", "0");

    if (!IsPostBack)
    {
        if (id != "0")
        {
        }
    }   

	dtable = "gmis_Feature";
	filter = "Featurecode="+id;
	flds = new string[]{"Featurename","Featurebrief","typecode","areacode","Featurex","Featurey","Featuredepth","Featurestate","textlocation","Featuredesc","groupcode","Featurelink","FeatureKind"};
	mflds = new string[]{"���ݵ���|Featurename","���|Featurebrief"};
	types = "0011111010001";
	SqlDB db = new SqlDB();
	if (!IsPostBack) 
	{
		//�Ȱ��б�				
		BindListControl(typecode,"typecode","typename","select typecode,typename from gmis_type where typekind='���ݵ�' order by typeindex");	
		BindListControl(areacode,"areacode","areaname","select areacode,areaname from gmis_area where AreaState='����'  order by areaposition asc","������");
		SetFilter(areacode,"0");								
		if(id != "0")
		{
			//������ֵ
			guangye.BindData(dtable,filter,flds);
			tmpdepth.Value=Featuredepth.Value;
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
}
</script>

<script >


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
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->
<!--��̬����html,��ʼ-->
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr> 
        <td class="td_viewcontent_title"  align="right">���ݵ�����</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="Featurename" type="text" style="width:95%" runat="server"></td>
		<input id="FeatureKind" Value="1" type="hidden" runat="server">
    </tr>
    <tr>         
		<td class="td_viewcontent_title"  align="right">״̬��</td>
        <td class="td_viewcontent_content"><select id="Featurestate" style="width:250px" runat="server">
            <option value="0">����</option>
            <option value="-1">����</option>
            <option value="1">����</option>
        </select>
        </td>
        <td  class="td_viewcontent_title"  align="right">��ƣ�</td>        
        <td  class="td_viewcontent_content">
        <input id="Featurebrief" type="text" style="width:250px" title="��ͼ����ʾ���" maxlength="12" runat="server"></td>
    </tr>
    <tr> 
        <td  class="td_viewcontent_title"  align="right">���ݣ�</td>
        <td  class="td_viewcontent_content" colspan="3">
        <input id="Featurex" type="hidden" runat="server">
        <input id="Featurey" type="hidden" runat="server">
        <table><tr><td>
		<input id="dataface" type="password" style="width:200px" title="��ӵ�ͼ��ȡ����" value="1111111111111111111111111111" readonly="true">
        </td><td>&nbsp;��ȣ�</td><td>
		 <input id="tmpdepth" type="hidden" value="0" runat="server">
		<input id="Featuredepth" type="text" style="width:60px" value="0" onmousedown="this.value=''" onmouseout="if(this.value=='') {this.value=tmpdepth.value}"  title="ֻ����������"  runat="server">
        </td><td>&nbsp;<a href="javascript:__doOpenMap('1',<%=id%>+'|'+form1.FeatureKind.value+'|'+form1.typecode.value)"><img src="images/getdata_.gif" border="0"></a>
        </td></tr></table>
        </td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title"  align="right">�����㣺</td>
        <td class="td_viewcontent_content"><asp:DropDownList id="typecode"  style="width:250px" runat="server"/></td>
        <td class="td_viewcontent_title"  align="right">����</td>
        <td class="td_viewcontent_content"><asp:DropDownList id="areacode" style="width:250px" runat="server"/></td>
    </tr>
    <tr>         
		<td class="td_viewcontent_title"  align="right">��ǩλ�ã�</td>
        <td class="td_viewcontent_content"><select id="textlocation" style="width:250px" runat="server">
			<option value="0" selected> ���·� </option>
			<option value="2"> ���ҷ� </option>
			<option value="6"> ���� </option>
			<option value="4"> ���Ϸ� </option>
			<option value="1"> ���·� </option>
			<option value="3"> ���Ϸ� </option>
			<option value="7"> ���·� </option>
			<option value="5"> ���Ϸ� </option>
        </select>
        </td>
        <td class="td_viewcontent_title"  align="right" >&nbsp;</td>        
        <td class="td_viewcontent_content" >&nbsp;<asp:DropDownList id="groupcode" style="width:250px" runat="server" visible=false/></td>
    </tr>    
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
