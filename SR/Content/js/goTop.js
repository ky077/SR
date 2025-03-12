$(window).on('scroll',function(seeFooter) { 
	var _touchFooter = $('footer').offset().top - $(window).height() + $(window).height()*0.2;
	if( $(window).scrollTop() > 200 ){
		$(".goTop").fadeIn();
		if( $(window).scrollTop() > _touchFooter ){
			$(".goTop").css({
				'position': 'absolute',
				'bottom':'0',
			}).parents('main').css({
				'position': 'relative',
			});
		}else{
			$(".goTop").css({
				'position': 'fixed',
				'bottom':'20%',
			});
		}			
	}else{
		$(".goTop").fadeOut();		
	}
});
$(document).ready(function() {
	$('main').append('<a href="#" class="goTop"> <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>回到頂部 </a>');
	
	$(window).trigger('scroll');
	
	$(".goTop").click(function(){
		$("html,body").animate({scrollTop:0},1000);
		$(this).blur();
	});
});
 