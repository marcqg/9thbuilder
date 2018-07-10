module Builder
  class ArmyListUnitsController < ApplicationController
    before_action :authenticate_user!

    # GET /army_list/1/army_list_units/new
    # GET /army_list/1/army_list_units/new.xml
    def new
      @army_list = current_user.army_lists.find_by_uuid!(params[:army_list_uuid])
      @army_list_unit = @army_list.army_list_units.build(unit_id: @army_list.army.units.first.id)

      respond_to do |format|
        format.html # new.html.erb
        format.xml { render xml: @army_list_unit }
      end
    end

    # GET /army_list/1/army_list_units/1/edit
    def edit
      @army_list = current_user.army_lists.find_by_uuid!(params[:army_list_uuid])
      @army_list_unit = @army_list.army_list_units.includes({army_list_unit_troops: [:troop]}).find(params[:id])

      @available_unit_options = @army_list_unit.unit.unit_options.only_parents
      @available_mount_unit_options = @army_list_unit.unit.unit_options.only_mounts
      @available_magic_unit_options = @army_list_unit.unit.unit_options.only_magics
      
      option_magic_items = @army_list_unit.unit.unit_options.only_magic_items
      magic_item = 0
      @magic_items_option = nil
      option_magic_items.each do |option_magic_item|
        if option_magic_item.value_points > magic_item
          if option_magic_item.unit_option_activator_id.nil? or (!option_magic_item.unit_option_activator_id.nil? && option_magic_item.unit_option_activator.in?(@army_list_unit.army_list_unit_unit_options.map(&:unit_option)))
            @magic_items_option = option_magic_item
            magic_item = option_magic_item.value_points
          end
        end
      end 

      @extra_items_option = @army_list_unit.unit.unit_options.only_extra_items.order('value_points DESC').first
      @magic_standards_option = @army_list_unit.unit.unit_options.only_magic_standards.order('value_points DESC').first
    end

    # GET /army_list/1/army_list_units/1/new_from
    def new_from
      @army_list = current_user.army_lists.find_by_uuid!(params[:army_list_uuid])
      @army_list_unit = @army_list.army_list_units.find(params[:id])
    end

    # POST /army_list/1/army_list_units/1/duplicate
    def duplicate
      @base_army_list = current_user.army_lists.find_by_uuid!(params[:army_list_uuid])
      @base_army_list_unit = @base_army_list.army_list_units.find(params[:id])

      @army_list = Builder::ArmyList.find_or_initialize_by(id: params[:builder_army_list_unit][:army_list_id])
      @army_list.army_id = @base_army_list.army_id
      @army_list.user_id = current_user.id
      @army_list.save

      @army_list_unit = @army_list.army_list_units.build(unit_id: @base_army_list_unit.unit_id,
                                                         value_points: @base_army_list_unit.value_points,
                                                         size: @base_army_list_unit.size)
      @army_list_unit.save!

      @army_list_unit.army_list_unit_magic_items << @base_army_list_unit.army_list_unit_magic_items.collect do |alumi|
        army_list_unit_magic_item = alumi.dup
        army_list_unit_magic_item.army_list_unit = @army_list_unit
        army_list_unit_magic_item
      end
      @army_list_unit.unit_options << @base_army_list_unit.unit_options
      @army_list_unit.magic_standards << @base_army_list_unit.magic_standards
      @army_list_unit.extra_items << @base_army_list_unit.extra_items

      respond_to do |format|
        if @army_list_unit.save
          @army_list_unit.reload

          format.html { redirect_to @army_list }
          format.xml { render xml: @army_list_unit, status: :created, location: @army_list_unit }
          format.js { render action: 'create' }
        else
          format.html { render action: 'new_from' }
          format.xml { render xml: @army_list_unit.errors, status: :unprocessable_entity }
        end
      end
    end

    # POST /army_list/1/army_list_units
    # POST /army_list/1/army_list_units.xml
    def create
      @army_list = current_user.army_lists.find_by_uuid!(params[:army_list_uuid])
      @army_list_unit = @army_list.army_list_units.build(army_list_unit_params)

      respond_to do |format|
        if @army_list_unit.save
          @army_list.reload
          @army_list.update_organisations

          format.html { redirect_to @army_list }
          format.xml { render xml: @army_list_unit, status: :created, location: @army_list_unit }
          format.js
        else
          format.html { render action: 'new' }
          format.xml { render xml: @army_list_unit.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /army_list/1/army_list_units/1
    # PUT /army_list/1/army_list_units/1.xml
    def update
      @army_list = current_user.army_lists.find_by_uuid!(params[:army_list_uuid])
      @army_list_unit = @army_list.army_list_units.find(params[:id])

      respond_to do |format|
        if @army_list_unit.update(army_list_unit_params)
          @army_list_unit.save
          @army_list.update_organisations

          format.html { redirect_to @army_list }
          format.xml { head :ok }
        else
          @available_unit_options = @army_list_unit.unit.unit_options.only_parents.exclude_magics_and_extra
          @available_mount_unit_options = @army_list_unit.unit.unit_options.only_mounts
          @available_magic_unit_options = @army_list_unit.unit.unit_options.only_magics

          option_magic_items = @army_list_unit.unit.unit_options.only_magic_items
          magic_item = 0
          @magic_items_option = nil
          option_magic_items.each do |option_magic_item|
            if option_magic_item.value_points > magic_item
              if option_magic_items.unit_option_activator_id.nil? or (!option_magic_items.unit_option_activator_id.nil? && option_magic_items.unit_option_activator.in?(army_list_unit.army_list_unit_unit_options.map(&:unit_option)))
                @magic_items_option = option_magic_items
                magic_item = option_magic_item.value_points
              end
            end
          end          

          @extra_items_option = @army_list_unit.unit.unit_options.only_extra_items.first
          @magic_standards_option = @army_list_unit.unit.unit_options.only_magic_standards.first

          format.html { render action: 'edit' }
          format.xml { render xml: @army_list_unit.errors, status: :unprocessable_entity }
        end
      end
    end

    # GET /army_list/1/army_list_units/1/delete
    def delete
      @army_list = current_user.army_lists.find_by_uuid!(params[:army_list_uuid])
      @army_list_unit = @army_list.army_list_units.find(params[:id])
    end

    # DELETE /army_list/1/army_list_units/1
    # DELETE /army_list/1/army_list_units/1.xml
    def destroy
      @army_list = current_user.army_lists.find_by_uuid!(params[:army_list_uuid])
      @army_list_unit = @army_list.army_list_units.find(params[:id])
      @army_list_unit.destroy

      @army_list.update_organisations

      respond_to do |format|
        format.html { redirect_to @army_list }
        format.xml { head :ok }
      end
    end

    # POST /army_lists/1/army_list_units/sort
    def sort
      army_list = current_user.army_lists.find_by_uuid!(params[:army_list_uuid])
      params[:army_list_units].each_with_index do |id, index|
        Builder::ArmyListUnit.where(army_list_id: army_list.id, id: id).update_all(position: index + 1)
      end
      render nothing: true
    end

    private

    def army_list_unit_params
      params.require(:builder_army_list_unit).permit(:unit_id, :name, :notes, extra_item_ids: [], army_list_unit_troops_attributes: [:id, :army_list_unit_id, :troop_id, :size], army_list_unit_unit_options_attributes: [:id, :army_list_unit_id, :unit_option_id, :quantity, :_destroy], army_list_unit_magic_items_attributes: [:id, :army_list_unit_id, :magic_item_id, :quantity, :_destroy], army_list_unit_magic_standards_attributes: [:id, :army_list_unit_id, :magic_standard_id, :_destroy])
    end
  end
end
