jQuery(function($) {

	$('.army-list label').click(function(){
		$('.army-list label').removeClass('active');
		$(this).addClass('active');
	})

	$('#search-army-lists > form').submit(function(e) {
		console.log('aaa');
		if(0 == $('#search-army-lists > form ul li input:radio:checked').length){
			e.preventDefault();
			e.stopPropagation();
		}
	});

});