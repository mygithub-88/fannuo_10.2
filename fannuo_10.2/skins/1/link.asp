<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>链接申请</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="current_location">当前位置：<a href="<%=site_dir%>">网站首页</a> > 链接申请</div>
	<form method="post">
		<div class="form-group" action="<%=site_dir%>link.asp">
			<div class="label"><label for="l_name">链接名称</label></div>
			<div class="field">
				<input id="l_name" class="input" name="l_name" type="text" size="60" value="" data-validate="required:必填" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="l_url">网址</label></div>
			<div class="field">
				<input id="l_url" class="input" name="l_url" type="text" size="60" value="" data-validate="required:必填,url:网址不合法"/>
				<div class="input-note">示例：http://www.baidu.com</div>
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="l_picture">图片</label></div>
			<div class="field">
				<input id="l_picture" class="input" name="l_picture" type="text" size="60" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="label">
				<label for="verifycode">验证码 <img src="<%=site_dir%>system/verifycode.asp" onclick="javascript:this.src='<%=site_dir%>system/verifycode.asp?tm='+Math.random()" style="background:#EEEEEE; padding:5px; cursor:pointer;" alt="点击更换" title="点击更换" /></label>
			</div>
			<div class="field">
				<input id="verifycode" class="input" name="verifycode" type="text" size="60" value="" data-validate="required:必填" />
			</div>
		</div>
		<div class="form-group">
			<div class="label">
				<label></label>
			</div>
			<div class="field">
				<input id="save" class="btn bg-dot" name="save" type="submit" value="提交申请"/>
			</div>
		</div>
	</form>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
