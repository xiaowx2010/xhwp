<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage" Debug="true" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>

<!--#include file="func.aspx"-->
<script language="c#" runat="server">
//<!--污普数据高级查询,列表页-->
    string p_bindshowfield,p_bindData;//JS里对象数据
private void Page_Load(object sender,System.EventArgs e)
{    
    id=GetQueryString("id","0");
    if (!IsPostBack)
    {
        BindControlData(opration);
        BindListControl(fieldname,"fieldname","caption","select fieldname,caption from gmis_field where caption not like '%预留%' and modulecode in("+pid+")");
        BindListControl(applymod,"mocode","fld_1244_1","select mocode,fld_1244_1 from gmis_mo_1244","请选择模块");
        SetFilter(applymod,id); 
    }
    if (id!= "0")
    {
        BindTable(); 
    }
    btn_applymod.Url="list_1244.aspx?id="+guangye.GetControlValue(applymod);
    modid.Value=guangye.GetControlValue(applymod);
}
/*
函数：SaveThis(object sender,System.EventArgs e)
作用：保存模版
更改人/日期：YJ/2009年8月17日
*/
private void SaveThis(object sender,System.EventArgs e)
{
    string h_mid=guangye.GetControlValue(div_mid);//表
    string h_filed=guangye.GetControlValue(div_field);//字段
    string h_showfld=guangye.GetControlValue(div_showfld);//显示字段
    string h_showsort=guangye.GetControlValue(div_showsort);//显示字段
    string h_reltab=guangye.GetControlValue(div_reltab);//关联信息
    string h_conval=div_showconval.Value;//查询条件
    string h_contxt=guangye.GetControlValue(div_showcontxt);//查询条件文本
    string h_asname=guangye.GetControlValue(div_asname);//计算列，列名
    string h_biaodashi=guangye.GetControlValue(div_biaodashi);//计算列，表达式
    Response.Write(h_mid+"|"+h_filed+"|"+h_showfld+"|"+h_showsort+"|"+h_reltab+"|"+h_conval+"|"+h_contxt+"|"+h_asname+"|"+h_biaodashi);
    if(id=="0")
    {
        StringBuilder h_sbsql=new StringBuilder();//sql语句
        h_sbsql.Append("insert into gmis_mo_1244(fld_1244_1,creatorcode) values('"+guangye.GetControlValue(fld_1244_1)+"',"+GetUID()+");");
        h_sbsql.Append("SELECT @@IDENTITY as 'mocode';declare @modid int;select @modid=@@IDENTITY;");
        if(h_mid!="")
        {
            string[] h_arr1=h_mid.Trim(',').Split(',');//表组
            string[] h_arr2=h_filed.Trim(',').Split(',');//字段组
            string[] h_arr2_1;//字段组下子组
            if(h_arr1.Length>0)
            {
                string[] h_sql1=new string[h_arr1.Length];//查询表gmis_mo_1255中的字段值
                for(int i=0;i<h_arr1.Length;i++)
                {
                    h_sql1[i]="";
                }
                for(int i=0;i<h_arr2.Length;i++)
                {
                    h_arr2_1=h_arr2[i].Split('|');
                    for(int j=0;j<h_arr1.Length;j++)
                    {
                        if(h_arr1[j].ToString()==h_arr2_1[0].ToString())
                        {                    
                            h_sql1[j]+=h_arr2_1[1].ToString()+",";
                        }
                    }
                }
                for(int i=0;i<h_arr1.Length;i++)
                {
                    h_sbsql.Append("insert into gmis_mo_1255(fld_1255_1,fld_1255_2,fld_1255_3) values(@modid,"+Convert.ToInt32(h_arr1[i].ToString())+",'"+h_sql1[i].ToString()+"') ;");
                }
            } 
        }   
        if(h_showfld!="")
        {
            string[] h_arr3=h_showfld.Trim(',').Split(',');//显示字段组
            string[] h_arr4=h_showsort.Trim(',').Split(',');//显示字段的排序
            for(int i=0;i<h_arr3.Length;i++)
            {
                h_sbsql.Append("insert into gmis_mo_1256(fld_1256_1,fld_1256_2,fld_1256_3) values(@modid,'"+h_arr3[i].ToString()+"','"+h_arr4[i].ToString()+"');");
            }
            if(h_reltab!="")
            {
                string[] h_arr5=h_reltab.Trim(';').Split(';');//关联数据表组
                if(h_arr5.Length>0)
                {
                    string[] h_arr5_1;//关联数据表内信息
                    for(int i=0;i<h_arr5.Length;i++)
                    {
                        h_arr5_1=h_arr5[i].Split(',');
                        h_sbsql.Append("insert into gmis_mo_1257(fld_1257_1,fld_1257_2,fld_1257_3,fld_1257_4,fld_1257_5,fld_1257_6,fld_1257_7) values(@modid,"+h_arr5_1[0]+","+h_arr5_1[1]+",'"+h_arr5_1[2]+"','"+h_arr5_1[3]+"','"+h_arr5_1[4]+"','"+h_arr5_1[5]+"') ;");
                    }
                }
            }
        }
        string[] h_arr6=h_conval.Trim('|').Split('|');//条件组
        string[] h_arr7=h_contxt.Trim(',').Split(',');//条件文本组
        if(h_arr6.Length>0)
        {
            for(int i=0;i<h_arr6.Length;i++)
            {
                h_sbsql.Append("insert into gmis_mo_1258(fld_1258_1,fld_1258_2,fld_1258_3) values(@modid,'"+StringUtility.StringToBase64(h_arr6[i])+"','"+h_arr7[i]+"');");            
            }
        }
        string[] h_arr8=h_asname.Trim(',').Split(',');//列名组
        string[] h_arr9=h_biaodashi.Trim('|').Split('|');//列表达式组
        if (h_arr8.Length > 0)
        {
            for (int i = 0; i < h_arr8.Length; i++)
            {
                h_sbsql.Append("insert into gmis_mo_1259(fld_1259_1,fld_1259_2,fld_1259_3) values(@modid,'"+h_arr8[i]+"','"+h_arr9[i]+"');"); 
            } 
        }
        
        db.SqlString = h_sbsql.ToString();
        //Response.Write(db.SqlString);
        DataTable h_dt=db.GetDataTable();
        string h_id=h_dt.Rows[0][0].ToString();
        Response.Redirect("list_1244.aspx?id=" + h_id);
    }    
    else
    {
       StringBuilder h_sbsql=new StringBuilder();//sql语句
        string[] h_arr1=h_mid.Trim(',').Split(',');//表组
        string[] h_arr2=h_filed.Trim(',').Split(',');//字段组
        string[] h_arr2_1;//字段组下子组
        if(h_arr1.Length>0)
        {
            string[] h_sql1=new string[h_arr1.Length];//查询表gmis_mo_1255中的字段值
            for(int i=0;i<h_arr1.Length;i++)
            {
                h_sql1[i]="";
            }
            for(int i=0;i<h_arr2.Length;i++)
            {
                h_arr2_1=h_arr2[i].Split('|');
                for(int j=0;j<h_arr1.Length;j++)
                {
                    if(h_arr1[j].ToString()==h_arr2_1[0].ToString())
                    {                    
                        h_sql1[j]+=h_arr2_1[1].ToString()+",";
                    }
                }
            }
            h_sbsql.Append("delete from gmis_mo_1255 where fld_1255_1="+id+";");
            for(int i=0;i<h_arr1.Length;i++)
            {
                h_sbsql.Append("insert into gmis_mo_1255(fld_1255_1,fld_1255_2,fld_1255_3) values("+id+","+Convert.ToInt32(h_arr1[i].ToString())+",'"+h_sql1[i].ToString()+"') ;");
            }
        }    
        string[] h_arr3=h_showfld.Trim(',').Split(',');//显示字段组
        string[] h_arr4=h_showsort.Trim(',').Split(',');//显示字段的排序
        h_sbsql.Append("delete from gmis_mo_1256 where fld_1256_1="+id+";");
        for(int i=0;i<h_arr3.Length;i++)
        {
            h_sbsql.Append("insert into gmis_mo_1256(fld_1256_1,fld_1256_2,fld_1256_3) values("+id+",'"+h_arr3[i].ToString()+"','"+h_arr4[i].ToString()+"');");
        }
        string[] h_arr5=h_reltab.Trim(';').Split(';');//关联数据表组
        if(h_arr5.Length>0)
        {
            string[] h_arr5_1;//关联数据表内信息
            h_sbsql.Append("delete from gmis_mo_1257 where fld_1257_1="+id+";");
            for(int i=0;i<h_arr5.Length;i++)
            {
                h_arr5_1=h_arr5[i].Split(',');
                h_sbsql.Append("insert into gmis_mo_1257(fld_1257_1,fld_1257_2,fld_1257_3,fld_1257_4,fld_1257_5,fld_1257_6,fld_1257_7) values("+id+","+h_arr5_1[0]+","+h_arr5_1[1]+",'"+h_arr5_1[2]+"','"+h_arr5_1[3]+"','"+h_arr5_1[4]+"','"+h_arr5_1[5]+"') ;");
            }
        }
        string[] h_arr6=h_conval.Trim('|').Split('|');//条件组
        string[] h_arr7=h_contxt.Trim(',').Split(',');//条件文本组
        if(h_arr6.Length>0)
        {
            h_sbsql.Append("delete from gmis_mo_1258 where fld_1258_1="+id+";");
            for(int i=0;i<h_arr6.Length;i++)
            {
                h_sbsql.Append("insert into gmis_mo_1258(fld_1258_1,fld_1258_2,fld_1258_3) values("+id+",'"+StringUtility.StringToBase64(h_arr6[i])+"','"+h_arr7[i]+"');");            
            }
        }
        string[] h_arr8=h_asname.Trim(',').Split(',');//列名组
        string[] h_arr9=h_biaodashi.Trim('|').Split('|');//列表达式组
        if (h_arr8.Length > 0)
        {
            h_sbsql.Append("delete from gmis_mo_1259 where fld_1259_1="+id+";");
            for (int i = 0; i < h_arr8.Length; i++)
            {
                h_sbsql.Append("insert into gmis_mo_1259(fld_1259_1,fld_1259_2,fld_1259_3) values("+id+",'"+h_arr8[i]+"','"+h_arr9[i]+"');"); 
            } 
        }
        
        db.SqlString = h_sbsql.ToString();
        //Response.Write(db.SqlString);
        string exeinfo = db.UpdateTable(); ;//提示信息
        if (exeinfo == "操作成功！")
        {
            Response.Redirect("list_1244.aspx?id=" + id);
        }
    }  
}
private void BindTable()
{
    db.SqlString = "select fld_1255_2,(select modulename from gmis_module where modulecode=fld_1255_2) as modulename,fld_1255_3 from gmis_mo_1255 where fld_1255_1=" + id;
    DataTable h_dt = db.GetDataTable();//内存表
    string h_outtab="";//模块表格
    string[] h_outfld;//选中字段
    if (h_dt.Rows.Count > 0)
    {
        foreach (DataRow dr in h_dt.Rows)
        {
            dr["fld_1255_3"] = dr["fld_1255_3"].ToString() == "" ? "0" : dr["fld_1255_3"].ToString();
            h_outtab += "<scrip" + "t>AddTable('" + dr["fld_1255_2"].ToString() + "','" + dr["modulename"].ToString() + "','" + dr["fld_1255_3"].ToString().Trim(',') + "');</scr" + "ipt>";
            h_outtab += "<scrip" + "t>SetFiled('" + dr["fld_1255_2"].ToString() + "','" + dr["modulename"].ToString() + "','" + dr["fld_1255_3"].ToString().Trim(',') + "');</scr" + "ipt>";
            h_outfld = dr["fld_1255_3"].ToString().Trim(',').Split(',');
            for (int i = 0; i < h_outfld.Length; i++)
            {
                h_outtab += "<scri" + "pt>Add_Option('" + h_outfld[i] + "','" +dr["fld_1255_2"].ToString()+ "');</scr" + "ipt>";
            }
        }
    }
    db.SqlString = "select fld_1256_2,(select modulecode from gmis_field where fieldname=fld_1256_2) as modulecode,fld_1256_3 from gmis_mo_1256 where fld_1256_1=" + id;
    DataTable h_dt1256 = db.GetDataTable();//内存表
    string h_sel = "";//选中字段
    string h_sor="";//排序类型
    if (h_dt1256.Rows.Count > 0)
    {
        int h_i=0;//索引
        foreach (DataRow dr in h_dt1256.Rows)
        {
            h_outtab += "<scri" + "pt>addShowField('"+dr["fld_1256_2"].ToString()+"','"+dr["modulecode"].ToString()+"','"+h_i+"')</scri" + "pt>";
            h_sel += dr["fld_1256_2"].ToString()+",";
            h_sor+=dr["fld_1256_3"].ToString()+",";
            h_i++;
        }
    }
    s_sfld.Value = h_sel.ToString().Trim(',');
    s_sort.Value=h_sor.ToString().Trim(',');
    db.SqlString = "select (select modulename from gmis_module where modulecode=fld_1257_2) as midname1,fld_1257_2,(select modulename from gmis_module where modulecode=fld_1257_3) as midname2,fld_1257_3,(select caption from gmis_field where fieldname=fld_1257_4) as fld1,fld_1257_4,(select caption from gmis_field where fieldname=fld_1257_5) as fld2,fld_1257_5,(case fld_1257_6  when  '0' then '内连接' when '1' then '左外连接' else '右外连接' end) as cont ,fld_1257_6,fld_1257_7 from gmis_mo_1257 where fld_1257_1=" + id;
    DataTable h_dt1257 = db.GetDataTable();
    if (h_dt1257.Rows.Count > 0)
    {
        foreach (DataRow dr in h_dt1257.Rows)
        {
            h_outtab += "<scri" + "pt>AddTableRel('" + dr["midname1"].ToString() + "','" + dr["fld1"].ToString() + "','" + dr["fld_1257_7"].ToString() + "','" + dr["midname2"].ToString() + "','" + dr["fld2"].ToString() + "','" + dr["cont"].ToString() + "','" + dr["fld_1257_2"].ToString() + "','" + dr["fld_1257_3"].ToString() + "', '" + dr["fld_1257_6"].ToString() + "','" + dr["fld_1257_4"].ToString() + "','" + dr["fld_1257_5"].ToString() + "');</scri" + "pt>";    
        } 
    }
    db.SqlString = "select fld_1258_2,fld_1258_3 from gmis_mo_1258 where fld_1258_1="+id;
    DataTable h_dt1258 = db.GetDataTable();//内存表
    if (h_dt1258.Rows.Count > 0)
    {
        foreach(DataRow dr in  h_dt1258.Rows)
        {
            p_bindData += "searchobj.AddItem(\"" + StringUtility.Base64ToString(dr["fld_1258_2"].ToString()) + "\",\"" + dr["fld_1258_3"].ToString() + "\");showConVal=\"\";showConTxt=\"\";showCondition=\"\";for(var i=0;i<searchobj.Items.length;i++){ showCondition+=searchobj.Items[i].Value;showConVal+=searchobj.Items[i].Value+\"|\";showConTxt+=searchobj.Items[i].Text+\",\";}";
        }
    }
    db.SqlString="select fld_1259_2,fld_1259_3 from gmis_mo_1259 where fld_1259_1="+id;
    DataTable h_dt1259=db.GetDataTable();//内存表
    if(h_dt1259.Rows.Count>0)
    {
        foreach(DataRow dr in h_dt1259.Rows)
        {
            h_outtab+="<scrip"+"t>bindData('"+dr["fld_1259_2"].ToString()+"','"+dr["fld_1259_3"].ToString()+"');</scri"+"pt>";
        }
    }
    Page.RegisterStartupScript("str", h_outtab);

}
/*
* 函数:BindControlData()
* 功能：绑定操作符的值
* 更改人/日期：YJ/2009年8月12日
*/
private void BindControlData(ListControl _c)
{
    _c.Items.Add(new ListItem("等于", "="));
    _c.Items.Add(new ListItem("大于", ">"));
    _c.Items.Add(new ListItem("大于等于", ">="));
    _c.Items.Add(new ListItem("小于", "<"));
    _c.Items.Add(new ListItem("小于等于", "<="));
    _c.Items.Add(new ListItem("相似于", "like"));
    _c.Items.Add(new ListItem("is not null", "is not"));
     _c.Items.Add(new ListItem("is null", "is"));
     _c.Items.Add(new ListItem("in", "in"));
}
</script>

