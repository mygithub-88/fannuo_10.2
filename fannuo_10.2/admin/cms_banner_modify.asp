<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_banner"
Call check_admin_purview("cms_banner")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_banner where id = "&rq("id")&"")
	rs("b_enable") = rf("b_enable")
	rs("b_picture") = rf("b_picture")
	rs("b_name") = rf("b_name")
	rs("b_url") = rf("b_url")
	rs("b_parent") = rf("b_parent")
	rs("b_content") = rf("b_content")
	rs("b_order") = rf("b_order")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("幻灯修改成功","cms_banner.asp")
End If
%>
</head>
<script type="text/javascript">
$(function(){
	KindEditor.ready(function(K) {
		var editor = K.editor();
		K('#picture').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
				imageUrl : K('#b_picture').val(),
				clickFn : function(url, title, width, height, border, align) {
					K('#b_picture').val(url);
					editor.hideDialog();
					}
				});
			});
		});
	});
});
</script>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 修改幻灯 </div>
		<div class="bd">
			<%Set rs = ado_mquery("select * from cms_banner where id = "&rq("id")&"")%>
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="b_enable">状态</label></div>
					<div class="field">
						<label class="btn"><input id="b_enable" name="b_enable" type="radio" value="1" <%=iif((rs("b_enable") = 1),"checked=""checked""","")%>/>生效</label>
						<label class="btn"><input name="b_enable" type="radio" value="0" <%=iif((rs("b_enable") = 0),"checked=""checked""","")%>/>暂存</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_parent">类型</label></div>
					<div class="field">
						<label class="btn"><input id="b_parent" name="b_parent" type="radio" value="1" <%=iif((rs("b_parent") = 1),"checked=""checked""","")%>/>电脑端</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_picture">幻灯图片</label> <span class="badge bg-dot cp" id="picture">上传</span></div>
					<div class="field">
						<input id="b_picture" class="input" name="b_picture" type="text" size="60" value="<%=rs("b_picture")%>" />
						<div class="input-note">电脑端建议使用1920*<%=site_banner%>像素的图片，手机端使用的图片大小必须一致，建议640*360像素</div>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_order">排序</label></div>
					<div class="field">
						<input id="b_order" class="input" name="b_order" type="text" size="60" value="<%=rs("b_order")%>" data-validate="required:必填,plusinteger:必须为正整数" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_name">名称</label></div>
					<div class="field">
						<input id="b_name" class="input" name="b_name" type="text" size="60" value="<%=rs("b_name")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_url">链接</label></div>
					<div class="field">
						<input id="b_url" class="input" name="b_url" type="text" size="60" value="<%=rs("b_url")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_content">内容</label></div>
					<div class="field">
						<textarea id="b_content" class="input" name="b_content" row="5" /><%=rs("b_content")%></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="修改幻灯" />
					</div>
				</div>
			</form>
			<%
			rs.Close
			Set rs = Nothing
			%>
		</div>
	</div>
	<div class="fc"></div>
</div>

<!--#include file="inc_bottom.asp"-->
</body>
</html>
