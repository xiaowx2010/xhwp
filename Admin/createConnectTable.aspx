<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" %>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>


<script language="C#" runat="server">

    SqlDB db = new SqlDB();
    
    private void Page_Load(object sender, System.EventArgs e)
    {
        //CreateConnectTable();
        //UpdateOrgName();
    }

    private void UpdateOrgName()
    {
        DataTable dt = db.GetDataTable(db.ConnStr, "select modulecode from gmis_field where caption like '名称'  and modulecode in (select modulecode from gmis_module where moduleindex like '%'+(select moduleindex from gmis_module where modulename like '全国污染源普查原始数据')+'%' and modulecode<>40 and modulestate=0 and modulecode not in (select modulecode from gmis_module where moduleindex like '%'+(select moduleindex from gmis_module where modulecode=1188)+'%'))");
        StringBuilder sb;
        foreach (DataRow dr in dt.Rows)
        {
            sb = new StringBuilder();
            sb.Append("update gmis_mo_1197 set OrgName=isnull((select fld_" + dr["modulecode"].ToString() + "_2 from gmis_mo_" + dr["modulecode"].ToString() + " where fld_" + dr["modulecode"].ToString() + "_1=OrgCode),'') where OrgName='';");
            if (sb.Length > 0)
            {
                Response.Write("<br>更新表gmis_mo_" + dr["modulecode"].ToString() + ":" + db.UpdateTable(db.ConnStr, sb.ToString())); 
            }
        }
    }

    private void CreateConnectTable()
    {
        DataTable dtModule = db.GetDataTable(db.ConnStr, "select modulecode from gmis_field where caption like '代码'  and modulecode in (select modulecode from gmis_module where moduleindex like '%'+(select moduleindex from gmis_module where modulename like '全国污染源普查原始数据')+'%' and modulecode<>40 and modulestate=0 and modulecode not in (select modulecode from gmis_module where moduleindex like '%'+(select moduleindex from gmis_module where modulecode=1188)+'%'))");
        DataTable dt;
        StringBuilder sb;

        foreach (DataRow drModule in dtModule.Rows)
        {
            sb = new StringBuilder();
            dt = db.GetDataTable(db.ConnStr, "select fld_" + drModule["modulecode"].ToString() + "_1 as qiye,mocode from gmis_mo_" + drModule["modulecode"].ToString());
            foreach (DataRow dr in dt.Rows)
            {
                sb.Append("Insert into gmis_mo_1197 (ModuleCode,DataMoCode,OrgCode) values('" + drModule["modulecode"].ToString() + "','" + dr["mocode"].ToString() + "','" + dr["qiye"].ToString() + "');");
            }

            if (sb.Length > 0)
            {
                Response.Write("<br>生成表gmis_mo_" + drModule["modulecode"].ToString() + ":" + db.UpdateTable(db.ConnStr, sb.ToString()));
            }

        }
    }
    
    
    
    
</script>


