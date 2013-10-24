<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<!--#include file="func/func_1232.aspx"-->
<script language="c#" runat="server">
DataTable p_dt;
private void Page_Load(object sender, System.EventArgs e)
{
	mid = GetQueryString("mid", "0");
	string field = Request.QueryString.Get("field");


	fld_1232_7.Value = field;


	Page.RegisterStartupScript("","<s"+"cript> BindList();</s"+"cript>");
}
private string WriteGrid()
{
	StringBuilder h_sb = new StringBuilder();
	p_dt = db.GetDataTable(db.ConnStr,"select fieldname,caption from gmis_field where connectmodulecode=0 and fieldstatus=0 and isvital=0 and modulecode="+mid+" order by fieldindex");
	if (p_dt!=null && p_dt.Rows.Count>0)
	{
		h_sb.Append("<div style=\"height:92px;overflow-y:auto;\"><table width=\"100%\">\n");
		int i = 0;
		foreach (DataRow dr in p_dt.Rows)
		{
			if (i%5==0)
			{
				h_sb.Append("<tr>\n");
			}
			h_sb.Append("<td id=\"td_"+dr[0].ToString()+"\" onclick=\"AddField('"+dr[1].ToString()+"');\" style=\"cursor:hand\">"+dr[1].ToString()+"</td>\n");
			if ((i+1)%5==0)
			{
				h_sb.Append("</tr>\n");
			}
			i++;
		}
		h_sb.Append("</table>\n</div>\n");
	}
	else
	{
		h_sb.Append("<span style=\"color:red\"><b>没有可进行计算的字段！</b></span>");
	}

	return h_sb.ToString();
}

</script>
                    
<script language="javascript">
/***************************************************************
函数名：BindList()
用途：绑定已选字段
变更人/日期:孙振宇  2009-6-22
***************************************************************/
function BindList()
{
	
	if (document.getElementById("fld_1232_7").value != "")
	{
		var args = document.getElementById("fld_1232_7").value.split('|');
		if (args.length>0)
		{
			for (i=0;i<args.length;i++)
			{
				var arg = args[i].split(';');
				if (arg.length>2)
				{
					var oOption = document.createElement("option");
					document.getElementById("oSelect").options.add(oOption);
					oOption.innerText = arg[1];		
				}
			}			
		}
	}

}


function AddField(arg)
{
	document.getElementById("txt_put").value += "["+arg+"]";
}
function AddFunction(arg)
{
	document.getElementById("txt_put").value += arg;
}
function Add_Click()
{
	if (document.getElementById("columncaption").value == "")
	{
		alert('请输入一个列名！');
	}
	else if (document.getElementById("txt_put").value == "")
	{
		alert('请填写需要的计算方式！');
	}
	else
	{
		if (document.getElementById("fld_1232_7").value != "")
		{
			document.getElementById("fld_1232_7").value += "|";
		}		
		var oOption = document.createElement("option");
		document.getElementById("oSelect").options.add(oOption);
		oOption.innerText = document.getElementById("columncaption").value.replace("|","").replace(";","");		
		document.getElementById("fld_1232_7").value += document.getElementById("txt_put").value.replace("|","").replace(";","")+";"+document.getElementById("columncaption").value.replace("|","").replace(";","")+";200";
		document.getElementById("txt_put").value = "";
		document.getElementById("columncaption").value = "";
	}	
}
function Edit_Click()
{
	if (document.getElementById("oSelect").options.length>0)
	{
		for (i=0;i<document.getElementById("oSelect").options.length;i++)
		{
			if(document.getElementById("oSelect").options[i].selected == true)
			{
				document.getElementById("columncaption").value =  document.getElementById("oSelect").options[i].innerText;
				var args = document.getElementById("fld_1232_7").value.split('|');
				if (args.length>0)
				{
					var opitions = "";
					for (j=0;j<args.length;j++)
					{
						if (j==i)
						{
							var datastr = args[j].split(';');
							if (datastr.length>2)
							{
								document.getElementById("txt_put").value =  datastr[0];
							}
						}
						else if (j==0||(i+1)==j)
						{
							opitions += args[j];
						}
						else
						{
							opitions += "|"+ args[j];
						}
					}
					document.getElementById("fld_1232_7").value = opitions;
					document.getElementById("oSelect").options.remove(i);
				}
			}
		}
	}
	else
	{
		alert('没有数据列可编辑！');
	}
}
function Delete_Click()
{
	if (document.getElementById("oSelect").options.length>0)
	{
		for (i=0;i<document.getElementById("oSelect").options.length;i++)
		{
			if(document.getElementById("oSelect").options[i].selected == true)
			{
				document.getElementById("oSelect").options.remove(i);
				var args = document.getElementById("fld_1232_7").value.split('|');
				if (args.length>0)
				{
					var opitions = "";
					for (j=0;j<args.length;j++)
					{
						if (j==i)
						{
							continue;
						}
						else if (j==0||(i+1)==j)
						{
							opitions += args[j];
						}
						else
						{
							opitions += "|"+ args[j];
						}
					}	
					document.getElementById("fld_1232_7").value = opitions;
				}
			}
		}
	}
	else
	{
		alert('没有数据列可编辑！');
	}
}
function Save_Click()
{
	parent.form1.fld_1232_7.value = document.getElementById("fld_1232_7").value;
}
</script>

