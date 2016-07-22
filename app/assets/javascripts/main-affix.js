$(document).ready(function () {
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
});