<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_welcome"
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 网站统计 </div>
		<div class="bd">
			<table class="table table-bordered">
				<tr>
					<th>频道</th>
					<th>信息</th>
					<th>幻灯</th>
					<th>留言</th>
					<th>评论</th>
					<th>订单</th>
					<th>应聘</th>
					<th>链接</th>
					<th>内接</th>
					<th>碎片</th>
				</tr>
				<tr class="ac">
					<td><%=get_count("cms_channel")%></td>
					<td><%=get_count("cms_info")%></td>
					<td><%=get_count("cms_banner")%></td>
					<td><%=get_count("cms_guestbook")%></td>
					<td><%=get_count("cms_comment")%></td>
					<td><%=get_count("cms_order")%></td>
					<td><%=get_count("cms_resume")%></td>
					<td><%=get_count("cms_link")%></td>
					<td><%=get_count("cms_sitelink")%></td>
					<td><%=get_count("cms_chip")%></td>
				</tr>
			</table>
		</div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
