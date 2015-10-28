jQuery(function($){
  $("section").first().find("span").last().click(function(){
    $("html , body").animate({scrollTop : $("section").eq(1).offset().top} , 500)
  });
});
