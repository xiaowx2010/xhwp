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
string p_today = "", p_day = "", logintimes = "", h_qiyejibenxinxibiao = "";
double p_eryanghualiu = 0, p_eryanghuadan = 0, p_kxkeliwu = 0;
private void Page_Load(object sender, System.EventArgs e)
{
	p_today = DateTime.Now.Date.ToString().Substring(0, 10);
    p_day = DateTime.Today.ToLongDateString() + "  星期" + dayinweek();

	//大气质量检测
    id = "36";
    db.SqlString = "select sum(cast(fld_1204_2 as float)) as eryanghualiu,sum(cast(fld_1204_3 as float)) as eryanghuadan,sum(cast(fld_1204_8 as float)) as kxkeliwu from gmis_mo_1204 where datediff(day,createdate,'" + DateTime.Now.Date.ToString() + "')=0 group by fld_1204_14";
    foreach (DataRow dr in db.GetDataTable().Rows)
    {
        p_eryanghualiu +=Convert.ToDouble( dr["eryanghualiu"]);
        p_eryanghuadan += Convert.ToDouble(dr["eryanghuadan"]);
        p_kxkeliwu += Convert.ToDouble(dr["kxkeliwu"]); 
    }
}
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

//按钮事件
private void Click_Toolbar(object sender, System.EventArgs e)
{
	string exeinfo = "";
	string h_data = ((Guangye.WebApplication.Controls.Button)sender).Data;
	//重置条件
	if (h_data == "0")
	{
		string h_fstr = "";
		if (guangye.GetControlValue(list_key) != "")
		{
			h_fstr += " and fld_1202_1='"+guangye.GetControlValue(list_key)+"'";			
		}
		SetSESSION("filter", h_fstr);      
		Response.Redirect("list_1202.aspx?aid=bGlzdA==&mid="+mid+"&id="+id+"&navindex=0&pid="+pid);
	}
}  
</script>

