<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>退出管理后台</title>
</head>
<body>
<%
Response.Cookies("adminname") = ""
Response.Cookies("adminpassword") = ""
Response.Cookies("upload") = ""
Response.Redirect("index.asp")
%>
</body>
</html>
