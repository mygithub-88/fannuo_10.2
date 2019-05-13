<div id="left">
	<dl class="l4">
		<dt class="x12"><span class="icon-bars"> 内容管理</span></dt>
		<dd class="x6"><a<%=iif(current_nav = "cms_info_add"," class=""current""","")%> href="cms_info_add.asp?cid=0">添加信息</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_info"," class=""current""","")%> href="cms_info.asp">管理信息</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_channel_add"," class=""current""","")%> href="cms_channel_add.asp?cid=0">添加频道</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_channel"," class=""current""","")%> href="cms_channel.asp">管理频道</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_banner"," class=""current""","")%> href="cms_banner.asp">管理幻灯</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_chip"," class=""current""","")%> href="cms_chip.asp">碎片内容</a></dd>
		<dt class="x12"><span class="icon-users"> 交互管理</span></dt>
		<dd class="x6"><a<%=iif(current_nav = "cms_member"," class=""current""","")%> href="cms_member.asp">管理会员</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_guestbook"," class=""current""","")%> href="cms_guestbook.asp">管理留言</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_comment"," class=""current""","")%> href="cms_comment.asp">管理评论</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_order"," class=""current""","")%> href="cms_order.asp">管理订单</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_requisition"," class=""current""","")%> href="cms_requisition.asp">管理申请</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_recruitment"," class=""current""","")%> href="cms_recruitment.asp">管理招聘</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_resume"," class=""current""","")%> href="cms_resume.asp">管理应聘</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_link"," class=""current""","")%> href="cms_link.asp">友情链接</a></dd>
		<dt class="x12"><span class="icon-cog"> 基本设置</span></dt>
		<dd class="x6"><a<%=iif(current_nav = "cms_system"," class=""current""","")%> href="cms_system.asp">系统设置</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_admin"," class=""current""","")%> href="cms_admin.asp">管理用户</a></dd>
		<dd class="x6"><a<%=iif(current_nav = "cms_sitelink"," class=""current""","")%> href="cms_sitelink.asp">站内链接</a></dd>
		<dd class="x6"><a href="cms_logout.asp" onClick="return confirm('确定要退出吗？')">安全退出</a></dd>
	</dl>
</div>
