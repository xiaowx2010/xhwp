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
	Response.Write("<d n=\"��������\" c=\"0\">");
    Response.Write("</base>");
    //Response.Write("<base><d n=\"ͻ���¼�\" c=\"1\"><d n=\"·������\" c=\"18\"></d><d n=\"www\" c=\"25\"></d><d n=\"�¼�5\" c=\"22\"></d><d n=\"ȼ��������\" c=\"2\"><d n=\"·���ˮ����ˮð�硢���ð��·���ˮ����ˮð�硢���ð��·���ˮ����ˮð�硢���ð��\" c=\"31\"></d></d></d><d n=\"��·��ͨ\" c=\"12\"><d n=\"·�зָ���ʩ\" c=\"14\"></d><d n=\"��ͨ�źŵ�\" c=\"13\"></d></d><d n=\"��������\" c=\"32\"><d n=\"��������ͣ�š��ǻ�������ͣ��\" c=\"34\"></d><d n=\"�������� ��������\" c=\"33\"></d></d><d n=\"��ʩ����\" c=\"4\"><d n=\"·������\" c=\"24\"></d><d n=\"���ݳ�ò���Ҳ�\" c=\"16\"></d><d n=\"�ӵ���Ⱦ\" c=\"8\"></d></d><d n=\"�ۺϹ���\" c=\"5\"><d n=\"Υ�´\" c=\"20\"></d><d n=\"��������Ⱦ\" c=\"7\"></d></d><d n=\"������ʩ\" c=\"6\"><d n=\"���۵ƹ���ʩ\" c=\"21\"></d><d n=\"��ˮ����\" c=\"11\"></d></d></base>");

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