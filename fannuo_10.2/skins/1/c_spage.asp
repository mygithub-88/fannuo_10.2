<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title><%=c_title%></title><%If Not inull(c_key) Then%>
<meta name="keywords" content="<%=c_key%>" /><%End If%><%If Not inull(c_des) Then%>
<meta name="description" content="<%=c_des%>" /><%End If%>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<!--#include file="inc_channel.asp"-->
	<div class="l20">
		<div class="x3">
			<div class="hd1"><%=c_name%> <span class="aname"><%=c_aname%></span></div>
			<div class="bd1">
				<ul class="channel_list">
					<%=channel_list(iif((c_ifsub = 1),c_id,c_parent))%>
				</ul>
			</div>
		</div>
		<div class="x9">
			<div id="channel_content"> <%=c_content%> </div>
		</div>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</div>
</body>
</html>