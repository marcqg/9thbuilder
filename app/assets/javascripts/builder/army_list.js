jQuery(function($) {

    /**
     * Update all value_points when the size of the unit change
     */
    $(document).on('change', '.edit_builder_army_list_unit #army_list_unit_troops .army_list_unit_troop_size', function() {
        var self = $(this);
        var size = parseInt(self.val());
        $('.edit_builder_army_list_unit #army_list_unit_troops .army_list_unit_troop_size_value').text(size);

        //Update options when the size of the unit changes
        if (self.attr('id') == 'builder_army_list_unit_army_list_unit_troops_attributes_0_size') {
            console.log('$(#army_list_unit_unit_options input[data-per-model])', $('#army_list_unit_unit_options input[data-per-model]').length);
            $('#army_list_unit_unit_options input[data-per-model]').each(function() {
                var value_points = size * parseFloat(self.data('value-points'));

                self.parent('label').prev('em').find('span').html(String(value_points).replace('.', ','));
                self.parent('label').next('input').val(size);
            });
        }

        updateArmyListUnitValuePoints();
    });

    $(document).on('keyup', '.edit_builder_army_list_unit #army_list_unit_unit_options .army_list_unit_unit_option_quantity', function() {
        var self = $(this);
        var quantity = parseInt($(this).val());

        if (isNaN(quantity)) return false;

        var value_points = quantity * parseFloat(self.prev('label').find('input[data-is-multiple]').data('value-points'));

        self.prev('label').prev('em').find('span').html(String(value_points).replace('.', ','));

        updateArmyListUnitValuePoints();
    });


    $(document).on('change', '.army_list_unit_add_element ul li input[type=checkbox], .army_list_unit_add_element ul li input[type=radio]', function(evt) {
        var total = 0.0,
            $changed = $(this),
            $siblings = $changed.closest('ul').find('> li > label input[data-radio]').not($changed),
            $div = $changed.closest('div');

        $div.find('.magic-item-quantity').prop('disabled', true);

        if ($div.attr('id') == 'army_list_unit_magic_items' ||
            $div.attr('id') == 'army_list_unit_extra_items') {
            $div.find('strong').addClass('empty');
        }


        var limite = parseFloat($div.data('value-points-limit'));

        //Magic item dominant
        if($(this).data('dominant')){
            $div.find('input:checkbox')
            .filter(function(){
                var self = $(this);
                
                return (self.data('dominant') && self.prop('checked') && self.attr("id") != $changed.attr("id"));
            })
            .each(function(){
                var self = $(this);
                self.prop('checked', false);
                self.change();
            });
        }

        $div.find('input:checked').each(function() {
            var self = $(this);

            var $parent = self.closest('li');

            self.closest('ul').prev('strong').removeClass('empty');

            var value_points = parseInt(self.data('value-points'));
            if(value_points < 1){
                return;
            }

            var $quantity = $parent.find('.magic-item-quantity');
            if ($quantity.length) {
                $quantity.removeAttr('disabled');

                var max = Math.floor((limite - total) / value_points);
                $quantity.attr('max', max);

                value_points = value_points * parseInt($quantity.val());
            }

            total += value_points;
        });

        $div.find('input:checkbox:not(:checked)')
        .filter(function(){

            return $(this).closest('#army_list_unit_extra_items').length == 0;
        })
        .each(function() {
            var self = $(this);

            var $parent = self.closest('li');

            var points = self.data('value-points');

            if (points + total > limite) {
                self.prop('disabled', true);
                $parent.find('.magic-item-quantity').prop('disabled', true);
            } else {
                self.removeAttr('disabled');
                $parent.find('.magic-item-quantity').val(1);

                $quantities = $parent.find('.magic-item-quantity');
                if ($quantities.length) {

                    var max = Math.floor((limite - total) / points);
                    $quantities.attr('max', max);
                }
            }
        });

        updateArmyListUnitDepend($changed);

        updateArmyListUnitValuePoints();
    });

    $(document).on('change', '.army_list_unit_add_element ul li input[type=number]', function(evt) {
        var $changed = $(this);

        updateArmyListUnitDepend($changed);

        updateArmyListUnitValuePoints();
        
        var total = 0.0;
        var $div = $changed.closest('div');
        var limite = parseFloat($div.data('value-points-limit'));
        $div.find('input:checked').each(function() {
            var self = $(this);

            var $parent = self.closest('li');
            var value_points = parseFloat($parent.find('em > span').html().replace(',', '.'));

            $parent.find('.magic-item-quantity').removeAttr('disabled');
            var $quantity = $parent.find('.magic-item-quantity');

            if ($quantity.length) {

                var max = Math.floor((limite - total) / value_points);
                $quantity.attr('max', max);

                value_points = value_points * parseInt($quantity.val());
            } else {
                $quantity.val(1);
                value_points = value_points * 1;
            }

            total += value_points;
        });
        $div.find('input:checkbox:not(:checked)').each(function() {
            var self = $(this);

            var $parent = self.closest('li');

            var points = self.data('value-points');

            if (points + total > limite) {
                self.prop('disabled', true);
                $parent.find('.magic-item-quantity').prop('disabled', true);
            } else {
                self.removeAttr('disabled');
                $parent.find('.magic-item-quantity').val(1);

                $quantities = $parent.find('.magic-item-quantity');
                if ($quantities.length) {

                    var max = Math.floor((limite - total) / points);
                    $quantities.attr('max', max);
                }
            }
        });
    });

});

