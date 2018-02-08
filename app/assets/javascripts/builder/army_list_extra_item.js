jQuery(function($) {

    //Counter for max use
	$(document).on('change', '#army_list_unit_extra_items ul input[type=checkbox]', function(evt) {
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

    //Edit Extra item
    $(document).on('change', '#army_list_unit_extra_items ul input[type=checkbox]', function(evt) {
        var self = $(this);

        $('#army_list_unit_extra_items ul label input[data-extra-item-activator]')
        .filter('[data-extra-item-activator!=""]')
        .each(function(){
            var $item = $(this);

            var checked = $('#builder_army_list_unit_extra_item_ids_' + $item.data('extra-item-activator')).prop('checked');

            if(checked){
                $item.parent().removeClass("disable");
                $item.prop('disabled', false);
            }
            else {
                $item.parent().addClass("disable");
                $item.prop('disabled', true);
                if($item.prop('checked')){
                    $item.prop('checked', false);
                    $item.change();
                }
            }
        });
    });

    //Unique extram item category
    $(document).on('change', '#army_list_unit_extra_items ul input[type=checkbox]', function(evt) {
        var self = $(this);

        if(self.data('is-unique') && self.prop('checked')){
            self.closest('ul')
            .find('input')
            .filter(function(){
                var $item = $(this);

                if($item.parent().hasClass('disable')){
                    return false;
                }

                if(!$item.prop('checked')){
                    return false;
                }

                return $item.prop("id") != self.prop("id");
            })
            .each(function(){
                var $item = $(this);

                $item.prop('checked', false);
                $item.change();
            });
        }
    });
});


