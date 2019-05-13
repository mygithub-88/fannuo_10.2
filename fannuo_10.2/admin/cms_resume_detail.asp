<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_resume"
Call check_admin_purview("cms_resume")
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 应聘人详情 </div>
		<div class="bd">
			<table class="table table-bordered table-hover table-striped">
				<%Set rs = ado_query("select * from cms_resume where id = "&rq("id")&"")%>
				<tr>
					<td width="120">应聘人</td>
					<td><%=rs("r_tname")%></td>
				</tr>
				<tr>
					<td>应聘职位</td>
					<td><%=rs("r_name")%></td>
				</tr>
				<tr>
					<td>应聘时间</td>
					<td><%=rs("r_date")%></td>
				</tr>
				<tr>
					<td>学历</td>
					<td><%=rs("r_education")%></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><%=rs("r_gender")%></td>
				</tr>
				<tr>
					<td>出生年月</td>
					<td><%=rs("r_birthday")%></td>
				</tr>
				<tr>
					<td>联系电话</td>
					<td><%=rs("r_tel")%></td>
				</tr>
				<tr>
					<td>电子邮件</td>
					<td><%=rs("r_email")%></td>
				</tr>
				<tr>
					<td>住址</td>
					<td><%=rs("r_address")%></td>
				</tr>
				<tr>
					<td>详细介绍</td>
					<td><%=rs("r_detail")%></td>
				</tr>
				<%
				rs.Close
				Set rs = Nothing
				%>
			</table>
		</div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
