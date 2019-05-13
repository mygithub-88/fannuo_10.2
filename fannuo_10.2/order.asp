<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="inc.asp"-->
<%
If site_order = 1 And Not member_login Then
	Call alert_back("订单系统已经设置成会员专属，请登录后再订购！")
End If
If site_order = 2 Then
	Call alert_back("订单系统已经关闭，暂时不能订购！")
End If
If inull(rq("id")) Then
	o_name = ""
Else
	Call non_numeric_back(rq("id"), "error！")
	Set rs = ado_query("select * from cms_info where id = "&rq("id")&" ")
	If rs.EOF Then
		Call alert_back("error")
	End If
	o_name = rs("i_name")
	rs.Close
	Set rs = Nothing
End If
If Not inull(rfs("save")) Then
	Call null_back(rfs("o_name"),"error")
	Call null_back(rfs("o_username"),"error")
	Call null_back(rfs("o_tel"),"error")
	Call null_back(rfs("o_address"),"error")
	Set rs = ado_mquery("select * from cms_order")
	rs.AddNew
	rs("o_member") = iif(member_login, member_id, 0)
	rs("o_name") = rfs("o_name")
	rs("o_username") = rfs("o_username")
	rs("o_tel") = rfs("o_tel")
	rs("o_email") = rfs("o_email")
	rs("o_address") = rfs("o_address")
	rs("o_content") = rfs("o_content")
	rs("o_date") = Now()
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("订单提交成功成功！", "order.asp")
End If
include(iif(ism(),mskin&"order.asp",skin&"order.asp"))
%>
