<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
Call check_member_login()
If Not inull(rfs("save")) Then
	Call null_back(rfs("m_tname"),"error")
	Call null_back(rfs("m_tel"),"error")
	Set rs = ado_mquery("select * from cms_member where id = "&member_id&"")
	rs("m_tname") = rfs("m_tname")
	rs("m_tel") = rfs("m_tel")
	rs("m_qq") = rfs("m_qq")
	rs("m_wx") = rfs("m_wx")
	rs("m_email") = rfs("m_email")
	rs("m_address") = rfs("m_address")
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("修改成功",site_dir&"member.asp")
End If
If Not inull(rfs("save1")) Then
	Call null_back(rfs("m_opassword"),"error")
	If md5(rfs("m_opassword")) <> member_password Then
		Call alert_back("原始密码错误")
	End If
	Call null_back(rfs("m_password"),"error")
	Call null_back(rfs("m_cpassword"),"error")
	If rfs("m_password") <> rfs("m_cpassword") Then
		Call alert_back("error")
	End If
	Set rs = ado_mquery("select * from cms_member where id = "&member_id&"")
	rs("m_password") = md5(rfs("m_password"))
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("密码修改成功",site_dir&"member.asp")
End If
include(iif(ism(),mskin&"member_edit.asp",skin&"member_edit.asp"))
%>
