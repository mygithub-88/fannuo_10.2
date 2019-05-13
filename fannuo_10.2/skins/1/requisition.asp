<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>在线申请-<%=site_name%></title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="current_location">当前位置：<a href="<%=site_dir%>">网站首页</a> > 在线申请</div>
	<form method="post">
		<div class="form-group">
			<div class="label"><label for="r_username">申请人</label></div>
			<div class="field">
				<input id="r_username" class="input" name="r_username" type="text" size="60" data-validate="required:必填" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="r_tel">联系电话</label></div>
			<div class="field">
				<input id="r_tel" class="input" name="r_tel" type="text" size="60" data-validate="required:必填" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="r_email">电子邮件</label></div>
			<div class="field">
				<input id="r_email" class="input" name="r_email" type="text" size="60" data-validate="required:必填,email:请填写合法的电子邮件" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="r_content">情况介绍</label></div>
			<div class="field">
				<textarea id="r_content" class="input" name="r_content" row="5" /></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="label">
				<label for="verifycode">验证码 <img src="<%=site_dir%>system/verifycode.asp" onclick="javascript:this.src='<%=site_dir%>system/verifycode.asp?tm='+Math.random()" style="background:#EEEEEE; padding:5px; cursor:pointer;" alt="点击更换" title="点击更换" /></label>
			</div>
			<div class="field">
				<input id="verifycode" class="input" name="verifycode" type="text" size="60" data-validate="required:必填" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="label">
				<label></label>
			</div>
			<div class="field">
				<input id="save" class="btn bg-dot" name="save" type="submit" value="提交资料" />
			</div>
		</div>
	</form>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
