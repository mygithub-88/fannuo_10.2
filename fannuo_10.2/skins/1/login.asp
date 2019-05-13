<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>用户登录</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="line">
		<div class="x4"></div>
		<div class="x4">
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="m_name">用户名</label></div>
					<div class="field">
						<input id="m_name" class="input" name="m_name" type="text" data-validate="required:请填写用户名" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="m_password">密码</label></div>
					<div class="field">
						<input id="m_password" class="input" name="m_password" type="password" data-validate="required:请填写密码" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="m_verifycode">验证码</label> <img src="../system/verifycode.asp" onclick="javascript:this.src='../system/verifycode.asp?tm='+Math.random()" style="background:#EEEEEE; padding:5px; cursor:pointer;" alt="点击更换" title="点击更换" /></div>
					<div class="field">
						<input id="m_verifycode" class="input" name="m_verifycode" type="text" data-validate="required:请填写验证码" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="submit" class="btn btn-block bg-dot" name="submit" type="submit" value="会员登录" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<a class="btn btn-block bg-dot" href="register.asp">还没有帐号，我要注册</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
