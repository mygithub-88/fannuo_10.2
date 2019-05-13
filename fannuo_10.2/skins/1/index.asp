<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title><%=site_title%></title><%If Not inull(site_key) Then%>
<meta name="keywords" content="<%=site_key%>" /><%End If%><%If Not inull(site_des) Then%>
<meta name="description" content="<%=site_des%>" /><%End If%>
<!--#include file="inc_head.asp"-->
<script type="text/javascript">
$(function(){
	$('#navigation .home a').addClass('current');
});
</script>
</head>
<body>
<!--#include file="inc_header.asp"-->
<!--#include file="inc_banner.asp"-->
<div id="search">
	<div class="container">
		<form method="get" action="<%=site_dir%>search.asp">
			<input id="search_key" name="key" type="text" maxlength="255" size="60" value="" />
			<input id="search_btn" type="submit" value="查找" />
		</form>
	</div>
</div>
<div id="index-a">
	<div class="container">
		<%
		Set rss = ado_query("select * from cms_channel where id = 3")
		If rss.EOF Then
			echo "error"
		Else
		%>
		<div class="t1"><span><%=rss("c_name")%></span></div>
		<div class="t2"><%=rss("c_aname")%></div>
		<div class="t3"><%=rss("c_seoname")%></div>
		<div class="l20 plist">
			<%
			Set rs = ado_query("select top 8 * from cms_info where i_enable = 1 and i_parent in ("&rss("c_sub")&") order by i_order desc , id desc")
			Do While Not rs.EOF
			%>
			<div class="x3">
				<div class="wrap">
					<div class="picture square_img"><a href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>"><img src="<%=iif((inull(rs("i_picture"))),nopicture,rs("i_picture"))%>" alt="<%=rs("i_name")%>" title="<%=rs("i_name")%>"/></a></div>
					<div class="title cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></div>
				</div>
			</div>
			<%
			rs.movenext
			Loop
			rs.Close
			Set rs = Nothing
			%>
		</div>
		<%
		End If
		rss.Close
		Set rss = Nothing
		%>
	</div>
</div>
<div id="index-b">
	<div class="container">
	<%
	Set rs = ado_query("select * from cms_channel where id = 1")
	If rs.EOF Then
		echo "error"
	Else
	%>
		<div class="t1"><span><%=rs("c_name")%></span></div>
		<div class="t2"><%=rs("c_aname")%></div>
		<div class="t3"><%=rs("c_seoname")%></div>
		<div class="content"><%=rs("c_scontent")%></div>
		<div class="fc"></div>
		<div class="more">
			<a href="<%=c_url(rs("id"),rs("c_fname"))%>">MORE+</a>
		</div>
	<%
	End If
	rs.Close
	Set rs = Nothing
	%>
	</div>
</div>
<div id="index-c">
	<div class="container">
		<div class="l20">
			<div class="x4">
				<div class="hdi"><span class="fr more"><a href="<%=c_url(6,get_channel(6,"c_fname"))%>">MORE+</a></span><%=get_channel(6,"c_name")%> <%=get_channel(6,"c_aname")%></div>
				<div class="bdi"><%=get_channel(6,"c_scontent")%></div>
			</div>
			<div class="x8 index_news">
				<%
				Set rss = ado_query("select * from cms_channel where id = 2")
				If rss.EOF Then
					echo "error"
				Else
				%>
				<div class="hdi">
					<span class="fr more"><a href="<%=c_url(2,rss("c_fname"))%>">MORE+</a></span>
					<%=rss("c_name")%> <%=rss("c_aname")%>
				</div>
				<div class="bdi">
					<div class="prevnext mb10 ar">
					<span class="prev icon-angle-down btn bg-black"> </span>
					<span class="next icon-angle-up btn bg-black"> </span>
					</div>
					<div class="bd">
					<%
					set rs = ado_query("select top 6 * from cms_info where i_parent in ("&rss("c_sub")&") order by i_order desc , id desc")
					Do While Not rs.EOF
					%>
					<div class="wrap">
						<a href="<%=i_url(rs("id"))%>" title="<%=rs("i_name")%>">
						<div class="left">
							<div class="day"><%=str_time("dd",rs("i_date"))%></div>
							<div class="ym"><%=str_time("y/mm",rs("i_date"))%></div>
						</div>
						<div class="right">
							<div class="title cut" style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" ><%=rs("i_name")%></div>
							<div class="content"><%=rs("i_scontent")%></div>
						</div>
						<div class="fc"></div>
						</a>
					</div>
					<%
					rs.MoveNext
					Loop
					rs.Close
					Set rs = Nothing
					%>
					</div>
				</div>
				<%
				End If
				rss.Close
				Set rss = Nothing
				%>
			</div>
		</div>
	</div>
