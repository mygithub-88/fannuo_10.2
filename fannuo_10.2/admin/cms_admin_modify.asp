<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_admin"
Call check_admin_purview("cms_admin")
If Not inull(rf("save")) Then
	Set rs = ado_query("select * from cms_admin where a_name = '"&a_name&"' and id <> "&rq("id")&" ")
	If Not rs.EOF Then
		Call alert_back("存在同名用户，请重新输入用户名！")
	End If
	rs.Close
	Set rs = Nothing

	Set rs = ado_mquery("select * from cms_admin where id = "&rq("id")&"")
	rs("a_enable") = iif((rq("id") = 1),1,rf("a_enable"))
	rs("a_name") = rf("a_name")
	rs("a_truename") = rf("a_truename")
	rs("a_penname") = rf("a_penname")
	rs("a_des") = rf("a_des")
	If rq("id") <> 1 Then
	rs("a_purview") = rf("a_purview")
	End If
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("用户修改成功","cms_admin.asp")
End If

%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 修改用户 </div>
		<div class="bd">
			<%Set rs = ado_mquery("select * from cms_admin where id = "&rq("id")&"")%>
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="a_enable">状态</label></div>
					<div class="field">
						<label class="btn"><input id="a_enable" name="a_enable" type="radio" value="1" <%=iif((rs("a_enable") = 1),"checked=""checked""","")%>/>启用</label>
						<label class="btn"><input name="a_enable" type="radio" value="0" <%=iif((rs("a_enable") = 0),"checked=""checked""","")%>/>禁用</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_name">用户名</label></div>
					<div class="field">
						<input id="a_name" class="input" name="a_name" type="text" size="60" data-validate="required:必填" value="<%=rs("a_name")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_truename">真实姓名</label></div>
					<div class="field">
						<input id="a_truename" class="input" name="a_truename" type="text" size="60" value="<%=rs("a_truename")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_penname">笔名</label></div>
					<div class="field">
						<input id="a_penname" class="input" name="a_penname" type="text" size="60" value="<%=rs("a_penname")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_des">描述</label></div>
					<div class="field">
						<input id="a_des" class="input" name="a_des" type="text" size="60" value="<%=rs("a_des")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="a_purview">权限</label></div>
					<div class="field">
						<%arr_purview = Split(rs("a_purview"),",")%>
						<input type="hidden" name="a_purview" value="pcfinalaspecms" />
						<label class="btn">添加信息 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_info_add")," checked=""checked""","")%> value="cms_info_add"/></label>
						<label class="btn">管理信息 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_info")," checked=""checked""","")%> value="cms_info"/></label>
						<label class="btn">添加频道 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_channel_add")," checked=""checked""","")%> value="cms_channel_add"/></label>
						<label class="btn">管理频道 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_channel")," checked=""checked""","")%> value="cms_channel"/></label>
						<label class="btn">管理幻灯 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_banner")," checked=""checked""","")%> value="cms_banner"/></label>
						<label class="btn">碎片内容 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_chip")," checked=""checked""","")%> value="cms_chip"/></label>
					</div>
					<div class="field mt4">
						<label class="btn">管理会员 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_member")," checked=""checked""","")%> value="cms_member"/></label>
						<label class="btn">管理留言 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_guestbook")," checked=""checked""","")%> value="cms_guestbook"/></label>
						<label class="btn">管理评论 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_comment")," checked=""checked""","")%> value="cms_comment"/></label>
						<label class="btn">管理订单 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_order")," checked=""checked""","")%> value="cms_order"/></label>
						<label class="btn">管理申请 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_requisition")," checked=""checked""","")%> value="cms_requisition"/></label>
						<label class="btn">管理招聘 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_recruitment")," checked=""checked""","")%> value="cms_recruitment"/></label>
						<label class="btn">管理应聘 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_resume")," checked=""checked""","")%> value="cms_resume"/></label>
						<label class="btn">友情链接 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_link")," checked=""checked""","")%> value="cms_link"/></label>
					</div>
					<div class="field mt4">
						<label class="btn">系统设置 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_system")," checked=""checked""","")%> value="cms_system"/></label>
						<label class="btn">管理用户 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_admin")," checked=""checked""","")%> value="cms_admin"/></label>
						<label class="btn">模板管理 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_skin")," checked=""checked""","")%> value="cms_skin"/></label>
						<label class="btn">站内链接 <input name="a_purview" type="checkbox" <%=iif(arr_in(arr_purview,"cms_sitelink")," checked=""checked""","")%> value="cms_sitelink"/></label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="修改用户" />
					</div>
				</div>
			</form>
			<%
			rs.Close
			Set rs = Nothing
			%>
		</div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
