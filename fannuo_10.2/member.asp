<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
Call check_member_login()
include(iif(ism(),mskin&"member.asp",skin&"member.asp"))
%>
