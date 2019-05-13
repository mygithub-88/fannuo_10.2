<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_sitelink"
Call check_admin_purview("cms_sitelink")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_sitelink where id = "&rq("id")&"")
	rs("s_enable") = rf("s_enable")
	rs("s_name") = rf("s_name")
	rs("s_url") = rf("s_url")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("站内链接修改成功","cms_sitelink.asp")
End If

%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 修改链接 </div>
		<div class="bd">
			<%Set rs = ado_mquery("select * from cms_sitelink where id = "&rq("id")&"")%>
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="s_enable">状态</label></div>
					<div class="field">
						<label class="btn"><input id="s_enable" name="s_enable" type="radio" value="1" <%=iif((rs("s_enable") = 1),"checked=""checked""","")%>/>发布</label>
						<label class="btn"><input name="s_enable" type="radio" value="0" <%=iif((rs("s_enable") = 0),"checked=""checked""","")%>/>暂存</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="s_name">链接名称</label></div>
					<div class="field">
						<input id="s_name" class="input" name="s_name" type="text" size="60" data-validate="required:必填" value="<%=rs("s_name")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="s_url">链接地址</label></div>
					<div class="field">
						<input id="s_url" class="input" name="s_url" type="text" size="60" data-validate="required:必填" value="<%=rs("s_url")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="修改站内链接" />
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
