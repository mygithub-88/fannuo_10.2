<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_chip"
Call check_admin_purview("cms_chip")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_chip")
	rs.AddNew
	rs("c_name") = rf("c_name")
	rs("c_content") = rf("c_content")
	rs("c_protected") = rf("c_protected")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("新碎片添加成功","cms_chip.asp")
End If

If Not inull(rq("del")) Then
	Call non_numeric_back(rq("del"),"参数非法")
	Set rs = ado_query("select * from cms_chip where id = "&rq("del")&"")
	If rs.EOF Then
		Call alert_back("error")
	Else
		If rs("c_protected") = 1 Then
			Call alert_back("不能删除受保护的碎片内容")
		End If
	End If
	rs.Close
	Set rs = Nothing
	conn.Execute("delete from cms_chip where id = "&rq("del")&"")
	Call alert_href("碎片删除成功","cms_chip.asp")
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
		<div class="hd">添加碎片</div>
		<div class="bd">
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="c_name">碎片名称</label></div>
					<div class="field">
						<input id="c_name" class="input" name="c_name" type="text" size="60" data-validate="required:必填" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="c_content">碎片内容</label></div>
					<div class="field">
						<textarea id="c_content" class="input" name="c_content" row="5" /></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="c_protected">保护</label></div>
					<div class="field">
						<label class="btn"><input id="c_protected" name="c_protected" type="radio" value="0" checked="checked"/>否</label>
						<label class="btn"><input name="c_protected" type="radio" value="1" />是</label>
						<div class="input-note">受保护的不能删除</div>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="添加新碎片" />
					</div>
				</div>
			</form>
		</div>
		<div class="hd">管理碎片</div>
		<div class="bd">
			<table class="table table-bordered">
				<tr>
					<th>保护</th>
					<th>名称</th>
					<th>调用代码（请在模板需要位置插入碎片代码）</th>
					<th>操作</th>
				</tr>
				<%
				Set rs = ado_query("select * from cms_chip order by id asc")
				Do While Not rs.EOF
				%>
				<tr class="ac">
					<td><%=iif(rs("c_protected") = 1,"<span class=""badge bg-dot"">是</span>","<span class=""badge bg-green"">否</span>")%></td>
					<td><%=rs("c_name")%></td>
					<td><span class="badge">&lt;%=get_chip(<%=rs("id")%>)%&gt;</span></td>
					<td>
						<a class="btn bg-main" href="cms_chip_modify.asp?id=<%=rs("id")%>"><span class="icon-edit"> 修改</span></a>
						<%If rs("c_protected") = 0 Then%><a class="btn bg-dot" href="cms_chip.asp?del=<%=rs("id")%>" onclick="return confirm('确定要删除吗？')"><span class="icon-times"> 删除</span></a><%End If%>

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
<!--#include file="inc_bottom.asp"-->
</body>
</html>
