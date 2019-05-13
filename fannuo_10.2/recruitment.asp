<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
If Not inull(rf("save")) Then
	Call null_back(rfs("r_name"),"error")
	Call null_back(rfs("r_tname"),"error")
	Call null_back(rfs("r_tel"),"error")
	Call null_back(rfs("r_education"),"error")
	Call null_back(rfs("r_gender"),"error")
	Set rs = ado_mquery("select * from cms_resume")
	rs.AddNew
	rs("r_name") = rfs("r_name")
	rs("r_tname") = rfs("r_tname")
	rs("r_education") = rfs("r_education")
	rs("r_gender") = rfs("r_gender")
	rs("r_birthday") = rfs("r_birthday")
	rs("r_tel") = rfs("r_tel")
	rs("r_email") = rfs("r_email")
	rs("r_address") = rfs("r_address")
	rs("r_detail") = rfs("r_detail")
	rs("r_date") = Now()
	rs.Update
	rs.Close
	Set rs = Nothing
	Call alert_href("简历提交成功","recruitment.asp")
End If
include (iif(ism(),mskin&"recruitment.asp",skin&"recruitment.asp"))
%>