<script>
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
//window.location.href="desktop_0.aspx?closed=1";
</script>
<body>
<form id="form1" runat="server">
<table width="986"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
    <td  style="padding:0 5px; "><table width="984"  border="0" cellspacing="0" cellpadding="0" style="margin-top:20px; ">
        <tr>
          <td width="10"><img src="images/grzm003.gif" width="10" height="36"></td>
          <td bgcolor="#f2f2f2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="48"><G:Button Text="导航" Type="toolbar" Mode="on" Url="javascript:clickGuide()" runat="server"></G:Button></td>
                <td width="200">今天是:<%=p_day %></td>
                <td align="left"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="18" class="font1225_FF0000"></td>
                    <td width="400" height="22" class="font1225_black">
					<div id="divWelcome" style="background-color:Transparent;"></div>
					<script language="javascript" src="js.aspx"></script>
					<script language=javascript>
					CreateControl("divWelcome","NewsRoll","images/NewsRoll.swf?mode=0&dataroot=data_welcome.aspx&color=B85500&hover=686868&line=1&head=&width=400&height=20", 400, 22, "#FFFFFF");				
					</script>
					<SCRIPT language=VBScript>
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
					</SCRIPT>
					</td>
                  </tr>
                </table></td>
                <td width="100"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td></td>
                      <td width="10"></td>
                      <td></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
          <td width="10"><img src="images/grzm004.gif" width="10" height="36"></td>
        </tr>
      </table>
      <table width="984"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100" height="35" align="right"  class="font1425B_000000" style="padding-left:5px; ">查询系统</td>
          <td align="left">
		  <iframe id="iframe_Highsearch" SRC="iframe_highsearch.aspx" runat="server" frameborder="0"  width="100%" height="35" scrolling="no"></iframe>
		  
		  </td>
        </tr>
      </table>
      <table width="984"  border="0" cellspacing="0" cellpadding="0" style="margin-bottom:10px; ">
        <tr>
          <td width="587" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0" background="images/grzm018.gif">
            <tr>
              <td><img src="images/grzm014.gif" width="20" height="20"></td>
              <td align="right"><img src="images/grzm015.gif" width="20" height="20"></td>
              </tr>
          </table>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="20" background="images/grzm021.gif">&nbsp;</td>
                <td align="center" style="padding:4px 0px; "><a href="javascript:var v_open=open('/speedmap');"><img src="images/grzm007.jpg" width="539" height="386" border=0></a></td>
                <td width="20" background="images/grzm019.gif">&nbsp;</td>
              </tr>
            </table>
            <table width="100%"  border="0" cellpadding="0" cellspacing="0" background="images/grzm020.gif">
              <tr>
                <td><img src="images/grzm017.gif" width="20" height="20"></td>
                <td align="right"><img src="images/grzm016.gif" width="20" height="20"></td>
              </tr>
            </table></td>
          <td width="9"> </td>
          <td width="387" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#999999">
            <tr>
              <td align="left" bgcolor="#FFFFFF"><table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#f7f7f7">
                  <tr>
                    <td height="30"><img src="images/grzm006.gif" width="109" height="21"></td>
                    <td width="120" class="font1225_000000">日期：<%=p_today %></td>
                  </tr>
              </table></td>
            </tr>
          </table>
            <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold">
              <tr bgcolor="#eeeeee" class="td_bottom_bg">
                <td height="24" align="center" bgcolor="#627c9d" class="font1225B_ffffff">名称 </td>
                <td height="24" align="center" bgcolor="#627c9d" class="font1225B_ffffff">排放值</td>
              </tr>
              <tr class="td_bottom_bg" >
                <td align="center" bgcolor="#eeeeee" class="font1225_000000">二氧化硫</td>
                <td align="center" bgcolor="#eeeeee" ><%=p_eryanghualiu%></td>
              </tr>
              <tr class="td_bottom_bg">
                <td align="center" class="font1225_000000">二氧化氮</td>
                <td align="center"><%=p_eryanghuadan%></td>
              </tr>
              <tr bgcolor="#eeeeee" class="td_bottom_bg">
                <td align="center" class="font1225_000000">可吸入颗粒物</td>
                <td align="center"><%=p_kxkeliwu%></td>
              </tr>
              <tr align="right" class="td_bottom_bg">
                <td colspan="2" class="font1220_000000" style="padding-right:10px; "><a href="getpage.aspx?aid=bGlzdA==&mid=36&id=0&navindex=0&pid=0" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=36&pid=1211';window.parent.document.getElementById('mainset').cols = '257,*';">&gt;&gt; 更多</a></td>
              </tr>
            </table>
            <table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#D4D4D4"  style="margin-top:10px; ">
              <tr>
                <td bgcolor="#627C9D" class="font1430B_ffffff"  style="padding:0px 11px; ">通知公告</td>
              </tr>
              <tr>
                <td height="70" bgcolor="#FAFAFA" style="padding-left:15px">
				<div style="width:364px; height:75px; overflow:hidden; margin:5px auto; ">
				 <div id="div_tongzhigonggao" style="background-color:Transparent; vertical-align:bottom; height:75px; margin-left:0;"></div>
				  <script language="javascript" src="js.aspx"></script>
				  <script language="javascript">
					  CreateControl("div_tongzhigonggao","NewsRoll","images/NewsRoll.swf?mode=1&dataroot=tongzhigonggao_data.aspx&color=333333&hover=EC0202&win=_blank&line=1&head=&bg=AA049366.jpg&width=364&height=75", 364,75, "#FFFFFF");
				  </script><SCRIPT language=VBScript>
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
					</SCRIPT>				
					</div>
				</td>
              </tr>
            </table>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-top:10px; ">
              <tr>
                <td valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#D4D4D4">
                  <tr>
                    <td bgcolor="#EEEEEE"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><img src="images/grzm023.gif" width="147" height="26"></td>
                      </tr>
                    </table>
                      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td height="38" style="padding-left:10px">
						  <div style="width:208px; margin:0px auto; ">
						  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><input id="list_key" runat=server maxlength="50" type="text" name="textfield" style="width:138px; "></td>
                              <td align="right"><G:Button id="btn_searchlist" type="toolbar" mode="on" icon="tb08" text="检索" onclick="Click_Toolbar" data="0" runat="server"></G:Button></td>
                            </tr>
                          </table>
						  </div>
						  </td>
                        </tr>
                      </table></td>
                  </tr>
                </table></td>
                <td width="10"> </td>
                <td width="141" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#D4D4D4">
                  <tr>
                    <td bgcolor="#FFFFFF"><a href="getpage.aspx?aid=bGlzdA==&mid=1123&id=0&navindex=0&pid=0" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=1123&pid=1122';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/grzm024.gif" width="139" height="64" border="0"></a></td>
                  </tr>
                </table></td>
              </tr>
            </table>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="margin-top:10px; ">
              <tr>
                <td><table  border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
                  <tr>
                    <td bgcolor="#FFFFFF"><a href="list_1199.aspx?mid=1199&hycode=10" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=1&pid=1199&hyid=10';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/grzm025.gif" width="185" height="65" border="0"></a></td>
                  </tr>
                </table></td>
                <td>&nbsp;</td>
                <td><table  border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
                  <tr>
                    <td bgcolor="#FFFFFF"><a href="getpage.aspx?aid=bGlzdA==&mid=37&id=0&navindex=0&pid=0" onclick="window.parent.frames(1).location='nav.aspx?closed=0&mid=37&pid=1211';window.parent.document.getElementById('mainset').cols = '257,*';"><img src="images/grzm026.gif" width="185" height="65" border="0"></a></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
