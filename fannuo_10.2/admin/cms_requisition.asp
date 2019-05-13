<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_requisition"
Call check_admin_purview("cms_requisition")
If Not inull(rf("execute")) Then
	Call null_back(rf("id"), "请至少选中一项！")
	If inull(rf("method")) Then
		Call alert_back("请选择要执行的操作！")
	ElseIf rf("method") = 1 Then
		sql = "delete from cms_requisition where id in ("&rf("id")&")"
	End If
	conn.Execute(sql)
	Call alert_href ("执行成功！", "cms_requisition.asp")
End If
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 管理申请 </div>
		<div class="bd">
			<form method="post" class="form-auto">
				<table class="table table-bordered">
					<tr>
						<th>选</th>
						<th>申请人</th>
						<th>电话</th>
						<th>邮件</th>
						<th width="300">情况介绍</th>
						<th>日期</th>
					</tr>
					<%
					sql = "select * from cms_requisition order by r_date desc"
					page_size = 10
					pager = pageturner_handle(sql, "id", page_size)
					Set rs = pager(0)
					Do While Not rs.EOF
					%>
					<tr class="ac">
						<td><input name="id" type="checkbox" id="id" value="<%=rs("id")%>" /></td>
						<td><%=rs("r_username")%></td>
						<td><%=rs("r_tel")%></td>
						<td><%=rs("r_email")%></td>
						<td class="al"><%=rs("r_content")%></td>
						<td><%=str_time("y-mm-dd",rs("r_date"))%></td>
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
								<option value="1">删除申请</option>
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
