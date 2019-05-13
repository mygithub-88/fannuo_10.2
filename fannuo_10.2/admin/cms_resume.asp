<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_resume"
Call check_admin_purview("cms_resume")
If Not inull(rf("execute")) Then
	Call null_back(rf("id"), "请至少选中一项！")
	If inull(rf("method")) Then
		Call alert_back("请选择要执行的操作！")
	Else
		conn.Execute("delete from cms_resume where id in ("&rf("id")&")")
	End If
	Call alert_href ("执行成功！", "cms_resume.asp")
End If
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 管理应聘 </div>
		<div class="bd">
		<form method="post" class="form-auto">
			<table class="table table-bordered">
				<tr>
					<th>选</th>
					<th>应聘职位</th>
					<th>应聘人</th>
					<th>电话</th>
					<th>应聘日期</th>
					<th>详情</th>
				</tr>
				<%
				sql = "select * from cms_resume order by r_date desc"
				page_size = 50
				pager = pageturner_handle(sql, "id", page_size)
				Set rs = pager(0)
				Do While Not rs.EOF
				%>
				<tr class="ac">
					<td><input name="id" type="checkbox" id="id" value="<%=rs("id")%>" /></td>
					<td><%=rs("r_name")%></td>
					<td><%=rs("r_tname")%></td>
					<td><%=rs("r_tel")%></td>
					<td><%=str_time("y-mm-dd",rs("r_date"))%></td>
					<td><a class="btn bg-main" href="cms_resume_detail.asp?id=<%=rs("id")%>">详情</a></td>
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
							<option value="0">选择操作</option>
							<option value="1">删除应聘</option>
						</select>
						<input class="btn bg-main" type="submit" name="execute" value="执行操作" />
					</td>
				</tr>
				</form>
			</table>
			<%=pageturner_show(pager(1),pager(2),pager(3),page_size,5)%> </div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
