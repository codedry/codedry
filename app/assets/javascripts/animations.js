/* ======= Animations ======= */
$(document).ready(function() {

  //Only animate elements when using non-mobile devices
  if (jQuery.browser.mobile === false) {

    /* Animate elements in #promo (homepage) */
    $('#promo .intro .title').css('opacity', 0).one('inview', function(isInView) {
      if (isInView) {$(this).addClass('animated fadeInLeft delayp1');}
    });
    $('#promo .intro .summary').css('opacity', 0).one('inview', function(isInView) {
      if (isInView) {$(this).addClass('animated fadeInRight delayp3');}
    });

    /* Animate elements in #contactus */
    $('#contactus .item .icon').css('opacity', 0).one('inview', function(isInView) {
      if (isInView) {$(this).addClass('animated fadeInUp delayp1');}
    });

    /* Animate elements in #contact-form */
    $('#contact-form .form-control').css('opacity', 0).one('inview', function(isInView) {
      if (isInView) {$(this).addClass('animated fadeInUp delayp3');}
    });

    $('#contact-form .btn').css('opacity', 0).one('inview', function(isInView) {
      if (isInView) {$(this).addClass('animated fadeInUp delayp3');}
    });
  }

});
