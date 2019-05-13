<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_member"
Call check_admin_purview("cms_member")
If Not inull(rf("execute")) Then
	Call null_back(rf("id"), "请至少选中一个会员！")
	Select Case rf("method")
		Case ""
			Call alert_back("请选择要执行的操作！")
		Case "enable"
			sql = "update cms_member set m_enable = 1 where id in ("&rf("id")&")"
		Case "cenable"
			sql = "update cms_member set m_enable = 0 where id in ("&rf("id")&")"
		Case "password"
			sql = "update cms_member set m_password = 'E10ADC3949BA59ABBE56E057F20F883E' where id in ("&rf("id")&")"
		Case "del"
			sql = "delete from cms_member where id in ("&rf("id")&")"
	End Select
	conn.Execute(sql)
	Call alert_href ("执行成功！", "cms_member.asp")
End If
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 会员管理 </div>
		<div class="bd">
			<form method="get">
				<div class="form-group">
					<div class="label"><label for="name">会员名</label></div>
					<div class="field">
						<input id="name" class="input" name="name" type="text" maxlength="255" size="60" value="<%=rqs("name")%>" data-validate="required:请填写会员名" />
						<div class="input-note">请填写会员名</div>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input class="btn bg-dot" type="submit" value="查找" />
					</div>
				</div>
			</form>
			<form method="post" class="form-auto">
				<table class="table table-bordered">
					<tr>
						<th>选</th>
						<th>用户名</th>
						<th>注册日期</th>
						<th>详情</th>
					</tr>
					<%
					sql = "select * from cms_member order by m_date desc"
					If Not inull(rqs("name")) Then
						sql = "select * from cms_member where m_name = '"&rqs("name")&"' order by m_date desc"
					End If
					page_size = 50
					pager = pageturner_handle(sql, "id", page_size)
					Set rs = pager(0)
					Do While Not rs.EOF
					%>
					<tr class="ac">
						<td><input name="id" type="checkbox" id="id" value="<%=rs("id")%>" /></td>
						<td><%=rs("m_name")%><%=iif(rs("m_enable") = 1,""," <span class=""badge bg-dot"">未审核</span>")%></td>
						<td><%=rs("m_date")%></td>
						<td><a class="btn bg-main" href="cms_member_modify.asp?id=<%=rs("id")%>">详情</a></td>
					</tr>
					<%
					rs.movenext
					Loop
					rs.Close
					Set rs = Nothing
					%>
					<tr>
						<td class="ac"><input type="checkbox" onclick="check_all(this,'id')" /></td>
						<td colspan="3">
							<select class="input" name="method">
								<option value="">选择操作</option>
								<option value="enable">审核会员</option>
								<option value="cenable">取消审核</option>
								<option value="password">重置密码</option>
								<option value="del">删除会员</option>
							</select>
							<input class="btn bg-main" type="submit" name="execute" value="执行操作" />
							<span class="badge">密码重置后为123456</span>
						</td>
					</tr>
				</table>
			</form>
			<%=pageturner_show(pager(1),pager(2),pager(3),page_size,5)%>
		</div>
	</div>

</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
