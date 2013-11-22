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
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
   $('.carousel').carousel({
     interval: 4000
   });

    $('.carousel-control').hide();
    // $('.carousel-control').hide();

   $('.carousel').hover(
    function(){
      $('.carousel-control').fadeIn(500)},
    function(){
      $('.carousel-control').fadeOut(300);
   });

  // $('.behind').hide()

  $('.hover').hover(function(){
    $(this).find('.img-responsive').fadeTo(200,0.2);
    $(this).find('.behind').fadeTo(200,1);
  },function(){
    $(this).find('.img-responsive').fadeTo(200,1);

    $(this).find('.behind').fadeTo(200,0);
  }
  );


 });

