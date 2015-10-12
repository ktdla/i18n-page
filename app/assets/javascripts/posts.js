//Add class in articles depending span
$(".blog-1 .category a").each(function() {
  category = $(this).text();
  $(this).parents(".blog-1").addClass(category);
})

//Filter options
var elements = $('.blog-1');
$("#list-of-categories").change(function () {
  var value = $( "option:selected" ).text();
  $('.blog-1').detach();
    elements.appendTo("#blog_posts");
  if (value != "Selecciona una categoría"&&value != "Select a category"&&value != "Selecione uma categoria") $('.blog-1').show().filter(':not(.' + value + ')').detach();
});

//Filter posts in pages
var sectionCategory = $('.blog h2').text();
if (sectionCategory) {
  $('.blog-1').hide();
}
$(".blog-1").each(function() {
  var articleCategory = $(this).attr('class').substring(7);
  if ( sectionCategory === articleCategory) {
    $('.blog-1').hide();
    $('.' + articleCategory).show();
  }
  else {
    $('.Noticias').show();
    $('.News').show();
  }
});

