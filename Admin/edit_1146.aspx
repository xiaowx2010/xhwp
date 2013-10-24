<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ Page Language="c#" Inherits="Guangye.WebApplication.Controls.CheckLoginPage" debug="true" %>

<%@ Register TagPrefix="G" Namespace="Guangye.WebApplication.Controls" Assembly="Guangye.WebApplication.Controls" %>

<html>
<head>
    <G:HtmlHead id="guangye" runat="server">
    </G:HtmlHead>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<!--#include file="func.aspx"-->
<script language="c#" runat="server">
string  dtable1147,filter1147,types1147,dtable1148,filter1148,types1148,h_1146,dtable_1202,types_1202,filter_1202,qiye_id="";
string [] flds1147,flds1148, flds_1202, vflds_1202;
    StringBuilder sbdata=new StringBuilder();
private void Page_Load(object sender,System.EventArgs e)
{
     SetToolBar();
     mid = GetQueryString("mid", "0");
     id = GetQueryString("id", "0");
	 string h_yearstr = GetQueryString("year", System.DateTime.Now.Year.ToString());
     dtable = "gmis_mo_" + mid + "";
     flds = new string[] { "fld_" + mid + "_1", "fld_" + mid + "_2", "fld_" + mid + "_3", "fld_" + mid + "_4", "fld_" + mid + "_5", "fld_" + mid + "_17", "fld_" + mid + "_18", "fld_" + mid + "_19", "fld_" + mid + "_25", "fld_" + mid + "_26", "fld_" + mid + "_27", "fld_" + mid + "_28", "fld_" + mid + "_29","fld_" + mid + "_30","fld_" + mid + "_31","fld_" + mid + "_32","fld_" + mid + "_33","fld_" + mid + "_34","fld_" + mid + "_35","fld_" + mid + "_36","fld_" + mid + "_37","fld_" + mid + "_38","fld_" + mid + "_39","fld_" + mid + "_40","fld_" + mid + "_41","fld_" + mid + "_42","fld_" + mid + "_43","fld_" + mid + "_44","fld_" + mid + "_45","fld_" + mid + "_46","fld_" + mid + "_48","fld_" + mid + "_50","fld_" + mid + "_52","fld_" + mid + "_53","fld_" + mid + "_54","fld_" + mid + "_55","fld_" + mid + "_56","fld_" + mid + "_57","fld_" + mid + "_58","fld_" + mid + "_59","fld_" + mid + "_60","fld_" + mid + "_61","fld_" + mid + "_62","fld_" + mid + "_63","fld_" + mid + "_64","fld_" + mid + "_65","fld_" + mid + "_66","fld_" + mid + "_67","fld_" + mid + "_68","fld_" + mid + "_69","fld_" + mid + "_70","fld_" + mid + "_71","fld_" + mid + "_72","fld_" + mid + "_73","fld_" + mid + "_74","fld_" + mid + "_75","fld_" + mid + "_76","fld_" + mid + "_77","fld_" + mid + "_78","fld_" + mid + "_79","fld_" + mid + "_80","fld_" + mid + "_81","fld_" + mid + "_82","fld_"+mid+"_22","fld_"+mid+"_21"};
     types="00000000000000000000000000000000000000000000000000000000000000000";
     filter="mocode="+id;
     qiye_id = GetQueryString("pid", "0");
     if(qiye_id=="0")
     {
        qiye_id=GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2=('" + GetFieldData("select fld_1146_2 from " + dtable + " where mocode='" + id + "' ") + "')");
        qiye_id = (qiye_id == "") ? "0" : qiye_id;
     }
     dtable_1202="gmis_mo_1202";
     vflds_1202=new string[] { "fld_1146_2","fld_1146_4","fld_1146_19","fld_1146_6","fld_1146_7","fld_1146_8","fld_1146_9","fld_1146_10","fld_1146_11","fld_1146_12","fld_1146_13","fld_1146_14","fld_1146_15","fld_1146_16","fld_1146_20","fld_1146_21","fld_1146_22","fld_1146_23","fld_1146_24", "fld_1202_24" };
     flds_1202=new string[] { "fld_1202_2","fld_1202_1","fld_1202_3","fld_1202_6","fld_1202_7","fld_1202_8","fld_1202_9","fld_1202_10","fld_1202_11","fld_1202_15","fld_1202_12","fld_1202_13","fld_1202_14","fld_1202_16","fld_1202_5","fld_1202_17","fld_1202_21","fld_1202_19","fld_1202_18", "fld_1202_24" };
     filter_1202=" mocode="+qiye_id;
     types_1202="00011111100000010101";
     
     dtable1147="gmis_mo_1147";
     //flds1147=new string[]{"fld_1147_1","fld_1147_2","fld_1147_3","fld_1147_4","fld_1147_5","fld_1147_6","fld_1147_7","fld_1147_8","fld_1147_9","fld_1147_10","fld_1147_11","fld_1147_12","fld_1147_13","fld_1147_14","fld_1147_15","fld_1147_16","fld_1147_17","fld_1147_18","fld_1147_19","fld_1147_20","fld_1147_21","fld_1147_22","fld_1147_23","fld_1147_24","fld_1147_25","fld_1147_26","fld_1147_27","fld_1147_28","fld_1147_29","fld_1147_30","fld_1147_31","fld_1147_32","fld_1147_33","fld_1147_35","fld_1147_36","fld_1147_37","fld_1147_38","fld_1147_39","fld_1147_40","fld_1147_41","fld_1147_42","fld_1147_43","fld_1147_44","fld_1147_45","fld_1147_46","fld_1147_47","fld_1147_48","fld_1147_49","fld_1147_50","fld_1147_51","fld_1147_52","fld_1147_53","fld_1147_54","fld_1147_55","fld_1147_56","fld_1147_57","fld_1147_58","fld_1147_59","fld_1147_60","fld_1147_61","fld_1147_62","fld_1147_63","fld_1147_64","fld_1147_65","fld_1147_66","fld_1147_67","fld_1147_68","fld_1147_69","fld_1147_70","fld_1147_71","fld_1147_72","fld_1147_73","fld_1147_74","fld_1147_75","fld_1147_76","fld_1147_77","fld_1147_78","fld_1147_79","fld_1147_80","fld_1147_81","fld_1147_82","fld_1147_83","fld_1147_84"};
     flds1147=new string[83];
     for(int i=0;i<33;i++)
     {
        flds1147[i]="fld_1147_"+(i+1);
     }
     for(int i=33;i<83;i++)
     {
        flds1147[i]="fld_1147_"+(i+2);
     }
     types1147="000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
     filter1147="fld_1147_1="+GetFieldData("select fld_1146_1 from gmis_mo_1146 where "+filter)+" and fld_1147_2='"+GetFieldData("select fld_1146_2 from gmis_mo_1146 where "+filter)+"'";
     dtable1148="gmis_mo_1148";
     flds1148=new string[]{"fld_1148_1","fld_1148_2","fld_1148_3","fld_1148_4","fld_1148_5","fld_1148_6","fld_1148_7","fld_1148_8","fld_1148_9","fld_1148_10","fld_1148_11","fld_1148_12","fld_1148_13","fld_1148_14","fld_1148_15","fld_1148_16","fld_1148_17","fld_1148_18","fld_1148_19","fld_1148_20","fld_1148_21","fld_1148_22","fld_1148_23","fld_1148_24"};
     types1148="000000000000000000000000";
     filter1148="fld_1148_1="+GetFieldData("select fld_1146_1 from gmis_mo_1146 where "+filter)+" and fld_1148_2='"+GetFieldData("select fld_1146_2 from gmis_mo_1146 where "+filter)+"'";
     //Response.Write(filter1148);
   
     if(!IsPostBack)
        {  
             for(int i=1989;i<2016;i++)
             {
                fld_1146_1.Items.Add(new ListItem(i.ToString()+'��',i.ToString()));   
             }
             SetFilter(fld_1146_1,h_yearstr);
            BindListControl(fld_1146_21,"fld_1157_1","fld_1157_2_1","select fld_1157_1,(fld_1157_1+'|'+fld_1157_2) as fld_1157_2_1 from gmis_mo_1157","--��ѡ��--");
            SetFilter(fld_1146_21,"0");
            db.SqlString="select mocode,fld_1200_1,fld_1200_3 from gmis_mo_1200 order by fld_1200_6";
            DataTable dt22=db.GetDataTable();
            string strtag="";
            if(dt22.Rows.Count>0)
            {
                foreach(DataRow dr in dt22.Rows)
                {
                    strtag="";
                    for(int i=0;i<Convert.ToInt32(dr["fld_1200_3"]);i++)
                    {
                        strtag+=">";
                    }
                    fld_1146_22.Items.Add(new ListItem(strtag+dr["fld_1200_1"].ToString(),dr["mocode"].ToString()));
                    
                }
            }  
            fld_1146_22.Items.Add(new ListItem("--��ѡ��--","0"));          
            SetFilter(fld_1146_22,"0");
            BindListControl(fld_1146_20,"fld_1195_1","fld_1195_2_1","select fld_1195_1, (fld_1195_1+'|'+fld_1195_2) as fld_1195_2_1 from gmis_mo_1195");
            SetFilter(fld_1146_20,"");
             BindListControl(fld_1146_23,"fld_1162_1","fld_1162_2_1","select fld_1162_1,(fld_1162_1+'|'+fld_1162_2) as fld_1162_2_1 from gmis_mo_1162","--��ѡ��--");
            SetFilter(fld_1146_23,"0");
               BindListControl(fld_1146_25,"fld_619_1","fld_619_2_1","select fld_619_1,(fld_619_1+'|'+fld_619_2) as fld_619_2_1 from gmis_mo_619","--��ѡ��--");
            SetFilter(fld_1146_25,"0");
             BindListControl(fld_1146_26,"fld_1145_1","fld_1145_2_1","select fld_1145_1,(fld_1145_1+'|'+fld_1145_2) as fld_1145_2_1 from gmis_mo_1145","--��ѡ��--");
            SetFilter(fld_1146_3,"0");
            db.SqlString="select fld_1161_1,fld_1161_2 from gmis_mo_1161";   
            DataTable dt3=db.GetDataTable();
            foreach(DataRow dr in dt3.Rows)
            {
                fld_1146_3.Items.Add(new ListItem(dr["fld_1161_2"].ToString(),dr["fld_1161_1"].ToString()));
            }
            if(id!="0")
            {
                guangye.BindData(dtable, filter, flds);
                fld_1146_2.Attributes.Add("readonly", "");
                fld_1146_1.Enabled = false;
                btn_search.Visible = false;
                tb_2_new.Visible=true;
                guangye.BindData(dtable1147, filter1147, flds1147);
                guangye.BindData(dtable1148, filter1148, flds1148);
                guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
                //Response.Write(filter_1202);
            } 
            else 
            {
                if(qiye_id!="0")
                {
                    guangye.BindData(dtable_1202, filter_1202, flds_1202, vflds_1202);
                    fld_1146_2.Attributes.Add("readonly", "");
                    btn_search.Visible = false;
                    tb_2_new.Visible=true;
                    //Response.Write(qiye_id);
                } 
            }            
        }       
        db.SqlString="select fld_1145_2 from gmis_mo_1145  where fld_1145_1='"+fld_1146_26.SelectedValue+"'";
        DataTable dt26=db.GetDataTable();
        if(dt26.Rows.Count>0)  fld_1146_27.Value=dt26.Rows[0]["fld_1145_2"].ToString();    
        else fld_1146_27.Value="";
}
//����֮ǰ�����ݴ���
public override void BeforeSave()
{
    string h_strbindyear=guangye.GetControlValue(fld_1146_1);
    string h_strbindcode=guangye.GetControlValue(fld_1146_2);
    string h_strdistictcode=guangye.GetControlValue(fld_1146_20); 
    fld_1147_1.Value= fld_1148_1.Value=h_strbindyear;  
    fld_1147_2.Value=fld_1148_2.Value=h_strbindcode;  
    fld_1147_3.Value=fld_1148_3.Value=h_strdistictcode; 
      //fld_1202_24.Value = "2";
    CheckMustAndFieldType();
    if (id == "0")
    {
        db.SqlString = "select mocode from " + GetModuleTableName("1146") + " where  fld_1146_1='" + h_strbindyear + "' and fld_1146_2='" + h_strbindcode.Trim() + "'";
        DataTable dt = db.GetDataTable();
        if (dt.Rows.Count > 0)
        {
            SetSESSION("alert", GetSESSION("alert") + fld_1146_1.SelectedItem.Value + "�꣬����ҵ���˴����Ѵ��ڣ�����������!");
           
        }
    } 
    if (GetSESSION("alert").Length > 0)
    {
        alertmess.InnerHtml = GetSESSION("alert");
        SetSESSION("alert", "");
    }
    else
    {
         if(CompareSum())
         { 
            if(id!="0")
            {
                SetSESSION("sql", guangye.GetUpdateSql(dtable_1202,filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetUpdateSql(dtable,filter, flds, types)+";"+guangye.GetUpdateSql(dtable1147,filter1147,flds1147,types1147)+";"+guangye.GetUpdateSql(dtable1148,filter1148,flds1148,types1148));
            }
            else
            {
                if(qiye_id!="0")
                {
                    SetSESSION("sql", guangye.GetUpdateSql(dtable_1202,filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable,flds,types)+";"+guangye.GetInsertSql(dtable1147,flds1147,types1147)+";"+guangye.GetInsertSql(dtable1148,flds1148,types1148));
                }
                else
                {
                        if (GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1146_2) + "'") != "")
                        {
                            filter_1202 = "mocode=" + GetFieldData("select mocode from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1146_2) + "'");
                            fld_1202_24.Value = GetFieldData("select fld_1202_24 from gmis_mo_1202 where fld_1202_2='" + guangye.GetControlValue(fld_1146_2) + "'");
                            SetSESSION("filter", filter_1202);
                            SetSESSION("sql", "");
                            //div_input.Visible = false;
                           // div_output.Visible = true;                          
                           SetSESSION("extsql", guangye.GetUpdateSql(dtable_1202, filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable, flds, types) + ";" + guangye.GetInsertSql(dtable1147, flds1147, types1147) + ";" + guangye.GetInsertSql(dtable1148, flds1148, types1148));
                            string scriptstr = "<scrip" + "t>__doOpenView('pop_alert.aspx?mid=" + mid + "&id=" +id+ "&pid="+pid+"&tid="+tid+"',300,200,10,50);</scrip" + "t>";
                            Page.RegisterStartupScript("popwin", scriptstr);

                        }
                        else
                        {
                            SetSESSION("sql", guangye.GetInsertSql(dtable_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable,flds,types)+";" + guangye.GetInsertSql(dtable1147,flds1147,types1147)+";" + guangye.GetInsertSql(dtable1148,flds1148,types1148)+";");
                        }
                }
            }
            
            if (GetSESSION("sql") != "")
            {
                Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id);
            } 
        }
    }
}

    private void Click_Fugai(object sender, System.EventArgs e)
    {
        filter_1202 = GetSESSION("filter");
        fld_1202_24.Value = "0";
        SetSESSION("sql", guangye.GetUpdateSql(dtable_1202,filter_1202, flds_1202, vflds_1202, types_1202) + ";" + guangye.GetInsertSql(dtable,flds,types)+";"+guangye.GetInsertSql(dtable1147,flds1147,types1147)+";"+guangye.GetInsertSql(dtable1148,flds1148,types1148));
        Response.Redirect("execommand.aspx?aid=" + StringUtility.StringToBase64("edit") + "&mid=" + mid + "&id=" + id);
    }

    private void Click_Fanhui(object sender, System.EventArgs e)
    {
        Response.Redirect("getpage.aspx?aid=" + StringUtility.StringToBase64("add") + "&mid=" + mid + "");
    }
    
