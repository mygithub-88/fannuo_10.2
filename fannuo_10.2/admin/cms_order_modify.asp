<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_order"
Call check_admin_purview("cms_order")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_order where id = "&rq("id")&"")
	rs("o_answer") = rf("o_answer")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("回复成功", "cms_order.asp")
End If
%>
</head>
<script type="text/javascript">
$(function(){
	KindEditor.ready(function(K) {
		K.create('#o_answer');
	});
});
</script>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
		<!--#include file="inc_left.asp"-->
		<div id="right">
			<div class="hd">订单详情</div>
			<div class="bd">
				<%Set rs = ado_mquery("select * from cms_order where id = "&rq("id")&"")%>
					<table class="table table-bordered">
						<tr>
							<td width="120">产品名称</td>
							<td><%=rs("o_name")%></td>
						</tr>
						<tr>
							<td>下单日期</td>
							<td><%=rs("o_date")%></td>
						</tr>
						<tr>
							<td>订购人</td>
							<td><%=rs("o_username")%> <%=ifmember(rs("o_member"))%></td>
						</tr>
						<tr>
							<td>联系电话</td>
							<td><%=rs("o_tel")%></td>
						</tr>
						<tr>
							<td>电子邮件</td>
							<td><%=rs("o_email")%></td>
						</tr>
						<tr>
							<td>发货地址</td>
							<td><%=rs("o_address")%></td>
						</tr>
						<tr>
							<td>备注内容</td>
							<td><%=rs("o_content")%></td>
						</tr>
					</table>
				<form method="post">
					<div class="form-group mt20">
						<div class="label"><label for="o_answer">回复内容</label></div>
						<div class="field">
							<textarea id="o_answer" class="input" name="o_answer" row="5" /><%=str_editor(rs("o_answer"))%></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="label"><label></label></div>
						<div class="field">
							<input id="save" class="btn bg-dot" name="save" type="submit" value="回复" />
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
