module Builder
  class ExportsController < ApplicationController

    # GET /army_lists/1/export
    # GET /army_lists/1/export_:verbosity_:magics.html
    # GET /army_lists/1/export_:verbosity_:magics.pdf
    def export
      @army_list = ArmyList.find_by_uuid!(params[:uuid])
      @verbosity = params[:verbosity]
      @include_magics = params[:magics] == 'nomagics' ? false : true

      @magics = NinthAge::DomainMagic.includes(:domain_magic_spells => [:translations])
                                      .includes(:translations)
                                      .joins(:unit_options)
                                      .joins('INNER JOIN builder_army_list_unit_unit_options ON builder_army_list_unit_unit_options.unit_option_id = ninth_age_unit_options.id')
                                      .joins('INNER JOIN builder_army_list_units ON builder_army_list_units.id = builder_army_list_unit_unit_options.army_list_unit_id')
                                      .where(builder_army_list_units: {army_list_id: @army_list.id})
                                      .with_locales(I18n.locale)
                                      .ordered
                                      .distinct

      @special_rules = NinthAge::SpecialRule.includes(:translations)
                                            .joins(:special_rule_unit_troops)
                                            .joins('INNER JOIN ninth_age_units u ON ninth_age_special_rule_unit_troops.unit_id = u.id')
                                            .joins('INNER JOIN builder_army_list_units ON u.id = builder_army_list_units.unit_id')
                                            .where(builder_army_list_units: {army_list_id: @army_list.id})
                                            .where.not(:army_id => @army_list.army_id).includes(:translations)
                                            .with_locales(I18n.locale)
                                            .ordered
                                            .distinct

      @army_special_rules = NinthAge::SpecialRule.where(:army_id => @army_list.army_id)
                                        .includes(:translations)
                                        .with_locales(I18n.locale)
                                        .ordered
                                        .distinct

      @magic_items = NinthAge::MagicItem.includes(:translations)
                                        .joins(:army_list_units)
                                        .where(builder_army_list_units: {army_list_id: @army_list.id})
                                        .with_locales(I18n.locale)
                                        .ordered
                                        .distinct

      respond_to do |format|
        format.html { render template: @verbosity.nil? ? 'builder/exports/export' : "builder/exports/export_#{@verbosity}", layout: @verbosity.nil? ? nil : 'pdf.html.erb' }
        format.pdf { render template: "builder/exports/export_#{@verbosity}.html.erb", pdf: "9thbuilder_#{@verbosity}_#{params[:magics]}_#{@army_list.uuid}" }
      end
    end

    # GET /army_lists/1/export_txt
    def export_txt
      @army_list = ArmyList.find_by_uuid!(params[:uuid])
    end

  end
end