<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_member"
Call check_admin_purview("cms_member")
call non_numeric_back(rq("id"),"参数不能为空而且必须为数字！")
If rf("submit") = "修改" Then
	m_point = rf("m_point")
    Call non_numeric_back(m_point, "积分不能为空！而且必须为数字！")
	conn.Execute("update cms_member set m_point="&m_point&" where id="&rq("id")&"")
    Call alert_href("会员修改成功！", "cms_member.asp")
End If
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 会员详情 </div>
		<div class="bd">
			<table class="table table-bordered table-hover">
				<%Set rs = ado_mquery("select * from cms_member where id = "&rq("id")&"")%>
				<tr>
					<td width="120">状态</td>
					<td><%=iif(rs("m_enable") = 1,"已审核","未审核")%></td>
				</tr>
				<tr>
					<td>用户名</td>
					<td><%=rs("m_name")%></td>
				</tr>
				<tr>
					<td>真实姓名</td>
					<td><%=rs("m_tname")%></td>
				</tr>
				<tr>
					<td>电子邮件</td>
					<td><%=rs("m_email")%></td>
				</tr>
				<tr>
					<td>联系电话</td>
					<td><%=rs("m_tel")%></td>
				</tr>
				<tr>
					<td>腾讯QQ</td>
					<td><%=rs("m_qq")%></td>
				</tr>
				<tr>
					<td>联系地址</td>
					<td><%=rs("m_address")%></td>
				</tr>
				<tr>
					<td>注册日期</td>
					<td><%=rs("m_date")%></td>
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