<body>
<form id="form1" runat="server">
<input id="fld_1232_7" runat="server" type="hidden" />
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
	<tr>
	    <td align="right" width="100" class="td_viewcontent_title">可计算字段：</td>
	    <td colspan="3" class="td_viewcontent_content">
		<%=WriteGrid()%>
		</td>
    </tr>
</table>
<table width="100%" height="190" border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
	<tr>
	    <td width="20%" class="td_viewcontent_content">
		<select id="oSelect" name="oSelect" size="10" MULTIPLE style="width:100%" runat="server"></select>
		</td>
	    <td width="40%" class="td_viewcontent_content">
		<table width="100%">
		<tr>
			<td style="padding-left:20px" align="left" width="80" nowrap>列名：</td>
			<td><input id ="columncaption" runat=server width="300" type="text"></td>
			<td style="padding-left:15px" align="left">
			<!--添加条件-->
			<G:Button id="btn_fadd" type="toolbar" mode="on" icon="" text="添加" Url="javascript:Add_Click();"  runat=server></G:Button>
			<!--添加条件-->
			</td>
			<td style="padding-left:15px" align="left">
			<!--修改条件-->
			<G:Button id="btn_edit" type="toolbar" mode="on" icon="" text="修改" Url="javascript:Edit_Click();"  runat=server></G:Button>
			<!--修改条件-->
			</td>
			<td style="padding-left:15px" align="left">
			<!--移除条件-->
			<G:Button id="btn_fdelete" type="toolbar" mode="on" icon="" text="移除" Url="javascript:Delete_Click();"  runat=server></G:Button>
			<!--移除条件-->
			</td>
			<td style="padding-left:15px" align="left">
			<!--保存-->
			<G:Button id="btn_fsave" type="toolbar" mode="on" icon="" text="保存" Url="javascript:Save_Click();" runat=server></G:Button>
			<!--保存-->
			</td>
			<td width="100%"><span id="alertmess" style="color:red" runat=server></span>
			</td>
		</tr>
		<tr valign="top">
			<td colspan=7 style="padding-left:20px" align="left">
			<textarea id="txt_put" runat=server style="width:100%;height:130px"></textarea>
			</td>
		</tr>
		</table>
		&nbsp;
		</td>
		<td width="60%" class="td_viewcontent_content" valign="top">
		<table width="100%">
		<tr height="20">
			<td name="substring(S,start,len)" onclick="AddFunction('substring(S,start,len)');" style="cursor:hand">
			<b>substring(S,start,len)</b>
			</td>		
			<td name="len(S)" onclick="AddFunction('len(S)');" style="cursor:hand">
			<b>len(S)</b>
			</td>
		</tr>
		<tr height="20">
			<td name="abs(Num)" onclick="AddFunction('abs(Num)');" style="cursor:hand">
			<b>abs(Num)</b>
			</td>
			<td name="log(Float)" onclick="AddFunction('log(Float)');" style="cursor:hand">
			<b>log(Float)</b>
			</td>
		</tr>
		<tr height="20">
			<td name="power(Num,y)" onclick="AddFunction('power(Num,y)');" style="cursor:hand">
			<b>power(Num,y)</b>
			</td>
			<td name="round(Num,len)" onclick="AddFunction('round(Num,len)');" style="cursor:hand">
			<b>round(Num,len)</b>
			</td>
		</tr>
		<tr height="20">
			<td name="sqrt(Num)" onclick="AddFunction('sqrt(Num)');" style="cursor:hand">
			<b>sqrt(Num)</b>
			</td>
			<td name="value(S)" onclick="AddFunction('value(S)');" style="cursor:hand">
			<b>value(S)</b>
			</td>
		</tr>
		<tr height="20">
			<td name="sum(Num)" onclick="AddFunction('sum(Num)');" style="cursor:hand">
			<b>sum(Num)</b>
			</td>
			<td name="count(S)" onclick="AddFunction('count(S)');" style="cursor:hand">
			<b>count(S)</b>
			</td>
		</tr>
		<tr height="20">
			<td name="max(Num)" onclick="AddFunction('max(Num)');" style="cursor:hand">
			<b>max(Num)</b>
			</td>
			<td name="min(Num)" onclick="AddFunction('min(Num)');" style="cursor:hand">
			<b>min(Num)</b>
			</td>
		</tr>
		<tr height="20">
			<td name="avg(Num)" onclick="AddFunction('avg(Num)');" style="cursor:hand">
			<b>avg(Num)</b>
			</td>
			<td name="replace(S,s1,s2)" onclick="AddFunction('replace(S,s1,s2)');" style="cursor:hand">
			<b>replace(S,s1,s2)</b>
			</td>
		</tr>
		<tr height="20">
			<td name="lower(S)" onclick="AddFunction('lower(S)');" style="cursor:hand">
			<b>lower(S)</b>
			</td>
			<td name="upper(S)" onclick="AddFunction('upper(S)');" style="cursor:hand">
			<b>upper(S)</b>
			</td>
		</tr>
		</table>
		</td>
    </tr>
</table>
</form>
</body>
</html>
