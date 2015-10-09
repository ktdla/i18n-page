//Add class in articles depending span
$(".blog-1 .category a").each(function() {
  category = $(this).text();
  $(this).parents(".blog-1").addClass(category);
})

//Filter options
$( "select" ).click(function(){
  var value = $( "option:selected" ).text();
  $(".blog-1").each(function(){
    var x = $(this).attr("class");
    var y = "blog-1 " + value;
    if (x == y){
      $(".blog-1").hide();
      $("."+value).show();
    }
  });
  if (value == "Selecciona una categoría") {
    $(".blog-1").show();
  }
});