function updateArmyListUnitDepend($changed) {
    var $master = $changed.is('input[name$="[_destroy]"]') ? $changed.closest('li').find('> input[name$="[unit_option_id]"]') : $changed,
        $slaves = $('.edit_builder_army_list_unit input[data-depend=' + $master.val() + ']');

    if ($changed.prop('checked')) {
        $slaves.removeAttr('disabled');
    } else {
        $slaves.prop('disabled', true)
            .prop('checked', false)
            .each(function() {
                updateArmyListUnitDepend($(this));
            });
    }
}

/**
 * Update value_point in the unit form during the edition
 * @param $changed
 */
function updateArmyListUnitValuePoints() {
    $('.army_list_unit_add_element').each(function() {
        var total = 0.0,
            $div = $(this);

        $div.find('input:checked')
        .filter(function(){
            var $span_points = $(this).parent('label').prev('em').find('span');
            return ($span_points.length > 0);
        })
        .each(function() {

            var label = $(this).parent('label');

            var $span_points = label.prev('em').find('span');

            var value_points = parseFloat($span_points.data('value-points'));

            var $quantity = label.next('input[name$="[quantity]"]');

            if ($quantity.length) {
                value_points = parseFloat(value_points) * parseInt($quantity.val());

                if (isNaN(value_points)) {
                    return true;
                }
            }

            total += value_points;
        });

        $div.find('h3 span.points').html(String(total).replace('.', ','));
        $div.find('h3 span.points').data('value-points', total);
    });

    var total = 0.0,
        $popin = $('.popin');

    if ($('#army_list_unit_troops').length) {
        $('#army_list_unit_troops tr').each(function() {
            var size = parseInt($(this).find('.army_list_unit_troop_size').val()),
                value_points = parseFloat($(this).data('value-points')),
                min_size = parseInt($popin.find('h1').data('min-size')),
                unit_value_points = parseFloat($popin.find('h1').data('value-points'));

            if (isNaN(size)) return;

            total += unit_value_points;
            if (!isNaN(value_points)) {
                total += (size - min_size) * value_points;
            }
        });
    } else {
        total = parseFloat($popin.find('h1').data('value-points'));
    }


    $('.army_list_unit_add_element h3 span.points').each(function(index, item) {
        var entry = $(item);
        if (entry.length) {
            total += parseFloat(entry.data('value-points'));
        }
    });

    $popin.find('h1 span').html(String(total).replace('.', ','));
    $popin.find('h1 span').data('value-points', total);
}