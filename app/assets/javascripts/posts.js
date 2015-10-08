//$(".blog article").each(function() {
//  var category = $("a").text();
//  alert(category);
//})

//for (i=0; i<$(".blog-1").length; i++) {
  //var category = $(".category").text();
  //alert(category);
//}

$( "select" ).click(function(){
  var value = $( "option:selected" ).text();
  alert(value);
  if (value == "Noticias") {
    $ (".blog-1").hide();
    $("#Noticias").show();
  }
  else if (value == "Recetas") {
    $ (".blog-1").hide()
  }
  else {
    $ (".blog-1").show();
  }
});