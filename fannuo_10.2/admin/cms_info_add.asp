<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->
<%
current_nav = "cms_info_add"
Call check_admin_purview("cms_info_add")
If Not inull(rf("save")) Then
	Set rs = ado_mquery("select * from cms_info")
	rs.AddNew
	rs("i_enable") = rf("i_enable")
	rs("i_member") = rf("i_member")
	rs("i_name") = rf("i_name")
	rs("i_parent") = rf("i_parent")
	rs("i_ifrec") = iif((rf("i_ifrec") = 1),1,0)
	rs("i_ifhot") = iif((rf("i_ifhot") = 1),1,0)
	rs("i_iftop") = iif((rf("i_iftop") = 1),1,0)
	rs("i_ifcov") = iif((rf("i_ifcov") = 1),1,0)
	rs("i_bold") = rf("i_bold")
	rs("i_italic") = rf("i_italic")
	rs("i_color") = iif((inull(rf("i_color"))),"","color: "&rf("i_color")&";")
	rs("i_picture") = rf("i_picture")
	rs("i_attach") = rf("i_attach")
	rs("i_link") = rf("i_link")
	rs("i_slideshow") = rf("i_slideshow")
	rs("i_video") = rf("i_video")
	rs("i_target") = rf("i_target")
	rs("i_seoname") = rf("i_seoname")
	rs("i_key") = rf("i_key")
	rs("i_des") = rf("i_des")
	rs("i_a") = rf("i_a")
	rs("i_b") = rf("i_b")
	rs("i_c") = rf("i_c")
	rs("i_d") = rf("i_d")
	rs("i_e") = rf("i_e")
	rs("i_scontent") = iif((inull(rf("i_scontent"))),str_left(str_trim(rf("i_content")),300,"..."),rf("i_scontent"))
	rs("i_content") = rf("i_content")
	rs("i_mcontent") = ""
	rs("i_author") = rf("i_author")
	rs("i_sources") = rf("i_sources")
	rs("i_hits") = rf("i_hits")
	rs("i_order") = rf("i_order")
	rs("i_date") = Now()
	rs("i_mdate") = Now()
	rs.Update
	If rf("i_order") = 0 Then
		rs("i_order") = rs("id")
		rs.Update
	End If
	rs.Close
	Set rs = Nothing
	Call alert_href("新信息添加成功","cms_info_add.asp?cid="&rf("i_parent")&"")
