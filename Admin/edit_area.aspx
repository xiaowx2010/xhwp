<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<!--#include file="func.aspx"-->
	<script runat="server" language="C#">
        private void Page_Load(object sender, System.EventArgs e)
        {
            SetToolBar();//设置工具条,同时获取固定URL参数 
            dtable = "gmis_area";
            filter = " areacode=" + id;
            flds = new string[] { "areaname", "areabrief", "areastate", "areauppercode", "arealevel", "areadata", "areadesc" };
            mflds = new string[] { "区域名|areaname", "简称|areabrief" };
            types = "0001100";

            if (!IsPostBack)
            {
                //区
                BindListControl(select_area, "areacode", "areaname", "select areacode,areaname from gmis_area where arealevel=1 order by areaindex", "无区县");
                SetFilter(select_area, "0");
                //街道
                select_street.Items.Clear();
                select_street.Items.Add(new ListItem("无街道", "0"));
                if (id != "0")
                    guangye.BindData(dtable, filter, flds);//绑定所有值
            }
        }

        //区筛选   
        private void Filter_Change(object sender, System.EventArgs e)
        {
            areauppercode.Value = select_area.SelectedItem.Value;
            arealevel.Value = "2";
            BindListControl(select_street, "areacode", "areaname", "select areacode,areaname from gmis_area where arealevel=2 and areauppercode=" + select_area.SelectedItem.Value + " order by arealevel", "无街道");
            SetFilter(select_street, "0");

        }

        private void Up_Click(object sender, EventArgs e)
        {
            int me = 0;
            SqlDB db = new SqlDB();
            db.SqlString = "select areacode,areaposition from gmis_area where areauppercode=(select areauppercode from gmis_area where areacode=" + id + ") order by areaposition desc";
            
            DataTable dt = db.GetDataTable();
            DataRow[] drs = dt.Select("");
            for (int i = 1; i <= drs.Length; i++)
            {
                drs[i - 1]["areaposition"] = Convert.ToString(drs.Length - i + 1);
                if (drs[i - 1]["areacode"].ToString() == id) { me = i - 1; }
            }
            if ((drs.Length - me) > 1)
            {
                drs[me]["areaposition"] = Convert.ToString(drs.Length - me - 1);
                drs[me + 1]["areaposition"] = Convert.ToString(drs.Length - me);
            }
            StringBuilder sstr = new StringBuilder();
            foreach (DataRow dr in drs)
            {
                sstr.Append(" update gmis_area set areaposition=" + dr["areaposition"].ToString() + " where areacode=" + dr["areacode"].ToString() + "; ");
            }
            if (sstr.Length > 0)
            {
                db.SqlString = "BEGIN " + sstr.ToString() + "END";
                db.TransUpdate();
            }
        }
        public override void BeforeSave()
        {
            //简称
            if (areabrief.Value.Trim().Length == 0)
                areabrief.Value = areaname.Value;
            //上级编号，等级    
            if (select_area.SelectedItem != null && select_area.SelectedItem.Value != "0")
            {
                if (select_street.SelectedItem != null && select_street.SelectedItem.Value != "0")
                {
                    areauppercode.Value = select_street.SelectedItem.Value;
                    arealevel.Value = "3";

                }
                else
                {
                    areauppercode.Value = select_area.SelectedItem.Value;
                    arealevel.Value = "2";
                }
            }
        }
	</script>
	<script type="text/javascript">
	var pop ;	
	function ClearLink(){
		if(pop!=null){
			pop.close();
		}
	}
	function IniLink(){
		pop=null;		
	}
	</script>
<body style="padding:10px;text-align:center" onbeforeunload="ClearLink()">
<script type="text/javascript">
function GetData(args){	
	if(window.document.form1.areadata != null){
			window.document.form1.areadata.value=args;
		}	
	window.document.focus();
}
</script>
<form id="form1" runat="server">
<!--选项卡-->
<!--选项卡-->
<!--操作工具条-->
    <!--#include file="toolbarleft.aspx"--> 
            <td id="tb_6" visible="false" runat="server" style="padding-left:5px;">
				<table  border="0" cellspacing="0" cellpadding="0" ID="Table1" align="left">
				<tr>
					<td style="width:30%;">
						<asp:LinkButton id="td_up" style="padding-right:5px" OnClick="Up_Click" runat="server"><img alt="" src="images/up.gif" border="0" /></asp:LinkButton>
					</td>
				</tr>
				</table>
			</td>
			<!--右边固定按钮-->
			<!--#include file="toolbar.aspx"-->
			<!--右边固定按钮-->
	   <!--#include file="toolbarright.aspx"--> 
<!--操作工具条-->
<input type="hidden" runat="server" id="areauppercode" />
<input type="hidden" runat="server" id="arealevel" />
<table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor">
    <tr> 
        <td class="td_viewcontent_title" align="right">区域名：</td>
        <td class="td_viewcontent_content" colspan="3">
        <input id="areaname" type="text" style="width:520px" maxlength="200" runat="server" /></td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">简称：</td>
        <td class="td_viewcontent_content">
        <input id="areabrief" type="text" style="width:160px" maxlength="100" runat="server" /></td>
        <td class="td_viewcontent_title" align="right">状态：</td>
        <td class="td_viewcontent_content">
        <select id="areastate" style="width:160px" runat="server">
            <option>启用</option>
            <option>禁用</option>
            <option>隐藏</option>
        </select></td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">所属区：</td>
        <td class="td_viewcontent_content">
			<asp:DropDownList id="select_area" style="width:160px" AutoPostBack="True" OnSelectedIndexChanged="Filter_Change" runat="server" />
		</td>
        <td class="td_viewcontent_title" align="right">所属街道：</td>
        <td class="td_viewcontent_content">
			<asp:DropDownList id="select_street" style="width:160px" runat="server" />
        </td>
    </tr>
    <tr> 
        <td class="td_viewcontent_title" align="right">数据：</td>
        <td class="td_viewcontent_content" colspan="3">
        <table><tr><td>
        <input id="areadata" type="hidden" runat="server">
		<input id="dataface" type="password" style="width:250px" title="请从地图获取数据" value="111111111111111111111111111111111111" readonly="true">
        </td><td>&nbsp;<a href="javascript:__doOpenMap2('2')"><img src="images/getdata_.gif" border="0"></a>
        </td></tr></table>
        </td>
    </tr>
    <tr>
        <td class="td_viewcontent_title" align="right" valign="top">介绍：</td>
        <td class="td_viewcontent_content" colspan="3" align="right">
        <G:Editor id="areadesc" height="300"  BasePath="Common/Editor/" runat="server"/>
         <input id="areacode" type="hidden" runat="server">
        </td>
    </tr>
</table>        
</form>
</body>
</html>
