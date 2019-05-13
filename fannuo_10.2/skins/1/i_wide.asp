<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title><%=i_title%></title><%If Not inull(i_key) Then%>
<meta name="keywords" content="<%=i_key%>" /><%End If%><%If Not inull(i_des) Then%>
<meta name="description" content="<%=i_des%>" /><%End If%>
<!--#include file="inc_head.asp"-->
</head>
<body>
<!--#include file="inc_header.asp"-->
<div class="container">
	<div class="current_location">当前位置：<%=channel_location(c_id)%></div>
	<h1 id="info_title"><%=i_name%></h1>
	<p id="info_intro">发布日期：<%=i_date%> 访问次数：<%=i_hits%></p>
	<div class="l20">
		<div class="x3"></div>
		<div class="x6">
			<%if i_picture <> "" and inull(i_slideshow) then%>
			<div id="info_picture"><a href="<%=i_picture%>" target="_blank"><img src="<%=i_picture%>" title="<%=i_name%>" alt="<%=i_name%>" /></a></div>
			<%end if%>
			<%If i_slideshow <> "" then%>
			<div id="info_slideshow">
				<div class="bd">
					<%
					arr_slideshow = Split(i_slideshow, "|")
					For i = 0 To UBound(arr_slideshow)
						echo "<a href="""&arr_slideshow(i)&""" data-lightbox=""group"" data-title="""&i_name&"""><img src="""&arr_slideshow(i)&""" alt="""&i_name&""" title="""&i_name&"""></a>"
					Next
					%>
				</div>
				<div class="hd">
					<ul class="l4">
						<%
						arr_slideshow = Split(i_slideshow, "|")
						For i = 0 To UBound(arr_slideshow)
							echo "<li class=""xx15 mb4""><div class=""img_w""><img src="""&arr_slideshow(i)&"""/></div></li>"
						Next
						%>
					</ul>
				</div>
			</div>
			<%End If%>
		</div>
	</div>
	<%If i_attach <> "" then%>
	<div class="quote" >
		<%
		arr_attach = Split(i_attach, "|")
		For i = 0 To UBound(arr_attach)
			echo "<a class=""btn bg-green mb4"" href="""&arr_attach(i)&""" target=""_blank"">点击下载"&i+1&"</a> "
		Next
		%>
	</div>
	<%End If%>
	<%If i_video <> "" then%>
	<div id="info_video">
		<%=i_video%>
	</div>

	<%End If%>
	<div id="info_content"> <%=i_content%> </div>
	<div class="ar mtb20"><a class="btn bg-red" href="<%=site_dir%>comment.asp?id=<%=i_id%>"><span class="icon-comments"> 我要评论</span></a></div>

	<div id="info_around">
		<p>上一<%=c_sname%>：<%=i_prev()%></p>
		<p>下一<%=c_sname%>：<%=i_next()%></p>
	</div>
</div>
<!--#include file="inc_rh_w.asp"-->
<!--#include file="inc_footer.asp"-->
</body>
</html>
