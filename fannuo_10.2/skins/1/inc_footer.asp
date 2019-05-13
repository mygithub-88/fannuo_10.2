<div id="footer">
	<div class="container">
		<div class="line">
			<p>Copyright©2019布迪兰卡家具商行</p>
		</div>
	</div>
</div>
<%If site_square = 1 Then%>
<script type="text/javascript">
$(function(){
	$('.square_img img').jqthumb({
		width:$('.square_img').width(),
		height:$('.square_img').width()
	});
	$('.square_img2 img').jqthumb({
		width:$('.square_img2').width(),
		height:$('.square_img2').width()
	});
	$('.square_img3 img').jqthumb({
		width:$('.square_img3').width(),
		height:$('.square_img3').width()
	});
	$('.square_img4 img').jqthumb({
		width:$('.square_img4').width(),
		height:$('.square_img4').width()
	});
});
</script>
<%End If%>
<!--#include file="inc_float.asp"-->