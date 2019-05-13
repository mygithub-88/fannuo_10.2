<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="../system/conn.asp"-->
<!--#include file="../system/library.asp"-->
<!--#include file="../system/config.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%
If Not inull(rf("submit")) Then
	Call null_back(rf("login_name"), "error")
	Call null_back(rf("login_password"), "error")
	Call null_back(rf("login_verifycode"), "error")
	Set rs = ado_query("select * from cms_admin where a_enable = 1 and a_name='"&rfs("login_name")&"' and a_password='"&md5(rfs("login_password"))&"'")
	If Not rs.EOF Then
		Response.Cookies("adminname") = rfs("login_name")
		Response.Cookies("adminpassword") = rfs("login_password")
		Response.Cookies("upload") = "allow"
		Response.Redirect "cms_welcome.asp"
	Else
		Call alert_href("错误提示：用户名或密码错误，请核对后重新输入！","cms_login.asp")
	End If
	rs.Close
	Set rs = Nothing
End If
%>
<title>登录后台</title>
<link rel="stylesheet" href="../plus/ui/ui.css" />
<link rel="stylesheet" href="style.css" />
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../plus/ui/ui.js"></script>
<script type="text/javascript">
</script>
</head>
<body style=" background: #2E6B97; height: 100%; ">
<div style="background: #FFF; height: 560px; width: 400px; box-shadow: 0 0 10px #242424; padding: 50px; position: absolute; top: 50%; left: 50%; margin-top: -280px; margin-left: -200px;">
	<p style="font-size: 30px; text-align: center; line-height: 80px;">布迪兰卡网站管理后台</p>
	<p class="ac"><span class="badge bg-sub"></span></p>
	<form method="post" action="cms_login.asp" class="mt20">
		<div class="form-group">
			<div class="label"><label for="login_name">用户名</label></div>
			<div class="field">
				<input id="login_name" class="input" name="login_name" type="text" data-validate="required:请填写用户名" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="login_password">密码</label></div>
			<div class="field">
				<input id="login_password" class="input" name="login_password" type="password" data-validate="required:请填写密码" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="login_verifycode">验证码</label> <img src="../system/verifycode.asp" onclick="javascript:this.src='../system/verifycode.asp?tm='+Math.random()" style="background:#EEEEEE; padding:5px; cursor:pointer;" alt="点击更换" title="点击更换" /></div>
			<div class="field">
				<input id="login_verifycode" class="input" name="login_verifycode" type="text" data-validate="required:请填写验证码" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label></label></div>
			<div class="field">
				<input id="submit" class="btn btn-block bg-dot" name="submit" type="submit" value="登录后台" />
			</div>
		</div>
	</form>
</div>
</body>
</html>
