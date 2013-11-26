$(document).ready(function() {

	$('#message_form_title').click(function() {

		$('#hint_wrapper_2').hide(1000);

		$('#hint_wrapper_1').show(1000);

	});

	$('#message_form_description').click(function() {

		$('#hint_wrapper_1').hide(1000);

		$('#hint_wrapper_2').show(1000);
		
	});



});