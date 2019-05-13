<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
Call check_member_login()
include(iif(ism(),mskin&"member_order.asp",skin&"member_order.asp"))
%>
