jQuery(document).ready(function() {

	$('.paint_list_units tbody tr td[class^="step"]').click(function(){
		var self = $(this);

		var state = self.data('state');
		var step = self.data('step');
		var step_id = self.data('step-id');

		self.removeClass('waiting')
				.removeClass('wip')
				.removeClass('done');

		switch(state){
			case 'waiting':
				self.html('wip');
				self.data('state', 'wip');
				self.addClass('wip');
				state = 'wip';
			break;
			case 'wip':
				self.html('done');
				self.data('state', 'done');
				self.addClass('done');
				state = 'done';
			break;
			case 'done':
				self.html('-');
				self.data('state', 'waiting');
				self.addClass('waiting');
				state = 'waiting';
			break;
		}

		$.ajax({
		    url: '/paint/paint_list_units/' + self.data('id') + '.json',
		    method: 'PUT',
		    contentType: 'application/json',
		    data: JSON.stringify({paint_paint_list_unit: { step: step, state: state }}),
		    success: function(result) {
		        // handle success
		    },
		    error: function(request,msg,error) {
		        // handle failure
		    }
		});

		self.parent()
		.find('td')
		.filter(function(){
			return $(this).data('step-id') < step_id && $(this).hasClass('step');
		})
		.each(function(index, item){
			var $item = $(item);
			
			if(state == 'wip' || state == 'done'){

				$item.removeClass('waiting')
					.removeClass('wip')
					.removeClass('done');

				$item.html('DONE');
				$item.data('state', 'done');
				$item.addClass('done');	
			}
		});

		self.parent()
		.find('td')
		.filter(function(){
			return $(this).data('step-id') > step_id && $(this).hasClass('step');
		})
		.each(function(index, item){
			var $item = $(item);

			if(state != 'done'){
				$item.removeClass('waiting')
					.removeClass('wip')
					.removeClass('done');

				$item.html('-');
				$item.data('state', 'waiting');
				$item.addClass('waiting');	
			}
		});

	});

	$('.paint_list_units tbody tr .fa-edit').click(function(){
		var self = $(this);

		self.addClass('hidden');
		self.parent().parent().find('span.size').addClass('hidden');
		self.parent().parent().find('input.edit-size').removeClass('hidden');
		self.parent().find('.comment').addClass('hidden');
		self.parent().find('.edit-comment').removeClass('hidden');
		self.parent().find('.fa-save').removeClass('hidden');

		var text = self.parent().find('.comment').text();

		self.parent().find('.edit-comment').val(text);

		var text = self.parent().parent().find('span.size').text();

		self.parent().parent().find('input.edit-size').val(text);
	});

	$('.paint_list_units tbody tr .fa-save').click(function(){
		var self = $(this);

		self.addClass('hidden');
		self.parent().parent().find('span.size').removeClass('hidden');
		self.parent().parent().find('input.edit-size').addClass('hidden');
		self.parent().find('.edit-comment').addClass('hidden');
		self.parent().find('.comment').removeClass('hidden');
		self.parent().find('.fa-edit').removeClass('hidden');

		var comment = self.parent().find('.edit-comment').val();

		self.parent().find('.comment').text(comment);

		var size = self.parent().parent().find('input.edit-size').val();

		self.parent().parent().find('span.size').text(size);

		$.ajax({
		    url: '/paint/paint_list_units/' + self.data('comment-id') + '.json',
		    method: 'PUT',
		    contentType: 'application/json',
		    data: JSON.stringify({paint_paint_list_unit: { comment: comment, size: size }}),
		    success: function(result) {
		        // handle success
		    },
		    error: function(request,msg,error) {
		        // handle failure
		    }
		});
	});

	$('.show-paint-list .fa-plus').click(function(){
		var self = $(this);

		var unit_id = $('.show-paint-list #unit_id').val();
		console.log('unit_id', unit_id);

		$.ajax({
		    url: '/paint/paint_list_units.json',
		    method: 'POST',
		    contentType: 'application/json',
		    data: JSON.stringify({paint_paint_list_unit: { unit_id: unit_id }}),
		    success: function(result) {
		        // handle success
		    },
		    error: function(request,msg,error) {
		        // handle failure
		    }
		});
	})

});