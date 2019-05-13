<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>用户中心</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="l20">
		<!--#include file="inc_member.asp"-->
		<div class="x10">
			<table class="table table-bordered table-hover table-striped">
				<tr><td>ID</td><td><%=member_id%></td></tr>
				<tr><td>用户名</td><td><%=member_name%></td></tr>
				<tr><td>真实姓名</td><td><%=member_tname%></td></tr>
				<tr><td>电话</td><td><%=member_tel%></td></tr>
				<tr><td>QQ</td><td><%=member_qq%></td></tr>
				<tr><td>微信</td><td><%=member_wx%></td></tr>
				<tr><td>电子邮件</td><td><%=member_email%></td></tr>
				<tr><td>地址</td><td><%=member_address%></td></tr>
				<tr><td>注册日期</td><td><%=member_date%></td></tr>
			</table>
		</div>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