<body><form id="form1" runat="server">
<input id="div_mid" type="hidden" runat="server" /><!--选中表的MID-->
<input id="div_field" type="hidden" runat="server" /><!--字段组-->
<input id="div_showfld" type="hidden" runat="server"><!--显示字段组-->
<input id="div_showsort" type="hidden" runat="server"><!--显示字段排序类型-->
<input id="div_reltab" type="hidden" runat="server" /><!--关联表--->
<input id="div_showconval" type="hidden" runat="server" /><!--查询条件-->
<input id="div_showcontxt" type="hidden" runat="server" /><!--查询条件显示文本-->
<input id="div_asname" type="hidden" runat="server" /><!--计算列显示列名-->
<input id="div_biaodashi" type="hidden" runat="server" /><!--计算列表达式-->
<input id="fld_1244_1" type="hidden" runat="server" /><!--模版名-->
<asp:LinkButton ID="btn_save" runat="server" OnClick="SaveThis"></asp:LinkButton><!--保存-->
<input id="s_sfld" runat="server" type="hidden" /><!--绑定显示字段-->
<input id="s_sort" runat="server" type="hidden" /><!--绑定排序状态-->
<input id="modid" runat="server" type="hidden"><!--模块ID-->
<div >
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td> </td>
      <td valign="top">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" style=" margin:10px 0px; ">
          <tr>
            <td width="10"><img src="images/gjcx_002.gif" width="10" height="34"></td>
            <td align="left" bgcolor="#f2f2f2" width="200"><asp:DropDownList ID="applymod" runat="server" style="width:200px" AutoPostBack="true"><asp:ListItem Value="0">--请选择模块--</asp:ListItem></asp:DropDownList></td>
            <td align="left" bgcolor="#f2f2f2" style=" padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td class="btn_L_pic"></td>
        <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td valign="bottom" class="btn_text" >
			  <!--保存模板-->
			  <G:Button id="btn_applymod" type="toolbar" mode="on" icon="tb05" text="应用模版"  runat=server></G:Button>
			  <!--保存模板-->
			  </td>
            </tr>
        </table></td>
        <td class="btn_R_pic"></td>
      </tr>
      </table></td>
            <td align="left" bgcolor="#f2f2f2"><span id="alertinfo" runat="server" style="color:Red"></span></td>            
            <td align="right" bgcolor="#f2f2f2"><a href="#" onclick="javascript:__doOpenView('pop_1244_1.aspx','400','50','100','750')"><img src="images/gjcx_004.gif" width="70" height="22" border="0"></a></td>
            <td align="right" width="79" style="padding-left:5px" bgcolor="#f2f2f2"><img src="images/desk_003.gif" width="79" height="22" border="0" style="cursor:hand" onclick="searchBegin()" /></td>
            <td align="right"  bgcolor="#f2f2f2" width="79" style="padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >
      <tr>
       <script language="javascript">
      function doOpenNamePage()
      {
        if(document.getElementById("applymod").value=="0")
        {
            __doOpenView('pop_1244_4.aspx','400','100','200','500');
        }
        else
        {
            saveThis();
        }
      }
      </script>
        <td class="btn_L_pic"></td>
        <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td valign="bottom" class="btn_text" >
			  <!--保存模板-->
			  <G:Button id="btn_saveother" type="toolbar" mode="on" icon="tb05" text="保存模版" url="javascript:doOpenNamePage()" runat=server></G:Button>
			  <!--保存模板-->
			  </td>
            </tr>
        </table></td>
        <td class="btn_R_pic"></td>
      </tr>
       
      </table></td>
             <td align="right"  bgcolor="#f2f2f2" width="79" style="padding-left:5px"><table border="0" cellspacing="0" cellpadding="0" >     
      <tr>
        <td class="btn_L_pic"></td>
        <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td valign="bottom" class="btn_text" >
			  <!--保存模板-->
			  <G:Button id="btn_manage" type="toolbar" mode="on" icon="edit" text="管理模版" url="javascript:doOpenManage()" runat=server></G:Button>
			  <!--保存模板-->
			  </td>
            </tr>
        </table></td>
        <td class="btn_R_pic"></td>
      </tr></table></td>
     <script language="javascript">
     function doOpenManage()
     {
          __doOpenView('pop_1244_5.aspx','600','600','50','50');
     }
     </script>
            <td width="10"><img src="images/gjcx_003.gif" width="10" height="34"></td>
          </tr>
        </table>
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="40%"    valign="top" class="bole_table_tlb">
			<div id="div_tab" style="height:291px; overflow-y:auto; margin:5px 0px; ">
			</div >
			<script language="javascript">
			var mid="";
			var midname="";
			var sfld="";//选中字段
				var tableNode = document.createElement("table");
                tableNode.id="table1";
                tableNode.style.width ="100%";
                tableNode.border="0";
                var newRow;
                var newCell;
			function AddTable(str1,str2,str3)
			{ 
			    if(document.getElementById("tr_"+str1)!=null)
			    {
			        alert("不能添加重复表！");
			    }
			    else{ 
			    mid+=str1+",";
			    midname+=str2+",";
			    sfld+=str3+",";
			    newRow = tableNode.insertRow(-1);  
                newRow.id="tr_"+str1;
                newCell=newRow.insertCell(-1);
                newCell.innerHTML="&nbsp;&nbsp;·";
                newCell.width="8%"  
                newCell.valign="middle";           
                newCell = newRow.insertCell(-1);  
                newCell.id="td_"+str1;  
                newCell.width="92%";
                newCell.innerHTML="<a href=\"javascript:SetFiled('"+str1+"','"+str2+"','"+str3+"');\" >"+str2+"</a>&nbsp;<img src=\"images/gjcx_005.gif\" width=\"14\" height=\"15\" style=\"cursor:hand\" onclick=\"DeleteTR("+str1+")\">"; 
                }
                document.getElementById("div_mid").value=mid;
			}
			div_tab.appendChild(tableNode);
			</script>
			</td>
            <td width="60%" valign="top" class="bole_table_tlbr"><div id="div_fld" style="height:291px; overflow-x:hidden; overflow-y:auto"></div></td>
          </tr>
        </table>
        <script language="javascript">
        var showpid="";//当前显示字段的栏目号
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
        	function SetFiled(str,str1,str2)        	
			{
	           var selfld=sfld.split(',');//选中字段	
			   var midarr=mid.split(',');
			   var midname2=midname.split(',');
			   var sarr=sfld.split(',');
			   for(i=0;i<midarr.length-1;i++)
			   {
			     if(midarr[i]==str)		document.getElementById("td_"+midarr[i]).innerHTML="<table  border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\"3\"><img src=\"images/gjcx_017.gif\" width=\"3\" height=\"19\"></td><td valign=\"middle\" background=\"images/gjcx_019.gif\" class=\"font1218_000000\">"+str1+"</td><td width=\"3\"><img src=\"images/gjcx_018.gif\" width=\"3\" height=\"19\"></td><td>&nbsp;<img src=\"images/gjcx_005.gif\" width=\"14\" height=\"15\"  style=\"cursor:hand\" onclick=\"DeleteTR("+str+")\"></td></tr></table>";		   
                 else                   document.getElementById("td_"+midarr[i]).innerHTML="<a href=\"#\" onclick=\"SetFiled('"+midarr[i]+"','"+midname2[i]+"','"+sarr[i]+"')\">"+midname2[i]+"</a>&nbsp;<img src=\"images/gjcx_005.gif\" width=\"14\" height=\"15\" style=\"cursor:hand\" onclick=\"DeleteTR("+midarr[i]+")\">"; 
               }
                xmlDoc.load("FieldXml.aspx?pid="+escape(str)); 
                showpid=str;
                if(xmlDoc!=null)
                {
                div_fld.innerHTML="";
                     var nodes=xmlDoc.documentElement.selectNodes("Item");

                        if(nodes!=null && nodes.length>0)
                        {
                            var tabfldNode = document.createElement("table");
                            tabfldNode.id="tabFld";
                            tabfldNode.style.width ="100%";
                            tabfldNode.border="0"; 
                            tabfldNode.cellspacing="0";
                            tabfldNode.cellpadding="0";
                             tabfldNode.style.borderCollapse="collapse";
                            var fldnewRow=tabfldNode.insertRow(-1);
                            var fldnewCell=fldnewRow.insertCell(-1) ;
                            fldnewCell.innerHTML="&nbsp;";
                            fldnewCell.width="7%";
                            fldnewCell.className="td_viewcontent_title";
                             fldnewCell.style.borderColor="#627C9D"; 
                            fldnewCell=fldnewRow.insertCell(-1) ;
                            fldnewCell.innerHTML="字段标题";
                            fldnewCell.width="30%";
                            fldnewCell.className="td_viewcontent_title";
                             fldnewCell.style.borderColor="#627C9D"; 
                            fldnewCell=fldnewRow.insertCell(-1);
                             fldnewCell.innerHTML="字段名称";
                            fldnewCell.width="20%";
                            fldnewCell.className="td_viewcontent_title";
                             fldnewCell.style.borderColor="#627C9D"; 
                            fldnewCell=fldnewRow.insertCell(-1);
                             fldnewCell.innerHTML="字段类型";
                            fldnewCell.width="12%";
                            fldnewCell.className="td_viewcontent_title";
                             fldnewCell.style.borderColor="#627C9D"; 
                            fldnewCell=fldnewRow.insertCell(-1);
                             fldnewCell.innerHTML="长度";
                            fldnewCell.width="13%";
                            fldnewCell.className="td_viewcontent_title";
                             fldnewCell.style.borderColor="#627C9D"; 
                            fldnewCell=fldnewRow.insertCell(-1);
                             fldnewCell.innerHTML="操作";
                            fldnewCell.width="13%";
                            fldnewCell.className="td_viewcontent_title";
                             fldnewCell.style.borderColor="#627C9D"; 
                            for(var i=0;i<nodes.length;i++)
                            {
                                fldnewRow = tabfldNode.insertRow(-1);
                                fldnewRow.className="BXLine_font_1223_000";
                                var childs=nodes[i].childNodes;
                                if(childs.length>0)
                                {
                                fldnewCell=fldnewRow.insertCell(-1);
                                for(var m=0;m<selfld.length;m++)
                                {
                                    if(childs[1].text==selfld[m])
                                    {
                                      fldnewCell.innerHTML="<input name=\"checkbox\" id=\""+childs[1].text+"\" type=\"checkbox\"  onclick=\"Add_Option('"+childs[1].text+"','"+str+"')\" value=\"checkbox\" checked >";
                                      break;
                                    }
                                    else  fldnewCell.innerHTML="<input name=\"checkbox\" id=\""+childs[1].text+"\" type=\"checkbox\" onclick=\"Add_Option('"+childs[1].text+"','"+str+"')\" value=\"checkbox\" >";

                                }
                               // fldnewCell.innerHTML="<input name=\"checkbox\" id=\""+childs[1].text+"\" type=\"checkbox\" onclick=\"Add_Option('"+childs[1].text+"','"+str+"')\" value=\"checkbox\" >";
                                fldnewCell.align="center";
                                    for(var j=0;j<childs.length-1;j++)
                                    {
                                        fldnewCell = fldnewRow.insertCell(-1);  
                                        fldnewCell.innerHTML=childs[j].text;
                                        
                                    }
                                fldnewCell=fldnewRow.insertCell(-1);
                                fldnewCell.innerHTML="<img src=\"images/gjcx_006.gif\" width=\"14\" onclick=\"bindField('"+childs[1].text+"','"+childs[4].text+"')\" style=\"cursor:hand\" height=\"15\">";
                                }
                            }
                            div_fld.appendChild(tabfldNode);
                            //alert(div_fld.innerHTML);
                        }
                }
			}
			
        </script>
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin:13px 0px; ">
          <tr>
            <td height="1" bgcolor="#dddddd"> </td>
          </tr>
        </table>
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-bottom:10px; ">
          <tr>
            <td width="16">&nbsp;</td>
            <td width="70"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="7"><img src="images/gjcx_009.gif" id="img1_1" width="7" height="20"></td>
                <td align="center" bgcolor="#7fcdfd" id="td_1" class="font1220_000000" onclick="ShowDiv('1')" style="cursor:hand">列信息</td>
                <td width="7"><img src="images/gjcx_010.gif" id="img2_1" width="7" height="20"></td>
              </tr>
            </table></td>
            <td width="17" align="center"><img src="images/gjcx_013.gif"  width="1" height="12"></td>
            <td width="80"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="7"><img src="images/gjcx_011.gif" width="7" id="img1_2" height="20"></td>
                <td align="center" bgcolor="#f2f2f2" class="font1220_000000" id="td_2" onclick="ShowDiv('2')" style="cursor:hand">关联信息</td>
                <td width="7"><img src="images/gjcx_012.gif" width="7" id="img2_2" height="20"></td>
              </tr>
            </table></td>
            <td width="17" align="center"><img src="images/gjcx_013.gif"  width="1" height="12"></td>
            <td width="80"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="7"><img src="images/gjcx_011.gif" width="7" id="img1_3" height="20"></td>
                <td align="center" bgcolor="#f2f2f2" class="font1220_000000" onclick="ShowDiv('3');" id="td_3" style="cursor:hand">查询条件</td>
                <td width="7"><img src="images/gjcx_012.gif" width="7" id="img2_3" height="20"></td>
              </tr>
            </table></td>
            <td width="17" align="center"><img src="images/gjcx_013.gif" width="1" height="12"></td>
            <td width="70"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="7"><img src="images/gjcx_011.gif" width="7" id="img1_4" height="20"></td>
                <td align="center" bgcolor="#f2f2f2" class="font1220_000000" onclick="ShowDiv('4')" id="td_4" style="cursor:hand">计算列</td>
                <td width="7"><img src="images/gjcx_012.gif" width="7" id="img2_4" height="20"></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <div id="listdata_1" style="display:block">
          <table width="100%"  border="0" cellspacing="0" cellpadding="0" style=" margin:10px 0px; ">
          <tr>
            <td width="10"><img src="images/gjcx_002.gif" width="10" height="34"></td>
            <td align="left" bgcolor="#f2f2f2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="68" align="left"><img src="images/gjcx_014.gif" width="58" height="22" onclick="upTr()" style="cursor:hand"></td>
                <td width="68" align="left"><img src="images/gjcx_015.gif" width="58" height="22" onclick="downTr()" style="cursor:hand"></td>
               <%-- <td align="left"><img src="images/gjcx_016.gif" width="58" height="22"></td>--%>
               <td align="left" id="order">&nbsp;</td>
              </tr>
            </table></td>
            <td width="10"><img src="images/gjcx_003.gif" width="10" height="34"></td>
          </tr>
        </table>
        <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="bole_table_tlbr"  style="margin-bottom:18px; ">
          <tr>
            <td><div id="div_list" style="height:250px; overflow-y:auto; overflow-x:hidden"></div>
              </td>
          </tr>
        </table>
        </div>
        <script language="javascript">
        var objOption=new createConditionObj();
        var pid="";//栏目号
        var filed="";//字段
        var pid_filed="";//组合栏目号与字段
        var nid=0;//列信息，顺序
        var sortnid="";//列信息，顺序，关联显示字段顺序
			function Add_Option(str1,str2)
			{
			if(objShowFld!=null) objShowFld.Clear();
			    if(document.getElementById(str1).checked)
			    {			    
			        objOption.AddItem(str1,str2,nid);
			    }
			    else
			    {
			        objOption.DeleteByVal(str1);
			    }
			    pid="";
			    filed="";
			    pid_filed="";
			    sortnid="";
                for(i=0;i<objOption.Items.length;i++)
                {                    
                    pid+=objOption.Items[i].Text+",";
                    filed+=objOption.Items[i].Value+",";   
                    pid_filed+= objOption.Items[i].Text+"|"+objOption.Items[i].Value+",";     
                    sortnid+=objOption.Items[i].Sort+",";      
                }	                             
                xmlDoc.load("ListXml.aspx?pid="+escape(pid)+"&field="+escape(filed)); 
               createTable(); 
               nid++;               	
			}	
			var sort="";//排序
			
			 var tablistNode = document.createElement("table");
			 var n=1;//调用createTable()次数；
			 var objList=new createConditionObj();//上移，下移所在对象
			function createTable()
			{			
		        if(xmlDoc!=null)
                {      
                     div_list.innerHTML="";         
                     var nodes=xmlDoc.documentElement.selectNodes("Item");
                        if(nodes!=null && nodes.length>0)
                        {                           
			                tablistNode.id="tablist";
                            tablistNode.style.width ="100%";
                            tablistNode.border="0"; 
                            tablistNode.cellspacing="0";
                            tablistNode.cellpadding="0";
                            tablistNode.style.borderCollapse="collapse";
                            var listnewRow=tablistNode.insertRow(-1);
                            var listnewCell=listnewRow.insertCell(-1) ;
                            listnewCell.innerHTML="&nbsp;";
                            listnewCell.width="8%";
                            listnewCell.className="td_viewcontent_title";
                             listnewCell.style.borderColor="#627C9D"; 
                            listnewCell=listnewRow.insertCell(-1) ;
                            listnewCell.innerHTML="表代码";
                            listnewCell.width="10%";
                            listnewCell.className="td_viewcontent_title";
                             listnewCell.style.borderColor="#627C9D"; 
                            listnewCell=listnewRow.insertCell(-1);
                             listnewCell.innerHTML="表名称";
                            listnewCell.width="32%";
                            listnewCell.className="td_viewcontent_title";
                             listnewCell.style.borderColor="#627C9D"; 
                            listnewCell=listnewRow.insertCell(-1);
                             listnewCell.innerHTML="字段名称";
                            listnewCell.width="20%";
                            listnewCell.className="td_viewcontent_title";
                             listnewCell.style.borderColor="#627C9D"; 

                            listnewCell=listnewRow.insertCell(-1);
                             listnewCell.innerHTML="排序顺序";
                            listnewCell.width="10%";
                            listnewCell.className="td_viewcontent_title";
                             listnewCell.style.borderColor="#627C9D"; 
                            listnewCell=listnewRow.insertCell(-1);
                             listnewCell.innerHTML="是否升序";
                            listnewCell.width="10%";
                            listnewCell.className="td_viewcontent_title";
                             listnewCell.style.borderColor="#627C9D";
                                                         listnewCell=listnewRow.insertCell(-1);
                             listnewCell.innerHTML="是否显示";
                            listnewCell.width="10%";
                            listnewCell.className="td_viewcontent_title";
                             listnewCell.style.borderColor="#627C9D";  
                            for(var i=0;i<nodes.length;i++)
                            {
                                listnewRow = tablistNode.insertRow(-1);
                                listnewRow.className="BXLine_font_1223_000";
                                var childs=nodes[i].childNodes;
                                if(childs.length>0)
                                {
                                    listnewRow.id="tr_"+childs[4].text+"_"+i+"";
                                    listnewCell=listnewRow.insertCell(-1);
                                    listnewCell.innerHTML="<input name=\"checkbox\" id=\""+childs[3].text+"_1\" type=\"checkbox\" onclick=\"addSort('"+childs[3].text+"')\"  value=\"checkbox\" >";
                                    if(objList.Items.length!=0)
                                    {
                                       for(var j=0;j<objList.Items.length;j++)
                                       {
                                        if(childs[3].text==objList.Items[j].Value)
                                        {
                                            listnewCell.innerHTML="<input name=\"checkbox\" id=\""+childs[3].text+"_1\" type=\"checkbox\" onclick=\"addSort('"+childs[3].text+"')\"  checked value=\"checkbox\" >";
                                        }
                                       }
                                    } 
                                    listnewCell.align="center";
                                    for(var j=0;j<childs.length-3;j++)
                                    {
                                        listnewCell = listnewRow.insertCell(-1);  
                                        listnewCell.innerHTML=childs[j].text;
                                    }
                                    
                                    listnewCell=listnewRow.insertCell(-1);
                                    listnewCell.innerHTML="&nbsp;";
                                    listnewCell=listnewRow.insertCell(-1);
                                    listnewCell.innerHTML="<select id=\"select_"+childs[3].text+"\"><option value=\"-1\">请选择</option><option value=\"1\">是</option><option value=\"0\">否</option></select>";
                                    if(document.getElementById("s_sort").value!=""&&document.getElementById("s_sfld").value!="")
                                    {
                                        var s_sorarr=document.getElementById("s_sort").value.split(',');
                                        var s_sfldarr=document.getElementById("s_sfld").value.split(',');                                        
                                        for(var m=0;m<s_sorarr.length;m++)
                                        {
                                            if(s_sfldarr[m]==childs[3].text)
                                            {
                                                if(s_sorarr[m]=="1")  listnewCell.innerHTML="<select id=\"select_"+childs[3].text+"\"><option value=\"1\">是</option><option value=\"0\">否</option><option value=\"-1\">请选择</option></select>";
                                                if(s_sorarr[m]=="0")    listnewCell.innerHTML="<select id=\"select_"+childs[3].text+"\"><option value=\"0\">否</option><option value=\"1\">是</option><option value=\"-1\">请选择</option></select>";
                                            }                                        
                                        }   
                                                                                
                                    }
                                    listnewCell=listnewRow.insertCell(-1);
                                    if(document.getElementById("s_sfld").value!="")
                                    {
                                        var s_sfldarr=document.getElementById("s_sfld").value.split(',');
                                        for(var m=0;m<s_sfldarr.length;m++)
                                        {
                                            if(s_sfldarr[m]==childs[3].text)
                                            {
                                               listnewCell.innerHTML="<input name=\"checkbox\" id=\""+childs[3].text+"_2\" type=\"checkbox\" onclick=\"addShowField('"+childs[3].text+"','"+childs[4].text+"','"+childs[5].text+"')\"  value=\"checkbox\" checked >";
                                               break;
                                            }
                                            else 
                                            {
                                               listnewCell.innerHTML="<input name=\"checkbox\" id=\""+childs[3].text+"_2\" type=\"checkbox\" onclick=\"addShowField('"+childs[3].text+"','"+childs[4].text+"','"+childs[5].text+"')\"  value=\"checkbox\" >";
                                            }
                                        }
                                    }
                                    else
                                    {
                                        listnewCell.innerHTML="<input name=\"checkbox\" id=\""+childs[3].text+"_2\" type=\"checkbox\" onclick=\"addShowField('"+childs[3].text+"','"+childs[4].text+"','"+childs[5].text+"')\"  value=\"checkbox\" >";
                                    }
                                }  
                            }  
                           div_list.appendChild(tablistNode);
                        }
                     }
                     n++;
			}	
			var objShowFld=new createConditionObj();
			function addSort(str)
			{			
			    if(document.getElementById(str+"_1").checked)  objList.AddItem(str,str,"0");			    
			    else objList.DeleteByVal(str);
			}
			var showFld="";//查询结果显示字段
			var showSort="";//排序
            var showOrder="";//排序语句
			function addShowField(str,str1,str2){	
			    if(document.getElementById(str+"_2").checked) objShowFld.AddItem(str,str2,document.getElementById("select_"+str).value);
			    else objShowFld.DeleteByVal(str);
			    showFld="";
			    showSort="";
			    showOrder="";				    	    
			    for(var i=0;i<objShowFld.Items.length;i++)
			    {
			        showFld+=objShowFld.Items[i].Value+",";	
			        showSort+=objShowFld.Items[i].Sort+",";	
			        if(objShowFld.Items[i].Sort!="-1")
			        {
			            var by=objShowFld.Items[i].Sort=="1"?" asc":" desc"
			            showOrder+=objShowFld.Items[i].Value+by+",";	
			           // alert(showOrder);
			        }		        
			    }
			   
			   // document.getElementById("tablist").rows[str2].cells[4].InnerHtml="3";
			    document.getElementById("s_sfld").value=showFld;
			   
			}
			<%=p_bindshowfield %>
			
			function upTr()
			{
			
			if(objList.Items.length==0) alert("请选择移动项！");
			   var fldarr=filed.split(',');
			  
			   var pidarr=pid.split(',');
			   
			   var h_i="";//更改顺序所在的INDEX
			  for(i=0;i<objList.Items.length;i++)
			  {
			     sort+=objList.Items[i].Value+",";			    
			  }				  	
			   var sortarr=sort.split(',');  
			   for(i=0;i<fldarr.length-1;i++)
			   {
			        for(j=0;j<sortarr.length-1;j++)
			        {
			            if(fldarr[i]==sortarr[j]) h_i+=i+",";
			        }
			   }
			   var showval="";//显示字段值
			   var showtxt="";//显示文本
			   var showsor="";//显示顺序
			   for(i=0;i<objShowFld.Items.length;i++)
			   {
			     showval+=objShowFld.Items[i].Value+",";
			     showtxt+=objShowFld.Items[i].Text+",";
			     showsor+=objShowFld.Items[i].Sort+",";
			   }
			   var temp="";//中间变量
			   var h_arr="";
			   h_arr=h_i.split(',');
			   for(i=0;i<h_arr.length-1;i++)
			   {
			      if(fldarr[h_arr[i]-1]!=null)
			      {			   
			       temp=fldarr[h_arr[i]-1];
			       fldarr[h_arr[i]-1]=fldarr[h_arr[i]];//字段交换
			       fldarr[h_arr[i]]=temp;	
			       
			       temp=pidarr[h_arr[i]-1];
			       pidarr[h_arr[i]-1]=pidarr[h_arr[i]];//模块号交换
			       pidarr[h_arr[i]]=temp;	
			      }	     
			   }
			   filed="";
			   pid="";
			   for(i=0;i<fldarr.length-1;i++)
			   {
			       filed+=fldarr[i]+",";
			       pid+=pidarr[i]+",";	       
			   }
			   var showvalarr=showval.split(',');	
			   var showtxtarr=showtxt.split(',');
			   var showsorarr=showsor.split(',');
			   objShowFld.Clear();
			   showFld="";
			   for(var i=0;i<fldarr.length-1;i++)
			   {
			        for(var j=0;j<showvalarr.length-1;j++)
			        {
			            if(fldarr[i]==showvalarr[j])
			            {
			                objShowFld.AddItem(showvalarr[j],showtxtarr[j],showsorarr[j]);
			                showFld+=showvalarr[j]+",";
			            }
			        }
			   }	 
			   xmlDoc.load("ListXml.aspx?pid="+escape(pid)+"&field="+escape(filed)); 
			   createTable();
			   sort="";
			}	
			function downTr()
			{
			if(objList.Items.length==0) alert("请选择移动项！");
			   var fldarr=filed.split(',');
			   var pidarr=pid.split(',');
			   var h_i="";//更改顺序所在的INDEX
			  for(i=0;i<objList.Items.length;i++)
			  {
			     sort+=objList.Items[i].Value+",";			    
			  }	
			   var sortarr=sort.split(',');
			   for(i=0;i<fldarr.length-1;i++)
			   {
			        for(j=0;j<sortarr.length-1;j++)
			        {
			            if(fldarr[i]==sortarr[j]) h_i+=i+",";
			        }
			   }
			    var showval="";//显示字段值
			   var showtxt="";//显示文本
			   var showsor="";//显示顺序
			   for(i=0;i<objShowFld.Items.length;i++)
			   {
			     showval+=objShowFld.Items[i].Value+",";
			     showtxt+=objShowFld.Items[i].Text+",";
			     showsor+=objShowFld.Items[i].Sort+",";
			   }
			   var temp="";//中间变量
			   var h_arr="";//需要更换位置的索引号
			   h_arr=h_i.split(',');
			  
			   for(i=h_arr.length-2;i>-1;i--)
			   {
			    if(fldarr[h_arr[i]*1+1].toString()!="")
			    {			   
			       temp=fldarr[h_arr[i]*1+1];
			       fldarr[h_arr[i]*1+1]=fldarr[h_arr[i]];
			       fldarr[h_arr[i]]=temp;		
			       
			       temp=pidarr[h_arr[i]*1+1];
			       pidarr[h_arr[i]*1+1]=pidarr[h_arr[i]];
			       pidarr[h_arr[i]]=temp;	
			     }	       
			   }
			   filed="";
			   pid="";
			   for(i=0;i<fldarr.length-1;i++)
			   {
			       filed+=fldarr[i]+",";
			       pid+=pidarr[i]+",";
			   }	
			    var showvalarr=showval.split(',');	
			   var showtxtarr=showtxt.split(',');
			   var showsorarr=showsor.split(',');
			   objShowFld.Clear();
			   showFld="";
			   for(var i=0;i<fldarr.length-1;i++)
			   {
			        for(var j=0;j<showvalarr.length-1;j++)
			        {
			            if(fldarr[i]==showvalarr[j])
			            {
			                objShowFld.AddItem(showvalarr[j],showtxtarr[j],showsorarr[j]);
			                showFld+=showvalarr[j]+",";
			            }
			        }
			   }	 		 
			   xmlDoc.load("ListXml.aspx?pid="+escape(pid)+"&field="+escape(filed)); 
			   createTable();
			   sort="";
			}