private string GetRepeatAlertStr(string _dtable, string _filter)
{
    if (GetFieldData("select 1 from " + dtable_1202 + " where " + filter_1202) != "")
    {
        return "��������Ϊ�ظ�����,�뷵�ؼ�飡";
    }
    else 
    {
        return ""; 
    }
}
private void CompareBoth()
{
 string[] arr=new string[]{"fld_1146_77","fld_1146_78","fld_1146_46","fld_1146_48","fld_1146_50","fld_1146_52","fld_1146_35","fld_1147_8","fld_1147_9","fld_1147_10","fld_1147_13","fld_1147_39","fld_1147_42","fld_1147_44","fld_1147_45","fld_1147_46","fld_1147_47","fld_1147_67","fld_1147_76","fld_1147_77","fld_1147_78","fld_1147_79","fld_1147_80","fld_1147_81","fld_1147_82","fld_1147_83","fld_1147_84"};
    double[] darr=new double[27];
    try{
           for(int i=0;i<arr.Length;i++)
            {
            string h_value=guangye.GetControlValue(FindControl(arr[i]));
            if(h_value!="")
                darr[i]=Convert.ToDouble(h_value);
            }
            if(darr[0]<darr[1]) sbdata.Append("ָ����ϵ�����㣺17��18,");
            if(darr[0]<darr[2]) sbdata.Append("ָ����ϵ�����㣺17��19,");
            if(darr[3]<darr[4]) sbdata.Append("ָ����ϵ�����㣺20��21,");
            if(darr[3]<darr[5]) sbdata.Append("ָ����ϵ�����㣺20��22,");
            if(darr[6]<darr[7]) sbdata.Append("ָ����ϵ�����㣺6��37,");
            if(darr[7]<darr[8]) sbdata.Append("ָ����ϵ�����㣺37��38,");
            if(darr[7]<darr[9]) sbdata.Append("ָ����ϵ�����㣺37��39,");
            if(darr[7]<darr[10]) sbdata.Append("ָ����ϵ�����㣺37��42,");
            if(darr[11]<darr[12]) sbdata.Append("ָ����ϵ�����㣺68��71,");
            if(darr[13]<darr[14]) sbdata.Append("ָ����ϵ�����㣺73��74,");
            if(darr[15]<darr[16]) sbdata.Append("ָ����ϵ�����㣺75��76,");
            if(darr[17]<darr[18]) sbdata.Append("ָ����ϵ�����㣺96��105,");
            if(darr[19]<darr[20]) sbdata.Append("ָ����ϵ�����㣺106��107,");
            if(darr[21]<darr[22]) sbdata.Append("ָ����ϵ�����㣺108��109,");           
            if(darr[22]<darr[23]) sbdata.Append("ָ����ϵ�����㣺109��110,");
            if(darr[21]<darr[24]) sbdata.Append("ָ����ϵ�����㣺108��111,");        
            if(darr[25]<darr[26]) sbdata.Append("ָ����ϵ�����㣺112��113,");          
       }
    catch{}
    
    <%--if(sb.Length>0) 
    {
      alertmess.InnerText = sb.ToString().Trim(',');
      return false;
    }
    else
    {
    alertmess.InnerText="";
    return true;
    }--%>
}
private bool CompareSum()
{
 string[] arr1=new string[]{"fld_1147_57","fld_1147_58","fld_1147_59","fld_1147_60","fld_1147_61","fld_1147_62","fld_1147_63","fld_1147_64","fld_1147_65","fld_1147_66"};
   string[] arr2=new string[]{"fld_1147_57","fld_1147_67","fld_1147_77","fld_1147_79","fld_1147_83","fld_1147_76","fld_1147_82"};
   string[] arr3=new string[]{"fld_1147_67","fld_1147_68","fld_1147_69","fld_1147_70","fld_1147_71","fld_1147_72","fld_1147_73","fld_1147_74","fld_1147_75"};
   string[] arr4=new string[]{"fld_1147_58","fld_1147_68","fld_1147_78","fld_1147_80","fld_1147_84"};
   string[] arr5=new string[]{"fld_1146_34","fld_1146_35","fld_1146_36"};
   string[] arr6=new string[]{"fld_1146_37","fld_1146_38","fld_1146_39"};
   string[] arr7=new string[]{"fld_1146_41","fld_1146_42","fld_1146_43"};
   string[] arr8=new string[]{"fld_1147_30","fld_1147_31","fld_1147_32"};
   string[] arr9=new string[]{"fld_1147_39","fld_1147_40","fld_1147_41"};
   string[] arr10=new string[]{"fld_1147_43","fld_1147_44","fld_1147_46"};
  Check_Data(arr1,1);
  Check_Data(arr2,2);
  Check_Data(arr3,3);
  Check_Data(arr4,4);
   Check_Data(arr5,5);
   Check_Data(arr6,6);
   Check_Data(arr7,7);
   Check_Data(arr8,8);
   Check_Data(arr9,9);
   Check_Data(arr10,10);
   CompareBoth();
   if(sbdata.Length>0) 
    {
      alertmess.InnerText = sbdata.ToString().Trim(',');
      return false;
    }
    else
    {
    alertmess.InnerText="";
    return true;
    }
   <%--if(Check_Data(arr1,1)&&Check_Data(arr2,2)&&Check_Data(arr3,3)&&Check_Data(arr4,4)&& Check_Data(arr5,5)&&Check_Data(arr6,6)&&Check_Data(arr7,7)&&Check_Data(arr8,8)&&Check_Data(arr9,9)&&Check_Data(arr10,10)) return true;
   else return false;--%>
}
private void Check_Data(string[] arr,int j)
{

    double[] darr=new double[10];
    double sum=0.0;
    if(j==2)
    {
        try{
            darr[0]=Convert.ToDouble(guangye.GetControlValue(FindControl(arr[0])));
            for(int i=1;i<5;i++)
              {
                string h_value=guangye.GetControlValue(FindControl(arr[i]));
                if(h_value!="") darr[i]=Convert.ToDouble(h_value);
                sum+=darr[i];               
              }
            darr[5]=Convert.ToDouble(guangye.GetControlValue(FindControl(arr[5])));
            sum-=darr[5];
            darr[6]=Convert.ToDouble(guangye.GetControlValue(FindControl(arr[6])));
            sum-=darr[6];
           }
       catch{}
           if(darr[0]!=sum) sbdata.Append("ָ����ϵ�����㣺86=96+106+108+112-105-111");
    }
   else
    {
        try{
              darr[0]=Convert.ToDouble(guangye.GetControlValue(FindControl(arr[0])));
              for(int i=1;i<arr.Length;i++)
               { 
                string h_value=guangye.GetControlValue(FindControl(arr[i]));
                if(h_value!="") darr[i]=Convert.ToDouble(h_value);
                sum+=darr[i];
               }
            }
       catch{} 
        if(j==1)    if(darr[0]!=sum) sbdata.Append("ָ����ϵ�����㣺86=87+88+89+90+91+92+93+94+95,");
        if(j==3)    if(darr[0]!=sum) sbdata.Append("ָ����ϵ�����㣺96=97+98+99+100+101+102+103+104,");
        if(j==4)    if(darr[0]>sum) sbdata.Append("ָ����ϵ�����㣺87��97+107+109+113,");
        if(j==5)    if(darr[0]!=sum) sbdata.Append("ָ����ϵ�����㣺5=6+7,");
        if(j==6)    if(darr[0]!=sum) sbdata.Append("ָ����ϵ�����㣺8=9+10,");
        if(j==7)    if(darr[0]<sum) sbdata.Append("ָ����ϵ�����㣺12��13+14,");
         if(j==8)    if(darr[0]!=sum) sbdata.Append("ָ����ϵ�����㣺59=60+61,");
          if(j==9)    if(darr[0]!=sum) sbdata.Append("ָ����ϵ�����㣺68=69+70,");
           if(j==10)    if(darr[0]!=sum) sbdata.Append("ָ����ϵ�����㣺72=73+75,");
    }
    <%--if(sb.Length>0) 
    {
      alertmess.InnerText = sb.ToString();
      return false;
    }
    else
    {
    alertmess.InnerText="";
    return true;
    } --%>
}
private void Click_Search(object sender,System.EventArgs e)
{
    string scriptstr="";
    if(guangye.GetControlValue(fld_1146_2).Length>0)
    {
        alertmess.InnerText="";
        scriptstr="<scrip"+"t>__doOpenView('pop_search_company.aspx?mid="+mid+"&year="+guangye.GetControlValue(fld_1146_1)+"&keynumber="+StringUtility.StringToBase64(guangye.GetControlValue(fld_1146_2))+"',800,600,10,50);</scrip"+"t>";
         Page.RegisterStartupScript("popwin", scriptstr);
    }
    else alertmess.InnerText="�������ѯ���ݣ�";
   
   
}
private bool hasResults(string _dtable,string _filter)
{
    return (GetFieldData("select top 1 1 from " + _dtable + " where " + _filter + " ") != "") ? true : false;
     
}
</script>
<script language="javascript">
function Go_Hidden(str)
{
if(str=="1") 
{
document.getElementById("table1").style.display="none";
document.getElementById("td1").innerHTML="<img src=\"images/node_opened.gif\" onclick=\"Go_Show('1')\" onmouseover=\"this.style.cursor='hand';\"  width=\"17\" height=\"17\" >";
}
if(str=="2") 
{
document.getElementById("table2").style.display="none";
document.getElementById("td2").innerHTML="<img src=\"images/node_opened.gif\" onclick=\"Go_Show('2')\" onmouseover=\"this.style.cursor='hand';\"   width=\"17\" height=\"17\" >";
}
if(str=="3") 
{
document.getElementById("table3").style.display="none";
document.getElementById("td3").innerHTML="<img src=\"images/node_opened.gif\" onclick=\"Go_Show('3')\"  onmouseover=\"this.style.cursor='hand';\" width=\"17\" height=\"17\" >";
}
}
function Go_Show(str)
{
if(str=="1") 
{
document.getElementById("table1").style.display="block";
document.getElementById("td1").innerHTML="<img src=\"images/node_closed.gif\" onclick=\"Go_Hidden('1')\" onmouseover=\"this.style.cursor='hand';\"   width=\"17\" height=\"17\" >";
}
if(str=="2") 
{
document.getElementById("table2").style.display="block";
document.getElementById("td2").innerHTML="<img src=\"images/node_closed.gif\" onclick=\"Go_Hidden('2')\" onmouseover=\"this.style.cursor='hand';\" width=\"17\" height=\"17\" >";
}
if(str=="3") 
{
document.getElementById("table3").style.display="block";
document.getElementById("td3").innerHTML="<img src=\"images/node_closed.gif\" onclick=\"Go_Hidden('3')\" onmouseover=\"this.style.cursor='hand';\" width=\"17\" height=\"17\" >";
}
}
function leavethis(str1,str2,str3)
{
    f1=document.getElementById("fld_"+str1+"").value*1;
    f2=document.getElementById("fld_"+str2+"").value*1;
    if(f1<f2)
    {
        switch(str3)
        {
//            case "1":
//                alert('ָ����ϵ�����㣺17��18');
//                break;
//           case "2":
//                alert('ָ����ϵ�����㣺17��19');
//                break;
 //                case "3":
//                alert('ָ����ϵ�����㣺20��21');
//                break;
//                 case "4":
//                alert('ָ����ϵ�����㣺20��22');
//                break;
//                 case "5":
//                alert('ָ����ϵ�����㣺6��37');
//                break;
//                  case "6":
//                alert('ָ����ϵ�����㣺37��38');
//                break;
//                  case "7":
//                alert('ָ����ϵ�����㣺37��39');
//                break;
//                case "8":
//                alert('ָ����ϵ�����㣺37��42');
//                break;
                 case "9":
                alert('ָ����ϵ�����㣺43��44');
                break;
                 case "10":
                alert('ָ����ϵ�����㣺62��63');
                break;
                 case "11":
                alert('ָ����ϵ�����㣺66��67');
                break;
//                 case "12":
//                alert('ָ����ϵ�����㣺68��71');
//                break;
//                 case "13":
//                alert('ָ����ϵ�����㣺73��74');
//                break;
//                 case "14":
//                alert('ָ����ϵ�����㣺75��76');
//                break;
                 case "15":
                alert('ָ����ϵ�����㣺78��79');
                break;
                case "16":
                alert('ָ����ϵ�����㣺81��82');
                break;
                 case "17":
                alert('ָ����ϵ�����㣺84��85');
//                break;
//                 case "18":
//                alert('ָ����ϵ�����㣺96��105');
//                break;
//                 case "19":
//                alert('ָ����ϵ�����㣺106��107');
//                break;
//                case "20":
//                alert('ָ����ϵ�����㣺108��109');
//                break;
//                case "21":
//                alert('ָ����ϵ�����㣺109��110');
//                break;
//                case "22":
//                alert('ָ����ϵ�����㣺108��111');
//                break;
//                case "23":
//                alert('ָ����ϵ�����㣺112��113');
//                break;
        }
       document.getElementById("fld_"+str2+"").value="";
       document.getElementById("fld_"+str2+"").focus();
    }
}
</script>
<body>
<form id="form1" runat="server">
<!--����������-->
    <!--#include file="toolbarleft.aspx"-->
    <!--�ұ߹̶���ť-->
     
    <!--#include file="toolbar1146.aspx"-->
    <!--�ұ߹̶���ť-->

    <!--#include file="toolbarright.aspx"-->
    <!--����������-->
    <!--����-->
