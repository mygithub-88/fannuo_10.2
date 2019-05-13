<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
skey = Trim(rqs("key"))
Call null_back(skey,"请输入要搜索的关键字")
include(iif(ism(),mskin&"search.asp",skin&"search.asp"))
%>
