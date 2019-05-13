<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_admin"
Call check_admin_purview("cms_admin")
If Not inull(rf("save")) Then
	Set rs = ado_query("select * from cms_admin where a_name = '"&a_name&"' ")
	If Not rs.EOF Then
		Call alert_back("存在同名用户，请重新输入用户名！")
	End If
	rs.Close
	Set rs = Nothing

	Set rs = ado_mquery("select * from cms_admin")
	rs.AddNew
	rs("a_enable") = rf("a_enable")
	rs("a_name") = rf("a_name")
	rs("a_password") = md5(rf("a_password"))
	rs("a_truename") = rf("a_truename")
	rs("a_penname") = rf("a_penname")
	rs("a_des") = rf("a_des")
	rs("a_purview") = rf("a_purview")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("新用户添加成功","cms_admin.asp")
End If

If Not inull(rq("del")) Then
	Call non_numeric_back(rq("del"),"参数非法")
	conn.Execute("delete from cms_admin where id = "&Int(rq("del"))&"")
	Call alert_href("用户删除成功！", "cms_admin.asp")
End If

If Not inull(rq("pwd")) Then
	Call non_numeric_back(rq("pwd"),"参数非法")
	conn.Execute("update cms_admin set a_password = '"&md5("123456")&"' where id = "&rq("pwd")&"")
	Call alert_href("密码重置成功","cms_admin.asp")
End If
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 添加用户 </div>
		<div class="bd">
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="a_enable">状态</label></div>
					<div class="field">
						<label class="btn"><input id="a_enable" name="a_enable" type="radio" value="1" checked="checked"/>启用</label>
						<label class="btn"><input name="a_enable" type="radio" value="0" />禁用</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_name">用户名</label></div>
					<div class="field">
						<input id="a_name" class="input" name="a_name" type="text" size="60" data-validate="required:必填" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_password">登录密码</label></div>
					<div class="field">
						<input id="a_password" class="input" name="a_password" type="password" size="60" data-validate="required:必填" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_cpassword">确认密码</label></div>
					<div class="field">
						<input id="a_cpassword" class="input" name="a_cpassword" type="password" size="60" data-validate="required:请填写确认密码,repeat#a_password:两次输入的密码不一致" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_truename">真实姓名</label></div>
					<div class="field">
						<input id="a_truename" class="input" name="a_truename" type="text" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_penname">笔名</label></div>
					<div class="field">
						<input id="a_penname" class="input" name="a_penname" type="text" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_des">描述</label></div>
					<div class="field">
						<input id="a_des" class="input" name="a_des" type="text" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_purview">权限</label></div>
					<div class="field">
						<input type="hidden" name="a_purview" value="pcfinalaspecms" />
						<label class="btn">添加信息 <input name="a_purview" type="checkbox" checked="checked" value="cms_info_add"/></label>
						<label class="btn">管理信息 <input name="a_purview" type="checkbox" checked="checked" value="cms_info"/></label>
						<label class="btn">添加频道 <input name="a_purview" type="checkbox" checked="checked" value="cms_channel_add"/></label>
						<label class="btn">管理频道 <input name="a_purview" type="checkbox" checked="checked" value="cms_channel"/></label>
						<label class="btn">管理幻灯 <input name="a_purview" type="checkbox" checked="checked" value="cms_banner"/></label>
						<label class="btn">碎片内容 <input name="a_purview" type="checkbox" checked="checked" value="cms_chip"/></label>
					</div>
					<div class="field mt4">
						<label class="btn">管理会员 <input name="a_purview" type="checkbox" checked="checked" value="cms_member"/></label>
						<label class="btn">管理留言 <input name="a_purview" type="checkbox" checked="checked" value="cms_guestbook"/></label>
						<label class="btn">管理评论 <input name="a_purview" type="checkbox" checked="checked" value="cms_comment"/></label>
						<label class="btn">管理订单 <input name="a_purview" type="checkbox" checked="checked" value="cms_order"/></label>
						<label class="btn">管理申请 <input name="a_purview" type="checkbox" checked="checked" value="cms_requisition"/></label>
						<label class="btn">管理招聘 <input name="a_purview" type="checkbox" checked="checked" value="cms_recruitment"/></label>
						<label class="btn">管理应聘 <input name="a_purview" type="checkbox" checked="checked" value="cms_resume"/></label>
						<label class="btn">友情链接 <input name="a_purview" type="checkbox" checked="checked" value="cms_link"/></label>
					</div>
					<div class="field mt4">
						<label class="btn">系统设置 <input name="a_purview" type="checkbox" checked="checked" value="cms_system"/></label>
						<label class="btn">管理用户 <input name="a_purview" type="checkbox" value="cms_admin"/></label>
						<label class="btn">模板管理 <input name="a_purview" type="checkbox" checked="checked" value="cms_skin"/></label>
						<label class="btn">站内链接 <input name="a_purview" type="checkbox" checked="checked" value="cms_sitelink"/></label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="添加新用户" />
					</div>
				</div>
			</form>
		</div>
		<div class="hd"> 管理用户 </div>
		<div class="bd">
			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<th>状态</th>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>笔名</th>
					<th>描述</th>
					<th>修改</th>
				</tr>
				<%
				Set rs = ado_query("select* from cms_admin order by id asc")
				Do While Not rs.EOF
				%>
				<tr class="ac">
					<td><%=rs("id")%></td>
					<td><%=iif(rs("a_enable") = 1,"<span class=""badge bg-green"">启用</span>","<span class=""badge bg-dot"">禁用</span>")%></td>
					<td><%=rs("a_name")%></td>
					<td><%=rs("a_truename")%></td>
					<td><%=rs("a_penname")%></td>
					<td><%=rs("a_des")%></td>
					<td><a class="btn bg-main" href="cms_admin_modify.asp?id=<%=rs("id")%>"><span class="icon-edit"> 修改</span></a> <a class="btn bg-dot" href="cms_admin.asp?pwd=<%=rs("id")%>" onclick="return confirm('确定要把此用户的密码重置成123456吗？')"><span class="icon-key"> 重置密码</span></a> <a class="btn bg-dot" <%=iif(rs("id") = 1,"style=""display:none;""","")%> href="cms_admin.asp?del=<%=rs("id")%>" onclick="return confirm('确定要删除此用户吗？')"><span class="icon-times"> 删除</span></a></td>
				</tr>
				<%
				rs.movenext
				Loop
				rs.Close
				Set rs = Nothing
				%>
			</table>
		</div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
