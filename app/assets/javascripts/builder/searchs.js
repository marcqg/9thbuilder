jQuery(function($) {

	$('.army-list label').click(function(){
		$('.army-list label').removeClass('active');
		$(this).addClass('active');
	});

	$('#search-army-lists > form input#min').change(function(value){
		$('#search-army-lists > form input#max').attr('min', $('#search-army-lists > form input#min').val());
	});

	$('#search-army-lists > form input#max').change(function(value){
		$('#search-army-lists > form input#min').attr('max', $('#search-army-lists > form input#max').val());
	});

	$('#search-army-lists > form').submit(function(e) {
		console.log('aaa');
		if(0 == $('#search-army-lists > form ul li input:radio:checked').length){
			$('.army-select-errror').show();
			e.preventDefault();
			e.stopPropagation();
		}
	});
});