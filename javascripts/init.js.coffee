Andrew = 
  Utils:
    # Vertically (and also horizontally) optically centers a target element on screen.
      positionIdeally: (target) ->
        unless $(target).hasClass '__should_position_ideally'
          $(target).data 'original_position', {position: $(target).css('position'), left: $(target).css('left'), top: $(target).css('top')}

        if $('html').hasClass('lt-640') or $('body').innerHeight() < ($(target).outerHeight())  # Restore the original positioning.
          $(target).css($(target).data 'original_position').addClass("__should_position_ideally")
        else  
          $(target).css({
            position: 'absolute'
            left: "#{($('body').innerWidth() - $(target).width())/2}px"
            top: "#{($('body').innerHeight() - $(target).height())/3}px"
          }).addClass("__should_position_ideally")            
          
$ ->
  Andrew.Utils.positionIdeally('.wrapper')
  $(window).bind 'resize orientationchange', ->
    Andrew.Utils.positionIdeally('.__should_position_ideally')
            
