module Paint
  class PaintListsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_paint_list, only: [:show, :edit, :update, :destroy]
    before_action :load_armies, only: [:new, :edit]

    # GET /paint/paint_lists
    # GET /paint/paint_lists.json
    def index
      @paint_lists = current_user.paint_lists
    end

    # GET /paint/paint_lists/1
    # GET /paint/paint_lists/1.json
    def show
    end

    # GET /paint/paint_lists/new
    def new
      @paint_list = Paint::PaintList.new
      @paint_list.army_id = params[:army_id] || current_user.favorite_army.try(:id)
    end

    # GET /paint/paint_lists/1/edit
    def edit
    end

    # POST /paint/paint_lists
    # POST /paint/paint_lists.json
    def create
      @paint_list = Paint::PaintList.new(paint_list_params)
      @paint_list.user = current_user

      respond_to do |format|
        if @paint_list.save
          format.html { redirect_to @paint_list, notice: 'Paint list was successfully created.' }
          format.json { render :show, status: :created, location: @paint_list }
        else
          format.html { render :new }
          format.json { render json: @paint_list.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /paint/paint_lists/1
    # PATCH/PUT /paint/paint_lists/1.json
    def update
      respond_to do |format|
        if @paint_list.update(paint_list_params)
          format.html { redirect_to @paint_list, notice: 'Paint list was successfully updated.' }
          format.json { render :show, status: :ok, location: @paint_list }
        else
          format.html { render :edit }
          format.json { render json: @paint_list.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /paint/paint_lists/1
    # DELETE /paint/paint_lists/1.json
    def destroy
      @paint_list.destroy
      respond_to do |format|
        format.html { redirect_to builder_army_lists_url, notice: 'Paint list was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def convert
      @paint_list = Paint::PaintList.new
      @paint_list.user = current_user

      @army_list = Builder::ArmyList.find(params[:army_list_id])
      @paint_list.army_id = @army_list.army_id

      @paint_list.save!

      @army_list.army_list_units.each_with_index do |army_list_unit, index|

        paint_list_unit = Paint::PaintListUnit.new
        paint_list_unit.unit_id = army_list_unit.unit_id
        paint_list_unit.size = army_list_unit.size
        paint_list_unit.position = index + 1
        paint_list_unit.paint_list_id = @paint_list.id

        paint_list_unit.save!
      end

      if @paint_list.save
          format.html { redirect_to @paint_list, notice: 'Paint list was successfully created.' }
          format.json { render :show, status: :created, location: @paint_list }
      else
          format.html { redirect_to @army_list }
          format.json { render json: @paint_list.errors, status: :unprocessable_entity }
      end

    end

    private

      def load_armies
        if !current_user.has_role?(:Administrator) or !current_user.has_role?(:Administrator)
          @armies = NinthAge::Army.includes([:translations, :version])
                        .where('ninth_age_versions.public = ?', true)
                        .order(:name)
        else
          @armies = NinthAge::Army.includes([:translations, :version])
                        .order(:name)
        end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_paint_list
        @paint_list = current_user.paint_lists.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def paint_list_params
        params.require(:paint_paint_list).permit(:name, :army_id)
      end
  end
end
