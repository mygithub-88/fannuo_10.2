<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>资料修改</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="l20">
		<!--#include file="inc_member.asp"-->
		<div class="x10">
			<div class="l20">
				<div class="x6">
					<div class="hd1">资料修改</div>
					<div class="bd1">
						<form method="post">
							<div class="form-group">
								<div class="label"><label for="m_tname">真实姓名</label></div>
								<div class="field">
									<input id="m_tname" class="input" name="m_tname" type="text" size="60" value="<%=member_tname%>" data-validate="required:必填" />
								</div>
							</div>
							<div class="form-group">
								<div class="label"><label for="m_tel">电话</label></div>
								<div class="field">
									<input id="m_tel" class="input" name="m_tel" type="text" size="60" value="<%=member_tel%>" data-validate="required:必填" />
								</div>
							</div>
							<div class="form-group">
								<div class="label"><label for="m_qq">QQ</label></div>
								<div class="field">
									<input id="m_qq" class="input" name="m_qq" type="text" size="60" value="<%=member_qq%>" />
								</div>
							</div>
							<div class="form-group">
								<div class="label"><label for="m_wx">微信</label></div>
								<div class="field">
									<input id="m_wx" class="input" name="m_wx" type="text" size="60" value="<%=member_wx%>" />
								</div>
							</div>
							<div class="form-group">
								<div class="label"><label for="m_email">邮件</label></div>
								<div class="field">
									<input id="m_email" class="input" name="m_email" type="text" size="60" value="<%=member_email%>" />
								</div>
							</div>
							<div class="form-group">
								<div class="label"><label for="m_address">地址</label></div>
								<div class="field">
									<input id="m_address" class="input" name="m_address" type="text" size="60" value="<%=member_address%>" />
								</div>
							</div>
							<div class="form-group">
								<div class="label"><label></label></div>
								<div class="field">
									<input id="save" class="btn bg-dot" name="save" type="submit" value="修改资料" />
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="x6">
					<div class="hd1">密码修改</div>
					<div class="bd1">
						<form method="post">
							<div class="form-group">
								<div class="label"><label for="m_opassword">原始密码</label></div>
								<div class="field">
									<input id="m_opassword" class="input" name="m_opassword" type="password" size="60" value="" data-validate="required:必填" />
								</div>
							</div>
							<div class="form-group">
								<div class="label"><label for="m_password">新密码</label></div>
								<div class="field">
									<input id="m_password" class="input" name="m_password" type="password" size="60" value="" data-validate="required:必填" />
								</div>
							</div>
							<div class="form-group">
								<div class="label"><label for="m_cpassword">确认新密码</label></div>
								<div class="field">
									<input id="m_cpassword" class="input" name="m_cpassword" type="password" size="60" value="" data-validate="required:必填,repeat#m_password:两次输入的密码不一致" />
								</div>
							</div>
							<div class="form-group">
								<div class="label"><label></label></div>
								<div class="field">
									<input id="save" class="btn bg-dot" name="save1" type="submit" value="修改密码" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
