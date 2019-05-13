<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_channel"
Call check_admin_purview("cms_channel_add")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_channel where id = "&rq("id")&"")
	rs("c_enable") = rf("c_enable")
	rs("c_protected") = rf("c_protected")
	rs("c_member") = rf("c_member")
	rs("c_order") = rf("c_order")
	rs("c_name") = rf("c_name")
	rs("c_fname") = rf("c_fname")
	rs("c_nav") = rf("c_nav")
	rs("c_nname") = rf("c_nname")
	rs("c_aname") = rf("c_aname")
	rs("c_sname") = rf("c_sname")
	rs("c_parent") = rf("c_parent")
	rs("c_type") = rf("c_type")
	rs("c_itype") = rf("c_itype")
	rs("c_mtype") = rf("c_mtype")
	rs("c_mitype") = rf("c_mitype")
	rs("c_icon") = rf("c_icon")
	rs("c_cover") = rf("c_cover")
	rs("c_page") = rf("c_page")
	rs("c_seoname") = rf("c_seoname")
	rs("c_key") = rf("c_key")
	rs("c_des") = rf("c_des")
	rs("c_link") = rf("c_link")
	rs("c_target") = rf("c_target")
	rs("c_scontent") = rf("c_scontent")
	rs("c_content") = rf("c_content")
	rs("c_rh") = rf("c_rh")
	rs("c_mdate") = Now()
	rs.Update
	rs.Close
	Set rs = Nothing
	Call update_channel()
	Call alert_href("频道修改成功","cms_channel.asp")
