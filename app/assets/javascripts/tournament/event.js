jQuery(document).ready(function() {

	$('.show-tournament #add-round').click(function(e){
		e.stopPropagation();
		e.preventDefault();

		var self = $(this);

		$.ajax({
			url: '/tournament/event-' + self.data('event-id') + '/rounds.json',
			method: 'POST',
			contentType: 'application/json',
			success: function(result) {

				var length = $('.list-user-points th')
										.length;
				console.log('length', length);

				$('.list-user-points').find('thead')
										.find('tr')
										.each(function(){
					$(this).find('th').eq(length - 2).after('<th><a href="../event-' + self.data('event-id') + '/rounds/' + result.id + '">Round ' + result.position + ' <i class="fa fa-edit"></i></a></th>');
				});

				$('.list-user-points').find('tbody')
										.find('tr')
										.each(function(){
					$(this).find('td').eq(length - 2).after('<td>0</td>');
				});

			},
			error: function(request,msg,error) {
			    // handle failure
			}
		});
	});

	$('.show-tournament .bronze .podium').animate({
		"height": "62px"
	}, 1500);
	$('.show-tournament .gold .podium').animate({
		"height": "165px"
	}, 1500);
	$('.show-tournament .silver .podium').animate({
		"height": "106px"
	}, 1500);
	$('.show-tournament .competition-container .name').delay(1000).animate({
		"opacity": "1"
	}, 500);
});