# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  if $("#profile_1").length>0
    $("#upload_avatar").click ->
      $("#user_avatar").trigger("click")
      return false
    $("#user_avatar").change ->
      $("#avatar_placeholder").html($("#avatar_placeholder_selected").text())
      $("#avatar_placeholder").css("color", "#55ae3a");

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
      # is het huisnummer ingevuld?
      if $("#user_house_number").val().length<1
        # niet ingevuld -> toon foutmelding
        if !$("label[for=user_house_number]").hasClass("error")
          $("label[for=user_house_number]").addClass("error")
          # TODO i18n
          $("label[for=user_house_number]").parent().append("<small id='hn_error' class='error'>Het is verplicht een huisnummer in te vullen</small>")
          $("#user_house_number").addClass("error")
      else
        # wel ingevuld -> controleer of er eerder een foutmelding is weergegeven
        if $("label[for=user_house_number]").hasClass("error")
          # foutmelding verwijderen
          $("label[for=user_house_number]").removeClass("error")
          $("#hn_error").remove()
          $("#user_house_number").removeClass("error")
        if $("label[for=user_postal_code]").hasClass("error")
          # foutmelding verwijderen
          $("label[for=user_postal_code]").removeClass("error")
          $("#pc_error").remove()
          $("#user_postal_code").removeClass("error")
        # haal spaties uit postcode
        newPostalCode = $("#user_postal_code").val().split(" ").join("")
        # zoek adres bij postcode
        ajaxUrl = "/api_requests/postal_code/"
        ajaxUrl+= newPostalCode
        ajaxUrlFull= ajaxUrl+"/"+$("#user_house_number").val()
        $("#user_postal_code").val(newPostalCode)
        $.ajax ajaxUrlFull,
          type: 'GET'
          dataType: 'html'
          error: (jqXHR, textStatus, errorThrown) ->
            # TODO i18n
            alert("error: geen verbinding oid")
            console.log(errorThrown)
          success: (data, textStatus, jqXHR) ->
            data = JSON.parse(data)
            # krijgen we gegevens bij deze postcode?
            if data.success
              # ja, gegevens invullen in overlay
              resource = data.resource
              $("#address").html(resource.street+" "+$("#user_house_number").val()+"<br>"+resource.postcode+" "+resource.town)
              $("#user_street").val(resource.street)
              $("#user_place").val(resource.town)
              $("#overlay").show()
              $("#background_overlay").show()
            else
              # nee, proberen adres op te halen zonder huisnummer
              $.ajax ajaxUrl,
                type: 'GET'
                dataType: 'html'
                error: (jqXHR, textStatus, errorThrown) ->
                  # TODO i18n
                  alert("error: geen verbinding oid")
                  console.log(errorThrown)
                success: (data, textStatus, jqXHR) ->
                  data = JSON.parse(data)
                  # krijgen we gegevens bij deze postcode?
                  if data.success
                    # ja, huisnummer is dus ongeldig
                    r = data.resource
                    if !$("label[for=user_house_number]").hasClass("error")
                      $("label[for=user_house_number]").addClass("error")
                      # TODO i18n
                      $("label[for=user_house_number]").parent().append("<small id='hn_error' class='error'>De "+r.street+" heeft geen nummer "+$("#user_house_number").val()+"!</small>")
                      $("#user_house_number").addClass("error")
                  else
                    # nee, postcode is dus ongeldig
                    if !$("label[for=user_postal_code]").hasClass("error")
                      $("label[for=user_postal_code]").addClass("error")
                      # TODO i18n
                      $("label[for=user_postal_code]").parent().append("<small id='pc_error' class='error'>Bij deze postcode kon geen adres gevonden worden</small>")
                      $("#user_postal_code").addClass("error")
      return false

    $("#close_overlay").click ->
      $("#overlay").hide()
      $("#background_overlay").hide()
      return false
