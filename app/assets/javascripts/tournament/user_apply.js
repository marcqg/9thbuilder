jQuery(document).ready(function() {


	$('.new-user-apply .add-username button').click(function(e){

		var content = $('.new-user-apply .add-username textarea').val();
		if(content.length > 0){
			var lines = content.split("\n");
			// Removes all falsy values 
			lines = lines.filter(function(array_val) { // creates an anonymous filter func
			    var x = Boolean(array_val); // checks if val is null
			    return x == true; // returns val to array if not null
			  });

			var users = parseInt($('.new-user-apply h1 .nb-user').text());
			var userMax = parseInt($('.new-user-apply h1 .nb-user').data('user-max'));

			if((lines.length + users) > userMax){
				alert('You can add more than ' + userMax + ' users.');
				return;
			}

			var eventId = $('.new-user-apply .add-username #tournament_event_id').val();
			var versionId = $('.new-user-apply .add-username #tournament_version_id').val();

			$.ajax({
				url: '/ninth_age/version-' + versionId + '/armies.json',
				method: 'GET',
				contentType: 'application/json',
				success: function(armies) {
		
					$.ajax({
					    url: '/tournament/event-' + eventId + '/user_applies/multi.json',
					    method: 'POST',
					    contentType: 'application/json',
					    data: JSON.stringify({ names: lines }),
					    success: function(result) {

					    	$.each(result, function(i, item){

					    		line = $('<li id="'+item.id+'" data-id="'+item.id+'"><div class="user_apply_overview"><div class="position">' + ("0" + item.position).slice(-2) + '</div>\
					    			<div class="name"><strong>' + item.name.substring(0,32) + '</strong></div>\
					    			<div class="army"><select name="user_apply[army_id]" id="user_apply_army_id"><option value="">Select an army</option></select></div>\
					    			<div class="actions pull-right"><i class="fa fa-2x fa-trash" data-url="/tournament/event-' + item.event_id + '/user_applies/' + item.id + '"></i></div>\
					    			<div class="clearboth"></div></div></li>');
								
								$select = line.find('select')
		
								$.each(armies, function(i, army){
									$select.append('<option value="' + army.id + '">' + army.name + '</option>');
								});
								    			
								$('.new-user-apply .list-user').append(line);
							});		
		
					    	//Add users to counter
							var users = parseInt($('.new-user-apply h1 .nb-user').text());
							$('.new-user-apply h1 .nb-user').text((users + result.length));

							$('.new-user-apply .add-username textarea').val('');
						},
						error: function(request,msg,error) {
						    // handle failure
						}
					});
				},
				error: function(request,msg,error) {
				    // handle failure
				}
			});
		}
	});

	$(document).on('click', '.new-user-apply .list-user .actions .fa-trash', function(event){
		event.stopPropagation();
		event.preventDefault();

		var self = $(this);

		$.ajax({
			url: self.data('url') + '.json',
			method: 'DELETE',
			success: function(result) {

				self.closest('li').remove();

				var users = parseInt($('.new-user-apply h1 .nb-user').text());
				$('.new-user-apply h1 .nb-user').text((users - 1));
			},
		    error: function(request,msg,error) {
		        // handle failure
		    }
		});
	});

	$('.list-user')
        .sortable({
            handle: '.position',
            update: function(event, ui) {
                $.post($(this).data('url'), $(this).sortable('serialize'), function() {
                    $('.list-user .position').each(function(index) {
                        $(this).html(index < 9 ? '0' + (index + 1) : index + 1);
                    });
                });
            }
        });

    $(document).on('change', '.new-user-apply .list-user select', function(event){
		event.stopPropagation();
		event.preventDefault();

		var self = $(this);

		var eventId = $('.new-user-apply .add-username #tournament_event_id').val();
		var id = self.closest('li').data('id');

		$.ajax({
			url: '/tournament/event-' + eventId + '/user_applies/' + id + '.json',
			method: 'PUT',
			contentType: 'application/json',
			data: JSON.stringify({tournament_user_apply: { army_id: self.val() }}),
			success: function(result) {
				console.log('army updated');
			},
		    error: function(request,msg,error) {
		        // handle failure
		    }
		});
	});

});