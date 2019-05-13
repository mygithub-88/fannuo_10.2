<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_comment"
Call check_admin_purview("cms_comment")
If Not inull(rf("execute")) Then
	Call null_back(rf("id"), "请至少选中一项！")
	Select Case rf("method")
		Case ""
			Call alert_back("请选择一项操作")
		Case "enable"
			sql = "update cms_comment set c_enable = 1 where id in ("&rf("id")&")"
		Case "cenable"
			sql = "update cms_comment set c_enable = 0 where id in ("&rf("id")&")"
		Case "del"
			sql = "delete from cms_comment where id in ("&rf("id")&")"
	End Select
	conn.Execute(sql)
	Call alert_href ("执行成功！", "cms_comment.asp")
End If
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 管理评论 </div>
		<div class="bd">
			<%
			If inull(rq("id")) Then
				echo "<div class=""quote mb10"">点击相应评论内容可以显示同一信息下的所有评论</div>"
			Else
				Set rs = ado_query("select * from cms_info where id = "&rq("id")&" ")
				If Not rs.EOF Then
					echo "<a href="""&i_url(rs("id"))&""" target=""_blank"" title="""&rs("i_name")&""">"&rs("i_name")&"</a>"
				End If
				rs.Close
				Set rs = Nothing
			End If
			%>
			<form method="post" class="form-auto">
				<table class="table table-bordered">
					<tr>
						<th>选</th>
						<th width="400">评论内容</th>
						<th>评论人</th>
						<th>IP</th>
						<th>日期</th>
						<th>状态</th>
					</tr>
					<%
					If inull(rq("id")) Then
						sql = "select * from cms_comment order by c_date desc"
					Else
						sql = "select * from cms_comment where c_parent = "&rq("id")&" order by c_date desc"
					End If
					page_size = 50
					pager = pageturner_handle(sql, "id", page_size)
					Set rs = pager(0)
					Do While Not rs.EOF
					%>
					<tr class="ac">
						<td><input name="id" type="checkbox" id="id" value="<%=rs("id")%>" /></td>
						<td><a href="cms_comment.asp?id=<%=rs("c_parent")%>"><%=rs("c_content")%></a></td>
						<td><%=rs("c_username")%> <%=ifmember(rs("c_member"))%></td>
						<td><%=rs("c_ip")%></td>
						<td><%=str_time("y-mm-dd",rs("c_date"))%></td>
						<td><%=iif(rs("c_enable") = 1,"<span class=""badge bg-green"">已审核</span>","<span class=""badge bg-dot"">未审核</span>")%></td>
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
								<option value="enable">审核评论</option>
								<option value="cenable">取消审核</option>
								<option value="del">删除评论</option>
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
