jQuery(document).ready(function() {

    $(document).on('input', 'div.points input', function() {

        var self = $(this);

        var points = self.val();
        var eventId = self.data('event-id');
        var roundId = self.data('round-id');
        var matchId = self.data('match-id');

        console.log('points', points);
        console.log('matchId', matchId);

        $.ajax({
            url: '/tournament/event-' + eventId + '/round-' + roundId + '/matches/' + matchId + '.json',
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({
                tournament_match: {
                    points: points
                }
            }),
            success: function(result) {
                console.log('match updated');
            },
            error: function(request, msg, error) {
                // handle failure
            }
        });
    });
});