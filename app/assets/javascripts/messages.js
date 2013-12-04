$(document).ready(function() {

  $(".search_result").click(function(){
    window.location = $(this).find("a").attr("href");
  });

});