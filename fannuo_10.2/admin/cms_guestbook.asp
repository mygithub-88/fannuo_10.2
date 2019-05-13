<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_guestbook"
Call check_admin_purview("cms_guestbook")
If Not inull(rf("execute")) Then
	Call null_back(rf("id"), "请至少选中一项！")
	Select Case rf("method")
		Case "enable"
			sql = "update cms_guestbook set g_enable = 1 where id in ("&rf("id")&")"
		Case "cenable"
			sql = "update cms_guestbook set g_enable = 0 where id in ("&rf("id")&")"
		Case "del"
			sql = "delete from cms_guestbook where id in ("&rf("id")&")"
	End Select
	conn.Execute(sql)
	Call alert_href ("执行成功！", "cms_guestbook.asp")
End If
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 管理留言 </div>
		<div class="bd">
			<form method="post" class="form-auto">
				<table class="table table-bordered">
					<tr>
						<th>选</th>
						<th>留言人</th>
						<th width="300">内容</th>
						<th>状态</th>
						<th>留言日期</th>
						<th>回复</th>
					</tr>
					<%
					sql = "select * from cms_guestbook order by g_date desc"
					page_size = 20
					pager = pageturner_handle(sql, "id", page_size)
					Set rs = pager(0)
					Do While Not rs.EOF
					%>
					<tr class="ac">
						<td><input name="id" type="checkbox" id="id" value="<%=rs("id")%>" /></td>
						<td><%=rs("g_username")%> <%=ifmember(rs("g_member"))%></td>
						<td class="al"><%=rs("g_content")%></td>
						<td><%=iif(rs("g_enable") = 1,"<span class=""badge bg-green"">已审核</span>","<span class=""badge bg-dot"">未审核</span>")%></td>
						<td><%=str_time("y-mm-dd",rs("g_date"))%></td>
						<td><a class="btn bg-main" href="cms_guestbook_modify.asp?id=<%=rs("id")%>">详情回复</a></td>
					</tr>
					<%
					rs.movenext
					Loop
					rs.Close
					Set rs = Nothing
					%>
					<tr>
						<td class="ac"><input type="checkbox" onclick="check_all(this,'id')" /></td>
						<td colspan="5">
							<select class="input" name="method">
								<option value="">选择操作</option>
								<option value="enable">审核留言</option>
								<option value="cenable">取消审核</option>
								<option value="del">删除留言</option>
							</select>
							<input class="btn bg-main" type="submit" name="execute" value="执行操作" />
						</td>
					</tr>
				</table>
			</form>
			<%=pageturner_show(pager(1),pager(2),pager(3),page_size,5)%> </div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
