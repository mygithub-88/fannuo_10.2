<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_recruitment"
Call check_admin_purview("cms_recruitment")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_recruitment where id = "&rq("id")&"")
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
	Call alert_href("招聘修改成功！", "cms_recruitment.asp")
End If
%>
</head>
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
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 修改招聘 </div>
		<div class="bd">
			<%Set rs = ado_mquery("select * from cms_recruitment where id = "&rq("id")&"")%>
			<form method="post">
				<div class="form-group">
					<div class="label"><label for="r_name">职位名称</label> <span class="badge bg-dot">必填</span></div>
					<div class="field">
						<input id="r_name" class="input" name="r_name" type="text" size="60" data-validate="required:必填" value="<%=rs("r_name")%>" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_education">学历要求</label></div>
					<div class="field">
						<select id="r_education" class="input" name="r_education">
							<%=str_to_option(recruitment_education,"|",rs("r_education"))%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_gender">性别要求</label></div>
					<div class="field">
						<select id="r_gender" class="input" name="r_gender">
							<%=str_to_option(recruitment_gender,"|",rs("r_gender"))%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_age">年龄要求</label></div>
					<div class="field">
						<select id="r_age" class="input" name="r_age">
							<%=str_to_option(recruitment_age,"|",rs("r_age"))%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_salary">薪金待遇</label></div>
					<div class="field">
						<select id="r_salary" class="input" name="r_salary">
							<%=str_to_option(recruitment_salary,"|",rs("r_salary"))%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_language">语言要求</label></div>
					<div class="field">
						<select id="r_language" class="input" name="r_language">
							<%=str_to_option(recruitment_language,"|",rs("r_language"))%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_quantity">招聘人数</label></div>
					<div class="field">
						<select id="r_quantity" class="input" name="r_quantity">
							<%=str_to_option(recruitment_quantity,"|",rs("r_quantity"))%>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_address">工作地点</label></div>
					<div class="field" id="address">
						<%
						arr_address = Split(rs("r_address"),",")
						address_count = UBound(arr_address)
						If address_count = 0 Then
							address0 = ""
							address1 = ""
							address2 = ""
						ElseIf address_count = 1 Then
							address0 = arr_address(0)
							address1 = arr_address(1)
							address2 = ""
						ElseIf address_count = 2 Then
							address0 = arr_address(0)
							address1 = arr_address(1)
							address2 = arr_address(2)
						End If
						%>
						<div class="l10">
							<div class="x2">
								<select class="input province" name="r_address" data-value="<%=str_trim(address0)%>"></select>
							</div>
							<div class="x2">
								<select class="input city" name="r_address" data-value="<%=str_trim(address1)%>"></select>
							</div>
							<div class="x2">
								<select class="input county" name="r_address" data-value="<%=str_trim(address2)%>"></select>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_indate">有效期至</label></div>
					<div class="field">
						<input id="r_indate" class="input laydate-icon" name="r_indate" type="text" size="60" value="<%=rs("r_indate")%>" onclick="laydate({format: 'YYYY/MM/DD'})" />
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label for="r_detail">详细要求</label></div>
					<div class="field">
						<textarea id="r_detail" class="input" name="r_detail" row="5" /><%=str_editor(rs("r_detail"))%></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="修改职位" />
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
