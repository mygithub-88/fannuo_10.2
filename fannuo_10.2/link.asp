<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
If Not inull(rf("save")) Then
	Call null_back(rfs("l_name"), "error！")
	Call null_back(rfs("l_url"), "error！")
	Call null_back(rfs("verifycode"), "error！")
	If CStr(Session("CheckCode")) <> CStr(rf("verifycode")) Then
		Call alert_back("验证码错误！")
	End If
	Set rs = ado_mquery("select * from cms_link")
	rs.AddNew
	rs("l_enable") = 0
	rs("l_name") = rfs("l_name")
	rs("l_url") = rfs("l_url")
	rs("l_picture") = rfs("l_picture")
	rs.update
	rs("l_order") = rs("id")
	rs.update
	rs.Close
	Set rs = Nothing
	Call alert_href("提交成功，请等待我们的审核！", "link.asp")
End If
include (iif(ism(),mskin&"link.asp",skin&"link.asp"))
%>
