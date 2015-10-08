
$( "select" ).click(function(){
  var value = $( "option:selected" ).text();
  var category = $( ".category" ).text();
  if (value == "Noticias") {
    $ (".blog-1").hide();
    $("#Noticias").show();
  }
  else if (value == "Recetas") {
    $ (".blog-1").hide();
  }
  else {
    $ (".blog-1").show();
  }
});