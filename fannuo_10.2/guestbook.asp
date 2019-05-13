<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="inc.asp"-->
<%
If site_guestbook = 2 And Not member_login Then
	Call alert_back("留言系统已经设置成会员专属，请登录后再留言！")
End If
If site_guestbook = 3 Then
	Call alert_back("留言系统已经关闭，暂时不能留言！")
End If
If Not inull(rfs("save")) Then
	Call null_back(rfs("g_username"),"error")
	Call null_back(rfs("g_phone"),"error")
	Call null_back(rfs("g_content"),"error")
	If CStr(Session("CheckCode")) <> CStr(rfs("verifycode")) Then
		Call alert_back("验证码错误！")
	End If
	Set rs = ado_mquery("select * from cms_guestbook")
	rs.AddNew
	rs("g_enable") = iif(site_guestbook > 0, 1, 0)
	rs("g_member") = iif(member_login, member_id, 0)
	rs("g_username") = rfs("g_username")
	rs("g_phone") = rfs("g_phone")
	rs("g_qq") = rfs("g_qq")
	rs("g_wx") = rfs("g_wx")
	rs("g_email") = rfs("g_email")
	rs("g_content") = rfs("g_content")
	rs("g_ip") = ip
	rs("g_date") = Now()
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("留言成功！", "guestbook.asp")
End If
include(iif(ism(),mskin&"guestbook.asp",skin&"guestbook.asp"))
%>
