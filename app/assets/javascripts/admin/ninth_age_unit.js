jQuery(function($) {

    //Create NinthAge::Unit
    $('#new_ninth_age_unit #ninth_age_unit_type_carac').change(function() {
        var self = $(this);

        self.find("option").each(function() {
            if ($(this).val() != self.val()) {
                $('#ninth_age_unit_carac_' + $(this).val().toLowerCase()).hide();
            }
        });

        $('#ninth_age_unit_carac_' + self.val().toLowerCase()).show();

    });
    $('#new_ninth_age_unit #ninth_age_unit_type_carac').change();

    //Edit NinthAge::Unit
    $('#edit_ninth_age_unit #ninth_age_unit_type_carac').change(function() {
        var self = $(this);

        self.find("option").each(function() {
            if ($(this).val() != self.val()) {
                $('#ninth_age_unit_carac_' + $(this).val().toLowerCase()).hide();
            }
        });

        $('#ninth_age_unit_carac_' + self.val().toLowerCase()).show();

    });
    $('#edit_ninth_age_unit #ninth_age_unit_type_carac').change();

    //Show NinthAge::Troop
    if ($('.show.admin_ninth_age_units').length) {

    	var type_carac = $('.show.admin_ninth_age_units .panel_contents .row-type_carac td').text().toLowerCase();
    	console.log('type_carac', type_carac);

    	$('.show.admin_ninth_age_units .ninth_age_unit_carac').hide();
    	$('.show.admin_ninth_age_units #ninth_age_unit_carac_' + type_carac).show();
    }

    $(document).on('change', '#army_list_unit_extra_items ul input[type=checkbox]', function(evt) {
    });
});