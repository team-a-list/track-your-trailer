// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require ../../../vendor/assets/javascripts/bootstrap.js
//= require ../../../vendor/assets/javascripts/jquery.prettyPhoto.js
//= require ../../../vendor/assets/javascripts/jquery.easing.1.3.js
//= require ../../../vendor/assets/javascripts/jquery.flexslider.js
//= require ../../../vendor/assets/javascripts/jquery.custom.js
//= require ../../../vendor/assets/javascripts/jquery.quicksand.js
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function () {

     $("#btn-client-next").click(function () {
      $('#clientCarousel').carousel('next');
    });
     $("#btn-client-prev").click(function () {
      $('#clientCarousel').carousel('prev');
    });

});

 $(window).load(function(){

    var items = 3;
    if (screen.width < 900) {
      items = 2;
    }
    else if (screen.width < 600) {
      items = 1;
    }

    $('.flexslider').flexslider({
        animation: "slide",
        slideshow: true,
        itemWidth: 300,
        itemMargin: 20,
        minItems: items,
        move: 1,
        start: function(slider){
          $('body').removeClass('loading');
        }
    });
});
