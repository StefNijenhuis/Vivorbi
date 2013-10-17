# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

	$('#request_form_date').hide();
	$('#submit_button').hide();
	$('.prev').hide();
	$('#request_form_overview').hide();

	clicks = 0

	$('.next').click ->
		if clicks == 0
			$('#request_form_date').show();
			$('#request_form_name').hide();
			$('.prev').show()
			clicks += 1;
		else if clicks == 1
			$('#submit_button').show();
			$('.prev').hide();
			$('.next').hide();
			$('#request_form_date').hide();
			$('#request_form_overview').show();
			$('#request_form_overview span#title').html($('#request_form_name').val());
			$('#request_form_overview span#date').html($('#request_form_date').val());


	$('.prev').click ->
		if clicks == 1
			$('#request_form_date').hide();
			$('#request_form_name').show();
			clicks -= 1;
		else if clicks == 0
			$('#request_form_date').hide();
			$('#request_form_name').show();

$(document).ready(ready)
$(document).on('page:load', ready)