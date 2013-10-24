<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<link rel="stylesheet" type="text/css" href="wf.css">
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	<script type="text/javascript">
    function clickGuide()
    {
        var navwidth=window.parent.document.getElementById("nav").offsetWidth;
        
        if(navwidth==7)
        {
             window.parent.frames(1).location="nav.aspx?closed=0";
             window.parent.document.getElementById("mainset").cols = "257,*";
        }
        else
        {
             window.parent.frames(1).location="nav.aspx?closed=1";
             window.parent.document.getElementById("mainset").cols = "7,*";
        }
       
    }
    </script>
</HEAD>
<!--#include file="func.aspx"-->
<!--#include file="shweather_func.aspx"-->
<script language="C#" runat="server">
string p_today = "", p_day = "", logintimes = "";
private void Page_Load(object sender, System.EventArgs e)
{
    
//徐汇环保个人桌面
    SetSESSION("guangye", "1");
	p_today = DateTime.Now.Date.ToString().Substring(0, 10);
    p_day = DateTime.Today.ToLongDateString() + "  星期" + dayinweek();
td_date.InnerHtml="今天是:"+p_day;
    if (!IsPostBack)
    {
        BindListControl(quyu, "fld_1201_6", "fld_1201_1", "select distinct fld_1201_1,fld_1201_6 from gmis_mo_1201", "选择区域");
        BindListControl(hangyeleibie, "fld_1200_8", "fld_1200_1", "select distinct fld_1200_1,fld_1200_8 from gmis_mo_1200 where fld_1200_3=1 and fld_1200_2=1", "行业类别");
        SetFilter(quyu, "0");
        SetFilter(hangyeleibie, "0");
    }
    //全行业查询模版列表
    mid="1241";
    grid_1241.SqlStr="select top 4 mocode, fld_1241_1,(case when len(fld_1241_1)>17 then left(fld_1241_1,17)+'...' else fld_1241_1 end) from "+GetModuleTableName(mid)+" order by createdate desc ";
    //污染源普查模式
    mid="1244";
    grid_1244.SqlStr="select top 4 mocode, fld_1244_1,(case when len(fld_1244_1)>17 then left(fld_1244_1,17)+'...' else fld_1244_1 end) from "+GetModuleTableName(mid)+" order by createdate desc ";
	
	grid_88.SqlStr="select top 6 mocode,fld_1260_1,fld_1260_1 as title from gmis_mo_1260 order by fld_1260_71 desc";
}
//获取星期的中文显示
private string dayinweek()
{
	switch (DateTime.Today.DayOfWeek.ToString())
	{
		case "Monday":
			return "一";
			break;
		case "Tuesday":
			return "二";
			break;
		case "Wednesday":
			return "三";
			break;
		case "Thursday":
			return "四";
			break;
		case "Friday":
			return "五";
			break;
		case "Saturday":
			return "六";
			break;
		case "Sunday":
			return "日";
			break;
		default:
			return "";
			break;
	}
}

