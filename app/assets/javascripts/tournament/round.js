jQuery(document).ready(function() {

var dragLastPlace;
var movedLastPlace;


$('.round_match').draggable({
  placeholder: 'placeholder',
  zIndex: 1000,
  containment: 'table',
  helper: function(evt) {
    var that = $(this).clone().get(0);
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
  drop: function(evt, ui) {
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