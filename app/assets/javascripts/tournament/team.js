jQuery(document).ready(function() {
    
    $('.autocomplete-user-name').devbridgeAutocomplete({
        serviceUrl: '/tournament/searchs/users',
        onSelect: function (suggestion) {
            console.log('data', suggestion.data);

            var section = $(this).closest('.team-user');
            section.find('.user_apply_user_id').val(suggestion.data.id);
            section.find('.user_apply_email').val(suggestion.data.email);
        }
    });

    $('.form-team-user').on('cocoon:after-insert', function(e, insertedItem) {
        $('.autocomplete-user-name').devbridgeAutocomplete({
            serviceUrl: '/tournament/searchs/users',
            onSelect: function (suggestion) {
                console.log('data', suggestion.data);
    
                var section = $(this).closest('.team-user');
                section.find('.user_apply_user_id').val(suggestion.data.id);
                section.find('.user_apply_email').val(suggestion.data.email);
            }
        });
    });
});