function createConditionObj()
{
    var obj = new Object(); 
    obj.Items = new Array();    
    obj.GetLength = function(){
        return obj.Items.length;
    }
    obj.AddNew = function(newobj){
            obj.Items.push(newobj);
    }
    obj.AddItem = function(value,text,sort){
        var objItem = new Object();
        objItem.Value = value;
        objItem.Text = text;
        objItem.Sort=sort;
        obj.AddNew(objItem);
    }
    obj.Delete = function(index){
        if(obj.GetLength()>0)
        {
            if(index == null)
            {
                index=obj.GetLength()-1;
            }            
            obj.Items = obj.Items.slice(0,index).concat(obj.Items.slice(index+1));
        }
        else
        {
            alert("没有可以去除的项！");
        }
    }
    obj.DeleteByVal =function(value){
        if(obj.Items.length>0)
        {
            for(var i=0;i<obj.Items.length;i++)
            {
                if(obj.Items[i].Value==value)
                {
                    obj.Delete(i);                
                }
            }

        }
        else
        {
            alert("没有可以去除的项！");
        }
    }
    obj.Clear = function(){
        obj.Items = new Array();
    }
    return obj;
}
	      
        </script>
        <div id="listdata_2" style="display:none">
             <table width="100%"  border="0" cellspacing="0" cellpadding="0" style=" margin:10px 0px; " >
          <tr>
            <td width="10"><img src="images/gjcx_002.gif" width="10" height="34"></td>
            <td align="left" bgcolor="#f2f2f2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <%--<td width="68" align="left"><img src="images/gjcx_014.gif" width="58" height="22"></td>
                <td width="68" align="left"><img src="images/gjcx_015.gif" width="58" height="22"></td>--%>
                <td width="100%" align="left">&nbsp;</td>
                <td><img src="images/tjgl.gif" width="105" height="22" style="cursor:hand" onclick="javascript:__doOpenView('pop_1244_2.aspx?mid='+form1.div_mid.value,'550','300','100','750')"></td>
                <td><img src="images/gjcx_029.gif" width="55" height="22" style="cursor:hand" onclick="javascript:DeleteRelTab()" /></td>
              </tr>
            </table></td>
            <td width="10"><img src="images/gjcx_003.gif" width="10" height="34"></td>
          </tr>
        </table>
        <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="bole_table_tlbr"  style="margin-bottom:18px; ">
          <tr>
            <td><div id="div_table"></div></td>
          </tr>
        </table>
        <script language="javascript">
        var tabmid="";//关联信息里面涉及到的表的MID
       var tableRel=document.createElement("table");
           tableRel.style.wdith="100%";
        tableRel.border="0";
        tableRel.style.borderCollapse="collapse";
        var relnewRow=tableRel.insertRow(-1);
        var relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML="&nbsp;";
            relnewCell.width="10%";
            relnewCell.className="td_viewcontent_title";
            relnewCell.style.borderColor="#627C9D"; 
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML="左表名称;";
            relnewCell.width="25%";
            relnewCell.className="td_viewcontent_title";
            relnewCell.style.borderColor="#627C9D"; 
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML="左表字段名;";
            relnewCell.width="12%";
            relnewCell.className="td_viewcontent_title";
            relnewCell.style.borderColor="#627C9D"; 
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML="关联关系;";
            relnewCell.width="8%";
            relnewCell.className="td_viewcontent_title";
            relnewCell.style.borderColor="#627C9D"; 
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML="右表名称;";
            relnewCell.width="25%";
            relnewCell.className="td_viewcontent_title";
            relnewCell.style.borderColor="#627C9D"; 
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML="右表字段名;";
            relnewCell.width="12%";
            relnewCell.className="td_viewcontent_title";
            relnewCell.style.borderColor="#627C9D"; 
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML="关联类型;";
            relnewCell.width="8%";
            relnewCell.className="td_viewcontent_title";
            relnewCell.style.borderColor="#627C9D"; 
            var m=0;//调用函数次数
            var showTabName="";//关联表
            var showTabName2="";//删除表时，对应删除关联表
             var joinstr="";//连接类型
             var showTab="";  
                      
        function AddTableRel(str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,str11)
        {
        tabmid+=str7+','+str8+';';
            relnewRow=tableRel.insertRow(-1);
            relnewRow.className="BXLine_font_1223_000";
            relnewRow.id="tr2_"+str7+"_"+m;
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML="<input name=\"checkbox\" id=\"radio_"+m+"\" type=\"checkbox\" onclick=\"deleteTr('"+m+"','tr2_"+str7+"_"+m+"')\" value=\"checkbox\" >";
            relnewCell.align="center";
            relnewCell.width="10%";
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML=str1;
            relnewCell.width="25%";
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML=str2;
            relnewCell.width="12%";
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML=str3;
            relnewCell.width="8%";
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML=str4;
            relnewCell.width="25%";
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML=str5;
            relnewCell.width="12%";
            relnewCell=relnewRow.insertCell(-1);
            relnewCell.innerHTML=str6;
            relnewCell.width="8%";
            div_table.appendChild(tableRel);
            m++;
            showTab+=str7+","+str8+","+str10+","+str11+","+str9+","+str3+";";
           
            if(str9=="0") joinstr=" inner join";
            else if(str9=="1") joinstr=" left outer join";
            else if(str9=="2") joinstr=" right outer join";            
            if(m==1)
            {
                if(str7==str8) showTabName+="gmis_mo_"+str7+" a"+m+"";
                else showTabName+="gmis_mo_"+str7+" a"+m+" "+joinstr+" gmis_mo_"+str8+" b"+m+" on a"+m+"."+str10+" "+str3+" b"+m+"."+str11+" ";
                showTabName2+="gmis_mo_"+str7+" a"+m+" ,"+joinstr+" gmis_mo_"+str8+" b"+m+" on a"+m+"."+str10+" "+str3+" b"+m+"."+str11+" ,";
            }
            else
            {
                showTabName+=""+joinstr+" gmis_mo_"+str8+" b"+m+" on a1."+str10+" "+str3+" b"+m+"."+str11+" ";
                showTabName2+=""+joinstr+" gmis_mo_"+str8+" b"+m+" on a1."+str10+" "+str3+" b"+m+"."+str11+" ,";
            }
        }
        var objRadio=new createConditionObj();
        var delTr="";//删除关联表行
        function deleteTr(str0,str)
        {
            if(document.getElementById("radio_"+str0).checked) objRadio.AddItem(str,str,'0');
            else 
            {
                objRadio.DeleteByVal(str); 
            }
            delTr="";
            for(var i=0;i<objRadio.Items.length;i++)
            {
                delTr+=objRadio.Items[i].Value+",";
            }                     
        }
        function DeleteRelTab()
        {            
            var delarr=delTr.split(',');
            var showtab=showTabName2.split(',');
            var showtab1=showTab.split(';');
            showTabName="";
            showTab="";
            for(var i=0;i<delarr.length-1;i++)
            {
                showtab=showtab.slice(0,document.getElementById(delarr[i]).rowIndex).concat(showtab.slice(document.getElementById(delarr[i]).rowIndex+1));//删掉对应连接数据表
                showtab1=showtab1.slice(0,document.getElementById(delarr[i]).rowIndex-1).concat(showtab1.slice(document.getElementById(delarr[i]).rowIndex));//删掉对应存入数据库数据
                for(var j=0;j<showtab.length-1;j++)
                {
                    showTabName+=showtab[j];
                }  
                for(var j=0;j<showtab1.length-1;j++)
                {
                    showTab+=showtab1[j]+";";
                }  
                tableRel.deleteRow(document.getElementById(delarr[i]).rowIndex);                        
            }
        }
       
        </script>
        </div>
        <div id="listdata_3" style="display:none">
              <table width="100%"  border="0" cellpadding="3" cellspacing="1" bgcolor="#999999" class="table_graybgcolor" style="margin-top:5px; ">
            <tr>
            <td width="12%" align="right"  class="td01_viewcontent_title" style="padding-right:5px; ">表名</td>
            <td width="38%" align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><asp:DropDownList ID="tabname" runat="server" onchange="if(this.value!=''){setTable(this.options[this.selectedIndex].value);}" style="width:90%"></asp:DropDownList></td>
            <td width="12%" align="right" bgcolor="#FFFFFF"  class="td01_viewcontent_title" style="padding-right:5px; "> &nbsp;</td>
            <td width="38%" align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; ">&nbsp;</td>
          </tr>
          <tr>
            <td width="12%" align="right"  class="td01_viewcontent_title" style="padding-right:5px; ">字段名</td>
            <td width="38%" align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><asp:DropDownList ID="fieldname" runat="server" style="width:90%"></asp:DropDownList></td>
            <td width="12%" align="right" bgcolor="#FFFFFF"  class="td01_viewcontent_title" style="padding-right:5px; "> 操作符</td>
            <td width="38%" align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><asp:DropDownList ID="opration"  runat="server" style="width:90%"></asp:DropDownList></td>
          </tr>
          <tr>
            <td align="right"  class="td01_viewcontent_title">值</td>
            <td align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><input type="text" id="keyword" name="textfield" style="width:90%;"></td>
            <td width="10%" align="right" bgcolor="#FFFFFF"  class="td01_viewcontent_title"> 与上一条件关系 </td>
            <td align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="30%"><input type="radio" id="and" name="radiobutton" value="radiobutton" checked>
                  并且 
                  <input type="radio" name="radiobutton" id="or" value="radiobutton">
                  或者</td>
                <td width="70%" align="left"><%--<img src="images/gjcx_020.gif" width="58" height="22">--%><table width="100%" border="0" cellspacing="0" cellpadding="0" >
                          <tr>
                            <td class="btn_L_pic"></td>
                            <td class="btn_M_bg"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td valign="bottom" class="btn_text"> 
								  <!--添加条件-->
								  <G:Button id="btn_s_add3" type="toolbar" mode="on" icon="" text="添加" Url="javascript:AddCondition();"   runat=server></G:Button>
								  <!--添加条件-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--取消条件-->
								  <G:Button id="btn_s_cancel3" type="toolbar" mode="on" icon="" text="取消"  url="javascript:CancelCondition()" runat=server></G:Button>
								  <!--取消条件-->
								  </td>
								  <td valign="bottom" class="btn_text" style="padding-left:10px"> 
								  <!--取消条件-->
								  <G:Button id="btn_s_clear3" type="toolbar" mode="on" icon="" text="清空"  url="javascript:ClearCondition()" runat=server></G:Button>
								  <!--取消条件-->
								  </td>
                                </tr>
                            </table></td>
                            <td class="btn_R_pic"></td><td id="alertinfo" style="color:Red"></td>
                          </tr>
                        </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td align="right" valign="middle"  class="td01_viewcontent_title">查询条件汇总</td>
            <td colspan="3" align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; padding-right:20px;"><textarea id="s_txt" name="textarea" style="width:98%; height:100px;"></textarea></td>
          </tr>
        </table>     
