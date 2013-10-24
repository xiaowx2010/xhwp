<%@ Page Language="c#" Debug="true" Inherits="Guangye.WebApplication.Controls.Page"%>
<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.IO" %>
<HTML>
<HEAD>	
	<G:HtmlHead id="guangye" runat="server"></G:HtmlHead>
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</HEAD>
<script runat=server language=C#>
        private string FILE_NAME;
        private SqlDB db = new SqlDB();
        private SqlDB dbx = new SqlDB();//����SqlDB
        string connstring = "";
		private void Page_Load(object sender, System.EventArgs e)
		{
            
            connstring = Server.MapPath("DATA.mdb");
            //databind();
            FILE_NAME = Server.MapPath("/") + "doc_rptObjects3.txt";
           
            
		}
        private void databind()
        {
            //FileInfo�������ռ���System.IO
            FileInfo fi = new FileInfo(connstring);
            //�ж��ļ��Ƿ����
            if (fi.Exists)
            {
                /*
                OleDbConnection conn = new OleDbConnection(ConnectionString);
                conn.Open();
                DataSet ds=new DataSet();
                System.Data.OleDb.OleDbDataAdapter da = new OleDbDataAdapter("select * from hj",conn);
                da.Fill(ds);
               
                //da.Fill(dt);
                Response.Write(ds.Tables[0].Rows[0][0].ToString());
                */

                /* 
                DataTable schemaTable = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });
                foreach (DataRow dr in schemaTable.Rows)
                {
                    
                    
                    //�ֶ���   
                    DataTable columnTable = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Columns, new object[] { null, null, dr["TABLE_NAME"].ToString(), null });

                    for (int i = 0; i < columnTable.Columns.Count; i++)
                    {
                        Response.Write("<span style='color:orange;'>"+columnTable.Columns[i].ColumnName + ":"+columnTable.Columns[i].Caption+"</span><br>");
                        foreach (DataRow dr2 in columnTable.Rows)
                        {
                            Response.Write(dr2[i] + "<br>");
                        }
                    }

                    foreach (DataRow dr2 in columnTable.Rows)
                    {
                        Response.Write(dr2[3] + "<br>");
                    }
                    Response.Write("<hr>");
                     
                }

                conn.Close(); 
                */
            }
            else
            {
                alert.InnerHtml = "�ļ������ڣ�";//�����ʾ��Ϣ
            }
        }
        private void table_Click(object sender, EventArgs e)
        {
            string sqlstr = "",index="";
            alert.InnerHtml = "";
            int position = 0;
            //��ȡĿǰ�������ֵ
            db.SqlString = "select moduleposition,moduleindex from gmis_module where moduleuppercode=1124 order by moduleposition desc";
            DataTable dt_new = db.GetDataTable();
            if (dt_new != null && dt_new.Rows.Count > 0)
            {
                if (dt_new.Rows[0][0].ToString() != "")
                {
                    position = Convert.ToInt32(dt_new.Rows[0][0].ToString());
                }
            }
            //access����
            DataTable dt = new DataTable();
            string ConnectionString = "Provider=Microsoft.Jet.OleDB.4.0;Data Source=" + connstring;
            OleDbConnection conn = new OleDbConnection(ConnectionString);
            conn.Open();
            DataTable schemaTable = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });
            foreach (DataRow dr in schemaTable.Rows)
            {
                //����   
                position++;
                if (position.ToString().Length == 1)
                    index = "0.00400200" + position.ToString();
                else if (position.ToString().Length == 2)
                    index = "0.0040020" + position.ToString();
                else if (position.ToString().Length == 3)
                    index = "0.004002" + position.ToString();
                else
                    index = "0.004002001";
                sqlstr += "insert into gmis_module (modulename,moduleuppercode,modulelevel,moduleposition,moduleindex,moduleurl,useactions) values ('" + dr[5] + "',1124,3," + position + ",'" + index + "','" + dr[2] + "','1;2;3;4');";
                

            }
            if (sqlstr != "")
            {
                db.SqlString = "begin " + sqlstr+" end";
                //alert.InnerHtml =db.TransUpdate();
            }
            conn.Close(); 
            
            
            
            
        }
        private void field_Click(object sender, EventArgs e)
        {
            /*
            connstring = Server.MapPath("Book.xls");
            //�ж��ļ��Ƿ����
            if (!File.Exists(FILE_NAME))
            {
                dbx.ConnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + connstring + ";Extended Properties=Excel 8.0;";
                dbx.SqlString = "select * from [Sheet1]";
                DataTable dt = dbx.GetDataTable();
                Response.Write(dbx.ConnStr + "<br>" + dt.Rows.Count);
            }
            else
            {
                alert.InnerHtml = "�ļ������ڣ�";//�����ʾ��Ϣ
            }*/
            alert.InnerHtml = "";
            string strsql = "", tableenname = "", tablename = "", caption = "",field="", modulecode = "", fieldtype = "", DecimalPlaces="", fieldname = "", fieldtypecode = "1", datalength = "50", fullline = "0", defaultvalue = "";

            if (!File.Exists(FILE_NAME))
            {
                Response.Write("{0} does not exist." + FILE_NAME);
                return;
            }
            else
            {
                //��ȡ�ļ�
                using (StreamReader sr = new StreamReader(FILE_NAME, System.Text.Encoding.Default, false))
                {
                    String input;
                    int fieldindex = 3, index = 0;

                    Match m;
                    //ѭ������
                    while ((input = sr.ReadLine()) != null)
                    {
                        if (input.Trim().Length > 0)
                        {
                            if (input.Trim().IndexOf("��:") != -1)
                            {
                                if (input.Substring(0, input.IndexOf("ҳ")).Replace("��:", "").Trim() != tablename)
                                {
                                    fieldindex = 3; 
                                    index = 0;
                                    tablename = input.Substring(0, input.IndexOf("ҳ")).Replace("��:", "").Trim();
                                    db.SqlString = "select modulecode from gmis_module where  moduleurl='" + tablename + "' and moduleuppercode=1124";
                                    
                                    DataTable dt_module = db.GetDataTable();
                                    if (dt_module != null && dt_module.Rows.Count > 0)
                                    {
                                        modulecode = dt_module.Rows[0][0].ToString();
                                    }
                                    strsql += "insert into gmis_field (modulecode,fieldname,caption,fieldtypecode,datalength,fieldindex,isprimarykey,isvital,defaultvalue,onedit,fullline) values (" + modulecode + ",'MoCode','�Զ����',2,4,1,1,1,0,0,0);insert into gmis_field (modulecode,fieldname,caption,fieldtypecode,datalength,fieldindex,isprimarykey,isvital,defaultvalue,onedit,fullline) values (" + modulecode + ",'CreatorCode','�����߱��',2,4,2,0,1,0,0,0);insert into gmis_field (modulecode,fieldname,caption,fieldtypecode,datalength,fieldindex,isprimarykey,isvital,defaultvalue,onedit,fullline) values (" + modulecode + ",'CreateDate','����ʱ��',7,8,3,0,1,'getdate()',0,0);";
                                    
                                }
                                
/*
                                db.SqlString = "select modulecode from gmis_module where  moduleurl='" + tablename + "' and moduleuppercode=1124";
                                
                                DataTable dt_module = db.GetDataTable();
                                if (dt_module != null && dt_module.Rows.Count > 0)
                                {
                                    modulecode = dt_module.Rows[0][0].ToString();
                                }*/
                                
                            }
                           
                            if (input.Trim().IndexOf("С��") != -1)
                            {
                                fieldtypecode = "2";
                                datalength = "4";
                                defaultvalue = "0";
                            }
                            else if (input.Trim().IndexOf("˫������") != -1)
                            {
                                fieldtypecode = "10";
                                datalength = "8";
                                defaultvalue = "0";
                            }
                            else if (input.Trim().IndexOf("�ı�") != -1 && input.Trim().IndexOf("DisplayControl:")<0)
                            {
                                fieldtypecode = "1";
                                datalength = "2000";
                                defaultvalue = "''";
                            }
                            else if (input.Trim().IndexOf("����/ʱ��") != -1)
                            {
                                fieldtypecode = "7";
                                datalength = "8";
                                defaultvalue = "'getdate()'";
                            }
                            else
                            {
                                fieldtypecode = "1";
                                datalength = "2000";
                                defaultvalue = "''";
                            }
                            if (input.Trim().IndexOf("SourceField:") != -1)
                            {
                                field = input.Replace("SourceField:", "").Trim();
                            
                            }

                            if (input.Trim().IndexOf("Caption:") != -1)
                            {

                                caption = input.Replace("Caption:", "").Trim();
                                
                                //Response.Write(caption + "<br>");
                            }
                            if (input.Trim().IndexOf("SourceField:") != -1)
                            {
                                field = input.Replace("SourceField:", "").Trim();
                                if (caption == "")
                                {
                                    caption = field;
                                }
                            }
                            if (input.Trim().IndexOf("SourceTable:") != -1)
                            {
                                tableenname = input.Replace("SourceTable:", "").Trim();
                                //Response.Write(tableenname + "<br>");

                                
                            }
                            if (input.Trim().IndexOf("DecimalPlaces:") != -1)
                            {
                                DecimalPlaces = input.Replace("DecimalPlaces:", "").Trim();
                                //Response.Write(tableenname + "<br>");
                            }
                            
                            if (tableenname != "")
                            {
                                fieldindex++;
                                index++;
                                fieldname = "fld_" + modulecode + "_" + index.ToString();
                                strsql += "insert into gmis_field (modulecode,fieldname,caption,fieldtypecode,datalength,fieldindex,isprimarykey,isvital,defaultvalue,onedit,fullline) values (" + modulecode + ",'" + fieldname + "','" + caption + "'," + fieldtypecode + "," + datalength + ",'" + fieldindex + "',0,0," + defaultvalue + ",1," + fullline + ");";
                                tableenname = ""; caption = "";
                            }
                            
                        }
                    }
                    
                    if (strsql != "")
                    {
                        Response.Write(strsql);
                        db.SqlString = "begin " + strsql + " end";
                        alert.InnerHtml = db.TransUpdate();
                    }
                }
            }
        }

        private void content_Click(object sender, EventArgs e)
        {

        }
</script>
<body>
    <form runat="server">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" style="border-right: #8c9dbe 1px solid;border-top: #8c9dbe 1px solid;border-left: #8c9dbe 1px solid;border-bottom: #8c9dbe 1px solid;"> 
            <tr align="center">
                <td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:LinkButton ID="btn_table" runat="server" style="width:100px;" OnClick="table_Click" Text="��ȡ��"></asp:LinkButton>
                </td>
                <td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:LinkButton ID="btn_field" runat="server" style="width:100px;" OnClick="field_Click" Text="��ȡ���ֶ�"></asp:LinkButton>
                </td>
                <td style="font-size: 12px;line-height: 16pt;color: #666666;text-decoration: none;background-color: #e0e0e0;padding-top: 3px;padding-bottom: 3px;">
                    <asp:LinkButton ID="btn_content" runat="server" style="width:100px;" OnClick="content_Click" Text="��ȡ������"></asp:LinkButton>
                </td>
            </tr>
        </table>
        <div id="alert" runat="server"></div>
    </form>
</body>
</html>