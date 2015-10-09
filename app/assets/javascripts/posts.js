$(".blog-1").each(function() {
  $(".category a").each(function(){
    var category = $(this).text();
    console.log(category);
    console.log("1");
  })
  $(this).addClass(category);
})


//var category = $("article").find(".category").text();
//console.log(category);

/*for (i=0; i<($(".blog-1").length); i++) {
    var category = $(".blog-1 .category a").html();
    $(".blog-1").addClass(category);
    alert(category);
    console.log(category);
}*/

/*
$( "select" ).click(function(){
    console.log(category);
  //var value = $( "option:selected" ).text();
  //alert(value);
});
*/