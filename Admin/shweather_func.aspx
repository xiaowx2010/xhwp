<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<script runat="server" language="C#">
    
    private string ShowWeather()
    {
        db.SqlString = "select OutSourcedata,DateDiff(day,updateDate,getdate()) as days from sg_OutSource where OutSourceTitle='天气预报'";
        DataTable dt = db.GetDataTable(); 
        if (dt.Rows.Count == 0)
        {
            db.SqlString = "Insert Into sg_OutSource(OutSourcetitle,OutSourcedata) Values('天气预报','" + GetWeather() + "')";
            db.UpdateTable();
            return GetWeather();

        }
        else
        {
            if (dt.Rows[0]["days"].ToString() != "0")
            {
                db.SqlString = "Update sg_OutSource set OutSourcedata='" + GetWeather() + "',updatedate=getdate() where OutSourcetitle='天气预报'";
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
    if (respHTML.LastIndexOf("上海") > 0)
    {
        Regex r = new Regex("<.+?>");
        weather = r.Replace(respHTML, "");

        int t1 = weather.LastIndexOf("今日天气");
        int t2 = weather.LastIndexOf("紫外线强度");
        int t3 = weather.LastIndexOf("查询上海详细天气情况");
        weather = weather.Replace(" ", "");
        if (t2 > (t1 + 10))
        {
            weather = weather.Substring(t1 + 10, t3 - t1 - 5);
        }
        else
            weather = weather.Substring(t1);


        r = new Regex("--|>|<");
        weather = r.Replace(weather, "").Replace("  ", " ");
        t1 = weather.LastIndexOf("℃");
        t2 = weather.LastIndexOf("日");
        t3 = weather.LastIndexOf("查询上海详细天气情况");

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
		return "外网不可访问!";
	}

	return respHTML;
}
private string GetImgName(string strname)
{
	string imgname = "";
	switch(strname)
	{
		case "晴":
			imgname = "qing_big.gif";
			break;
		case "阴":
			imgname = "yin_big.gif";
			break;
		case "多云":
			imgname = "yin_big.gif";
			break;
		case "小雨":
			imgname = "xiaoyu_big.gif";
			break;
		case "中雨":
			imgname = "zhongyu_big.gif";
			break;
		case "大雨":
			imgname = "dayu_big.gif";
			break;
		case "暴雨":
			imgname = "baoyu_big.gif";
			break;
		case "小雪":
			imgname = "xiaoxue_big.gif";
			break;
		case "中雪":
			imgname = "zhongxue_big.gif";
			break;
		case "大雪":
			imgname = "daxue_big.gif";
			break;
		case "暴雪":
			imgname = "baoxue_big.gif";
			break;
		default:
			imgname = "";
			break;
	}
	return imgname;
}

//获取时间
private string GetDate()
{
    System.DateTime T = System.DateTime.Today;
    return T.Year.ToString() + "年" + T.Month.ToString() + "月" + T.Day.ToString() + "日" + " 星期" + ToCNDOW(T.DayOfWeek.ToString()) + " ";
}

private string ToCNDOW(string endow)
{
    switch (endow)
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
</script>