</div>
        
        <div id="listdata_4" style="display:none">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="font1225_000000">计算列列表</td>
          </tr>
        </table><input id="SelectField" type="hidden" /><!--字段绑定-->
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="mytable">
          <tr>
            <td width="25%" valign="top"><select id="selectfld" name="oSelect" size="10" MULTIPLE style="width:100%; height:262px" runat="server"></select></td>
            <td width="60%" valign="top" ><table width="100%"  border="0" cellpadding="3" cellspacing="1" bgcolor="#999999" class="table_graybgcolor">
              <tr>
                <td width="12%" align="right"  class="td01_viewcontent_title" style="padding-right:5px; ">显示名称</td>
                <td align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><input type="text" id="showfld" name="textfield" style="width:98%;"> </td>
                </tr>
              <tr>
                <td align="right"  class="td01_viewcontent_title">值</td>
                <td align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; "><input type="text" id="addvalue" name="textfield" style="width:70%;"><input type="button" value="插入值" onclick="insertValue()" /></td>
                </tr>
              <tr>
                <td align="right" valign="middle"  class="td01_viewcontent_title">查询条件汇总</td>
                <td align="left" bgcolor="#FFFFFF" class="td01_viewcontent_content" style="padding-left:10px; padding-right:20px;"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><%--<textarea id="txt_put" runat=server style="width:100%;height:100px"></textarea>--%><div id="txt_put" contenteditable="true" style="width:100%; height:109px;"></div></td>
                  </tr>
                </table>
                  <table width="98%"  border="0" cellspacing="0" cellpadding="0" style="padding-top: ">
                    <tr>
                      <td width="25" height="30"><img src="images/gjcx_021.gif" width="20" height="19" onclick="AddFunction('+')" style="cursor:hand"></td>
                      <td width="25"><img src="images/gjcx_022.gif" width="20" height="19" onclick="AddFunction('-')" style="cursor:hand"></td>
                      <td width="25"><img src="images/gjcx_023.gif" width="20" height="19" onclick="AddFunction('*')" style="cursor:hand"></td>
                      <td width="25"><img src="images/gjcx_024.gif" width="20" height="19" onclick="AddFunction('/')" style="cursor:hand"></td>
                      <td width="25"><img src="images/gjcx_025.gif" width="20" height="19" onclick="AddFunction('(')" style="cursor:hand"></td>
                      <td width="20"><img src="images/gjcx_026.gif" width="20" height="19" onclick="AddFunction(')')" style="cursor:hand"></td>
                      <td align="right"><img src="images/gjcx_027.gif" width="20" height="19" border="0" onclick="Show_FuncDiv()" style="cursor:hand"></td>
                    </tr>
                  </table>
                  <div id="div_func"  style="display:none" >
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
                  </div>
                  <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="50" align="right"><img src="images/gjcx_028.gif" width="55" height="22" onclick="Clear_Field()"  style="cursor:hand"></td>
                      <td height="50" width="65" align="right"><img src="images/edit.gif" width="55" height="22" onclick="Edit_Click()" style="cursor:hand"></td>
                      <td width="65" align="right"><img src="images/gjcx_029.gif" width="55" height="22" onclick="Delete_Field()" style="cursor:hand"></td>
                      <td width="65" align="right"><img src="images/gjcx_030.gif" width="55" height="22" onclick="Save_Field()" style="cursor:hand"></td>
                      <td width="10%">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          </tr>
        </table>
        </div>
        </td>
    </tr>
  </table>
