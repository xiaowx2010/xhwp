<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<script runat="server" language="C#">
    
    private string ShowWeather()
    {
        db.SqlString = "select OutSourcedata,DateDiff(day,updateDate,getdate()) as days from sg_OutSource where OutSourceTitle='����Ԥ��'";
        DataTable dt = db.GetDataTable(); 
        if (dt.Rows.Count == 0)
        {
            db.SqlString = "Insert Into sg_OutSource(OutSourcetitle,OutSourcedata) Values('����Ԥ��','" + GetWeather() + "')";
            db.UpdateTable();
            return GetWeather();

        }
        else
        {
            if (dt.Rows[0]["days"].ToString() != "0")
            {
                db.SqlString = "Update sg_OutSource set OutSourcedata='" + GetWeather() + "',updatedate=getdate() where OutSourcetitle='����Ԥ��'";
                db.UpdateTable();
                return GetWeather();
            }
            else
            {
                return dt.Rows[0]["OutSourcedata"].ToString();
            }
        }
    }
    
private string GetWeather(){
	string weather ="";
    String respHTML = GetWeatherData();
    if (respHTML.LastIndexOf("�Ϻ�") > 0)
    {
        Regex r = new Regex("<.+?>");
        weather = r.Replace(respHTML, "");

        int t1 = weather.LastIndexOf("��������");
        int t2 = weather.LastIndexOf("������ǿ��");
        int t3 = weather.LastIndexOf("��ѯ�Ϻ���ϸ�������");
        weather = weather.Replace(" ", "");
        if (t2 > (t1 + 10))
        {
            weather = weather.Substring(t1 + 10, t3 - t1 - 5);
        }
        else
            weather = weather.Substring(t1);


        r = new Regex("--|>|<");
        weather = r.Replace(weather, "").Replace("  ", " ");
        t1 = weather.LastIndexOf("��");
        t2 = weather.LastIndexOf("��");
        t3 = weather.LastIndexOf("��ѯ�Ϻ���ϸ�������");

        if (t2 > t1)
        {
            string header = weather;
            weather = header.Substring(0, t1 + 1) + header.Substring(t2 + 1, t3 - t2 - 2);
        }


    }

    return weather.Replace("\n", " ").Replace("\t", " ").Replace("\r", " ");
}
private string GetWeatherImg()
{
	string imgstr = "",imgname = "";
	string  respHTML = GetWeatherData();
	Regex r = new Regex("<img .*?alt=(?<iname>[^>]+)>");
	Match m = r.Match(respHTML);
	while (m.Success)
	{
		imgname = GetImgName(m.Result("${iname}"));
		if (imgname.Length>0)
		{
			imgstr += "<img src=images/shtiqi/"+imgname+" width=23 height=23>";
		}
		imgname = "";
		m = m.NextMatch();
	}
	if(imgstr.Trim().Length>0)
		return imgstr;
	else
		return "<img src=images/sub_xwzx_list_801.gif>";
}
private string GetWeatherData()
{
	String respHTML="";
	try
	{
		WebRequest wReq = WebRequest.Create("http://weather.sina.com.cn/iframe/weather/310100_w.html");		
		WebResponse wResp = wReq.GetResponse();
		Stream respStream = wResp.GetResponseStream();
		StreamReader reader = new StreamReader(respStream, Encoding.Default);
		respHTML = reader.ReadToEnd();
		wResp.Close();		
	}
	catch (Exception e)
	{
		return "�������ɷ���!";
	}

	return respHTML;
}
private string GetImgName(string strname)
{
	string imgname = "";
	switch(strname)
	{
		case "��":
			imgname = "qing_big.gif";
			break;
		case "��":
			imgname = "yin_big.gif";
			break;
		case "����":
			imgname = "yin_big.gif";
			break;
		case "С��":
			imgname = "xiaoyu_big.gif";
			break;
		case "����":
			imgname = "zhongyu_big.gif";
			break;
		case "����":
			imgname = "dayu_big.gif";
			break;
		case "����":
			imgname = "baoyu_big.gif";
			break;
		case "Сѩ":
			imgname = "xiaoxue_big.gif";
			break;
		case "��ѩ":
			imgname = "zhongxue_big.gif";
			break;
		case "��ѩ":
			imgname = "daxue_big.gif";
			break;
		case "��ѩ":
			imgname = "baoxue_big.gif";
			break;
		default:
			imgname = "";
			break;
	}
	return imgname;
}

//��ȡʱ��
private string GetDate()
{
    System.DateTime T = System.DateTime.Today;
    return T.Year.ToString() + "��" + T.Month.ToString() + "��" + T.Day.ToString() + "��" + " ����" + ToCNDOW(T.DayOfWeek.ToString()) + " ";
}

private string ToCNDOW(string endow)
{
    switch (endow)
    {
        case "Monday":
            return "һ";
            break;
        case "Tuesday":
            return "��";
            break;
        case "Wednesday":
            return "��";
            break;
        case "Thursday":
            return "��";
            break;
        case "Friday":
            return "��";
            break;
        case "Saturday":
            return "��";
            break;
        case "Sunday":
            return "��";
            break;
        default:
            return "";
            break;
    }
}
</script>