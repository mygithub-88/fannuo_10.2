<div id="banner" style="height: <%=site_banner%>px;">
	<div class="bd">
		<%
		Set rs = ado_query("select * from cms_banner where b_enable = 1 and b_parent = 1 order by b_order asc , id asc")
		Do While Not rs.EOF
		%>
		<div style="background: url(<%=rs("b_picture")%>) center no-repeat;">
			<div class="container" style="height: <%=site_banner%>px;">
			<%If Not inull(rs("b_url")) Then%>
				<a style="height: <%=site_banner%>px;" href="<%=rs("b_url")%>" title="<%=rs("b_name")%>"></a>
			<%End If%>
			</div>
		</div>
		<%
		rs.moveNext
		Loop
		rs.Close
		Set rs = Nothing
		%>
	</div>
	<div class="hd">
		<ul></ul>
	</div>
	<div class="next dn" style="height: <%=site_banner%>px; line-height: <%=site_banner%>px;"></div> <div class="prev dn" style="height: <%=site_banner%>px; line-height: <%=site_banner%>px;"></div>
</div>