<script language="javascript">
function ShowDiv(str)
{
for(i=1;i<5;i++)
{
    if(str==i) 
    {
        document.getElementById("listdata_"+i).style.display="block";
        document.getElementById("td_"+i).style.backgroundColor="#7fcdfd";
        document.getElementById("img1_"+i).src="images/gjcx_009.gif";
        document.getElementById("img2_"+i).src="images/gjcx_010.gif";
        if(str=="3") setTableName();
    }
    else 
    {
        document.getElementById("listdata_"+i).style.display="none";
        document.getElementById("td_"+i).style.backgroundColor="#f2f2f2";
        document.getElementById("img1_"+i).src="images/gjcx_011.gif";
        document.getElementById("img2_"+i).src="images/gjcx_012.gif";
    }
}
    
}

</script>
<script language="javascript">

       
        var searchobj=createObj(document.getElementById("s_txt"));
        var objfield=document.getElementById("fieldname");
        var objop=document.getElementById("opration");
        var objtxt=document.getElementById("keyword");
var showCondition="";//查询条件；
var showConVal="";//查询条件以‘，’隔开
var showConTxt="";//查询条件显示文本以‘，’隔开
        function AddCondition()
        {
        var obj0=GetSelectedItem(document.getElementById("tabname"));
        var obj1=GetSelectedItem(objfield);
        var obj2=GetSelectedItem(objop);
        var re=new Object();
        re.Value="and";
        re.Text="和";
        if(searchobj.GetLength()>0)
        {
            if(document.getElementById("and").checked)
            {
                re.Value="and";
                re.Text="并且";
            }
            else if(document.getElementById("or").checked)
            {
                re.Value="or";
                re.Text="或者";
            }
        }
        else
        {
            re.Value="and";
            re.Text="";
        }
        var h_like="";//当操作符等于like的时候
        var h_key="";//关键字值为null
        if(obj2.Value=="like")
        {
           h_like="%"+objtxt.value.replace("\'","")+"%";
        }
        else if(obj2.Value=="is not"||obj2.Value=="is")
        {
            h_like="null";
            h_key="IS";
        }
        else if(obj2.Value=="in")
        {
            h_like="("+objtxt.value.replace("\'","")+")";
            alert(h_like);
        }
        else
        {
           h_like=objtxt.value.replace("\'","");
        }
//         if(objtxt.value==""&&h_key!="IS")
//         {
//            alertinfo.innerText="字段值不能为空！";
//         }
         if(re.Text=="和")
         {
            alertinfo.innerText="选择与上一条件关系！";
         }
         else alertinfo.innerText="";
         if(alertinfo.innerText=="")
         {
            if(obj2.Value=="is not"||obj2.Value=="is"||obj2.Value=="in")
            {
                searchobj.AddItem(" "+re.Value+" "+obj1.Value+" "+obj2.Value+" "+h_like+""," "+re.Text+" ["+obj1.Text+obj2.Text+"]; ",""+obj0.Value+"");
            }
            else
            {
                searchobj.AddItem(" "+re.Value+" "+obj1.Value+" "+obj2.Value+" '"+h_like+"'"," "+re.Text+" ["+obj1.Text+obj2.Text+objtxt.value.replace("\'","")+"]; ",""+obj0.Value+"");
            }
         }
         showCondition="";
         for(var i=0;i<searchobj.Items.length;i++)
         {
            showCondition+=searchobj.Items[i].Value;
         }
        }
        function CancelCondition()
        {
        searchobj.Delete();
        }
        function ClearCondition()
        {
        searchobj.Clear();
        }
        <%=p_bindData %>
        function createObj(objcontrol)
        {
            var obj = new Object();
            obj.ControlCondition=objcontrol;
            obj.Items = new Array();
            obj.GetLength = function(){
                return obj.Items.length;
            }
            obj.AddNew = function(newobj){
                obj.Items.push(newobj);
                obj.ControlCondition.value += newobj.Text;
            }
            obj.AddItem = function(value,text,tabcode){
                var objItem = new Object();
                objItem.Value = value;
                objItem.Text = text;
                objItem.Tab=tabcode;
                obj.AddNew(objItem);
            }
           obj.Delete = function(){
                if(obj.GetLength()>0)
                {
                    obj.Items.reverse();
                    obj.ControlCondition.value = obj.ControlCondition.value.substr(0,obj.ControlCondition.value.length-obj.Items.shift().Text.length);
                    obj.Items.reverse();
                }
                else
                {
                    alert("没有可以去除的项！");
                }
            }   
             obj.Deleteindex = function(index){
                if(obj.GetLength()>0)
                {
                    if(index == null)
                    {
                        index=obj.GetLength()-1;
                    }
                    obj.Items = obj.Items.slice(0,index).concat(obj.Items.slice(index+1));
                    obj.ControlCondition.value="";
                    if(obj.Items.length>0)
                    {
                        for(var i=0;i<obj.Items.length;i++)
                        {
                            obj.ControlCondition.value += obj.Items[i].Text;
                        }
                    }
                }
                else
                {
                    alert("没有可以去除的项！");
                }
            }        
            obj.Clear = function(){
                obj.Items = new Array();
                obj.ControlCondition.value = "";
            }
            return obj;
        }
        //获得select标签选定值 返回一个对象或null
