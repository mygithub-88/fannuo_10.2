<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_admin where a_name = '"&admin_name&"'")
	rs("a_password") = md5(rf("a_password"))
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("密码修改成功，请重新登录系统","cms_logout.asp")
End If
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 修改用户 </div>
		<div class="bd">
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="a_password">登录密码</label></div>
					<div class="field">
						<input id="a_password" class="input" name="a_password" type="password" size="60" data-validate="required:必填" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_cpassword">确认密码</label></div>
					<div class="field">
						<input id="a_cpassword" class="input" name="a_cpassword" type="password" size="60" data-validate="required:必填,repeat#a_password:两次输入的密码不一致" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="修改密码" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