<!--����������--> 
    <input id="fld_1202_24" runat="server" type="hidden" value="2" />
  <input id="fld_1147_1" runat="server" type="hidden">
   <input id="fld_1147_2" runat="server" type="hidden">
    <input id="fld_1147_3" runat="server" type="hidden">
     <input id="fld_1148_1" runat="server" type="hidden">
   <input id="fld_1148_2" runat="server" type="hidden">
    <input id="fld_1148_3" runat="server" type="hidden">
    <div id="div_input" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
  <tr>
    <td width="70%"  ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" class="font_2635B_000">��ҵ��ҵ��Ⱦ�ŷż������������</td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<!--����������-->

  <table width="100%"  border="0" cellpadding="3" cellspacing="1" class="table_graybgcolor" style=" margin-bottom:5px; margin-top:5px; ">
    <tr>
      <td rowspan="2" align="right" style="width:12%"  class="td01_viewcontent_title">ͳ�����</td>
      <td rowspan="2" align="left" style="width:10%"  class="td_viewcontent_content">
        <asp:DropDownList ID="fld_1146_1" runat="server"  style="width:98%"></asp:DropDownList>
      </td>
      <td rowspan="2" align="right" style="width:10%"   class="td01_viewcontent_title"><span style="color:red">*</span>1����ҵ���˴���</td>
      <td rowspan="2" align="left" style="width:14%"  class="td_viewcontent_content">
  <input id="fld_1146_2" runat="server" type="text"><input id="fld_1146_2_code" runat="server" type="hidden" style="width:70%; " ><asp:LinkButton id="btn_search" runat="server" OnClick="Click_Search"><img src="images\icons\search.gif" style="cursor:hand" title="��ѯ" border="0" /></asp:LinkButton ></td>
      <td rowspan="2" align="right" style="width:9%"  class="td01_viewcontent_title">3��������</td>
      <td rowspan="2" align="left" style="width:11%"  class="td_viewcontent_content"><input id="fld_1146_5" runat="server" name="textfield" type="text" style="width:90%; " ></td>
      <td rowspan="2" align="right"  style="width:10%"  class="td01_viewcontent_title">4����ҵ����λ��</td>
      <td class="td_viewcontent_content" style="width:27%" >���ľ���
      <input name="textfield" type="text" id="fld_1146_6" runat="server" style="width:7%; ">��
      <input name="textfield" type="text" id="fld_1146_7" runat="server" style="width:7% ">��
      <input name="textfield" type="text" id="fld_1146_8" runat="server" style="width:7%; ">��
      </td>
    </tr>
    <tr>
      <td class="td_viewcontent_content">����γ��
        <input name="textfield" type="text" id="fld_1146_9" runat="server" style="width:7%; ">��
        <input name="textfield" type="text" id="fld_1146_10" runat="server" style="width:7%; ">��
        <input name="textfield" type="text" id="fld_1146_11" runat="server" style="width:7%; ">��</td>
    </tr>
    <tr>
      <td align="right"  class="td01_viewcontent_title">2����ҵ��ϸ����</td>
      <td colspan="3" align="left"   class="td_viewcontent_content">
        <input type="text" id="fld_1146_4" style="width:95%" runat="server" name="textfield">
