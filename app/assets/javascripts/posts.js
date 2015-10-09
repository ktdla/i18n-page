//$(".blog article").each(function(index) {
//  var category = $(".category").text();
//  console.log(category);
//})


//var category = $("article").find(".category").text();
//console.log(category);


$( "select" ).click(function(){
  for (i=0; i<($(".blog-1").length); i++) {
    var category = $(".blog-1 .category").text();
    console.log(category);
  }
  var value = $( "option:selected" ).text();
  alert(value);
  if (value == "Noticias") {
    $ (".blog-1").hide();
    $("#Noticias").show();
  }
  else if (value == "Recetas") {
    $ (".blog-1").hide()
    $("Recetas").show();
  }
  else {
    $ (".blog-1").show();
  }
});