<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>人才招聘-<%=site_name%></title>
<meta name="keywords" content="<%=site_key%>">
<meta name="description" content="<%=site_des%>">
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="current_location">当前位置：<a href="<%=site_dir%>">网站首页</a> > 人才招聘</div>
	<div class="l20 recruitment_list">
		<%
		sql = "select * from cms_recruitment order by id desc"
		page_size = 10
		pager = pageturner_handle(sql, "id", page_size)
		Set rs = pager(0)
		Do While Not rs.EOF
		%>
		<div class="x3">
			<div class="wrap">
				<ul>
					<li>职位名称：<%=rs("r_name")%></li>
					<li>学历要求：<%=rs("r_education")%></li>
					<li>性别要求：<%=rs("r_gender")%></li>
					<li>年龄要求：<%=rs("r_age")%></li>
					<li>薪金待遇：<%=rs("r_salary")%></li>
					<li>语言要求：<%=rs("r_language")%></li>
					<li>招聘人数：<%=rs("r_quantity")%></li>
					<li>工作地点：<%=rs("r_address")%></li>
					<li>有效期至：<%=rs("r_indate")%></li>
				</ul>
				<span class="btn bg-main btn-block apply" data="<%=rs("r_name")%>">应聘此职位</span>
				<div class="content">详细要求：<%=rs("r_detail")%></div>
			</div>
		</div>
		<%
		rs.movenext
		Loop
		rs.Close
		Set rs = Nothing
		%>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
<div id="apply_form" class="dn p20">
	<form method="post">
		<div class="form-group">
			<div class="label"><label for="r_tname">真实姓名</label></div>
			<div class="field">
				<input id="r_name" name="r_name" type="hidden" value="" />
				<input id="r_tname" class="input" name="r_tname" type="text" size="60" value="" data-validate="required:必填" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="r_tel">电话</label></div>
			<div class="field">
				<input id="r_tel" class="input" name="r_tel" type="text" size="60" value="" data-validate="required:必填" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="r_education">学历</label></div>
			<div class="field">
				<select id="r_education" class="input" name="r_education" data-validate="required:必选">
					<option value="">请选择</option>
					<%=str_to_option(resume_education,"|","")%>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="r_gender">性别</label></div>
			<div class="field">
				<select id="r_gender" class="input" name="r_gender" data-validate="required:必选">
					<option value="">请选择</option>
					<%=str_to_option(resume_gender,"|","")%>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="r_birthday">出生年月</label></div>
			<div class="field">
				<input id="r_birthday" class="input laydate-icon" name="r_birthday" type="text" size="60" value="" onclick="laydate({format: 'YYYY/MM/DD'})" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="r_email">邮件</label></div>
			<div class="field">
				<input id="r_email" class="input" name="r_email" type="text" size="60" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="r_address">地址</label></div>
			<div class="field">
				<input id="r_address" class="input" name="r_address" type="text" size="60" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label for="r_detail">详细介绍</label></div>
			<div class="field">
				<textarea id="r_detail" class="input" name="r_detail" row="5" /></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="label"><label></label></div>
			<div class="field">
				<input id="save" class="btn bg-dot btn-block" name="save" type="submit" value="提交简历信息" />
			</div>
		</div>
	</form>
</div>
</html>
