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
			<!--#include file="inc_rh.asp"-->
		</div>
		<div class="x9">
			<div id="channel_content"> <%=c_content%> </div>
			<div class="picture_dlist">
				<%
				sql = "select * from cms_info where i_enable = 1 and i_parent in ("&c_sub&") order by i_order desc , id desc"
				pager = pageturner_handle(sql, "id", c_page)
				Set rs = pager(0)
				Do While Not rs.EOF
				%>
				<div class="wrap">
					<div class="l20">
					<div class="xx22">
						<div class="picture square_img"><a href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>"><img src="<%=iif((inull(rs("i_picture"))),nopicture,rs("i_picture"))%>" alt="<%=rs("i_name")%>" title="<%=rs("i_name")%>"/></a></div>
					</div>
						<div class="xx98">
							<div class="title cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></div>
							<div class="content"><%=rs("i_scontent")%></div>
							<div class="intro">发布日期：<%=str_time("y-mm-dd",rs("i_date"))%>　访问次数：<%=rs("i_hits")%></div>
						</div>
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
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</div>
</body>
</html>