<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_skin"
Call check_admin_purview("cms_skin")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_skin")
	rs.AddNew
	rs("s_type") = rf("s_type")
	rs("s_name") = rf("s_name")
	rs("s_logo") = rf("s_logo")
	rs("s_path") = rf("s_path")
	rs("s_author") = rf("s_author")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("模板添加成功！", "cms_skin.asp")
End If

If rq("act") = "del" Then
	conn.Execute("delete from cms_skin where id = "&rq("id")&" ")
	Call alert_href("模板删除成功！", "cms_skin.asp")
End If

If Not inull(rq("path")) Then
	conn.Execute("update cms_system set site_skin = '"&rq("path")&"'")
	Call alert_href("电脑模板设置成功，请刷新网站查看效果","cms_skin.asp")
End If
If Not inull(rq("mpath")) Then
	conn.Execute("update cms_system set site_mskin = '"&rq("mpath")&"'")
	Call alert_href("手机模板设置成功，请刷新网站查看效果","cms_skin.asp")
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
		<div class="l20">
			<div class="x6">
				<div class="hd"> 管理电脑模板 </div>
				<div class="bd">
					<table class="table table-bordered">
						<tr>
							<th>模板名称</th>
							<th>模板路径</th>
							<th>模板作者</th>
							<th>操作</th>
						</tr>
						<%
						Set rs = ado_query("select * from cms_skin where s_type = 1 order by id asc")
						Do While Not rs.EOF
						%>
						<tr class="ac">
							<td><%=rs("s_name")%></td>
							<td><%=rs("s_path")%></td>
							<td><%=rs("s_author")%></td>
							<td>
								<%
								If rs("s_path") = site_skin Then
								echo "<span class=""badge bg-dot"">当前使用</span>"
								Else
								%>
								<a class="btn bg-main" href="cms_skin.asp?path=<%=rs("s_path")%>" onclick="return confirm('确定要使用此模板吗？')">使用</a>
								<a class="btn bg-dot" href="cms_skin.asp?act=del&id=<%=rs("id")%>" onclick="return confirm('确定要删除此模板吗？')"><span class="icon-times"> 删除</span></a>
								<%end if%>
								<a class="btn bg-main" href="cms_skin_modify.asp?id=<%=rs("id")%>"><span class="icon-edit"> 修改</span></a>
							</td>
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
			<div class="x6">
				<div class="hd"> 管理手机模板 </div>
				<div class="bd">
					<table class="table table-bordered">
						<tr>
							<th>模板名称</th>
							<th>模板路径</th>
							<th>模板作者</th>
							<th>操作</th>
						</tr>
						<%
						Set rs = ado_query("select * from cms_skin where s_type = 2 order by id asc")
						Do While Not rs.EOF
						%>
						<tr class="ac">
							<td><%=rs("s_name")%></td>
							<td><%=rs("s_path")%></td>
							<td><%=rs("s_author")%></td>
							<td>
								<%
								If rs("s_path") = site_mskin Then
								echo "<span class=""badge bg-dot"">当前使用</span>"
								Else
								%>
								<a class="btn bg-main" href="cms_skin.asp?mpath=<%=rs("s_path")%>" onclick="return confirm('确定要使用此模板吗？')">使用</a>
								<a class="btn bg-dot" href="cms_skin.asp?act=del&id=<%=rs("id")%>" onclick="return confirm('确定要删除此模板吗？')"><span class="icon-times"> 删除</span></a>
								<%end if%>
								<a class="btn bg-main" href="cms_skin_modify.asp?id=<%=rs("id")%>"><span class="icon-edit"> 修改</span></a>
							</td>
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
		<div class="hd"> 添加新模板 </div>
		<div class="bd">
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="s_type">类型</label></div>
					<div class="field">
						<select id="s_type" class="input" name="s_type">
							<option value="1">电脑版</option>
							<option value="2">手机版</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label color-red"><label for="s_name">模板名称</label></div>
					<div class="field">
						<input id="s_name" class="input" name="s_name" type="text" size="60" data-validate="required:必填" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label color-red"><label for="s_path">模板路径</label></div>
					<div class="field">
						<input id="s_path" class="input" name="s_path" type="text" size="60" data-validate="required:必填" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label color-red"><label for="s_logo">Logo</label> <span class="badge bg-dot cp" id="logo">上传</span></div>
					<div class="field">
						<input id="s_logo" class="input" name="s_logo" type="text" size="60" data-validate="required:必填" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="s_author">模板作者</label></div>
					<div class="field">
						<input id="s_author" class="input" name="s_author" type="text" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="添加新模板" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