//搜索按钮事件
    private void Click_Search(object sender, System.EventArgs e)
    {
        string filter = "";
        //区域
        if (guangye.GetControlValue(quyu) != "0")
        {
            filter += " and xiangzhen='" + guangye.GetControlValue(quyu) + "'";
        }
        //搜索关键字
        if (((Control)sender).ID.ToLower() == "search_name")
        {

            filter += " and ziduan='fld_1202_1' and guanjianzi='" + guangye.GetControlValue(qiyename) + "'";
        }
        else if (((Control)sender).ID.ToLower() == "search_code")
        {
            filter += " and ziduan='fld_1202_2' and guanjianzi='" + guangye.GetControlValue(qiyecode) + "'";
        }

        SetSESSION("filter", filter);
        if (guangye.GetControlValue(hangyeleibie) != "0")//行业类别
        {
            Page.RegisterStartupScript("popwin", "<sc" + "ript>" + "window.parent.frames(1).location=\"nav.aspx?closed=0&mid=" + guangye.GetControlValue(dalei) + "&pid=1199&hyid=" + guangye.GetControlValue(hangyeleibie) + "\";window.parent.document.getElementById('mainset').cols = '257,*';window.location.href=\"list_1199.aspx?mid=1199&hycode=" + StringUtility.StringToBase64(guangye.GetControlValue(hangyeleibie)) + "&navindex=0\"" + "</" + "script>");
        }
        else//行业大类
        {
            Page.RegisterStartupScript("popwin", "<sc" + "ript>" + "window.parent.frames(1).location='nav.aspx?closed=0&mid=" + guangye.GetControlValue(dalei) + "&pid=1199&hyid=" + guangye.GetControlValue(dalei) + "';window.parent.document.getElementById('mainset').cols = '257,*';window.location.href=\"list_1199.aspx?mid=1199&hycode=" + StringUtility.StringToBase64(guangye.GetControlValue(dalei)) + "&navindex=0\"" + "</" + "script>");
        }
    }

    //大类联动
    private void changedalei(object sender, System.EventArgs e)
    {
        if (dalei.SelectedItem != null && dalei.SelectedItem.Value != "0")
        {
            BindListControl(hangyeleibie, "fld_1200_8", "fld_1200_1", "select distinct fld_1200_1,fld_1200_8 from gmis_mo_1200 where fld_1200_3=1 and fld_1200_2=" + dalei.SelectedItem.Value + "", "行业类别");
            SetFilter(hangyeleibie, "0");
        }
    }
    
    
     
</script>



