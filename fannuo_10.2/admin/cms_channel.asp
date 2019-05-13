<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_channel"
Call check_admin_purview("cms_channel")
If rq("act") = "del" Then
	Set rs = ado_mquery("select * from cms_channel where id = "&rq("id")&" ")
	If rs("c_protected") = 1 Then
		Call alert_back("此频道已经设置成受保护，不能直接删除！一般情况是首页或者关键位置调用了相关数据，删除会造成报错，对此频道进行修改是完全可以的。如果您确定此数据已经无用，可以先修改此频道，去除受保护属性（修改页面的最下端），然后在进行删除，删除后将无法恢复，请谨慎操作。")
	elseif rs("c_ifsub") = 1 Then
		Call alert_back("此频道包含子频道！不能直接删除，请先删除此频道的子频道！")
	Else
		rs.Delete
		rs.Update
		rs.Close
		Set rs = Nothing
		sql = "delete from cms_info where i_parent = "&rq("id")&""
		conn.Execute ( sql )
		Call update_channel()
		Call alert_href("频道删除成功！该频道下的信息也已经被删除！", "cms_channel.asp")
	End If
End If
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd">管理频道</div>
		<div class="bd">
			<form method="post" class="form-auto">
				<table class="table table-bordered">
					<tr>
						<th>id</th>
						<th>排序</th>
						<th>频道名称</th>
						<th>电脑频道类型</th>
						<th>电脑信息类型</th>
						<th>操作</th>
					</tr>
					<%=channel_view_list(0, 0)%>
				</table>
			</form>
			<div class="quote border-red mt10">注：排序数字越小越靠前<br>受保护的频道一般都是首页调用了数据，不能直接删除，如果确定要删除，请先修改去掉保护和首页调用的数据。否则有可能造成网站报错！</div>
		</div>
	</div>

</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
