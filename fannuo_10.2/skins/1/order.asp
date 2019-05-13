<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>在线订购</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="current_location">当前位置：<a href="<%=site_dir%>">网站首页</a> > 在线订购</div>
	<div class="l20">
		<div class="x4">
			<div class="hd1">订购注意事项</div>
			<div class="bd1"><%=site_order_notice%></div>
		</div>
		<div class="x8">
			<div class="hd1">我要订购</div>
			<div class="bd1">
				<form method="post" action="<%=site_dir%>order.asp">
					<div class="form-group">
						<div class="label"><label for="o_name">产品名称</label></div>
						<div class="field">
							<input id="o_name" class="input" name="o_name" type="text" size="60" value="<%=o_name%>" data-validate="required:必填" />
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label for="o_username">真实姓名</label></div>
						<div class="field">
							<input id="o_username" class="input" name="o_username" type="text" size="60"maxlength="100" value="<%=iif(member_login,member_name,"")%>" data-validate="required:必填" />
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label for="o_tel">联系电话</label></div>
						<div class="field">
							<input id="o_tel" class="input" name="o_tel" type="text" size="60" value="" data-validate="required:必填" />
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label for="o_address">发货地址</label></div>
						<div class="field">
							<input id="o_address" class="input" name="o_address" type="text" size="60" value="" data-validate="required:必填" />
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label for="o_email">电子邮件</label></div>
						<div class="field">
							<input id="o_email" class="input" name="o_email" type="text" size="60" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label for="o_content">备注内容</label></div>
						<div class="field">
							<textarea id="o_content" class="input" name="o_content" row="5" /></textarea>
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
						<div class="label"><label></label></div>
						<div class="field">
							<input id="save" class="btn bg-dot" name="save" type="submit" value="提交订单" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
