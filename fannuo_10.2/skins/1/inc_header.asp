<div id="header_menu">
	<div class="container">
		<div class="line">
			<div class="x9">
				<%If site_s2 = 1 Then%><a href="<%=site_dir%>sitemap.asp" ><span class="icon-sitemap">网站地图</span></a><%End If%>
				<%If site_s3 = 1 Then%><a href="<%=site_dir%>guestbook.asp" ><span class="icon-question-circle">客户留言</span></a><%End If%>
				<%If site_s4 = 1 Then%><a href="<%=site_dir%>order.asp" ><span class="icon-shopping-cart">在线订购</span></a><%End If%>
				<%If site_s5 = 1 Then%><a href="<%=site_dir%>recruitment.asp" ><span class="icon-graduation-cap">人才招聘</span></a><%End If%>
				<%If site_s6 = 1 Then%><a href="<%=site_dir%>requisition.asp" ><span class="icon-file-text-o">在线申请</span></a><%End If%>
				<%If site_s7 = 1 Then%><a href="<%=site_dir%>link.asp" ><span class="icon-link">链接申请</span></a><%End If%>
				<%If site_s8 = 1 Then%><a class="win-homepage" href="javascript:void(0);" hideFocus="true"><span class="icon-home">设为首页</span></a><%End If%>
				<%If site_s9 = 1 Then%><a class="win-favorite" href="javascript:void(0);" hideFocus="true"><span class="icon-star">加入收藏</span></a><%End If%>
				<%If site_s10 = 1 Then%><a id="StranLink"><span class="icon-globe">繁體中文</span><script language="JavaScript" src="<%=site_dir%>js/language.js"></script></a><%End If%>
			</div>
			<div class="x3 ar">
				<%If member_login Then%>
				<a href="<%=site_dir%>member.asp"><span class="icon-user"> 会员中心</span></a>
				<a href="<%=site_dir%>logout.asp"><span class="icon-sign-out"> 退出</span></a>
				<%Else%>
				<%If site_s11 = 1 Then%> <a href="<%=site_dir%>login.asp"><span class="icon-sign-in cp member_login"> 登录</span></a><%End If%>
				<%If site_s12 = 1 Then%> <a href="<%=site_dir%>register.asp"><span class="icon-user cp member_register"> 注册</span></a><%End If%>
				<%End If%>
			</div>
		</div>
	</div>
</div>
<div id="header">
	<div class="container">
		<div id="logo"><a href="<%=site_url%>"><img src="<%=site_logo%>" title="<%=site_name%>" alt="<%=site_name%>" /></a></div>
	</div>
</div>
<div id="navigation_wrap">
	<div class="container">
		<ul id="navigation">
			<li class="main home"><a href="<%=site_dir%>">首页</a></li>
			<%
			Set rs = ado_query("select * from cms_channel where c_nav = 1 and c_parent = 0 order by c_order asc , id asc")
			Do While Not rs.EOF
			%>
			<li class="main"><a<%=iif(current_nav = rs("id")," class=""current""","")%> href="<%=c_url(rs("id"),rs("c_fname"))%>" target="<%=rs("c_target")%>"><%=rs("c_nname")%></a>
			<%If rs("c_ifsub") = 1 Then%>
				<ul class="sub">
					<%
					Set rss = ado_query("select * from cms_channel where c_nav = 1 and c_parent = "&rs("id")&" order by c_order asc , id asc")
					Do While Not rss.EOF
					%>
					<li><a href="<%=c_url(rss("id"),rss("c_fname"))%>" target="<%=rss("c_target")%>"><%=rss("c_nname")%></a></li>
					<%
					rss.MoveNext
					Loop
					rss.Close
					Set rss = Nothing
					%>
				</ul>
			<%End If%>
			</li>
			<%
			rs.MoveNext
			Loop
			rs.Close
			Set rs = Nothing
			%>
		</ul>
	</div>
</div>