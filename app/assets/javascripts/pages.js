$(document).ready(function() {
  
  $(".item_box").click(function(){
    window.location = $(this).find("a").attr("href");
  });
  
});
