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
    mid = GetQueryString("mid", "0");
	string field1 = Request.QueryString.Get("field1");
	string field2 = Request.QueryString.Get("field2");
	fld_1232_4.Value = field1;
	fld_1232_7.Value = field2;

    list.SqlStr = "select fieldname,fieldname,caption,fieldname,fieldname from gmis_field where isvital=0 and fieldstatus=0 and modulecode="+mid+" order by fieldindex";
	list.Rows = list.DataTable.Rows.Count;

	Page.RegisterStartupScript("","<s"+"cript> BindList();</s"+"cript>");

}

    
</script>
<script>
/***************************************************************
��������BindList()
��;������ѡ�ֶ�
�����/����:������  2009-6-19
***************************************************************/
function BindList()
{
	
	if (opener.form1.fld_1232_4.value != "")
	{
		var args = opener.form1.fld_1232_4.value.split('|');
		if (args.length>0)
		{
			for (i=0;i<args.length;i++)
			{
				var arg = args[i].split(',');
				if (arg.length>1)
				{
					document.getElementById("check_"+arg[0]).checked = true;
					document.getElementById("txt_"+arg[0]).value = arg[1];
				}
			}			
		}
	}
	else
	{
		var items = window.document.all.tags("input");
		for(i=0;i<items.length;i++)
		{
			if(items[i].type == "text" && items[i].id.indexOf("txt_")==0)
			{
				items[i].value = "100";
			}
		}
	}

	document.all.iframe_1232.src = "iframe_1232.aspx?mid=<%=mid%>&field="+document.getElementById("fld_1232_7").value;
}

/***************************************************************
��������CheckValue()
��;���ж�����������Ч��
�����/����:������  2009-6-19
***************************************************************/
function CheckValue(me)
{
	if (document.getElementById("check_"+me).checked)
	{		
		if (isNaN(document.getElementById("txt_"+me).value))
		{
			document.getElementById("txt_"+me).value = "100";
			alert('����ֵ����Ϊ����!');
		}	
	}	
	else
	{
		document.getElementById("txt_"+me).value = "100";
	}
}

/***************************************************************
��������Click_OK()
��;�����ȷ��
�����/����:������  2009-6-19
***************************************************************/
function Click_OK()
{
	var backstr = "";
	var items = window.document.all.tags("input");
	for(i=0;i<items.length;i++)
	{
		if(items[i].type == "checkbox" && items[i].id.indexOf("check_")==0)
		{
			if (items[i].checked)
			{
				backstr += "|"+items[i].id.replace("check_","")+","+document.getElementById(items[i].id.replace("check_","txt_")).value;
			}
		}
	}
	document.getElementById("fld_1232_4").value = backstr.substring(1);
	opener.form1.fld_1232_7.value = document.getElementById("fld_1232_7").value ;
	opener.form1.fld_1232_4.value = backstr.substring(1);
	
}
/***************************************************************
��������ShowHead()
��;��Ԥ����ͷ
�����/����:������  2009-6-19
***************************************************************/
function ShowHead()
{		
	var backstr = "";
	var items = window.document.all.tags("input");
	for(i=0;i<items.length;i++)
	{
		if(items[i].type == "checkbox" && items[i].id.indexOf("check_")==0)
		{
			if (items[i].checked)
			{
				backstr += "|"+items[i].id.replace("check_","")+","+document.getElementById(items[i].id.replace("check_","txt_")).value;
			}
		}
	}
	document.getElementById("fld_1232_4").value = backstr.substring(1);
	
	window.open('pop_1232_2.aspx?field1='+document.getElementById("fld_1232_4").value+'&field2='+document.getElementById("fld_1232_7").value);	
}

</script>
<body style="width:400px;padding:10px;text-align:center;height:600px;overflow-y:auto">
<form id="form1" runat="server">
<!--ѡ�-->
<!--ѡ�-->
<!--��̬����html,��ʼ-->
<!--����������-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--�ұ߹̶���ť-->
			<!--#include file="toolbar.aspx"-->
			<!--�м���-->
			<td nowrap>
				<G:Button id="btn_hs" runat="server" icon="TB44" url="#hs" type="toolbar" mode="on" text="�������������"></G:Button>
			</td>
			<!--�м���-->
			<!--ȷ��-->
			<td nowrap style="padding-left:15px;">
				<G:Button id="btn_OK" runat="server" icon="TB11" url="javascript:Click_OK();window.close();" type="toolbar" mode="on" text="ȷ��"></G:Button>
			</td>
			<!--ȷ��-->
			<!--��ͷԤ��-->
            <td nowrap="nowrap" style="padding-left:15px;">
				<G:Button id="btn_showhead" runat="server" icon="TB47"  Url="javascript:ShowHead();"  type="toolbar" mode="on" text="��ͷԤ��"></G:Button>
			</td>
			<!--��ͷԤ��-->
			<!--�ұ߹̶���ť-->
	   <!--#include file="toolbarright.aspx"--> 
<!--����������-->

<!--��ʾ�ֶ�-->
<input id="fld_1232_4" runat="server" type="hidden" />
<input id="fld_1232_7" runat="server" type="hidden" />
<!--��ʾ�ֶ�-->

<G:ListTable ID="list" Rows="20"  IsProPage="true" runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline">
			<tr class="tr_listtitle">
				<td width="50%" align="left">�ֶ�����</td>
				<td width="50%" align="left">�п�����</td>
			</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td>
			<input type="checkbox" id="check_*" onclick="CheckValue('*')">
			*&nbsp;</td>
			<td>
			<input style="width:100px" id="txt_*" type="text" onkeyup="CheckValue('*')"></input> ����
			</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>	
</G:ListTable>
<a name = "hs"></a>
<iframe id="iframe_1232"  runat="server" frameborder="0"  width="100%" height="310" scrolling="no"></iframe>

</form>
</body>
</html>
