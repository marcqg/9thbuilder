jQuery(document).ready(function() {

	$(document).on('click', '.paint_list_units tbody tr td[class^="step"]', function(){
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

	$(document).on('click', '.paint_list_units tbody tr .fa-edit', function(){
		var self = $(this);

		self.addClass('hidden');
		self.parent().parent().find('span.size').addClass('hidden');
		self.parent().parent().find('input.edit-size').removeClass('hidden');
		self.parent().find('.comment').addClass('hidden');
		self.parent().find('.edit-comment').removeClass('hidden');
		self.parent().find('.fa-save').removeClass('hidden');
		self.parent().find('.fa-trash').addClass('hidden');

		var text = self.parent().find('.comment').text();

		self.parent().find('.edit-comment').val(text);

		var text = self.parent().parent().find('span.size').text();

		self.parent().parent().find('input.edit-size').val(text);
	});

	$(document).on('click', '.paint_list_units tbody tr .fa-save', function(){
		var self = $(this);

		self.addClass('hidden');
		self.parent().parent().find('span.size').removeClass('hidden');
		self.parent().parent().find('input.edit-size').addClass('hidden');
		self.parent().find('.edit-comment').addClass('hidden');
		self.parent().find('.comment').removeClass('hidden');
		self.parent().find('.fa-edit').removeClass('hidden');
		self.parent().find('.fa-trash').removeClass('hidden');

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

	$(document).on('click', '.paint_list_units tbody tr .fa-trash', function(){
		var self = $(this);

		$.ajax({
		    url: '/paint/paint_list_units/' + self.data('comment-id') + '.json',
		    method: 'DELETE',
		    dataType: "json",
      		contentType: "application/json; charset=utf-8"
		})
		.done(function() {
		    	console.log('delete');
		        self.closest('tr').remove();
		    })
		.fail(function(request,msg,error) {
		    	console.log('delete msg', msg);
		    	console.log('delete error', error);
		    });
	});

	$(document).on('click', '.show-paint-list .fa-plus', function(){
		var self = $(this);

		var unit_id = $('.show-paint-list #unit_id').val();
		console.log('unit_id', unit_id);
		var paint_list_id = self.data('paint-list-id');

		$.ajax({
		    url: '/paint/paint_list_units.json',
		    method: 'POST',
		    contentType: 'application/json',
		    data: JSON.stringify({paint_paint_list_unit: { paint_list_id: paint_list_id, unit_id: unit_id, size: 1 }}),
		    success: function(result) {
		        var $tr = $('<tr/>');
		        $('.paint_list_units tbody').append($tr);

		        $tr.append('<td>' + $('.show-paint-list #unit_id option:selected').text() + '</td>');
		        $tr.append('<td class="size"><span class="size" id="size-' + result.id + '">' + result.size + '</span><input type="number" min="1" name="size" class="edit-size hidden" id="edit-size-' + result.id + '"></td>');
    	  	
    	  		var steps = ['buy', 'trimmed', 'assembled', 'first_color', 'paint', 'plinth'];
    	  		for(var i = 0; i < steps.length; i++){
    	  			$tr.append('<td class="step" data-step-id="' + (i + 1) + '" data-id="' + result.id + '" data-step="' + steps[i] + '" data-state="waiting">-</td>');
    	  		}

    	  		$tr.append('<td><span class="comment" id="comment-' + result.id + '"></span><input type="text" name="comment" class="edit-comment hidden" id="edit-comment-' + result.id + '"><i class="fa fa-trash fa-2x pull-right"  data-comment-id="' + result.id + '"></i><i class="fa fa-edit fa-2x pull-right"  data-comment-id="' + result.id + '"></i><i class="fa fa-save fa-2x pull-right hidden" data-comment-id="' + result.id + '"></i></td>');
		    },
		    error: function(request,msg,error) {
		        // handle failure
		    }
		});
	});

});