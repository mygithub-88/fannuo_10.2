$(function(){
	$('#navigation').slide({
		type: "menu",
		titCell: '.main',
		targetCell: '.sub',
		effect: 'fade',
		delayTime: 300,
		triggerTime: 100
	});
	$('#banner').slide({
		titCell: ".hd ul",
		mainCell: ".bd",
		effect: "fade",
		delayTime:1500,
		interTime: 5000,
		autoPlay: true,
		autoPage: true,
		trigger: "click"
	});
	$('#banner').mouseover(function(){
		$(this).find('.next').show();
		$(this).find('.prev').show();
	}).mouseleave(function(){
		$(this).find('.next').hide();
		$(this).find('.prev').hide();
	})
	//详情页多图
	$('#info_slideshow').slide({
		trigger : 'click'
	});
	//招聘详情显示
	$('.recruitment_list').slide({
		type: "menu",
		titCell: '.wrap',
		targetCell: '.content',
		effect: 'fade',
		delayTime: 0,
		triggerTime: 100
	});
	//应聘
	$('.recruitment_list .apply').click(function() {
		var rname = $(this).attr('data');
		$('#r_name').val(rname);
		layer.open({
			type: 1,
			area: ['400px', '700px'],
			title: false,
			content: $('#apply_form')
		})
	});
	//侧边漂浮
	var offsettop = $('#float').offset().top;
	$(window).scroll(function() {
		$('#float').animate({
			top: offsettop + $(window).scrollTop() + "px"
		}, {
			duration: 600,
			queue: false
		});
	});
	$('#float').slide({
		type: "menu",
		titCell: '.wrap',
		targetCell: '.content',
		effect: 'fade',
		delayTime: 0,
		triggerTime: 0
	});
	$('.gotop').click(function() {
		$('html,body').animate({
			scrollTop: '0px'
		}, 100);
	});
	$('.index_news').slide({
		easing: 'easeInOutBack',
		autoPlay: true,
		interTime: 4000,
		delayTime: 500,
		scroll: 1,
		vis: 3,
		mainCell: '.bd',
		effect: 'topLoop'
	});
	$('.index_case').slide({
		titCell : '.wrap',
		targetCell: '.bd',
		effect: 'slideDown'
	})
	lightbox.option({
		'albumLabel': '第%1张 共%2张图片',
	})
});
