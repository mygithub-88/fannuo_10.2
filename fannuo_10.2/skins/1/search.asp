<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>搜索结果</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="current_location">当前位置：<a href="<%=site_dir%>">网站首页</a> > 搜索结果</div>
		<ul class="list-group">
		<%
		sql = "select * from cms_info where i_enable = 1 and i_name like '%"&skey&"%' order by i_order desc , id desc"
		page_size = 20
		pager = pageturner_handle(sql, "id", page_size)
		Set rs = pager(0)
		Do While Not rs.EOF
		%>
		<li><span class="badge fr"><%=str_time("y-mm-dd",rs("i_date"))%></span><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></li>
		<%
		rs.movenext
		Loop
		rs.Close
		Set rs = Nothing
		%>
	</ul>
	<%=pageturner_show(pager(1),pager(2),pager(3),page_size,5)%>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
