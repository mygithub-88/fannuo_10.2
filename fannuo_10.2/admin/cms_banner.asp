<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_banner"
Call check_admin_purview("cms_banner")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_banner")
	rs.AddNew
	rs("b_enable") = rf("b_enable")
	rs("b_picture") = rf("b_picture")
	rs("b_name") = rf("b_name")
	rs("b_url") = rf("b_url")
	rs("b_parent") = rf("b_parent")
	rs("b_content") = rf("b_content")
	rs.Update
	rs("b_order") = rs("id")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("新幻灯添加成功","cms_banner.asp")
End If
If rq("act") = "del" Then
	conn.Execute("delete from cms_banner where id = "&rq("id")&" ")
	Call alert_href("幻灯删除成功！", "cms_banner.asp")
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
		<div class="hd"> 添加幻灯 </div>
		<div class="bd">
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="b_enable">状态</label></div>
					<div class="field">
						<label class="btn"><input id="b_enable" name="b_enable" type="radio" value="1" checked="checked"/>生效</label>
						<label class="btn"><input name="b_enable" type="radio" value="0" />暂存</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_parent">类型</label></div>
					<div class="field">
						<label class="btn"><input id="b_parent" name="b_parent" type="radio" value="1" checked="checked"/>电脑端</label>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_picture">幻灯图片</label> <span class="badge bg-dot cp" id="picture">上传</span></div>
					<div class="field">
						<input id="b_picture" class="input" name="b_picture" type="text" size="60" value="" />
						<div class="input-note">电脑端建议使用1920*<%=site_banner%>像素的图片，手机端使用的图片大小必须一致，建议640*360像素</div>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_name">名称</label></div>
					<div class="field">
						<input id="b_name" class="input" name="b_name" type="text" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_url">链接</label></div>
					<div class="field">
						<input id="b_url" class="input" name="b_url" type="text" size="60" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="b_content">内容</label></div>
					<div class="field">
						<textarea id="b_content" class="input" name="b_content" row="5" /></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="添加新幻灯" />
					</div>
				</div>
			</form>
		</div>
		<div class="hd"> 管理幻灯 </div>
		<div class="bd">
			<table class="table table-bordered">
				<tr>
					<th>状态</th>
					<th>排序</th>
					<th>图片地址</th>
					<th>幻灯名称</th>
					<th>属于</th>
					<th>链接地址</th>
					<th>修改</th>
				</tr>
				<%
				Set rs = ado_query("select * from cms_banner order by b_order asc , id asc")
				Do While Not rs.EOF
				%>
				<tr class="ac">
					<td><%=iif(rs("b_enable") = 1,"<span class=""badge bg-green"">生效</span>","<span class=""badge bg-dot"">暂存</span>")%></td>
					<td><%=rs("b_order")%></td>
					<td><a class="badge" href="<%=rs("b_picture")%>" target="_blank">查看图片</a></td>
					<td><%=rs("b_name")%></td>
					<td><%
					If rs("b_parent") = 1 then
						echo "<span class=""badge""> 电脑端</span>"
					else
						echo "<span class=""badge bg-green""> 手机端</span>"
					end if
					%></td>
					<td><%=rs("b_url")%></td>
					<td><a class="btn bg-main" href="cms_banner_modify.asp?id=<%=rs("id")%>"><span class="icon-edit"> 修改</span></a> <a class="btn bg-dot" href="cms_banner.asp?act=del&id=<%=rs("id")%>" onclick="return confirm('确定要删除此幻灯吗？')">删除</a></td>
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
	<div class="fc"></div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