function GetSelectedItem(obj)
{
    for(var i=0;i<obj.options.length;i++)
    {
        if(obj.options[i].selected)
        {
            var objselect = new Object();
            objselect.Value = obj.options[i].value;
            objselect.Text = obj.options[i].text;
            return objselect;
        }
    }
    return null;
}
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
 //   removeOptions(selectObj);      
    if(selectObj.id=="tabname")
    {
        var selectObj2 = document.getElementById("fieldname");
        removeOptions(selectObj2); 
        selectObj2.options[0] = new Option(firstOption, '');
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
}  //--> 
var tabArr=[];
var fldArr=[];

function setTableName()
{
    xmlDoc.load("FieldListXml.aspx?pid="+escape(mid));
    if(xmlDoc!=null)
    {
        var nodes=xmlDoc.getElementsByTagName('root/Item/tabname');
        var tabArr = new Array();
       // alert(nodes[0].getAttribute('Value'));
        if(nodes!=null && nodes.length>0)
        {
            for(var i=0;i<nodes.length;i++)
            {
                var obj = new Object();
                obj.txt = nodes[i].getAttribute('Text');
                obj.val = nodes[i].getAttribute('Value');
                tabArr.push(obj);
            }
        }
    }
    setSelectOption('tabname', tabArr, '-请选择-');   
}
function setTable(tabname) {   
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
setSelectOption('fieldname', fldArr[tabname], '-请选择-');
}  

   function DeleteTR(str)//清楚表时，字段几列信息均清掉
			{			
			 	tableNode.deleteRow(document.getElementById("tr_"+str).rowIndex); 	
			 	var midarr=mid.split(',');
			 	var midname2=midname.split(',');
			 	mid="";
			 	midname="";
			 	for(i=0;i<midarr.length;i++)
			 	{
			 	    if(midarr[i]==str)
			 	    {
			 	         midarr[i]="0";
			 	         midname2[i]="0";
			 	    }
			 	    if(midarr[i]!="0"&&midarr[i]!="")
			 	    {
			 	        mid+=midarr[i]+",";			 	        
			 	        midname+=midname2[i]+",";
			 	    }
			 	}
			 	document.getElementById("div_mid").value=mid;
			 	if(showpid==str) div_fld.innerHTML="";	    
			 	var pidarr=pid.split(',');
			 	for(i=0;i<pidarr.length;i++)
			 	{
			 	    if(str==pidarr[i])  tablistNode.deleteRow(document.getElementById("tr_"+str+"_"+i+"").rowIndex);
			 	} 
			 	var delval="";//需要被删除的值
			 	for(i=0;i<objOption.Items.length;i++)
			 	{			 	
			 	    if(objOption.Items[i].Text==str) 
			 	    {
			 	     delval+=objOption.Items[i].Value+",";			 	   
			 	    }
			 	}
			 	var delarr=delval.split(',');//需要被删除对象数组
			 	for(i=0;i<delarr.length-1;i++)
			 	{
			 	    objOption.DeleteByVal(delarr[i]);
			 	}
			 	showFld="";//清掉显示字段
			 	for(i=0;i<objShowFld.Items.length;i++)
			 	{
			 	    if(objShowFld.Items[i].Text==str)
			 	    {
			 	       objShowFld.Items[i].Value="0";
			 	    }
			 	    if(objShowFld.Items[i].Value!="0")
			 	    {
			 	        showFld+=objShowFld.Items[i].Value+",";
			 	    }
			 	}
			 	var tabmidarr=tabmid.split(';');
			 	var tabnamearr=showTabName2.split(',');
			 	showTabName="";//清掉关联表
			 	tabmid="";
			 	var tabmidarr1="";
			    if(tabnamearr.length>0)
			    {
			 	    showTabName+=tabnamearr[0];
			 	    for(i=0;i<tabmidarr.length-1;i++)
			 	    {			 	
			 	        tabmidarr1=tabmidarr[i].split(',');
			 	         if(tabmidarr1[0]==str||tabmidarr1[1]==str)
			 	            {			 	        
			 	                tableRel.deleteRow(document.getElementById("tr2_"+tabmidarr1[0]+"_"+i).rowIndex);
			 	                tabmidarr[i]="0,0";//将去掉行所包含的MID清0	
			 	                tabnamearr[i+1]="0";	
			 	            }			 	   
    //			 	    if(tabmidarr[i]!="0,0")
    //			 	    {
			 	            tabmid+=tabmidarr[i]+";";//将删除的行所在的列MID删掉
    //			 	    }                    
                        if(tabnamearr[i+1]!="0")
                        {
                            showTabName+=tabnamearr[i+1];
                        }
			 	    }
			 	}			 	
			 	for(var i=0;i<searchobj.Items.length;i++)
			 	{
			 	    if(searchobj.Items[i].Tab==str)
			 	    {
			 	       // searchobj.Items[i].Value="0";	
			 	       searchobj.Deleteindex(i);				 	       	 	        
			 	    }
			 	}
			 	
			}

