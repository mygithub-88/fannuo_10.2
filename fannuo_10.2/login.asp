<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
If Not inull(rf("submit")) Then
	Call null_back(rf("m_name"), "error")
	Call null_back(rf("m_password"), "error")
	Call null_back(rf("m_verifycode"), "error")
	If CStr(Session("CheckCode")) <> CStr(rfs("m_verifycode")) Then
		Call alert_back("验证码错误")
	End If
	Set rs = ado_query("select * from cms_member where m_name='"&rfs("m_name")&"' and m_password='"&md5(rfs("m_password"))&"'")
	If Not rs.EOF Then
		Response.Cookies("membername") = rfs("m_name")
		Response.Cookies("memberpassword") = rfs("m_password")
	Else
		Call alert_href("错误提示：用户名或密码错误，请核对后重新输入！","login.asp")
	End If
	rs.Close
	Set rs = Nothing
	Response.Redirect("member.asp")
End If
include(iif(ism(),mskin&"login.asp",skin&"login.asp"))
%>
