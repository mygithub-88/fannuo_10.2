<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_system"
Call check_admin_purview("cms_system")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_system where id = 1")
	rs("site_mode") = rf("site_mode")
	rs("site_member") = rf("site_member")
	rs("site_guestbook") = rf("site_guestbook")
	rs("site_order") = rf("site_order")
	rs("site_comment") = rf("site_comment")
	rs("site_name") = rf("site_name")
	rs("site_sname") = rf("site_sname")
	rs("site_url") = rf("site_url")
	rs("site_murl") = rf("site_murl")
	rs("site_float") = rf("site_float")
	rs("site_fcontent") = rf("site_fcontent")
	rs("site_key") = rf("site_key")
	rs("site_des") = rf("site_des")
	rs("site_copyright") = rf("site_copyright")
	rs("site_guestbook_notice") = rf("site_guestbook_notice")
	rs("site_comment_notice") = rf("site_comment_notice")
	rs("site_order_notice") = rf("site_order_notice")
	rs("site_member_notice") = rf("site_member_notice")
	rs("site_phone") = rf("site_phone")
	rs("site_qq") = rf("site_qq")
	rs("site_mcopyright") = rf("site_copyright")
	rs("site_qrcode") = rf("site_qrcode")
	rs("site_s1") = 1
	rs("site_s2") = rf("site_s2")
	rs("site_s3") = rf("site_s3")
	rs("site_s4") = rf("site_s4")
	rs("site_s5") = rf("site_s5")
	rs("site_s6") = rf("site_s6")
	rs("site_s7") = rf("site_s7")
	rs("site_s8") = rf("site_s8")
	rs("site_s9") = rf("site_s9")
	rs("site_s10") = rf("site_s10")
	rs("site_s11") = rf("site_s11")
	rs("site_s12") = rf("site_s12")
	rs("site_p1") = rf("site_p1")
	rs("site_p2") = rf("site_p2")
	rs("site_p3") = rf("site_p3")
	rs("site_p4") = rf("site_p4")
	rs("site_p5") = rf("site_p5")
	rs("site_banner") = rf("site_banner")
	rs("site_square") = rf("site_square")
	rs.Update
	rs.Close
	Set rs = Nothing
	conn.Execute("update cms_skin set s_logo = '"&rf("site_logo")&"' where s_path = '"&site_skin&"'")
	Call alert_href("系统设置修改成功", "cms_system.asp")
