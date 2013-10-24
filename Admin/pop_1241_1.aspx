<!--全行业自定义高级查询,列表页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="c#" runat="server">
    string p_value;//JS添加项字段
    string p_binddata;//JS绑定
    string p_bindother;//其他信息里复选框绑定
    private void Page_Load(object sender, System.EventArgs e)
    {
        id = GetQueryString("id","0");
        grid_1202.SqlStr = "select fieldname,caption,fieldname as wid,modulecode,'100' as datalength from gmis_field where  modulecode=1202 and isvital=0 and fieldcode<26793";
        grid_1202.Rows = grid_1202.DataTable.Rows.Count;
        grid_1235.SqlStr = "select fieldname,caption,fieldname as wid,modulecode,'100' as datalength from gmis_field where  modulecode=1235 and isvital=0 ";
        if (grid_1235.DataTable.Rows.Count > 0)
        {
            foreach (DataRow dr in grid_1235.DataTable.Rows)
            {
                if (dr["caption"].ToString() == "污染物编号") dr["caption"] = "污染物名称"; 
            } 
        }
        grid_1235.Rows = grid_1235.DataTable.Rows.Count;
        if (grid_1202.DataTable.Rows.Count > 0)
        {
            foreach (DataRow dr in grid_1202.DataTable.Rows)
            {
                p_value += "if(document.getElementById(\"" + dr["fieldname"].ToString() + "\").checked)";
                p_value += "objField1.AddItem(\"" + dr["fieldname"].ToString() + "\",\"" + dr["caption"].ToString() + "\",document.getElementById(\"w_"+dr["wid"].ToString()+"\").value,\""+dr["modulecode"].ToString()+"\");";
            }
        }
        if (grid_1235.DataTable.Rows.Count > 0)
        {
            foreach (DataRow dr in grid_1235.DataTable.Rows)
            {
                p_value += "if(document.getElementById(\"" + dr["fieldname"].ToString() + "\").checked)";
                p_value += "objField1.AddItem(\"" + dr["fieldname"].ToString() + "\",\"" + dr["caption"].ToString() + "\",document.getElementById(\"w_" + dr["wid"].ToString() + "\").value,\"" + dr["modulecode"].ToString() + "\");";
            }
        }
        if (!IsPostBack)
        {
            //其他信息类别
            BindListControl(type3, "modulecode", "modulename", "select modulecode ,modulename from gmis_module where modulecode=1125 or modulecode=1127 or modulecode=1128", "类别筛选");
            SetFilter(type3,"0");
        } 
        BindFieldData();
        BindFieldOther();
        
    }
/*
 * 函数：Click_Save(object sender, System.EventArgs e)
 * 作用，将字段插入到显示字段表里。
 * 更改人/日期：YJ/2009年8月12日
 */
