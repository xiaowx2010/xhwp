<!--查询编辑页,列表页-->
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
<script language="C#" runat="server">
    StringBuilder sb = new StringBuilder();
    private void Page_Load(object sender, System.EventArgs e)
    {
        //Response.Write(sel_date.Value);
        if (sel_date.Value=="")
            sel_date.Value = DateTime.Now.ToShortDateString();
        sb.Append("<tr class=\"tr_listcontent\" >\n<td>二氧化硫</td>\n<td>&nbsp;" + getValue("fld_1204_2") + "</td>\n</tr>\n");
        sb.Append("<tr class=\"tr_listcontent\" >\n<td>二氧化氮</td>\n<td>&nbsp;" + getValue("fld_1204_3") + "</td>\n</tr>\n");
        sb.Append("<tr class=\"tr_listcontent\" >\n<td>可吸入颗粒物</td>\n<td>&nbsp;" + getValue("fld_1204_8") + "</td>\n</tr>\n");
    }
    private string getValue(string _field)
    {
        string h_date = "";
        if (sel_date.Value != "")
            h_date = sel_date.Value;
        db.SqlString = "select fld_1204_14 from gmis_mo_1204 where (Cast(datepart(year,createdate) as varchar(50))+'-'+Cast(datepart(month,createdate) as varchar(50))+'-'+Cast(datepart(day,createdate) as varchar(50)))='" + h_date + "' group by fld_1204_14";
        DataTable dt = db.GetDataTable();
        double h_value = 0;
        if (dt != null && dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                db.SqlString = "select " + _field + ",fld_1204_14 from gmis_mo_1204 where fld_1204_14=" + dr[0].ToString();
                DataTable dt_temp = db.GetDataTable();
                double h_value1 = 0;
                if (dt_temp != null && dt_temp.Rows.Count > 0)
                {
                    foreach (DataRow row in dt_temp.Rows)
                    {
                        if (row[0].ToString() != "")
                        {

                            if (row[0].ToString().IndexOf(".") == 0)
                                row[0] = "0" + row[0].ToString();
                            h_value1 += Math.Round(Convert.ToDouble(row[0].ToString()), 3);
                        }
                    }
                }
                h_value += Math.Round(h_value1 / 24,3);//某一检测点24小时平均值
            }
        }
        
        return Math.Round(h_value/3,3).ToString();
    }
    private void btn_ServerClick(object sender, EventArgs e)
    {
        
    }
</script>

<body>
<form id="form1" runat="server">
<!--选项卡-->
<input id="btn" type="button" style="display:none;" runat="server" onserverclick="btn_ServerClick" />
<!--选项卡-->
<!--动态生成html,开始-->

    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <img src="images/tcy_001.jpg" width="600" height="100">
            </td>
        </tr>
    </table>
    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="424" valign="top" background="images/tcy_002.jpg" style="padding: 40px 30px 0px 30px;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr><td style="color:#20554E; font-size:14;" align="center">大气质量监测数据</td></tr>
                    <tr><td nowrap align="center">
                        日期:<input id="sel_date" style="width: 100px; border:0;" readonly="readonly" runat="server" />
                        <div id="div_GetDatesel_date" style="position:absolute;"></div>
                        <script language="javascript">
                        <!--
                        var cd_GetDatesel_date = CreateDate("div_GetDatesel_date","swf_ChoseDatesel_date","left",1)
                        function swf_ChoseDatesel_date_DoFSCommand(command, args)
                        {
	                        if(command == "showdate")
	                        {
		                         showChoseDate(cd_GetDatesel_date,args);
	                        }
	                        else if(command == "date")
	                        {
		                         document.getElementById("sel_date").value = args;
		                         closeChoseDate(cd_GetDatesel_date);
		                         //window.location="/admin/pop_map_mission.aspx?de="+args
		                         __doPostBack('','');//回发的客户端脚本
	                        }
                        }
                        //-->
                        </script>
                        <SCRIPT LANGUAGE="VBScript">
                        Sub swf_ChoseDatesel_date_FSCommand(ByVal cmd, ByVal args)
                        call swf_ChoseDatesel_date_DoFSCommand(cmd, args)
                        end sub
                        </SCRIPT>
                    
                    </td></tr>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="righttableline1">
                    <tr class="tr_listtitle1" style="background-color:#8DD4CA;color:#20554E;" align="left">
                        <td width="80%">
                            名称
                        </td>
                        <td width="20%">
                            排放值
                        </td>
                    </tr>
                    <%=sb.ToString() %>
                </table>
            </td>
        </tr>
    </table>
    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="36" bgcolor="#2ee3db">
                &nbsp;
            </td>
        </tr>
    </table>


</form>
</body>
</html>
