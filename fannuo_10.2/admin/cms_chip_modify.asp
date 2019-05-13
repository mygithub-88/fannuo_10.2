<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_chip"
Call check_admin_purview("cms_chip")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_chip where id = "&rq("id")&"")
	rs("c_name") = rf("c_name")
	rs("c_content") = rf("c_content")
	rs("c_protected") = rf("c_protected")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("碎片修改成功","cms_chip.asp")
End If
%>
</head>
<script type="text/javascript">
$(function(){
	KindEditor.ready(function(K) {
		K.create('#c_content');
	});
});
</script>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd">修改碎片</div>
		<div class="bd">
			<%Set rs = ado_mquery("select * from cms_chip where id = "&rq("id")&"")%>
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="c_name">碎片名称</label></div>
					<div class="field">
						<input id="c_name" class="input" name="c_name" type="text" size="60" data-validate="required:必填" value="<%=rs("c_name")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="c_content">碎片内容</label></div>
					<div class="field">
						<textarea id="c_content" class="input" name="c_content" row="5" /><%=rs("c_content")%></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="c_protected">保护</label></div>
					<div class="field">
						<label class="btn"><input id="c_protected" name="c_protected" type="radio" value="0" <%=iif((rs("c_protected") = 0),"checked=""checked""","")%>/>否</label>
						<label class="btn"><input name="c_protected" type="radio" value="1" <%=iif((rs("c_protected") = 1),"checked=""checked""","")%>/>是</label>
						<div class="input-note">受保护的不能删除</div>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="修改碎片" />
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
