jQuery(function($) {

    $('.formtastic.ninth_age_unit_option #ninth_age_unit_option_category').change(function() {
        var self = $(this);
        
        var hidden = ["li[id$='_name_input']",
        "#ninth_age_unit_option_has_one_choise_input",
        "#ninth_age_unit_option_is_multiple_input",
        "#ninth_age_unit_option_is_required_input",
        "#ninth_age_unit_option_is_unique_choice_input",
        "#ninth_age_unit_option_is_per_model_input",
        
        "#ninth_age_unit_option_banner_limit_input",
        
        "#ninth_age_unit_option_extra_item_category_ids_input",
        
        "#ninth_age_unit_option_domain_magic_input",
        
        "#ninth_age_unit_option_mount_and_carac_points_input",
        "#ninth_age_unit_option_mount_input",
        
        "#ninth_age_unit_option_unit_link_input",
        "#ninth_age_unit_option_organisation_input",
        "#ninth_age_unit_option_extra_item_input",
        
        "#ninth_age_unit_option_max_input",
        "#ninth_age_unit_option_max_model_input",
        "#ninth_age_unit_option_min_model_input",
        "#ninth_age_unit_option_max_unit_input"];

        $.each(hidden, function(){
            $(this+"").hide();
        });
        
        switch (self.val()) {
            case 'General':
            case 'M':
            case 'S':
            case 'C':
                break;

            case 'MagicEquipment':
                $("li[id$='_name_input']").show();
                break;

            case 'BSB':
                $("#ninth_age_unit_option_banner_limit_input input").val(2);
                $("#ninth_age_unit_option_banner_limit_input").show();
                break;

            case 'MagicBanner':
                $("#ninth_age_unit_option_banner_limit_input input").val(1);
                $("#ninth_age_unit_option_banner_limit_input").show();
                break;

            case 'MagicPath':
                $("#ninth_age_unit_option_domain_magic_input").show();
                $("#ninth_age_unit_option_is_unique_choice_input").show();
                $("#ninth_age_unit_option_is_unique_choice_input").prop('checked', true);
                break;

            case 'Mount':
                $("#ninth_age_unit_option_mount_and_carac_points_input").show();
                $("#ninth_age_unit_option_mount_input").show();
                break;

            case 'Equipment':
                $("li[id$='_name_input']").show();
                $("#ninth_age_unit_option_has_one_choise_input").show();
                $("#ninth_age_unit_option_is_per_model_input").show();
                $('#ninth_age_unit_option_is_multiple_input').show();
                break;

            case 'ArmyAttribut':
                $("li[id$='_name_input']").show();
                $("#ninth_age_unit_option_has_one_choise_input").show();
                $("#ninth_age_unit_option_is_per_model_input").show();
                $('#ninth_age_unit_option_is_multiple_input').show();
                $("#ninth_age_unit_option_extra_item_category_ids_input").show();
                break;

            default:
                console.log('show');
                $.each(hidden, function(){
                    $(this+"").show();
                });
                break;
        }

    });
    $('.formtastic.ninth_age_unit_option #ninth_age_unit_option_category').change();

});