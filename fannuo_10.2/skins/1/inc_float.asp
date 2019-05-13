<div id="float">
	<div<%=iif((site_float = 0)," class=""dn""","")%>>
	<%If Not inull(site_fcontent) Then%>
	<div class="wrap custom">
		<span class="icon icon-user"></span>
		<div class="content"><%=site_fcontent%></div>
	</div>
	<%End If%>
	<%If Not inull(site_qrcode) Then%>
	<div class="wrap qrcode">
		<span class="icon icon-qrcode"></span>
		<div class="content">
			<img src="<%=site_qrcode%>" />
		</div>
	</div>
	<%End If%>
	<%If Not inull(site_phone) Then%>
	<div class="wrap phone">
		<span class="icon icon-phone"></span>
		<div class="content"><%=site_phone%></div>
	</div>
	<%End If%>
	<%If Not inull(site_qq) Then%>
	<div class="wrap qq">
		<a href="http://wpa.qq.com/msgrd?v=3&uin=<%=site_qq%>&site=qq&menu=yes"><span class="icon icon-qq"></span></a>
		<div class="content"><a href="http://wpa.qq.com/msgrd?v=3&uin=<%=site_qq%>&site=qq&menu=yes"><%=site_qq%></a></div>
	</div>
	<%End If%>
	<div class="wrap gotop">
		<span class="icon icon-chevron-up "></span>
	</div>
	</div>
</div>