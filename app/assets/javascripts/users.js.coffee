# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	if $("#profile_1").length>0
		$("#upload_avatar").click ->
			$("#user_avatar").trigger("click")
			return false
	
	if $("#profile_2").length>0
		dateParts = $("#user_date_of_birth").val().split("-")
		y = dateParts[0]
		m = dateParts[1]
		d = dateParts[2]
		$("#day").change ->
			d = $("#day").val()
			$("#user_date_of_birth").val(y+"-"+m+"-"+d)
		$("#month").change ->
			m = $("#month").val()
			$("#user_date_of_birth").val(y+"-"+m+"-"+d)
		$("#year").change ->
			y = $("#year").val()
			$("#user_date_of_birth").val(y+"-"+m+"-"+d)

	if $("#profile_3").length>0
		$("#check_address").click ->
			# ajax get address
			ajaxUrl = "http://api.postcodeapi.nu/"
			ajaxUrl+= $("#user_postal_code").val().split(" ").join("")
			ajaxUrl+= "/"+$("#user_house_number").val()
			$.ajax ajaxUrl,
				type: 'GET'
				dataType: 'html'
				headers: 'Api-Key: 6451884210699c31101d4309a92ba3253095b9e9'
				error: (jqXHR, textStatus, errorThrown) ->
					alert(textStatus)
					console.log(errorThrown)
				success: (data, textStatus, jqXHR) ->
					# set street and place
					$('body').append "Successful AJAX call: #{data}"
					$("#overlay").show()
			# TODO: allow cross site reference
			return false