private void Click_Save(object sender, System.EventArgs e)
{
    SetSESSION("sql","");
    StringBuilder sb_sql = new StringBuilder();
    StringBuilder sb_sql1 = new StringBuilder();
    string[] h_str1= guangye.GetControlValue(fieldname).Trim('#').Split('#');//企业字段
    string[] h_str2 = guangye.GetControlValue(caption).Trim('#').Split('#');//企业字段名
    string[] h_str3 = guangye.GetControlValue(datalength).Trim('#').Split('#');//显示长度
    string[] h_str4 = guangye.GetControlValue(moduleid).Trim('#').Split('#');//类型
    if (id != "0")
    {
        //sb_sql.Append("delete from  gmis_mo_1243 where fld_1243_6=" + id + ";");
        sb_sql1.Append("delete from  gmis_mo_1243 where fld_1243_6=" + id + ";");
        int h_j1 = 1, h_j2 = 1, h_j3 = 1;//各字段排序
        for (int i = 0; i < h_str1.Length; i++)
        {
            if (h_str1[i].ToString() != "")
            {
                if (h_str4[i].ToString() == "1202")
                {
                    
                    sb_sql.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j1 + "','" + h_str4[i].ToString() + "',@MoID_1241);");
                    sb_sql1.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j1 + "','" + h_str4[i].ToString() + "',"+id+");");
                    h_j1++;
                }
                else if (h_str4[i].ToString() == "1235")
                {
                    sb_sql.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j2 + "','" + h_str4[i].ToString() + "',@MoID_1241);");
                    sb_sql1.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j2 + "','" + h_str4[i].ToString() + "',"+id+");");

                    h_j2++;
                }
                else
                {
                    sb_sql.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j3 + "','" + h_str4[i].ToString() + "',@MoID_1241);");
                    sb_sql1.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j3 + "','" + h_str4[i].ToString() + "',"+id+");");

                    h_j3++;
                }
            }
        }
        SetSESSION("sql", sb_sql.ToString());
        SetSESSION("extsql", sb_sql1.ToString());
		db.SqlString = sb_sql1.ToString();
        db.UpdateTable();
    }
    else 
    {
        int h_j1 = 1, h_j2 = 1, h_j3 = 1;//各字段排序
        StringBuilder h_sb = new StringBuilder();//缓存未保存的模版的显示字段
        h_sb.Append("delete from  gmis_mo_1243 where fld_1243_6=0;");
        for (int i = 0; i < h_str1.Length; i++)
        {
            if (h_str1[i].ToString() != "")
            {
                if (h_str4[i].ToString() == "1202")
                {
                    sb_sql.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j1 + "','" + h_str4[i].ToString() + "',@MoID_1241);");
                    h_sb.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j1 + "','" + h_str4[i].ToString() + "',0);");
                    h_j1++;
                }
                else if (h_str4[i].ToString() == "1235")
                {
                    sb_sql.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j2 + "','" + h_str4[i].ToString() + "',@MoID_1241);");
                    h_sb.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j2 + "','" + h_str4[i].ToString() + "',0);");
                    h_j2++;
                }
                else
                {
                    sb_sql.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j3 + "','" + h_str4[i].ToString() + "',@MoID_1241);");
                    h_sb.Append("Insert into gmis_mo_1243(fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_4,fld_1243_5,fld_1243_6) values('" + h_str1[i].ToString() + "','" + h_str2[i].ToString() + "','" + h_str3[i].ToString() + "','" + h_j3 + "','" + h_str4[i].ToString() + "',0);");
                    h_j3++;
                }
            }
        }
        SetSESSION("sql", sb_sql.ToString());
        db.SqlString = h_sb.ToString();
        db.UpdateTable();
    }
	//Response.Write(GetSESSION("extsql"));
}
/*
 * 函数：BindFieldData()
 * 功能：绑定企业信息及排污的所选字段
 * 更改人/日期：YJ/2009年8月12日
 */
private void BindFieldData()
{
    
        db.SqlString = "select fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_5 from gmis_mo_1243 where fld_1243_6=" + id + " and (fld_1243_5='1202' or fld_1243_5='1235')";
        if (db.GetDataTable().Rows.Count > 0)
        {
            foreach (DataRow dr in db.GetDataTable().Rows)
            {
                p_binddata += "objField1.AddItem(\"" + dr["fld_1243_1"].ToString() + "\",\"" + dr["fld_1243_2"].ToString() + "\",\"" + dr["fld_1243_3"].ToString() + "\",\"" + dr["fld_1243_5"].ToString() + "\");";
            }
        }
        else
        {
            p_binddata += "objField1.AddItem(\"fld_1202_1\",\"企业名称\",\"150\",\"1202\");";
            p_binddata += "objField1.AddItem(\"fld_1202_2\",\"企业代码\",\"150\",\"1202\");";
        }
    
    p_binddata += "LoadData();";
}
/*
 * 函数：BindFieldOther()
 * 功能：绑定其他信息的所选字段
 *  更改人/日期：YJ/2009年8月12日
 */