var showJS="";//计算列字段
function bindField(str1,str2)
{
 //document.getElementById("SelectField").value="["+str2+"."+str1+"]";
 //document.getElementById("txt_put").innerHTML+="["+str2+"."+str1+"]";
 
 var obj=document.getElementById("txt_put");
  if(obj.innerHTML!="") insertAtCursor(obj,str1);
  else{
    alert("请选择需要的计算方法！");
  }
}
var i=1;
function Show_FuncDiv()
{
    if(i%2!=0)    document.getElementById("div_func").style.display="block";
    else document.getElementById("div_func").style.display="none";
    i++;
}

function AddFunction(str)
{
    document.getElementById("txt_put").innerHTML+=str;
    
}
var showJS="";//计算列字段
var showBDS="";//计算列表达式
var asName="";//计算列字段别名
function Save_Field()
{
       if(document.getElementById("showfld").value=="")
       {
           alert("请输入列名！");
       }
       else
       {
        showJS+=document.getElementById("txt_put").innerText+" as '"+document.getElementById("showfld").value+"'|";
        showBDS+=document.getElementById("txt_put").innerText+"|";
        asName+=document.getElementById("showfld").value+",";

           var oOption = document.createElement("option");
		   document.getElementById("selectfld").options.add(oOption); 
		   oOption.innerText = document.getElementById("showfld").value.replace("|","").replace(";","");
		   document.getElementById("showfld").value="";
           document.getElementById("addvalue").value="";
           document.getElementById("txt_put").innerHTML="";		
       }
}
function bindData(str1,str2)
{
   var oOption = document.createElement("option");
   document.getElementById("selectfld").options.add(oOption); 
   oOption.innerText = str1;
   asName+=str1+",";
   showBDS+=str2+"|";

}
function Delete_Field()
{
    if(document.getElementById("selectfld").options.length>0)
    {
        for(var i=0;i<document.getElementById("selectfld").options.length;i++)
        {
            if(document.getElementById("selectfld").options[i].selected==true)
            {
                document.getElementById("selectfld").options.remove(i);
                var args=showBDS.split('|');
                args=args.slice(0,i).concat(args.slice(i+1));
				showBDS="";
				var endstr=args[length-1];
				for(var j=0;j<args.length-1;j++)
				{
				    showBDS+=args[j]+"|";
				}
				if(endstr!=null) showBDS+=endstr;
            }
        }
    }
   showJS="";
   asName="";
    //showBDS="";
}
function Edit_Click()
{
	if (document.getElementById("selectfld").options.length>0)
	{
		for (i=0;i<document.getElementById("selectfld").options.length;i++)
		{
			if(document.getElementById("selectfld").options[i].selected == true)
			{
				document.getElementById("showfld").value =  document.getElementById("selectfld").options[i].innerText;
				var args=showBDS.split('|');
				var args1=asName.split(',');
				if (args.length>0)
				{
					document.getElementById("txt_put").innerText=args[i];					
					document.getElementById("selectfld").options.remove(i);
					args=args.slice(0,i).concat(args.slice(i+1));
					showBDS="";
					var endstr=args[length-1];
					for(var j=0;j<args.length-1;j++)
					{
					    showBDS+=args[j]+"|";
					}
					args1=args1.slice(0,i).concat(args1.slice(i+1));	
					asName="";				
					var endstr1=args1[length-1];
					for(var j=0;j<args1.length-1;j++)
					{
					    asName+=args1[j]+",";
					}
					if(endstr!=null) showBDS+=endstr;
				}
			}
		}
	}
	else
	{
		alert('没有数据列可编辑！');
	}
}
function Clear_Field()
{
    document.getElementById("showfld").value="";
    document.getElementById("addvalue").value="";
    document.getElementById("txt_put").innerHTML="";
}
function insertValue()
{
    var obj1=document.getElementById("txt_put");
    if(document.getElementById("addvalue").value!=""){
    insertAtCursor(obj1,document.getElementById("addvalue").value);
    }
    else{
    alert("请输入值！");
    }

}
function insertAtCursor(el,myValue)
{
   if (document.selection) { 
        el.focus(); 
        sel = document.selection.createRange(); 
        sel.pasteHTML(myValue)
    }
}
function searchBegin(){

//window.open('pop_1244_3.aspx?fld='+showFld+'&tabname='+showTabName+'&filter='+showCondition);
window.open('pop_1244_3.aspx?id='+form1.modid.value);
}
</script>
<script language="javascript">
function saveThis()
{


         showConTxt="";
         showConVal="";
         for(var i=0;i<searchobj.Items.length;i++)
         {
            showConVal+=searchobj.Items[i].Value+"|";
            showConTxt+=searchobj.Items[i].Text+",";
         }
    document.getElementById("div_field").value=pid_filed;
    document.getElementById("div_showfld").value=showFld;
    document.getElementById("div_showsort").value=showSort;
    document.getElementById("div_reltab").value=showTab;
    document.getElementById("div_showconval").value=showConVal;
    document.getElementById("div_showcontxt").value=showConTxt;
    document.getElementById("div_asname").value=asName;
    document.getElementById("div_biaodashi").value=showBDS;
    __doPostBack('btn_save','');
}
</script>
</div>

</form>

</body>
</html>
