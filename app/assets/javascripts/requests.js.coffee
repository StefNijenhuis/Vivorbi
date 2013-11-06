# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#date').datepicker({
		dateFormat: "dd-mm-yy",
		altField: "#request_date",
		dayNamesMin: ['Zo', 'Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za'],
		monthNames: [ "Januari", "Februari", "Maart", "April", "Mei", "Juni", "July", "Augustus", "September", "Oktober", "November", "December" ],
		defaultDate: $("#request_date").val()
		dateFormat: "yy-mm-dd 00:00:00 UTC"
	});

$ ->
	$('.prev').click ->
		history.back()
	