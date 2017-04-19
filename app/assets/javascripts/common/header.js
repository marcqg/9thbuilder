jQuery(function($) {

    $('#header .welcome strong').click(function () {
        $(this).toggleClass('over');
        $('#header .menu').css('width', $(this).css('width')).toggle();
    });

    $('#header .welcome .lang').click(function () {
        $(this).toggleClass('over');
        $('#header .menu-lang').toggle("slow");
    });

    $('body').click(function (evt) {
        $('#header .menu').hide();
        $('#header .welcome strong').removeClass('over')
    });

    $('#header').click(function (evt) {
        evt.stopPropagation();
    });
});