</td>
      <td align="right"  class="td01_viewcontent_title">�ص���ȾԴ��ʶ</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">
      <asp:CheckBoxList ID="fld_1146_3" RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>
</td>
    </tr>
    <tr>
      <td rowspan="4" align="right"  class="td01_viewcontent_title">5�����˼���ϵ��</td>
      <td colspan="3" align="left"  class="td_viewcontent_content">��&nbsp;&nbsp;&nbsp;&nbsp;��
      <input name="textfield" id="fld_1146_12" runat="server" type="text" style="width:30% ">
      <input name="textfield"  type="text" id="fld_1146_16" runat="server" style="width:30% "></td>
      <td rowspan="3" align="right"  class="td01_viewcontent_title">6����ҵ��ϸ��ַ����������</td>
      <td rowspan="3" align="left"  class="td_viewcontent_content">
        <textarea name="textarea" id="fld_1146_19" runat="server" style="width:90%; height:70px; "></textarea>
     </td>
      <td rowspan="2" align="right"  class="td01_viewcontent_title">7���Ǽ�ע������</td>
   <td rowspan="2" class="td_viewcontent_content"><asp:DropDownList ID="fld_1146_21" runat="server"  style="width:95%;" ></asp:DropDownList></td>
  </tr>
    <tr>
      <td colspan="3" align="left"  class="td_viewcontent_content">��&nbsp;&nbsp;&nbsp;&nbsp;��
      <input name="textfield" type="text" id="fld_1146_13" runat="server" style="width:30% ">
      <input name="textfield" type="text" id="fld_1146_17"  runat="server" style="width:30% "></td>
    </tr>
    <tr>
      <td colspan="3" align="left"  class="td_viewcontent_content">��&nbsp;&nbsp;&nbsp;&nbsp;��
      <input name="textfield" type="text" id="fld_1146_14" runat="server" style="width:30% ">
      <input name="textfield" type="text" id="fld_1146_18" runat="server" style="width:30% "></td>
      <td align="right"  class="td01_viewcontent_title">8����ҵ���</td>
      <td class="td_viewcontent_content"><asp:DropDownList ID="fld_1146_22" runat="server"  style="width:95%;" ></asp:DropDownList></td>
    </tr>
    <tr>
      <td colspan="3" align="left"  class="td_viewcontent_content">��������
      <input name="textfield" type="text" id="fld_1146_15" runat="server" style="width:35% "></td>
      <td align="right"  class="td_viewcontent_title">�����������</td>
      <td align="left"  class="td_viewcontent_content"><asp:DropDownList ID="fld_1146_20" runat="server"  style="width:95%;" ></asp:DropDownList></td>
      <td align="right"  class="td_viewcontent_title">9����ҵ��ģ</td>
      <td class="td_viewcontent_content"><asp:DropDownList ID="fld_1146_23" runat="server"  style="width:95%;" ></asp:DropDownList></td>
    </tr>
    <tr>
      <td align="right"  class="td01_viewcontent_title">10����ҵʱ��</td>
      <td align="left"  class="td_viewcontent_content"><input name="textfield" type="text" id="fld_1146_24" runat="server" style="width:80%; "></td>
      <td align="right"  class="td01_viewcontent_title">11����ˮȥ������</td>
      <td align="left"  class="td_viewcontent_content"><asp:DropDownList ID="fld_1146_25" runat="server"  style="width:95%;" ></asp:DropDownList></td>
      <td align="right"  class="td01_viewcontent_title">12������ˮ�����</td>
      <td align="left"  class="td_viewcontent_content"><asp:DropDownList ID="fld_1146_26" runat="server"  style="width:95%;" AutoPostBack="true" ></asp:DropDownList></td>
      <td align="right"  class="td01_viewcontent_title">����ˮ������</td>
      <td class="td_viewcontent_content"><input name="textfield" id="fld_1146_27" runat="server" type="text" style="width:95%; "></td>
    </tr>
    <tr>
      <td align="right"  class="td01_viewcontent_title">13��������ˮ��������</td>
      <td colspan="3" align="left"  class="td_viewcontent_content"><input name="textfield" id="fld_1146_28" runat="server" type="text" style="width:95%; "></td>
      <td align="right"  class="td01_viewcontent_title">������ˮ��������</td>
      <td colspan="3" align="left"  class="td_viewcontent_content"><input name="textfield" id="fld_1146_29" runat="server" type="text" style="width:95%; "></td>
    </tr>
