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
	<ul class="channel_wlist">
		<%
		If Not(c_ifsub = 0 And c_parent = 0) Then
			echo channel_list(iif((c_ifsub = 1),c_id,c_parent))
		End If
		%>
	</ul>
	<div id="channel_content"> <%=c_content%> </div>
	<div class="article_wlist l20">
		<%
		sql = "select * from cms_info where i_enable = 1 and i_parent in ("&c_sub&") order by i_order desc , id desc"
		pager = pageturner_handle(sql, "id", c_page)
		Set rs = pager(0)
		Do While Not rs.EOF
		%>
		<div class="x6">
			<div class="wrap cut">
				<span class="fr"><%=str_time("y-mm-dd",rs("i_date"))%></span><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a>
			</div>
		</div>
		<%
		rs.movenext
		Loop
		rs.Close
		Set rs = Nothing
		%>
	</div>
	<%=iif((site_mode = 1),pageturner_show(pager(1),pager(2),pager(3),c_page,5),pageturner_rshow(pager(1),pager(2),pager(3),c_page,5,c_fname))%>
</div>
<!--#include file="inc_rh_w.asp"-->
<!--#include file="inc_footer.asp"-->
</div>
</body>
</html>