<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="inc.asp"-->
<%
If Not inull(rf("save")) Then
	Call null_back(rf("r_username"), "error")
	Call null_back(rf("r_tel"), "error")
	Call null_back(rf("r_content"), "error")
	Call null_back(rf("verifycode"), "error")
	If CStr(Session("CheckCode")) <> CStr(rf("verifycode")) Then
		Call alert_back("验证码错误！")
	End If
	Set rs = ado_mquery("select * from cms_requisition")
	rs.AddNew
	rs("r_username") = rfs("r_username")
	rs("r_tel") = rfs("r_tel")
	rs("r_email") = rfs("r_email")
	rs("r_content") = rfs("r_content")
	rs("r_date") = Now()
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("申请提交成功", "requisition.asp")
End If
include (iif(ism(),mskin&"requisition.asp",skin&"requisition.asp"))

%>
