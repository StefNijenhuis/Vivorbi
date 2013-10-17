# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	clicks = 0

	if clicks == 0 
		$('#request_form_name').show();
		$('.next').show();

	$('.next').click ->
		if clicks == 0
			$('#request_form_date').show();
			$('#request_form_name').hide();
			$('.prev').show();
			clicks += 1;
		else if clicks == 1
			$('#request_form_date').hide();
			$('#submit_button').show();
			$('.next').hide();
			$('#request_form_overview').show();
			$('#request_form_overview span#title_overview').html($('#name').val());
			$('#request_form_overview span#date_overview').html($('#actualDate').val());
			clicks += 1;


	$('.prev').click ->
		if clicks == 2
			$('#request_form_date').show();
			$('#request_form_name').hide();
			$('#request_form_overview').hide();
			$('#submit_button').hide();
			$('.next').show()
			clicks -= 1;
		else if clicks == 1
			$('#request_form_date').hide();
			$('#request_form_name').show();
			$('#request_form_overview').hide();
			$('.prev').hide();
			clicks -= 1;

	$('#date').datepicker({ dateFormat: "dd-mm-yy", altField: "#actualDate" });

$(document).ready(ready)
$(document).on('page:load', ready)