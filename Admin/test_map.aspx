
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.Page" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>

<script language="C#" runat="server">
    string sortid, sortdir;
    private void Page_Load(object sender, System.EventArgs e)
    {
       
    }

    private void btn_Click(object sender, EventArgs e)
    {
        //string idstr = ((Control)sender).ID;
        //switch (idstr)
        //{
        //    case "btn_1":
        //        Page.RegisterStartupScript("", "<script language='javascript'>__doOpenView('getpage_map.aspx?mid=17&fcode=25','800','520','','');" + "</sc" + "ript>");
        //        break;
        //    case "btn_2":
        //        Page.RegisterStartupScript("", "<script language='javascript'>window.open('getpage_map.aspx?mid=37&fcode=7','','height=520,width=800,status=no,toolbar=no,menubar=no,scrollbars=yes,location=no,resizable=no,directories=no,top=270,left=330','');" + "</sc" + "ript>");
        //        break;
        //    case "btn_3":
        //        Page.RegisterStartupScript("", "<script language='javascript'>window.open('getpage_map.aspx?fcode=1','','height=600,width=700,status=no,toolbar=no,menubar=no,scrollbars=yes,location=no,resizable=no,directories=no,top=270,left=330','');" + "</sc" + "ript>");
        //        break;
        //    case "btn_4":
        //        Page.RegisterStartupScript("", "<script language='javascript'>__doOpenView('getpage_map.aspx?mid=1201&fcode=119','600','560','','');" + "</sc" + "ript>");
        //        break;
            
        //    default: 
        //        break;
        //}
        Page.RegisterStartupScript("", "<script language='javascript'>window.open('getpage_map.aspx?fcode=1','','height=600,width=800,status=no,toolbar=no,menubar=no,scrollbars=yes,location=no,resizable=no,directories=no,top=270,left=330','');" + "</sc" + "ript>");
        
    }
</script>

<body style="padding: 10px; text-align: center">
    <form id="form1" runat="server">
    <!--ѡ�-->
    <!--ѡ�-->
    <!--����������-->
    
    <!--����������-->
    <!--����-->
    <div id="fold" runat="server" style="">
    </div>
    <!--��̬���ɽ���-->
    <asp:LinkButton ID="btn_1" runat="server" Text="[��ȾԴ�������]" OnClick="btn_Click"></asp:LinkButton>
    <asp:LinkButton ID="btn_2" runat="server" Text="[ˮ������ݹ���]" OnClick="btn_Click"></asp:LinkButton>
    <asp:LinkButton ID="btn_3" runat="server" Text="[ȫ����ȾԴ�ղ�]" OnClick="btn_Click"></asp:LinkButton>
    <asp:LinkButton ID="btn_4" runat="server" Text="[����]" OnClick="btn_Click"></asp:LinkButton>
    </form>
</body>
</html>
