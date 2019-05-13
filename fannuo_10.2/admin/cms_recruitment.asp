<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_recruitment"
Call check_admin_purview("cms_recruitment")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_recruitment")
	rs.AddNew
	rs("r_name") = rf("r_name")
	rs("r_education") = rf("r_education")
	rs("r_gender") = rf("r_gender")
	rs("r_age") = rf("r_age")
	rs("r_salary") = rf("r_salary")
	rs("r_language") = rf("r_language")
	rs("r_quantity") = rf("r_quantity")
	rs("r_address") = rf("r_address")
	rs("r_indate") = rf("r_indate")
	rs("r_detail") = rf("r_detail")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("招聘信息添加成功！", "cms_recruitment.asp")
End If
If Not inull(rfs("execute")) Then
	Call null_back(rf("id"), "请至少选中一项！")
	If inull(rf("method")) Then
		Call alert_back("请选择要执行的操作！")
	Else
		sql = "delete from cms_recruitment where id in ("&rf("id")&")"
	End If
	conn.Execute(sql)
	Call alert_href ("执行成功！", "cms_recruitment.asp")
End If
%>
<script type="text/javascript">
$(function(){
	$('#address').cxSelect({
		url: '../plus/cxselect/cityData.min.js',
		selects: ['province', 'city', 'county'],
		emptyStyle: 'none'
	});
	KindEditor.ready(function(K) {
		K.create('#r_detail');
	});
});
</script>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 添加招聘 </div>
		<div class="bd">
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="r_name">职位名称</label> <span class="badge bg-dot">必填</span></div>
					<div class="field">
						<input id="r_name" class="input" name="r_name" type="text" size="60" data-validate="required:必填" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_education">学历要求</label></div>
					<div class="field">
						<select id="r_education" class="input" name="r_education">
							<%=str_to_option(recruitment_education,"|","")%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_gender">性别要求</label></div>
					<div class="field">
						<select id="r_gender" class="input" name="r_gender">
							<%=str_to_option(recruitment_gender,"|","")%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_age">年龄要求</label></div>
					<div class="field">
						<select id="r_age" class="input" name="r_age">
							<%=str_to_option(recruitment_age,"|","")%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_salary">薪金待遇</label></div>
					<div class="field">
						<select id="r_salary" class="input" name="r_salary">
							<%=str_to_option(recruitment_salary,"|","")%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_language">语言要求</label></div>
					<div class="field">
						<select id="r_language" class="input" name="r_language">
							<%=str_to_option(recruitment_language,"|","")%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_quantity">招聘人数</label></div>
					<div class="field">
						<select id="r_quantity" class="input" name="r_quantity">
							<%=str_to_option(recruitment_quantity,"|","")%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_address">工作地点</label></div>
					<div class="field" id="address">
						<div class="l10">
							<div class="x2">
								<select class="input province" name="r_address"></select>
							</div>
							<div class="x2">
								<select class="input city" name="r_address"></select>
							</div>
							<div class="x2">
								<select class="input county" name="r_address"></select>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_indate">有效期至</label></div>
					<div class="field">
						<input id="r_indate" class="input laydate-icon" name="r_indate" type="text" size="60" value="" onclick="laydate({format: 'YYYY/MM/DD'})" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_detail">详细要求</label></div>
					<div class="field">
						<textarea id="r_detail" class="input" name="r_detail" row="5" /></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="发布新职位" />
					</div>
				</div>
			</form>
		</div>
		<div class="hd"> 管理招聘 </div>
		<div class="bd">
			<form method="post" class="form-auto">
				<table class="table table-bordered">
					<tr>
						<th>选</th>
						<th>职位名称</th>
						<th>学历要求</th>
						<th>薪金待遇</th>
						<th>语言要求</th>
						<th>招聘人数</th>
						<th>有效期至</th>
						<th>修改</th>
					</tr>
					<%
					sql = "select * from cms_recruitment order by id asc"
					page_size = 10
					pager = pageturner_handle(sql, "id", page_size)
					Set rs = pager(0)
					Do While Not rs.EOF
					%>
					<tr class="ac">
						<td><input name="id" type="checkbox" id="id" value="<%=rs("id")%>" /></td>
						<td><%=rs("r_name")%></td>
						<td><%=rs("r_education")%></td>
						<td><%=rs("r_salary")%></td>
						<td><%=rs("r_language")%></td>
						<td><%=rs("r_quantity")%></td>
						<td><%=rs("r_indate")%></td>
						<td><a class="btn bg-main" href="cms_recruitment_modify.asp?id=<%=rs("id")%>"><span class="icon-edit"> 修改</span></a></td>
					</tr>
					<%
					rs.movenext
					Loop
					rs.Close
					Set rs = Nothing
					%>
					<tr>
						<td class="ac"><input type="checkbox" onclick="check_all(this,'id')" /></td>
						<td colspan="7">
							<select class="input" name="method">
								<option value="">选择操作</option>
								<option value="1">删除招聘</option>
							</select>
							<input class="btn bg-main" type="submit" name="execute" value="执行操作" />
						</td>
					</tr>
				</table>
			</form>
			<%=pageturner_show(pager(1),pager(2),pager(3),page_size,5)%> </div>
	</div>

</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