</table>

  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td01_viewcontent_content">��1-1��</td>
      <td width="21" class="td01_viewcontent_content" id="td1" style="padding-right:5px"><img src="images/node_closed.gif" id="img1" onclick="Go_Hidden('1')" onmouseover="this.style.cursor='hand';" id="img1"  width="17" height="17" ></td>
    </tr>
  </table>
  <div id="table1" style="display:block" runat="server">
  <table width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
    <tr>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title">һ����ҵ�������</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">9</td>
      <td align="center"  class="td01_viewcontent_title">���У�ȼ��ú������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_38"  runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">19</td>
      <td align="left"  class="td01_viewcontent_title">13����ҵ��¯��</td>
      <td align="center"  class="td01_viewcontent_content">̨/����</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_46"  runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_title">1����ҵ�ܲ�ֵ���ּۣ�</td>
      <td align="center"  class="td01_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td01_viewcontent_content">
        <input name="textfield" type="text" id="fld_1146_30" runat="server" style="width:70px; ">
      </td>
      <td align="center"  class="td01_viewcontent_content">10</td>
      <td align="center"  class="td01_viewcontent_title">����ԭ��ú������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_39" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">20</td>
      <td align="left"  class="td01_viewcontent_title">���У��̳��ŷŴ���</td>
      <td align="center"  class="td01_viewcontent_content">̨/����</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" type="text" id="fld_1146_48"  runat="server"  style="width:70px; ">
    </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">2</td>
      <td align="center"  class="td01_viewcontent_title">2�������ϡ��ۺ����ò�Ʒ��ֵ</td>
      <td align="center"  class="td01_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_31" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">11</td>
      <td align="center"  class="td01_viewcontent_title">7��ȼ��úƽ�����</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_40" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">21</td>
      <td align="left"  class="td01_viewcontent_title">���������ŷŴ���</td>
      <td align="center"  class="td01_viewcontent_content">̨/����</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" type="text" id="fld_1146_50"  runat="server"  style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">3</td>
      <td align="center"  class="td01_viewcontent_title">3����ҵרְ������Ա��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_32" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">12</td>
      <td align="center"  class="td01_viewcontent_title">8��ȼ���������������������ã�</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_41" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">22</td>
      <td align="center"  class="td01_viewcontent_title">14����ҵ¯Ҥ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">
        <input name="textfield" type="text" id="fld_1146_52" runat="server"   style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">4</td>
      <td align="center"  class="td01_viewcontent_title">4������������ʱ��</td>
      <td align="center"  class="td01_viewcontent_content">Сʱ</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_33" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">13</td>
      <td align="center"  class="td01_viewcontent_title">���У�����</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_42"   runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">23</td>
      <td align="center"  class="td01_viewcontent_title">���У��̳��ŷŴ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_53" runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">5</td>
      <td align="center"  class="td01_viewcontent_title">5����ҵ��ˮ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" id="fld_1146_34" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">14</td>
      <td align="center"  class="td01_viewcontent_title">��������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_43"  runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">24</td>
      <td align="center"  class="td01_viewcontent_title">���У����������ŷŴ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_54"   runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">6</td>
      <td align="center"  class="td01_viewcontent_title">�����У�����ˮ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_35" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">15</td>
      <td align="center"  class="td01_viewcontent_title">9������ƽ�����</td>
      <td align="center"  class="td01_viewcontent_content">%</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_44" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title">15����Ҫ��Ʒ���</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">7</td>
      <td align="center"  class="td01_viewcontent_title">�ظ���ˮ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_36" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">16</td>
      <td align="center"  class="td01_viewcontent_title">10���ྻȼ��������</td>
      <td align="center"  class="td01_viewcontent_content">��������</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_45" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">25</td>
      <td align="center"  class="td01_viewcontent_title"><input name="textfield" type="text" id="fld_1146_55" runat="server"  style="width:80px; "></td>
      <td align="center"  class="td01_viewcontent_content">
        <input name="textfield" id="fld_1146_56" runat="server"  type="text" style="width:50px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" type="text" id="fld_1146_57" runat="server"  style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">8</td>
      <td align="center"  class="td01_viewcontent_title">6����ҵú̼������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_37" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">17</td>
      <td align="center"  class="td01_viewcontent_title">11����̿������</td>
      <td align="center"  class="td01_viewcontent_content">��</td><%--nfocusout="leavethis('1146_77','1146_78','1')"--%>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_77"  runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">26</td>
      <td align="center"  class="td01_viewcontent_title"><input name="textfield" id="fld_1146_58" runat="server"  type="text" style="width:80px; "></td>
      <td align="center"  class="td01_viewcontent_content">
        <input name="textfield" id="fld_1146_59" runat="server"  type="text" style="width:50px; ">
      </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_60" runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td01_viewcontent_title">&nbsp;</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content">18</td>
      <td align="center"  class="td01_viewcontent_title">12������ȼ��������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" id="fld_1146_78" runat="server"   type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">27</td>
      <td align="center"  class="td01_viewcontent_title"><input name="textfield" id="fld_1146_61" runat="server"  type="text" style="width:80px; "></td>
      <td align="center"  class="td01_viewcontent_content">
        <input name="textfield" id="fld_1146_62" runat="server"  type="text" style="width:50px; ">
      </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_63" runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
