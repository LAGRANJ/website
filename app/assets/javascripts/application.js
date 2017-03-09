// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui/widgets/slider
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require select2
//= require underscore
//= require gmaps/google
$(function() {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
})
var loaded = function() {
    $('div#mainmenu').affix({
        offset: {
            top: function() {
                if (Modernizr.mq('(min-width: 1200px)'))
                    return 200;
                else if (Modernizr.mq('(min-width: 992px)'))
                    return 160;
                else if (Modernizr.mq('(min-width: 768px)'))
                    return 120;
                else
                    return 0;
            }
        }
    });
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
    $('.container').on('click', '.radioBtn a', function() {
        var sel = $(this).data('title');
        var tog = $(this).data('toggle');
        $(this).parent().next('.' + tog).prop('value', sel);
        $(this).parent().find('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
        $(this).parent().find('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');
    });
    $("#receive_country, #calculators_receive_country, #sender_region, #calculators_region, #calculators_senderacctypeid, #calculators_receiveracctypeid").select2({
        theme: "bootstrap"
    });
    $(window).trigger('resize');
}
$(document).ready(loaded)
$(document).on('page:load', loaded)
$(document).on("turbolinks:load", loaded)
$( window ).resize(function() {
        if (Modernizr.mq('(min-width: 1200px)')){            
            $('#carousel-main').css('background','url("http://www.rsk.kg/img/frontend/slider-shadow.png") no-repeat center 380px');
            $('#carousel-main').height(440);
            $('.slider_info').css('top', 190);
            $('.slider_info').css('left', 55);
        }
        else if (Modernizr.mq('(min-width: 992px)'))
        {
            $('#carousel-main').css('background','url("http://www.rsk.kg/img/frontend/slider-shadow.png") no-repeat center 310px');
            $('#carousel-main').height(370);
            $('.slider_info').css('top', 140);
            $('.slider_info').css('left', 35);
        }
        else $('#carousel-main').height = 0;
    });
