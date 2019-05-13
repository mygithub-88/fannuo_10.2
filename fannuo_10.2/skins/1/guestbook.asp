<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>在线留言</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="current_location">当前位置：<a href="<%=site_dir%>">网站首页</a> > 在线留言</div>
	<div class="l20">
		<div class="x8">
			<div class="hd1">留言注意事项</div>
			<div class="bd1"><%=site_guestbook_notice%></div>
			<div class="hd1">留言列表</div>
			<div class="bd1">
				<%
				sql = "select * from cms_guestbook where g_enable = 1 order by g_date desc"
				page_size = 10
				pager = pageturner_handle(sql, "id", page_size)
				Set rs = pager(0)
				Do While Not rs.EOF
				%>
				<div class="panel mb10">
					<div class="panel-hd"><span class="icon-user"></span> <%=rs("g_username")%> <span class="badge"><%=rs("g_date")%></span></div>
					<div class="panel-bd">
						<%=rs("g_content")%>
						<%If Not inull(rs("g_answer")) Then%>
						<div class="quote border-gray mt10">
							<div class="mb10"><span class="badge bg-dot">站长回复</span> <span class="badge"><%=rs("g_adate")%></span></div>
							<%=rs("g_answer")%> </div>
						<%End If%>
					</div>
				</div>
				<%
				rs.movenext
				Loop
				rs.Close
				Set rs = Nothing
				%>
				<%=pageturner_show(pager(1),pager(2),pager(3),page_size,5)%>
			</div>
		</div>
		<div class="x4">
			<div class="hd1">我要留言</div>
			<div class="bd1">
				<form method="post" action="<%=site_dir%>guestbook.asp">
					<div class="form-group">
						<div class="label">
							<label for="g_username">留言人</label>
						</div>
						<div class="field">
							<input id="g_username" class="input" name="g_username" type="text" size="60" value="<%=iif(member_login,member_name,"")%>" data-validate="required:必填" />
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label for="g_phone">电话</label>
						</div>
						<div class="field">
							<input id="g_phone" class="input" name="g_phone" type="text" size="60" value="" data-validate="required:必填" />
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label for="g_qq">QQ</label>
						</div>
						<div class="field">
							<input id="g_qq" class="input" name="g_qq" type="text" size="60" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label for="g_wx">微信</label>
						</div>
						<div class="field">
							<input id="g_wx" class="input" name="g_wx" type="text" size="60" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label for="g_email">电子邮件</label>
						</div>
						<div class="field">
							<input id="g_email" class="input" name="g_email" type="text" size="60" value="" data-validate="email:请填写合法的电子邮件" />
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label for="g_content">留言内容</label>
						</div>
						<div class="field">
							<textarea id="g_content" class="input" name="g_content" row="5" data-validate="required:必填" /></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label for="verifycode">验证码 <img src="<%=site_dir%>system/verifycode.asp" onclick="javascript:this.src='<%=site_dir%>system/verifycode.asp?tm='+Math.random()" style="background:#EEEEEE; padding:5px; cursor:pointer;" alt="点击更换" title="点击更换" /></label>
						</div>
						<div class="field">
							<input id="verifycode" class="input" name="verifycode" type="text" size="60" value="" />
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label></label>
						</div>
						<div class="field">
							<input id="save" class="btn bg-dot" name="save" type="submit" value="提交留言" />
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
