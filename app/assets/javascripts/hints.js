$(document).ready(function() {

	$('.show_hint').focus(function() {

		$(this).parent().siblings('.hint_wrapper').addClass('visible_hint');

		adjustHeight();

	}).blur(function() {

		$('.visible_hint').removeClass('visible_hint');
		restoreHeight();

	});

	$(window).resize(adjustHeight);

});

function adjustHeight() {

	if($(window).width() >= 768) {

		var fieldHeight = $('.visible_hint').siblings('.message_wrapper').height();
		var hintHeight = $('.visible_hint').height();
		if(hintHeight > fieldHeight) {

			$('.visible_hint').siblings('.message_wrapper').height($('.visible_hint').height());
		}
	}
	else {

		restoreHeight();
		
	}

}

function restoreHeight() {

	$('.message_wrapper').height('auto');

}