private void BindFieldOther()
{
    db.SqlString = "select fld_1243_1,fld_1243_2,fld_1243_3,fld_1243_5 from gmis_mo_1243 where fld_1243_6=" + id + " and fld_1243_5='1239'";
    if (db.GetDataTable().Rows.Count > 0)
    {
        foreach (DataRow dr in db.GetDataTable().Rows)
        {
          p_bindother+= "objField2.AddItem(\"" + dr["fld_1243_1"].ToString() + "\",\"" + dr["fld_1243_2"].ToString() + "\",\"" + dr["fld_1243_3"].ToString() + "\",\"" + dr["fld_1243_5"].ToString() + "\");";
        }
    }
}
private void ClearChecked(object sender,System.EventArgs e)
{
    //Page.RegisterStartupScript("str", "<s" + "cript>alert('确定要清空选项！');</s" + "cript>");
    db.SqlString="delete  gmis_mo_1243 where fld_1243_6="+id+"";
    db.UpdateTable();
    Response.Redirect("pop_1241_1.aspx?id="+id);
}
</script>
<body ><form id="form1" runat="server"><!--类型--><input id="fieldtypes" runat="server" value="1" type="hidden"><!--模块编号--><input id="moduleid" runat="server"  type="hidden" /><!--无实际作用--><input id="savefield1" type="hidden" /><!--字段名--><input id="fieldname" type="hidden" runat="server" /><!--字段标题--><input id="caption" type="hidden" runat="server" /><!--显示长度--><input id="datalength" runat="server" type="hidden" /><div  align="center">
<div id="pop_container">
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" style=" margin-top:10px; margin-bottom:10px;" >
  <tr>
    <td width="5"><img src="images/popA__001.gif" width="5" height="33"></td>
    <td bgcolor="#f2f2f2"><span id="alertmess" runat="server" style="color:Red"></span></td>
    <td align="right" bgcolor="#f2f2f2"><table  border="0" cellspacing="0" cellpadding="0">
      <tr>
      <td><table border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td class="btn_L_pic"></td>
                                <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td valign="bottom" class="btn_text">
									  <!--清空-->
									  <G:Button id="btn_loadedition" type="toolbar" mode="on" icon="delete" OnClick="ClearChecked"  text="清空" runat="server"></G:Button>
									 
									  <!--清空-->
									  </td>
                                    </tr>
                                </table></td>
                                <td class="btn_R_pic"></td>
                              </tr>
                            </table></td>
         <td width="5">&nbsp;</td>
        <td width="55"><a href="#"><img src="images/popA__003.gif" width="55" id="btn_save" height="22" border="0"><asp:LinkButton ID="data_save" OnClick="Click_Save" runat="server"></asp:LinkButton></a></td>
        <td width="5">&nbsp;</td>
        <td width="78"><a href="pop_1241_2.aspx?t=1&id=<%=id %>"><img src="images/popA__004.gif" width="78" height="22" border="0"></a></td>
      </tr>
    </table></td>
    <td width="5"><img src="images/popA__002.gif" width="5" height="33"></td>
  </tr>
</table>

<table width="600"  border="0" align="center" cellpadding="0" cellspacing="0" style="margin-bottom:20px;">
  <tr>
    <td width="300">&nbsp;</td>
    
    <td ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8"><img src="images/popA__005.gif" id="img1_1" width="8" height="20"></td>
        <td id="td_1" align="center" valign="middle" bgcolor="#7fcdfd" class="font1220_000000" onmouseover="ShowDiv('1')" style="cursor:hand" > 企业基本信息</td>
        <td width="8"><img src="images/popA__006.gif" id="img2_1" width="8" height="20"></td>
      </tr>
    </table></td>
    <td width="5">&nbsp;</td>
    <td width="1"><img src="images/popA__009.gif" width="1" height="12"></td>
    <td width="6">&nbsp;</td>
    <td width="100"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8"><img src="images/popA__008.gif" id="img1_2" width="8" height="20"></td>
        <td id="td_2" align="center" bgcolor="#f2f2f2" class="font1220_000000" onmouseover="ShowDiv('2')" style="cursor:hand"> 污染物排放情况</td>
        <td width="8"><img src="images/popA__007.gif" id="img2_2" width="8" height="20"></td>
      </tr>
    </table></td>
    <td width="6">&nbsp;</td>
    <td width="1"><img src="images/popA__009.gif" width="1" height="12"></td>
    <td width="6">&nbsp;</td>
    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8"><img src="images/popA__008.gif" id="img1_3" width="8" height="20"></td>
        <td id="td_3" align="center" bgcolor="#f2f2f2" class="font1220_000000" onmouseover="ShowDiv('3')" style="cursor:hand">其他信息</td>
        <td width="8"><img src="images/popA__007.gif" id="img2_3" width="8" height="20"></td>
      </tr>
    </table></td>
  </tr>
