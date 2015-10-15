$(function() {
  var SliderModule = (function() {
    var pb = {};
    pb.el = $('#slider');
    pb.items = {
      panel: pb.el.find('li')
    }

    var SliderInterval,
      currentSlider = 0,
      nextSlider = 1,
      lengthSlider = pb.items.panel.length;

    pb.init = function(settings) {
      this.settings = settings || {duration: 8000}
      var output = '';

      SliderInit();

      for(var i = 0; i < lengthSlider; i++) {
        if (i == 0) {
          output += '<li class="active"></li>';
        } else {
          output += '<li></li>';
        }
      }
    }

    var SliderInit = function() {
      SliderInterval = setInterval(pb.startSlider, pb.settings.duration);
    }

    pb.startSlider = function() {
      var panels = pb.items.panel,
        controls = $('#slider-controls li');

      if (nextSlider >= lengthSlider) {
        nextSlider = 0;
        currentSlider = lengthSlider-1;
      }

      controls.removeClass('active').eq(nextSlider).addClass('active');
      panels.eq(currentSlider).fadeOut(0);
      panels.eq(nextSlider).fadeIn(0);

      currentSlider = nextSlider;
      nextSlider += 1;
    }

    return pb;
  }());
  SliderModule.init({duration: 10000});
});