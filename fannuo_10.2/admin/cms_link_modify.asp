<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_link"
Call check_admin_purview("cms_link")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_link where id = "&rq("id")&"")
	rs("l_enable") = rf("l_enable")
	rs("l_name") = rf("l_name")
	rs("l_url") = rf("l_url")
	rs("l_picture") = rf("l_picture")
	rs("l_order") = rf("l_order")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("链接修改成功！", "cms_link.asp")
End If
%>
<script type="text/javascript">
$(function(){
	KindEditor.ready(function(K) {
		var editor = K.editor();
		K('#picture').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
				imageUrl : K('#l_picture').val(),
				clickFn : function(url, title, width, height, border, align) {
					K('#l_picture').val(url);
					editor.hideDialog();
					}
				});
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
		<div class="hd"> 修改链接 </div>
		<div class="bd">
			<%Set rs = ado_mquery("select * from cms_link where id = "&rq("id")&"")%>
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="l_enable">状态</label></div>
					<div class="field">
						<label class="btn"><input id="l_enable" name="l_enable" type="radio" value="1" <%=iif((rs("l_enable") = 1),"checked=""checked""","")%>/>发布</label>
						<label class="btn"><input name="l_enable" type="radio" value="0" <%=iif((rs("l_enable") = 0),"checked=""checked""","")%>/>暂存</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="l_name">链接名称</label></div>
					<div class="field">
						<input id="l_name" class="input" name="l_name" type="text" size="60" data-validate="required:必填" value="<%=rs("l_name")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="l_url">链接地址</label></div>
					<div class="field">
						<input id="l_url" class="input" name="l_url" type="text" size="60" data-validate="required:必填" value="<%=rs("l_url")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="l_picture">链接图片</label> <span class="badge bg-dot cp" id="picture">上传</span></div>
					<div class="field">
						<input id="l_picture" class="input" name="l_picture" type="text" size="60" value="<%=rs("l_picture")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="l_order">排序</label></div>
					<div class="field">
						<input id="l_order" class="input" name="l_order" type="text" size="60" data-validate="required:必填,plusinteger:必须为正整数" value="<%=rs("l_order")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="修改链接" />
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
