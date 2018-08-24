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

        /**
     * Update all value_points when the size of the unit change
     */
    $(document).on('change', '#army_list_unit_magic_items ul .magic-item-quantity', function() {
        var self = $(this);
        var size = parseInt(self.val());

        var value_points = size * parseFloat(self.parent().find('label input').data('value-points'));

        self.parent().find('em span').html(String(value_points).replace('.', ','));
        self.parent().find('em span').data('value-points', value_points);

        self.parent().find('label input').change();
    });
});


