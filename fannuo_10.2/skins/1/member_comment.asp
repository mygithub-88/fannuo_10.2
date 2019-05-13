<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>我的评论</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="l20">
		<!--#include file="inc_member.asp"-->
		<div class="x10">
			<table class="table table-bordered table-hover table-striped">
				<tr>
					<th>内容主体</th>
					<th>评论内容</th>
					<th>日期</th>
				</tr>
			<%
			sql = "select * from cms_comment where c_member = "&member_id&" order by id desc"
			page_size = 20
			pager = pageturner_handle(sql, "id", page_size)
			Set rs = pager(0)
			Do While Not rs.EOF
			%>
				<tr>
					<td><a href="<%=i_url(rs("c_parent"))%>" target="_blank">访问</a></td>
					<td><%=rs("c_content")%></td>
					<td><%=str_time("y-mm-dd",rs("c_date"))%></td>
				</tr>
			<%
			rs.MoveNext
			Loop
			rs.Close
			Set rs = Nothing
			%>
			</table>
			<%=pageturner_show(pager(1),pager(2),pager(3),page_size,5)%>
		</div>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
