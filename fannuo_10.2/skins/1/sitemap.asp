<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>网站地图 - <%=site_title%></title><%If Not inull(site_key) Then%>
<meta name="keywords" content="<%=site_key%>" /><%End If%><%If Not inull(site_des) Then%>
<meta name="description" content="<%=site_des%>" /><%End If%>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="line">
		<div class="current_location">当前位置：<a href="<%=site_dir%>">网站首页</a> > 网站地图</div>
		<ul class="list-group">
			<%=channel_dlist(0, 0, "", 0)%>
		</ul>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
