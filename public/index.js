jQuery(function($){
  $("section").first().find("span").last().click(function(){
    $("html , body").animate({scrollTop : $("section").eq(1).offset().top} , 500)
  });
  $("button").click(function(){
   var from = $("select").eq(0).find("option:selected").val();
   var to = $("select").eq(1).find("option:selected").val();
   var format = $("select").eq(2).find("option:selected").val();
   var degree = $("input").val();
   if( format != "text" && from != to ){
    $("iframe").attr("src", "http://" + window.location.host + "/" + from + "-to-" + to + "/" + degree + "/" + format );
   }else if( format == "text" && from != to){
     $("iframe").attr("src", "http://" + window.location.host + "/" + from + "-to-" + to + "/" + degree + "/");
   }else if( from == to ){
     alert("you can't transform between same format");
   }
  });
});