End If
%>
</head>
<script type="text/javascript">
KindEditor.ready(function(K) {
	K.create('#site_fcontent');
	K.create('#site_copyright');
	K.create('#site_guestbook_notice');
	K.create('#site_comment_notice');
	K.create('#site_order_notice');
	K.create('#site_member_notice');
	var editor = K.editor();
	K('#logo').click(function() {
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog({
			imageUrl : K('#site_logo').val(),
			clickFn : function(url, title, width, height, border, align) {
				K('#site_logo').val(url);
				editor.hideDialog();
				}
			});
		});
	});
	K('#mlogo').click(function() {
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog({
			imageUrl : K('#site_mlogo').val(),
			clickFn : function(url, title, width, height, border, align) {
				K('#site_mlogo').val(url);
				editor.hideDialog();
				}
			});
		});
	});
	K('#qrcode').click(function() {
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog({
			imageUrl : K('#site_qrcode').val(),
			clickFn : function(url, title, width, height, border, align) {
				K('#site_qrcode').val(url);
				editor.hideDialog();
				}
			});
		});
	});
});
</script>
<body>
<!--#include file="inc_top.asp"-->
<div id="content">
	<!--#include file="inc_left.asp"-->
	<div id="right">
		<div class="hd">系统设置</div>
		<div class="bd">
			<%Set rs = ado_query("select * from cms_system where id = 1 ")%>
			<form method="post" class="l10">
				<div class="form-group x3">
					<div class="label"><label for="site_mode">运行模式</label></div>
					<div class="field">
						<label class="btn"><input id="site_mode" name="site_mode" type="radio" value="1" <%=iif(rs("site_mode") = 1," checked=""checked""","")%>/>动态</label>
					</div>
				</div>
				<div class="form-group x3">
					<div class="label"><label for="site_name">网站名称</label></div>
					<div class="field">
						<input id="site_name" class="input" name="site_name" type="text" size="60" value="<%=rs("site_name")%>" data-validate="required:必须填写" />
					</div>
				</div>
				<div class="form-group x6">
					<div class="label"><label for="site_url">网址</label></div>
					<div class="field">
						<input id="site_url" class="input" name="site_url" type="text" size="60" value="<%=rs("site_url")%>" data-validate="required:必须填写,url:请填写合法的URL地址"/>
						<div class="input-note">示例：http://www.xxxx.com</div>
					</div>
				</div>
				<div class="fc"></div>
				<div class="form-group x5">
					<div class="label"><label for="site_sname">优化标题</label></div>
					<div class="field">
						<input id="site_sname" class="input" name="site_sname" type="text" size="60" value="<%=rs("site_sname")%>" />
						<div class="input-note">优先显示在网站名称前面</div>
					</div>
				</div>
				<div class="form-group x7">
					<div class="label"><label for="site_key">关键字</label></div>
					<div class="field">
						<input id="site_key" class="input" name="site_key" type="text" size="60" value="<%=rs("site_key")%>" />
						<div class="input-note">为了让搜索引擎更好的收录您的网站，请仔细填写关键词，关键词可以用英文的逗号和空格间隔开</div>
					</div>
				</div>
				<div class="fc"></div>
				<div class="form-group x12">
					<div class="label"><label for="site_des">关键描述</label></div>
					<div class="field">
						<textarea id="site_des" class="input" name="site_des" row="5" /><%=rs("site_des")%></textarea>
					</div>
				</div>
				<div class="form-group x6">
					<div class="label"><label for="site_logo">电脑端Logo</label> <span class="badge bg-dot cp" id="logo">上传</span></div>
					<div class="field">
						<input id="site_logo" class="input" name="site_logo" type="text" size="60" value="<%=site_logo%>" />
					</div>
				</div>
				<div class="form-group x6">
					<div class="label"><label for="site_qrcode">二维码</label> <span class="badge bg-dot cp" id="qrcode">上传二维码</span></div>
					<div class="field">
						<input id="site_qrcode" class="input" name="site_qrcode" type="text" size="60" value="<%=rs("site_qrcode")%>" />
					</div>
				</div>
				<div class="fc"></div>
				<div class="form-group xx16">
					<div class="label"><label for="site_phone">电话</label></div>
					<div class="field">
						<input id="site_phone" class="input" name="site_phone" type="text" size="60" value="<%=rs("site_phone")%>" />
					</div>
				</div>
				<div class="form-group xx12">
					<div class="label"><label for="site_qq">QQ</label></div>
					<div class="field">
						<input id="site_qq" class="input" name="site_qq" type="text" size="60" value="<%=rs("site_qq")%>" />
					</div>
				</div>
				<div class="form-group xx14">
					<div class="label"><label for="site_banner">首页幻灯高度</label></div>
					<div class="field">
						<input id="site_banner" class="input" name="site_banner" type="text" size="60" value="<%=rs("site_banner")%>" data-validate="required:必须填写, znumber:请填写大于0的数字"/>
					</div>
				</div>
				<div class="form-group xx12">
					<div class="label"><label for="site_square">缩略图正方形</label></div>
					<div class="field">
						<select id="site_square" class="input" name="site_square">
							<option value="0" <%=iif(rs("site_square") = 0,"selected=""selected""","")%>>否</option>
							<option value="1" <%=iif(rs("site_square") = 1,"selected=""selected""","")%>>是</option>
						</select>
					</div>
				</div>
				<div class="form-group xx12">
					<div class="label"><label for="site_member">注册设置</label></div>
					<div class="field">
						<select id="site_member" class="input" name="site_member">
							<option value="0" <%=iif(rs("site_member") = 0,"selected=""selected""","")%>>需要审核</option>
							<option value="1" <%=iif(rs("site_member") = 1,"selected=""selected""","")%>>不需审核</option>
							<option value="2" <%=iif(rs("site_member") = 2,"selected=""selected""","")%>>禁止注册</option>
						</select>
					</div>
				</div>
				<div class="form-group xx13">
					<div class="label"><label for="site_guestbook">留言设置</label></div>
					<div class="field">
						<select id="site_guestbook" class="input" name="site_guestbook">
							<option value="0" <%=iif(rs("site_guestbook") = 0,"selected=""selected""","")%>>需要审核</option>
							<option value="1" <%=iif(rs("site_guestbook") = 1,"selected=""selected""","")%>>不需审核</option>
							<option value="2" <%=iif(rs("site_guestbook") = 2,"selected=""selected""","")%>>会员开放</option>
							<option value="3" <%=iif(rs("site_guestbook") = 3,"selected=""selected""","")%>>禁止留言</option>
						</select>
					</div>
				</div>
				<div class="form-group xx13">
					<div class="label"><label for="site_order">订单设置</label></div>
					<div class="field">
						<select id="site_order" class="input" name="site_order">
							<option value="0" <%=iif(rs("site_order") = 0,"selected=""selected""","")%>>完全开放</option>
							<option value="1" <%=iif(rs("site_order") = 1,"selected=""selected""","")%>>会员开发</option>
							<option value="2" <%=iif(rs("site_order") = 2,"selected=""selected""","")%>>禁止订单</option>
						</select>
					</div>
				</div>
				<div class="form-group xx13">
					<div class="label"><label for="site_comment">评论设置</label></div>
					<div class="field">
						<select id="site_comment" class="input" name="site_comment">
							<option value="0" <%=iif(rs("site_comment") = 0,"selected=""selected""","")%>>需要审核</option>
							<option value="1" <%=iif(rs("site_comment") = 1,"selected=""selected""","")%>>不需审核</option>
							<option value="2" <%=iif(rs("site_comment") = 2,"selected=""selected""","")%>>会员开放</option>
							<option value="3" <%=iif(rs("site_comment") = 3,"selected=""selected""","")%>>禁止评论</option>
						</select>
					</div>
				</div>
				<div class="form-group xx13">
					<div class="label"><label for="site_float">浮动开关</label></div>
					<div class="field">
						<select id="site_float" class="input" name="site_float">
							<option value="0" <%=iif(rs("site_float") = 0,"selected=""site_float""","")%>>隐藏</option>
							<option value="1" <%=iif(rs("site_float") = 1,"selected=""site_float""","")%>>显示</option>
						</select>
					</div>
				</div>
				<div class="fc"></div>
				<div class="form-group x12">
					<div class="label"><label for="test">栏目显示开关</label></div>
					<div class="field">
						<label class="btn btn-small">网站地图 <input name="site_s2" type="checkbox" value="1" <%=iif(rs("site_s2") = 1,"checked=""checked""","")%>/></label>
						<label class="btn btn-small">客户留言 <input name="site_s3" type="checkbox" value="1" <%=iif(rs("site_s3") = 1,"checked=""checked""","")%>/></label>
						<label class="btn btn-small">在线订购 <input name="site_s4" type="checkbox" value="1" <%=iif(rs("site_s4") = 1,"checked=""checked""","")%>/></label>
						<label class="btn btn-small">人才招聘 <input name="site_s5" type="checkbox" value="1" <%=iif(rs("site_s5") = 1,"checked=""checked""","")%>/></label>
						<label class="btn btn-small">在线申请 <input name="site_s6" type="checkbox" value="1" <%=iif(rs("site_s6") = 1,"checked=""checked""","")%>/></label>
						<label class="btn btn-small">链接申请 <input name="site_s7" type="checkbox" value="1" <%=iif(rs("site_s7") = 1,"checked=""checked""","")%>/></label>
						<label class="btn btn-small">设为首页 <input name="site_s8" type="checkbox" value="1" <%=iif(rs("site_s8") = 1,"checked=""checked""","")%>/></label>
						<label class="btn btn-small">加入收藏 <input name="site_s9" type="checkbox" value="1" <%=iif(rs("site_s9") = 1,"checked=""checked""","")%>/></label>
						<label class="btn btn-small">繁體中文 <input name="site_s10" type="checkbox" value="1" <%=iif(rs("site_s10") = 1,"checked=""checked""","")%>/></label>
						<label class="btn btn-small">登录 <input name="site_s11" type="checkbox" value="1" <%=iif(rs("site_s11") = 1,"checked=""checked""","")%>/></label>
						<label class="btn btn-small">注册 <input name="site_s12" type="checkbox" value="1" <%=iif(rs("site_s12") = 1,"checked=""checked""","")%>/></label>
					</div>
				</div>
				<div class="form-group x12">
					<div class="label"><label for="site_p1">信息参数名称</label></div>
					<div class="field">
						<div class="l10">
							<div class="xx24"><input id="site_p1" class="input" name="site_p1" type="text" size="60" value="<%=rs("site_p1")%>" /></div>
							<div class="xx24"><input id="site_p2" class="input" name="site_p2" type="text" size="60" value="<%=rs("site_p2")%>" /></div>
							<div class="xx24"><input id="site_p3" class="input" name="site_p3" type="text" size="60" value="<%=rs("site_p3")%>" /></div>
							<div class="xx24"><input id="site_p4" class="input" name="site_p4" type="text" size="60" value="<%=rs("site_p4")%>" /></div>
							<div class="xx24"><input id="site_p5" class="input" name="site_p5" type="text" size="60" value="<%=rs("site_p5")%>" /></div>
						</div>
					</div>
				</div>
				<div class="form-group x12">
					<div class="label"><label for="site_fcontent">浮动内容</label></div>
					<div class="field">
						<textarea id="site_fcontent" class="input" name="site_fcontent" row="5" /><%=str_editor(rs("site_fcontent"))%></textarea>
					</div>
				</div>
				<div class="form-group x12">
					<div class="label"><label for="site_copyright">版权信息</label></div>
					<div class="field">
						<textarea id="site_copyright" class="input" name="site_copyright" row="5" /><%=str_editor(rs("site_copyright"))%></textarea>
					</div>
				</div>
				<div class="form-group x12">
					<div class="label"><label for="site_guestbook_notice">留言提示</label></div>
					<div class="field">
						<textarea id="site_guestbook_notice" class="input" name="site_guestbook_notice" row="5" /><%=str_editor(rs("site_guestbook_notice"))%></textarea>
					</div>
				</div>
				<div class="form-group x12">
					<div class="label"><label for="site_comment_notice">评论提示</label></div>
					<div class="field">
						<textarea id="site_comment_notice" class="input" name="site_comment_notice" row="5" /><%=str_editor(rs("site_comment_notice"))%></textarea>
					</div>
				</div>
				<div class="form-group x12">
					<div class="label"><label for="site_order_notice">订购提示</label></div>
					<div class="field">
						<textarea id="site_order_notice" class="input" name="site_order_notice" row="5" /><%=str_editor(rs("site_order_notice"))%></textarea>
					</div>
				</div>
				<div class="form-group x12">
					<div class="label"><label for="site_member_notice">注册提示</label></div>
					<div class="field">
						<textarea id="site_member_notice" class="input" name="site_member_notice" row="5" /><%=str_editor(rs("site_member_notice"))%></textarea>
					</div>
				</div>
				<div class="form-group x12">
					<div class="label"><label></label></div>
					<div class="field">
						<input id="save" class="btn bg-dot" name="save" type="submit" value="保存系统设置" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