</div>
<div id="index-d">
	<div class="container">
		<div class="l20">
			<div class="x7">
				<div class="hdi"><span class="fr more"><a href="<%=c_url(4,get_channel(4,"c_fname"))%>">MORE+</a></span><%=get_channel(4,"c_name")%> <%=get_channel(4,"c_aname")%></div>
				<div class="bdi">
					<div class="l20 picture_slist">
						<%
						Set rs = ado_query("select top 8 * from cms_info where i_enable = 1 and i_parent in ("&get_channel(4,"c_sub")&") order by i_order desc , id desc")
						Do While Not rs.EOF
						%>
						<div class="x3">
							<div class="wrap">
								<div class="picture square_img2"><a href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>"><img src="<%=iif((inull(rs("i_picture"))),nopicture,rs("i_picture"))%>" alt="<%=rs("i_name")%>" title="<%=rs("i_name")%>"/></a></div>
								<div class="title cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></div>
							</div>
						</div>
						<%
						rs.movenext
						Loop
						rs.Close
						Set rs = Nothing
						%>
					</div>
				</div>
			</div>
			<div class="x5">
				<div class="hdi"><span class="fr more"><a href="<%=c_url(5,get_channel(5,"c_fname"))%>">MORE+</a></span><%=get_channel(5,"c_name")%> <%=get_channel(5,"c_aname")%></div>
				<div class="bdi">
					<div class="index_case">
						<%
						Set rs = ado_query("select top 6 * from cms_info where i_enable = 1 and i_parent in ("&get_channel(5,"c_sub")&") order by i_order desc , id desc")
						Do While Not rs.EOF
						%>
						<div class="wrap">
							<div class="hd cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></div>
							<div class="bd">
								<div class="l10">
									<div class="x3 img">
										<div class="square_img3"><a href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>"><img src="<%=iif((inull(rs("i_picture"))),nopicture,rs("i_picture"))%>" alt="<%=rs("i_name")%>" title="<%=rs("i_name")%>"/></a></div>
									</div>
									<div class="x9 content"><%=rs("i_scontent")%></div>
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
				</div>
			</div>
		</div>
	</div>
</div>
<div id="index-e">
	<div class="container">
		<div class="hdi"><span class="fr more"><a href="<%=s_path%>link.asp">JOIN+</a></span>友情链接</div>
		<div class="l10 mtb20">
			<%
			Set rs = ado_query("select * from cms_link where l_picture = '' and l_enable = 1 order by l_order asc , id asc")
			Do While Not rs.EOF
			%>
			<div class="x"><a href="<%=rs("l_url")%>" target="_blank"><%=rs("l_name")%></a></div>
			<%
			rs.movenext
			Loop
			rs.Close
			Set rs = Nothing
			%>
		</div>
		<div class="l8">
			<%
			Set rs = ado_query("select * from cms_link where l_picture <> '' and l_enable = 1 order by l_order asc , id asc")
			Do While Not rs.EOF
			%>
			<div class="xx12 mb8"><a href="<%=rs("l_url")%>" target="_blank"><img src="<%=rs("l_picture")%>" title="<%=rs("l_name")%>" alt="<%=rs("l_name")%>" /></a></div>
			<%
			rs.movenext
			Loop
			rs.Close
			Set rs = Nothing
			%>
		</div>
	</div>
</div>
<!--#include file="inc_footer.asp"-->
</body>
</html>
