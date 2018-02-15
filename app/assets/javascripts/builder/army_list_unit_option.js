jQuery(function($) {

    //Edit Extra item => Unit option
    $(document).on('change', '#army_list_unit_extra_items ul input[type=checkbox]', function(evt) {
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

    //Edit Unit option 
    $(document).on('change', '#army_list_unit_unit_options ul input', function(evt) {
        var self = $(this);

        if(self.prop('checked')){
            //one choise only
            var one_choise = self.closest('ul[data-one-choise="true"]');
            if(one_choise){
                one_choise.find('input:checked')
                .filter(function() {
                    if($(this).prop('id') == self.prop('id')){
                        return false;
                    }

                    var li = $(this).closest('li');

                    return li.find('#' + self.prop('id')).length == 0;
                })
                .each(function(){                
                    $(this).prop('checked', false);
                    $(this).change();
                });
            }
        }

        //activator
        $('#army_list_unit_unit_options strong[data-unit-option-activator]')
        .filter('[data-unit-option-activator!=""]')
        .each(function(){
            var $item = $(this);

            var checked = $('#builder_army_list_unit_unit_option_ids_' + $item.data('unit-option-activator')).prop('checked');

            if(checked){
                $item.removeClass("disable");
                $item.prop('disabled', false);
            }
            else {
                $item.addClass("disable");
                $item.prop('disabled', true);
                if($item.prop('checked')){
                    $item.prop('checked', false);
                    $item.change();
                }
            }
        });
    
        
        //max object magic 
        var max_magic_items = $('#army_list_unit_unit_options strong[data-is-magic-item="true"]')
                                .filter(function(){
                                    return !$(this).hasClass('disable');
                                })
                                .map(function(){
                                    return parseInt($(this).data('value-points'))
                                });

        var max_magic_item = Math.max.apply(null, max_magic_items);

        var current_max_magic_items = parseInt($('#army_list_unit_magic_items').data('value-points-limit'));
        if(current_max_magic_items != max_magic_item){

            $('#army_list_unit_magic_items').data('value-points-limit', max_magic_item);
            $('#army_list_unit_magic_items > h3 > span.max-points').html(max_magic_item);

            if(current_max_magic_items > max_magic_item){
                $('#army_list_unit_magic_items input:checked').each(function(){
                    var $item = $(this);
                    $item.prop('checked', false);
                    $item.change();
                });
            }
        }
    });
});