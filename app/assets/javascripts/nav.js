$(document).ready(function () {

  // mobile menu
  var menu = $('#navigation-menu');
  var menuToggle = $('#mobile-menu');

  $(menuToggle).unbind('click').click(function (e) {
    menu.slideToggle(function () {
      if (menu.is(':hidden')) {
        menu.removeAttr('style');
      }
    });
  });
});