End If
%>
<script type="text/javascript">
KindEditor.ready(function(K) {
	K.create('#c_scontent');
	K.create('#c_content');
	var editor = K.editor();
	K('#cover').click(function() {
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog({
			imageUrl : K('#c_cover').val(),
			clickFn : function(url, title, width, height, border, align) {
				K('#c_cover').val(url);
				editor.hideDialog();
				}
			});
		});
	});
	K('#icon').click(function() {
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog({
			imageUrl : K('#c_icon').val(),
			clickFn : function(url, title, width, height, border, align) {
				K('#c_icon').val(url);
				editor.hideDialog();
				}
			});
		});
	});
});
</script>
</head>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd">修改频道</div>
		<div class="bd">
			<%Set rs = ado_mquery("select * from cms_channel where id = "&rq("id")&"")%>
			<form method="post">
				<div class="l10">
					<div class="x4">
						<div class="form-group">
							<div class="label"><label for="c_parent">所属频道</label></div>
							<div class="field">
								<select id="c_parent" class="input" name="c_parent">
									<option value="0">作为主频道</option>
									<%=channel_select_list(0,0,rs("c_parent"),rqs("id"))%>
								</select>
								<div class="input-note">请选择上级频道</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_name">频道名称</label></div>
							<div class="field">
								<input id="c_name" class="input" name="c_name" type="text" size="60" data-validate="required:必填" value="<%=rs("c_name")%>" onChange="c_fname.value=($('#c_name').toPinyin());c_nname.value=$('#c_name').val();" onKeydown="c_fname.value=($('#c_name').toPinyin());c_nname.value=$('#c_name').val();" />
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_fname">静态名称</label></div>
							<div class="field">
								<input id="c_fname" class="input" name="c_fname" type="text" size="60" data-validate="required:必填" value="<%=rs("c_fname")%>" />
								<div class="input-note">只能是数字和字母</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_nname">导航名称</label></div>
							<div class="field">
								<input id="c_nname" class="input" name="c_nname" type="text" size="60" data-validate="required:必填" value="<%=rs("c_nname")%>" />
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_nav">导航显示</label></div>
							<div class="field">
								<select id="c_nav" class="input btn" name="c_nav">
									<option value="1" <%=iif((rs("c_nav") = 1),"selected=""selected""","")%>>显示</option>
									<option value="0" <%=iif((rs("c_nav") = 0),"selected=""selected""","")%>>隐藏</option>
								</select>
								<div class="input-note">航显示方式</div>
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x3">
						<div class="form-group">
							<div class="label"><label>电脑频道类型</label></div>
							<div class="field">
								<div class="l4">
									<div class="x6">
										<select class="input" onChange="c_type.value=this.value">
											<%=type_select_list(1,rs("c_type"))%>
										</select>
									</div>
									<div class="x6">
										<input id="c_type" name="c_type" type="text" class="input" data-validate="required:必填" value="<%=rs("c_type")%>" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="x3">
						<div class="form-group">
							<div class="label"><label>电脑信息类型</label></div>
							<div class="field">
								<div class="l4">
									<div class="x6">
										<select class="input" onChange="c_itype.value=this.value">
											<%=type_select_list(2,rs("c_itype"))%>
										</select>
									</div>
									<div class="x6">
										<input id="c_itype" name="c_itype" type="text" class="input" data-validate="required:必填" value="<%=rs("c_itype")%>" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="x3 dn">
						<div class="form-group">
							<div class="label"><label>手机频道类型</label></div>
							<div class="field">
								<div class="l4">
									<div class="x6">
										<select class="input" onChange="c_mtype.value=this.value">
											<%=type_select_list(3,rs("c_mtype"))%>
										</select>
									</div>
									<div class="x6">
										<input id="c_mtype" name="c_mtype" type="text" class="input" data-validate="required:必填" value="<%=rs("c_mtype")%>" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="x3 dn">
						<div class="form-group">
							<div class="label"><label>手机信息类型</label></div>
							<div class="field">
								<div class="l4">
									<div class="x6">
										<select class="input" onChange="c_mitype.value=this.value">
											<%=type_select_list(4,rs("c_mitype"))%>
										</select>
									</div>
									<div class="x6">
										<input id="c_mitype" name="c_mitype" type="text" class="input" data-validate="required:必填" value="<%=rs("c_mitype")%>" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label></label></div>
							<div class="field">
								<input class="btn bg-dot" name="save" type="submit" value="修改频道" />
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x12">
						<div class="quote border-green mb10">以下为选填内容</div>
					</div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="c_content">电脑详细内容</label></div>
							<div class="field">
								<textarea id="c_content" class="input" name="c_content" row="5" /><%=str_editor(rs("c_content"))%></textarea>
								<div class="input-note">多用于单页显示</div>
							</div>
						</div>
					</div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="c_scontent">电脑简短内容</label></div>
							<div class="field">
								<textarea id="c_scontent" class="input" name="c_scontent" row="5" /><%=str_editor(rs("c_scontent"))%></textarea>
								<div class="input-note">多用于首页显示部分内容</div>
							</div>
						</div>
					</div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="c_seoname">优化标题</label></div>
							<div class="field">
								<input id="c_seoname" class="input" name="c_seoname" type="text" size="60" value="<%=rs("c_seoname")%>" />
								<div class="input-note">在标题栏优先显示在频道名称之前</div>
							</div>
						</div>
					</div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="c_key">关键字</label></div>
							<div class="field">
								<input id="c_key" class="input" name="c_key" type="text" size="60" value="<%=rs("c_key")%>" />
							</div>
						</div>
					</div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="c_des">关键描述</label></div>
							<div class="field">
								<textarea id="c_des" class="input" name="c_des" row="5" /><%=rs("c_des")%></textarea>
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_aname">频道别名</label></div>
							<div class="field">
								<input id="c_aname" class="input" name="c_aname" type="text" size="60" value="<%=rs("c_aname")%>" />
								<div class="input-note">多数填写英文</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_sname">简短名称</label></div>
							<div class="field">
								<div class="l4">
									<div class="x6">
										<select class="input" onChange="c_sname.value=this.value">
											<option value="文章">文章</option>
											<option value="信息">信息</option>
											<option value="产品">产品</option>
											<option value="信息">信息</option>
											<option value="下载">下载</option>
											<option value="图片">图片</option>
										</select>
									</div>
									<div class="x6">
										<input id="c_sname" name="c_sname" type="text" class="input" value="<%=rs("c_sname")%>" size="60" />
									</div>
								</div>
								<div class="input-note">推荐XX 下一XX</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_page">分页</label></div>
							<div class="field">
								<input id="c_page" class="input" name="c_page" type="text" size="60" value="<%=rs("c_page")%>" data-validate="required:必填,plusinteger:必须为正整数"/>
								<div class="input-note">每页显示多少条</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_order">排序</label></div>
							<div class="field">
								<input id="c_order" class="input" name="c_order" type="text" size="60" value="<%=rs("c_order")%>" data-validate="required:必填,plusinteger:必须为正整数"/>
								<div class="input-note">填写0自动识别频道ID</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_link">链接地址</label></div>
							<div class="field">
								<input id="c_link" class="input" name="c_link" type="text" size="60" value="<%=rs("c_link")%>" />
								<div class="input-note">外链请用http://开始</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_rh">推荐热门</label></div>
							<div class="field">
								<select id="c_rh" class="input" name="c_rh">
									<option value="1" <%=iif((rs("c_rh") = 1),"selected=""selected""","")%>>显示</option>
									<option value="0" <%=iif((rs("c_rh") = 0),"selected=""selected""","")%>>隐藏</option>
								</select>
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_cover">封面</label> <span class="badge bg-dot cp" id="cover">上传</span></div>
							<div class="field">
								<input id="c_cover" class="input" name="c_cover" type="text" size="60" value="<%=rs("c_cover")%>" />
								<div class="input-note">显示在导航下</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_icon">图标</label> <span class="badge bg-dot cp" id="icon">上传</span></div>
							<div class="field">
								<input id="c_icon" class="input" name="c_icon" type="text" size="60" value="<%=rs("c_icon")%>" />
								<div class="input-note">多用于二次开发</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_member">阅读权限</label></div>
							<div class="field">
								<select id="c_member" class="input" name="c_member">
									<option value="0" <%=iif((rs("c_member") = 0),"selected=""selected""","")%>>不限</option>
									<option value="1" <%=iif((rs("c_member") = 1),"selected=""selected""","")%>>仅会员可见</option>
								</select>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_target">打开方式</label></div>
							<div class="field">
								<select id="c_target" class="input" name="c_target">
									<option value="_self" <%=iif((rs("c_target") = "_self"),"selected=""selected""","")%>>原窗口</option>
									<option value="_blank" <%=iif((rs("c_target") = "_blank"),"selected=""selected""","")%>>新窗口</option>
								</select>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_enable">频道启用</label></div>
							<div class="field">
								<select id="c_enable" class="input" name="c_enable">
									<option value="1" <%=iif((rs("c_enable") = 1),"selected=""selected""","")%>>启用</option>
									<option value="0" <%=iif((rs("c_enable") = 0),"selected=""selected""","")%>>禁用</option>
								</select>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="c_protected">频道保护</label></div>
							<div class="field">
								<select id="c_protected" class="input" name="c_protected">
									<option value="0" <%=iif((rs("c_protected") = 0),"selected=""selected""","")%>>不保护</option>
									<option value="1" <%=iif((rs("c_protected") = 1),"selected=""selected""","")%>>受保护</option>
								</select>
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label></label></div>
							<div class="field">
								<input class="btn bg-dot" name="save" type="submit" value="修改频道" />
							</div>
						</div>
					</div>
				</div>
			</form>
			<%
			rs.Close
			Set rs = Nothing
			%>
		</div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
