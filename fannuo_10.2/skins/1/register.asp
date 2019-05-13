<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>用户注册</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="line">
		<div class="x6"><%=site_member_notice%></div>
		<div class="x6">
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="m_name">登录名</label></div>
					<div class="field">
						<input id="m_name" class="input" name="m_name" type="text" size="60" data-validate="required:必填" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="m_password">登录密码</label></div>
					<div class="field">
						<input id="m_password" class="input" name="m_password" type="password"  data-validate="required:必填" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="m_cpassword">确认密码</label></div>
					<div class="field">
						<input id="m_cpassword" class="input" name="m_cpassword" type="password"  data-validate="required:必填,repeat#m_password:两次输入的密码不一致" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="m_tname">真实姓名</label></div>
					<div class="field">
						<input id="m_tname" class="input" name="m_tname" type="text" size="60"  data-validate="required:必填" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="m_tel">电话</label></div>
					<div class="field">
						<input id="m_tel" class="input" name="m_tel" type="text" size="60" data-validate="mobile:填写合法的手机号" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="m_qq">QQ</label></div>
					<div class="field">
						<input id="m_qq" class="input" name="m_qq" type="text" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="m_wx">微信</label></div>
					<div class="field">
						<input id="m_wx" class="input" name="m_wx" type="text" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="m_email">电子邮件</label></div>
					<div class="field">
						<input id="m_email" class="input" name="m_email" type="text" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="m_address">地址</label></div>
					<div class="field">
						<input id="m_address" class="input" name="m_address" type="text" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot btn-block" name="save" type="submit" value="注册会员" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<a class="btn btn-block bg-dot" href="login.asp">已有帐号，我要登陆</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
