<%If c_rh = 1 Then%>
<div class="hd1">推荐<%=c_sname%></div>
<div class="bd1">
	<ul class="list-group">
		<%
		Set rs = ado_query("select top 10 * from cms_info where i_enable = 1 and i_ifrec = 1 and i_parent in ("&c_sub&") order by i_order desc , id desc")
		Do While Not rs.EOF
		%>
		<li class="cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></li>
		<%
		rs.MoveNext
		Loop
		rs.Close
		Set rs = Nothing
		%>
	</ul>
</div>
<div class="hd1">热门<%=c_sname%></div>
<div class="bd1">
	<ul class="list-group">
		<%
		Set rs = ado_query("select top 10 * from cms_info where i_enable = 1 and i_ifhot = 1 and i_parent in ("&c_sub&") order by i_order desc , id desc")
		Do While Not rs.EOF
		%>
		<li class="cut"><a style="<%=rs("i_color")&rs("i_bold")&rs("i_italic")%>" href="<%=i_url(rs("id"))%>" target="<%=rs("i_target")%>" title="<%=rs("i_name")%>"><%=rs("i_name")%></a></li>
		<%
		rs.MoveNext
		Loop
		rs.Close
		Set rs = Nothing
		%>
	</ul>
</div>
<%End If%>