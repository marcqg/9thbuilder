class ExportsController < ApplicationController

  # GET /army_lists/1/export
  # GET /army_lists/1/export_:verbosity_:magics.html
  # GET /army_lists/1/export_:verbosity_:magics.pdf
  def export
    @army_list = ArmyList.find_by_uuid!(params[:uuid])
    @verbosity = params[:verbosity]
    @include_magics = params[:magics] == 'nomagics' ? false : true

    respond_to do |format|
      format.html { render template: @verbosity.nil? ? 'exports/export' : "exports/export_#{@verbosity}", layout: @verbosity.nil? ? nil : 'pdf.html.erb' }
      format.pdf { render template: "exports/export_#{@verbosity}.html.erb", pdf: "9thbuilder_#{@verbosity}_#{params[:magics]}_#{@army_list.uuid}" }
    end
  end
end