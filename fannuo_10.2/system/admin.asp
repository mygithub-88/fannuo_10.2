<%
If inull(Request.Cookies("adminname")) Or inull(Request.Cookies("adminpassword")) Then
	Response.Redirect("index.asp")
Else
	Set rs_gap = ado_query("select * from cms_admin where a_name = '"&Request.Cookies("adminname")&"' and a_password = '"&md5(Request.Cookies("adminpassword"))&"'")
	If rs_gap.EOF Then
		Response.Redirect("cms_logout.asp")
	End If
	admin_name = rs_gap("a_name")
	admin_truename = rs_gap("a_truename")
	admin_penname = rs_gap("a_penname")
	admin_purview = rs_gap("a_purview")
	arr_admin_purview = Split(admin_purview, ",")
	rs_gap.Close
	Set rs_gap = Nothing
End If

Sub check_admin_purview(t0)
	If Not arr_in(arr_admin_purview,t0) Then
		Call alert_back("您无权操作此页面！")
	End If
End Sub

Function channel_select_list(t0, t1, t2, t3)
	Set rs_csl = ado_query("select * from cms_channel where c_parent = "&t0&" and id <> "&t3&" order by c_order asc , id asc")
	For i = 1 To t1
		separator = separator&"　"
	Next
	if_main = IIf(t0 = 0, "[主]", "└")
	Do While Not rs_csl.EOF
		if_selected = IIf(rs_csl("id") = t2, " selected=""selected""", "")
		channel_select_list = channel_select_list&"<option"&if_selected&" value="""&rs_csl("id")&""">"&separator&if_main&rs_csl("c_name")&"</option>"&vbCrLf&channel_select_list(rs_csl("id"), i, t2, t3)
		rs_csl.movenext
	Loop
	rs_csl.Close
	Set rs_csl = Nothing
End Function

Function type_name(t0)
	Set rs_tn = ado_query("select * from cms_type where t_value = '"&t0&"'")
	If rs_tn.EOF Then
		type_name = "自定义"
	Else
		type_name = rs_tn("t_name")
	End If
	rs_tn.Close
	Set rs_tn = Nothing
End Function

Function channel_view_list(t0, t1)
	m = t1
	Set rs_cvl = ado_query("select * from cms_channel where c_parent = "&t0&" order by c_order asc  , id asc")
	For i = 1 To m
		separator = separator&"　"
	Next
	if_main = IIf(t0 = 0, "<span class=""badge bg-green"">主</span>", "└")
	Do While Not rs_cvl.EOF
		channel_view_list = channel_view_list&"<tr class=""ac""><td>"&rs_cvl("id")&"</td><td>"&rs_cvl("c_order")&"</td><td class=""al"">"&separator&if_main&"<a href="""&c_url(rs_cvl("id"),rs_cvl("c_fname"))&""" target=""_blank"">"&rs_cvl("c_name")&"</a>"&IIf(rs_cvl("c_enable") = 1, "", "<span class=""badge bg-dot"">禁</span>")&IIf(rs_cvl("c_protected") = 0, "", "<span class=""badge bg-main"">保</span>")&"</td><td><span class=""badge"">"&type_name(rs_cvl("c_type"))&"</span></td><td><span class=""badge"">"&type_name(rs_cvl("c_mitype"))&"</span></td><td><a class=""btn bg-main"" href=""cms_channel_modify.asp?id="&rs_cvl("id")&"""><span class=""icon-edit""> 修改</span>"&iif((rs_cvl("c_protected") = 0),"</a> <a class=""btn bg-dot"" href=""cms_channel.asp?act=del&id="&rs_cvl("id")&""" onclick=""return confirm('重要提示：删除频道将会把属于该频道信息一并删除，并且不可恢复！请仔细斟酌后谨慎操作！')""><span class=""icon-times""> 删除</span></a>","")&"</td></tr>"&vbCrLf&channel_view_list(rs_cvl("id"), i)
		rs_cvl.movenext
	Loop
	rs_cvl.Close
	Set rs_cvl = Nothing
End Function

Function channel_sub(t0, t1)
	Set rs_cs = ado_query("select * from cms_channel where c_parent = "&t0&" order by c_order asc  , id asc")
	Do While Not rs_cs.EOF
		channel_sub = channel_sub&","&rs_cs("id")&channel_sub(rs_cs("id"), null)
		rs_cs.MoveNext
	Loop
	rs_cs.Close
	Set rs_cs = Nothing
	channel_sub = t1&channel_sub
End Function

Function channel_main(t0)
	Set rs_cm = ado_query("select * from cms_channel where id = "&t0&"")
	If rs_cm("c_parent") <> 0 Then
		channel_main = channel_main(rs_cm("c_parent"))
	Else
		channel_main = rs_cm("id")
	End If
	rs_cm.Close
	Set rs_cm = Nothing
End Function

Function if_sub(t0)
	Set rs_is = ado_query("select * from cms_channel where c_parent = "&t0&"")
	if_sub = IIf(rs_is.EOF, 0, 1)
	rs_is.Close
	Set rs_is = Nothing
End Function

Sub update_channel()
	Set rs_uc = ado_mquery("select * from cms_channel")
	Do While Not rs_uc.EOF
		rs_uc("c_ifsub") = if_sub(rs_uc("id"))
		rs_uc("c_sub") = channel_sub(rs_uc("id"), rs_uc("id"))
		rs_uc("c_main") = channel_main(rs_uc("id"))
		rs_uc.update
		rs_uc.movenext
	Loop
	rs_uc.Close
	Set rs_uc = Nothing
End Sub

Function get_member_id(t0)
	Set rs_gmi = ado_query("select * from cms_member where m_name = '"&t0&"'")
	If rs_gmi.EOF Then
		get_member_id = ""
	Else
		get_member_id = rs_gmi("id")
	End If
	rs_gmi.Close
	Set rs_gmi = Nothing
End Function

Function ifmember(t0)
	If t0 <> 0 Then
		ifmember = " <a href=""cms_member_modify.asp?id="&t0&"""><span class=""badge bg-red color-white"">会员</span></a>"
	End If
End Function

Function type_select_list(t0,t1)
	Set rs_tsl = ado_query("select * from cms_type where t_type = "&t0&" order by id asc")
	Do While Not rs_tsl.EOF
		if_selected = IIf(rs_tsl("t_value") = t1, " selected=""selected""", "")
		type_select_list = type_select_list&"<option"&if_selected&" value="""&rs_tsl("t_value")&""" >"&rs_tsl("t_name")&"</option>"&vbCrLf
		rs_tsl.movenext
	Loop
	rs_tsl.Close
	Set rs_tsl = Nothing
End Function

%>