</table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" style=" margin-bottom:5px; ">
    <tr>
      <td class="font1220_000000">ָ����ϵ��5=6+7,8=9+10,12��13+14,17��18,17��19,20��21,20��22</td>
    </tr>
  </table>
  </div>
 
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td01_viewcontent_content"> ��1-1������1</td>
      <td width="21" class="td01_viewcontent_content" id="td2" style="padding-right:5px"><img src="images/node_closed.gif" onclick="Go_Hidden('2')" onmouseover="this.style.cursor='hand';" width="17" height="17"></td>
    </tr>
  </table>
   <div id="table2" visible="true" runat="server">
  <table width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
    <tr>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> 14.��Ҫ�ж��к�ԭ���������� </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">42</td>
      <td align="center"  class="td01_viewcontent_title"> 8.��ҵ��ˮ�ŷŴ���� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_13"  runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">58</td>
      <td align="center"  class="td01_viewcontent_title"> ��10�����۸� </td>
      <td align="center"  class="td01_viewcontent_content"> ǧ�� </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_29" runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">26</td>
      <td align="center"  class="td01_viewcontent_title"> (1)<input name="textfield" id="fld_1146_64" runat="server" type="text" style="width:90px; "> </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_65" runat="server" type="text" style="width:50px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_66" runat="server"  type="text" style="width:70px; ">
      </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title">


