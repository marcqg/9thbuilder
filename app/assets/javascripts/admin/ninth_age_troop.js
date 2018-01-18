jQuery(function($) {

    //Edit NinthAge::Troop
    $('#edit_ninth_age_troop #ninth_age_troop_type_carac').change(function() {
        var self = $(this);

        self.find("option").each(function() {
            if ($(this).val() != self.val()) {
                $('#ninth_age_troop_carac_' + $(this).val().toLowerCase()).hide();
            }
        });

        $('#ninth_age_troop_carac_' + self.val().toLowerCase()).show();

    });
    $('#edit_ninth_age_troop #ninth_age_troop_type_carac').change();

    //Show NinthAge::Troop
    if ($('.show.admin_ninth_age_troops').length) {

    	var type_carac = $('.show.admin_ninth_age_troops .panel_contents .row-type_carac td').text().toLowerCase();
    	console.log('type_carac', type_carac);

    	$('.show.admin_ninth_age_troops .ninth_age_troop_carac').hide();
    	$('.show.admin_ninth_age_troops #ninth_age_troop_carac_' + type_carac).show();
    }
});