<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_guestbook"
Call check_admin_purview("cms_guestbook")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_guestbook where id = "&rq("id")&"")
	rs("g_enable") = rf("g_enable")
	rs("g_answer") = rf("g_answer")
	rs("g_adate") = Now()
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("保存成功", "cms_guestbook.asp")
End If
%>
</head>
<script type="text/javascript">
$(function(){
	KindEditor.ready(function(K) {
		K.create('#g_answer');
	});
});
</script>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 回复留言 </div>
		<div class="bd">
			<%Set rs = ado_mquery("select * from cms_guestbook where id = "&rq("id")&"")%>
			<table class="table table-bordered mb20">
				<tr>
					<td width="120">留言日期</td>
					<td><%=rs("g_date")%></td>
				</tr>
				<tr>
					<td>留言人姓名</td>
					<td><%=rs("g_username")%> <%=ifmember(rs("g_member"))%></td>
				</tr>
				<tr>
					<td>留言人IP</td>
					<td><%=rs("g_ip")%></td>
				</tr>
				<tr>
					<td>电话</td>
					<td><%=rs("g_phone")%></td>
				</tr>
				<tr>
					<td>QQ</td>
					<td><%=rs("g_qq")%></td>
				</tr>
				<tr>
					<td>微信</td>
					<td><%=rs("g_wx")%></td>
				</tr>
				<tr>
					<td>电子邮件</td>
					<td><%=rs("g_email")%></td>
				</tr>
				<tr>
					<td>留言内容</td>
					<td><%=rs("g_content")%></td>
				</tr>
			</table>
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="g_enable">审核留言</label></div>
					<div class="field">
						<label class="btn"><input id="g_enable" name="g_enable" type="radio" value="1" <%=iif((rs("g_enable") = 1),"checked=""checked""","")%>/>已审核</label>
						<label class="btn"><input name="g_enable" type="radio" value="0" <%=iif((rs("g_enable") = 0),"checked=""checked""","")%>/>未审核</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="g_answer">回复内容</label></div>
					<div class="field">
						<textarea id="g_answer" class="input" name="g_answer" row="5" /><%=str_editor(rs("g_answer"))%></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="保存" />
					</div>
				</div>
			</form>
			<%
			rs.Close
			Set rs = Nothing
			%>
		</div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
