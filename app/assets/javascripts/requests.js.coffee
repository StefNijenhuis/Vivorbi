# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
		
	$('#request_form_date').css("display", "none");
	$('#submit_button').css("display", "none");
	$('.prev').css("display", "none")

	clicks = 0

	$('.next').click ->
		if clicks == 0
			$('#request_form_date').css("display", "inline");
			$('#request_form_name').css("display", "none");
			$('.prev').css("display", "inline")
			clicks += 1;
		else if clicks == 1
			$('#submit_button').css("display", "inline");
			$('.prev').css("display", "none");
			$('.next').css("display", "none");

	$('.prev').click ->
		if clicks == 1
			$('#request_form_date').css("display", "none");
			$('#request_form_name').css("display", "inline");
			clicks -= 1;
		else if clicks == 0
			$('#request_form_date').css("display", "none");
			$('#request_form_name').css("display", "inline");