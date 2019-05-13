<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_info"
Call check_admin_purview("cms_info")
If Not inull(rq("del")) Then
	Call non_numeric_back(rq("del"),"error")
	conn.Execute("delete from cms_info where id = "&rq("del")&"")
	Response.Redirect(url_decode(rqs("url")))
End If
If Not inull(rf("execute")) Then
	Call null_back(rf("id"), "请至少选中一项！")
	Select Case rf("method")
		Case ""
			Call alert_back("请选择要执行的操作！")
		Case "del"
			sql = "delete from cms_info where id in ("&rf("id")&")"
		Case "rec"
			sql = "update cms_info set i_ifrec = 1 where id in ("&rf("id")&")"
		Case "crec"
			sql = "update cms_info set i_ifrec = 0 where id in ("&rf("id")&")"
		Case "hot"
			sql = "update cms_info set i_ifhot = 1 where id in ("&rf("id")&")"
		Case "chot"
			sql = "update cms_info set i_ifhot = 0 where id in ("&rf("id")&")"
		Case "cov"
			sql = "update cms_info set i_ifcov = 1 where id in ("&rf("id")&")"
		Case "ccov"
			sql = "update cms_info set i_ifcov = 0 where id in ("&rf("id")&")"
		Case "top"
			sql = "update cms_info set i_iftop = 1 where id in ("&rf("id")&")"
		Case "ctop"
			sql = "update cms_info set i_iftop = 0 where id in ("&rf("id")&")"
		Case "bold"
			sql = "update cms_info set i_bold = 'font-weight: bold;' where id in ("&rf("id")&")"
		Case "cbold"
			sql = "update cms_info set i_bold = '' where id in ("&rf("id")&")"
		Case "ccolor"
			sql = "update cms_info set i_color = '' where id in ("&rf("id")&")"
		Case "italic"
			sql = "update cms_info set i_italic = 'font-style: italic;' where id in ("&rf("id")&")"
		Case "citalic"
			sql = "update cms_info set i_italic = '' where id in ("&rf("id")&")"
		Case "member"
			sql = "update cms_info set i_member = 1 where id in ("&rf("id")&")"
		Case "cmember"
			sql = "update cms_info set i_member = 0 where id in ("&rf("id")&")"
		Case "enable"
			sql = "update cms_info set i_enable = 1 where id in ("&rf("id")&")"
		Case "cenable"
			sql = "update cms_info set i_enable = 0 where id in ("&rf("id")&")"
	End Select
	conn.Execute(sql)
	Call alert_href ("执行成功！", url_decode(rf("url1")))
End If

If Not inull(rf("shift")) Then
	Call null_back(rf("id"), "请至少选中一项！")
	If inull(rf("channelid")) Then
		Call alert_back("请选择要转移到的频道！")
	Else
		sql = "update cms_info set i_parent = "&rf("channelid")&" where id in ("&rf("id")&")"
	End If
	conn.Execute(sql)
	Call alert_href ("转移成功！", url_decode(rf("url2")))
End If

isql = "select * from cms_info order by i_order desc , id desc"
If Not inull(rq("search")) Then
	If inull(rq("key")) And rq("channel") = 0 And inull(rq("type")) Then
		Call alert_back("至少选择一个查询条件")
	End If
	isql = "select * from cms_info where true"
	If Not inull(rq("key")) Then
		isql = isql & " and i_name like '%"&rqs("key")&"%'"
	End If
	If rq("channel") <> 0 Then
		isql = isql & " and i_parent in ("&get_field("cms_channel", Int(rq("channel")), "c_sub")&")"
	End If
	If Not inull(rq("type")) Then
		Select Case rq("type")
			Case "rec"
				isql = isql & " and i_ifrec  = 1"
			Case "hot"
				isql = isql & " and i_ifhot  = 1"
			Case "top"
				isql = isql & " and i_iftop  = 1"
			Case "cov"
				isql = isql & " and i_ifcov  = 1"
			Case "picture"
				isql = isql & " and i_picture <> ''"
			Case "slideshow"
				isql = isql & " and i_slideshow <> ''"
			Case "attach"
				isql = isql & " and i_attach <> ''"
			Case "link"
				isql = isql & " and i_link <> ''"
			Case "enable"
				isql = isql & " and i_enable  = 0"
			Case "bold"
				isql = isql & " and i_bold <> ''"
			Case "italic"
				isql = isql & " and i_italic <> ''"
			Case "color"
				isql = isql & " and i_color <> ''"
			Case "member"
				isql = isql & " and i_member  = 1"
		End Select
	End If
	isql = isql & " order by i_order desc , id desc"
