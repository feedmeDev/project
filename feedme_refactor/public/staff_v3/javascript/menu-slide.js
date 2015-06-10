// adds sliding underline HTML
/*

jQuery('#menu2').append('<li class="slide-line"></li>');

// animate slide-line on click
jQuery(document).on('mouseenter', '#menu2 li a', function () {
  
        var $this = jQuery(this),
            // get offset of hovered this
            offset = $this.offset(),
            //find the offset of the wrapping div  
            offsetBody = jQuery('#box2').offset();
  
        // GSAP animate to clicked menu item
        TweenMax.to(jQuery('#menu2 .slide-line'), 0.5, {
          css:{
            width: $this.outerWidth()+'px',
            left: (offset.left-offsetBody.left)+'px'
          },
          overwrite:"all",
          // easing for overshoot
          ease:Back.easeOut
        });
  
}).on('mouseleave', '#menu2 li', function () {
  
        var $this = jQuery(this),
            // get the active menu selector
            $active = $this.parent().find("a.active"),
            // get offset of active menu item
            offset = $active.offset(),
            //find the offset of the wrapping div  
            offsetBody = jQuery('#box2').offset();
  
        // GSAP animate to clicked menu item
        TweenMax.to(jQuery('#menu2 .slide-line'), 0.5, {
          css:{
            width: $active.outerWidth()+'px',
            left: (offset.left-offsetBody.left)+'px'
          },
          overwrite:"all",
          ease:Power4.easeInOut
        });
});

*/
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
// click event way
// adds sliding underline HTML
jQuery('#menu2').append('<li class="slide-line"></li>');

// animate slide-line on click
jQuery(document).on('click', '#menu2 li a', function () {
  
        var $this = jQuery(this),
            offset = $this.offset(),
            //find the offset of the wrapping div  
            offsetBody = jQuery('#box2').offset();

        // GSAP animate to clicked menu item
        TweenMax.to(jQuery('#menu2 .slide-line'), 0.45, {
          css:{
            width: $this.outerWidth()+'px',
            left: (offset.left-offsetBody.left)+'px',
            top: (offset.top-offsetBody.top+$(this).height())+'px' 
          },
          ease:Power2.easeInOut
        });

        return false;
});

jQuery('#menu2 > li a').first().trigger("click");
