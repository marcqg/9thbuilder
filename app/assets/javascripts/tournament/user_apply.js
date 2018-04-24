jQuery(document).ready(function() {


	$('.new-user-apply .add-username button').click(function(e){

		var content = $('.new-user-apply .add-username textarea').val();
		if(content.length > 0){
			var lines = content.split("\n");

			var eventId = $('.new-user-apply .add-username #tournament_event').val();

			$.each( lines, function(i, item){
				$.ajax({
				    url: '/tournament/event-' + eventId + '/user_applies.json',
				    method: 'POST',
				    contentType: 'application/json',
				    data: JSON.stringify({tournament_user_apply: { name: item }}),
				    success: function(result) {

				    	$div = $('<div/>');
				    	$div.append(item);
				    	$div.append($('<i class="fa fa-2x fa-trash" />'))

				    	$('.new-user-apply .list-user').append($div);

				    	$('.new-user-apply .add-username textarea').val('');
				    },
				    error: function(request,msg,error) {
				        // handle failure
				    }
				});
			})
		}
	});

	$(document).on('click', '.new-user-apply .list-user i.fa-', function(){
		var self = $(this);
	});

});