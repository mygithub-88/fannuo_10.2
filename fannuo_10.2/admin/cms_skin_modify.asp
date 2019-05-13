<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_skin"
Call check_admin_purview("cms_skin")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_skin where id = "&rq("id")&"")
	rs("s_type") = rf("s_type")
	rs("s_name") = rf("s_name")
	rs("s_logo") = rf("s_logo")
	rs("s_author") = rf("s_author")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("模板修改成功！", "cms_skin.asp")
End If
%>
<script type="text/javascript">
KindEditor.ready(function(K) {
	var editor = K.editor();
	K('#logo').click(function() {
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog({
			imageUrl : K('#s_logo').val(),
			clickFn : function(url, title, width, height, border, align) {
				K('#s_logo').val(url);
				editor.hideDialog();
				}
			});
		});
	});
});
</script>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 修改模板 </div>
		<div class="bd">
			<%Set rs = ado_mquery("select * from cms_skin where id = "&rq("id")&"")%>
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="s_type">类型</label></div>
					<div class="field">
						<select id="s_type" class="input" name="s_type">
							<option value="1" <%=iif((rs("s_type") = 1),"selected=""selected""","")%>>电脑版</option>
							<option value="2" <%=iif((rs("s_type") = 2),"selected=""selected""","")%>>手机版</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label color-red"><label for="s_name">模板名称</label></div>
					<div class="field">
						<input id="s_name" class="input" name="s_name" type="text" size="60" data-validate="required:必填" value="<%=rs("s_name")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label color-red"><label for="s_logo">Logo</label> <span class="badge bg-dot cp" id="logo">上传</span></div>
					<div class="field">
						<input id="s_logo" class="input" name="s_logo" type="text" size="60" data-validate="required:必填" value="<%=rs("s_logo")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="s_author">模板作者</label></div>
					<div class="field">
						<input id="s_author" class="input" name="s_author" type="text" size="60" value="<%=rs("s_author")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="修改模板" />
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