End If
%>
</head>
<script type="text/javascript">
$(function(){
	KindEditor.ready(function(K) {
		K.create('#i_content');
		var editor = K.editor();
		var colorpicker;
		K('#color').bind('click', function(e) {
			e.stopPropagation();
			if (colorpicker) {
				colorpicker.remove();
				colorpicker = null;
				return;
			}
			var colorpickerPos = K('#color').pos();
			colorpicker = K.colorpicker({
				x : colorpickerPos.x,
				y : colorpickerPos.y + K('#color').height(),
				z : 19811214,
				selectedColor : 'default',
				noColor : '无颜色',
				click : function(color) {
					K('#i_color').val(color);
					colorpicker.remove();
					colorpicker = null;
				}
			});
		});
		K(document).click(function() {
			if (colorpicker) {
				colorpicker.remove();
				colorpicker = null;
			}
		});
		K('#picture').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
				imageUrl : K('#i_picture').val(),
				clickFn : function(url, title, width, height, border, align) {
					K('#i_picture').val(url);
					editor.hideDialog();
					}
				});
			});
		});
		K('#slideshow').click(function() {
			editor.loadPlugin('multiimage', function() {
				editor.plugin.multiImageDialog({
					clickFn : function(urlList) {
						var tem_val = '';
						var tem_s = '';
						K.each(urlList, function(i, data) {
							tem_val = tem_val + tem_s + data.url;
							tem_s = '|';
						});
						K('#i_slideshow').val(tem_val);
						editor.hideDialog();
					}
				});
			});
		});
		K('#attach').click(function() {
			editor.loadPlugin('insertfile', function() {
				editor.plugin.fileDialog({
					fileUrl : K('#i_attach').val(),
					clickFn : function(url, title) {
						K('#i_attach').val(url);
						editor.hideDialog();
					}
				});
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
		<div class="hd"> 添加信息 </div>
		<div class="bd">
			<form method="post">
				<div class="l10">
					<div class="x4">
						<div class="form-group">
							<div class="label"><label for="i_parent">所属频道</label></div>
							<div class="field">
								<select id="i_parent" class="input" name="i_parent" data-validate="required:必选">
									<option value="">请选择</option>
									<%=channel_select_list(0,0,Int(rq("cid")),0)%>
								</select>
								<div class="input-note">请选择此信息的所属频道</div>
							</div>
						</div>
					</div>
					<div class="x4">
						<div class="form-group">
							<div class="label"><label for="i_name">信息名称</label></div>
							<div class="field">
								<input id="i_name" class="input" name="i_name" type="text" size="60" value="" data-validate="required:必填" />
							</div>
						</div>
					</div>
					<div class="x1">
						<div class="form-group">
							<div class="label"><label for="i_color">颜色</label> <span class="badge bg-dot cp" id="color">选色</span></div>
							<div class="field">
								<input id="i_color" class="input" name="i_color" type="text" size="60" value="" />
							</div>
						</div>
					</div>
					<div class="x3">
						<div class="form-group">
							<div class="label"><label for="i_picture">缩略图</label> <span class="badge bg-dot cp" id="picture">上传</span></div>
							<div class="field">
								<input id="i_picture" class="input" name="i_picture" type="text" size="60" value="" />
								<div class="input-note">为了美观，建议使用正方形图。</div>
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="i_content">电脑详细内容</label></div>
							<div class="field">
								<textarea id="i_content" class="input" name="i_content" row="5" /></textarea>
							</div>
						</div>
					</div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label></label></div>
							<div class="field">
								<input class="btn bg-dot" name="save" type="submit" value="添加新信息" />
							</div>
						</div>
					</div>
					<div class="x12">
						<div class="quote border-green mb10">以下为选填内容</div>
					</div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="i_scontent">简短内容</label></div>
							<div class="field">
								<textarea id="i_scontent" class="input" name="i_scontent" row="5" /></textarea>
								<div class="input-note">多用于内容提要</div>
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x4">
						<div class="form-group">
							<div class="label"><label for="i_slideshow">多图</label> <span class="badge bg-dot cp" id="slideshow">上传</span></div>
							<div class="field">
								<textarea id="i_slideshow" class="input" name="i_slideshow" row="5" /></textarea>
								<div class="input-note">多个图片地址间用“|”分割</div>
							</div>
						</div>
					</div>
					<div class="x4">
						<div class="form-group">
							<div class="label"><label for="i_video">视频</label></div>
							<div class="field">
								<textarea id="i_video" class="input" name="i_video" row="5" /></textarea>
								<div class="input-note">请填写外部视频代码</div>
							</div>
						</div>
					</div>
					<div class="x4">
						<div class="form-group">
							<div class="label"><label for="i_attach">附件</label> <span class="badge bg-dot cp" id="attach">上传</span></div>
							<div class="field">
								<textarea id="i_attach" class="input" name="i_attach" row="5" /></textarea>
								<div class="input-note">多个附件地址间用“|”分割</div>
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="i_ifrec">属性</label></div>
							<div class="field">
								<label class="btn"><input name="i_ifrec" type="checkbox" value="1" /> 推荐 </label>
								<label class="btn"><input name="i_ifhot" type="checkbox" value="1" /> 热门 </label>
								<label class="btn"><input name="i_ifcov" type="checkbox" value="1" /> 封面 </label>
								<label class="btn"><input name="i_iftop" type="checkbox" value="1" /> 置顶 </label>
								<label class="btn"><input name="i_bold" type="checkbox" value="font-weight: bold;" /> 粗体 </label>
								<label class="btn"><input name="i_italic" type="checkbox" value="font-style: italic;" /> 斜体 </label>
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="i_seoname">优化标题</label></div>
							<div class="field">
								<input id="i_seoname" class="input" name="i_seoname" type="text" size="60" value="" />
							</div>
						</div>
					</div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="i_key">关键字</label></div>
							<div class="field">
								<input id="i_key" class="input" name="i_key" type="text" size="60" value="" />
							</div>
						</div>
					</div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label for="i_des">关键描述</label></div>
							<div class="field">
								<textarea id="i_des" class="input" name="i_des" row="5" /></textarea>
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="xx17">
						<div class="form-group">
							<div class="label"><label for="i_a"><%=site_p1%></label></div>
							<div class="field">
								<input id="i_a" class="input" name="i_a" type="text" size="60" value="" />
							</div>
						</div>
					</div>
					<div class="xx17">
						<div class="form-group">
							<div class="label"><label for="i_b"><%=site_p2%></label></div>
							<div class="field">
								<input id="i_b" class="input" name="i_b" type="text" size="60" value="" />
							</div>
						</div>
					</div>
					<div class="xx17">
						<div class="form-group">
							<div class="label"><label for="i_c"><%=site_p3%></label></div>
							<div class="field">
								<input id="i_c" class="input" name="i_c" type="text" size="60" value="" />
							</div>
						</div>
					</div>
					<div class="xx17">
						<div class="form-group">
							<div class="label"><label for="i_d"><%=site_p4%></label></div>
							<div class="field">
								<input id="i_d" class="input" name="i_d" type="text" size="60" value="" />
							</div>
						</div>
					</div>
					<div class="xx17">
						<div class="form-group">
							<div class="label"><label for="i_e"><%=site_p5%></label></div>
							<div class="field">
								<input id="i_e" class="input" name="i_e" type="text" size="60" value="" />
							</div>
						</div>
					</div>
					<div class="xx17">
						<div class="form-group">
							<div class="label"><label for="i_author">作者</label></div>
							<div class="field">
								<input id="i_author" class="input" name="i_author" type="text" size="60" value="<%=admin_penname%>" />
							</div>
						</div>
					</div>
					<div class="xx18">
						<div class="form-group">
							<div class="label"><label for="i_sources">来源</label></div>
							<div class="field">
								<input id="i_sources" class="input" name="i_sources" type="text" size="60" value="未知" />
							</div>
						</div>
					</div>
					<div class="fc"></div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="i_member">访问权限</label></div>
							<div class="field">
								<select id="i_member" class="input" name="i_member">
									<option value="0">不限</option>
									<option value="1">仅会员</option>
								</select>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="i_target">打开方式</label></div>
							<div class="field">
								<select id="i_target" class="input" name="i_target">
									<option value="_self">原窗口</option>
									<option value="_blank" selected="selected">新窗口</option>
								</select>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="i_link">外部链接</label></div>
							<div class="field">
								<input id="i_link" class="input" name="i_link" type="text" size="60" value="" />
								<div class="input-note">外部链接请用http://开头</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="i_hits">访问量</label></div>
							<div class="field">
								<input id="i_hits" class="input" name="i_hits" type="text" size="60" value="0" data-validate="required:必填,plusinteger:必须为正整数" />
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="i_order">排序</label></div>
							<div class="field">
								<input id="i_order" class="input" name="i_order" type="text" size="60" value="0" data-validate="required:必填,plusinteger:必须为正整数" />
								<div class="input-note">填写0自动识别为信息ID</div>
							</div>
						</div>
					</div>
					<div class="x2">
						<div class="form-group">
							<div class="label"><label for="i_enable">信息状态</label></div>
							<div class="field">
								<select id="i_enable" class="input" name="i_enable">
									<option value="0">暂存</option>
									<option value="1" selected="selected">发布</option>
								</select>
								<div class="input-note">暂存状态不可访问</div>
							</div>
						</div>
					</div>
					<div class="x12">
						<div class="form-group">
							<div class="label"><label></label></div>
							<div class="field">
								<input class="btn bg-dot" name="save" type="submit" value="添加新信息" />
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>
<!--#include file="inc_bottom.asp"-->
</body>
</html>
