$(document).ready(function () {

  //Events that reset and restart the timer animation when the slides change
    $("#transition-timer-carousel").on("slide.bs.carousel", function(event) {
        //The animate class gets removed so that it jumps straight back to 0%
        $(".transition-timer-carousel-progress-bar", this)
            .removeClass("animate").css("width", "0%");
    }).on("slid.bs.carousel", function(event) {
        //The slide transition finished, so re-add the animate class so that
        //the timer bar takes time to fill up
        $(".transition-timer-carousel-progress-bar", this)
            .addClass("animate").css("width", "100%");
    });
    
    //Kick off the initial slide animation when the document is ready
    $(".transition-timer-carousel-progress-bar", "#transition-timer-carousel")
        .css("width", "100%");

  $(".dropdown").hover(
        function() { $('.dropdown-menu', this).stop().fadeIn("fast");
        },
        function() { $('.dropdown-menu', this).stop().fadeOut("fast");
    });


  $( window ).resize(function() {
    var query = Modernizr.mq('(max-width: 768px)');
     if (query) {
       $('#minibrand').show();
     }else 
      $('#minibrand').hide();

    var $affixElement = $('div#mainmenu');
    $affixElement.width($affixElement.parent().width());

  });

    $("div#mainmenu").on('affix.bs.affix', function(){
        $('#minibrand').show();
        $('#minibrand').show();
        var $affixElement = $('div#mainmenu');
    $affixElement.width($affixElement.parent().width());
    });
    $("div#mainmenu").on('affix-top.bs.affix', function(){
      if (Modernizr.mq('(min-width: 768px)'))            
        $('#minibrand').hide();
    });
$('div#mainmenu').affix({
  offset: {
    top: function () {      
      if (Modernizr.mq('(min-width: 1200px)'))
       return 200;
      else if (Modernizr.mq('(min-width: 992px)'))      
        return 160;
      else if (Modernizr.mq('(min-width: 768px)'))      
        return 120;
      else 
        return 0;
  }
}});

  var trigger = $('.menu-toggle'),
      overlay = $('.overlay'),
     isClosed = false;

    trigger.click(function () {
      hamburger_cross();      
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