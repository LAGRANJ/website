$(document).ready(function () {
  var trigger = $('.menu-toggle'),
      overlay = $('.overlay'),
     isClosed = false;

    trigger.click(function () {
      hamburger_cross();      
      return false;
    });
    $('.overlay,.sidebar-brand').click(function () {
      $("#wrapper").removeClass("toggled");
      overlay.hide();
        trigger.removeClass('toggled');
        trigger.addClass('is-closed');
        isClosed = false;
    });

    function hamburger_cross() {
        $("#wrapper").toggleClass("toggled");

      if (isClosed == true) {          
        overlay.hide();
        trigger.removeClass('toggled');
        trigger.addClass('is-closed');
        isClosed = false;
      } else {   
        overlay.show();
        trigger.removeClass('is-closed');
        trigger.addClass('toggled');
        isClosed = true;
      }
  }  
});
