$( "select" ).click(function(){
  var value = $( "option:selected" ).text();
  alert(value);
});