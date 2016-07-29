first_bg_changer = () => 
   oActive = $(".banners > .first_bg > .ac_ban");

   if (oActive.next().length > 0)
     oActive.removeClass('ac_ban');
     oActive.next().addClass('ac_ban');
   else
     oActive.removeClass('ac_ban');
     oActive.parent().children().eq(0).addClass('ac_ban');
second_bg_changer = () => 
   oActive = $(".banners > .second_bg > .ac_ban");

   if (oActive.next().length > 0)
     oActive.removeClass('ac_ban');
     oActive.next().addClass('ac_ban');
   else
     oActive.removeClass('ac_ban');
     oActive.parent().children().eq(0).addClass('ac_ban');
     

$ -> 
   self.setInterval(first_bg_changer,10000)
   self.setInterval(second_bg_changer,6000)
   return



