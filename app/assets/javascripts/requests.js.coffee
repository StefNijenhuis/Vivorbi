# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	clicks = 0

	if clicks == 0 
		$('#request_form_name').show();
		$('.next').css('display', 'inline-block');

	$('.next').click ->
		# STAP 2
		if clicks == 0
			$('#progress_bar').removeClass("push-4")
			$('.next').removeClass("push-4")
			$('#request_form_date').show();
			$('#request_form_name').hide();
			$('.prev').css('display', 'inline-block');
			$('.second_step').css('background-color', "#2ecc71")
			$('.progress_text').text('Stap 2 van 3')
			$('#title_name').hide()
			$('.form_subtitle').hide()
			$('#title_date').show()
			$('#title_overview').hide()
			clicks += 1;
		# STAP 3
		else if clicks == 1
			$('#request_form_date').hide();
			$('#submit_button_div').show();
			$('.next').hide();
			$('#request_form_overview').show();
			$('#request_form_overview span#title_overview').html($('#name').val());
			$('#request_form_overview span#date_overview').html($('#actualDate').val());
			$('.third_step').css('background-color', "#2ecc71")
			$('.progress_text').text('Stap 3 van 3')
			$('#title_name').hide()
			$('.form_subtitle').hide()
			$('#title_date').hide()
			$('#title_overview').show()
			clicks += 1;


	$('.prev').click ->
		# STAP 2
		if clicks == 2
			$('#request_form_date').show();
			$('#request_form_name').hide();
			$('#request_form_overview').hide();
			$('#submit_button_div').hide();
			$('.next').css('display', 'inline-block')
			clicks -= 1;
			$('.third_step').css('background-color', "#bd1633")
			$('.progress_text').text('Stap 2 van 3')
			$('#title_name').hide()
			$('.form_subtitle').hide()
			$('#title_date').show()
			$('#title_overview').hide()
		# STAP 1
		else if clicks == 1
			$('#progress_bar').addClass("push-4")
			$('.next').addClass("push-4")
			$('#request_form_date').hide();
			$('#request_form_name').show();
			$('#request_form_overview').hide();
			$('.prev').hide();
			$('.second_step').css('background-color', "#bd1633")
			$('.progress_text').text('Stap 1 van 3')
			$('#title_name').show()
			$('.form_subtitle').show()
			$('#title_date').hide()
			$('#title_overview').hide()
			clicks -= 1;

	$('#date').datepicker({
		dateFormat: "dd-mm-yy",
		altField: "#actualDate",
		dayNamesMin: ['Zo', 'Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za'],
		monthNames: [ "Januari", "Februari", "Maart", "April", "Mei", "Juni", "July", "Augustus", "September", "Oktober", "November", "December" ]
	});

$(document).ready(ready)
$(document).on('page:load', ready)