9.��ҵ��ˮ����Ⱦ��ȥ����</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> ������ҵ���� </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">27</td>
      <td align="center"  class="td01_viewcontent_title"> (2)<input name="textfield" id="fld_1146_67" runat="server"  type="text" style="width:90px; "> </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_68" runat="server" type="text" style="width:50px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_69" runat="server"  type="text" style="width:70px; ">
      <td align="center"  class="td01_viewcontent_content">43</td>
      <td align="center"  class="td01_viewcontent_title"> ��1����ѧ������ </td>
      <td align="center"  class="td01_viewcontent_content">��ǧ�ˡ�</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_14" onfocusout="leavethis('1147_14','1147_15','9')" runat="server"   type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">59</td>
      <td align="center"  class="td01_viewcontent_title"> 1.��ҵ�����ŷ��� </td>
      <td align="center"  class="td01_viewcontent_content"> ��������� </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"   id="fld_1147_30" runat="server" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">28</td>
      <td align="center"  class="td01_viewcontent_title"> (3)<input name="textfield" id="fld_1146_70" runat="server"  type="text" style="width:90px; "> </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_71" runat="server"  type="text" style="width:50px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_72" runat="server" type="text" style="width:70px; ">
      <td align="center"  class="td01_viewcontent_content">44</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�����������ʩȥ���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_15" onfocusout="leavethis('1147_14','1147_15','9')" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">60</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�ȼ��ȼ�������ŷ��� </td>
      <td align="center"  class="td01_viewcontent_content"> ��������� </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_31" runat="server" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">29</td>
      <td align="center"  class="td01_viewcontent_title"> 15.��ˮ�ŷſ��� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_73" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">45</td>
      <td align="center"  class="td01_viewcontent_title">��2������ </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_16" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">61</td>
      <td align="center"  class="td01_viewcontent_title"> �������չ������ŷ��� </td>
      <td align="center"  class="td01_viewcontent_content"> ��������� </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_32"  runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">30</td>
      <td align="center"  class="td01_viewcontent_title"> 16.ֱ�ź�����ˮ�ŷſ��� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" id="fld_1146_74" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">46</td>
      <td align="center"  class="td01_viewcontent_title">����3��ʯ����</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_17" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">62</td>
      <td align="center"  class="td01_viewcontent_title"> 2.����������ʩ�� </td>
      <td align="center"  class="td01_viewcontent_content"> �� </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_33" onfocusout="leavethis('1147_33','1147_34','10')" runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">31</td>
      <td align="center"  class="td01_viewcontent_title">17.��ˮ��Ⱦ�����߼����������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_75" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">47</td>
      <td align="center"  class="td01_viewcontent_title"> ����4���ӷ��� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_18" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">63</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�������ʩ�� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_34" runat="server" onfocusout="leavethis('1147_33','1147_34','10')"  type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">32</td>
      <td align="center"  class="td01_viewcontent_title"> 18.������Ⱦ�����߼���������� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1146_76" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">48</td>
      <td align="center"  class="td01_viewcontent_title"> ����5���軯�� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_19" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">64</td>
      <td align="center"  class="td01_viewcontent_title"> 3.����������ʩ�������� </td>
      <td align="center"  class="td01_viewcontent_content">��������/ʱ </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_35" runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> ������ҵ��ˮ </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title"> 10.��ҵ��ˮ����Ⱦ���ŷ��� </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">65</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�������ʩ�������� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��/ʱ</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_36" runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">33</td>
      <td align="center"  class="td01_viewcontent_title"> 1.��ˮ������ʩ�� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_4" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">49</td>
      <td align="center"  class="td01_viewcontent_title"> ��1����ѧ������ </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_20" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">66</td>
      <td align="center"  class="td01_viewcontent_title"> 4.����������ʩ���з��� </td>
      <td align="center"  class="td01_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_37" onfocusout="leavethis('1147_37','1147_38','11')" runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">34</td>
      <td align="center"  class="td01_viewcontent_title"> 2.��ˮ������ʩ�������� </td>
      <td align="center"  class="td_viewcontent_content">��/��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_5" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">50</td>
      <td align="center"  class="td01_viewcontent_title"> ��2������ </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_21" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">67</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�������ʩ���з��� </td>
      <td align="center"  class="td01_viewcontent_content">��Ԫ</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_38" runat="server" onfocusout="leavethis('1147_37','1147_38','11')"  type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">35</td>
      <td align="center"  class="td01_viewcontent_title"> 3.��ˮ������ʩ���з��� </td>
      <td align="center"  class="td_viewcontent_content"> ��Ԫ </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_6" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">51</td>
      <td align="center"  class="td01_viewcontent_title"> ��3��ʯ���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_22" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">68</td>
      <td align="center"  class="td01_viewcontent_title"> 5.��������ȥ���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_39"  runat="server"  type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">36</td>
      <td align="center"  class="td01_viewcontent_title"> 4.��ҵ��ˮ������ </td>
      <td align="center"  class="td_viewcontent_content"> �� </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_7"  runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">52</td>
      <td align="center"  class="td01_viewcontent_title"> ��4���ӷ��� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" type="text"  id="fld_1147_23" runat="server"  style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">69</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�ȼ��ȼ�չ�����ȥ���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_40"  runat="server"  type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">37</td>
      <td align="center"  class="td01_viewcontent_title"> 5.��ҵ��ˮ�ŷ��� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_8" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">53</td>
      <td align="center"  class="td01_viewcontent_title">��5���軯��</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" type="text"  id="fld_1147_24" runat="server"  style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">70</td>
      <td align="center"  class="td01_viewcontent_title"> �������չ�����ȥ���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_41" runat="server"  type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">38</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�ֱ�����뺣�� </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_9"  runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">54</td>
      <td align="center"  class="td01_viewcontent_title"> ��6���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" type="text"  id="fld_1147_25" runat="server"  style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">71</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�����������ʩȥ���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_42"  runat="server"  type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">39</td>
      <td align="center"  class="td01_viewcontent_title"> ����������������ˮ������ </td>
      <td align="center"  class="td_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_10"  runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">55</td>
      <td align="center"  class="td01_viewcontent_title"> ��7��Ǧ </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" type="text"  id="fld_1147_26" runat="server"  style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">72</td>
      <td align="center"  class="td01_viewcontent_title"> 6.���������ŷ��� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_43"  runat="server" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">40</td>
      <td align="center"  class="td01_viewcontent_title"> 6.������ˮ������CODŨ�� </td>
      <td align="center"  class="td_viewcontent_content"> mg/L </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_11" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">56</td>
      <td align="center"  class="td01_viewcontent_title"> ��8���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" type="text"  id="fld_1147_27" runat="server"  style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">73</td>
      <td align="center"  class="td01_viewcontent_title"> ���У�ȼ��ȼ�չ������ŷ��� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_44"   runat="server"  type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">41</td>
      <td align="center"  class="td01_viewcontent_title"> 7.������ˮ�����İ���Ũ�� </td>
      <td align="center"  class="td_viewcontent_content">mg/L</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_12" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">57</td>
      <td align="center"  class="td01_viewcontent_title"> ��9���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" type="text"  id="fld_1147_28" runat="server"  style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">74</td>
      <td align="center"  class="td01_viewcontent_title"> ���У��ŷŴ���� </td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_45"  runat="server"  type="text" style="width:70px; "></td>
    </tr>
  </table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" style=" margin-bottom:5px; ">
    <tr>
      <td class="font1220_000000"> ָ����ϵ��6��37,37��38,37��39,37��42,43��44,59=60+61,62��63,66��67,68=69+70,68��71,72=73+75,73��74 </td>
    </tr>
  </table>
  </div>
 
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="table_bold_999_01" >
    <tr>
      <td align="center" class="td01_viewcontent_content"> ��1-1������2</td>
      <td width="21" class="td01_viewcontent_content" id="td3" style="padding-right:5px"><img src="images/node_closed.gif" onclick="Go_Hidden('3')" onmouseover="this.style.cursor='hand';" width="17" height="17"></td>
    </tr>
  </table>
   <div id="table3" visible="true" runat="server">
  <table width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" class="table_graybgcolor" >
    <tr>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td align="center"  class="td01_viewcontent_content">����ʵ��</td>
      <td align="center"  class="td01_viewcontent_content">����</td>
      <td align="center"  class="td01_viewcontent_title">ָ������</td>
      <td align="center"  class="td01_viewcontent_content">������λ</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content">����ʵ��</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content">1</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_title">��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content">1</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">75</td>
      <td align="center"  class="td01_viewcontent_title">���У��������չ������ŷ���</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_46"  runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">89</td>
      <td align="center"  class="td01_viewcontent_title">��3����ú��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_60" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">104</td>
      <td align="center"  class="td01_viewcontent_title">��8����������</td>
      <td align="center"  class="td01_viewcontent_content"> ��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_75" runat="server" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">76</td>
      <td align="center"  class="td01_viewcontent_title">���У��ŷŴ����</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_47"  runat="server"  type="text" style="width:70px; ">
      </td>
      <td align="center"  class="td01_viewcontent_content">90</td>
      <td align="center"  class="td01_viewcontent_title">��4��¯��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_61"  runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">105</td>
      <td align="center"  class="td01_viewcontent_title">���У��ۺ���������������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_76" runat="server" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">77</td>
      <td align="center"  class="td01_viewcontent_title">7.��������ȥ����</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_48" onfocusout="leavethis('1147_48','1147_50','15')" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">91</td>
      <td align="center"  class="td01_viewcontent_title">��5��ú�ʯ</td>
      <td align="center"  class="td01_viewcontent_content">���֡�</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_62" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">106</td>
      <td align="center"  class="td01_viewcontent_title">3.��ҵ�������������</td>
      <td align="center"  class="td01_viewcontent_content"> ��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_77" runat="server" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">78</td>
      <td align="center"  class="td01_viewcontent_title">8.���������ŷ���</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_49" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">92</td>
      <td align="center"  class="td01_viewcontent_title">��6��β��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_63" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">107</td>
      <td align="center"  class="td01_viewcontent_title">���У�Σ�շ���������</td>
      <td align="center"  class="td01_viewcontent_content"> ��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_78"  runat="server" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">79</td>
      <td align="center"  class="td01_viewcontent_title">���У��ŷŴ����</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_50" onfocusout="leavethis('1147_48','1147_50','15')" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">93</td>
      <td align="center"  class="td01_viewcontent_title"> ��7�������Է��� </td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_64" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">108</td>
      <td align="center"  class="td01_viewcontent_title">4.��ҵ������ﴦ����</td>
      <td align="center"  class="td01_viewcontent_content"> ��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_79"  runat="server" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">80</td>
      <td align="center"  class="td01_viewcontent_title">9.�̳�ȥ����</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_51" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">94</td>
      <td align="center"  class="td01_viewcontent_title">��8������ʯ��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_65" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">109</td>
      <td align="center"  class="td01_viewcontent_title">���У�Σ�շ��ﴦ����</td>
      <td align="center"  class="td01_viewcontent_content"> ��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_80"  runat="server" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">81</td>
      <td align="center"  class="td01_viewcontent_title">10.�̳��ŷ���</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_52" onfocusout="leavethis('1147_52','1147_53','16')" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">95</td>
      <td align="center"  class="td01_viewcontent_title"> ��9����������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_66" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">110</td>
      <td align="center"  class="td01_viewcontent_title">���У��������д��ó�������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_81" runat="server" type="text" style="width:70px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">82</td>
      <td align="center"  class="td01_viewcontent_title">���У��ŷŴ����</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_53" runat="server" onfocusout="leavethis('1147_52','1147_53','16')" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">96</td>
      <td align="center"  class="td01_viewcontent_title"> 2.��ҵ��������ۺ�������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_67" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">111</td>
      <td align="center"  class="td01_viewcontent_title">���У���������������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_82" runat="server" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">83</td>
      <td align="center"  class="td01_viewcontent_title">11.��ҵ�۳�ȥ����</td>
      <td align="center"  class="td01_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_54" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">97</td>
      <td align="center"  class="td01_viewcontent_title">��1��Σ�շ���</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_68" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">112</td>
      <td align="center"  class="td01_viewcontent_title">5.��ҵ��������ŷ���</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_83"  runat="server" type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">84</td>
      <td align="center"  class="td01_viewcontent_title">12.��ҵ�۳��ŷ���</td>
      <td align="center"  class="td_viewcontent_content">ǧ��</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_55" onfocusout="leavethis('1147_55','1147_56','17')"  runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">98</td>
      <td align="center"  class="td01_viewcontent_title">��2��ұ������</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" id="fld_1147_69" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">113</td>
      <td align="center"  class="td01_viewcontent_title">���У�Σ�շ����ŷ���</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td colspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1147_84" runat="server"  type="text" style="width:70px; ">
      </td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">85</td>
      <td align="center"  class="td01_viewcontent_title">���У��ŷŴ����</td>
      <td align="center"  class="td_viewcontent_content">&nbsp;</td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_56" onfocusout="leavethis('1147_55','1147_56','17')" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_content">99</td>
      <td align="center"  class="td01_viewcontent_title">��3����ú��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" id="fld_1147_70" runat="server" type="text" style="width:70px; "></td>
      <td rowspan="8" align="center"  class="td01_viewcontent_content">��<br>
        ��<br>
        ��<br>
    �� </td>
      <td align="center"  class="td01_viewcontent_title"> ��Ҫȼ�����  </td>
      <td align="center"  class="td01_viewcontent_content"> ȼ��1 </td>
      <td align="center"  class="td01_viewcontent_content">ȼ��2</td>
      <td align="center"  class="td01_viewcontent_content">ȼ��3</td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_title">�ġ���ҵ�������</td>
      <td align="center"  class="td_viewcontent_content"> -- </td>
      <td align="center"  class="td01_viewcontent_content">--</td>
      <td align="center"  class="td01_viewcontent_content">100</td>
      <td align="center"  class="td01_viewcontent_title">��4��¯��</td>
      <td align="center"  class="td01_viewcontent_content">��</td>
      <td align="center" class="td01_viewcontent_content"><input name="textfield" id="fld_1147_71" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_title"> ȼ��ú����  </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_4" runat="server" type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_7" runat="server"  type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_10" runat="server"  type="text" style="width:40px; "></td>
    </tr>
    <tr>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">86</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_title"> 
      <table cellspacing="0" cellpadding="0">
        <tr>
          <td align="center" ></td>
        </tr>
      </table>1.��ҵ������������ </td>
      <td rowspan="2" align="center"  class="td_viewcontent_content"> �� </td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_57" runat="server"  type="text" style="width:70px; "></td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">101</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_title">��5��ú�ʯ</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">��</td>
      <td rowspan="2" align="center" class="td01_viewcontent_content"><input name="textfield" id="fld_1147_72" runat="server" type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_title"> ȼ��ú������(��)  </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_5" runat="server"  type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_8" runat="server"  type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_11" runat="server"  type="text" style="width:40px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_title"> ȼ��ú���(%) </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_6" runat="server"  type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_9" runat="server" type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_12" runat="server"  type="text" style="width:40px; "></td>
    </tr>
    <tr>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">87</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_title">��1��Σ�շ���</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">��</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_58" runat="server"  type="text" style="width:70px; "></td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">      102</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_title"> ��6��β�� </td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">��</td>
      <td rowspan="2" align="center" class="td01_viewcontent_content"><input name="textfield" id="fld_1147_73" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_title"> ȼ��������  </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_13" runat="server"  type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_17" runat="server"  type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_21" runat="server"  type="text" style="width:40px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_title"> ȼ���Ͳ��� </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_14" runat="server"  type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_18" runat="server" type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_22" runat="server" type="text" style="width:40px; "></td>
    </tr>
    <tr>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">88</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_title">��2��ұ������</td>
      <td rowspan="2" align="center"  class="td_viewcontent_content">��</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content"><input name="textfield"  id="fld_1147_59" runat="server"  type="text" style="width:70px; "></td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">103</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_title">��7������ʯ��</td>
      <td rowspan="2" align="center"  class="td01_viewcontent_content">��</td>
      <td rowspan="2" align="center" class="td01_viewcontent_content"><input name="textfield" id="fld_1147_74" runat="server"  type="text" style="width:70px; "></td>
      <td align="center"  class="td01_viewcontent_title"> ȼ����������(��)  </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_15" runat="server"  type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_19" runat="server"  type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_23" runat="server"  type="text" style="width:40px; "></td>
    </tr>
    <tr>
      <td align="center"  class="td01_viewcontent_title"> ȼ�������(%) </td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_16" runat="server"  type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_20" runat="server" type="text" style="width:40px; "></td>
      <td align="center"  class="td01_viewcontent_content"><input name="textfield" id="fld_1148_24" runat="server"  type="text" style="width:40px; "></td>
    </tr>
  </table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
    <tr>
      <td class="font1220_000000">ָ����ϵ��75��76,78��79,81��82,84��85,86=87+88+89+90+91+92+93+94+95,86=96+106+108+112-105-111,96=97+98+99+100+101+102+103+104,96��105,


106��107,108��109,109��110,
108��111,112��113,87��97+107+109+113 </td>
    </tr>
  </table>
  </div>
</div>
  </form>
</body>
</html>
