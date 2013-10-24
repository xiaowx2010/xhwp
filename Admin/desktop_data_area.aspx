<%@ Page Language="c#"  Inherits="Guangye.WebApplication.Controls.CheckLoginPage"%>
<%@ Import Namespace="System.Data" %>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>

<script runat="server" language="C#">
    DataTable dtDept;
private void Page_Load(object sender, System.EventArgs e)
{
    Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);

    Response.Write("<base>");    
    Response.Write(GetDeptStr("0"));
	Response.Write("<d n=\"所有区域\" c=\"0\">");
    Response.Write("</base>");
    //Response.Write("<base><d n=\"突发事件\" c=\"1\"><d n=\"路面塌陷\" c=\"18\"></d><d n=\"www\" c=\"25\"></d><d n=\"事件5\" c=\"22\"></d><d n=\"燃气管破裂\" c=\"2\"><d n=\"路面积水、污水冒溢、粪便冒溢路面积水、污水冒溢、粪便冒溢路面积水、污水冒溢、粪便冒溢\" c=\"31\"></d></d></d><d n=\"道路交通\" c=\"12\"><d n=\"路中分隔设施\" c=\"14\"></d><d n=\"交通信号灯\" c=\"13\"></d></d><d n=\"街面秩序\" c=\"32\"><d n=\"机动车乱停放、非机动车乱停放\" c=\"34\"></d><d n=\"流浪乞讨 街面秩序\" c=\"33\"></d></d><d n=\"设施管理\" c=\"4\"><d n=\"路面塌陷\" c=\"24\"></d><d n=\"市容车貌脏乱差\" c=\"16\"></d><d n=\"河道污染\" c=\"8\"></d></d><d n=\"综合管理\" c=\"5\"><d n=\"违章搭建\" c=\"20\"></d><d n=\"油烟气污染\" c=\"7\"></d></d><d n=\"公共设施\" c=\"6\"><d n=\"景观灯光设施\" c=\"21\"></d><d n=\"上水井盖\" c=\"11\"></d></d></base>");

}



private DataTable GetDepts()
{
    if (dtDept == null)
    {
        SqlDB db = new SqlDB();
        db.SqlString = "select mocode as deptcode,fld_1201_1 as deptname,fld_1201_3 as deptuppercode,(case when exists (select 1 from gmis_mo_1201 b where b.fld_1201_3=a.mocode) then 1 else 0 end) as hassubdept from gmis_mo_1201 a order by fld_1201_5 asc";
        dtDept = db.GetDataTable();
    }
    return dtDept;
}

private string GetDeptStr(string deptcode)
{
    StringBuilder sb = new StringBuilder();

    DataRow[] drs = GetDepts().Select("deptuppercode=" + deptcode);
    string c;
    foreach (DataRow dr in drs)
    {

        sb.Append("<d n=\"" + dr["deptname"].ToString() + "\" c=\"" + dr["deptcode"].ToString() + "\">");
      

        if (dr["hassubdept"].ToString() == "1")
        {
            sb.Append(GetDeptStr(dr["deptcode"].ToString()));
        }

        sb.Append("</d>");
    }

    return sb.ToString();
}
    
    
</script>