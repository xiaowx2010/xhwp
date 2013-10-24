function CreateChartsControl(DivID, ObjectID, URL, dataXML,WIDTH, HEIGHT, BGCOLOR)
{
 
  var d = document.getElementById(DivID);
  d.innerHTML = '<object id="'+ObjectID+'" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="swflash9.cab#version=9,0,0,0" '+
				'width="'+WIDTH+'" height="'+HEIGHT+'"><param name="movie" value="'+URL+'" />'+
				'<param name="flashvars" value="&chartWidth='+WIDTH+'&chartHeight='+HEIGHT+'&dataXML='+dataXML+'" /><param name="quality" value="high" /><param name="allowScriptAccess" value="sameDomain" />'+
				'<param name="loop" value="false" /><param name="wmode" value="Opaque"><param name="menu" value="true">'+
				'<embed src="'+URL+'" quality="high" loop="false" width="'+WIDTH+'" height="'+HEIGHT+'" name="'+ObjectID+'" flashvars="&chartWidth='+WIDTH+'&chartHeight='+HEIGHT+'&dataXML='+dataXML+'" align="" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>';
}