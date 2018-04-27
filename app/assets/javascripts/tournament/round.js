jQuery.fn.swapWith = function(to) {
    return this.each(function() {
        var copy_to = $(to).clone();
        var copy_from = $(this).clone();
        $(to).replaceWith(copy_from);
        $(this).replaceWith(copy_to);
    });
};

 jQuery(document).ready(function() {

	options = { revert: true };

    $("div.round_match").draggable(options);
    $('div.matches').droppable({
        drop: function(event, ui) {
        window.setTimeout(function(){
            $('#one').swapWith($('#two'));
            $("div.round_match").draggable(options);
        }, 600);
        }
    });
});