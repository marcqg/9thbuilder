jQuery(document).ready(function() {

    var dragLastPlace;
    var movedLastPlace;

    function updateMatch(eventId, roundId, matchId, table){
      $.ajax({
                url: '/tournament/event-' + eventId + '/round-' + roundId + '/matches/' + matchId + '.json',
                method: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify({
                    tournament_match: {
                        table: table
                    }
                }),
                success: function(result) {
                    console.log('match updated');
                },
                error: function(request, msg, error) {
                    // handle failure
                }
            });
    }


    $('.round_match').draggable({
        placeholder: 'placeholder',
        //helper: 'clone',
        zIndex: 1000,
        //containment: 'table',
        revert: function(is_valid_drop){
          $(this).show();
        },
        scope: "items",
        helper: function(evt) {
          var that = $(this).clone().get(0);
          $(that).find('.old-matches').hide();
          $(this).hide();
          return that;
        },
        start: function(evt, ui) {
            dragLastPlace = $(this).parent();
        },
        cursorAt: {
            top: 20,
            left: 20
        }
    });

    $('.match-place').droppable({
        hoverClass: 'placeholder',
        scope: "items",
        drop: function(evt, ui) {
            console.log('drop');
            //if($('.ui-state-hover').size() > 0) {return false;}
            //if($('.placeholder').length == 0) { return false;}

            if(!dragLastPlace){
              return;
            }

            var draggable = ui.draggable;
            var droppable = this;

            $(this).removeClass('over');

            if ($(droppable).children('.round_match:visible:not(.ui-draggable-dragging)').length > 0) {
                $(droppable).children('.round_match:visible:not(.ui-draggable-dragging)').detach().prependTo(dragLastPlace);
            }

            $(draggable).detach().css({
                top: 0,
                left: 0
            }).prependTo($(droppable)).show();

            console.log('$(droppable)', $(droppable));
            console.log('$(dragLastPlace)', $(dragLastPlace));

            var eventId = $(droppable).closest('.match-players').data('event-id');
            var roundId = $(droppable).closest('.match-players').data('round-id');

            var matchDropId = $(droppable).data('match-id');
            var tableDropId = $(droppable).closest('.match-players').data('table-id');

            var matchDragId = $(dragLastPlace).data('match-id');
            var tableDragId = $(dragLastPlace).closest('.match-players').data('table-id');

            updateMatch(eventId, roundId, matchDragId, tableDropId);
            updateMatch(eventId, roundId, matchDropId, tableDragId);

            movedLastPlace = undefined;
        },
        over: function(evt, ui) {
            var draggable = ui.draggable;
            var droppable = this;

            $(this).addClass('over');

            if (movedLastPlace) {
                $(dragLastPlace).children().not(draggable).detach().prependTo(movedLastPlace);
            }

            if ($(droppable).children('.round_match:visible:not(.ui-draggable-dragging)').length > 0) {
                $(droppable).children('.round_match:visible').detach().prependTo(dragLastPlace);
                movedLastPlace = $(droppable);
            }
        },
        out: function(evt, ui) {
            $(this).removeClass('over');
        }
    })
});