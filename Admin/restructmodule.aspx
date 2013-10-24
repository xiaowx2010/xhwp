<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<script runat=server language=C#>	
    StringBuilder sb;	
    public string ReStructIndex(string dname)
		{
			string ExeInfo = "操作成功！";
            /*ExeInfo = UpdatePosition(dname) + UpdateIndex(dname);*/
			if(UpdatePosition(dname) == "操作成功！")
				ExeInfo = UpdateIndex(dname)+"！";
              
			return ExeInfo;	             
            
		}
		public string UpdatePosition(string dname)
		{
			sb = new StringBuilder();
            db.SqlString = "select " + dname + "name," + dname + "position," + dname + "index," + dname + "uppercode," + dname + "code," + dname + "index," + dname + "level from gmis_" + dname + " ";
            //Response.Write(db.SqlString);
			DataTable dt = db.GetDataTable();
            if (dt.Rows.Count > 0)
            {
                GetPositionSQl("" + dname + "Level=1", 1, dt, dname);
            }
			db.SqlString = "BEGIN "+sb.ToString()+" END";
            //Response.Write(db.SqlString);
            //return db.SqlString;
			return db.TransUpdate();
		}
		public void GetPositionSQl(string filter,int lvc,DataTable dt,string dname)
		{
			DataRow[] drs = dt.Select(filter,dname+"Position");
			for(int i=0;i<drs.Length;i++)
			{
                sb.Append("update gmis_" + dname + " set " + dname + "Position=" + Convert.ToString(i + 1) + "," + dname + "Level=" + lvc.ToString() + " where " + dname + "Code='" + drs[i][dname+"Code"].ToString() + "';");
				if(dt.Select(dname+"UpperCode='"+drs[i][dname+"Code"].ToString()+"'",dname+"Position").Length>0)
				{
					
					GetPositionSQl(dname+"UpperCode='"+drs[i][dname+"Code"].ToString()+"'",lvc+1,dt,dname);
				}
			}
		}
		public string UpdateIndex(string dname)
		{
			sb = new StringBuilder();
            sb.Append("update gmis_" + dname + " set " + dname + "Index=" + dname + "Code where " + dname + "Level='1';");
            db.SqlString = "select " + dname + "name," + dname + "position," + dname + "index," + dname + "uppercode," + dname + "code," + dname + "level from gmis_" + dname + " order by "+dname+"Index ";
            DataTable dt = db.GetDataTable();
            if (dt.Rows.Count > 0)
            {
                GetIndexSQl("0.", dname + "Level=1", dt, dname);
            }
			db.SqlString = "BEGIN "+sb.ToString()+" END";
            //Response.Write(db.SqlString);
            //return db.SqlString;
            return db.TransUpdate();
		}
		public void GetIndexSQl(string pindex,string filter,DataTable dt,string dname)
		{
			DataRow[] drs = dt.Select(filter,dname+"position");
            for(int i=0;i<drs.Length;i++)
			{
                string tindex = pindex + drs[i][dname + "Position"].ToString().PadLeft(3, '0');
                sb.Append("update gmis_" + dname + " set " + dname + "Index='" + tindex + "' where " + dname + "Code='" + drs[i]["" + dname + "Code"].ToString() + "';");
                if(dt.Select(dname+"UpperCode='"+drs[i][dname+"Code"].ToString()+"'",dname+"Position").Length>0)
				{
					GetIndexSQl(tindex,dname+"UpperCode='"+drs[i][dname+"Code"].ToString()+"'",dt,dname);
				}
			}
		}
		
</script>