End If
%>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd"> 管理信息 </div>
		<div class="bd">
			<form method="get">
				<div class="l10">
					<div class="x3">
						<div class="form-group">
							<div class="label"><label for="key">关键词</label></div>
							<div class="field">
								<input id="key" class="input" name="key" type="text" size="60" value="<%=rq("key")%>" />
							</div>
						</div>
					</div>
					<div class="x3">
						<div class="form-group">
							<div class="label"><label for="channel">频道</label></div>
							<div class="field">
								<select id="channel" class="input" name="channel">
									<option value="0">不限制</option>
									<%=channel_select_list(0,0,Int(rq("channel")),0)%>
								</select>
							</div>
						</div>
					</div>
					<div class="x3">
						<div class="form-group">
							<div class="label"><label for="type">属性</label></div>
							<div class="field">
								<select id="type" class="input" name="type">
									<option value="">不限制</option>
									<option <%=iif (rq("type") = "rec","selected=""selected""","")%> value="rec" >推荐</option>
									<option <%=iif (rq("type") = "hot","selected=""selected""","")%> value="hot" >热门</option>
									<option <%=iif (rq("type") = "top","selected=""selected""","")%> value="top" >置顶</option>
									<option <%=iif (rq("type") = "cov","selected=""selected""","")%> value="cov" >封面</option>
									<option <%=iif (rq("type") = "picture","selected=""selected""","")%> value="picture" >带缩略图</option>
									<option <%=iif (rq("type") = "slideshow","selected=""selected""","")%> value="slideshow" >带多图</option>
									<option <%=iif (rq("type") = "attach","selected=""selected""","")%> value="attach" >带附件</option>
									<option <%=iif (rq("type") = "link","selected=""selected""","")%> value="link" >外链</option>
									<option <%=iif (rq("type") = "enable","selected=""selected""","")%> value="enable" >禁用</option>
									<option <%=iif (rq("type") = "bold","selected=""selected""","")%> value="bold" >标题粗体</option>
									<option <%=iif (rq("type") = "italic","selected=""selected""","")%> value="italic" >标题斜体</option>
									<option <%=iif (rq("type") = "color","selected=""selected""","")%> value="color" >标题有色</option>
									<option <%=iif (rq("type") = "member","selected=""selected""","")%> value="member" >会员专有</option>
								</select>
							</div>
						</div>
					</div>
					<div class="x3">
						<div class="form-group">
							<div class="label"><label>　</label></div>
							<div class="field">
								<input id="search" class="btn bg-dot btn-block" name="search" type="submit" value="综合查询" />
							</div>
						</div>
					</div>
				</div>
			</form>
			<table class="table table-bordered table-hover table-striped">
				<tr>
					<th>选</th>
					<th>排序</th>
					<th width="460">信息名称</th>
					<th>所属分类</th>
					<th>发布日期</th>
					<th>修改</th>
				</tr>
				<form method="post">
					<%
					page_size = 20
					pager = pageturner_handle(isql, "id", page_size)
					Set rs = pager(0)
					Do While Not rs.EOF
					%>
					<tr class="ac">
						<td><input name="id" type="checkbox" id="id" value="<%=rs("id")%>" /></td>
						<td><%=rs("i_order")%></td>
						<td align="left">
							<%If Not inull(rs("i_picture")) Then%>
								<img class="fl mr4" src="<%=rs("i_picture")%>" height="40" width="40">
							<%End If%>
							<a style="<%=rs("i_bold")%><%=rs("i_italic")%><%=rs("i_color")%>" href="<%=i_url(rs("id"))%>" target="_blank" title="<%=rs("i_name")%>"><%=rs("i_name")%></a><br>
							<%
							echo IIf(rs("i_ifrec") = 1, "<span class=""badge"">荐</span>", "")
							echo IIf(rs("i_ifcov") = 1, "<span class=""badge"">封</span>", "")
							echo IIf(rs("i_ifhot") = 1, "<span class=""badge"">热</span>", "")
							echo IIf(rs("i_iftop") = 1, "<span class=""badge"">顶</span>", "")
							echo IIf(Not inull(rs("i_picture")), "<span class=""badge"">图</span>", "")
							echo IIf(Not inull(rs("i_attach")), "<span class=""badge"">附</span>", "")
							echo IIf(Not inull(rs("i_link")), "<span class=""badge"">外</span>", "")
							echo IIf(rs("i_enable") = 0, "<span class=""badge bg-dot"">暂存</span>", "")
							echo IIf(rs("i_member") = 1, "<span class=""badge bg-green"">会员</span>", "")
							%>
						</td>
						<td><%=get_field("cms_channel", rs("i_parent"), "c_name")%></td>
						<td class="blue"><%=str_time("y-mm-dd",rs("i_date"))%></td>
						<td><a class="btn bg-main" href="cms_info_modify.asp?id=<%=rs("id")%>&url=<%=url_encode()%>"><span class="icon-edit"> 修改</span></a> <a class="btn bg-dot" href="cms_info.asp?del=<%=rs("id")%>&url=<%=url_encode()%>" onclick="return confirm('确定要删除吗？')"><span class="icon-times"> 删除</span></a></td>
					</tr>
					<%
					rs.movenext
					Loop
					rs.Close
					Set rs = Nothing
					%>
					<tr class="form-auto">
						<td><input type="checkbox" onclick="check_all(this,'id')" /></td>
						<td align="left" colspan="5">
							<div class="l10">
								<div class="x6">
								<input type="hidden" name="url1" value="<%=url_encode()%>" />
								<select class="input" name="method">
									<option value="">选择操作</option>
									<option value="del">删除信息</option>
									<option value="rec">设为推荐</option>
									<option value="crec">取消推荐</option>
									<option value="hot">设为热门</option>
									<option value="chot">取消热门</option>
									<option value="cov">设为封面</option>
									<option value="ccov">取消封面</option>
									<option value="top">设为置顶</option>
									<option value="ctop">取消置顶</option>
									<option value="bold">设为加粗</option>
									<option value="cbold">取消加粗</option>
									<option value="italic">设为斜体</option>
									<option value="citalic">取消斜体</option>
									<option value="ccolor">取消颜色</option>
									<option value="member">设为会员专有</option>
									<option value="cmember">取消会员专有</option>
									<option value="enable">设为发布</option>
									<option value="cenable">设为暂存</option>
								</select>
								<input type="submit" class="btn bg-main" name="execute" value="执行操作" />
								</div>
								<div class="x6">
								转移到
								<input type="hidden" name="url2" value="<%=url_encode()%>" />
								<select class="input" name="channelid">
									<option value="">请选择频道</option>
									<%=channel_select_list(0,0,0,0)%>
								</select>
								<input type="submit" class="btn bg-main" name="shift" value="执行转移" />
								</div>
							</div>
						</td>
					</tr>
				</form>
			</table>
			<%=pageturner_show(pager(1),pager(2),pager(3),page_size,5)%> </div>
	</div>

</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
