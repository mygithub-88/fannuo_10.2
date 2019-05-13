<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>我的订单</title>
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
					<th>订购项目</th>
					<th>联系人</th>
					<th>电话</th>
					<th>邮件</th>
					<th>地址</th>
					<th>内容</th>
					<th>回复</th>
					<th>日期</th>
				</tr>
			<%
			sql = "select * from cms_order where o_member = "&member_id&" order by id desc"
			page_size = 20
			pager = pageturner_handle(sql, "id", page_size)
			Set rs = pager(0)
			Do While Not rs.EOF
			%>
				<tr>
					<td><%=rs("o_name")%></td>
					<td><%=rs("o_username")%></td>
					<td><%=rs("o_tel")%></td>
					<td><%=rs("o_email")%></td>
					<td><%=rs("o_address")%></td>
					<td><%=rs("o_content")%></td>
					<td><%=rs("o_answer")%></td>
					<td><%=str_time("y-mm-dd",rs("o_date"))%></td>
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
