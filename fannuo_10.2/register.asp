<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
If site_member = 2 Then
	Call alert_back("已经关闭注册！")
End If
If Not inull(rf("save")) Then
	Call null_back(rfs("m_name"),"error")
	Call null_back(rfs("m_password"),"error")
	Call null_back(rfs("m_tname"),"error")
	Call null_back(rfs("m_tel"),"error")
	Set rs = ado_mquery("select * from cms_member")
	rs.AddNew
	rs("m_enable") = site_member
	rs("m_name") = rf("m_name")
	rs("m_password") = md5(rf("m_password"))
	rs("m_tname") = rf("m_tname")
	rs("m_tel") = rf("m_tel")
	rs("m_qq") = rf("m_qq")
	rs("m_wx") = rf("m_wx")
	rs("m_email") = rf("m_email")
	rs("m_address") = rf("m_address")
	rs("m_date") = Now()
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("注册成功，请登录","login.asp")
End If
include(iif(ism(),mskin&"register.asp",skin&"register.asp"))
%>
