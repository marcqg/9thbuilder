jQuery(function($) {

    //Edit Extra item
    $(document).on('change', '#army_list_unit_extra_items ul input[type=checkbox], #army_list_unit_extra_items ul input[type=radio]', function(evt) {
        var self = $(this);

        if(self.data('is-unique')){
            self.closest('ul')
            .find('input')
            .each(function(){
                if($(this).prop("id") != self.prop("id")){
                    $(this).prop('checked', false);
                }
            });
        }

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

    //Edit Unit option
    $(document).on('change', '#army_list_unit_extra_items ul input[type=checkbox], #army_list_unit_extra_items ul input[type=radio]', function(evt) {
        var self = $(this);

        var extra_item_id = self.val();

        $('#army_list_unit_unit_options strong:not([data-extra-item="' + extra_item_id + '"])').each(function(){
            var $item = $(this);

            if($item.data('extra-item')){

                $item.addClass("disable");
                $item.parent().find('ul').hide();
                $item.parent().find('ul input').each(function(){
                    if($(this).prop('checked')){
                        $(this).prop('checked', false);
                        $(this).change();
                    }
                });
            }
        });

        var $element = $('#army_list_unit_unit_options strong[data-extra-item="' + extra_item_id + '"]');
        if(self.prop('checked')){
            $element.removeClass("disable");
            $element.parent().find('ul').show();
        }
        else {
            $element.addClass("disable");
            $element.parent().find('ul').hide();
            $element.parent().find('ul input').each(function(){
                if($(this).prop('checked')){
                    $(this).prop('checked', false);
                    $(this).change();
                }
            });
        }
    });
});