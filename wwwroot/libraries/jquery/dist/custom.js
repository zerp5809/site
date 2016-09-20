//side nav
$(document).ready(function () {
  var trigger = $('.hamburger'),
      overlay = $('.overlay'),
     isClosed = false;

    trigger.click(function () {
      hamburger_cross();      
    });

    function hamburger_cross() {

      if (isClosed == true) {          
        overlay.hide();
        trigger.removeClass('is-open');
        trigger.addClass('is-closed');
        
        isClosed = false;
      } else {   
        overlay.show();
        trigger.removeClass('is-closed');
        trigger.addClass('is-open');
        isClosed = true;
      }
  }
  
  $('[data-toggle="offcanvas"]').click(function () {
      var wrapper = document.querySelector("wrapper");
      $('#wrapper').toggleClass('toggled');
      
      if (class1.has(wrapper, "toggled")) {
          $('.header h1#logo').animate({ left: '220px' });
      }
      else {
          $('.header h1#logo').animate({ right: '220px' });
      }
  });  
});

//shrinking header 
$(function () {
    $('.header').data('size', 'big');
});

$(window).scroll(function () {
    if ($(document).scrollTop() > 0) {
        if ($('.header').data('size') == 'big') {
            $('.header').data('size', 'small');
            $('.header').stop().animate({
                height: '120px'
            });
            $('.header h1#logo').stop().animate({
                right: '+=0',
                fontSize: '50px'
            });
        }

    } else {
        if ($('.header').data('size') == 'small') {
            $('.header').data('size', 'big');
            $('.header').stop().animate({
                height: '150px'
            }, "slow");
            $('.header h1#logo').stop().animate({
                left: '+=0%',
                fontSize: '90px'
            });
        }
    }
});
