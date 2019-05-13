<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc.asp"-->
<%
Set rs = ado_query("select * from cms_info where id = "&rqs("id")&"")
i_id = rs("id")
i_enable = rs("i_enable")
i_member = rs("i_member")
i_order = rs("i_order")
i_name = rs("i_name")
i_parent = rs("i_parent")
i_ifrec = rs("i_ifrec")
i_ifhot = rs("i_ifhot")
i_iftop = rs("i_iftop")
i_ifcov = rs("i_ifcov")
i_bold = rs("i_bold")
i_italic = rs("i_italic")
i_color = rs("i_color")
i_picture = rs("i_picture")
i_attach = rs("i_attach")
i_link = rs("i_link")
i_slideshow = rs("i_slideshow")
i_video = rs("i_video")
i_target = rs("i_target")
i_seoname = rs("i_seoname")
i_key = rs("i_key")
i_des = rs("i_des")
i_a = rs("i_a")
i_b = rs("i_b")
i_c = rs("i_c")
i_d = rs("i_d")
i_e = rs("i_e")
i_scontent = rs("i_scontent")
i_content = site_link(rs("i_content"))
i_mcontent = iif((inull(rs("i_mcontent"))),i_content,rs("i_mcontent"))
i_author = rs("i_author")
i_sources = rs("i_sources")
i_hits = rs("i_hits")
i_date = rs("i_date")
i_mdate = rs("i_mdate")
rs.Close
Set rs = Nothing
If i_member = 1 Then
	If Not member_login Then
		Call alert_href("此内容需要您登录后才能访问",site_dir&"login.asp")
	End If
End If
conn.Execute("update cms_info set i_hits = i_hits + 1 where id = "&i_id&"")

If Not inull(i_link) Then
	Response.Redirect(i_link)
End If
i_title = iif((inull(i_seoname)),i_name,i_seoname&" - "&i_name)
Set rs = ado_query("select * from cms_channel where id = "&i_parent&"")
c_id = rs("id")
c_enable = rs("c_enable")
c_protected = rs("c_protected")
c_member = rs("c_member")
c_order = rs("c_order")
c_name = rs("c_name")
c_fname = rs("c_fname")
c_nav = rs("c_nav")
c_nname = rs("c_nname")
c_aname = rs("c_aname")
c_sname = rs("c_sname")
c_parent = rs("c_parent")
c_ifsub = rs("c_ifsub")
c_sub = rs("c_sub")
c_main = rs("c_main")
c_type = rs("c_type")
c_itype = rs("c_itype")
c_mtype = rs("c_mtype")
c_mitype = rs("c_mitype")
c_icon = rs("c_icon")
c_cover = rs("c_cover")
c_page = rs("c_page")
c_seoname = rs("c_seoname")
c_key = rs("c_key")
c_des = rs("c_des")
c_link = rs("c_link")
c_target = rs("c_target")
c_scontent = rs("c_scontent")
c_content = rs("c_content")
c_mscontent = rs("c_mscontent")
c_mcontent = rs("c_mcontent")
c_rh = rs("c_rh")
c_date = rs("c_date")
c_mdate = rs("c_mdate")
rs.Close
Set rs = Nothing
Function i_prev()
	Set rs = ado_query("select * from cms_info where i_parent in ("&c_sub&") and i_order > "&i_order&" order by i_order asc")
	If rs.EOF Then
		i_prev = "暂无"
	Else
		i_prev = "<a style="""&rs("i_color")&rs("i_bold")&rs("i_italic")&""" href="""&i_url(rs("id"))&""" title="""&rs("i_name")&""">"&rs("i_name")&"</a>"
	End If
	rs.Close
	Set rs = Nothing
End Function

'==========下一信息==========

Function i_next()
	Set rs = ado_query("select * from cms_info where i_parent in ("&c_sub&") and i_order < "&i_order&" order by i_order desc")
	If rs.EOF Then
		i_next = "暂无"
	Else
		i_next = "<a style="""&rs("i_color")&rs("i_bold")&rs("i_italic")&""" href="""&i_url(rs("id"))&""" title="""&rs("i_name")&""">"&rs("i_name")&"</a>"
	End If
	rs.Close
	Set rs = Nothing
End Function
current_nav = c_main
include(iif(ism(),mskin&c_mitype,skin&c_itype))
%>