</table>
<script language="javascript">
function ShowDiv(str)
{
for(i=1;i<4;i++)
{
    if(str==i) 
    {
        document.getElementById("divdata_"+i).style.display="block";
        document.getElementById("td_"+i).style.backgroundColor="#7fcdfd";
        document.getElementById("img1_"+i).src="images/popA__005.gif";
        document.getElementById("img2_"+i).src="images/popA__006.gif";
        document.getElementById("fieldtypes").value=i;
    }
    else 
    {
        document.getElementById("divdata_"+i).style.display="none";
        document.getElementById("td_"+i).style.backgroundColor="#f2f2f2";
        document.getElementById("img1_"+i).src="images/popA__008.gif";
        document.getElementById("img2_"+i).src="images/popA__007.gif";
    }
}
    
}
</script>
<div style="width:600px;" align="center" id="divdata_1">
<table width="600"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="560" align="center">
	<div  align="center" style="width:540px; height:425px; margin:5px 15px 5px 30px;" >
	<!--企业基本信息开始-->
	<G:grid id="grid_1202" runat="server" cols="2" showallline="false">
	<G:template id="tempfld" runat="server">
	<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_000000">
      <tr>
        <td><input id="*" name="checkbox" type="checkbox" value="checkbox"></td>
        <td align="left" width="250" >*</td>
        <td align="left" width="100">列宽</td>
        <td width="100"><input name="textfield" id="w_*"  type="text" style="width:100px;" value="150" ></td>
        <td width="100">像素</td>
      </tr>
    </table>
    </G:template>
    </G:grid>
    <!--企业基本信息结束-->
	</div>
	</td>
  </tr>
</table>
 </div>
 
 <div style="width:600px; display:none" align="center" id="divdata_2">
<table width="600"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="560" align="center">
	<div  align="center" style="width:540px; height:425px; margin:5px 15px 5px 30px;" >
	<!-- 污染物排放开始-->
	<G:grid id="grid_1235" runat="server" cols="2" showallline="false">
	<G:template id="tempfld2" runat="server">
	<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_000000">
      <tr>
        <td><input id="*" name="checkbox" type="checkbox" value="checkbox"></td>
        <td align="left" width="250" >*</td>
        <td align="left" width="100">列宽</td>
        <td width="100"><input name="textfield" id="w_*"  type="text" style="width:100px;" value="150" ></td>
        <td width="100">像素</td>
      </tr>
    </table>
    </G:template>
    </G:grid>
    <!--污染物排放结束-->
	</div>
	</td>
  </tr>
</table>
 </div>

 <div style="width:600px; display:none" align="center" id="divdata_3">
<table width="600"  border="0" align="center" cellpadding="0" cellspacing="0" style="padding-left:10px" >
  <tr>
    <td width="560" align="center">
    <table width="100%" align="left"  border="0" cellspacing="0" cellpadding="0" style="margin-bottom:10px; padding-left:20px">
  <tr>
    <td width="180" align="left">
      <!--类别字段-->
		<asp:DropDownList ID="type3" Style="height:20px;width:95%" runat="server" onchange="if(this.value != '') setTypes(this.options[this.selectedIndex].value);">
	</asp:DropDownList>
	<!--类别字段-->   
   </td>
    <td width="10">&nbsp;</td>
    <td align="left" width="380">
    <asp:DropDownList ID="tabname" runat="server" Style="height:20px;width:95%" onchange="if(this.value != '') setTable(this.options[this.selectedIndex].value);"><asp:ListItem Value="0">表名筛选</asp:ListItem></asp:DropDownList>
    </td>
  </tr>
</table></td></tr><tr><td>
	<div  align="center" id="datafield" style="width:100%px; height:425px; margin:5px 5px 5px 5px; overflow-y:auto" >
	<!--其他信息开始-->
    <!--其他信息结束-->
	</div>
	</td>
  </tr>
</table>
 </div>
 
 
  </div>
  </div>
  </form>
</body>
<script language="javascript" type="text/javascript"> 
<!--  
//移除select所有项
function removeOptions(selectObj) 
{     
    if (typeof selectObj != 'object')
    {         
        selectObj = document.getElementById(selectObj);
    }      
    // 原有选项计数    
    var len = selectObj.options.length;      
    for (var i=0; i < len; i++)     
    {         
        // 移除当前选项        
        selectObj.options[0] = null;    
    } 
} 


