<%If Not inull(c_cover) Then%><div id="channel_cover"><img src="<%=c_cover%>" alt="<%=c_title%>" title="<%=c_title%>" /></div><%End If%>
<div class="current_location">当前位置：<a href="<%=site_dir%>">首页</a> > <%=channel_location(c_id)%></div>