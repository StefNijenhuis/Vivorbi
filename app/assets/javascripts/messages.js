$(document).ready(function() {

  $(".search_result").click(function(){
    window.location = $(this).find("a").attr("href");
  });

  $('select option:first-child').attr('disabled', 'disabled');

  $("select:has(option[value=]:first-child)").on('change', function() {
    $(this).toggleClass("empty", $.inArray($(this).val(), ['', null]) >= 0);
  }).trigger('change');

  $('#new_message').parsley({
    listeners: {
      onFieldError: function ( e, constraints, ParsleyField ) {
        e.addClass("error");
      },
      onFieldSuccess: function ( e, constraints, ParsleyField ) {
        e.removeClass("error");

        if(e.parent('p').length > 0){
          var $container = e.parent().parent().children(".error");
        } else {
          var $container = e.parent().children(".error")
        }

        $container.slideUp( "normal", function() {
          $(this).remove();
        });
      }
    },
    errors: {
      errorsWrapper: "<span></span>",
      errorElem: "<span></span>",
      container: function (e, isRadioOrCheckbox) {
        if(e.parent('p').length > 0){
          $container = $("<div class='error'></div>").insertBefore(e.parent());
        } else {
            $container = $("<div class='error'></div>").insertBefore(e);
        }
        return $container;
       }
    }
  });

});