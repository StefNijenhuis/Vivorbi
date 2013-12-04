$(document).ready(function() {

  $('.show_hint').focus(function() {
    if ($(this).parent().hasClass("field_with_errors")){
      $(this).parent().parent().siblings('.hint_wrapper').addClass('visible_hint');
    }
    else {
      $(this).parent().siblings('.hint_wrapper').addClass('visible_hint');
    }
  }).blur(function() {
    $('.visible_hint').removeClass('visible_hint');
  });
  
});