//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree ./common
//= require_tree ./builder
//= require_tree ./paint
//= require_tree ./tournament

//= require cocoon

//= require bootstrap
//= require moment
//= require bootstrap-datetimepicker

//= require js-routes


jQuery(function($) {

    $(document).on('click', 'button[data-url]:not([data-popin])', function(evt) {
        evt.preventDefault();

        var url = $(this).data('url'),
            params = $(this).data('params') || null;

        if (params) {
            url = url + '?' + params;
        }

        if ($(this).data('target') == '_blank') {
            window.open(url);
        } else {
            window.location = url;
        }
    });

    $(document).on('click', 'a[data-popin], button[data-popin]', popinHandler);
    $(document).on('submit', 'form[data-popin]', popinHandler);
    $(document).on('change', 'input[name=include_magics]', function() {
        var checked = $(this).prop('checked'),
            $popin = $(this).closest('.popin');

        $popin.find('button[data-url]').each(function() {
            if (checked) {
                $(this).data('url', $(this).data('url').replace('_nomagics', '_magics'));
            } else {
                $(this).data('url', $(this).data('url').replace('_magics', '_nomagics'));
            }
        });
    });

    $('.army_list_units_overview')
        .sortable({
            handle: '.position',
            update: function(event, ui) {
                $.post($(this).data('url'), $(this).sortable('serialize'), function() {
                    $('.army_list_units_overview .position').each(function(index) {
                        $(this).html(index < 9 ? '0' + (index + 1) : index + 1);
                    });
                });
            }
        });

    $(document).on('click', '.army_list_unit_overview .name', function() {
        $(this).closest('.army_list_unit_overview').next('.army_list_unit_details').slideToggle('fast');
    });

    $(document).on('change', '.army_list_unit_overview .actions select, #subheader .actions select', function() {
        $(this).closest('form').attr('action', $(this).val());
    });

    $(document).on('click', '#army_list_unit_magic_items ul li strong', function() {
        $('#army_list_unit_magic_items ul li ul').not($(this).next('ul')).slideUp('fast');
        $(this).next('ul').slideToggle('fast', function() { $.colorbox.resize(); });
    });

    $(document).on('click', '#army_list_unit_extra_items ul li strong', function() {
        $('#army_list_unit_extra_items ul li ul').not($(this).next('ul')).slideUp('fast');
        $(this).next('ul').slideToggle('fast', function() { $.colorbox.resize(); });
    });

    $("div[data-provide='datetimepicker']").datetimepicker();
});

function popinHandler(evt) {
    evt.preventDefault();

    var $this = $(this),
        url;

    if ($this.is('a')) {
        url = $this.attr('href');
    } else if ($this.is('form')) {
        url = $(this).attr('action');
    } else if ($this.is('[data-url]')) {
        url = $(this).data('url');
    }

    popin(url);
}

function popin(url) {
    $.colorbox({
        href: url,
        close: '',
        opacity: 0.4,
        returnFocus: false,
        scrolling: false,
        onComplete: function() {
            $('#cboxClose').css('opacity', 1);
            $('#cboxLoadedContent form :input:visible:first').focus();

            var masters = [];
            $('#builder_army_list_unit_unit_options input[data-depend], #builder_army_list_unit_magic_items input[data-depend], #builder_army_list_unit_extra_items input[data-depend], #builder_army_list_unit_magic_standards input[data-depend]').each(function() {
                var selector = '#army_list_unit_unit_option_ids_' + $(this).data('depend');

                if ($.inArray(selector, masters) < 0) {
                    masters.push(selector);
                }
            });

            $(masters.join(', ')).change();

            $('#builder_army_list_unit_magic_items input:first').change();
            $('#builder_army_list_unit_extra_items input:first').change();
        },
        onClosed: function() {
            $('#cboxClose').css('opacity', 0);
        }
    });

}