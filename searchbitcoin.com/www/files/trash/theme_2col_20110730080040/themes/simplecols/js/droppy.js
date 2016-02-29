/*
 * Droppy 0.1.2
 * (c) 2008 Jason Frame (jason@onehackoranother.com)
 */
$.fn.droppy = function(options) {
    
  options = $.extend({speed: 250}, options || {});

  var zIndex = 1000;
  
  this.each(function() {
    
    var root = this;
    
	function snbool(ele) {
      if (ele.nodeName.toLowerCase() == 'li') {
        var subnav = $('> ul', ele);
        return subnav.length ? subnav[0] : null;
      } else {
        return false;
      }
    }
	
	
    function getSubnav(ele) {
      if (ele.nodeName.toLowerCase() == 'li') {
        var subnav = $('> ul', ele);
        return subnav.length ? subnav[0] : null;
      } else {
        return ele;
      }
    }
    
    function getActuator(ele) {
      if (ele.nodeName.toLowerCase() == 'ul') {
        return $(ele).parents('li')[0];
      } else {
        return ele;
      }
    }
    
    function hide() {
      var subnav = getSubnav(this);
      if (!subnav) return;
      $.data(subnav, 'cancelHide', false);
       setTimeout(function() {
        if (!$.data(subnav, 'cancelHide')) {
          $(subnav).slideUp(options.speed);
        }
      }, 500);
    }
  
    function show() {
	
      var subnav = getSubnav(this);
      if (!subnav) return;
      $.data(subnav, 'cancelHide', true);
      $(subnav).css({zIndex: zIndex++}).slideDown(options.speed);
      if (this.nodeName.toLowerCase() == 'ul') {
        var li = getActuator(this);
        $(li).addClass('hover');
        $('> a', li).addClass('hover');
      }
    }
    
    $('li', this).hover(show, hide);
    $('li', this).hover(
      function() { if(snbool(this)){$(this).addClass('hover'); $('> a', this).addClass('hover');} },
      function() { if(snbool(this)){$(this).removeClass('hover'); $('> a', this).removeClass('hover');} }
    );
    
  });
  
};




$(function() {
    $('.nav ul, .manus').droppy();
	
	
	//fading hovers
	$('.fader').hover(function(){$(this).stop().fadeTo(400,0.7);},function(){$(this).stop().fadeTo(20,0.1);});
	$('.btt').bind('click',function(){$('html, body').animate({scrollTop: 0}, 2000); return false});

	
	
	//form stuff
	$(".callbackform").bind('click', function(){
			//$('input, textarea').removeAttr('disabled');
			$("div.errorbox").fadeOut();
	});
	
	
	
	
	$(".callbackform").submit(function() {
		
		$("div.errorbox").removeClass('sendbox');
		

		//VALIDATION
		var name = $("input[name='name']").val();
		var phone = $("input[name='phone']").val();
		var time = $("select[name='time'] option:selected").val();
		
		var sourcecallback = $("input[name='sourcecallback']").val();
		
		if(time==null || time==''){
			time = 'Anytime';	
		}
		
		var gotcha = $("input[name='gotcha']").val();
		
		var theaction = $("form[class='callbackform']").attr('action');
		
		//validate all entries
		if (phone == "" || name == "" || phone == "Phone Number" || name == "Your Name"){
			$("div.errorbox").html('Please enter all the required fields.').fadeIn();
        	return false;
		};
		
		
		
		$("div.errorbox").addClass('sendbox').html('Sending... Please wait.').fadeIn();
		
		
		//SUBMISSION
		var dataString = 'gotcha=' + gotcha + '&name=' + name + '&phone=' + phone + '&time=' + time + '&sourcecallback=' + sourcecallback + '&subby=ajax';
  		//alert (dataString);return false;
  		$.ajax({
    		type: "POST",
    		url: theaction,
    		data: dataString,
    		success: function(data) {
				//alert(data);
      			$("div.errorbox").fadeOut('normal', function(){
					$(this).html('Your message was sent, thanks!').fadeIn();
					$(".contactform").unbind('click');
					$('.callbackform input, .callbackform select').attr('disabled','disabled');
				});
    		}
  		});
  		return false;
		
   }); //form submit close 
	
	//clear default
	$('input[type=text]').bind('focus',function(){
		if (this.defaultValue==this.value) this.value = "";
	}).bind('blur',function(){
		if (this.value=="") this.value = this.defaultValue;
	});
	
	
});

