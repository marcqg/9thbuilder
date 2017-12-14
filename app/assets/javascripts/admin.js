//= require_tree ./common

jQuery(function($) {
  // UNIT OPTION - ARMY_FILTER
  $('#ninth_age_unit_option_unit_id').clone().attr('id', 'ninth_age_unit_option_unit_id_clone').hide().appendTo('body');
  $('#ninth_age_unit_option_parent_id').clone().attr('id', 'ninth_age_unit_option_parent_id_clone').hide().appendTo('body');
  $('#ninth_age_unit_option_mount_id').clone().attr('id', 'ninth_age_unit_option_mount_id_clone').hide().appendTo('body');

  $('#ninth_age_unit_option_army_filter').change(function() {
    var $filter = $(this).find('option[value="' + this.value + '"]');

    $('#ninth_age_unit_option_unit_id').html($('#ninth_age_unit_option_unit_id_clone').html());

    $('#ninth_age_unit_option_unit_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });

    $('#ninth_age_unit_option_parent_id').html($('#ninth_age_unit_option_parent_id_clone').html());

    $('#ninth_age_unit_option_parent_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });

    $('#ninth_age_unit_option_mount_id').html($('#ninth_age_unit_option_mount_id_clone').html());

    $('#ninth_age_unit_option_mount_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });
  }).change();

  $('#ninth_age_unit_option_unit_id').change(function() {
    var $filter = $(this).find('option[value="' + this.value + '"]');

    $('#ninth_age_unit_option_parent_id').html($('#ninth_age_unit_option_parent_id_clone').html());

    $('#ninth_age_unit_option_parent_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });
  }).change();

  // UNIT OPTION - PARENT
  $('#ninth_age_unit_option_unit_id').change(function() {
    var $filter = $(this).find('option[value="' + this.value + '"]');

    $('#ninth_age_unit_option_parent_id').html($('#unit_option_parent_id_clone').html());

    $('#ninth_age_unit_option_parent_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });
  }).change();

  // EQUIPEMENT - ARMY_FILTER
  $('#ninth_age_equipment_unit_troop_unit_id').clone().attr('id', 'ninth_age_equipment_unit_troop_unit_id_clone').hide().appendTo('body');
  $('#ninth_age_equipment_unit_troop_troop_id').clone().attr('id', 'ninth_age_equipment_unit_troop_troop_id_clone').hide().appendTo('body');

  $('#ninth_age_equipment_unit_troop_army_filter').change(function() {
    var $filter = $(this).find('option[value="' + this.value + '"]');

    $('#ninth_age_equipment_unit_troop_unit_id').html($('#ninth_age_equipment_unit_troop_unit_id_clone').html());

    $('#ninth_age_equipment_unit_troop_unit_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });

    $('#ninth_age_equipment_unit_troop_troop_id').html($('#ninth_age_equipment_unit_troop_troop_id_clone').html());

    $('#ninth_age_equipment_unit_troop_troop_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });
  }).change();

  // EQUIPEMENT - TROOP
  $('#ninth_age_equipment_unit_troop_unit_id').change(function() {
    var $filter = $(this).find('option[value="' + this.value + '"]');

    $('#ninth_age_equipment_unit_troop_troop_id').html($('#ninth_age_equipment_unit_troop_troop_id_clone').html());

    $('#ninth_age_equipment_unit_troop_troop_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });
  }).change();

  // SPECIAL_RULE - ARMY_FILTER
  $('#ninth_age_special_rule_unit_troop_unit_id').clone().attr('id', 'ninth_age_special_rule_unit_troop_unit_id_clone').hide().appendTo('body');
  $('#ninth_age_special_rule_unit_troop_troop_id').clone().attr('id', 'ninth_age_special_rule_unit_troop_troop_id_clone').hide().appendTo('body');

  $('#ninth_age_special_rule_unit_troop_army_filter').change(function() {
    var $filter = $(this).find('option[value="' + this.value + '"]');

    $('#ninth_age_special_rule_unit_troop_unit_id').html($('#ninth_age_special_rule_unit_troop_unit_id_clone').html());

    $('#ninth_age_special_rule_unit_troop_unit_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });

    $('#ninth_age_special_rule_unit_troop_troop_id').html($('#ninth_age_special_rule_unit_troop_troop_id_clone').html());

    $('#ninth_age_special_rule_unit_troop_troop_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });
  }).change();

  // SPECIAL_RULE - TROOP
  $('#ninth_age_special_rule_unit_troop_unit_id').change(function() {
    var $filter = $(this).find('option[value="' + this.value + '"]');

    $('#ninth_age_special_rule_unit_troop_troop_id').html($('#ninth_age_special_rule_unit_troop_troop_id_clone').html());

    $('#ninth_age_special_rule_unit_troop_troop_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });
  }).change();

  // TROOP - ARMY_FILTER
  $('#ninth_age_troop_unit_id').clone().attr('id', 'ninth_age_troop_unit_id_clone').hide().appendTo('body');
  $('#ninth_age_troop_unit_option_id').clone().attr('id', 'ninth_age_troop_unit_option_id_clone').hide().appendTo('body');

  $('#ninth_age_troop_army_filter').change(function() {
    var $filter = $(this).find('option[value="' + this.value + '"]');

    $('#ninth_age_troop_unit_id').html($('#ninth_age_troop_unit_id_clone').html());

    $('#ninth_age_troop_unit_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });

    $('#ninth_age_troop_unit_option_id').html($('#ninth_age_troop_unit_option_id_clone').html());

    $('#ninth_age_troop_unit_option_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });
  }).change();

  // TROOP - UNIT_OPTION
  $('#ninth_age_troop_unit_id').change(function() {
    var $filter = $(this).find('option[value="' + this.value + '"]');

    $('#ninth_age_troop_unit_option_id').html($('#ninth_age_troop_unit_option_id_clone').html());

    $('#ninth_age_troop_unit_option_id option').each(function() {
      var $option = $(this);

      if ($filter.html() && $option.html() && $option.html().indexOf($filter.html() + ' - ') !== 0) {
        $option.remove();
      }
    });
  }).change();

  // UNIT SHOW - SORTABLE
  $('.ninth_age_unit_equipments_details table')
    .sortable({
      items: 'tbody tr',
      helper: function(e, ui) {
        ui.children().each(function() {
          $(this).width($(this).width());
        });
        return ui;
      },
      update: function(event, ui) {
        $.post($(this).data('url'), $(this).sortable('serialize'), function() {
          $('.ninth_age_unit_equipments_details table').load(window.location.href + ' .unit_equipments_details table > *');
        });
      }
    })
    .disableSelection()
  ;

  $('.ninth_age_unit_special_rules_details table')
    .sortable({
      items: 'tbody tr',
      helper: function(e, ui) {
        ui.children().each(function() {
          $(this).width($(this).width());
        });
        return ui;
      },
      update: function(event, ui) {
        $.post($(this).data('url'), $(this).sortable('serialize'), function() {
          $('.ninth_age_unit_special_rules_details table').load(window.location.href + ' .unit_special_rules_details table > *');
        });
      }
    })
    .disableSelection()
  ;
});
