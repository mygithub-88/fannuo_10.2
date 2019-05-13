<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
Call non_numeric_back(rq("id"), "error")
If site_comment = 2 And Not member_login Then
	Call alert_back("评论系统已经设置成会员专属，请登录后再评论！")
End If
If site_comment = 3 Then
	Call alert_back("评论系统已经关闭，暂时不能评论！")
End If
If Not inull(rf("save")) Then
	Call null_back(rfs("c_username"),"error")
	Call null_back(rfs("c_content"),"error")
	Call null_back(rfs("verifycode"),"error")
	If CStr(Session("CheckCode")) <> CStr(rfs("verifycode")) Then
		call alert_back("验证码错误！")
	End If
	Set rs = ado_mquery("select * from cms_comment")
	rs.AddNew
	rs("c_enable") = iif(site_comment > 0, 1, 0)
	rs("c_member") = iif(member_login, member_id, 0)
	rs("c_ip") = ip
	rs("c_parent") = rqs("id")
	rs("c_username") = rfs("c_username")
	rs("c_content") = rfs("c_content")
	rs("c_date") = Now()
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("评论提交成功！", "comment.asp?id="&rqs("id")&"")
End If
include(iif(ism(),mskin&"comment.asp",skin&"comment.asp"))

%>