function setSelectOption(selectObj, optionList, firstOption, selected) 
{     
    if (typeof selectObj != 'object')
    {         
        selectObj = document.getElementById(selectObj);     
    }      
    // 清空选项     
    removeOptions(selectObj);      
    if(selectObj.id=="type3")
    {
        var selectObj2 = document.getElementById("tabname");
        selectObj2.innerHTML="";
    }
    // 选项计数     
    var start = 0;          
    // 如果需要添加第一个选项     
    if (firstOption)
    {         
        selectObj.options[0] = new Option(firstOption, '');    // 选项计数从 1 开始         
        start ++;     
    }      
    
    var len = optionList.length;      
    for (var i=0; i < len; i++) 
    {        
        //设置option         
        selectObj.options[start] = new Option(optionList[i].txt, optionList[i].val);          
        //选中项         
        if(selected == optionList[i].val)
        {             
            selectObj.options[start].selected = true;         
        }          
        //计数加 1         
        start ++; 
    } 
} 
function setShowField(selectObj, optionList, checked) 
{     
    if (typeof selectObj != 'object')
    {         
        selectObj = document.getElementById(selectObj);     
    }      
    // 清空选项     
    selectObj.innerHtml="";     
    
    var len = optionList.length;      

}  //--> 
 //--> 
</script>

<script language="javascript" type="text/javascript">  
var xmlDoc;
    if(window.ActiveXObject)
    {
        xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async=false; 
        
    }
    else if(document.implementation&&document.implementation.createDocument)
    {
        xmlDoc=document.implementation.createDocument("","",null);
        xmlDoc.async=false;
        
    }
    else
    {
        //alert("未能读取XML数据！");
    }
    
var tabArr = [];
var fldArr = []; 
var tabnamestr;


function setTypes(type3){
if(tabArr[type3]==null)
{
    xmlDoc.load("WriteXml.aspx?pid="+escape(type3));
    if(xmlDoc!=null)
    {
        var nodes=xmlDoc.getElementsByTagName('root/type3/tabname');
       // alert(nodes[0].getAttribute('Value'));
        
        tabArr[type3] = new Array();
        
        if(nodes!=null && nodes.length>0)
        {
               
            for(var i=0;i<nodes.length;i++)
            {
                var obj = new Object();
                obj.txt = nodes[i].getAttribute('Text');
                obj.val = nodes[i].getAttribute('Value');
                tabArr[type3].push(obj);
            }
        }
        
    }
} 
setSelectOption('tabname', tabArr[type3], '-请选择-');
} 
function retfldArr(tabname)
{
if(fldArr[tabname]==null)
{
    xmlDoc.load("WriteXml.aspx?pid="+escape(tabname));
    if(xmlDoc!=null)
    {
        var nodes=xmlDoc.getElementsByTagName('root/tabname/field3');
        
        fldArr[tabname] = new Array();
        
        if(nodes!=null && nodes.length>0)
        {
               
            for(var i=0;i<nodes.length;i++)
            {
                var obj = new Object();
                obj.txt = nodes[i].getAttribute('Text');
                obj.val = nodes[i].getAttribute('Value');
                fldArr[tabname].push(obj);
            }
        }
        
    }
}    
return fldArr[tabname];
}

function setTable(tabname) {   
tabnamestr=tabname;
 retfldArr(tabname);
     var tagstr;
     tagstr="";
    tagstr+="<table  width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" >\n";
    var  j=1; 
    var h_ck; 
    <%=p_bindother %>   

    for(i=0;i<fldArr[tabname].length;i++)
    {      
      if(j%2!=0) tagstr+="<tr valign=\"top\">";
        for(n=0;n<objField2.Items.length;n++)
        {
            if(fldArr[tabname][i].val==objField2.Items[n].ID) 
            {
                h_ck="1";
                break;
            }
            else h_ck="2";     
        }   
      if(h_ck=="1")       tagstr+=" <td ><table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"font1225_000000\"><tr><td valign=\"baseline\"><input id=\""+fldArr[tabname][i].val+"\" name=\"checkbox\" type=\"checkbox\" onclick=\"addOther('"+fldArr[tabname][i].val+"','"+fldArr[tabname][i].txt+"')\" value=\"checkbox\" checked></td>\n";
      else       tagstr+=" <td ><table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"font1225_000000\"><tr><td valign=\"baseline\"><input id=\""+fldArr[tabname][i].val+"\" name=\"checkbox\" type=\"checkbox\" onclick=\"addOther('"+fldArr[tabname][i].val+"','"+fldArr[tabname][i].txt+"')\" value=\"checkbox\"></td>\n";
      tagstr+="<td align=\"left\" width=\"300\" >"+fldArr[tabname][i].txt+"</td>\n";
      tagstr+="<td valign=\"baseline\" align=\"left\" width=\"100\">列宽</td>\n";
      tagstr+="<td width=\"50\" valign=\"baseline\"><input name=\"textfield\" id=\"w_"+fldArr[tabname][i].val+"\"  type=\"text\" style=\"width:50px;\" value=\"150\" ></td>\n";
      tagstr+=" <td width=\"100\" valign=\"baseline\">像素</td>\n</tr>\n</table></td>";
      if(j%2==0) tagstr+="</tr>"; 
      j++;   
    }
    if(j%2!=0) 
    {
        tagstr+="<td >&nbsp;</td>";
        tagstr+="</tr>";
    }
    tagstr+="</table>";
    document.getElementById("datafield").innerHTML=tagstr;
}  

