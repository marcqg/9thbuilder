jQuery(function($) {

	$(document).on('change', '#army_list_unit_magic_items ul input[type=checkbox]', function(evt) {
        var self = $(this);

        var $current = self.parent().find('span.current');
        var $max = self.parent().find('span.max');

        if($max.length == 0){
        	return;
        }

        if(self.prop('checked')){
        	$current.data('count', parseInt($current.data('count')) + 1);
        	$current.html($current.data('count'));
        }
        else {
        	$current.data('count', parseInt($current.data('count')) - 1);
        	$current.html($current.data('count'));
        }
    });
});


