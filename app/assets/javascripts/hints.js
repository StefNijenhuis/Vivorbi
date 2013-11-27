$(document).ready(function() {

	$('.show_hint').focus(function() {

		$(this).parent().siblings('.hint_wrapper').addClass('visible_hint');


	}).blur(function() {

		$('.visible_hint').removeClass('visible_hint');

	});

});