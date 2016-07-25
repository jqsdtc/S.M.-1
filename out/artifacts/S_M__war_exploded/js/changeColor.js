$(function(){
	$('#custom-content div ul li a').click(function(){
		$('#custom-content div ul li a').removeClass('on');
		$(this).addClass('on');
	})
})
$(document).ready(function(){
	$('#address1').hide();
})

$(function(){
	$('#address a').click(function(){
		if($('#address1').attr('class') == 'active'){
		$('#address1').hide();	    $('#address1').removeClass('active');
		}else{
			$('#address1').addClass('active');
			$('#address1').fadeIn(250);
		}
	})
})