<body>
<form id="from_0" runat="server">
<div id="container">
  <table width="986"  border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:20px; ">
    <tr>
      <td width="10"><img src="images/default_004.GIF" width="10" height="36"></td>
      <td bgcolor="#F2F2F2"><table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_000000">
        <tr>
          <td width="59" align="left"><a href="javascript:clickGuide()"><img src="images/default_006.GIF" width="44" height="22" border="0"></a></td>
          <td width="216" align="left" id="td_date" runat="server">今天是:2009年7月15日 星期三 </td>

        </tr>
      </table></td>
      <td width="10"><img src="images/default_005.GIF" width="10" height="36"></td>
    </tr>
  </table>
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font1225_000000" style="margin:7px 0; ">
    <tr>
      <td width="97" align="right" class="font1430B_000000">通知公告</td>
      <td align="left">
          <div style="width: 764px; height: 25px; overflow: hidden; margin: 5px auto;">
              <div id="div_tongzhigonggao" style="background-color: Transparent; vertical-align: bottom;
                  height: 25px; margin-left: 0;">
              </div>

             

              <script language="javascript">
					  CreateControl("div_tongzhigonggao","NewsRoll","images/NewsRoll.swf?mode=2&dataroot=data_tongzhigonggao.aspx&color=333333&hover=EC0202&win=_blank&line=1&head=&bg=AA049366.jpg&width=764&height=25",764,25, "#FFFFFF");
              </script>

              <script language="VBScript">
					Function VBGetSwfVer(i)
					 on error resume next
					 Dim swControl, swVersion
					 swVersion = 0

					 set swControl = CreateObject("ShockwaveFlash.ShockwaveFlash." + CStr(i))
					 if (IsObject(swControl)) then
						  swVersion = swControl.GetVariable("$version")
					 end if
						 VBGetSwfVer = swVersion
					End Function
              </script>

          </div>
      </td>
    </tr>
  </table>
  <table width="986" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr align="center" valign="top">
      <td width="589"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#d4d4d4" style="margin-bottom:10px; ">
        <tr>
          <td align="center" valign="top" bgcolor="#fafafa"><table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-bottom:9px; ">
            <tr>
              <td width="128"><img src="images/default_008.GIF" width="128" height="39"></td>
              <td background="images/default_009.GIF">&nbsp;</td>
              <td width="9"></td>
            </tr>
          </table>
            <table width="559" height="7" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="7" height="7"><img src="images/default_010.GIF" width="7" height="7"></td>
                <td width="545" background="images/default_014.GIF"></td>
                <td width="7" height="7"><img src="images/default_011.GIF" width="7" height="7"></td>
              </tr>
            </table>
            <table width="559" height="133" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="1" bgcolor="#cecece"></td>
                <td width="557" align="center" bgcolor="#f2f2f2"><table width="90%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="left" class="font1430B_646464">快速查询:</td>
                  </tr>
                </table>
                  <table width="90%"  border="0" cellspacing="0" cellpadding="0" style="margin:5px  0;">
                    <tr>
                      <td align="left">
                      <asp:DropDownList runat="server" ID="dalei" AutoPostBack="true" OnSelectedIndexChanged="changedalei" Width="157px">
                      <asp:ListItem Value="1">工业源</asp:ListItem>
                      <asp:ListItem Value="2">生活源</asp:ListItem>
                      <asp:ListItem Value="3">集中式污染治理设施</asp:ListItem>
                      </asp:DropDownList>
                      </td>
                      <td align="center"><asp:DropDownList runat="server" ID="quyu" Width="157px"></asp:DropDownList></td>
                      <td align="right"><asp:DropDownList runat="server" ID="hangyeleibie" Width="157px"></asp:DropDownList></td>
                    </tr>
                  </table>
                  <table width="90%"  border="0" cellpadding="0" cellspacing="0" class="font1225_000000" style="margin:5px  0;">
                    <tr>
                      <td width="62" align="center">企业名称</td>
                      <td width="250" align="left"><input id="qiyename" runat="server" type="text" name="textfield" style="width:228px; "></td>
                      <td align="left"><asp:LinkButton ID="search_name" runat="server" OnClick="Click_Search"><img src="images/default_015.GIF" width="60" height="22" border="0"></asp:LinkButton></td>
                    </tr>
                  </table>
                  <table width="90%"  border="0" cellpadding="0" cellspacing="0" class="font1225_000000" style="margin:5px  0;">
                    <tr>
                      <td width="62" align="center">企业代码</td>
                      <td width="250" align="left"><input id="qiyecode" runat="server" type="text" name="textfield" style="width:228px; "></td>
                      <td align="left"><asp:LinkButton ID="search_code" runat="server" OnClick="Click_Search"><img src="images/default_015.GIF" width="60" height="22" border="0"></asp:LinkButton></td>
                    </tr>
                  </table></td>
                <td width="1" bgcolor="#cecece"></td>
              </tr>
            </table>
            <table width="559" height="7" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:9px; ">
              <tr>
                <td width="7" height="7"><img src="images/default_012.GIF" width="7" height="7"></td>
                <td width="545" background="images/default_016.GIF"></td>
                <td width="7" height="7"><img src="images/default_013.GIF" width="7" height="7"></td>
              </tr>
            </table>
            <table width="559" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="anniu_1435B_646464" id="td_search_1" onmouseover="Change_Modern('1')">全行业自定义高级查询</td>
                <td class="anniu_1435_646464" id="td_search_2" onmouseover="Change_Modern('2')">污染源普查查询模式</td>
                <td background="images/default_019.GIF">&nbsp;</td>
              </tr>
            </table>
            <script language="javascript">
            function Change_Modern(str)
            {
                for(var i=1;i<3;i++)
                {
                if(i==str)
                {
                    document.getElementById("div_search_"+i).style.display="block";
                    document.getElementById("td_search_"+i).className="anniu_1435B_646464";
                } 
                else 
                {
                     document.getElementById("div_search_"+i).style.display="none";
                    document.getElementById("td_search_"+i).className="anniu_1435_646464";
                }  
                }            
            }
            </script>
            <div id="div_search_1" style="display:block" >
            <table width="559" height="104" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="1" bgcolor="#cecece"></td>
                <td width="557" align="center" bgcolor="#f2f2f2"><table width="90%"  border="0" cellspacing="0" cellpadding="0" style="margin:5px 0; ">
                  <tr>
                      <td align="left">自定义模板 <img src="images/default_026.GIF" width="5" height="3"></td>
                    <td width="220" align="left"><a href="list_1241.aspx"><img src="images/default_020.GIF" width="196" height="24" border="0"></a></td>
                    </tr>
                </table>
                  <table width="90%" height="1"  border="0" cellpadding="0" cellspacing="0"  style="margin:5px 0; ">
                    <tr>
                      <td bgcolor="#bdbdbd"></td>
                      </tr>
                  </table>
                  <!--查询模版开始-->
                  <G:grid id="grid_1241" runat="server" itemstyle="width:270px" rows="2" clearbyhtml="true" cols="2" exactcount="true" showallline="true">
                  <G:template id="temp_1241" runat="server">
                  <table width="90%"  border="0" cellpadding="0" cellspacing="0" class="font1225_000000">
                    <tr align="left">
                      <td  width="270"><span class="font1225_ff0000">·</span><a href="list_1241.aspx?id=*" title="*"> *</a></td>
                    </tr>
                  </table>
                  </G:template>
                  </G:grid>
                  <!--查询模版结束--></td>
                <td width="1" bgcolor="#cecece"></td>
              </tr>
            </table>
            </div>
            <div id="div_search_2" style="display:none" >
            <table width="559" height="104" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="1" bgcolor="#cecece"></td>
                <td width="557" align="center" bgcolor="#f2f2f2"><table width="90%"  border="0" cellspacing="0" cellpadding="0" style="margin:5px 0; ">
                  <tr>
                      <td align="left">自定义模板 <img src="images/default_026.GIF" width="5" height="3"></td>
                    <td width="220" align="left"><a href="list_1244.aspx"><img src="images/default_cxms.gif" width="196" height="24" border="0"></a></td>
                    </tr>
                </table>
                  <table width="90%" height="1"  border="0" cellpadding="0" cellspacing="0"  style="margin:5px 0; ">
                    <tr>
                      <td bgcolor="#bdbdbd"></td>
                      </tr>
                  </table>
                  <!--查询模版开始-->
                  <G:grid id="grid_1244" runat="server" itemstyle="width:270px" rows="2" clearbyhtml="true" cols="2" exactcount="true" showallline="true">
                  <G:template id="temp_1244" runat="server">
                   <table width="90%"  border="0" cellpadding="0" cellspacing="0" class="font1225_000000">
                    <tr align="left">
                      <td  width="270"><span class="font1225_ff0000">·</span><a href="list_1244.aspx?id=*" title="*"> *</a></td>
                    </tr>
                  </table>
                  </G:template>
                  </G:grid>
                  <!--查询模版结束--></td>
                <td width="1" bgcolor="#cecece"></td>
              </tr>
            </table>
            </div>
            <table width="559" height="7" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:9px; ">
              <tr>
                <td width="7" height="7"><img src="images/default_012.GIF" width="7" height="7"></td>
                <td width="545" background="images/default_016.GIF"></td>
                <td width="7" height="7"><img src="images/default_013.GIF" width="7" height="7"></td>
              </tr>
            </table></td>
        </tr>
      </table>
        <table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#d4d4d4">
          <tr>
            <td align="left" bgcolor="#627c9d" class="font1427B_ffffff" style="padding-left:12px; ">数据查看入口</td>
          </tr>
          <tr>
            <td height="102" align="center" bgcolor="#fafafa">
			<TABLE border=0 cellSpacing=0 cellPadding=0 width="95%">
              <TBODY>
              <TR>
                <TD align=left>
				
				<table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><a href="list_1199.aspx?mid=1199&hycode=1&t=1" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=1&pid=1199&hyid=1';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/tu_01.gif" width="64" height="27" border="0"></a></td>
                    <td><img src="images/tu_02.gif" width="117" height="27"></td>
                  </tr>
                </table>
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/tu_03.gif" width="181" height="23"></td>
                    </tr>
                  </table>
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/tu_04.gif" width="117" height="27"></td>
                      <td><a href="list_0.aspx?mid=1262" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=1262&pid=1261&hyid=0';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/tu_05.gif" width="64" height="27" border="0"></a></td>
                    </tr>
                  </table>
				  
				  </TD>
                <TD align=middle>
				
				<table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><a href="list_1199.aspx?mid=1199&hycode=2&t=1" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=2&pid=1199&hyid=2';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/tu_06.gif" width="64" height="27" border="0"></a></td>
                    <td><img src="images/tu_07.gif" width="117" height="27"></td>
                  </tr>
                </table>
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/tu_08.gif" width="181" height="23"></td>
                    </tr>
                  </table>
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/tu_09.gif" width="117" height="27"></td>
                      <td><a href="list_0.aspx?mid=1263" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=1263&pid=1261&hyid=0';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/tu_10.gif" width="64" height="27" border="0"></a></td>
                    </tr>
                  </table>
				
				</TD>
                <TD align=right>
				
				<table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td><a href="list_1199.aspx?mid=1199&hycode=3&t=1" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=3&pid=1199&hyid=3';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/tu_11.gif" width="64" height="27" border="0"></a></td>
                    <td><img src="images/tu_12.gif" width="117" height="27"></td>
                  </tr>
                </table>
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/tu_13.gif" width="181" height="23"></td>
                    </tr>
                  </table>
                  <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/tu_14.gif" width="117" height="27"></td>
                      <td><a href="list_0.aspx?mid=1264" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=1262&pid=1261&hyid=0';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/tu_15.gif" width="64" height="27" border="0"></a></td>
                    </tr>
                  </table>
				
				</TD>
              </TR></TBODY></TABLE>
			
			<%--<table width="95%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><a href="list_1199.aspx?mid=1199&hycode=1&t=1" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=1&pid=1199&hyid=1';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/default_021.GIF" width="181" height="77" border="0"></a></td>
                <td align="center"><a href="list_1199.aspx?mid=1199&hycode=2&t=1" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=2&pid=1199&hyid=2';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/default_022.GIF" width="181" height="77" border="0"></a></td>
                <td align="right"><a href="list_1199.aspx?mid=1199&hycode=3&t=1" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=3&pid=1199&hyid=3';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/default_023.GIF" width="181" height="77" border="0"></a></td>
              </tr>
            </table>---%></td>
          </tr>
        </table></td>
      <td width="9"></td>
      <td width="388"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#d4d4d4">
        <tr>
          <td align="left" bgcolor="#627c9d" class="font1427B_ffffff" style="padding-left:12px; ">徐汇区建设项目环保审批管理信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="list_1260.aspx?aid=bGlzdA==&mid=1260&id=0&navindex=0&pid=0&fcode=" title="详细" style="cursor:hand;">【详细】</a></td>
        </tr>
        <tr>
          <td height="102" align="center" bgcolor="#fafafa"><table width="100%" height="8"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td></td>
            </tr>
          </table>
            <table width="370" height="7" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="7" height="7"><img src="images/default_010.GIF" width="7" height="7"></td>
              <td width="356" background="images/default_014.GIF"></td>
              <td width="7" height="7"><img src="images/default_011.GIF" width="7" height="7"></td>
            </tr>
          </table>
		  
            <table width="370" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="1" bgcolor="#cecece"></td>
                <td width="368" align="center" bgcolor="#f2f2f2"><div style="width:365px; height:95px; overflow:hidden; ">
				<G:Grid ID="grid_88"  contentfield="title" exactcount="true" showchars="11" runat=server ShowAllLine=false Rows="3" Cols="2" Alert="<span style='color:red'>暂无信息</span>">
                                        <g:template id="temp_88" runat=server>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="font1225_000000" >
                                                <tr>
												<td align="left"><span class="font1225_ff0000">·</span> <a href="view_1260.aspx?aid=dmlldw==&mid=1260&id=*" title="*" style="cursor:hand;" target=_blank>*</a></td>
                                                </tr>
                                            </table>
                                            </g:template>
                                            </G:Grid>
				</div></td>
                <td width="1" bgcolor="#cecece"></td>
              </tr>
            </table>
            <table width="370" height="7" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:9px; ">
              <tr>
                <td width="7" height="7"><img src="images/default_012.GIF" width="7" height="7"></td>
                <td width="356" background="images/default_016.GIF"></td>
                <td width="7" height="7"><img src="images/default_013.GIF" width="7" height="7"></td>
              </tr>
            </table>
            <table width="370" height="7" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="7" height="7"><img src="images/default_010.GIF" width="7" height="7"></td>
                <td width="356" background="images/default_014.GIF"></td>
                <td width="7" height="7"><img src="images/default_011.GIF" width="7" height="7"></td>
              </tr>
            </table>
            <table width="370" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="1" bgcolor="#cecece"></td>
                <td width="368" align="center" bgcolor="#f2f2f2"><table width="90%"  border="0" cellpadding="0" cellspacing="0" class="font1220_000000" style="margin:0px 0; ">
                  <tr>
                    <td align="left" width=200 class="anniu_1435B_646464a" onclick="set_flash('1215')" id="menu_1215">污染物分类按年度对比</td>
                    <%--<td>|</td>
                    <td align="center" onclick="set_flash('1224')" id="menu_1224">工业用水量统计</td>
                    <td align="center">|</td>
                    <td align="center" onclick="set_flash('1226')" id="menu_1226">工业固体废物统计</td>--%>
                    <td width="60" align="right"><a href="list_1390.aspx?aid=bGlzdA==&mid=1390&id=0&navindex=0&pid=0&fcode=" title="详细" style="cursor:hand;">【详细】</a></td>
                  </tr>
                </table>
                  <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-bottom:10px; ">
                    <tr>
                      <td>
                          <div id="chartdiv" style="width: 368px; height: 280px;">
                              <div id="div_1215" style="display: none;">
                                  <%--工业能源消费统计1215--%>
                                 <%-- <iframe id="frame1215" runat="server" src="data_1215.aspx" width="368" scrolling="yes" height="295"  frameborder="0"></iframe>--%>
                              </div>
                              <div id="div_1224" style="display: none;">
                                  <%--工业用水量统计1224--%> 
                                  <iframe id="Iframe1" runat="server" src="data_1224.aspx" width="368" height="295" scrolling="no" frameborder="0"></iframe>
                              </div>
                              <div id="div_1226" style="display: none;">
                                  <%--工业固体废物统计1226--%>
                                  <iframe id="Iframe2" runat="server" src="data_1226.aspx" width="368" height="295" scrolling="no" frameborder="0"></iframe>
                              </div>
                              <div id="div_1390">
                                  <%--新旧对比1390--%>
                                  <iframe id="Iframe3" runat="server" src="data_1390.aspx" width="368" height="295" scrolling="no" frameborder="0"></iframe>
                              </div>
                          </div>
                      </td>
                    </tr>
                  </table>
                  <script>
                   function set_flash(args)
                   {
                        //document.getElementById("div_1215").style.display="none";
                        document.getElementById("div_1224").style.display="none";
                        document.getElementById("div_1226").style.display="none";
                        document.getElementById("div_"+args).style.display="block";
                        
                        //document.getElementById("menu_1215").className="font1220_000000";
                        document.getElementById("menu_1224").className="font1220_000000";
                        document.getElementById("menu_1226").className="font1220_000000";
                        document.getElementById("menu_"+args).className="anniu_1220_000000";
//                        document.getElementById("chartdiv").innerHTML=document.getElementById("div_"+args).innerHTML;
                   }
                   //set_flash("1215")
                  // set_flash("1224")
                  </script>
                </td>
                <td width="1" bgcolor="#cecece"></td>
              </tr>
            </table>
            <table width="370" height="7" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:9px; ">
              <tr>
                <td width="7" height="7"><img src="images/default_012.GIF" width="7" height="7"></td>
                <td width="356" background="images/default_016.GIF"></td>
                <td width="7" height="7"><img src="images/default_013.GIF" width="7" height="7"></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="986"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" style="margin-top:10px; ">
    <tr>
      <td height="43" align="center" valign="middle" bgcolor="#fafafa" class="font1225_000000">主办单位:徐汇区环境保护局&nbsp;&nbsp;&nbsp;&nbsp;技术支持:上海雨和信息技术有限公司</td>
    </tr>
  </table>
</div>
</form>
</body>
</html>
