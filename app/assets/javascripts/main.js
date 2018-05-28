(function ($) {
	"use strict";

    $(document).ready(function(){    	

	    //Initialize filterizr with default options
	   if( $('.filtr-container').length){
	   	 $('.filtr-container').filterizr();
	   }

	    // Adding and removing active class
	    $("ul.portfolio-filter li").click(function() {
		    $(this).addClass('active').siblings().removeClass('active');
		});
		
	    if ($(window).width() > 767) {
		    $("ul.header-menu.navbar-nav li").hover(function() {
				$(this).children('ul.sub-menu').stop(true, false, true).slideToggle(300);
			});
		}
		else {
		    $('ul.header-menu.navbar-nav>li>a>i').click(function(e) { 		        
		        $(this).parent("ul.header-menu.navbar-nav li a").parent("ul.header-menu.navbar-nav li").children('ul.sub-menu').stop(true, false, true).slideToggle(300); // toggle element
		        return false;
		    });
		}
	    
	    $(".portfolioitems .filtr-item .item-desc").css({'height':(jQuery(".portfolioitems .filtr-item img").height()+'px')});

        // click event to scroll to next section
        $('.gonext a').on('click', function(event) {
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top
            }, 2000);
        });


        //Click event to scroll to top
        $('.scroll_top').on('click', function(){
            $('html, body').animate({scrollTop : 0},800);
            return false;
        });

	    //Initialize Animation
		new WOW().init();

		//Code for sticky header		
		function basticky(){
			var headera = $(".header-area");	
			var pos = headera.position();

			var windowpos = $(window).scrollTop();
			if (windowpos >= pos.top) {
				headera.addClass("is-sticky");
			} 
			if(windowpos == 0) {
				headera.removeClass("is-sticky");	
			}

			/*  HIDE THE SCROLL TOP BUTTON AFTER CERTAIN POINT */
			if(windowpos>50){
                $('.scroll_top').fadeOut();
			}
			else{
			    $('.scroll_top').fadeIn();
            }
        }
		

				
		$(document).ready(function() {			
			basticky();
			$(window).scroll(basticky);			
		}); 

		//Smooth scroll
		$('ul.header-menu li a').bind('click', function(event) {
			var $anchor = $(this);
		    if ($(window).width() > 991) {
				var headerH = '78';
			}
			else {
				var headerH = '56';
			}	    
			
			$('html, body').stop().animate({
				scrollTop : $($anchor.attr('href')).offset().top - headerH + "px"
			}, 800);
			
			event.preventDefault();		
		});		
		
		//jQuery scrollspy for active class in menu item
		$("ul.header-menu li a").addClass('nav-link');
		$('body').scrollspy({ 
			target: '.navbar-collapse',			
			offset: 79
			
		})


	    $("ul.header-menu li a").click(function() {
		    $("#headermenu01.show").removeClass('show');
		});


	    // portfolio magnificPopup
		$('.mypopup-link').magnificPopup({
		  type: 'image',
		  gallery:{ enabled: true }
		});






    });



}(jQuery));	