</script>
<script language="javascript">
var objField1=new createFieldobj(document.getElementById("savefield1"));
var objField2=new createFieldobj(document.getElementById("savefield1"));
objField1.Add=function(){
objField1.Clear();
 <%=p_value %>
    if(confirm("保存？"))
    {
    opener.form1.selectfiled.value="2";
     var h_v1="",h_v2="",h_v3="",h_v4="";
    for(i=0;i<objField1.Items.length;i++)
    {
         h_v1+=objField1.Items[i].ID+"#";
         h_v2+=objField1.Items[i].Text+"#";
         h_v3+=objField1.Items[i].Value+"#";
         h_v4+=objField1.Items[i].Type+"#";
    }
    for(i=0;i<objField2.Items.length;i++)
    {
        h_v1+=objField2.Items[i].ID+"#";
         h_v2+=objField2.Items[i].Text+"#";
         h_v3+=objField2.Items[i].Value+"#";
         h_v4+=objField2.Items[i].Type+"#";
    }
    document.getElementById("fieldname").value=h_v1;
    document.getElementById("caption").value=h_v2;
    document.getElementById("datalength").value=h_v3;
     document.getElementById("moduleid").value=h_v4;
        __doPostBack('data_save','');
      window.close();
    }

}

function addOther(str1,str2){
     if(document.getElementById(str1).checked)
      {
        objField2.AddItem(str1,str2,document.getElementById("w_"+str1).value,"1239");
      }
      else
      {
        var h_id="",h_txt="",h_val="";
        for(i=0;i<objField2.Items.length;i++)        
        {
            if(objField2.Items[i].ID!=str1)
            {
           
                h_id+=objField2.Items[i].ID+"*";
                h_txt+=objField2.Items[i].Text+"*";
                h_val+=objField2.Items[i].Value+"*";
            }
        }
        var arr_id,arr_txt,arr_val;
        arr_id=h_id.split('*');
        arr_txt=h_txt.split('*');
        arr_val=h_val.split('*');  
         //alert(arr_id)     
        objField2.Clear();
        for(i=0;i<arr_id.length;i++)
        {
            objField2.AddItem(arr_id[i],arr_txt[i],arr_val[i],"1239");
        }
      }
}

function conClear()
{
objField1.Clear();
objField2.Clear();
}

document.getElementById("btn_save").onclick= function(){
    objField1.Add();
    }
    function LoadData()
    {
        for(i=0;i<objField1.Items.length;i++)
        {
             document.getElementById(objField1.Items[i].ID).checked=true;
             document.getElementById("w_"+objField1.Items[i].ID).value=objField1.Items[i].Value;
        }
    }
    <%=p_binddata %>


function createFieldobj(objcontrol)
{
    var obj=new Object();
    obj.Items=new Array();
    obj.controlField=objcontrol;
    obj.GetLength=function(){
        return obj.Items.length;
    }
        obj.AddNews=function(newobj){
        obj.Items.push(newobj);
        obj.controlField.value+=newobj.ID;
    }
    obj.AddItem=function(fieldname,caption,datawidth,moduleid){
        var objItem=new Object();
        objItem.ID=fieldname;
        objItem.Text=caption;
        objItem.Value=datawidth;  
        objItem.Type=moduleid;   
        obj.AddNews(objItem);
    }
    obj.Delete=function(){
        if(obj.GetLength>0){
            obj.Items.reverse();
            obj.controlField.value=obj.controlField.value.substring(0,obj.controlField.value.length-obj.Items.shift().ID.length);
            obj.Items.reverse();
        }
    }
    obj.Clear = function(){
        obj.Items = new Array();
        obj.controlField.value = "";
    }
    return obj;
}
</script>

</html>
