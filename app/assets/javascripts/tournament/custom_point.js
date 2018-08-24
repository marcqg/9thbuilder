jQuery(document).ready(function() {

    $('.list-user-custom-points input').bind('input', function(){
        var self = $(this);
        var $tr = self.closest('tr');

        var json = {};
        $tr.find('input')
            .each(function(i){
                json[$(this).attr('id')] = $(this).val();
            });

        var sum = 0;
        $.each(Object.keys(json), function(){
            sum += parseFloat(json[this]) || 0;
        });
    
        $tr.find('span.total')
            .text(sum);

        var eventId = $tr.data('event-id');
        var cutomPointId = $tr.data('custom-point-id');

        $.ajax({
            url: '/tournament/event-' + eventId + '/custom_points/' + cutomPointId + '.json',
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({
                tournament_custom_point: json
            }),
            success: function(result) {
                console.log('points updated');
            },
            error: function(request, msg, error) {
                // handle failure
            }
        });
    });
});