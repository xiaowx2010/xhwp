<!--大气质量监测信息,列表页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{    
     
    SetToolBar();//设置工具条,同时获取固定URL参数 
    list.SqlStr = "select  '" + StringUtility.StringToBase64("view") + "'," + mid + ",mocode," + navindex + ",fld_36_1,fld_36_2,fld_36_3,fld_36_4,'&nbsp;' btnstr from gmis_mo_36 order by mocode desc";
    list.Rows = GetListRows();   
    
}
public override void BeforeOutput(DataTable dt, int rowi)
{	//处理当前页数据

    DataRow dr = dt.Rows[rowi];
    if (mua.IndexOf(";3;") != -1)
    {
        dr["btnstr"] += "<a href=\"getpage.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "\"><img src=\"images/icons/tb02.gif\" title=\"编辑\" align=\"absmiddle\" border=\"0\"></a>";
    }

    if (mua.IndexOf(";4;") != -1)
    {
        dr["btnstr"] += "<a href=\"javascript:if(confirm('确认删除吗！')){document.location='getpage.aspx?aid=" + StringUtility.StringToBase64("delete") + "&mid=" + mid + "&id=" + dr["mocode"].ToString() + "&navindex=" + navindex + "';}\"><img src=\"images/icons/tb03.gif\" title=\"删除\" align=\"absmiddle\" border=\"0\"></a>";
    }


}
//读取文件
private void GetFileData()
{
    string sqlstr = "";
    salert.InnerText = "";
    if (UpLoadFile(upfile, "dqjc.txt").IndexOf("成功") != -1)
    {
        string _filename = Server.MapPath("doc/") + "dqjc.txt";
        //Response.Write(_filename);

        if (!File.Exists(_filename))
        {
            Response.Write("{0} does not exist." + _filename);
            return;
        }
        else
        {
            //读取文件
            using (StreamReader sr = new StreamReader(_filename, System.Text.Encoding.Default, false))
            {
                String input;
                int num = 0;
                //循环检索
                string h_mocode = "0";
                while ((input = sr.ReadLine()) != null)
                {
                    string loggerid ="",loggername="",interval="";
                    if (input.IndexOf("Logger Id") != -1)
                    {
                        num++;
                        loggerid = input.Substring(input.IndexOf("Logger Id :"), input.IndexOf("Logger Name") - input.IndexOf("Logger Id :")).Replace("Logger Id :", "").Trim();
                        loggername = input.Substring(input.IndexOf("Logger Name :"), input.IndexOf("Interval") - input.IndexOf("Logger Name :")).Replace("Logger Name :", "").Trim();
                        interval = input.Substring(input.IndexOf("Interval :"), input.Length - input.IndexOf("Interval :")).Replace("Interval :", "").Trim();
                        db.SqlString="select mocode from gmis_mo_36 where fld_36_1='"+loggerid+"' and fld_36_2='"+loggername+"' and fld_36_3='"+interval+"' and fld_36_4='"+DateTime.Now.ToShortDateString()+"'";
                        
                        DataTable dt_temp=db.GetDataTable();
                        if (dt_temp == null || dt_temp.Rows.Count == 0)
                        {

                            sqlstr += "insert into gmis_mo_36 (CreatorCode,fld_36_1,fld_36_2,fld_36_3,fld_36_4) values (" + GetUID() + ",'" + loggerid + "','" + loggername + "','" + interval + "','" + DateTime.Now.ToShortDateString() + "');SELECT @@IDENTITY AS 'MoCode'; DECLARE @MoID" + num + " int; SELECT @MoID" + num + "=@@IDENTITY ; ";
                        }
                        else
                        {
                            h_mocode = dt_temp.Rows[0][0].ToString();
                            
                        }
                       // Response.Write(h_mocode);
                    }

                    if (input.Split('/').Length == 3 && input.Split(':').Length == 2)
                    {
                        string value = "";

                        string[] strs = input.Trim().Split(' ');
                        int count = 0;
                        for (int i = 0; i < strs.Length; i++)
                        {

                            if (strs[i].ToString() != "")
                            {

                                count++;
                                //if(count<15)
                                //{
                                if (strs[i].ToString().IndexOf("/") != -1)
                                    value += "'20" + strs[i].ToString().Split('/')[2] + "-" + strs[i].ToString().Split('/')[0] + "-" + strs[i].ToString().Split('/')[1];
                                else if (strs[i].ToString().IndexOf(":") != -1)
                                    value += " " + strs[i].ToString() + "',";
                                else
                                    value += "'" + strs[i].ToString() + "',";
                                //}

                            }
                        }

                        value = value.Trim(',');
                        if (value.Split(',').Length > 13)
                            value = value.Substring(0, value.LastIndexOf(","));

                        if (h_mocode == "0")
                            sqlstr += "insert into gmis_mo_1204 (CreatorCode,fld_1204_1,fld_1204_2,fld_1204_3,fld_1204_4,fld_1204_5,fld_1204_6,fld_1204_7,fld_1204_8,fld_1204_9,fld_1204_10,fld_1204_11,fld_1204_12,fld_1204_13,fld_1204_14) values (" + GetUID() + "," + value + ",@MoID" + num + ");";
                        else
                        {
                            string[] h_strs = value.Trim(',').Split(',');
                            string fieldvalue = "";
                            for (int n = 0; n < h_strs.Length; n++)
                            {
                                fieldvalue += "fld_1204_" + (n + 1) + "=" + h_strs[n].ToString() + ",";
                            }
                            sqlstr += "update gmis_mo_1204 set CreatorCode="+GetUID()+","+fieldvalue.Trim(',')+",fld_1204_14="+h_mocode+" where fld_1204_1="+h_strs[0].ToString()+" and fld_1204_14="+h_mocode;
                        }
                    }


                }
                if (sqlstr != "")
                {
                    db.SqlString = "begin " + sqlstr + " end";
                    
                    salert.InnerText=db.TransUpdate();
                    
                }
                  Page.RegisterStartupScript("", "<script language='javascript'>window.opener['location'].reload();" + "</sc" + "ript>");
            }
        }
    }

}
private void InsertData_Click(object sender, System.EventArgs e)
{
    GetFileData();
}
//文件上传
public string UpLoadFile(HtmlInputFile file, string filename)
{
    string exeinfo = "";
    if (file.PostedFile != null)
    {
        try
        {
            file.PostedFile.SaveAs(Server.MapPath("/admin/doc/" + filename));
            exeinfo = "上传成功！";
        }
        catch (Exception e)
        {
            return e.Message;
        }

    }
    else
    {
        exeinfo = "文件错误！";
    }

    return exeinfo;
}
</script>
<body style="padding:10px;text-align:center">
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<!--动态生成html,开始-->
<G:ListTable ID="list" Rows="20" IsProPage=true runat="server">
	<G:Template id="listtemphead" type="head" runat="server">
		<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="righttableline">
		<tr class="tr_listtitle" align="left">
			<td >Logger Id</td>
			<td >Logger Name</td>
			<td >Interval</td>
			<td >导入时间</td>
			<td width="5%" align="center">操作</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp1" runat="server">
		<tr class="tr_listcontent">
			<td><a href="view_36.aspx?aid=*&mid=*&id=*&navindex=*">*</a>&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td>*&nbsp;</td>
			<td align="center">*&nbsp;</td>
		</tr>
	</G:Template>
	<G:Template id="listtemp2" runat="server">
		<tr class="tr_listcontent">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</G:Template>
	<G:NavStyle5 ID="NavStyle" PageUrl="list_36.aspx" runat="server"></G:NavStyle5>
	</G:ListTable> 
<!--动态生成html,结束-->
<!--#include file="toolbarleft.aspx"-->
<td style="padding-left:5px;" nowrap>
    <input id="upfile" type="file" style="width:240px;" runat="server" />
		<input id="dataclick" type="button" value="导入大气监测数据" onserverclick="InsertData_Click" runat="server" />
</td>
<td><span id="salert" style="color:Red;" runat="server"></span></td>
<!--#include file="toolbarright.aspx"--> 
</form>
</body>
</html>
