module Paint
  class PaintListUnitsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_paint_list_unit, only: [:update]

    # POST /paint/paint_lists
    # POST /paint/paint_lists.json
    def create
      @paint_list_unit = Paint::PaintListUnit.new(paint_list_unit_params)
      @paint_list_unit.position = Paint::PaintListUnit.where(:paint_list_id => @paint_list_unit.paint_list_id).count + 1

      respond_to do |format|
        if @paint_list_unit.save
          format.html { redirect_to @paint_list_unit, notice: 'Paint list unit was successfully created.' }
          format.json { render :show, status: :created, location: @paint_list_unit }
        else
          format.html { render :new }
          format.json { render json: @paint_list_unit.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /paint/paint_list_units/1
    # PATCH/PUT /paint/paint_list_units/1.json
    def update
      respond_to do |format|
        if @paint_list_unit.update(paint_list_unit_params)
          format.html { redirect_to @paint_list, notice: 'Paint list unit was successfully updated.' }
          format.json { render :show, status: :ok, location: @paint_list }
        else
          format.html { render :edit }
          format.json { render json: @paint_list.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /paint/paint_list_units/1
    # DELETE /paint/paint_list_units/1.json
    def destroy
      @paint_list_unit = current_user.paint_list_units.find(params[:id])

      paint_list_id = @paint_list_unit.paint_list_id

      @paint_list_unit.destroy

      respond_to do |format|
        format.html { redirect_to paint_paint_lists_url(paint_list_id) }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_paint_list_unit
        @paint_list_unit = current_user.paint_list_units.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def paint_list_unit_params
        params.require(:paint_paint_list_unit).permit(:unit_id, :size, :comment, :position, :state, :step, :paint_list_id)
      end
  end
end