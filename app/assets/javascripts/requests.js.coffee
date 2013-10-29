# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	clicks = 0

	if clicks == 0
		$('.form_name_wrapper').show();
		$('.next').css('display', 'inline-block');

	$('.next').click ->
		# STEP 2
		if clicks == 0
			$('.form_name_wrapper').hide();
			$('.form_date_wrapper').show();
			$('#progress_bar').removeClass("push-4")
			$('.next').removeClass("push-4")
			$('.prev').css('display', 'inline-block');
			$('.second_step').css('background-color', "#2ecc71")
			$('.progress_text').text('Stap 2 van 3')
			clicks += 1;
		# STEP 3
		else if clicks == 1
			$('.form_date_wrapper').hide();
			$('.form_overview_wrapper').show();
			$('#submit_button_div').show();
			$('.next').hide();
			$('#name_overview_val').text($('#name').val());
			$('#date_overview_val').text($('#actualDate').val());
			$('.third_step').css('background-color', "#2ecc71")
			$('.progress_text').text('Stap 3 van 3')
			clicks += 1;


	$('.prev').click ->
		# STEP 2
		if clicks == 2
			$('.form_name_wrapper').hide();
			$('.form_date_wrapper').show();
			$('.form_overview_wrapper').hide();
			$('#submit_button_div').hide();
			$('.next').css('display', 'inline-block')
			$('.third_step').css('background-color', "#bd1633")
			$('.progress_text').text('Stap 2 van 3')
			clicks -= 1;
		# STEP 1
		else if clicks == 1
			$('.form_date_wrapper').hide();
			$('.form_name_wrapper').show();
			$('.form_overview_wrapper').hide;
			$('#progress_bar').addClass("push-4")
			$('.next').addClass("push-4")
			$('.prev').hide();
			$('.second_step').css('background-color', "#bd1633")
			$('.progress_text').text('Stap 1 van 3')
			clicks -= 1;

	$('#new_request').submit ->
		$(".next").trigger("click")
		return false

	$('#date').datepicker({
		dateFormat: "dd-mm-yy",
		altField: "#actualDate",
		dayNamesMin: ['Zo', 'Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za'],
		monthNames: [ "Januari", "Februari", "Maart", "April", "Mei", "Juni", "July", "Augustus", "September", "Oktober", "November", "December" ]
	});

	$('#overview_name_wrapper .edit-button').click ->
		$('.form_date_wrapper').hide();
		$('.form_name_wrapper').show();
		$('.form_overview_wrapper').hide();
		$('#progress_bar').addClass("push-4")
		$('.next').addClass("push-4")
		$('.prev').hide();
		$('.second_step').css('background-color', "#bd1633")
		$('.third_step').css('background-color', "#bd1633")
		$('.progress_text').text('Stap 1 van 3')
		$('#submit_button_div').hide();
		$('.next').css('display', 'inline-block');
		clicks -= 2;


	$('#overview_date_wrapper .edit-button').click ->
		$('.form_name_wrapper').hide();
		$('.form_date_wrapper').show();
		$('.form_overview_wrapper').hide();
		$('#submit_button_div').hide();
		$('.next').css('display', 'inline-block')
		$('.third_step').css('background-color', "#bd1633")
		$('.progress_text').text('Stap 2 van 3')
		clicks -= 1;

#$(document).ready(ready)

	