<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>信息评论</title>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="current_location">当前位置：<a href="<%=site_dir%>">网站首页</a> > 信息评论</div>
	<div class="l20">
		<div class="x4">
			<div class="hd1">我要评论</div>
			<div class="bd1">
				<form method="post">
					<div class="form-group">
						<div class="label"><label for="c_username">评论人</label></div>
						<div class="field">
							<input id="c_username" class="input" name="c_username" type="text" size="60" value="<%=iif(member_login,member_name,"")%>" data-validate="required:必填" />
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label for="c_content">评论内容</label></div>
						<div class="field">
							<textarea id="c_content" class="input" name="c_content" row="5" data-validate="required:必填"/></textarea>
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
							<input id="save" class="btn bg-dot" name="save" type="submit" value="提交评论" />
						</div>
					</div>
				</form>
			</div>
			<div class="hd1">评论注意事项</div>
			<div class="bd1"><%=site_comment_notice%></div>
		</div>
		<div class="x8">
			<h1><a href="<%=i_url(rqs("id"))%>"><%=get_field("cms_info",rqs("id"),"i_name")%></a></h1>
			<%
			sql = "select * from cms_comment where c_enable = 1 and c_parent = "&rqs("id")&" order by id asc"
			page_size = 10
			pager = pageturner_handle(sql, "id", page_size)
			Set rs = pager(0)
			i = 0
			Do While Not rs.EOF
			i = i + 1
			c_i = (pager(1) - 1)*page_size + i
			%>
			<div class="panel mb10">
			<div class="panel-hd"><span class="fr badge bg-dot">第<%=c_i%>楼</span> <span><%=rs("c_username")%></span> <span class="badge"><%=rs("c_date")%></span> </div>
			<div class="panel-bd"><%=rs("c_content")%></div>
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
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
